"""Exact constant checks for the finite-exception reduction.
The accompanying proof, not these checks, covers all sufficiently large degrees.
"""
from fractions import Fraction as Q
D=100000
rho=Q(21,20)
c2=Q(5,4)
assert c2>rho**4
assert c2*Q(19,20)**2>rho**2
assert c2**14>20
# e>8/3 follows from its positive power series.
assert Q(8,3)**5>129
assert Q(8,3)**7>400
assert Q(8,3)**18>400*D
assert Q(128,5)-1>20
j=D//2
assert j*(j-1)>=800*(2*j+2)
assert 2*j-1>=1600
# Critical point enclosures for the elementary logarithmic inequality.
assert Q(3161,1000)**2<10<Q(3163,1000)**2
assert (4-Q(3163,1000))/3>=Q(279,1000)
assert (4-Q(3161,1000))/3<=Q(280,1000)
assert (4+Q(3161,1000))/3>=Q(2387,1000)
assert (4+Q(3163,1000))/3<=Q(2388,1000)
z=Q(9,16)
assert 2*sum(z**(2*i+1)/Q(2*i+1) for i in range(3))>Q(5,4)
assert 2*Q(279,1721)>Q(8,25)
assert Q(279,1000)+Q(2,3)*Q(5,4)+Q(8,25)>Q(7,5)
x=Q(9,10)
assert 1+x+x*x/2+x*x*x/6>Q(597,250)
x=Q(7,20)
assert 1+x+x*x/2>Q(347,250)
assert Q(2387,1000)-Q(2,3)*Q(9,10)-Q(7,20)>Q(7,5)
# Reciprocal-root mean and final rounding.
assert Q(10,3)*Q(943,D)<Q(1,20)
assert Q(26,D)<Q(3,4)-Q(20,27)
print("All exact constant inequalities passed.")
