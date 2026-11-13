"""Metric constructions and a common affine projection for lesson 26 figures."""
from pathlib import Path
from math import sqrt,hypot,atan2,cos,sin,pi
from html import escape
import re
import subprocess
import xml.etree.ElementTree as ET
OUT=Path(__file__).parent
RED='#B00012'
CAMERAS={
 'image268':((60,-25,0),(0,25,-25)),
 **{n:((60,-10,0),(0,35,-30)) for n in ('image86','image234','image250','image520')},
 'image109':((50,-28,0),(0,28,-50)),
 'image135':((-35,35,0),(0,-35,-70)),
 'image154':((65,-43,0),(0,32,-125)),
 'image340':((85,28,0),(0,22,-52)),
 'image374':((40,-12,0),(0,17,-24)),
 'image411':((60,0,0),(0,40,-60)),
}

def add(a,b):return tuple(x+y for x,y in zip(a,b))
def sub(a,b):return tuple(x-y for x,y in zip(a,b))
def mul(a,t):return tuple(x*t for x in a)
def dot(a,b):return sum(x*y for x,y in zip(a,b))
def cross(a,b):return(a[1]*b[2]-a[2]*b[1],a[2]*b[0]-a[0]*b[2],a[0]*b[1]-a[1]*b[0])
def mid(a,b):return mul(add(a,b),.5)
def foot(p,a,b):
 v=sub(b,a);return add(a,mul(v,dot(sub(p,a),v)/dot(v,v)))
