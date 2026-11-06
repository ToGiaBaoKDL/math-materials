"""Rebuild lesson-local SVG models; functions match printed data, schematic curves are explicitly illustrative."""
from pathlib import Path
from math import sin,cos,pi,sqrt
from html import escape
OUT=Path(__file__).parent
BLUE="#005FE6";ORANGE="#C45A00";GREEN="#17623E"
FILLS=["#FFC2CE","#C8EFE7","#FFE58C"]
class Plot:
 def __init__(self,name,xlim,ylim,w=110,h=67):
  self.name=name;self.xlim=xlim;self.ylim=ylim;self.w=w;self.h=h
  self.p=[];self.top=[];self.crop_y=(0,h)
 def xy(self,x,y):
  a,b=self.xlim;c,d=self.ylim
  return (12+(x-a)/(b-a)*(self.w-20),self.h-10-(y-c)/(d-c)*(self.h-18))
 def path(self,pts,stroke="#222",sw=.3,fill="none",dash=False):
  d=" ".join(("M" if i==0 else "L")+f"{x:.3f},{y:.3f}" for i,(x,y) in enumerate(pts))
  return f'<path d="{d}" fill="{fill}" stroke="{stroke}" stroke-width="{sw}" stroke-linejoin="round" stroke-linecap="round"'+(' stroke-dasharray="1.2 1"' if dash else '')+'/>'
 def line(self,a,b,c="#333",dash=False):
  self.p.append(self.path([self.xy(*a),self.xy(*b)],stroke=c,dash=dash))
 def point(self,x,y):
  X,Y=self.xy(x,y)
  self.p.append(f'<circle cx="{X:.3f}" cy="{Y:.3f}" r="0.85" fill="#222"/>')
 def label(self,x,y,s,dx=0,dy=0,size=3.8,anchor="middle"):
  X,Y=self.xy(x,y)
  self.top.append(f'<text x="{X+dx:.3f}" y="{Y+dy:.3f}" text-anchor="{anchor}" font-family="Times New Roman" font-size="{size}" fill="#111">{escape(s)}</text>')
 def guide(self,x,y):
  self.line((x,0),(x,y),dash=True);self.line((0,y),(x,y),dash=True)
 def curve(self,f,c=BLUE,a=None,b=None):
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
   pts=[self.xy(*a),self.xy(*b)];s=self.path(pts,"#222",.25).replace('/>',' marker-end="url(#arr)"/>');self.p.append(s)
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
  defs=f'<defs><clipPath id="clip"><rect x="{X}" y="{Y}" width="{x2-X}" height="{y2-Y}"/></clipPath><marker id="arr" markerWidth="5" markerHeight="5" refX="4.5" refY="2.5" orient="auto"><path d="M0 0 L5 2.5 L0 5 Z" fill="#222"/></marker><pattern id="hatch" width="2.2" height="2.2" patternUnits="userSpaceOnUse"><path d="M0 2.2 L2.2 0" stroke="#647077" stroke-width=".12"/></pattern></defs>'
  top,bottom=self.crop_y
  (OUT/(self.name+".svg")).write_text(f'<svg xmlns="http://www.w3.org/2000/svg" width="{self.w}mm" height="{bottom-top}mm" viewBox="0 {top} {self.w} {bottom-top}">'+defs+''.join(self.p+self.top)+'</svg>')
