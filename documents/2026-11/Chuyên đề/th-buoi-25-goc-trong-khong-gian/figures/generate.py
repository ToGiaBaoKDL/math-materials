"""Source-matched affine projections for lesson 25; red shaded faces and editable SVGs.

Midpoints and section points are derived from vertices, not placed independently.
The projections are schematic: metric relations used in proofs remain in the text.
"""
from pathlib import Path
from math import hypot,atan2,cos,sin,pi
from html import escape
OUT=Path(__file__).parent
INK='#000000'

def mix(a,b,t=.5):return (a[0]+t*(b[0]-a[0]),a[1]+t*(b[1]-a[1]))
def add(a,b,c):return(a[0]+b[0]-c[0],a[1]+b[1]-c[1])
class Drawing:
 def __init__(self,name,pts):
  self.name=name;self.pts=dict(pts);self.parts=[];self.labels=[];self.faces=[];self.ink=INK if name in ("dich-duong-song-song","hinh-chieu-duong-thang") else "#B00012"
 def line(self,a,b,hidden=False,width=.6):
  a=self.pts[a] if isinstance(a,str) else a;b=self.pts[b] if isinstance(b,str) else b
  self.parts.append(f'<path d="M{a[0]} {a[1]} L{b[0]} {b[1]}" fill="none" stroke="{self.ink}" stroke-width="{width}" stroke-linecap="round"'+(' stroke-dasharray="1.6 1.1"' if hidden else '')+'/>')
 def edges(self,edges,hidden=False):
  for a,b in edges:self.line(a,b,hidden)
 def midpoint(self,name,a,b,t=.5):self.pts[name]=mix(self.pts[a],self.pts[b],t)
 def label(self,p,dx=0,dy=-3,name=None):
  x,y=self.pts[p];text=name or ("(P)" if p=="P" and self.name=="hinh-chieu-duong-thang" else p)
  self.labels.append(f'<text x="{x+dx}" y="{y+dy}" font-family="Times New Roman" font-style="italic" font-size="4.8" text-anchor="middle" fill="{INK}">{escape(text)}</text>')
 def labels_at(self,offsets):
  for p,offset in offsets.items():self.label(p,*offset)
 def dot(self,p):
  x,y=self.pts[p];self.parts.append(f'<circle cx="{x}" cy="{y}" r=".48" fill="{INK}"/>')
 def right(self,v,a,b,r=2.4):
  o=self.pts[v];a=self.pts[a];b=self.pts[b]
  u=((a[0]-o[0])/hypot(a[0]-o[0],a[1]-o[1])*r,(a[1]-o[1])/hypot(a[0]-o[0],a[1]-o[1])*r)
  w=((b[0]-o[0])/hypot(b[0]-o[0],b[1]-o[1])*r,(b[1]-o[1])/hypot(b[0]-o[0],b[1]-o[1])*r)
  p=(o[0]+u[0],o[1]+u[1]);q=(p[0]+w[0],p[1]+w[1]);z=(o[0]+w[0],o[1]+w[1]);self.line(p,q,width=.23);self.line(q,z,width=.23)
 def angle(self,v,a,b,r=7):
  o=self.pts[v];a=self.pts[a];b=self.pts[b];t=atan2(a[1]-o[1],a[0]-o[0]);u=atan2(b[1]-o[1],b[0]-o[0]);delta=(u-t+pi)%(2*pi)-pi
  pts=[(o[0]+r*cos(t+delta*i/40),o[1]+r*sin(t+delta*i/40)) for i in range(41)]
  d='M'+str(o[0])+' '+str(o[1])+' '+' '.join('L'+str(x)+' '+str(y) for x,y in pts)+' Z'
  self.parts.insert(0,f'<path d="{d}" fill="#C8EFE6" stroke="none"/>')
  for p,q in zip(pts,pts[1:]):self.line(p,q,width=.22)
 def face(self,vertices,tone):
  # Three opaque red tints, already mixed once with 25% white.
  colors={'top':'#FFE7EB','light':'#FFC4CF','shade':'#FFADBB'}
  coords=' '.join(f'{self.pts[v][0]},{self.pts[v][1]}' for v in vertices)
  self.faces.append(f'<polygon points="{coords}" fill="{colors[tone]}" stroke="none"/>')
 def save(self):
  # Tight bounds from vertices plus the explicit label margin, keeping a uniform scale.
  xs=[p[0] for p in self.pts.values()];ys=[p[1] for p in self.pts.values()]
  x=min(xs)-9;y=min(ys)-9;w=max(xs)-x+9;h=max(ys)-y+10
  (OUT/(self.name+'.svg')).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}mm" height="{h}mm" viewBox="{x} {y} {w} {h}">'+''.join(self.faces+self.parts+self.labels)+'</svg>')