class Drawing:
 def __init__(self,name,pts,flat=False):
  self.name=name;self.pts=pts.copy();self.flat=flat;self.layers=[];self.lines=[];self.labels=[]
 def xy(self,p):
  p=self.pts[p] if isinstance(p,str) else p
  if self.flat:return (p[0]*40,p[1]*40 if self.name=='image412' else -p[1]*40)
  rows=CAMERAS.get(self.name,((40,-16,0),(0,18,-40)))
  return dot(p,rows[0]),dot(p,rows[1])
 def line(self,a,b,hidden=False,width=.38):
  a,b=self.xy(a),self.xy(b)
  self.lines.append(f'<path d="M{a[0]} {a[1]} L{b[0]} {b[1]}" fill="none" stroke="{RED}" stroke-width="{width}"'+(' stroke-dasharray="1.6 1.1"' if hidden else '')+'/>')
 def face(self,vs,fill):
  self.layers.append('<polygon points="'+' '.join(f'{x},{y}' for x,y in map(self.xy,vs))+f'" fill="{fill}" stroke="none"/>')
 def solid(self,faces):
  names=set(v for face in faces for v in face);center=mul(tuple(sum(self.pts[v][i] for v in names) for i in range(3)),1/len(names));edges={}
  for face in faces:
   a,b,c=[self.pts[v] for v in face[:3]];normal=cross(sub(b,a),sub(c,a));fc=mul(tuple(sum(self.pts[v][i] for v in face) for i in range(3)),1/len(face))
   if dot(normal,sub(fc,center))<0:normal=mul(normal,-1)
   rows=CAMERAS.get(self.name,((40,-16,0),(0,18,-40)));view=cross(*rows)
   visible=dot(normal,view)>1e-8
   if visible:
    shade=dot(normal,(1,-1,2))/sqrt(dot(normal,normal))/sqrt(6)
    self.face(face,'#FFE7EB' if shade>.45 else '#FFC4CF' if shade>-.2 else '#FFADBB')
   for i,a in enumerate(face):
    key=tuple(sorted((a,face[(i+1)%len(face)])));edges[key]=edges.get(key,False) or visible
  for (a,b),visible in edges.items():self.line(a,b,not visible)
 def label(self,name,dx=0,dy=-2.6,text=None):
  if text and '√' in text:
   x,y=self.xy(name);formula={'a√3':'a sqrt(3)','a√2/2':'frac(a sqrt(2),2)','a√6/3':'frac(a sqrt(6),3)'}[text]
   cache=Path('/tmp/b26-math-'+str(sum(map(ord,text))));src=cache.with_suffix('.typ');svg=cache.with_suffix('.svg')
   if not svg.exists():
    src.write_text('#set page(width:auto,height:auto,margin:0pt)\n#set text(size:9pt)\n$ '+formula+' $')
    subprocess.run(['typst','compile',str(src),str(svg)],check=True)
   root=ET.fromstring(svg.read_text());view=list(map(float,root.attrib['viewBox'].split()));w,h=view[2:]
   coords=[self.xy(k) for k in self.pts];scale=(max(a[0] for a in coords)-min(a[0] for a in coords)+18)/62*25.4/72
   content=''.join(ET.tostring(el,encoding='unicode') for el in root);prefix=self.name+str(len(self.labels))
   content=re.sub(r'([#"])([a-z]+[0-9]+)',lambda m:m[1]+prefix+m[2],content)
   self.labels.append(f'<svg x="{x+dx-w*scale/2}" y="{y+dy-h*scale/2}" width="{w*scale}" height="{h*scale}" viewBox="0 0 {w} {h}">{content}</svg>');return
  x,y=self.xy(name);self.labels.append(f'<text x="{x+dx}" y="{y+dy}" text-anchor="middle" font-family="Times New Roman" font-size="4.5" font-style="italic" fill="black">{escape(text or name)}</text>')
 def labels_auto(self):
  xy=[self.xy(k) for k in self.pts];cx=sum(p[0] for p in xy)/len(xy);cy=sum(p[1] for p in xy)/len(xy)
  width=max(p[0] for p in xy)-min(p[0] for p in xy)+18
  target=55 if self.name in ('image86','image234','image250','image520') else 62
  font=3.1*width/target
  overrides={
   'image268':{'A':(2,-5),'B':(-4,6),'C':(3,6),'D':(5,-2),'O':(0,8),'K':(6,3),'S':(0,-4)},
   'image340':{'A':(-5,2),'K':(4,3),'E':(3,-3)},
   'image135':{'I':(5,5),'A':(3,6),'C':(-5,-2)},
   'image374':{'H':(-4,-3),'A':(-3,-4),'K':(5,5),'E':(0,-4)},
   'image411':{'A':(-5,1),'D':(-5,4),'E':(0,7),'K':(-4,-3),'H':(4,-3),'O':(0,-4)},
   'image354':{'A':(0,-4),'K':(-3,4),'E':(4,3)},
  }
  for name in self.pts:
   if name in overrides.get(self.name,{}):
    self.label(name,*overrides[self.name][name]);continue
   x,y=self.xy(name);self.label(name,dx=-max(3,font*.6) if x<cx-5 else max(3,font*.6) if x>cx+5 else 0,dy=max(5,font*1.1) if y>cy+4 else -max(3,font*.65),text=name.replace('′','₁') if self.name=='image556' else None)
 def ticks(self,a,b,count=1):
  p,q=self.xy(a),self.xy(b);dx=q[0]-p[0];dy=q[1]-p[1];length=hypot(dx,dy);ux,uy=dx/length,dy/length
  for i in range(count):
   t=(i-(count-1)/2)*1.4;x=(p[0]+q[0])/2+ux*t;y=(p[1]+q[1])/2+uy*t
   self.lines.append(f'<path d="M{x-uy*1.5} {y+ux*1.5} L{x+uy*1.5} {y-ux*1.5}" stroke="{RED}" stroke-width="0.38"/>')
 def right(self,v,a,b,r=2):
  # Uses orthogonal model vectors, projected with the same map as the edges.
  o=self.pts[v];u=sub(self.pts[a],o);w=sub(self.pts[b],o)
  assert abs(dot(u,w))<1e-6*max(1,sqrt(dot(u,u)*dot(w,w))),(self.name,v,a,b)
  scale=r/40;u=mul(u,scale/sqrt(dot(u,u)));w=mul(w,scale/sqrt(dot(w,w)))
  self.line(add(o,u),add(add(o,u),w),width=.23);self.line(add(add(o,u),w),add(o,w),width=.23)
 def angle(self,v,a,b,r=5):
  o=self.xy(v);a=self.xy(a);b=self.xy(b);t=atan2(a[1]-o[1],a[0]-o[0]);delta=(atan2(b[1]-o[1],b[0]-o[0])-t+pi)%(2*pi)-pi
  arc=[(o[0]+r*cos(t+delta*i/32),o[1]+r*sin(t+delta*i/32)) for i in range(33)]
  self.layers.append('<polygon points="'+f'{o[0]},{o[1]} '+' '.join(f'{x},{y}' for x,y in arc)+'" fill="#D5EAD6"/>')
  self.lines.append('<polyline points="'+' '.join(f'{x},{y}' for x,y in arc)+'" fill="none" stroke="#17623E" stroke-width=".25"/>')
 def save(self):
  xy=[self.xy(k) for k in self.pts];x=min(p[0] for p in xy)-9;y=min(p[1] for p in xy)-9;w=max(p[0] for p in xy)-x+9;h=max(p[1] for p in xy)-y+10
  target=95 if self.name=='image9' else 55 if self.name in ('image86','image234','image250','image520') else 62
  font=3.1*w/target
  right=x+w;bottom=y+h
  for label in self.labels:
   match=re.search(r'x="([^"]+)" y="([^"]+)".*?>(.*?)</text>',label)
   if match:
    lx,ly=float(match[1]),float(match[2]);half=len(match[3])*font*.3
    x=min(x,lx-half-2);right=max(right,lx+half+2);y=min(y,ly-font-2);bottom=max(bottom,ly+font*.3+2)
  for label in self.labels:
   if label.startswith('<svg '):
    attrs=ET.fromstring(label).attrib;lx,ly,lw,lh=[float(attrs[k]) for k in ('x','y','width','height')]
    x=min(x,lx-2);y=min(y,ly-2);right=max(right,lx+lw+2);bottom=max(bottom,ly+lh+2)
  w=right-x;h=bottom-y
  self.labels=[s.replace('font-size="4.5"',f'font-size="{font}"') for s in self.labels]
  self.lines=[s.replace('stroke-width="0.38"',f'stroke-width="{.28*w/target}"').replace('stroke-width=".35"',f'stroke-width="{.28*w/target}"') for s in self.lines]
  (OUT/(self.name+'.svg')).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}mm" height="{h}mm" viewBox="{x} {y} {w} {h}">'+''.join(self.layers+self.lines+self.labels)+'</svg>')
