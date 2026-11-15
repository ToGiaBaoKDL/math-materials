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
 def clear_labels(self,font):
  # Place labels in a nearby empty region, without masking the drawing.
  segments=[]
  for line in self.lines:
   m=re.search(r'd="M([\d.eE+-]+) ([\d.eE+-]+) L([\d.eE+-]+) ([\d.eE+-]+)"',line)
   if m:segments.append(tuple(map(float,m.groups())))
  def intersects(seg,box):
   x,y,u,v=seg;lo=0;hi=1
   for origin,delta,left,right in [(x,u-x,box[0],box[2]),(y,v-y,box[1],box[3])]:
    if abs(delta)<1e-9:
     if not left<=origin<=right:return False
    else:
     a,b=sorted(((left-origin)/delta,(right-origin)/delta));lo=max(lo,a);hi=min(hi,b)
     if lo>hi:return False
   return True
  occupied=[];labels=[]
  for label in self.labels:
   m=re.search(r'x="([^"]+)" y="([^"]+)".*?>(.*?)</text>',label);lx,ly=float(m[1]),float(m[2]);text=m[3]
   key={'a′':'a1','α':'U'}.get(text,text)
   if key not in self.pts or text=='α':labels.append(label);continue
   px,py=self.xy(key);half=font*.32*len(text);pad=font*.12
   def rect(x,y):return(x-half-pad,y-font*.83-pad,x+half+pad,y+font*.12+pad)
   def score(x,y):
    box=rect(x,y);crossings=sum(intersects(seg,box) for seg in segments)
    overlaps=sum(not(box[2]<b[0] or box[0]>b[2] or box[3]<b[1] or box[1]>b[3]) for b in occupied)
    return crossings*1000+overlaps*1000+hypot(x-lx,y-ly)/font
   candidates=[(lx,ly)]
   if score(lx,ly)>=1000:
    for radius in (1.1,1.5,1.9,2.3):
     for i in range(16):
      t=i*pi/8;candidates.append((px+radius*font*cos(t),py+radius*font*sin(t)+font*.35))
   nx,ny=min(candidates,key=lambda p:score(*p));occupied.append(rect(nx,ny))
   label=re.sub(r'x="[^"]+" y="[^"]+"',f'x="{nx}" y="{ny}"',label,count=1);labels.append(label)
  self.labels=labels
 def save(self):
  DRAWINGS[self.name]=self
  xy=[self.xy(k) for k in self.pts];x=min(p[0] for p in xy)-9;y=min(p[1] for p in xy)-9;w=max(p[0] for p in xy)-x+9;h=max(p[1] for p in xy)-y+10
  target=58
  font=3.1*w/target
  self.clear_labels(font)
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
  named={re.search(r'>(.*?)</text>',label)[1] for label in self.labels}
  dots=[]
  for name in self.pts:
   if name in named and name[0].isupper():
    px,py=self.xy(name);dots.append(f'<circle cx="{px}" cy="{py}" r="{.33*w/target}" fill="#222222"/>')
  (OUT/(self.name+'.svg')).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}mm" height="{h}mm" viewBox="{x} {y} {w} {h}">'+''.join(self.layers+self.lines+dots+self.labels)+'</svg>')
def pyramid(name,base,h,origin=(0,0,0),apex='S'):
 pts=base|{apex:add(origin,(0,0,h))};d=Drawing(name,pts);keys=sorted(base)
 d.solid([keys]+[[apex,keys[i],keys[(i+1)%len(keys)]] for i in range(len(keys))]);return d

def prism(name,h,base):
 p=base|{k+'′':add(v,(0,0,h)) for k,v in base.items()};d=Drawing(name,p);keys=sorted(base)
 d.solid([keys,[k+'′' for k in keys]]+[[keys[i],keys[(i+1)%len(keys)],keys[(i+1)%len(keys)]+'′',keys[i]+'′'] for i in range(len(keys))]);return d

