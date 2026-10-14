#!/usr/bin/env python3
from pathlib import Path
import json
import re
import struct
from collections import Counter

class MTEF:
    def __init__(self,data):
        self.data=data;self.pos=0;self.counts=Counter();self.templates=Counter();self.chars=Counter()
    def byte(self):
        v=self.data[self.pos];self.pos+=1;return v
    def u16(self):
        v=struct.unpack_from('<H',self.data,self.pos)[0];self.pos+=2;return v
    def integer(self,signed=False):
        v=self.byte()
        return (self.u16()-(32768 if signed else 0)) if v==255 else v-(128 if signed else 0)
    def string(self):
        end=self.data.index(0,self.pos);s=self.data[self.pos:end];self.pos=end+1;return s.decode('latin1')
    def nudge(self,options):
        if options&8:
            x,y=self.byte(),self.byte()
            if x==128 and y==128:self.pos+=4
    def dimensions(self):
        count=self.byte();found=0
        while found<count:
            n=self.byte();found+=(n>>4==15)+(n&15==15)
        assert found==count
    def objects(self):
        out=[]
        while True:
            tag=self.byte()
            if tag==0: return out
            n=self.record(tag)
            if n is not None:out.append(n)
    def record(self,tag):
        self.counts[tag]+=1
        if tag in (1,2,3,4,5,6):
            opt=self.byte();self.nudge(opt)
        if tag==1:
            if opt&4:self.pos+=2
            if opt&2:assert self.byte()==7;self.record(7)
            return {'type':'line','children':[] if opt&1 else self.objects()}
        if tag==2:
            face=self.integer(True);code=None if opt&32 else self.u16()
            if opt&4:encoded=self.byte()
            elif opt&16:encoded=self.u16()
            else:encoded=None
            if code is None:code=encoded
            assert code is not None
            self.chars[code]+=1
            return {'type':'char','code':code,'face':face,'embell':self.objects() if opt&1 else []}
        if tag==3:
            selector=self.byte();v=self.byte();variation=(v&127)|(self.byte()<<8) if v&128 else v
            specific=self.byte();self.templates[(selector,variation)]+=1
            return {'type':'template','selector':selector,'variation':variation,'children':self.objects()}
        if tag==4:
            h,v=self.byte(),self.byte()
            if opt&2:assert self.byte()==7;self.record(7)
            return {'type':'pile','halign':h,'valign':v,'children':self.objects()}
        if tag==5:
            align=[self.byte() for _ in range(3)];rows,cols=self.byte(),self.byte()
            self.pos+=(rows+4)//4+(cols+4)//4
            children=self.objects();assert len(children)==rows*cols
            return {'type':'matrix','rows':rows,'cols':cols,'children':children}
        if tag==6:return {'type':'embell','kind':self.byte()}
        if tag==7:
            count=self.byte();self.pos+=count*3;return
        if tag==8:self.integer();self.byte();return
        if tag==9:
            size=self.byte();self.pos+=2 if size==101 else 3 if size==100 else 1;return
        if 10<=tag<=14:return
        if tag==15:self.integer();return
        if tag==16:
            opt=self.byte();self.pos+=8 if opt&1 else 6
            if opt&4:self.string()
            return
        if tag==17:self.integer();self.string();return
        if tag==18:
            self.byte();self.dimensions();self.dimensions()
            for _ in range(self.byte()):
                if self.integer():self.byte()
            return
        if tag==19:self.string();return
        if tag>=100:
            length=self.integer();self.pos+=length;return
        raise ValueError(('record',tag,self.pos))
    def parse(self):
        assert self.byte()==5
        self.pos+=4;self.string();self.byte()
        return self.objects()


def render(n):
    if isinstance(n,list):return line(n)
    kind=n['type'];c=n.get('children',[])
    if kind=='char':
        code=n['code'];s={0x2212:'-',0x20d7:'',0xEF00:'',0xEF01:'',0xEF02:'',0xEC07:'|',0xEC08:'|',0x2026:'dots.h',0xA0:'',44:'","'}.get(code,chr(code))
        if s in ('#','$','_','^','\\','{','}'):s='\\'+s
        for e in n['embell']:
            k=e['kind']
            if k==5:s+="'"
            elif k==11:s=f'arrow({s})'
            else:raise ValueError(('embell',k))
        return s
    if kind=='line':return line(c)
    if kind=='pile':return 'vec('+', '.join(render(x) for x in c)+', delim: #none)'
    if kind=='matrix':
        rows=[' , '.join(render(x) for x in c[i*n['cols']:(i+1)*n['cols']]) for i in range(n['rows'])]
        return 'mat('+ '; '.join(rows)+', delim: #none)'
    if kind=='template':
        s=n['selector'];v=n['variation'];cs=[render(x) for x in c]
        if 0<=s<=9:
            if s==4:return 'abs('+cs[0]+')'
            if s==2 and v==1:
                inn=c[0]
                rows=inn['children'] if inn['type'] in ('pile','matrix') else [inn]
                return 'cases('+', '.join('display('+render(x)+')' for x in rows)+')'
            if s==3 and v==1:return 'lr(bracket.l '+cs[0]+' )'
            assert v==3,(s,v)
            left,right={0:('angle.l','angle.r'),1:('(',')'),2:('\\{','\\}'),3:('[',']'),5:('||','||'),6:('floor.l','floor.r'),7:('ceil.l','ceil.r')}[s]
            return f'lr({left} {cs[0]} {right})'
        if s==13:return 'overline('+cs[0]+')'
        if s==10:return 'sqrt('+cs[0]+')' if v==0 or not cs[1] else 'root('+cs[1]+', '+cs[0]+')'
        if s==11:return 'frac('+cs[0]+', '+cs[1]+')'
        if s in (27,28,29):
            assert not(v&1)
            return ('_('+cs[0]+')' if cs[0] else '')+('^('+cs[1]+')' if cs[1] else '')
        if s==31:assert v==2;return 'arrow('+cs[0]+')'
        if s==33:return 'hat('+cs[0]+')'
        if s==24:return 'underbrace('+cs[0]+', '+cs[1]+')'
        raise ValueError(('template',s,v))
    raise ValueError(kind)