def cube(name,labels=None):
 p={'A':(32,58),'B':(10,78),'C':(76,78),'D':(98,58),'A′':(32,10),'B′':(10,30),'C′':(76,30),'D′':(98,10)}
 if labels:p={labels.get(k,k):v for k,v in p.items()}
 d=Drawing(name,p)
 rename=lambda k:labels.get(k,k) if labels else k
 for a,b in [('A','B'),('A','D'),('A','A′')]:d.line(rename(a),rename(b),True)
 for a,b in [('B','C'),('C','D'),('B','B′'),('C','C′'),('D','D′'),('A′','B′'),('B′','C′'),('C′','D′'),('D′','A′')]:d.line(rename(a),rename(b))
 offsets={'A':(1,-3),'B':(-3,5),'C':(2,5),'D':(4,1),'A′':(-2,-3),'B′':(-4,-1),'C′':(1,-3),'D′':(3,-3)}
 d.face([rename(k) for k in ['A′','B′','C′','D′']],'top');d.face([rename(k) for k in ['B','C','C′','B′']],'light');d.face([rename(k) for k in ['C','D','D′','C′']],'shade');d.labels_at({rename(k):v for k,v in offsets.items()});return d

def square_pyramid(name,apex=(36,8),base=None):
 base=base or {'A':(34,57),'B':(10,84),'C':(76,84),'D':(100,57)}
 d=Drawing(name,dict(base,S=apex))
 d.edges([('A','B'),('A','D'),('S','A')],True)
 d.edges([('B','C'),('C','D'),('S','B'),('S','C'),('S','D')])
 near,far=('D','B') if base['B'][0]>base['D'][0] else ('B','D')
 d.face(['S',near,'C'],'light');d.face(['S','C',far],'shade')
 d.labels_at({'A':(-4,-2),'B':(-4,4),'C':(2,5),'D':(5,1),'S':(0,-4)})
 return d

def tri_pyramid(name,pts=None):
 d=Drawing(name,pts or {'S':(43,8),'A':(14,58),'B':(99,58),'C':(40,91)})
 front='B' if name in ('chop-tam-giac-hinh-chu-nhat','chop-tam-giac-mnq') else 'C'
 others=[k for k in ('A','B','C') if k!=front];others.sort(key=lambda k:d.pts[k][0])
 d.face(['S',others[0],front],'light');d.face(['S',front,others[1]],'shade')
 d.line('A','B',True);d.edges([('S','A'),('S','B'),('S','C'),('A','C'),('B','C')]);d.labels_at({'S':(0,-4),'A':(-4,1),'B':(4,1),'C':(0,5)});return d

def prism(name,pts=None):
 p=pts or {'A':(42,86),'B':(20,57),'C':(99,57),'A′':(42,36),'B′':(20,7),'C′':(99,7)}
 d=Drawing(name,p)
 top,bottom=(('A','B','C'),('A′','B′','C′')) if sum(p[k][1] for k in ('A','B','C'))<sum(p[k][1] for k in ('A′','B′','C′')) else (('A′','B′','C′'),('A','B','C'))
 near=max(range(3),key=lambda i:p[top[i]][1]);sides=sorted([i for i in range(3) if i!=near],key=lambda i:p[top[i]][0])
 d.face(top,'top')
 for i,tone in zip(sides,('light','shade')):d.face([top[i],top[near],bottom[near],bottom[i]],tone)
 d.line('B','C',True)
 d.edges([('A','B'),('A','C'),('A','A′'),('B','B′'),('C','C′'),('A′','B′'),('B′','C′'),('A′','C′')])
 d.labels_at({'A':(0,5),'B':(-4,1),'C':(4,1),'A′':(5,1),'B′':(-3,-3),'C′':(3,-3)})
 return d

