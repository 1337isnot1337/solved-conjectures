"""Integer interval certificate for eventual Lassalle first-entry log-concavity."""
from fractions import Fraction
from math import factorial
from functools import lru_cache

P=1<<50
K=14
N=108
ERROR=(P+10**6-1)//10**6
RLO=Fraction(367049266052,10**11)
RHI=Fraction(367049266055,10**11)

def rat(q):
    q=Fraction(q)
    x=q.numerator*P; y=q.denominator
    return x//y, -((-x)//y)

def imul(a,b):
    x=a[0]*b[0]; y=a[0]*b[1]; z=a[1]*b[0]; w=a[1]*b[1]
    return min(x,y,z,w)//P, -((-max(x,y,z,w))//P)

def scl(a,k):
    return (a[0]*k,a[1]*k) if k>=0 else (a[1]*k,a[0]*k)

def plus(a,b):return a[0]+b[0],a[1]+b[1]
def nonneg(a):return max(0,a[0]),max(0,a[1])
def divpos(a,b):
    assert b[0]>0 and a[0]>=0
    return a[0]*P//b[1], -((-a[1]*P)//b[0])

coeff=[]
for i in range(K+1):
    for j in range(K+1-i):
        fi=factorial(i)*factorial(i+1)*factorial(j)*factorial(j+1)
        c=(rat(RLO**(i+j)/fi)[0],rat(RHI**(i+j)/fi)[1])
        coeff.append((2*i,2*j,scl(c,(-1)**(i+j))))

def evaluate(t,z,d,b):
    xp=[(P,P)]; yp=[(P,P)]; dp=[(P,P)]
    for k in range(2*K):
        xp.append(imul(xp[-1],nonneg((t[0]-(b+k)*z[1],t[1]-(b+k)*z[0]))))
        yp.append(imul(yp[-1],nonneg((P-t[1]-(d-b+k)*z[1],P-t[0]-(d-b+k)*z[0]))))
        dp.append(imul(dp[-1],(P-(d+k)*z[1],P-(d+k)*z[0])))
    @lru_cache(None)
    def T(i,j):
        return divpos(imul(xp[i],yp[j]),dp[i+j])
    out=(0,0)
    for i,j,k in coeff:
        if d==0: term=T(i,j)
        elif d==1:
            term=plus(scl(T(i-1,j),i) if i else (0,0),
                      scl(T(i,j-1),-j) if j else (0,0))
        else:
            term=plus(scl(T(i-2,j),i*(i-1)) if i>1 else (0,0),
                      scl(T(i-1,j-1),-2*i*j) if i and j else (0,0))
            if j>1:term=plus(term,scl(T(i,j-2),j*(j-1)))
        out=plus(out,imul(k,term))
    return out[0]-ERROR, out[1]+ERROR

def passes(t,z):
    q=evaluate(t,z,0,0)
    f0=evaluate(t,z,1,0); f1=evaluate(t,z,1,1)
    g=evaluate(t,z,2,1)
    # n^2 (q^2-q_- q_+)=f0*f1-q*g/(1-1/n).
    positive=imul(imul(f0,f1),(P-z[1],P-z[0]))
    return positive[0]>imul(q,g)[1]

def verify_boxes():
    todo=[((0,P//2),(0,rat(Fraction(1,N))[1]),0)]
    count=0; maxdepth=0
    while todo:
        t,z,depth=todo.pop()
        if passes(t,z):
            count+=1; maxdepth=max(maxdepth,depth)
            continue
        assert depth<=25, (t,z)
        if t[1]-t[0]>=4*(z[1]-z[0]):
            mid=(t[0]+t[1])//2
            todo.extend([((t[0],mid),z,depth+1),((mid,t[1]),z,depth+1)])
        else:
            mid=(z[0]+z[1])//2
            todo.extend([(t,(z[0],mid),depth+1),(t,(mid,z[1]),depth+1)])
    print(f'PASS: {count} exact interval boxes, maximum depth {maxdepth}',flush=True)

def validate_assumptions():
    f=lambda x,m: (-x)**m/(factorial(m)*factorial(m+1))
    # Alternating sums of odd and even order give lower and upper bounds respectively.
    assert sum(f(RLO,m) for m in range(22))>0
    assert sum(f(RHI,m) for m in range(21))<0
    assert RHI<Fraction(3671,1000)
    assert RHI/2-1<Fraction(84,100)
    assert RHI**2/12-1<Fraction(36,100)**2
    F=[abs(f(RHI,m)) for m in range(16)]
    W=[max(1,(2*m)**2)*sum(F[i]*F[m-i] for i in range(m+1))
       for m in range(16)]
    assert 2*RHI/(8*9)*Fraction(16,15)**2<Fraction(1,8)
    assert W[15]*Fraction(8,7)+sum(W[:15])*Fraction(32,2**40)<Fraction(1,10**6)

def verify_small():
    from math import comb
    limit=N//2
    C=[(-1)**k*comb(2*k,k)//(k+1) for k in range(limit)]
    U=[1]
    for k in range(1,limit):
        U.append(-sum(comb(2*k,2*i)*C[i]*U[k-i] for i in range(1,k+1)))
        n=2*k
        row=[sum(comb(a,2*i)*comb(n-a,2*j)*C[i]*C[j]*U[k-i-j]
                 for i in range(a//2+1) for j in range((n-a)//2+1))
             for a in range(n+1)]
        assert row[0]==row[-1]==0 and min(row[1:-1])>0
        assert all(row[a]**2>row[a-1]*row[a+1] for a in range(1,n)),k
    print(f'PASS: exact strict positive-support inequalities for 1 <= k < {limit}')

if __name__=='__main__':
    validate_assumptions()
    verify_small()
    verify_boxes()