# Source-specific views; feet and intersections are calculated in metric 3D.
def finish(d,segments=(),rights=(),ticks=(),offsets=None):
 for a,b,*hidden in segments:d.line(a,b,hidden[0] if hidden else True)
 for v,a,b in rights:d.right(v,a,b,r=4.5 if d.name=='image220' and v=='H' else 3.5)
 for a,b in ticks:d.ticks(a,b,2)
 d.labels_auto()
 xs=[d.xy(k)[0] for k in d.pts];label_scale=(max(xs)-min(xs)+18)/110
 shift={'A':(-6,-1),'H':(-6,4),'I':(6,-3),'K':(5,6),'O':(-5,6),'M':(6,2)}
 shift.update(offsets or {})
 for n,(dx,dy) in shift.items():
  if n in d.pts:
   d.labels=[l for l in d.labels if not l.endswith('>'+n+'</text>')];d.label(n,dx*label_scale,dy*label_scale)
 d.save()
square={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0),'D':(1,0,0)}
# Worked 1: rectangle and two separate target-plane feet.
base={'A':(0,0,0),'B':(0,1,0),'C':(2,1,0),'D':(2,0,0)}
CAMERAS['image25']=((80,30,0),(0,55,-85))
d=pyramid('image25',base,1);d.pts.update(O=mid(base['A'],base['C']),K=foot(base['A'],base['B'],base['D']),H=foot(base['A'],d.pts['S'],base['D']))
d.pts['I']=foot(base['A'],d.pts['S'],d.pts['K'])
finish(d,[('A','C'),('B','D'),('A','K'),('S','K'),('A','I'),('A','H')],[('A','S','B'),('H','A','S'),('I','A','S'),('K','A','D')],offsets={'I':(7,-2),'H':(5,-5),'K':(4,8),'O':(-5,8)})
# Worked 2.
CAMERAS['image51']=((75,-30,0),(0,35,-55))
d=pyramid('image51',square,sqrt(2));d.pts.update(M=mid(d.pts['S'],d.pts['C']),O=mid(d.pts['A'],d.pts['C']))
finish(d,[('A','C'),('B','D')],[('A','S','B')],[('S','M'),('M','C')],{'M':(7,-2)})
# Regular square pyramids: worked 3 and practice 1.
for name,h in [('image70',sqrt(3)/2),('image192',sqrt(2))]:
 CAMERAS[name]=((75,-32,0),(0,35,-78/h))
 d=pyramid(name,square,h,origin=(.5,.5,0));d.pts.update(O=(.5,.5,0),K=mid(d.pts['C'],d.pts['D']));d.pts['H']=foot(d.pts['O'],d.pts['S'],d.pts['K'])
 finish(d,[('A','C'),('B','D'),('S','O'),('O','K'),('O','H'),('S','K',False)],[('O','S','B'),('H','O','S'),('K','O','C')],[('C','K'),('K','D')],{'H':(7,-3),'O':(-5,7),'K':(6,6)})
# Rhombi: worked 4 and practice 2.
for name,angle,h in [('image88',60,1),('image220',120,sqrt(3))]:
 base={'A':(0,0,0),'B':(0,1,0),'D':(sqrt(3)/2,.5 if angle==60 else -.5,0)};base['C']=add(base['B'],base['D'])
 CAMERAS[name]=((90,-30,0),(-38*(.5 if angle==60 else -.5)/(sqrt(3)/2),38,-78/h))
 if name=='image220':CAMERAS[name]=((90,-30,0),(0,34,-95/h))
 d=pyramid(name,base,h);d.pts['K']=foot(base['A'],base['C'],base['D']);d.pts['H']=foot(base['A'],d.pts['S'],d.pts['K'])
 seg=[('A','C'),('A','K'),('S','K',False),('A','H')];ticks=[]
 if angle==60:
  d.pts['E']=mid(base['C'],base['D']);seg += [('D','K',False),('B','E')];ticks=[('D','E'),('E','C')]
 else:
  ticks=[('C','K'),('K','D')];d.angle('B','A','C',7)
  d.label('B',15,-3,'60°')
  d.label(mid(base['A'],base['B']),-5,-2,'a')
  d.label(mid(base['B'],base['C']),0,7,'a')
  d.label(mid(base['A'],base['C']),2,-5,'a')
 finish(d,seg,[('A','S','B'),('H','A','S'),('K','A','D')],ticks,{'H':(5,-5),'K':(6,-1),'E':(8,4)})
 if angle==60:
  f=Drawing('image88-base',{k:(v[1]*sqrt(3)/2+v[0]/2,-v[1]/2+v[0]*sqrt(3)/2,0) for k,v in d.pts.items() if k not in ('S','H')},True);f.face(['A','B','C','D'],'#FFE7EB')
  finish(f,[(a,b,False) for a,b in [('A','B'),('B','C'),('C','D'),('D','A'),('D','K'),('A','K'),('A','C'),('B','D'),('B','E')]],[('K','A','D'),('E','B','C')],ticks,{'K':(0,6),'E':(5,-2)})