# Two theory diagrams.
d=Drawing('dich-duong-song-song',{'a0':(8,30),'a1':(51,30-43*20/46),'b0':(65,27),'b1':(110,27),'p0':(13,66),'p1':(59,46),'q0':(8,59),'q1':(64,59),'O':(29.1,59),'a':(33,19),'b':(88,24),'a′':(49,48),'b′':(61,69)})
d.edges([('a0','a1'),('b0','b1'),('p0','p1'),('q0','q1')]);d.dot('O');d.label('O',0,6)
for p in ['a','b','a′','b′']:d.label(p)
d.save()
d=Drawing('hinh-chieu-duong-thang',{'P0':(8,67),'P1':(82,67),'P2':(110,38),'P3':(36,38),'I':(36,51),'A′':(69,51),'A':(69,39),'d0':(27,57),'d1':(90,51-54*12/33),'d′0':(24,51),'d′1':(98,51),'P':(18,64),'d':(90,31),'d′':(91,49)})
d.edges([('P0','P1'),('P1','P2'),('P0','P3'),('d′0','d′1'),('I','d1'),('A','A′')]);d.right('A′','A','I');d.angle('I','A','A′',9)
for p in ['I','A','A′']:d.dot(p)
d.parts.append('<path d="M 24 67 Q 24 60 19 55.6" fill="none" stroke="#000000" stroke-width=".5"/>');d.labels_at({'I':(-2,-4),'A':(0,-4),'A′':(0,6),'P':(0,0),'d':(1,-3),'d′':(0,-3)});d.save()

# Worked examples: preserve source point order and viewing direction.
d=prism('lang-tru-deu-goc-canh-ben',{'A':(18,10),'B':(58,30),'C':(98,10),'A′':(20,71),'B′':(60,91),'C′':(100,71)})
# The source hidden base is A′C′; ABC is on top.
d.parts=[];d.edges([('A','B'),('B','C'),('C','A'),('A','A′'),('B','B′'),('C','C′'),('A′','B′'),('B′','C′'),('A','B′')]);d.line('A′','C′',True);d.labels=[];d.labels_at({'A':(-3,-3),'B':(1,-4),'C':(4,-3),'A′':(-5,1),'B′':(1,6),'C′':(5,1)});d.angle('A','A′','B′',10);d.right('A′','A','B′');d.save()
d=cube('lap-phuong-duong-cheo-mat',{'B':'D','D':'B','B′':'D′','D′':'B′'});d.line('B','A′',True);d.angle('B','A','A′',7);d.save()
d=tri_pyramid('chop-tam-giac-trung-diem');
for p,a,b in [('M','S','A'),('N','S','B'),('P','A','C')]:d.midpoint(p,a,b)
d.edges([('M','N'),('N','P')],True);d.line('M','P');d.line('S','P');d.labels_at({'M':(-5,0),'N':(4,0),'P':(-4,3)});d.save()
d=tri_pyramid('chop-tam-giac-hinh-chu-nhat',{'S':(20,7),'A':(20,58),'B':(66,85),'C':(96,58)})
d.parts=[];d.edges([('S','A'),('S','B'),('S','C'),('A','B'),('B','C')]);d.midpoint('M','A','B');d.midpoint('N','S','C');d.pts['E']=add(d.pts['A'],d.pts['C'],d.pts['M'])
d.edges([('A','C'),('A','N'),('M','C'),('A','E'),('E','C'),('E','N')],True);d.labels_at({'M':(-4,4),'N':(3,-3),'E':(1,6)});d.save()
d=square_pyramid('chop-vuong-trung-diem-sb',base={'A':(34,51),'B':(100,51),'C':(76,83),'D':(10,83)})
d.parts=[];d.edges([('S','D'),('S','B'),('S','C'),('D','C'),('C','B')]);d.edges([('A','B'),('A','D'),('S','A')],True)
d.midpoint('M','S','B');d.midpoint('O','A','C');d.midpoint('E','M','C');d.edges([('A','C'),('B','D'),('A','M'),('M','C'),('O','E'),('B','E')],True);d.labels=[];d.labels_at({'S':(0,-4),'A':(-4,-2),'B':(5,1),'C':(2,5),'D':(-4,4)});d.right('A','S','B');d.labels_at({'M':(3,-3),'O':(-2,5),'E':(4,-2)});d.save()
d=tri_pyramid('chop-mat-ben-vuong-goc-day',{'S':(38,8),'A':(25,61),'B':(102,61),'C':(55,90)})
d.midpoint('H','A','C');d.line('S','H');d.line('H','B',True);d.angle('B','S','H',11);d.labels_at({'H':(-5,1)});d.save()
d=prism('lang-tru-goc-voi-day',{'A':(20,65),'B':(45,91),'C':(98,65),'A′':(20,10),'B′':(45,36),'C′':(98,10)})
d.labels=[];d.labels_at({'A':(-4,1),'B':(1,6),'C':(5,1),'A′':(-3,-3),'B′':(4,1),'C′':(4,-3)});d.parts=[];d.edges([('A','B'),('B','C'),('A','A′'),('B','B′'),('C','C′'),('A′','B′'),('B′','C′'),('C′','A′')]);d.edges([('A','C'),('A','C′')],True);d.save()
d=square_pyramid('chop-duong-cheo-mat-phang');d.midpoint('O','A','C');d.edges([('A','C'),('B','D'),('S','O')],True);d.angle('S','D','O',11);d.labels_at({'O':(1,5)});d.save()
d=square_pyramid('chop-hinh-chieu-sn',apex=(22,7));d.midpoint('M','A','B')
# This source labels D at the near-left vertex, B at the far-right vertex.
d=Drawing('chop-hinh-chieu-sn',{'A':(34,51),'B':(104,51),'C':(80,83),'D':(10,83)})
d.midpoint('M','A','D');d.midpoint('N','B','C');d.pts['S']=(22,7);d.face(['S','D','C'],'light');d.face(['S','C','B'],'shade');d.pts['P']=mix(d.pts['M'],d.pts['B'],.8)
d.edges([('S','D'),('S','C'),('S','B'),('D','C'),('B','C'),('S','N'),('S','P')]);d.edges([('A','B'),('A','D'),('S','A'),('S','M'),('M','B'),('M','N'),('N','P')],True);d.right('P','M','N');d.labels_at({'A':(2,5),'B':(5,0),'C':(0,5),'D':(-4,4),'S':(-2,-4),'M':(-5,1),'N':(5,2),'P':(4,-3)});d.save()

