"""Rebuild lesson-local SVG models; functions match printed data, schematic curves are explicitly illustrative."""
from pathlib import Path
from math import sin,cos,pi,sqrt
from html import escape
import subprocess
import tempfile
import xml.etree.ElementTree as ET
from functools import lru_cache

@lru_cache(None)
def math_asset(expr, size):
 with tempfile.TemporaryDirectory(prefix="b24-math-") as folder:
  source=Path(folder)/"label.typ";out=Path(folder)/"label.svg"
  source.write_text(f'#set page(width:auto,height:auto,margin:0pt)\n#set text(size:{size*72/25.4}pt)\n$ {expr} $')
  subprocess.run(["typst","compile","--format","svg",str(source),str(out)],check=True)
  return out.read_text()

def radical_label(value,x,y,size,anchor):
 expressions={'√(9−x²)':'sqrt(9-x^2)','√(2+x²/4)':'sqrt(2+frac(x^2,4))','y=√x':'y=sqrt(x)','y=√(R²−x²)':'y=sqrt(R^2-x^2)'}
 root=ET.fromstring(math_asset(expressions[value],size))
 w=float(root.attrib['width'].removesuffix('pt'))*25.4/72
 h=float(root.attrib['height'].removesuffix('pt'))*25.4/72
 root.set('x',str(x-(w/2 if anchor=='middle' else w if anchor=='end' else 0)))
 root.set('y',str(y-h));root.set('width',str(w));root.set('height',str(h))
 return ET.tostring(root,encoding='unicode')

OUT=Path(__file__).parent
INK="#000000"  # Lesson-specific request: all edges and curves use black.
FILLS=["#FFADBB","#C8EFE6","#FFDE6C"]
class Plot:
 def __init__(self,name,xlim,ylim,w=110,h=67):
  self.name=name;self.xlim=xlim;self.ylim=ylim;self.w=w;self.h=h
  self.p=[];self.top=[];self.crop_y=(3,h-3)
 def xy(self,x,y):
  a,b=self.xlim;c,d=self.ylim
  return (12+(x-a)/(b-a)*(self.w-20),self.h-10-(y-c)/(d-c)*(self.h-18))
 def path(self,pts,stroke="#000000",sw=.3,fill="none",dash=False):
  d=" ".join(("M" if i==0 else "L")+f"{x:.3f},{y:.3f}" for i,(x,y) in enumerate(pts))
  return f'<path d="{d}" fill="{fill}" stroke="{stroke}" stroke-width="{sw}" stroke-linejoin="round" stroke-linecap="round"'+(' stroke-dasharray="1.2 1"' if dash else '')+'/>'
 def line(self,a,b,c="#000000",dash=False):
  self.p.append(self.path([self.xy(*a),self.xy(*b)],stroke=c,dash=dash))
 def point(self,x,y):
  X,Y=self.xy(x,y)
  self.p.append(f'<circle cx="{X:.3f}" cy="{Y:.3f}" r="0.85" fill="#000000"/>')
 def label(self,x,y,s,dx=0,dy=0,size=3.8,anchor="middle"):
  X,Y=self.xy(x,y)
  size *= getattr(self,"label_scale",1)
  if "√" in s:
   self.top.append(radical_label(s,X+dx,Y+dy,size,anchor));return
  self.top.append(f'<text x="{X+dx:.3f}" y="{Y+dy:.3f}" text-anchor="{anchor}" font-family="Times New Roman" font-size="{size}" fill="#111">{escape(s)}</text>')
 def guide(self,x,y):
  self.line((x,0),(x,y),dash=True);self.line((0,y),(x,y),dash=True)
 def curve(self,f,c=INK,a=None,b=None):
  a=self.xlim[0] if a is None else a;b=self.xlim[1] if b is None else b
  points=[self.xy(a+(b-a)*i/600,f(a+(b-a)*i/600)) for i in range(601)]
  self.p.append('<g clip-path="url(#clip)">'+self.path(points,c,.52)+'</g>')
 def area(self,f,g,a,b,color=0,hatch=True):
  xs=[a+(b-a)*i/250 for i in range(251)]
  pts=[self.xy(x,f(x)) for x in xs]+[self.xy(x,g(x)) for x in reversed(xs)]
  pts.append(pts[0])
  self.p.append('<g clip-path="url(#clip)">'+self.path(pts,"none",0,FILLS[color%3])+(self.path(pts,"none",0,"url(#hatch)") if hatch else "")+'</g>')
 def axes(self,xt=(),yt=(),above=(),origin_dy=4):
  xmin,xmax=self.xlim;ymin,ymax=self.ylim
  for a,b in [((xmin,0),(xmax,0)),((0,ymin),(0,ymax))]:
   pts=[self.xy(*a),self.xy(*b)];s=self.path(pts,"#000000",.25).replace('/>',' marker-end="url(#arr)"/>');self.p.append(s)
  self.label(xmax,0,"x",dx=3,dy=-1.5)
  self.label(0,ymax,"y",dx=2,dy=-1)
  self.label(0,0,"O",dx=-2.2,dy=origin_dy,anchor="end")
  for t in xt:
   x,s=(t,str(t).replace("-","−")) if isinstance(t,(int,float)) else t
   self.label(x,0,s,dy=-2 if x in above else 4.4)
  for t in yt:
   y,s=(t,str(t).replace("-","−")) if isinstance(t,(int,float)) else t
   self.label(0,y,s,dx=-2.4,dy=-1,anchor="end")
 def save(self):
  X,Y=self.xy(self.xlim[0],self.ylim[1]);x2,y2=self.xy(self.xlim[1],self.ylim[0])
  defs=f'<defs><clipPath id="clip"><rect x="{X}" y="{Y}" width="{x2-X}" height="{y2-Y}"/></clipPath><marker id="arr" markerWidth="5" markerHeight="5" refX="4.5" refY="2.5" orient="auto"><path d="M0 0 L5 2.5 L0 5 Z" fill="#000000"/></marker><marker id="back" markerWidth="5" markerHeight="5" refX=".5" refY="2.5" orient="auto"><path d="M5 0 L0 2.5 L5 5 Z" fill="#000000"/></marker><pattern id="hatch" width="2.2" height="2.2" patternUnits="userSpaceOnUse"><path d="M0 2.2 L2.2 0" stroke="#647077" stroke-width=".12"/></pattern></defs>'
  top,bottom=self.crop_y
  (OUT/(self.name+".svg")).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{self.w}mm" height="{bottom-top}mm" viewBox="0 {top} {self.w} {bottom-top}">'+defs+''.join(self.p+self.top)+'</svg>')

