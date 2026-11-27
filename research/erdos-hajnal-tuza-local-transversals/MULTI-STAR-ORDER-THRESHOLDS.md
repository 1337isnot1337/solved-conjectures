# Arithmetic obstructions and constructions at multi-star slack

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This analyzes sharpness of the abstract petal order bound
at and beyond the integer star thresholds. It does not
construct examples of the original hypergraph problem.

Use the same abstract size and overlap axioms as in
[Strict slack order gap](STRICT-SLACK-ORDER-GAP.md), but
without its small-slack restriction. For fixed integers
\(s\ge2\) and \(\delta\ge3s\), set
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
is not an integer. Conversely, if \(\lambda=3(k-1)/s\) is an integer,
then at \(\delta=3s(k-1)=\lambda s^2\) the constant
\(L_k=3/(sk)\) **is attained asymptotically** for all
large \(t\) by abstract petals. An affine geometry gives
an explicit subsequence when \(k\) is a prime power;
Wilson's design theorem gives the full conclusion.

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

## 3. Remove the prime-power and size restrictions using designs

For any fixed integer \(k\ge2\) and compatible integer
\(\lambda=3(k-1)/s\), choose
\(m'\ge m\) with \(m'=m+O_k(1)\) and
\(m'\equiv1\pmod{k(k-1)}\).
[Wilson's design existence theorem](https://doi.org/10.1016/0097-3165(75)90067-9)
gives a \(2\)-design with blocks of size \(k\) and
pair multiplicity \(\lambda\) on \(m'\) points for
all sufficiently large \(m'\): both necessary
divisibilities follow from the chosen congruence.
Use its blocks in place of the copied affine lines,
but restrict the cut labels to any \(m\) points of
the design. Each index belongs to
\(R'=\lambda(m'-1)/(k-1)\) blocks. For an \(s\)-cut,
the block petal has at least \(sR'-\lambda\binom s2\)
points. As before, add \(O(1)\) private points per
index if needed to bring this size to at least \(p\).
Then trim every petal independently to exactly \(p\)
points. Trimming can only decrease overlaps.

There are \(\lambda m'(m'-1)/(k(k-1))\) design blocks,
and the padding adds only \(O(m)\) points.
The same size asymptotic follows for every sufficiently
large \(m=t+s\), with no prime-power condition.
Combined with the strict-gap criterion, this classifies
attainment of the **abstract** affine constant at every
integer star threshold: it is attained exactly when
\(\delta/s^2=3(k-1)/s\) is an integer. This does not
classify the real local-transversal examples.

## 4. Mixing adjacent block sizes and the full singleton answer

There is also an attaining construction between integer star
thresholds when the following design indices are integers.
Suppose \(\lambda=\delta/s^2\) is an integer, \(k=\lfloor
1+\delta/(3s)\rfloor\ge2\), and \(s\mid 3k(k-1)\).
Set
\[
\lambda_1=(k-1)(3k/s-\lambda),\qquad
\lambda_2=k(\lambda-3(k-1)/s).
\]
They are nonnegative integers, \(\lambda_1+\lambda_2=\lambda\),
and \(\lambda_1/(k-1)+\lambda_2/k=3/s\).
Choose \(m'=m+O_k(1)\) satisfying the simultaneous Wilson
congruences for block sizes \(k,k+1\), and use the union
of the two designs with indices \(\lambda_1,\lambda_2\)
(omit a design with index zero). Each label lies in exactly
\(3(m'-1)/s\) blocks, and each label pair in exactly
\(\lambda\) blocks. Using these blocks as the petal points,
then padding and trimming as in §3, gives the desired
sizes and overlap cap. The leading number of points is
\[
\frac{\lambda_1}{k(k-1)}
+\frac{\lambda_2}{k(k+1)}
=\frac{6k/s-\delta/s^2}{k(k+1)}
=L_k
\]
times \(t^2\). Thus the affine order bound is sharp
in this additional compatible range.

For \(s=1\), the divisibility condition is automatic.
For every fixed integer \(\delta\ge3\), write
\(\delta=3(k-1)+r\), \(0\le r<3\). The two indices
simplify to \((k-1)(3-r)\) and \(kr\), so the abstract
singleton-petal leading constant is exactly
\[
\frac{3-r}{k}+\frac{r}{k+1}.
\]
For \(0\le\delta\le3\), the elementary pair-point
construction in [the affine order note](SHARPER-SLACK-PETAL-ORDER.md)
gives its exact finite optimum as well.
Hence the abstract singleton-petal order has now
been determined to leading order for every fixed
slack, with no compatibility assumed between
different minimum pairs in an actual hypergraph.

At \(s=1\) the same value is exact at finite admissible
orders once the designs exist. For any exterior vertex of
multiplicity \(d\) in the \(m=t+1\) singleton petals,
\(\binom d2\ge kd-\binom{k+1}2\), with equality for
\(d=k,k+1\). Summing and using \(\sum d\ge3tm\) and
\(\sum\binom d2\le\delta\binom m2\) gives the finite bound
\[
n_{\rm out}\ge
mt\frac{6k-\delta}{k(k+1)}.
\]
If \(m\) itself meets the simultaneous congruences of
the two designs in §4, no index enlargement is needed;
the untrimmed union of their blocks attains the bound
since each index lies in exactly \(3t\) blocks and
each pair in exactly \(\delta\). In particular every
fixed \(\delta\) has infinitely many exact orders of
this form.