zero=lambda x:0
# Schematic theory diagram with positive/negative lobes.
p=Plot("theory-signed-area",(-.5,6.5),(-1.5,1.7))
f=lambda x: .78*cos(pi*(x-.7)/2.4) if x<=1.9 else -1.1*sin(pi*(x-1.9)/2.4) if x<=4.3 else 1.3*sqrt((x-4.3)/1.7)
p.area(f,zero,.7,6);p.curve(f,a=.7,b=6)
for x in [.7,6]:p.line((x,0),(x,f(x)))
p.axes([(.7,"a"),(1.9,"c"),(4.3,"d"),(6,"b")])
for x,y,t in [(1.05,.25,"S₁"),(3,-.45,"S₂"),(5.55,.5,"S₃"),(1,1.15,"f(x)>0"),(3,-1.3,"f(x)<0"),(5.5,1.45,"f(x)>0")]:p.label(x,y,t)
p.save()
p=Plot("theory-two-curves",(-.4,4.5),(-.4,3.6))
p.crop_y=(4,60)
f=lambda x:2.7+.25*sin(2*pi*(x-.7)/3)+.35*(x-.7)/3
g=lambda x:1-.17*sin(2*pi*(x-.7)/3)
p.area(f,g,.7,3.7,1);p.curve(f,a=.7,b=3.7);p.curve(g,ORANGE,a=.7,b=3.7)
for x in [.7,3.7]:p.line((x,0),(x,f(x)))
p.axes([(.7,"a"),(3.7,"b")]);p.label(2,3.45,"y=f(x)");p.label(2,.65,"y=g(x)");p.save()
p=Plot("theory-intersections",(-.3,6.6),(0,4))
f=lambda x:2+.65*sin(pi*(x-1)/2)
g=lambda x:2-.65*sin(pi*(x-1)/2)
for a,b,k in [(.4,1,0),(1,3,1),(3,5,0),(5,5.7,1)]:p.area(f,g,a,b,k)
p.curve(f,a=.1,b=6);p.curve(g,ORANGE,a=.1,b=6)
for x in [1,3,5]:p.line((x,0),(x,f(x)),dash=True)
for x in [.4,5.7]:p.line((x,0),(x,max(f(x),g(x))))
p.axes([(.4,"a"),(1,"x₁"),(3,"x₂"),(5,"x₃"),(5.7,"b")]);p.label(6,3.55,"f(x)");p.label(6,1.05,"g(x)");p.save()
# Worked examples, graph shapes or equations from source.
p=Plot("signed-cubic",(-1.6,2.6),(-1.3,3))
f=lambda x:(x+1)*(x-1)*(x-2)
p.area(f,zero,-1,2);p.curve(f);p.axes([1,2],above=(2,));p.label(-1,0,"−1",dx=-2,dy=-2.5,anchor="end");p.label(1.5,2.7,"y=f(x)");p.save()
p=Plot("signed-s-curve",(-3.5,2.6),(-2.5,1.7))
f=lambda x:1.5*sin((x-1)*pi/6)
p.area(f,zero,-3,2,1);p.curve(f,a=-3,b=2)
for x in [-3,2]:p.line((x,0),(x,f(x)))
p.axes([-3,1,2],above=(-3,1),origin_dy=-2.5);p.save()
p=Plot("piecewise-triangles",(-3.5,3.7),(-1.5,4.7))
f=lambda x:x+2 if x<=-1 else (1-x)/2 if x<=1 else 2*x-2
for x,y in [(-3,-1),(-1,1),(3,4)]:p.guide(x,y)
p.curve(f,a=-3,b=3);p.axes([-3,-1,1,3],[1,4],above=(-3,))
p.label(0,-1,"−1",dx=2,dy=4,anchor="start")
for x,y in [(-3,-1),(-2,0),(-1,1),(1,0),(3,4)]:p.point(x,y)
p.save()
p=Plot("piecewise-trapezoid",(-3.6,3.7),(-2.5,2.8))
p.crop_y=(4,62)
f=lambda x:x+3 if x<=-1 else 2 if x<=1 else -2*x+4
p.area(f,zero,-3,2);p.area(f,zero,2,3,1);p.curve(f,a=-3,b=3)
for x in [-1,1]:
 p.p.append(p.path([p.xy(x,0),p.xy(x,2)],FILLS[0],.9))
 p.line((x,0),(x,2),dash=True)
