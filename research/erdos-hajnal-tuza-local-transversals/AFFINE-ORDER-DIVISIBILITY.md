# A divisibility obstruction to sharp affine petal order

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
At asymptotic equality in the affine order bound, nearly every
disjoint pair of cuts must use its entire overlap allowance.
A finite Ramsey argument converts that into an arithmetic
condition on the allowable slack.

Use the same abstract petal axioms as
[the strict-gap note](STRICT-SLACK-ORDER-GAP.md).
Fix \(s\ge2,\delta\ge1\), and set
\[
a_*=1+\delta/(3s),\quad k=\lfloor a_*\rfloor,\quad
L_k=\frac{6k/s-\delta/s^2}{k(k+1)} .
\]
If a sequence of such systems has \(n/t^2\to L_k\),
then
\[
\delta\in s^2\mathbb Z_{\ge0}+2s\mathbb Z_{\ge0}.
\]
Thus whenever that arithmetic condition fails, the leading
order has a strictly positive gap over \(L_k\).
In particular for \(0<\delta<3s\), the only possible
slack at which the affine bound can be sharp is
\(\delta=2s\). For \(s=2\) this is attained by
[the design construction](MULTI-STAR-ORDER-THRESHOLDS.md).

## 1. Count overlap using full centers and one partial center

As before let \(C=\binom ms\), \(M=(s/m)C\), and for each
exterior point \(v\) let \(\mathcal H_v\) be its cut support.
Write \(a_v=|\mathcal H_v|/M\) and \(b_v\) for the
ordered-disjoint-pair count divided by \(M^2\).
Because we are at the affine lower constant, the total
positive deficit \(b_v-2ka_v+k(k+1)\) is \(o(n)\).
Discarding \(o(n)\) points gives a uniform \(o(1)\) bound
on the deficit at the remaining points. The same calculation
as in the strict-gap note gives
\[
a_v\in[k-o(1),k+1+o(1)],\qquad
\sum_v a_v^2=O(n).
\]
The discarded points have total \(a_v\)-mass \(o(n)\)
by Cauchy–Schwarz, hence total \(b_v=o(n)\) from the
deficit sum. Their disjoint overlaps can be ignored at
all but \(o(C^2)\) ordered cut pairs.

At a remaining point, the heavy normalized coordinate
degrees have square sum at least
\(k+(a_v-k)^2-o(1)\), and total mass at most \(a_v+o(1)\).
The \(k\) largest are \(1-o(1)\), by the mass-transfer
argument in [Multi-star thresholds](MULTI-STAR-ORDER-THRESHOLDS.md).
Let \(\rho=(a_v-k)_+\). The remaining heavy mass is at
most \(\rho+o(1)\), and its square sum is at least
\(\rho^2-o(1)\). Thus its largest entry is
\(\rho-o(1)\) when \(\rho\) stays away from zero,
and this bound is also uniform by separating off
values \(\rho=o(1)\).
Choose those \(k\) full centers and one additional
partial center (arbitrary when the residual is negligible).
Their stars cover all but \(o(M)\) of the actual support:
the union of their portions of the support has size
at least the sum of their degrees minus \(O(M/m)\),
because there are only boundedly many pairs of centers.

Replace each remaining support by the full stars at
its \(k\) full centers, together with the actual
supported cuts containing its partial center but
no full center. This changes at most \(o(M)\)
members per point. Since every affected support has
size \(O(M)\), it changes a shared-point count at
at most \(o(M^2)\) ordered pairs per point, or at
\(o(C^2)\) pairs in total. Also, for all but \(o(C^2)\)
pairs, the two cuts together do not use three of
the designated centers of any single point:
there are \(O(m^2)\) points, a bounded number of
center triples per point, and only \(O(m^{2s-3})\)
ordered pairs for any specified triple.

Define \(g(x,y)\) as the number of remaining points
having \(x,y\) both as full centers.
For \(x\notin T\), define \(q_T(x)\) as the number
of points with full center \(x\) and with \(T\) in the
partial part of the replaced support.
Both integers lie between \(0\) and \(\delta\).
For \(g\), if there were \(\delta+1\) common points,
one could choose two disjoint cuts through the two
centers, respectively, supported by all those points
in the original families, since each misses only
\(o(M)\) members of the full star.
For \(q_T(x)\), \(T\) belongs to all the original
supports counted, and the same argument chooses
a disjoint \(x\)-cut simultaneously.

Except on \(o(C^2)\) ordered disjoint cut pairs,
the shared-point count now has the exact form
\[
\sum_{x\in S,\ y\in T}g(x,y)
+\sum_{x\in S}q_T(x)+\sum_{y\in T}q_S(y).
\]
Full–full contributions are counted once by the
first term; full–partial contributions are counted
once by one of the other terms. A pair of disjoint
cuts cannot both use just a single partial center,
and the exclusion of three-center events prevents
double counting.

Finally, near equality in the affine summation
requires total disjoint-cut overlap
\(\delta C^2+o(C^2)\).
Since all disjoint pairs have overlap at most
\(\delta\) and there are \((1-o(1))C^2\) of them,
all but \(o(C^2)\) have overlap exactly \(\delta\).
Thus the displayed expression equals \(\delta\)
at all but \(o(C^2)\) disjoint pairs.

## 2. Extract the arithmetic condition

Fix a sufficiently large constant finite \(N\).
A uniform random \(N\)-set of indices has every
disjoint pair of its \(s\)-cuts satisfying the
displayed identity with probability \(1-o(1)\),
by the union bound over its finitely many pairs.
Choose such a set, with its inherited linear order.

Color each pair by \(g\), and each \((s+1)\)-set by
the ordered vector of values of \(q_T(x)\) obtained by
deleting each possible index \(x\) in turn.
These are finite colorings with a fixed palette.
By the finite Ramsey theorem and the choice of \(N\),
there is an ordered \(2s\)-set where \(g\) is a
constant \(g_0\) and \(q_T(x)=r_j\) depends only on
the number \(j\) of points of \(T\) below \(x\).
Here all \(r_j\), \(0\le j\le s\), are nonnegative integers.

For each partition of these \(2s\) indices into two
\(s\)-cuts, read the ordered sequence as a lattice
path from \((0,0)\) to \((s,s)\). A step of the
first kind at height \(j\) has cost \(r_j\); a step
of the second kind at horizontal coordinate \(i\)
has cost \(r_i\). The identity says that the path
cost, plus \(s^2g_0\), is always \(\delta\).
Swapping adjacent different steps after the position
\((i,j)\) shows
\[
r_j+r_{i+1}=r_i+r_{j+1}\qquad(0\le i,j<s).
\]
Thus \(r_j=r_0+je\) for a single integer \(e\).
The total path cost is \(2s r_0+s^2e\), since
each cross pair contributes once to one of the
indices of the step costs. Rewriting with
\(\theta=\min(r_0,r_s)\ge0\) gives
\[
\delta=s^2(g_0+|e|)+2s\theta.
\]
This proves the claimed arithmetic obstruction.