p=Plot('parabol-duong-thang-loi-giai',(-2,4),(-1,7),110,138)
p.label_scale=1.25
f=lambda x:x*x;g=lambda x:2*x
p.area(f,g,0,2,1);p.curve(f);p.curve(g,INK);p.guide(2,4);p.point(2,4);p.axes([2],[4],origin_dy=6);p.label(.8,6.3,'y=x²',anchor='start');p.label(3.1,5.7,'y=2x',anchor='start');p.save()
p=Plot('hai-parabol-loi-giai',(-1.8,1.8),(-2.5,2.3))
f=lambda x:2*(x*x-1);g=lambda x:1-x*x
p.area(f,g,-1,1,0);p.curve(f);p.curve(g,INK)
reflected=lambda x:2*(1-x*x)
p.curve(reflected,INK);p.axes([-1,1],[1,2]);p.label(0,-2,'−2',dx=-2.4,dy=4,anchor='end')
p.label(.35,-2.3,'y=2(x²−1)',anchor='start');p.label(-1.4,.9,'y=1−x²',anchor='start')
p.label(-1.05,2.25,'y=2(1−x²)',anchor='start');p.save()
p=Plot('mat-cat-cau',(-7,7),(-5.2,6.933333333333334),110,96)
f=lambda x:sqrt(36-x*x)
p.area(f,lambda x:0,-4,4,0);p.curve(f,'#000000',a=-4,b=4)
low=[p.xy(-4+8*i/250,-f(-4+8*i/250)) for i in range(251)]
p.p.append(p.path(low,'#000000',.32,dash=True))
for x in [-4,4]:
 h=f(x)
 p.line((x,0),(x,h));p.line((x,0),(x,-h),dash=True)
 ellipse=[p.xy(x+.65*cos(2*pi*i/150),h*sin(2*pi*i/150)) for i in range(151)]
 p.p.append(p.path(ellipse,'#000000',.3,dash=True))
