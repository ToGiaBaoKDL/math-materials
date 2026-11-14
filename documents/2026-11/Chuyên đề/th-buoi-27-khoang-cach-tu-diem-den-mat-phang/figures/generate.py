"""Metric constructions and source-specific affine views for lesson 27."""
from pathlib import Path
from math import sqrt,hypot,atan2,cos,sin,pi
from html import escape
import re
OUT=Path(__file__).parent
RED='#B00012'
CAMERAS={}
DRAWINGS={}
DEFAULT=((60,-25,0),(0,25,-35))


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
  if self.flat:return (p[0]*40,-p[1]*40)
  rows=CAMERAS.get(self.name,DEFAULT)
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
   rows=CAMERAS.get(self.name,DEFAULT);view=cross(*rows)
   visible=dot(normal,view)>1e-8
   if visible:
    shade=dot(normal,(1,-1,2))/sqrt(dot(normal,normal))/sqrt(6)
    self.face(face,'#FFE7EB' if shade>.45 else '#FFC4CF' if shade>-.2 else '#FFADBB')
   for i,a in enumerate(face):
    key=tuple(sorted((a,face[(i+1)%len(face)])));edges[key]=edges.get(key,False) or visible
  for (a,b),visible in edges.items():self.line(a,b,not visible)
 def label(self,name,dx=0,dy=-2.6,text=None):
  x,y=self.xy(name);self.labels.append(f'<text x="{x+dx}" y="{y+dy}" text-anchor="middle" font-family="Times New Roman" font-size="4.5" font-style="italic" fill="black">{escape(text or name)}</text>')
 def labels_auto(self):
  xy=[self.xy(k) for k in self.pts];cx=sum(p[0] for p in xy)/len(xy);cy=sum(p[1] for p in xy)/len(xy)
  width=max(p[0] for p in xy)-min(p[0] for p in xy)+18
  target=58
  font=3.1*width/target
  for name in self.pts:
   x,y=self.xy(name);self.label(name,dx=-max(3,font*.6) if x<cx-5 else max(3,font*.6) if x>cx+5 else 0,dy=max(5,font*1.1) if y>cy+4 else -max(3,font*.65),text=None)
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
  DRAWINGS[self.name]=self
  xy=[self.xy(k) for k in self.pts];x=min(p[0] for p in xy)-9;y=min(p[1] for p in xy)-9;w=max(p[0] for p in xy)-x+9;h=max(p[1] for p in xy)-y+10
  target=58
  font=3.1*w/target
  right=x+w;bottom=y+h
  for label in self.labels:
   match=re.search(r'x="([^"]+)" y="([^"]+)".*?>(.*?)</text>',label)
   if match:
    lx,ly=float(match[1]),float(match[2]);half=len(match[3])*font*.3
    x=min(x,lx-half-2);right=max(right,lx+half+2);y=min(y,ly-font-2);bottom=max(bottom,ly+font*.3+2)
  w=right-x;h=bottom-y
  self.labels=[s.replace('font-size="4.5"',f'font-size="{font}"') for s in self.labels]
  self.lines=[s.replace('stroke-width="0.38"',f'stroke-width="{.28*w/target}"').replace('stroke-width=".35"',f'stroke-width="{.28*w/target}"') for s in self.lines]
  self.lines=[v.replace('stroke-dasharray="1.6 1.1"',f'stroke-dasharray="{1.2*w/target} {.7*w/target}"').replace('stroke-width="0.23"',f'stroke-width="{.2*w/target}"') for v in self.lines]
  (OUT/(self.name+'.svg')).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}mm" height="{h}mm" viewBox="{x} {y} {w} {h}">'+''.join(self.layers+self.lines+self.labels)+'</svg>')
def pyramid(name,base,h,origin=(0,0,0),apex='S'):
 pts=base|{apex:add(origin,(0,0,h))};d=Drawing(name,pts);keys=list(base)
 d.solid([keys]+[[apex,keys[i],keys[(i+1)%len(keys)]] for i in range(len(keys))]);return d

def prism(name,h,base):
 p=base|{k+'′':add(v,(0,0,h)) for k,v in base.items()};d=Drawing(name,p);keys=list(base)
 d.solid([keys,[k+'′' for k in keys]]+[[keys[i],keys[(i+1)%len(keys)],keys[(i+1)%len(keys)]+'′',keys[i]+'′'] for i in range(len(keys))]);return d