def pyramid(name,base,h,origin=(0,0,0),apex='S'):
 pts=base|{apex:add(origin,(0,0,h))};d=Drawing(name,pts);keys=list(base)
 d.solid([keys]+[[apex,keys[i],keys[(i+1)%len(keys)]] for i in range(len(keys))]);return d
square={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0),'D':(1,0,0)}
tri={'A':(0,0,0),'B':(.5,sqrt(3)/2,0),'C':(1,0,0)}
def prism(name,h=1.5,base=None):
 base=base or tri;p=base|{k+'′':add(v,(0,0,h)) for k,v in base.items()};d=Drawing(name,p);keys=list(base)
 d.solid([keys,[k+'′' for k in keys]]+[[keys[i],keys[(i+1)%len(keys)],keys[(i+1)%len(keys)]+'′',keys[i]+'′'] for i in range(len(keys))]);return d

def finish(d,segments=(),rights=(),angles=()):
 for a,b,*hidden in segments:d.line(a,b,hidden[0] if hidden else True)
 for v,a,b in rights:d.right(v,a,b)
 for v,a,b in angles:d.angle(v,a,b)
 dimensions={
 'image234':[('C′','C','a√3',6,0)],
 'image268':[('S','B','2x',-7,0),('B','C','x',0,7)],
 'image294':[('A','B','a',-5,0),('B','C','a',0,6)],
 'image340':[('S','A','a',-6,0),('A','B','a',-5,0),('B','C','a',0,6)],
 'image354':[('A','K','a√2/2',-7,0),('A','E','a√6/3',9,0)],
 'image374':[('A','E','2a',-12,-6),('E','D','a',0,-5)],
 'image380':[('A','E','2a',0,6),('C','E','2a',-6,0)],
 'image411':[('A','D','a',-5,0),('D','E','a',-5,0)],
 'image487':[('M','A','a',6,0)],
 }
 for a,b,label,dx,dy in dimensions.get(d.name,[]):
  d.label(mid(d.pts[a],d.pts[b]),dx,dy,text=label)
 if d.name in ('image86','image234'):
  for a,b in [('A','E'),('E','B')]:d.ticks(a,b,2)
  for a,b in [('B','K'),('K','C')]:d.ticks(a,b,2)
 if d.name=='image520':
  d.ticks('B','D');d.ticks('D','C')
 d.labels_auto();d.save()