p.axes([], [6]);p.label(-4,0,'−4',dx=-6,dy=4.5,anchor='end');p.label(4,0,'4',dx=6,dy=4.5,anchor='start');p.save()

# Planar figures use the equations in the lesson; colors distinguish boundaries.
p=Plot('hai-do-thi',(-.4,4.5),(-.4,3.6));p.crop_y=(4,60)
f=lambda x:2.7+.25*sin(2*pi*(x-.7)/3)+.35*(x-.7)/3;g=lambda x:1-.17*sin(2*pi*(x-.7)/3)
p.area(f,g,.7,3.7,1);p.curve(f,a=.7,b=3.7);p.curve(g,INK,a=.7,b=3.7)
for x in (.7,3.7):p.line((x,0),(x,f(x)))
p.axes([(.7,'a'),(3.7,'b')]);p.label(2,3.45,'y=f(x)');p.label(2,.65,'y=g(x)');p.save()

p=Plot('parabol-duong-thang',(-3.1,6),(-1.1,8),110,108)
p.label_scale=1.25
f=lambda x:x*x+2*x+2;g=lambda x:6-x;h=lambda x:2
p.area(f,h,0,1,0);p.area(g,h,1,4,1);p.curve(f);p.curve(g,INK);p.line((-3,2),(5.9,2),INK)
for x in (1,4):p.line((x,0),(x,2 if x==4 else 5),dash=True)
p.line((0,5),(1,5),dash=True)
p.axes([1,4],[2,5]);p.label(1.9,7.6,'y=x²+2x+2',anchor='start');p.label(3.8,3.1,'y=6−x');p.save()

p=Plot('parabol-can-bac-hai',(-.55,1.6),(-.35,1.75),110,105.9069767442)
f=lambda x:x*x;g=lambda x:sqrt(max(0,x))
p.area(f,g,0,1,1);p.curve(f);p.curve(g,INK,a=0);p.guide(1,1);p.axes([1],[1])
p.label(1.27,1.6,'y=x²',anchor='end');p.label(1.28,.95,'y=√x',anchor='start');p.point(1,1);p.save()

p=Plot('parabol-va-duong-thang',(-3.2,3.2),(-4.7,5.7),110,164.25)
p.label_scale=1.4
f=lambda x:x*x;g=lambda x:4
p.area(f,g,-2,2,0);p.curve(f);p.line((-2.65,4),(2.65,4),INK)
mirror=[p.xy(-2+4*i/240,-(-2+4*i/240)**2) for i in range(241)]
p.p.append(p.path(mirror,INK,.3,dash=True))
for x in (-2,2):
 p.line((x,0),(x,4))
 arc=[p.xy(x+.18*cos(2*pi*i/120),4*sin(2*pi*i/120)) for i in range(121)]
 p.p.append(p.path(arc,'#000000',.28,dash=True))
p.line((-2.65,-4),(2.65,-4),dash=True)
p.axes([],[4],origin_dy=6);p.label(-2,0,'−2',dx=-5,dy=4.5,anchor='end');p.label(2,0,'2',dx=5,dy=4.5,anchor='start')
p.label(1.65,5.15,'y=x²');p.label(.5,4.45,'y=4',anchor='start');p.save()

p=Plot('mien-tam-giac',(-.5,4.7),(-2.5,2.8),110,73)
f=lambda x:sqrt(max(0,x));a=2.1;M=(a,f(a));H=(4,0)
p.area(f,lambda x:0,0,4,0)
p.p.append(p.path([p.xy(0,0),p.xy(*M),p.xy(*H),p.xy(0,0)],stroke=INK,sw=.4,fill=FILLS[1]))
p.p.append(p.path([p.xy(0,0),p.xy(a,-f(a)),p.xy(*H),p.xy(0,0)],stroke='none',sw=0,fill=FILLS[1]))
p.line((0,0),(a,-f(a)),INK,dash=True);p.line((a,-f(a)),H,INK,dash=True)
p.curve(f,a=0,b=4.5);p.line((a,0),M)
low=[p.xy(4*i/200,-f(4*i/200)) for i in range(201)];p.p.append(p.path(low,INK,.32,dash=True))
for x in (a,4):
 ellipse=[p.xy(x+.22*cos(2*pi*i/120),f(x)*sin(2*pi*i/120)) for i in range(121)]
 p.p.append(p.path(ellipse,'#000000',.28,dash=True))