# a=1 unless absolute lengths are specified. Geometry remains metric;
# affine camera scaling is only for legible illustrations.
def finish(d,segments=(),rights=(),ticks=()):
 for a,b,*hidden in segments:d.line(a,b,hidden[0] if hidden else True)
 for v,a,b in rights:d.right(v,a,b,r=4.5 if d.name=='image236' else 4 if d.name=='image371' and v=='H' else 3)
 for a,b in ticks:d.ticks(a,b,2)
 d.labels_auto()
 # Move interior feet off construction lines rather than masking geometry.
 offsets={'A':(-5,-2),'H':(5,-3),'I':(-5,-3),'K':(5,5),'O':(-4,5)}
 if d.name=='image289':offsets.update(H=(-7,-3))
 if d.name=='image236':offsets.update(H=(-8,-3),A=(0,12))
 if d.name=='image155':offsets.update(E=(9,-8))
 if d.name=='image371':offsets.update(H=(7,-4),K=(6,7))
 if d.name=='image317':offsets.update(A=(-13,2),H=(5,-4),K=(7,15))
 if d.name=='image54':offsets.update(I=(6,-1),K=(4,6),A=(-6,0))
 if d.name=='image101':offsets.update(K=(5,-2),H=(4,-4))
 if d.name=='image392':offsets.update(H=(7,-5),I=(3,9),K=(7,2),A=(-7,1))
 for n in offsets:
  if n in d.pts:
   d.labels=[l for l in d.labels if not l.endswith('>'+n+'</text>')]
   d.label(n,*offsets[n])
 d.save()

def tri_distance(name,base,height,apex='S',direct=False):
 extent=max(sqrt(dot(sub(v,base['A']),sub(v,base['A']))) for v in base.values())
 CAMERAS[name]=((60,25,0),(0,28,-42*extent/height))
 if name in ('image40','practice1'):CAMERAS[name]=((50,35,0),(-33,50,-75/height))
 if name=='image317':CAMERAS[name]=((60,25,0),(0,28,-60))
 if name=='image371':CAMERAS[name]=((65,12,0),(0,35,-30))
 d=pyramid(name,base,height,apex=apex)
 k='B' if direct else 'K'
 if not direct:d.pts[k]=foot(base['A'],base['B'],base['C'])
 d.pts['H']=foot(base['A'],d.pts[apex],d.pts[k])
 segments=[('A','H')]
 if not direct:segments += [('A',k),(apex,k,False)]
 rights=[('A',apex,'B'),('H','A',apex),(k,'A','C')]
 finish(d,segments,rights,[('B',k),(k,'C')] if not direct and abs(dot(sub(base['A'],base['B']),sub(base['A'],base['B']))-dot(sub(base['A'],base['C']),sub(base['A'],base['C'])))<1e-6 else [])
 return d
rightB={'A':(0,0,0),'B':(0,1,0),'C':(1.5,1,0)}
rightA={'A':(0,0,0),'B':(0,1,0),'C':(1.4,0,0)}
tri={'A':(0,0,0),'B':(.5,sqrt(3)/2,0),'C':(1,0,0)}
tri_distance('image5',{'A':(0,0,0),'B':(.3,.8,0),'C':(1.4,0,0)},1)
tri_distance('image27',rightA,1)
tri_distance('theory-perpendicular',rightA,1)
tri_distance('image40',rightB,2,direct=True)
tri_distance('practice1',rightB,1,direct=True)
tri_distance('image191',{'A':(0,0,0),'B':(0,1,0),'C':(sqrt(3),0,0)},2)
tri_distance('image209',tri,1)
tri_distance('image317',{'A':(0,0,0),'B':(0,3,0),'C':(4,0,0)},4,apex='D')
# ABC: AB=1 and angle ABC=60 degrees; BC=1.5 is illustrative.
base={'A':(0,0,0),'B':(0,1,0),'C':(1.5*sqrt(3)/2,.25,0)}
tri_distance('image371',base,3)