# Worked square pyramid, with E on the extension of AD.
d=pyramid('image36',square,sqrt(3));d.pts.update(E=(2,0,0),O=(.5,.5,0),I=(.5,1,0));d.pts['K']=foot(d.pts['A'],d.pts['D'],d.pts['I'])
finish(d,[('S','E',False),('D','E',False),('C','E',False),('A','C'),('B','D'),('A','K'),('S','K'),('S','O'),('D','I')],[('A','S','D'),('K','A','D')],[('D','S','A'),('O','S','A')])
d=Drawing('image54',square,True);d.pts['I']=mid(square['B'],square['C']);d.pts['K']=foot(square['A'],square['D'],d.pts['I']);d.face(['A','B','C','D'],'#FFE7EB')
finish(d,[(a,b,False) for a,b in [('A','B'),('B','C'),('C','D'),('D','A'),('A','I'),('D','I'),('A','K')]],[('K','A','D')])
for name,h,part in [('image86',1.5,0),('image234',sqrt(3),0),('image250',sqrt(3),1),('image520',1.5,2)]:
 d=prism(name,h);d.pts['K' if part!=2 else 'D']=mid(tri['B'],tri['C']);k='K' if part!=2 else 'D'
 if part==0:
  d.pts['E']=mid(tri['A'],tri['B']);finish(d,[('A',k),('A′',k),('A′','C'),('C','E'),('A′','E')],[(k,'A','B'),('E','C','A')],[(k,'A′','A')])
 elif part==1:
  d.pts.pop('K');d.pts['I']=mid(tri['A'],tri['B']);finish(d,[('I','C'),('A′','I'),('A′','C')],[('I','A','C')])
 else:
  d.pts['M']=(0,0,.75);finish(d,[('A',k),('M',k),('M','B',False),('M','C')],[(k,'A','B')],[(k,'M','A')])
# A,D right trapezoid; projection of M onto SB determines the section.
base={'A':(0,0,0),'B':(2,0,0),'C':(1,1,0),'D':(0,1,0)};d=pyramid('image109',base,sqrt(2));d.pts['M']=(1,0,0);d.pts['K']=foot(d.pts['M'],d.pts['S'],d.pts['B'])
finish(d,[('C','M'),('M','K'),('C','K',False),('S','M')],[('K','M','S'),('M','C','A')],[('K','C','M')])
base={'A':(0,0,0),'B':(2,0,0),'C':(2,1,0),'D':(0,1,0)};d=prism('image135',1,base);d.pts['I']=foot(base['A'],base['B'],base['D'])
finish(d,[('B','D'),('A','I'),('A′','I')],[('I','A','B')],[('I','A','A′')])
d=pyramid('image154',square,146.6/230.4,(.5,.5,0));d.pts['O']=(.5,.5,0);d.pts['M']=foot(d.pts['O'],d.pts['S'],d.pts['A'])
finish(d,[('A','C'),('B','D'),('S','O'),('O','M'),('B','M'),('D','M')],[('M','O','S')],[('M','B','D')])
base={'A':(0,0,0),'B':(0,1,0),'C':(1,0,0)};d=pyramid('image192',base,sqrt(1.5));d.pts['I']=mid(base['B'],base['C'])
finish(d,[('A','I'),('S','I',False)],[('I','A','B'),('A','S','B')],[('I','S','A')])
d=pyramid('image268',square,sqrt(3.5),(.5,.5,0));d.pts.update(O=(.5,.5,0),K=(1,.5,0))
finish(d,[('A','C'),('B','D'),('S','O'),('O','K'),('S','K',False)],[('K','O','C')],[('K','S','O')])
trap={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0),'D':(2,0,0)}
d=pyramid('image294',trap,sqrt(2));d.pts['E']=(1,0,0);d.pts['K']=foot(trap['A'],trap['B'],trap['D'])
finish(d,[('A','C'),('C','E'),('B','D'),('A','K'),('S','K')],[('C','A','D'),('K','A','B')],[('C','S','A'),('S','D','C')])
base={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0)};d=pyramid('image340',base,1);d.pts['K']=foot(base['A'],d.pts['S'],base['B']);d.pts['E']=foot(base['A'],d.pts['S'],base['C'])
finish(d,[('A','K',False),('A','E',False),('K','E',False)],[('K','A','S'),('E','A','S'),('B','A','C')],[('E','A','K')])
d=Drawing('image354',{'A':(0,sqrt(.5),0),'K':(0,0,0),'E':(sqrt(1/6),0,0)},True);d.face(['A','K','E'],'#FFE7EB');finish(d,[('A','K',False),('K','E',False),('A','E',False)],[('K','A','E')],[('E','A','K')])
base={'A':(0,0,0),'B':(0,2,0),'C':(2,2,0),'D':(3,0,0)};H=(0,2/3,0)
for name,flat in [('image374',False),('image380',True)]:
 d=Drawing(name,base,True) if flat else pyramid(name,base,16*sqrt(15)/15,H)
 d.pts.update(H=H,E=(2,0,0));d.pts['K']=foot(H,base['C'],base['D'])
 if flat:
  d.face(['A','B','C','D'],'#FFE7EB');segs=[('A','B',False),('B','C',False),('C','D',False),('D','A',False),('H','C',False),('H','D',False)]
 else:segs=[('S','H'),('S','K',False)]
 finish(d,segs+[('H','K'),('C','E')],[('K','H','C')],[] if flat else [('K','S','H')])