# Side SAB perpendicular to base: worked 5, 6 and practice 7.
for name,side,h,target in [('image112',sqrt(2),sqrt(2)/2,'CD'),('image126',1,sqrt(3)/2,'BD'),('image363',1,sqrt(3)/2,'BD')]:
 base={k:mul(v,side) for k,v in square.items()};H=mid(base['A'],base['B']);CAMERAS[name]=((90,-42,0),(0,45,-90/h))
 d=pyramid(name,base,h,H);d.pts['H']=H;d.pts['K']=foot(H,base[target[0]],base[target[1]]);d.pts['I']=foot(H,d.pts['S'],d.pts['K'])
 seg=[('S','H'),('H','K'),('S','K',target!='CD'),('H','I')]
 ticks=[('A','H'),('H','B')]
 if target=='BD':d.pts['O']=mid(base['A'],base['C']);seg += [('A','C'),('B','D')];ticks += [('B','K'),('K','O')]
 else:ticks += [('C','K'),('K','D')]
 finish(d,seg,[('H','S','B'),('K','H',target[0]),('I','H','S')],ticks,{'H':(-8,6),'I':(7,7) if target=='CD' else (8,-1),'K':(3,9),'O':(6,-4)})
# Right regular triangular prisms: worked 7 and practice 8.
for name,h in [('image145',2),('image385',1)]:
 base={'A':(0,0,0),'B':(.5,sqrt(3)/2,0),'C':(1,0,0)};CAMERAS[name]=((100,0,0),(0,45,-90/h))
 d=prism(name,h,base);d.pts.update(M=mid(d.pts['C'],d.pts['C′']),K=mid(base['B'],base['C']))
 d.pts['I']=mul(d.pts['M'],2/3);d.pts['H']=foot(base['A'],d.pts['A′'],d.pts['K'])
 finish(d,[('A′','C'),('A','M'),('A','K'),('A′','K'),('A','H')],[('H','A','A′'),('K','A','B')],[('C','M'),('M','C′'),('B','K'),('K','C')],{'H':(-7,-6),'I':(7,-4),'K':(3,9),'M':(7,1)})
# Worked 8: extended trapezoid, E=AB∩CD.
base={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0),'D':(2,0,0)};CAMERAS['image167']=((70,-32,0),(0,42,-85))
d=pyramid('image167',base,1);d.pts.update(H=foot(base['A'],d.pts['S'],base['B']),K=foot(base['A'],d.pts['S'],base['C']),E=(0,2,0),F=(1,0,0))
finish(d,[('A','H'),('A','C'),('A','K'),('B','E',False),('C','E',False),('S','E',False),('C','F')],[('H','A','S'),('K','A','S'),('C','A','D')],offsets={'H':(-7,-1),'K':(7,-2),'F':(0,-5)})
# Practice 3: right triangle base with an equilateral perpendicular face SBC.
base={'A':(0,0,0),'B':(1,0,0),'C':(0,sqrt(3),0)};H=mid(base['B'],base['C']);CAMERAS['image240']=((-60,55,0),(-36,-21,-65))
d=pyramid('image240',base,sqrt(3),H);d.pts.update(H=H,K=foot(H,base['A'],base['C']));d.pts['I']=foot(H,d.pts['S'],d.pts['K'])
finish(d,[('S','H'),('H','K'),('S','K',False),('H','I')],[('A','B','C'),('H','S','B'),('K','H','C'),('I','H','S')],[('B','H'),('H','C'),('A','K'),('K','C')],{'A':(0,10),'H':(6,-5),'I':(7,-3),'K':(5,7)})
# Practice 4 and 5: 60-degree rhombus, apex over midpoint AB.
base={'A':(0,0,0),'B':(0,2,0),'D':(sqrt(3),1,0),'C':(sqrt(3),3,0)};H=mid(base['A'],base['B'])
for name,target in [('image271','AC'),('image301','CD')]:
 CAMERAS[name]=((65,-32,0),(-30/sqrt(3),30,-52))
 if name in ('image271','image301'):CAMERAS[name]=((100,-25,0),(-30/sqrt(3),30,-60))
 d=pyramid(name,base,sqrt(3),H);d.pts['H']=H
 if target=='AC':
  d.pts.update(O=mid(base['A'],base['C']),K=foot(H,base['A'],base['C']));d.pts['I']=foot(H,d.pts['S'],d.pts['K'])
  seg=[('S','H'),('A','C'),('B','D'),('H','K'),('S','K',target!='CD'),('H','I')];rights=[('K','H','A'),('I','H','S')]
 else:
  d.pts['K']=foot(H,d.pts['S'],base['D']);seg=[('S','H'),('H','D'),('H','K')];rights=[('D','H','C'),('K','H','S')]
 finish(d,seg,rights,[('A','H'),('H','B')],{'H':(-7,3),'K':(6,5),'I':(7,-2),'A':(-6,-4),'O':(7,3)})
