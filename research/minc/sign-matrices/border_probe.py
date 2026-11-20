from fractions import Fraction
from itertools import product

def permanent(a):
    n=len(a); dp=[0]*(1<<n); dp[0]=1
    for mask in range(1,1<<n):
        i=mask.bit_count()-1; m=mask; v=0
        while m:
            b=m & -m; j=b.bit_length()-1; v+=a[i][j]*dp[mask^b]; m^=b
        dp[mask]=v
    return dp[-1]

def determinant(a):
    a=[list(map(Fraction,r)) for r in a]; n=len(a); d=Fraction(1)
    for i in range(n):
        p=next((j for j in range(i,n) if a[j][i]),None)
        if p is None:return 0
        if p!=i:a[p],a[i]=a[i],a[p]; d=-d
        v=a[i][i]; d*=v
        for j in range(i+1,n):
            t=a[j][i]/v
            for k in range(i+1,n):a[j][k]-=t*a[i][k]
    assert d.denominator==1
    return d.numerator

def toeplitz(n,s):return [[-1 if j-i in s else 1 for j in range(n)] for i in range(n)]

if __name__=='__main__':
    data={5:range(1,5),6:range(1,5),8:{1,4,5,6},9:{0,1,2,6,7},10:{1,2,3,4,5,8,9},11:{0,1,2,3,7},12:{1,2,3,4,5,6,8},13:{*range(-10,3),6,7}}
    for n,s in data.items():
        a=toeplitz(n,s); p=permanent(a); d=determinant(a)
        print('n',n,'per',p,'det',d,flush=True)
        for r in range(min(n,3)):
            qs=[]
            for i in range(n):
                if i==r:qs.append(0);continue
                b=[list(x) for x in a];b[i]=list(a[r]);qs.append(permanent(b))
            qnorm=[str(Fraction(q,p)) for q in qs]
            target=2*p; sols=[]
            for u in product([-1,1],repeat=n-1):
                v=list(u);v.insert(r,1)
                if sum(x*y for x,y in zip(v,qs))==target:
                    sols.append(v)
                    break
            print(' row',r,'q/per',qnorm,'extension',sols[:1],flush=True)