# Practice figures.
d=square_pyramid('chop-deu-duong-trung-binh',apex=(42,8));d.midpoint('I','S','C');d.midpoint('J','B','C');d.line('I','J');d.labels_at({'I':(5,-1),'J':(0,6)});d.save()
d=cube('lap-phuong-goc-ab',{'A':'C′','B':'B′','C':'A′','D':'D′','A′':'C','B′':'B','C′':'A','D′':'D'});d.line('A′','B');d.save()
d=cube('lap-phuong-duong-cheo-ac',{'A′':'A₁','B′':'B₁','C′':'C₁','D′':'D₁'});d.edges([('A','C'),('A₁','D')],True);d.edges([('A₁','C₁'),('D','C₁')]);d.save()
d=cube('lap-phuong-hai-duong-cheo');d.edges([('A′','B'),('B','D'),('A′','D')],True);d.edges([('B′','C')]);d.save()
d=cube('lap-phuong-doi-duong-song-song');d.edges([('A','C'),('A′','D')],True);d.edges([('A′','C′'),('D','C′')]);d.save()
d=square_pyramid('chop-deu-tam-giac-ioj',apex=(43,7));d.midpoint('I','S','C');d.midpoint('J','B','C');d.midpoint('O','A','C');d.line('I','J');d.edges([('A','C'),('B','D'),('S','O'),('I','O'),('O','J')],True);d.labels_at({'I':(5,-1),'J':(0,6),'O':(-2,6)});d.save()
d=tri_pyramid('chop-tam-giac-mnq',{'S':(67,7),'A':(12,71),'B':(67,87),'C':(103,71)})
d.labels=[];d.labels_at({'S':(0,-4),'A':(-4,1),'B':(0,7),'C':(5,2)})
d.parts=[];d.edges([('S','A'),('S','B'),('S','C'),('A','B'),('B','C')]);d.line('A','C',True)
for p,a,b in [('M','S','A'),('N','S','B'),('Q','A','C')]:d.midpoint(p,a,b)
d.edges([('M','N'),('A','N'),('N','C')]);d.edges([('M','Q'),('N','Q')],True);d.labels_at({'M':(-5,-1),'N':(4,-2),'Q':(-3,6)})
d.labels.append('<text x="91" y="91" font-family="Times New Roman" font-style="italic" font-size="4.8" text-anchor="middle">a√<tspan text-decoration="overline">2</tspan></text>');d.save()
d=square_pyramid('chop-mat-ben-vuong',apex=(25,8));d.midpoint('M','A','B');d.midpoint('H','A','M');d.midpoint('K','A','D');d.edges([('S','M'),('S','H'),('S','K'),('B','D'),('M','K'),('H','K')],True);d.labels_at({'M':(-5,1),'H':(4,1),'K':(1,-4)});d.save()
d=square_pyramid('chop-hai-trung-diem',apex=(35,7));
for p,a,b in [('F','A','B'),('I','A','D'),('G','S','F'),('H','S','I')]:d.midpoint(p,a,b)
d.edges([('S','F'),('S','I'),('F','I'),('B','D'),('C','F'),('C','I'),('C','G'),('C','H'),('G','H')],True);d.labels_at({'F':(-4,-1),'I':(2,-4),'G':(-5,-1),'H':(4,-1)});d.save()
for name,solution in [('lang-tru-vuong-am',False),('lang-tru-vuong-mn',True)]:
 d=prism(name);d.midpoint('M','B','C');d.edges([('B′','C'),('A','M')],True)
 if solution:
  d.midpoint('N','B','B′');d.line('A','N');d.line('N','M',True);d.labels_at({'N':(-4,-1)})
 d.labels_at({'M':(0,-4)});d.save()
