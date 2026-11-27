# A strict gap above the affine petal-order bound

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The improved affine counting bound is itself not sharp when
the permitted exterior overlap is smaller than the cut size.
This obstruction already follows from the abstract petal axioms,
without using compatibility between different minimum pairs.

## Statement

Fix integers \(s\ge2\) and \(1\le\delta<s\).
Let \(m=t+s\), \(p=3t+2s-2\), and let \(W_S\) be finite
sets indexed by all \(s\)-cuts \(S\) of an \(m\)-set, with
\[
p\le |W_S|\le p+\delta,\qquad
|W_S\cap W_T|\le\delta\quad(S\cap T=\varnothing).
\]
There is a constant \(c_{s,\delta}>0\) such that, for all
sufficiently large \(t\),
\[
\left|\bigcup_S W_S\right|
\ge \left(\frac3s-\frac{\delta}{2s^2}+c_{s,\delta}\right)t^2 .
\]
The constant is not optimized. The result strengthens
[the affine ground-set bound](SHARPER-SLACK-PETAL-ORDER.md)
in this range.

## 1. What near-equality would force at each exterior point

Put \(C=\binom ms\), \(M=\binom{m-1}{s-1}=(s/m)C\), and
\(n=|\bigcup W_S|\).
For each exterior point \(v\), let \(\mathcal H_v\) be its
family of cuts. Put \(a_v=|\mathcal H_v|/M\), and let
\(b_v\) be the number of ordered disjoint pairs in
\(\mathcal H_v\), divided by \(M^2\).
The prior affine proof gives \(b_v-2a_v+2\ge-o(1)\)
uniformly. It also gives \(b_v\ge a_v^2-sa_v\)
from the crude degree bound.

Assume for contradiction a sequence with
\(n/t^2\to L=3/s-\delta/(2s^2)\). Since
\(\sum_v|\mathcal H_v|=\sum_S|W_S|\) and
\(p\le|W_S|\le p+\delta\), we have
\(\sum_v a_v=(3/s+o(1))t^2\).
There are at most \(\delta C^2\) ordered disjoint
intersections summed over the points, so
\(\sum_v b_v\le(\delta/s^2+o(1))t^2\).
It follows that the sum of the positive parts of
\(b_v-2a_v+2\) is \(o(n)\).
Discard a set of \(o(n)\) points so that the remaining
points have \(b_v\le2a_v-2+o(1)\) uniformly.
The crude lower bound on \(b_v\) also implies
\(\sum_v a_v^2=O(n)\), so the discarded points
carry total \(a_v\)-mass \(o(n)\) by Cauchy–Schwarz.

For the remaining points, the piecewise-linear lower
bound in the affine proof forces \(1-o(1)\le a_v\le2+o(1)\).
Indeed it is strictly larger than \(2a-2\) off \([1,2]\),
and the crude bound already bounds \(a_v\) by a fixed
constant. Since the mean \(a_v\) tends to
\((3/s)/L>1\), a positive proportion of all points
have \(a_v\ge1+\epsilon\) for a fixed \(\epsilon>0\)
and lie among the remaining points.

For each such point the heavy cut-coordinate degrees
normalized by \(M\), denoted \(p_i\), have total at most
\(a_v+o(1)\) and square sum at least
\(1+(a_v-1)^2-o(1)\). These are exactly the same heavy
coordinates as in the affine proof: the light square sum
is \(o(1)\), and ordered nondisjoint pairs are at most the
degree square sum. It follows that the largest \(p_i\)
is \(1-o(1)\) uniformly on these points. To justify this,
if it were at most \(1-\gamma\) for fixed \(\gamma>0\),
the other entries have total at least \(\epsilon^2/2\)
from the square-sum bound. Move a fixed
\(u=\min(\gamma/2,\epsilon^2/4)>0\) of their mass to
the largest entry. It remains at most 1. The square
sum increases by at least \(u^2\), since every donor
is no larger than the original largest entry. But for
total mass at most \(a_v+o(1)\) the maximal square
sum is \(1+(a_v-1)^2+o(1)\), a contradiction.
There is also a second coordinate of degree at least
\(c_0M\) for fixed \(c_0>0\): the remaining normalized
square sum is at least \(\epsilon^2/2\), and the
remaining mass is bounded. Denote the first and a
second coordinate by \(x_v,y_v\), respectively.

We have obtained \(\Omega(t^2)\) points \(v\) for which
\(\mathcal H_v\) contains all but \(o(M)\) of the
\(x_v\)-star, and at least \(c_0M\) members of the
\(y_v\)-star. These properties are independent of any
uniqueness of the first or second choice.

## 2. A single pair of cuts violates the overlap cap

Call a cut \(T\) eligible for one of these points \(v\)
if \(T\in\mathcal H_v\), \(y_v\in T\), and \(x_v\notin T\).
Each point has at least \((c_0-o(1))M\) eligible cuts,
since the two star centers occur together in only \(o(M)\)
cuts. Thus by averaging some \(T\) is eligible for
\(\Omega(t^2M/C)=\Omega(t)\) points.

For a fixed first center \(x\notin T\), at most \(\delta\)
of these eligible points can have \(x_v=x\). Otherwise
\(\delta+1\) such points would all contain a common supported
cut \(S\) containing \(x\) and disjoint from \(T\): there
are \((1-o(1))M\) such cuts, and each of those points
misses only \(o(M)\) of the entire \(x\)-star.
Then \(W_S\cap W_T\) would contain \(\delta+1\) points.
Hence the eligible points for this \(T\) have \(\Omega(t)\)
distinct first centers outside \(T\).

Choose one eligible point \(v_x\) per such first center
in a set \(Z\) of size \(\Omega(t)\).
Choose a uniformly random \(s\)-set \(S\subseteq Z\).
The expected number of \(x\in S\) with
\(S\notin\mathcal H_{v_x}\) is at most
\[
\frac{|Z|\,o(M)}{\binom{|Z|}{s}}=o(1).
\]
For some \(S\) there is no failure. Its \(s\) chosen
points \(v_x\) are distinct, and each belongs to both
\(W_S\) and \(W_T\). Since \(S\cap T=\varnothing\) and
\(\delta<s\), this violates the overlap condition.

Thus the affine constant \(L\) is not an asymptotic
limit of any family satisfying the axioms. Since it
is already a uniform asymptotic lower bound, this
nonattainment implies a strict positive asymptotic gap.

Related literature: [Das–Gan–Sudakov](https://arxiv.org/abs/1305.6715)
minimize disjoint pairs in a single small uniform family by initial
lexicographic segments, which are successive star layers. The
single-support estimate used here is an elementary asymptotic
version of that phenomenon. The extra restriction in the petal
problem is the pointwise overlap cap: all supports must obey it
simultaneously for each disjoint pair of cuts.
