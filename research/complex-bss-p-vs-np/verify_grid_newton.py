#!/usr/bin/env python3
"""Exact finite checks of grid congruence and padding, not the general theorem."""
def rank_mod3(a):
    n = len(a)
    k = 0
    for col in range(n):
        p = next((i for i in range(k,n) if a[i][col]%3),None)
        if p is None:
            continue
        a[k],a[p]=a[p],a[k]
        inv=1 if a[k][col]%3==1 else 2
        a[k]=[(inv*x)%3 for x in a[k]]
        for i in range(n):
            if i!=k and a[i][col]%3:
                factor=a[i][col]%3
                a[i]=[(x-factor*y)%3 for x,y in zip(a[i],a[k])]
        k+=1
    return k

def kernel_dim(m):
    n=m*m
    a=[[0]*n for _ in range(n)]
    for i in range(m):
        for j in range(m):
            for p,q in ((i,j),((i-1)%m,j),(i,(j-1)%m)):
                a[i*m+j][p*m+q]+=1
    return n-rank_mod3(a)

def sqcoeff(e,c1,c2):
    return e*c2+e*(e-1)//2*c1*c1

if __name__=="__main__":
    for m in (3,4,5,7,10):
        dim=kernel_dim(m)
        print("grid",m,"kernel dimension",dim)
        if m in (4,10): assert dim==1
    for c1 in (-3,-2,-1,1,2,3):
        for c2 in range(-20,21):
            for e in (1,2,4,8,16,32):
                if sqcoeff(e,c1,c2)==0:
                    assert sqcoeff(2*e,c1,c2)==e*e*c1*c1
    print("padding cancellation tests passed")