# Practice 6: perpendicular right-isosceles SAB over equilateral base.
base={'A':(0,0,0),'B':(sqrt(2),0,0),'C':(sqrt(2)/2,sqrt(6)/2,0)};H=mid(base['A'],base['B']);CAMERAS['image334']=((85,0,0),(0,40,-115))
d=pyramid('image334',base,sqrt(2)/2,H);d.pts.update(H=H,I=mid(base['A'],base['C']),K=foot(H,base['A'],base['C']));d.pts['E']=foot(H,d.pts['S'],d.pts['K'])
finish(d,[('S','H'),('B','I'),('H','K'),('S','K',False),('H','E')],[('S','A','B'),('H','S','B'),('I','B','C'),('K','H','A'),('E','H','S')],[('S','A'),('S','B'),('A','H'),('H','B')],{'A':(-6,0),'H':(2,9),'E':(-7,-2),'I':(-6,6),'K':(-7,2)})
# Practice 9: apex above midpoint AD; HI perpendicular to CD.
base={'A':(0,0,0),'B':(0,1,0),'C':(1,1,0),'D':(2,0,0)};H=mid(base['A'],base['D']);CAMERAS['image413']=((65,-28,0),(15,45,-40))
d=pyramid('image413',base,sqrt(6)/2,H);d.pts.update(H=H,I=foot(H,base['C'],base['D']));d.pts['K']=foot(H,d.pts['S'],d.pts['I'])
finish(d,[('S','H'),('B','H'),('A','C'),('H','I'),('S','I',False),('H','K')],[('H','S','D'),('I','H','D'),('K','H','I'),('C','A','D')],[('A','H'),('H','D')],{'H':(-6,-4),'K':(7,-4),'I':(5,7)})
# Theory diagrams: label the plane in its corner; perpendicular drops share a direction.
for name,crossing in [('image10',False),('image14',True)]:
 pts={'U':(-.5,-.7,0),'V':(3,-.7,0),'W':(3.7,.6,0),'X':(.2,.6,0)}
 if crossing:pts.update(M=(.5,0,0),K=(1.7,0,0),H=(2.3,0,0),B=(1.7,1.2,0),A=(2.3,1.8,0))
 else:pts.update(H=(.8,0,0),K=(2.2,0,0),A=(.8,1.6,0),B=(2.2,1.6,0))
 d=Drawing(name,pts,True);d.face(['U','V','W','X'],'#FFE7EB')
 for a,b in [('U','V'),('V','W'),('W','X'),('X','U')]:d.line(a,b)
 if crossing:
  for a,b in [('M','A'),('M','H'),('A','H'),('B','K')]:d.line(a,b)
  d.right('H','A','M',4);d.right('K','B','M',4)
 else:
  for a,b in [('A','H'),('B','K')]:d.line(a,b)
  d.line((.25,1.6,0),(3,1.6,0));d.line((.25,0,0),(3,0,0));d.right('H','A','K',4);d.right('K','B','H',4)
  d.pts.update(a=(2.9,1.6,0),a1=(2.9,0,0));d.label('a',0,-3);d.label('a1',0,6,'a′')
 for n in ('A','B'):d.label(n,0,-4)
 for n in ('H','K'):d.label(n,3,10)
 if crossing:d.label('M',-4,4)
 d.angle('U','V','X',19);d.label('U',11,-4.5,'α')
 d.save()
