import sympy as s
cs=[363,135,4,884,208,980,872,4,1,895,281,189,8,990,274,337,347,74,211,42]
co=[1]
for v in cs:
 v=s.Rational(v,1000)
 co=[co[0]]+[co[k]-v*co[k-1] for k in range(1,len(co))]+[-v*co[-1]]
mo=[sum(co[k]*s.Integer(k)**j for k in range(len(co))) for j in range(13)]
for n in range(1,8):
 d=s.det(s.Matrix([[mo[i+j] for j in range(n)] for i in range(n)]))
 print(n,s.sign(d),s.N(d,12),flush=True)
 if n==7: print('numerator',s.numer(d),'denominator',s.denom(d))
