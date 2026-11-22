import sys,random,time,numpy as np,n1f,fast
lo,hi=int(sys.argv[1]),int(sys.argv[2]); per=int(sys.argv[3])
rng=np.random.default_rng(11)
for n in range(lo,hi+1,2):
    fams=[('cyc',n1f.cyclic(n))]
    if n%6 in (1,3): fams.append(('sts',n1f.steiner(n,random.Random(n))))
    k=(n+1).bit_length()-1
    if 2**k==n+1: fams.append(('aff',n1f.affine_minus(k)))
    for s in range(per):
        rnd=random.Random(1000*n+s)
        col=n1f.one_factorization(n+1,rnd,switches=10*(n+1)**2)
        fams.append(('kempe%d'%s,n1f.near_from_1f(col)))
    res=[]
    for name,L in fams:
        n1f.check(L); inst=fast.Inst(L); k,lab=fast.find(inst,rng)
        assert k is not None
        res.append('%s:%d'%(name,k))
    print(n,' '.join(res),flush=True)