base={'A':(0,0,0),'B':(2,0,0),'C':(1.5,sqrt(3)/2,0),'D':(.5,sqrt(3)/2,0)};d=pyramid('image411',base,sqrt(3));d.pts.update(E=(1,sqrt(3),0),O=(1,0,0));d.pts['H']=foot(base['A'],d.pts['S'],base['C']);d.pts['K']=foot(base['A'],d.pts['S'],d.pts['E'])
finish(d,[('D','E',False),('C','E',False),('S','E',False),('A','C'),('A','H'),('A','K'),('H','K')],[('H','A','S'),('K','A','S')],[('K','A','H')])
d=Drawing('image412',base|{'O':(1,0,0)},True);d.layers.append('<circle cx="40" cy="0" r="40" fill="none" stroke="black" stroke-width=".35"/>');d.pts['_top']=(1,1,0);d.pts['_bottom']=(1,-1,0)
for a,b in [('A','B'),('B','C'),('C','D'),('D','A'),('A','C')]:d.line(a,b,False)
for k in base|{'O':(1,0,0)}:d.label(k,dx=-4 if k=='A' else 4 if k=='B' else 0,dy=6 if k in ('C','D') else -3)
d.right('C','A','B');d.save()
base={'S':(0,0,0),'B':(0,1,0),'C':(1,0,0)};d=pyramid('image435',base,1,apex='A');d.pts['D']=mid(base['B'],base['C']);finish(d,[('A','D',False),('S','D')],[('D','S','B')],[('D','S','A')])
d=pyramid('image461',trap,sqrt(6)/2);d.pts.update(E=(1,0,0),I=(.5,.5,0));finish(d,[('B','E'),('A','C'),('S','I')],[('I','A','B')],[('I','S','A')])
base={'A':(0,0,0),'B':(-sqrt(2),1,0),'C':(sqrt(2),1,0)};d=pyramid('image487',base,1,apex='M');d.pts['I']=(0,1,0);finish(d,[('A','I'),('M','I',False)],[('I','A','B'),('M','B','C')],[('I','M','A')])
base={'A':(0,0,0),'B':(1.25,sqrt(7)/4,0),'C':(.5,0,0)};d=pyramid('image538',base,sqrt(3)/2);finish(d,[],[('A','S','C')],[('A','B','C')])
d=prism('image556',1,square);d.pts['O']=(.5,.5,0);finish(d,[('A','C'),('B','D'),('O','C′')],[],[('O','A','C′')])
# The theory diagram uses two half-planes, with plane labels tucked into corner arcs.
d=Drawing('image9',{'P':(0,0,0),'U':(1,1,0),'V':(1.65,.35,0),'W':(.65,-.65,0),'Q':(2.9,-.65,0),'T':(3.9,.35,0),'O':(1.15,-.15,0),'x':(.65,.35,0),'y':(2.5,-.15,0)},True)
d.face(['P','U','V','W'],'#FFE7EB');d.face(['W','V','T','Q'],'#FFC4CF')
for a,b in [('P','U'),('U','V'),('V','T'),('T','Q'),('Q','W'),('W','P'),('W','V'),('O','x'),('O','y')]:d.line(a,b,False)
d.label('O',dx=3,dy=7);d.label('x',dy=-2);d.label('y',dy=-2);d.label('P',dx=9,dy=0,text='(P)');d.label('Q',dx=-3.1,dy=-5.2,text='(Q)');d.label('W',dx=4,dy=-8,text='a');d.angle('P','U','W',r=14);d.angle('Q','W','T',r=12);d.save()
