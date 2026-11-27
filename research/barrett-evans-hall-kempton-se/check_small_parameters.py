"""Exact rational verification of the two-small-connectivities case."""
from fractions import Fraction as Q

def positive_definite(matrix):
    """Bareiss elimination; the successive pivots are leading minors."""
    prev = 1
    for j in range(len(matrix)):
        pivot = matrix[j][j]
        if pivot <= 0:
            return False
        for r in range(j+1, len(matrix)):
            for c in range(r, len(matrix)):
                value, rem = divmod(pivot*matrix[r][c] -
                                    matrix[r][j]*matrix[c][j], prev)
                assert not rem
                matrix[r][c] = matrix[c][r] = value
        prev = pivot
    return True

def beats(m, edges, q):
    """Test lambda_2 of an independent-cell blowup strictly above q."""
    n = sum(m)
    den, num = q.denominator, q.numerator
    degree = [0]*len(m)
    M = [[0]*len(m) for _ in m]
    for i, j in edges:
        if m[i] and m[j]:
            degree[i] += m[j]
            degree[j] += m[i]
            v = den*n*m[i]*m[j]
            M[i][i] += v
            M[j][j] += v
            M[i][j] -= v
            M[j][i] -= v
    active = [i for i,v in enumerate(m) if v]
    if any(m[i]>1 and den*degree[i] <= num for i in active):
        return False
    cells = active[:-1]
    return positive_definite([
        [M[i][j]+num*m[i]*m[j]-(num*n*m[i] if i==j else 0)
         for j in cells] for i in cells])

def graph(s,a,b,c,l):
    J=range(2,2+s)
    K=range(2+s,2+2*s)
    A0,A1,B,C=range(2+2*s,6+2*s)
    edges = [(0,i) for i in (1,B,C,*J)] + [(1,i) for i in (A0,A1,C,*K)]
    edges += [(B,A0),(B,A1)]
    if s==1:
        edges += [(J[0],A1),(K[0],B)]
    return [1]*(2+2*s)+[l if s==1 else 0,a-l if s==1 else a,b,c], edges

def screen(n):
    d=Q(n-2,n)
    fails=[]
    counts=[0]*4
    for s in range(1,(n-2)//2+1):
        total=n-2*s-2
        for a in range(total+1):
            for b in range(total-a+1):
                c=total-a-b
                for l in range((a if s==1 else max(a,b))+1):
                    X=Q(n,n+2)*(Q(s-1,3)+Q(l+1,l+3))
                    if X>=1: 
                        counts[0]+=1
                        continue
                    if X*X>=1/(6*d) and d*X+1/(6*X)>1:
                        counts[1]+=1
                        continue
                    q=(1-X)/d if (1+d)*X<=1 else 1-d*X
                    if Q(n,n+2+3*s*s+6*s*l)>q:
                        counts[2]+=1
                        continue
                    if beats(*graph(s,a,b,c,l),q):
                        counts[3]+=1
                        continue
                    fails.append((s,a,b,c,l,q))
    return counts,fails

def compositions(n,k):
    if k==1:
        yield [n]
    else:
        for a in range(n+1):
            for tail in compositions(n-a,k-1):
                yield [a,*tail]

def detailed_cases(s,a,b,c,l):
    """Count attachment patterns on A and B (s=2 or 3)."""
    r=1<<s
    for am in compositions(a,r):
        ap=[sum(w for mask,w in enumerate(am) if mask>>i&1) for i in range(s)]
        if max(ap)>l:
            continue
        for bm in compositions(b,r):
            bp=[sum(w for mask,w in enumerate(bm) if mask>>i&1) for i in range(s)]
            if max(ap+bp)!=l:
                continue
            if any(x and y for x,y in zip(ap,bp)):
                continue  # would augment through one matched pair
            m=[1]*(2+2*s)+am+bm+[c]
            J,K=range(2,2+s),range(2+s,2+2*s)
            A,B=range(2+2*s,2+2*s+r),range(2+2*s+r,2+2*s+2*r)
            C=len(m)-1
            edge=[(0,j) for j in (1,*B,C,*J)]+[(1,j) for j in (*A,C,*K)]
            edge.extend((i,j) for i in A for j in B)
            for mask,i in enumerate(A):
                edge.extend((i,j) for t,j in enumerate(J) if not(mask>>t&1))
            for mask,i in enumerate(B):
                edge.extend((i,j) for t,j in enumerate(K) if not(mask>>t&1))
            yield m,edge,am,bm

def final_check(n):
    counts, fails = screen(n)
    deep_count = special_count = 0
    for s,a,b,c,l,q in fails:
        if (n,s,a,b,c,l)==(11,1,7,0,0,7):
            # Cells u, v, the sole neighbor of v, and the eight common neighbors
            # of u and that sole neighbor. Internal edges of the last cell are
            # omitted in both comparators.
            m=[1,1,1,8]
            x,y=Q(7,10),Q(3,7)
            assert n*(x+y)-2*max(x,y)>n
            assert beats(m,[(1,2),(0,3),(2,3)],x)
            assert beats(m,[(0,1),(0,2),(1,3)],y)
            special_count += 1
        else:
            assert 2<=s<=3
            for m,e,_,_ in detailed_cases(s,a,b,c,l):
                deep_count+=1
                assert beats(m,e,q), (n,s,a,b,c,l)
    print(n, *counts, deep_count, special_count)

if __name__ == '__main__':
    for n in range(11,36):
        final_check(n)