p.axes([],[],above=());p.label(a,0,'a',dx=3,dy=-3);p.label(4,0,'4',dx=3,dy=-2);p.label(*M,'M',dx=1,dy=-3);p.label(4,0,'H',dx=5,dy=5,anchor='start');p.label(a,0,'K',dy=5);p.save()

def semicircles(name, solution=False):
 p=Plot(name,(-1.2,17.3),(-1,8.99),120,72)
 big=lambda x:sqrt(max(0,16*x-x*x));small=lambda x:sqrt(max(0,8*x-x*x));line=lambda x:x/sqrt(3)
 p.area(line,small,6,8,0);p.area(line,lambda x:0,8,12,0);p.area(big,lambda x:0,12,16,0)
 p.curve(big,a=0,b=16);p.curve(small,INK,a=0,b=8);p.line((0,0),(12,line(12)),INK)
 angle=[p.xy(1.8*cos(pi*i/180),1.8*sin(pi*i/180)) for i in range(31)]
 p.p.append(p.path(angle,'#000000',.3))
 if solution:
  for x in (6,12):p.line((x,0),(x,line(x)),dash=True)
  p.axes([6,8,12,16]);p.label(0,0,'A',dx=-2,dy=8);p.label(16,0,'B',dx=2,dy=8)
 else:
  p.line((-.5,0),(16.6,0));p.label(0,0,'A',dy=5);p.label(16,0,'B',dy=5)
 p.label(12,line(12),'C',dx=2,dy=-2);p.label(2.8,.4,'30°');p.label(11,1.5,'(H)');p.save()
semicircles('nua-duong-tron');semicircles('nua-duong-tron-loi-giai',True)

p=Plot('do-thi-ham-mu',(-1.7,1.6),(-.45,3.2))
p.crop_y=(3,60)
f=lambda x:__import__('math').exp(x)
p.area(f,lambda x:0,-1,1,1);p.curve(f);p.line((-1,0),(-1,f(-1)),INK);p.line((1,0),(1,f(1)),INK)
p.axes([-1,1]);p.point(0,0);p.point(0,1);p.label(.65,2.9,'y=eˣ');p.save()

p=Plot('giao-hai-hinh-cau',(-3.8,6.8),(-3.4,3.384),120,82)
for x in range(-3,7):p.p.append(p.path([p.xy(x,-3.3),p.xy(x,3.3)],'#dce6e3',.12))
for y in range(-3,4):p.p.append(p.path([p.xy(-3.7,y),p.xy(6.7,y)],'#dce6e3',.12))
for x0,r,color in [(0,3,INK),(4,2,INK)]:
 pts=[p.xy(x0+r*cos(2*pi*i/300),r*sin(2*pi*i/300)) for i in range(301)]
 p.p.append(p.path(pts,color,.5))
p.axes([4],[3]);p.label(-3,0,'−3',dx=-2,dy=4.5,anchor='end');p.label(2,0,'2',dx=-2,dy=4.5,anchor='end')
p.label(3,0,'3',dx=2,dy=4.5,anchor='start');p.label(6,0,'6',dx=2,dy=4.5,anchor='start')
p.label(0,-3,'−3',dx=-2.4,dy=4,anchor='end');p.point(21/8,sqrt(9-(21/8)**2));p.point(21/8,-sqrt(9-(21/8)**2));p.save()

p=Plot('hinh-chop-loi-giai',(-.7,5.4),(-2.8,2.7))
p.line((0,0),(4,2),INK);p.line((0,0),(4,-2),INK);p.line((4,-2),(4,2),INK)
p.line((2,-1),(2,1),INK);p.axes()
for x,y in ((2,-1.3),(4,-2.35)):
 p.p.append(p.path([p.xy(0,y),p.xy(x,y)],'#000000',.25).replace('/>',' marker-start="url(#back)" marker-end="url(#arr)"/>'))
p.label(1,-1.3,'x',dy=4);p.label(2,-2.35,'h',dy=4);p.label(2,.1,'a',dx=3,anchor='start')
p.label(4,2,'P',dx=2,dy=-2);p.label(4,.1,'L',dx=4,anchor='start');p.save()