d=prism('lang-tru-goc-mat-tren',{'A':(98,10),'B':(17,10),'C':(42,30),'A′':(98,74),'B′':(17,74),'C′':(42,94)})
d.parts=[];d.edges([('A','B'),('B','C'),('C','A'),('A','A′'),('B','B′'),('C','C′'),('B′','C′'),('C′','A′'),('B','C′')]);d.line('B′','A′',True);d.labels=[];d.labels_at({'A':(3,-3),'B':(-3,-3),'C':(3,-2),'A′':(5,1),'B′':(-5,1),'C′':(1,6)});d.save()
d=square_pyramid('chop-chu-nhat',apex=(34,8));d.save()
d=cube('lap-phuong-diem-di-dong');d.midpoint('M','A','B',1/3);d.midpoint('N','A′','D′',2**.5/3);d.midpoint('H','A','D',2**.5/3);d.edges([('A′','D'),('M','N'),('N','H'),('M','H')],True);d.labels_at({'M':(-5,-1),'N':(0,-4),'H':(0,5)});d.save()
d=square_pyramid('chop-deu-chia-ba',apex=(49,8));d.midpoint('O','A','C');d.midpoint('M','S','D',2/3);d.midpoint('K','O','D',2/3);d.edges([('A','C'),('B','D'),('S','O'),('B','M'),('M','K')],True);d.labels_at({'M':(4,-2),'K':(0,6),'O':(0,6)});d.save()
d=cube('lap-phuong-hinh-chieu-mn',{'A':'D′','B':'A′','C':'B′','D':'C′','A′':'D','B′':'A','C′':'B','D′':'C'})
d.midpoint('M','A','C');d.midpoint('N','B′','C′');d.midpoint('O','A′','C′');d.line('A','C');d.edges([('A′','C′'),('B′','D′'),('M','O'),('M','N'),('O','N')],True);d.labels_at({'M':(1,-4),'N':(4,1),'O':(0,6)});d.save()
d=square_pyramid('chop-deu-goc-mat-cheo',apex=(49,8));d.midpoint('O','A','C');d.edges([('A','C'),('B','D'),('S','O')],True);d.angle('A','S','O',8);d.angle('S','C','O',12);d.labels_at({'O':(-2,6)});d.save()
for name,solution in [('chop-hinh-thang',False),('chop-hinh-thang-hinh-chieu',True)]:
 d=square_pyramid(name,apex=(32,8),base={'A':(32,51),'B':(10,82),'C':(47,82),'D':(106,51)})
 if solution:
  d.midpoint('H','A','D');d.edges([('C','H'),('S','H')],True);d.labels_at({'H':(1,-4)})
 d.save()
print('Generated',len(list(OUT.glob('*.svg'))),'vector diagrams')
