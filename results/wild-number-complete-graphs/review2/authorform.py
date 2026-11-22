"""Author's stated variant (E2 middle class counted with n colours, per REPORT/IMPROVEMENT table '<= n'):
check (*) exactly at the a values printed in IMPROVEMENT/ver.out, and that own coefficients <= these."""
from fractions import Fraction as Fr
import bounds
from bounds import coefs, W, par
A={155:Fr(567,500),157:Fr(1131,1000),159:Fr(141,125),161:Fr(2279,2000),163:Fr(2273,2000),165:Fr(2267,2000),167:Fr(2289,2000),
   169:Fr(2283,2000),171:Fr(569,500),173:Fr(1149,1000),175:Fr(2293,2000),177:Fr(1143,1000),179:Fr(2307,2000),181:Fr(2301,2000),
   183:Fr(1147,1000),185:Fr(1157,1000),187:Fr(2309,2000),189:Fr(2301,2000)}
own={n:coefs(n) for n in A}
orig=bounds.classes
def loose(n):
    cl=orig(n)
    for c in cl:
        if c['cnt'] in (n-10,n-15): c['cnt']=n
    return cl
bounds.classes=loose
ok=True
for n,a in A.items():
    co=coefs(n); w=W(co,a); good=w<=a-1; ok&=good
    dom=all(x>=y for x,y in zip(co,own[n]))
    print(n,'a=',a,'W=',f"{float(w):.6f}",'a-1=',float(a-1),'slack',f"{float(a-1-w):.6f}",'OK' if good else 'FAIL','loose>=own',dom)
print('ALL OK' if ok else 'SOME FAIL')