class Sketch:
 def __init__(self,name,w=120,h=70):
  self.name=name;self.w=w;self.h=h;self.parts=[]
 def path(self,d,color='#000000',width=.36,fill='none',dash=False,arrow=False,arrow_start=False):
  self.parts.append(f'<path d="{d}" fill="{fill}" stroke="{color}" stroke-width="{width}" stroke-linecap="round" stroke-linejoin="round"'+(' stroke-dasharray="1.5 1.1"' if dash else '')+(' marker-end="url(#arrow)"' if arrow else '')+(' marker-start="url(#arrow)"' if arrow_start else '')+'/>')
 def text(self,x,y,value,size=4,anchor='middle',color='#111'):
  if "√" in value:
   self.parts.append(radical_label(value,x,y,size,anchor));return
  self.parts.append(f'<text x="{x}" y="{y}" text-anchor="{anchor}" font-family="Times New Roman" font-size="{size}" fill="{color}">{escape(value)}</text>')
 def ellipse(self,cx,cy,rx,ry,color='#000000',fill='none',dash=False,width=.36):
  self.parts.append(f'<ellipse cx="{cx}" cy="{cy}" rx="{rx}" ry="{ry}" fill="{fill}" stroke="{color}" stroke-width="{width}"'+(' stroke-dasharray="1.5 1.1"' if dash else '')+'/>')
 def save(self):
  defs='<defs><marker id="arrow" markerWidth="5" markerHeight="5" refX="4.4" refY="2.5" orient="auto-start-reverse"><path d="M0 0 L5 2.5 L0 5 Z" fill="#000000"/></marker><pattern id="h" width="2.2" height="2.2" patternUnits="userSpaceOnUse"><path d="M0 2.2 L2.2 0" stroke="#637477" stroke-width=".12"/></pattern></defs>'
  margins={'thiet-dien-vat-the':(6,61),'thiet-dien-vuong':(3,74),'khoi-tron-xoay':(2,62),'chom-cau':(2,65),'binh-mat-cat-vuong':(0,80),'thiet-dien-hinh-chop':(2,67),'mat-cat-lu':(8,66),'vo-do-choi':(4,71)}
  top,bottom=margins.get(self.name,(0,self.h))
  (OUT/(self.name+'.svg')).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{self.w}mm" height="{bottom-top}mm" viewBox="0 {top} {self.w} {bottom-top}">'+defs+''.join(self.parts)+'</svg>')

s=Sketch('thiet-dien-vat-the',130,66)
# Source projection: three parallel oblique planes, cut face seen from the left.
s.path('M18 25 C35 13 49 17 65 23 C80 29 99 23 112 26 L112 43 C96 47 80 43 65 48 C47 54 32 49 18 42 Z','none',0,fill='#c8efe6')
s.path('M18 25 C35 13 49 17 65 23',INK,.45)
s.path('M18 42 C32 49 47 54 65 48',INK,.45)
s.path('M65 23 C80 29 99 23 107 25',INK,.45)
s.path('M65 48 C80 43 99 47 107 44',INK,.45)
s.path('M107 25 L112 26 M107 44 L112 43',INK,.35,dash=True)
s.path('M18 25 A3 8.5 0 0 0 18 42',INK,.4)
s.path('M18 25 A3 8.5 0 0 1 18 42',INK,.35,dash=True)
s.ellipse(112,34.5,3,8.5,INK)
for x,upper,lower in ((22,23,44),(65,23,48),(112,26,43)):
 s.path(f'M{x-8} 58 L{x-8} 13 L{x+7} 8 L{x+7} 53 L{x-8} 58','none',0)
 s.path(f'M{x-8} 58 L{x-8} 13 L{x+7} 8 L{x+7} {upper}',INK,.3)
 s.path(f'M{x+7} {upper} L{x+7} {lower}',INK,.3,dash=True)
 s.path(f'M{x+7} {lower} L{x+7} 53 L{x-8} 58',INK,.3)
 # Source leaves each near edge visible through the body.
