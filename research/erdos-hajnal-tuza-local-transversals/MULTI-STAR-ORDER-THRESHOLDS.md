# Arithmetic obstructions and constructions at multi-star slack

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This analyzes sharpness of the abstract petal order bound
at and beyond the integer star thresholds. It does not
construct examples of the original hypergraph problem.

Keep the abstract hypotheses in
[Strict slack order gap](STRICT-SLACK-ORDER-GAP.md).
For fixed \(s,\delta\), set
\[
a_*=1+\frac{\delta}{3s},\qquad
k=\lfloor a_*\rfloor,\qquad
L_k=\frac{6k/s-\delta/s^2}{k(k+1)}.
\]
When \(k\ge2\), the affine lower constant \(L_k\)
is strictly unattainable if
\[
k(k-1)L_k>\left\lfloor\frac{\delta}{s^2}\right\rfloor.
\]
In particular, at an integer threshold \(a_*=k\ge2\)
it is strictly unattainable whenever \(3(k-1)/s\)
is not an integer. Conversely, if \(k\) is a prime
power and \(\lambda=3(k-1)/s\) is an integer, then
at \(\delta=3s(k-1)=\lambda s^2\) the constant
\(L_k=3/(sk)\) **is attained asymptotically** along
a sequence by abstract petals.

## 1. A weighted graph obstruction

Suppose \(n/t^2\to L_k\). The near-equality argument
in [Strict slack order gap](STRICT-SLACK-ORDER-GAP.md)
shows that all but \(o(n)\) exterior points have
normalized cut mass \(a_v\in[k-o(1),k+1+o(1)]\)
and heavy-coordinate square sum within \(o(1)\)
of the maximum under that mass and coordinate cap 1.
In fact the \(k\) largest coordinate degrees inside
each such support are \(1-o(1)\) after normalization
by \(M=\binom{m-1}{s-1}\). If the \(k\)-th largest
were at most \(1-\gamma\) for some fixed \(\gamma>0\),
the total heavy mass would be at least \(k-o(1)\)
by its square-sum lower bound, so the entries after
the first \(k\) would have mass at least
\(\gamma-o(1)\). Transfer \(\gamma/2\) of that
mass to the \(k\)-th entry. The cap is preserved,
and the sum of squares increases by at least the
square of the transferred mass because every donor
was no larger. This contradicts near-maximality.

Give each good vertex a designated \(k\)-set of
almost-full star centers. Weight the pair \(xy\)
by the number of good vertices whose designated
set contains \(x,y\). Each weight is at most
\(\delta\): otherwise choose disjoint cuts containing
\(x\) and \(y\), respectively, supported by all
\(\delta+1\) assigned points, possible since only
\(o(M)\) members of either star are missing.
The average weight is
\[
\frac{\binom k2(n-o(n))}{\binom m2}
= k(k-1)L_k+o(1).
\]
Thus if it exceeds \(j=\lfloor\delta/s^2\rfloor\)
by a fixed positive amount, the graph of pairs of
weight at least \(j+1\) has positive density.

There are then \(\Omega(m^{2s})\) complete ordered
cross pairs of disjoint \(s\)-cuts in this graph,
by the common-neighbor count in the strict-gap note.
For every graph edge choose \(j+1\) different good
points assigned to it. As before, \(o(m^{2s})\) of
the cross pairs fail to support any chosen point:
per indicated edge and point, there are \(o(M)\)
choices of one cut missing it and \(O(M)\) choices
of the other. Also \(O(m^{2s-1})\) cross pairs contain
three designated centers of one good point. Indeed
there are \(O(m^2)\) points and \(O(1)\) triples per
designated set, and a fixed triple fits in only
\(O(m^{2s-3})\) cross pairs. Excluding those cross
pairs ensures that the same good point cannot be
counted at two different cross edges.
A remaining pair of cuts therefore has at least
\((j+1)s^2>\delta\) common points, a contradiction.

At \(a_*=k\), the average weight in the criterion
is \(k(k-1)L_k=3(k-1)/s=\delta/s^2\).
Thus a noninteger value gives the stated gap.

## 2. An affine construction at compatible integer thresholds

Suppose \(k\) is a prime power and \(\lambda=3(k-1)/s\)
is an integer. Use \(m=k^d\) indices, the points of
the vector space \(\mathbb F_k^d\), and take \(t=m-s\).
Every affine line contains \(k\) points; every pair of
different indices lies on one affine line.
Use \(\lambda\) labeled copies of each line as
distinct exterior points. For cut \(S\), take all
line points whose lines meet \(S\). If \(S,T\) are
disjoint, a line meeting both contains at least one
cross pair \(xy\) with \(x\in S,y\in T\); hence at most
\(\lambda s^2=\delta\) line points are in both petals.

Each index belongs to \(R=\lambda(m-1)/(k-1)\)
line copies. The line-point petal size lies between
\(sR-\lambda\binom s2\) and \(sR\), by the pairwise
union bound. We have \(sR=3(m-1)=p+s-1\).
If necessary, give every index an independent pool
of \(b\) private points, with \(b\) the least
nonnegative integer such that
\(sR-\lambda\binom s2+sb\ge p\), and add the
\(s\) corresponding pools to each petal.
There are only \(O(m)\) extra vertices.
With padding, the petal sizes lie between \(p\)
and \(p+\delta\): if \(b>0\) the overshoot above
\(p\) is at most \(\lambda\binom s2+s-1\le\delta\);
if \(b=0\) it is at most \(s-1\).
The padding does not create overlap between disjoint cuts.

The total number of line points is
\(\lambda m(m-1)/(k(k-1))\), by counting pairs on
lines. Together with padding this is
\((3/(sk)+o(1))t^2\), as claimed.
