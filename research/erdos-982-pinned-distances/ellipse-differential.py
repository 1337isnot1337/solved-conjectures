import sympy as S
t,y,z,p=S.symbols('t y z p')
P=y*z; F=P*(2*p-2*P)*t**2+(P**2-1)*(y+z)*t+P*(2-2*p*P)
ft,fy,fz=[S.diff(F,k) for k in (t,y,z)]
# H=D_y D_z(log(fy/fz)), written as two log derivatives.
def test(Y,Z):
    X=S.cancel(2*p/(Y+Z))
    sub={t:X,y:Y,z:Z}
    def ev(G): return S.factor(G.subs(sub,simultaneous=True))
    A,B,C=map(ev,(ft,fy,fz))
    ty,tz=-B/A,-C/A
    tyz=-(ev(S.diff(F,y,z))+ev(S.diff(F,t,y))*tz+ev(S.diff(F,t,z))*ty+ev(S.diff(F,t,2))*ty*tz)/A
    def h(G,V):
        gy=ev(S.diff(G,y))+ev(S.diff(G,t))*ty
        gz=ev(S.diff(G,z))+ev(S.diff(G,t))*tz
        gyz=ev(S.diff(G,y,z))+ev(S.diff(G,t,y))*tz+ev(S.diff(G,t,z))*ty+ev(S.diff(G,t,2))*ty*tz+ev(S.diff(G,t))*tyz
        return gyz/V-gy*gz/V**2
    print('sample',Y,Z,'F=',ev(F))
    print('partials',A,B,C)
    print('mixed',S.factor(h(fy,B)-h(fz,C)))
test(p,1)
test(p/2,2)
A=8*p**11-3*p**10-339*p**9-573*p**8-520*p**7-404*p**6-418*p**5-408*p**4-272*p**3-113*p**2-27*p-3
B=128*p**15-1820*p**14-79359*p**13+500452*p**12-1238447*p**11-616156*p**10+1129936*p**9+4340468*p**8+1319168*p**7-5877760*p**6-5439488*p**5+432128*p**4+4915200*p**3+1835008*p**2-786432
m1=A*(p**3-2*p**2-2*p-1)
m2=(p-4)*B*(12*p**2-17*p-4)*(p**4-12*p**3+4*p+16)
for q in [3,5,7,11,13,17,19,23]:
 print(q,S.gcd(S.Poly(m1,p,modulus=q),S.Poly(m2,p,modulus=q)))
print('gcd',S.gcd(m1,m2))
u,v=S.Poly(m2,p,modulus=17),S.Poly(m1,p,modulus=17)
while not v.is_zero:
 print('mod 17 remainder',v.degree(),v.LC())
 u,v=v,u.rem(v)

# Rectangular hyperbola p=0.
source_point_p0 = {p:0,t:(9+S.sqrt(209))/16,y:1,z:2}
Dt=lambda H,u: S.diff(H,u)-S.diff(F,u)/ft*S.diff(H,t)
H=Dt(Dt(fy,z)/fy-Dt(fz,z)/fz,y)
assert S.simplify(F.subs(source_point_p0)) == 0
print("p=0", [S.simplify(G.subs(source_point_p0)) for G in (ft,fy,fz,H)])