s.ellipse(65,35.5,3.8,12.5,'none',fill='#ffadbb')
s.ellipse(65,35.5,3.8,12.5,'none',fill='url(#h)')
s.path('M65 23 A3.8 12.5 0 0 0 65 48',INK,.4)
s.path('M65 23 A3.8 12.5 0 0 1 65 48',INK,.35,dash=True)
s.path('M6 53 L126 53',arrow=True)
for x,y in ((18,42),(65,48),(112,43)):s.path(f'M{x} {y} L{x} 53',dash=True)
for x,t in [(6,'O'),(18,'a'),(65,'x'),(112,'b')]:s.text(x,59,t)
s.text(127,52,'x');s.text(72,37,'S(x)',anchor='start')
for x,t in ((25,'P'),(115,'Q')):
 s.path(f'M{x-2} 10 Q{x-2} 15 {x+3} 15',INK,.25);s.text(x+1,13,t,size=3.2)
s.save()

s=Sketch('thiet-dien-vuong',116,74)
def points_path(points):return ' '.join(('M' if i==0 else 'L')+f'{x:.3f} {y:.3f}' for i,(x,y) in enumerate(points))
s.path('M12 61 L32 45 L90 45',INK,.4,dash=True);s.path('M32 22 L32 45',INK,.4,dash=True)
s.path('M12 61 L12 38 L70 21 L70 61',INK,.48);s.path('M12 38 L32 22 L90 5 L70 21',INK,.48)
s.path('M70 61 L90 45 L90 5',INK,.48)
mid=[(42,61),(42,29.2),(62,13.2),(62,45)]
s.path(points_path(mid+[mid[0]]),'none',0,fill='#ffadbb');s.path(points_path(mid+[mid[0]]),'none',0,fill='url(#h)')
s.path('M42 61 L42 29.2 L62 13.2',INK,.42);s.path('M62 13.2 L62 45 L42 61',INK,.4,dash=True)
s.path('M12 38 L70 21 M32 22 L90 5',INK,.48)
s.path('M8 61 L105 61',arrow=True);s.text(8,67,'O');s.text(70,67,'3');s.text(106,60,'x')
s.path('M38 61 L41 58.6 L45 58.6',width=.25);s.path('M74 61 L77 58.6 L73 58.6',width=.25)
s.text(48,44,'S(x)');s.text(54,72,'√(9−x²)',size=4.1);s.path('M54 68 L42 47',arrow=True);s.save()

s=Sketch('khoi-tron-xoay',150,66)
s.path('M28 16 C41 19 52 25 67 21 L67 47 C52 43 41 49 28 52 Z',INK,.48,fill='#c8efe6')
s.path('M28 16 C41 19 52 25 67 21 L67 34 L28 34 Z',INK,.32,fill='#ffadbb')
s.path('M28 16 C41 19 52 25 67 21 L67 34 L28 34 Z','none',0,fill='url(#h)')
s.ellipse(28,34,3,18,INK,dash=True);s.ellipse(67,34,3,13,INK,dash=True)
s.path('M7 34 L96 34',arrow=True);s.path('M14 60 L14 6',arrow=True);s.path('M28 16 L28 34');s.path('M67 21 L67 34')
s.text(10,40,'O');s.text(14,5,'y');s.text(98,33,'x');s.text(28,40,'a');s.text(67,40,'b');s.text(48,15,'y=f(x)')
s.path('M84 29 C88 26 88 42 84 41 C81 40 81 35 83 32',width=.3,arrow=True)
s.path('M111 17 Q108 17 108 22 L108 30 Q108 33 106 34 Q108 35 108 38 L108 47 Q108 51 111 51',width=.3)
for y,t in [(20,'(C): y=f(x)'),(29,'(Ox): y=0'),(38,'x=a'),(47,'x=b')]:s.text(114,y,t,size=4.2,anchor='start')
s.save()

