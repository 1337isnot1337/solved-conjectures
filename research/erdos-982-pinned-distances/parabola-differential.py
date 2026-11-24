import sympy as s
x,y,z=s.symbols('x y z')
F=(y+z)*(y*y+z*z-2*x*x+1)-2*x
Fx,Fy,Fz=[s.diff(F,t) for t in (x,y,z)]
D=lambda H,t:s.diff(H,t)-s.diff(F,t)/Fx*s.diff(H,x)
A=D(Fy,z)/Fy-D(Fz,z)/Fz
H=D(A,y)
P={x:(s.sqrt(5)-1)/2,y:1,z:0}
print('partials',*[s.simplify(f.subs(P)) for f in (Fx,Fy,Fz)])
print('mixed',s.simplify(H.subs(P)),s.N(H.subs(P)))
P={x:0,y:3*s.I/5,z:4*s.I/5}
print('complex sample',s.simplify(H.subs(P)),*[s.simplify(f.subs(P)) for f in (Fx,Fy,Fz)])