p.guide(3,-2)
p.axes([-3,-1,1,2,3],[-2,2],above=(2,3));p.label(-.8,.9,"S₁");p.label(2.7,-.6,"S₂")
for x,y in [(-3,0),(-1,2),(1,2),(2,0),(3,-2)]:p.point(x,y)
p.save()
p=Plot("parabola-line-area",(-3.5,2),(-3,5.4))
f=lambda x:x*x+x-2;g=lambda x:-x+1
p.area(f,g,-3,1);p.curve(f);p.curve(g,ORANGE);p.guide(-3,4);p.axes([-3,1]);p.label(1.6,4.5,"y=f(x)");p.save()
p=Plot("exponential-area",(-1.2,4.5),(-1,9.3))
f=lambda x:2**x
p.area(f,lambda x:2,1,3,1);p.curve(f);p.line((1,2),(3,2));p.line((3,2),(3,8))
for x,y in [(1,2),(3,8)]:p.guide(x,y)
p.axes([1,3],[2,8]);p.label(2,6,"y=2ˣ");p.save()
p=Plot("cubic-parabola-area",(-2.5,1.9),(-2,6))
f=lambda x:x*x;g=lambda x:-x**3+2*x
p.area(f,g,-2,0,0);p.area(f,g,0,1,1);p.curve(f);p.curve(g,ORANGE);p.axes()
p.label(1.4,5,"y=x²");p.label(.8,-1.65,"y=−x³+2x");p.save()
def secant(name,shade):
 p=Plot(name,(-1,8.7),(-1,13))
 f=lambda x:x*x-8*x+17;g=lambda x:x+3
 if shade:p.area(f,g,2,7,1)
 p.curve(f);p.curve(g,ORANGE)
 for x,y in [(2,5),(7,10)]:p.guide(x,y)
 p.axes([2,7],[5,10]);p.label(2,5,"A",dx=-4,dy=-2);p.label(7,10,"B",dx=-3,dy=-2)
 p.label(1.4,11.5,"(P)");p.label(8,11,"d",dx=2,dy=-2);p.save()
secant("parabola-secant",False);secant("parabola-secant-shaded",True)
def interp(x,points):
 return sum(y*__import__("functools").reduce(lambda a,b:a*b,[(x-X)/(xx-X) for X,Y in points if X!=xx],1) for xx,y in points)