s=Sketch('chom-cau',130,65)
s.path('M12 39 L70 39',arrow=True);s.path('M28 58 L28 6',arrow=True)
s.path('M28 15 A24 24 0 0 1 52 39 A24 24 0 0 1 28 63',INK,.48)
s.path('M43 39 L43 20.27 A24 24 0 0 1 52 39 Z',INK,.36,fill='#ffadbb')
s.path('M43 20.27 L43 39',dash=True);s.path('M28 39 L52 39',INK,.35)
s.path('M43 20.27 A2.2 18.73 0 0 0 43 57.73',INK,.36);s.path('M43 20.27 A2.2 18.73 0 0 1 43 57.73',INK,.32,dash=True);s.path('M28 39 L10 57',arrow=True);s.text(8,60,'z')
s.text(26,44,'O');s.text(40,45,'R−h',anchor='end');s.text(54,45,'R',anchor='start');s.text(47,37,'h');s.text(71,38,'x');s.text(29,6,'y');s.text(38,11,'y=√(R²−x²)',size=3.8,anchor='start')
cap_radius=sqrt(22**2-13**2);cap_left=101-cap_radius;cap_right=101+cap_radius
s.ellipse(101,34,22,22,INK)
s.path(f'M{cap_left:.5f} 21 A22 22 0 0 1 {cap_right:.5f} 21 A{cap_radius:.5f} 4 0 0 1 {cap_left:.5f} 21 Z',INK,.35,fill='#c8efe6')
s.path(f'M{cap_left:.5f} 21 A{cap_radius:.5f} 4 0 0 1 {cap_right:.5f} 21',INK,.32,dash=True)
s.path(f'M{cap_left:.5f} 21 A{cap_radius:.5f} 4 0 0 0 {cap_right:.5f} 21',INK,.35)
s.path('M79 34 A22 5 0 0 0 123 34',INK,.35);s.path('M79 34 A22 5 0 0 1 123 34',INK,.3,dash=True)
s.ellipse(101,34,.55,.55,INK,fill=INK);s.path('M101 34 L123 34',dash=True);s.path('M124 12 L124 21',arrow=True,arrow_start=True);s.text(126,18,'h',anchor='start');s.text(112,32,'R');s.save()

s=Sketch('binh-mat-cat-vuong',118,80)
def vessel(t):
 # One parallel projection for every horizontal square; height is linear in x.
 q=sqrt(2+4*t*t)/sqrt(2);half=16*q;y=68-43*t;cx=48
 return [(cx-half,y),(cx+half,y),(cx+2*half,y-.84*half),(cx,y-.84*half)]
def poly(points):return points_path(points+[points[0]])
top=vessel(1);bottom=vessel(0);mid=vessel(.56)
# Fill below the section first; draw all boundary/hidden strokes afterwards.
for a,b in ((0,1),(1,2)):
 pts=[vessel(.56*i/80)[a] for i in range(81)]+[vessel(.56*i/80)[b] for i in reversed(range(81))]
 s.path(points_path(pts)+' Z','none',0,fill='#c8efe6')
s.path(poly(mid),'none',0,fill='#ffadbb')
for c in (0,1,2,3):
 if c==3:
  s.path(points_path([vessel(.56*i/80)[c] for i in range(81)]),INK,.4,dash=True)
  s.path(points_path([vessel(.56+.44*i/80)[c] for i in range(81)]),INK,.48)
 else:
  s.path(points_path([vessel(i/80)[c] for i in range(81)]),INK,.48)
s.path(poly(top),INK,.48)
s.path(points_path([bottom[0],bottom[1],bottom[2]]),INK,.48)
s.path(points_path([bottom[2],bottom[3],bottom[0]]),INK,.4,dash=True)
s.path(points_path([mid[0],mid[1],mid[2]]),INK,.48)
s.path(points_path([mid[2],mid[3],mid[0]]),INK,.4,dash=True)
# Height measured on a fixed vertical, with horizontal extension lines.
for y,end in ((68,114),(25,114),(mid[0][1],103)):
 s.path(f'M81 {y} L{end} {y}',dash=True,width=.3)
s.path(f'M81 25 L81 68',dash=True,width=.3)
for y in (25,mid[0][1],68):
 s.path(f'M81 {y+2.3} L83.3 {y+2.3} L83.3 {y}',width=.25)
s.path('M111 67 L111 26',arrow=True,arrow_start=True);s.text(115,47,'4')
s.path(f'M101 67 L101 {mid[0][1]+1:.3f}',arrow=True,arrow_start=True);s.text(104,59,'x')
s.text(4,78,'√(2+x²/4)',size=4.2,anchor='start')
s.path(f'M28 73 L{mid[0][0]+9:.2f} {mid[0][1]+1:.2f}',arrow=True);s.save()