def line(children):
    out=[];i=0
    while i<len(children):
        n=children[i]
        if n['type']=='char' and chr(n['code']).isdigit():
            digits=chr(n['code']);i+=1
            while i<len(children) and children[i]['type']=='char' and chr(children[i]['code']).isdigit():
                digits+=chr(children[i]['code']);i+=1
            out.append(digits);continue
        if n['type']=='char' and n['face']==1 and chr(n['code']).isalpha():
            text=chr(n['code']);i+=1
            while i<len(children) and children[i]['type']=='char' and children[i]['face']==1:
                text+=chr(children[i]['code']);i+=1
            out.append(json.dumps(text,ensure_ascii=False));continue
        value=render(n)
        if value:out.append(value)
        i+=1
    return ' '.join(out)


def normalize(v):
    formulas={"value":v};k="value"
    formulas[k]=re.sub(r'(?<![a-z])m i n(?![a-z])','min',v)
    formulas[k]=re.sub(r'(?<![a-z])m a x(?![a-z])','max',formulas[k])
    formulas[k]=formulas[k].replace('c o n s t', '"const"').replace('C o s', 'cos')
    for fn in ['cos','sin','tan','min','max']:
        formulas[k]=formulas[k].replace(' '.join(fn),fn)
        formulas[k]=re.sub(r'"'+fn+r'(\d+)"',fn+r' \1',formulas[k])
    formulas[k]=re.sub(r'(\d+)\s+","\s+(\d+)',r'"\1,\2"',formulas[k])
    formulas[k]=formulas[k].replace('= >','⇒').replace('k m / h','"km/h"').replace('k m','"km"')
    formulas[k]=formulas[k].replace('^(′)',"'")
    return formulas[k]


def extract(source):
    from zipfile import ZipFile
    import xml.etree.ElementTree as ET
    import olefile
    namespaces = {
        "w": "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
        "o": "urn:schemas-microsoft-com:office:office",
        "v": "urn:schemas-microsoft-com:vml",
        "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
    }
    equations = {}
    with ZipFile(source) as archive:
        for name in archive.namelist():
            if not name.startswith("word/embeddings/"):
                continue
            with olefile.OleFileIO(archive.read(name)) as compound:
                if not compound.exists("Equation Native"):
                    continue
                native = compound.openstream("Equation Native").read()
            header_size = struct.unpack_from("<H", native)[0]
            data = native[header_size:]
            decoder = MTEF(data)
            nodes = decoder.parse()
            if decoder.pos != len(data):
                raise ValueError(f"Unconsumed equation bytes in {name}: {len(data)-decoder.pos}")
            equations[name] = {"typst": normalize(render(nodes)), "empty": not render(nodes).strip()}
        relationships = {n.attrib["Id"]: "word/" + n.attrib["Target"]
            for n in ET.fromstring(archive.read("word/_rels/document.xml.rels"))}
        root = ET.fromstring(archive.read("word/document.xml"))
        compared = 0
        for obj in root.findall(".//w:object", namespaces):
            ole = obj.find(".//o:OLEObject", namespaces)
            preview = obj.find(".//v:imagedata", namespaces)
            if ole is None or preview is None:
                continue
            key = "{" + namespaces["r"] + "}id"
            original = relationships[ole.attrib[key]]
            image = relationships[preview.attrib[key]]
            raw = archive.read(image)
            marker = raw.find(b"DSMT")
            if marker < 5:
                continue
            decoder = MTEF(raw[marker-5:])
            value = normalize(render(decoder.parse()))
            if value != equations[original]["typst"]:
                raise ValueError(f"Equation/preview mismatch: {original}, {image}")
            compared += 1
    return {"equations": equations, "preview_pairs_checked": compared}


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Decode MathType 5 OLE equations to native Typst math and verify WMF previews.")
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()
    result = extract(args.source)
    args.output.write_text(json.dumps(result, ensure_ascii=False, indent=2) + "\n")
    print(f"Decoded {len(result['equations'])} equations; checked {result['preview_pairs_checked']} preview pairs.")


if __name__ == "__main__":
    main()
