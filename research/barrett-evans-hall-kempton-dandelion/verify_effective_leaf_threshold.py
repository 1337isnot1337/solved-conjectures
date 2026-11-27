"""Verify exact numerical comparisons used in EFFECTIVE-LEAF-THRESHOLD.md."""
from fractions import Fraction
Q=Fraction
q=lambda p: Q(str(p))
n=500
own=lambda k,x,m: Q(k)/(k-q(x))**2 < q(m)**2
opp=lambda k,x,m: Q(k)/(n-k-q(x))**2 < q(m)**2
assert 4*q(1.4)*q(.4)**2 < 1
assert q(.382)*Q(n,n-2)+Q(n,n-1) < q(1.4)
assert (3-2*q(.382))**2 < 5 # (3-sqrt(5))/2 < .382
assert own(9,1.4,.4) and q(.3)*Q(n-8,8*n)>q(.19)**2
assert own(30,.7,.19) and own(8,.7,.4) and own(71,.7,.12)
assert q(.6)/(Q(n*7,n-7)+Q(n*70,n-70))>q(.08)**2
assert own(160,1.4,.08)
assert opp(8,.7,.006) and opp(159,.7,.038)
assert opp(29,1.4,.012) and opp(7,1.4,.0054)
assert max(q(.006)/q(.19),q(.038)/q(.4))<=q(.095)
assert max(q(.012)/q(.4),q(.0054)/q(.08))+q(.4)<q(.47)
assert own(104,.47,q(.53)*q(.19)) and own(25,.47,q(.53)*q(.4))
assert opp(103,1.4,.026) and opp(24,1.4,.011)
assert 2-max((q(.012)+q(.026))/q(.4),(q(.0054)+q(.011))/q(.08))>q(1.4)
assert (2-q(.47))*(1-q(.47)/2)>q(1.095)
assert opp(1,1.4,.0021) and q(.4)+q(.0021)/q(.08)<q(.427)
assert (2-q(.33))*(1-q(.33))>q(1.095)
assert 1-q(.095)/q(.53)>q(.427)
assert q(.93)*q(.08)-q(.0021)>q(.072)
assert own(10,1.07,q(.93)*q(.4)-q(.0021)) and own(197,1.07,.072)
assert opp(9,.7,.007) and opp(196,.7,.047)
assert (3-q(.427))*(1-q(.427))>q(1.47)
assert 1+max((q(.006)+q(.007))/q(.19),(q(.038)+q(.047))/q(.4))<q(1.22)
for h,b in [(.4,.026),(.08,.011)]:
    assert (q(1.93)*q(.93)-1)*q(h)>q(.0021)*(1+q(1.93))+q(b)
print("Exact threshold comparisons passed.")