rect={'A':(0,0,0),'B':(0,1,0),'C':(2,1,0),'D':(2,0,0)}
CAMERAS['image54']=((90,-25,0),(0,45,-90))
d=pyramid('image54',rect,1);d.pts['K']=foot(rect['A'],rect['B'],rect['D']);d.pts['H']=foot(rect['A'],d.pts['S'],rect['D']);d.pts['I']=foot(rect['A'],d.pts['S'],d.pts['K'])
finish(d,[('B','D'),('A','H'),('A','K'),('S','K'),('A','I')],[('H','A','S'),('K','A','D'),('I','A','S')])
# Rhombi: AD is horizontal; angle BAD is 120 or 60 degrees.
for name,angle,side in [('image75',120,2),('image101',60,1)]:
 B=(side*cos(angle*pi/180),side*sin(angle*pi/180),0);D=(side,0,0);base={'A':(0,0,0),'B':B,'C':add(B,D),'D':D}
 CAMERAS[name]=((50,10,0),(0,23,-85)) if angle==120 else ((60,-64,0),(0,29,-65))
 d=pyramid(name,base,1);d.pts['K']=foot(base['A'],base['C'],base['D']);d.pts['H']=foot(base['A'],d.pts['S'],d.pts['K'])
 seg=[('A','K'),('S','K',False),('A','H'),('A','C')];ticks=[]
 if angle==60:
  d.pts['E']=mid(base['C'],base['D']);seg += [('D','K',False),('B','D'),('B','E')];ticks=[('D','E'),('E','C')]
 else:ticks=[('C','K'),('K','D')]
 finish(d,seg,[('K','A','D'),('H','A','S')],ticks)
 if angle==60:
  f=Drawing(name+'-base',{k:v for k,v in d.pts.items() if k not in ('S','H')},True)
  f.face(['A','B','C','D'],'#FFE7EB');finish(f,[(a,b,False) for a,b in [('A','B'),('B','C'),('C','D'),('D','A'),('A','C'),('B','D'),('A','K'),('D','K'),('B','E')]],[('K','A','D')],ticks)

square={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0),'D':(1,0,0)}
for name,h in [('image113',sqrt(.5)),('image273',sqrt(2))]:
 CAMERAS[name]=((60,-25,0),(0,25,-60/h))
 d=pyramid(name,square,h,(.5,.5,0));d.pts.update(O=(.5,.5,0),K=(1,.5,0));d.pts['H']=foot(d.pts['O'],d.pts['S'],d.pts['K'])
 finish(d,[('A','C'),('B','D'),('S','O'),('O','K'),('S','K',False),('O','H')],[('K','O','C'),('H','O','S')],[('C','K'),('K','D')])
for name,h in [('image124',sqrt(3)),('image289',1)]:
 CAMERAS[name]=((65,0,0),(0,30,-43/h))
 d=prism(name,h,tri);d.pts['K']=mid(tri['B'],tri['C']);d.pts['H']=foot(tri['A'],d.pts['A′'],d.pts['K'])
 finish(d,[('A','K'),('A′','K'),('A','H')],[('K','A','C'),('H','A','A′')],[('B','K'),('K','C')])
for name,ab in [('image143',1),('image155',2)]:
 base={'A':(0,0,0),'B':(0,ab,0),'C':(1,ab,0),'D':(2,0,0)}
 CAMERAS[name]=((50,-20,0),(0,20,-75))
 d=pyramid(name,base,1);d.pts['E']=(1,0,0)
 k='C' if ab==1 else 'K'
 if ab!=1:d.pts[k]=foot(base['A'],base['C'],base['D'])
 d.pts['H']=foot(base['A'],d.pts['S'],d.pts[k])
 seg=[('A',k),('A','H'),('S',k,False),('C','E')]
 finish(d,seg,[(k,'A','D'),('H','A','S')],[('A','E'),('E','D')])
 if ab==2:
  f=Drawing(name+'-base',{k:v for k,v in d.pts.items() if k not in ('S','H')},True);f.face(['A','B','C','D'],'#FFE7EB');finish(f,[(a,b,False) for a,b in [('A','B'),('B','C'),('C','D'),('D','A'),('A','C'),('A','K'),('C','E')]],[('K','A','D'),('E','C','A')],[('A','E'),('E','D')])
for name,side,h,bd in [('image236',sqrt(3),1,False),('image253',1,2,True)]:
 base={k:mul(v,side) for k,v in square.items()};CAMERAS[name]=((55,-23,0),(0,24,-45/h))
 if name=='image236':CAMERAS[name]=((55,-45,0),(0,30,-60))
 d=pyramid(name,base,h);k='B';segs=[]
 if bd:d.pts['O']=mid(base['A'],base['C']);k='O';segs=[('A','C'),('B','D'),('S','O')]
 d.pts['H']=foot(base['A'],d.pts['S'],d.pts[k]);finish(d,segs+[('A','H')],[('H','A','S')])
# Extended plane: source has AC=2, AA′=2, angle BAC=120 degrees.
base={'A':(0,0,0),'B':(-.5,sqrt(3)/2,0),'C':(2,0,0)};CAMERAS['image392']=((48,85,0),(0,72,-48))
d=prism('image392',2,base);d.pts.update(K=(2,0,1),E=(4,0,0));d.pts['I']=foot(base['A'],base['B'],d.pts['E']);d.pts['H']=foot(base['A'],d.pts['A′'],d.pts['I'])
finish(d,[('A′','E'),('B','E',False),('C','E'),('A','I'),('A′','I'),('A','H'),('B','K')],[('I','A','E'),('H','A','A′')],[('C','K'),('K','C′'),('A','C'),('C','E')])
