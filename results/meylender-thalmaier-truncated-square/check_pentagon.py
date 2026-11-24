from fractions import Fraction as F
def cross(a,b,c):
 return (b[0]-a[0])*(c[1]-a[1])-(b[1]-a[1])*(c[0]-a[0])
def hull(P):
 P=sorted(set(P))
 def half(P):
  H=[]
  for p in P:
   while len(H)>1 and cross(H[-2],H[-1],p)<=0: H.pop()
   H.append(p)
  return H[:-1]
 return half(P)+half(P[::-1])
def area(P):
 return sum(x[0]*y[1]-x[1]*y[0] for x,y in zip(P,P[1:]+P[:1]))/2
A,B=F(90,91),F(10,91)
a,b=F(1,10),F(9,10)
L=a+b-a*b
Hm=(F(-2,3),F(1,25));Hp=(Hm[0]+1,Hm[1])
Vm=(F(-1,9),F(-7,15));Vp=(Vm[0],Vm[1]+1)
Tp=(F(-3,5),F(-1,50))
Tm=(F(1,3),F(1,25))
Sx=[Hm,Hp]; Sy=[Vm,Vp]
Tplus=[Tp,(Tp[0]+A,Tp[1]),(Tp[0],Tp[1]+B)]
Tminus=[Tm,(Tm[0]-A,Tm[1]),(Tm[0],Tm[1]-B)]
K=hull(Sx+Sy+Tplus+Tminus)
alpha,beta,gamma=1-A,1-B,A+B-1
pr0=1+(alpha*alpha+beta*beta)*gamma*gamma/(1-alpha*alpha-beta*beta-gamma*gamma)
Qarea=1-a*b/2
print('L',L,'alpha,beta,gamma',alpha,beta,gamma)
print('hull',K)
print('area',area(K),float(area(K)), 'ratio denominator',2*Qarea*area(K),float(2*Qarea*area(K)),'source K0 ratio denominator',pr0,float(pr0))
print('diff',pr0-2*Qarea*area(K))
for p in Sx+Sy+Tplus+Tminus:
 print(tuple(map(str,p)),min(cross(x,y,p) for x,y in zip(K,K[1:]+K[:1])))
assert L == F(91,100)
assert len(K) == 5
assert area(K) == F(1092843,2070250)
assert max(y for _,y in K)-min(y for _,y in K) == 1
assert (alpha,beta,gamma) == (F(1,91),F(81,91),F(9,91))
assert pr0 == F(783100,753571)
rat = 2*Qarea*area(K)
assert rat == F(208733013,207025000)
assert 1 < rat < pr0
assert pr0-rat == F(582795817,18839275000)
