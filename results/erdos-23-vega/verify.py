"""Exact scalar checks for the Vega written proof; no graph enumeration."""
from fractions import Fraction as F

b,e0 = F(".0399"),F(".16")
tau = (11*b-F(1,4)-e0)/6
r = 18*tau
target = 98*b-22*e0
t0 = F(".138")
assert tau == F(289,60000)
assert r == F(867,10000)
assert target == F(1951,5000)
assert t0*t0 < 4*tau and -1+5*r < 0
assert (1-2*r-t0)**2+5*r*t0-30*tau == F(".38949296") < target
assert (F(1,2)-r)**2/4+r*(F(1,2)-2*r)/2 < F(".057")
assert F(1,4)+5*F(".057")-35*tau == F(4397,12000) < target
heavy = lambda c: F("3.33")*c*c-F("2.5")*c+F(".71675")
assert max(heavy(F(".17")),heavy(F(".5"))) == F(".387987") < target
assert F("2.48")*F(".17")**2+F("18.5")*e0-F("77.5")*b == F("-.060578") < target
assert F(1,44)+F(".19")/11 == F(1,25)
assert F(".15985")+F(".0001") < e0
print("Vega scalar comparisons verified in exact rational arithmetic.")
