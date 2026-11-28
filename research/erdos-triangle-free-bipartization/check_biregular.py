"""Exact dyadic interval check for the five-parameter inequality.

All endpoints are integers representing multiples of 2^-44.
Integer quotients are rounded outwards. It is a continuous parameter
certificate and does not enumerate graphs or restrict their order.
"""
Q = 1 << 44
def lo(n,d): return Q*n//d
def hi(n,d): return -(-Q*n//d)
def ml(a,b): return a*b//Q
def mh(a,b): return -(-a*b//Q)
def dl(a,b): return (a*Q)//b
def dh(a,b): return -(-a*Q//b)
E = hi(3197,20000)
TARGET = lo(1,25)-1

def cert(l,h):
    al,bl,xl,yl,zl=l
    ah,bh,xh,yh,zh=h
    cl=max(lo(1,3),Q-ah-bh,al,bl)
    ch=min(hi(3,5),Q-al-bl)
    if cl>ch or xl+yl+zl>E:
        return True
    ah=min(ah,ch); bh=min(bh,ch)
    xh=min(xh,E-yl-zl); yh=min(yh,E-xl-zl); zh=min(zh,E-xl-yl)
    ABh=mh(ah,bh)
    ACh=mh(ah,ch); BCh=mh(bh,ch)
    rl=dl(xl,ABh); sl=dl(yl,ACh); tl=dl(zl,BCh)
    if max(rl+sl, rl+tl, sl+tl)>Q:
        return True
    # The ordering y <= z is attained by swapping A and B.
    if yl>zh:
        return True
    assert rl < Q and sl+tl <= Q
    sl_hi=dh(yh,ml(al,cl)); tl_hi=dh(zh,ml(bl,cl))
    il=ml(yl,sl); jl=ml(zl,tl)
    ih=mh(yh,sl_hi); jh=mh(zh,tl_hi)
    u=yh+zh
    tlow, thigh = il+jl, ih+jh
    # Max of 2t-2t^2/u over the interval for t.
    if 2*tlow <= u <= 2*thigh:
        gain = (u+1)//2
    else:
        w = thigh if 2*thigh < u else tlow
        gain = 2*w - 2*(w*w//u)
    base = mh(xh,Q-sl-tl)
    cross= 8*dl(ml(ml(il,jl),dl(rl,Q-rl)),u)
    return base+gain-cross<=TARGET

def run():
    l0=(lo(1,5),lo(1,5),lo(1,25),lo(1,25),lo(1,25))
    h0=(hi(3,5),hi(3,5),hi(1597,20000),hi(1597,20000),hi(1597,20000))
    stack=[(l0,h0,0)]; n=0; maxd=0
    while stack:
        l,h,d=stack.pop()
        n+=1; maxd=max(d,maxd)
        assert d <= 40, (l,h)
        if cert(l,h): continue
        i=max(range(5),key=lambda i:(h[i]-l[i])*(1 if i<2 else 5))
        if n%1000000==0:print(n,maxd,d,len(stack),flush=True)
        m=(l[i]+h[i])//2
        assert l[i]<m<h[i], (l,h)
        stack.append((l, h[:i]+(m,)+h[i+1:],d+1))
        stack.append((l[:i]+(m,)+l[i+1:],h,d+1))
    print('verified',n,'boxes, max depth',maxd,flush=True)
if __name__=='__main__':run()
