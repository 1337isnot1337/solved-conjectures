"""Exact sign certificate over Q(sqrt(3)) for the support-three limit."""
from math import comb
from sympy import QQ, sqrt
from sympy.polys.rings import ring

K = QQ.algebraic_field(sqrt(3))
r = K.from_sympy(sqrt(3))
R, U, V = ring('U,V', K)
u, v = (2-r)*U, (2-r)*V
du, dv = 1+u*u, 1+v*v
d = du*dv
cu, cv, su, sv = 1-u*u, 1-v*v, 2*u, 2*v
c, s = cu*cv+su*sv, su*cv-cu*sv
C = [(r*c-s)/2, (r*cu+su)*dv/2, cv*du]
S = [(c+r*s)/2, (cu-r*su)*dv/2, sv*du]
X = [(r*ci+si)/2 for ci,si in zip(C,S)]
Y = [X[i]*d + (C[(i+1)%3]*C[(i+2)%3]+S[(i+1)%3]*S[(i+2)%3])/r
     for i in range(3)]
Z = [a*b for a,b in zip(X,Y)]
E = sum(Z)
P = (d+2*C[0])**2*(d+2*C[1])**2*(d+2*C[2])**2
Q = 96*(d+C[0])*(d+C[1])*(d+C[2])
F = 18*d**3*P*Q - 4*Q**2*sum((3*z-E)**2 for z in Z) - 3*(3*P-Q*E)**2
assert (F.degree(U),F.degree(V),len(F)) == (24,24,611)


def sign_quad(a):
    coeff = a.to_list()
    if not coeff:
        return 0
    if len(coeff)==1:
        return 1 if coeff[0]>0 else -1
    b,c = coeff
    return (1 if b>0 else -1) if c==0 or b*c>0 or 3*b*b>c*c else (1 if c>0 else -1)


n = 24
w = [[K.convert(QQ(comb(i,k),comb(n,k))) for k in range(i+1)] for i in range(n+1)]
A = [[F.get((i,j),K.zero) for j in range(n+1)] for i in range(n+1)]
B = [[sum((w[i][k]*A[k][j] for k in range(i+1)),K.zero) for j in range(n+1)] for i in range(n+1)]
Sg = [[sign_quad(sum((w[j][k]*B[i][k] for k in range(j+1)),K.zero))
       for j in range(n+1)] for i in range(n+1)]
assert min(map(min,Sg)) == 0
assert [(i,j) for i in range(n+1) for j in range(n+1) if Sg[i][j]==0] == [
    (0,0),(0,24),(1,0),(24,23),(24,24)]
print('Morley boundary: all 625 Bernstein coefficients nonnegative; 620 positive')