s=Sketch('thiet-dien-hinh-chop',125,70)
O=(22,37);base=[(91,29),(108,12),(108,45),(91,62)]
mid=[(O[0]+.52*(x-O[0]),O[1]+.52*(y-O[1])) for x,y in base]
s.path(poly(base),'none',0,fill='#c8efe6');s.path(poly(mid),'none',0,fill='#ffadbb')
# Only the ray to the far lower vertex is hidden in the source view.
for i,(x,y) in enumerate(base):s.path(f'M{O[0]} {O[1]} L{x} {y}',INK,.4,dash=i==2)
s.path(poly(base),INK,.42)
s.path(points_path([mid[1],mid[0],mid[3],mid[2]]),INK,.4)
s.path(points_path([mid[1],mid[2]]),INK,.4,dash=True)
s.path('M22 37 L108 37',dash=True,width=.3);s.path('M108 37 L118 37',arrow=True)
s.path('M22 65 L22 7',arrow=True);s.path('M22 37 L5 58',arrow=True)
s.text(18,35,'O');s.text(119,41,'x');s.text(23,6,'y');s.text(4,61,'z');s.text(63,35,'x');s.text(101,35,'h');s.save()

s=Sketch('mat-cat-lu',96,76)
cx,cy,r=48,37,27;dy=18;w=sqrt(r*r-dy*dy)
xl=cx-w;xr=cx+w;yt=cy-dy;yb=cy+dy
s.path(f'M{xl:.3f} {yt} A{r} {r} 0 0 0 {xl:.3f} {yb} A{w:.3f} 4 0 0 0 {xr:.3f} {yb} A{r} {r} 0 0 0 {xr:.3f} {yt} A{w:.3f} 4 0 0 0 {xl:.3f} {yt} Z','none',0,fill='#c8efe6')
s.ellipse(cx,cy,r,r,INK,width=.5)
for y in (yt,yb):
 s.path(f'M{xl:.3f} {y} A{w:.3f} 4 0 0 0 {xr:.3f} {y}',INK,.4)
 s.path(f'M{xl:.3f} {y} A{w:.3f} 4 0 0 1 {xr:.3f} {y}',INK,.35,dash=True)
s.path(f'M{cx} {yt} L{cx} {yb}',dash=True);s.path(f'M{cx} {cy} L{cx+r} {cy}',dash=True)
for x,y in ((cx,yt),(cx,cy),(cx,yb),(cx+r,cy)):s.ellipse(x,y,.7,.7,'#000000',fill='#000000')
s.text(cx-3,cy-9,'4 dm',anchor='end');s.text(cx-3,cy+11,'4 dm',anchor='end');s.text(cx+10,cy-2,'6 dm',anchor='start');s.save()

s=Sketch('vo-do-choi',125,75)
def radius(t):
 x=1+4*t
 return 9*(x*x/8-x/4+9/8)
top=[];bottom=[];inner_top=[];inner_bottom=[]
for i in range(101):
 t=i/100;x=27+67*t;r=radius(t)
 top.append((x,40-r));bottom.append((x,40+r));inner_top.append((x,40-r+.9));inner_bottom.append((x,40+r-.9))
s.path(points_path(top+list(reversed(bottom)))+' Z','none',0,fill='#c8efe6')
s.path(points_path(top),INK,.48);s.path(points_path(bottom),INK,.48)
s.path(points_path(inner_top),INK,.32,dash=True);s.path(points_path(inner_bottom),INK,.32,dash=True)
s.ellipse(27,40,3.3,radius(0),INK,width=.46);s.ellipse(27,40,2.1,radius(0)-.9,INK,width=.32)
s.path(f'M94 {40-radius(1):.3f} A4.5 {radius(1):.3f} 0 0 1 94 {40+radius(1):.3f}',INK,.42)
s.path(f'M94 {40-radius(1):.3f} A4.5 {radius(1):.3f} 0 0 0 94 {40+radius(1):.3f}',INK,.42)
s.ellipse(94,40,3.5,radius(1)-.9,INK,dash=True,width=.3)
s.path('M9 40 L23 40');s.path('M23 40 L99 40',dash=True,width=.3);s.path('M99 40 L118 40',arrow=True);s.path('M17 69 L17 8',arrow=True)
s.text(14,46,'O');s.text(119,39,'x');s.text(18,8,'y');s.text(27,46,'1');s.text(101,46,'5')
s.text(64,11,'y=x²/8−x/4+9/8',size=4.1);s.save()