p=Plot("two-cubics",(-4.7,4.8),(-3.8,3.1),120,69)
f=lambda x:interp(x,[(-4,-1),(-1,1),(2,2),(4,-1)])
g=lambda x:f(x)+5/36*(x+4)*(x+1)*(x-4)
p.area(f,g,-4,-1);p.area(f,g,-1,4,1);p.curve(f,GREEN);p.curve(g,ORANGE)
for x in [-4,-1,4]:p.line((x,0),(x,f(x)),dash=True)
p.axes([-4,-1,2,4],[2,-3],above=(-4,4))
p.label(-2.6,.2,"S₁");p.label(1,-.6,"S₂");p.label(.9,2.7,"f(x)");p.label(3.1,-3.65,"g(x)");p.save()
# Practice figures.
p=Plot("quartic-signed-area",(-2.5,3),(-3,5))
f=lambda x:.3*(x+1.5)**2*(x-1)*(x-29/11)
p.area(f,zero,0,1);p.area(f,zero,1,2,1);p.curve(f);p.line((2,0),(2,f(2)))
p.axes([1,2],above=(2,));p.label(1.6,4.3,"y=f(x)");p.save()
p=Plot("three-signed-regions",(-3.6,3.6),(-1.6,1.6))
f=lambda x:-cos(pi*x/2)
for a,b,k in [(-3,-1,0),(-1,1,1),(1,3,2)]:p.area(f,zero,a,b,k)
p.curve(f);p.axes([(-3,"a"),(-1,"b"),(1,"c"),(3,"d")],above=(-3,3))
for x,y,t in [(-2,.4,"S₁"),(-.4,-.5,"S₂"),(2,.4,"S₃")]:p.label(x,y,t)
p.save()
p=Plot("derivative-signed-area",(-.4,3.5),(-1.6,1.3))
f=lambda x:sin(pi*x) if x<=1 else -1.25*sin(pi*(x-1)/2)
p.area(f,zero,0,1);p.area(f,zero,1,3,1);p.curve(f);p.axes([1,3],above=(3,));p.label(.5,.35,"S₁");p.label(2,-.6,"S₂");p.label(2.5,1,"y=f′(x)");p.save()
p=Plot("cubic-quadratic-area",(-1.8,2.7),(-1,10))
f=lambda x:x**3-3*x+2;g=lambda x:-2*x*x+2*x+8
p.area(f,g,-1,2,1);p.curve(f);p.curve(g,ORANGE)
for x in [-1,2]:p.line((x,0),(x,f(x)),dash=True)
p.axes([-1,2]);p.label(.8,9.7,"y=−2x²+2x+8");p.label(2,8.7,"y=x³−3x+2",dx=-2,size=3.2);p.save()
p=Plot("cubic-line-axis",(-.5,2),(-.5,2.4))
f=lambda x:x**3;g=lambda x:-2*x+3
p.area(f,zero,0,1);p.area(g,zero,1,1.5);p.curve(f);p.curve(g,ORANGE);p.line((1,0),(1,1),dash=True);p.axes();p.save()
p=Plot("derivative-parabola",(-.4,1.8),(-3,2.8))
f=lambda x:6*x*x-8*x
p.curve(f);p.axes();p.label(4/3,0,"4/3",dx=4,dy=6);p.save()
p=Plot("parabola-line-two-regions",(-.6,3.6),(-1.5,3.8))
f=lambda x:x*x-3*x+2;g=lambda x:x-1
p.area(f,g,0,1);p.area(f,g,1,3,1);p.curve(f);p.curve(g,ORANGE);p.line((3,0),(3,2),dash=True)
p.axes([1,2,3]);p.label(.4,.5,"S₁");p.label(2.3,.8,"S₂");p.save()
p=Plot("cubic-line-two-regions",(-2.5,3.7),(-8,7),110,74)
f=lambda x:x**3-2*x*x-3*x+4;g=lambda x:2*x-2
p.area(f,g,-2,1);p.area(f,g,1,3,1);p.curve(f);p.curve(g,ORANGE);p.axes()
p.label(-.8,1.2,"S₁");p.label(2.3,-.5,"S₂");p.label(1.8,6.2,"y=2x−2");p.label(1.4,-6.8,"y=x³−2x²−3x+4",size=3.5);p.save()
p=Plot("derivative-three-roots",(-1.4,4.5),(-40,25),110,70)
f=lambda x:4*(x+1)*(x-1)*(x-4)
p.area(f,zero,-1,1);p.area(f,zero,1,4,1);p.curve(f,GREEN);p.axes([-1,1,4],above=(-1,4));p.label(-.4,7,"(A)");p.label(2.3,-15,"(B)");p.label(3,20,"y=f′(x)");p.save()
p=Plot("parabola-piecewise-area",(-.5,3.6),(-1.6,3.5))
f=lambda x:10*x/3-x*x;g=lambda x:-x if x<=1 else x-2
p.area(f,g,0,3,1);p.curve(f);p.curve(g,ORANGE);p.axes([1,3]);p.label(1.5,3.2,"y=(10/3)x−x²");p.save()
p=Plot("three-parabolas",(-.2,1.8),(-.3,4.3),100,78)
f=lambda x:x*x;g=lambda x:2*x*x;h=lambda x:32*x*x/9
p.area(f,g,0,1,0)
# Horizontal cap y=2 between steeper and middle parabolas.
p.area(h,g,0,.75,1);p.area(lambda x:2,g,.75,1,1)
p.curve(f);p.curve(g,ORANGE);p.curve(h,GREEN);p.line((0,2),(1,2));p.line((1,0),(1,2));p.axes()
p.label(1,2,"P",dx=3,dy=-1);p.label(1.5,3.1,"(P₁)");p.label(1.35,3.8,"(P₂)",dx=-4);p.label(.95,4,"(P₃)",dx=-5)
p.label(.5,.8,"H₂");p.label(.9,.9,"H₁");p.save()
p=Plot("two-parabolas",(-1.6,4.6),(-1,5.5))
f=lambda x:-.75*(x+1)*(x-4);g=lambda x:-.5*(x+1)*(x-4)
p.area(f,g,-1,4,1);p.curve(f);p.curve(g,ORANGE);p.axes([-1,4],[2,3],above=(-1,4))
p.label(1.5,5.2,"y=f(x)");p.label(2,2.1,"y=g(x)");p.save()
a=2.58095825401168
p=Plot("parabola-cap",(-3,3),(-.6,6.7),110,76)
f=lambda x:6-x*x;g=lambda x:a/6*(6-x*x)
p.area(f,lambda x:a,-sqrt(6-a),sqrt(6-a),1);p.area(g,zero,-sqrt(6),sqrt(6),0)
p.curve(f);p.curve(g,ORANGE);p.line((-3,a),(3,a));p.axes()
p.label(-sqrt(6),0,"−√6",dx=3,dy=5,anchor="start");p.label(-sqrt(6),0,"A",dx=-3,dy=-2,anchor="end")
p.label(sqrt(6),0,"√6",dx=-3,dy=5,anchor="end");p.label(sqrt(6),0,"B",dx=3,dy=-2,anchor="start");p.label(2.6,a,"y=a",dy=-2)
p.label(1,4.6,"(P₁)");p.label(1.3,1.1,"(P₂)");p.save()
print(len(list(OUT.glob("*.svg"))),"figures")
