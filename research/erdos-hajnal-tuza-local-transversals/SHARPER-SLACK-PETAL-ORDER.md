# A sharper petal-order bound when there is slack

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The all-cut bound from the least Kneser eigenvalue loses
information when the mean cut-support size is not close to
an integer number of stars. Counting high-degree coordinates
in each support improves the ground-set obstruction.

Fix integers $`s\ge1`$ and $`\delta\ge0`$, let $`t\to\infty`$,
and suppose an $`r=5t+3s-2+\delta`$ uniform family with the
local span property has $`\tau>t`$ and minimum intersection
$`m=t+s`$. For every minimum pair $`A,B`$, let $`n_{\rm out}`$
be the number of points outside $`A\cup B`$. Then
```math
n_{\rm out}\ \ge
\ \left[\max_{k\ge1}
\frac{6k/s-\delta/s^2}{k(k+1)}-o(1)\right]t^2.
```
For comparison, the leading constant in the
[least-eigenvalue bound](NEAR-THRESHOLD-PETALS.md)
is $`9/(3s+\delta)`$. This new inequality is strictly
stronger whenever $`\delta/(3s)`$ is not an integer.
For $`0<\delta<3s`$, taking $`k=1`$ already gives the
improvement $`3/s-\delta/(2s^2)>9/(3s+\delta)`$.

## 1. An affine disjointness bound for a family of cuts

Set $`M=\binom{m-1}{s-1}`$. For every fixed integer $`k\ge1`$,
every family $`\mathcal H\subseteq\binom{[m]}s`$ has at least
```math
2kM|\mathcal H|-\bigl(k(k+1)+o(1)\bigr)M^2
```
ordered pairs of disjoint members. The $`o(1)`$ is uniform
over $`\mathcal H`$ for fixed $`s,k`$.

To prove this write $`a=|\mathcal H|/M`$ and let $`d_x`$ count
the members containing $`x`$. The number of ordered pairs
with a common point is at most $`\sum_xd_x^2`$.
We have $`d_x\le M`$ and $`\sum_xd_x=s|\mathcal H|`$.
If $`a\ge s+2k`$, the simple bound
$`\sum_xd_x^2\le sM|\mathcal H|`$ gives the claim from
$`a^2-sa\ge2ka`$.

Suppose $`a<s+2k`$. Call $`x`$ heavy when $`d_x>m^{-1/4}M`$.
There are $`O(m^{1/4})`$ such points, and the others
contribute at most $`m^{-1/4}Ms|\mathcal H|=o(M^2)`$
to the sum of squares. The sum of the heavy degrees
is at most $`|\mathcal H|+o(M)`$: counting a member
more than once can only cost a pair of heavy points,
and each such pair belongs to at most
$`\binom{m-2}{s-2}=O(M/m)`$ members. There are only
$`O(m^{1/2})`$ pairs of heavy points. For $`s=1`$ there are
no such double counts, so the same argument applies.

Dividing heavy degrees by $`M`$ gives numbers in $`[0,1]`$
with total at most $`a+o(1)`$. The greatest possible sum
of their squares is at most
$`\lfloor a\rfloor+(a-\lfloor a\rfloor)^2+o(1)`$:
moving mass from a smaller fractional entry to a larger
one increases the sum of squares until all but one are
integral. This bound is continuous and Lipschitz in the
total mass, which absorbs the $`o(1)`$ error uniformly.
Writing $`j=\lfloor a\rfloor`$, the resulting lower bound
on ordered disjoint pairs, divided by $`M^2`$, is
```math
a^2-j-(a-j)^2-o(1)=2ja-j(j+1)-o(1).
```
The piecewise-linear function $`2ja-j(j+1)`$ on
$`[j,j+1]`$ is convex and dominates its affine piece
$`2ka-k(k+1)`$ on the whole positive axis.
This proves the bound.

## 2. Sum over exterior points

For every $`s`$-cut $`S`$ of $`X=A\cap B`$, choose one
standard witness and its exterior petal $`W_S`$.
Put $`C=\binom ms`$, so $`M=(s/m)C`$.
By the usual petal calculation, every $`|W_S|\ge
p=3t+2s-2`$, and disjoint cuts have
$`|W_S\cap W_{S'}|\le\delta`$.
For each exterior point $`v`$, take $`\mathcal H_v`$
to be its family of cuts. The total number of ordered
disjoint pairs summed over all $`\mathcal H_v`$ is at
most $`\delta C\binom{m-s}{s}\le\delta C^2`$.
Meanwhile $`\sum_v|\mathcal H_v|=\sum_S|W_S|\ge Cp`$.
The affine bound therefore gives
```math
\delta C^2\ge
2kMCp-\bigl(k(k+1)+o(1)\bigr)M^2 n_{\rm out}.
```
This yields the claimed asymptotic bound for each
fixed $`k`$, using $`m=t+s,\ p=3t+2s-2`$.
The maximum over positive integers is attained at
a finite $`k`$, since its terms tend to zero.

In fact, put $`a_*=1+\delta/(3s)`$ and take
$`k=\lfloor a_*\rfloor`$. Its leading constant, minus
the old one $`3/(sa_*)`$, equals
```math
\frac{3}{s}\frac{(a_*-k)(k+1-a_*)}{a_*k(k+1)},
```
which is positive exactly when $`a_*`$ is not an
integer. The resulting obstruction concerns the order
of any near-threshold example; it does not determine
the unrestricted transversal optimum.

## An abstract construction with less order than saturation

There is a genuine gap between the saturated-order constant
$`3/s`$ and what can be required from the abstract petal
size and overlap axioms alone when $`\delta>0`$.
For every fixed $`s,\delta\ge1`$ with $`\delta<3s`$, for all
sufficiently large $`t`$ there exist sets $`W_S`$
indexed by all $`s`$-cuts in an $`m=t+s`$ point set with
```math
p\le |W_S|\le p+\delta,\qquad
|W_S\cap W_T|\le\delta\ \ (S\cap T=\varnothing),
\qquad
\left|\bigcup_S W_S\right|
\le \left(\frac3s-\frac{\delta}{4s^2}+o(1)\right)t^2.
```
These are abstract petals only, not counterexamples to
the original local-transversal problem.

Take a prime $`q=(1+o(1))t/(2s)`$, which exists for all
large $`t`$ by the prime number theorem. Let
$`L_0=\lceil(p-\delta(q+1))/s\rceil`$; it is positive
for fixed $`0<\delta<3s`$ and large $`t`$.

Give each index $`x`$ an independent pool of $`L_0`$
private points, and take $`\delta`$ disjoint copies of
the projective plane over $`\mathbb F_q`$.
In each copy assign different lines to the $`m`$ indices,
possible for large $`q`$. For $`W_S`$, take the pools
of all $`x\in S`$, and in each plane add the line of
the least index of $`S`$ in a fixed ordering.
For disjoint cuts, their pools are disjoint and their
line choices in each plane are distinct, so they share
only one point per plane. The size is $`sL_0+\delta(q+1)\ge p`$. Trim each petal
independently to exactly $`p`$ vertices; trimming only
decreases intersections. The number of available points is at most
```math
m L_0+\delta(q^2+q+1)
=\left(\frac3s-\frac{\delta}{4s^2}+o(1)\right)t^2.
```
The affine lower bound for $`0<\delta<3s`$ is
$`3/s-\delta/(2s^2)`$, so this construction brackets the
possible saving. Further strengthening for real
hypergraphs may need the compatibility of petals
at different minimum pairs.

For $`s=1`$ and $`0\le\delta\le3`$, the abstract optimum
is exact: place $`\delta`$ points in each pair of
distinct singleton petals and use separate private
points to fill each petal to size $`3t`$.
This gives $`3t(t+1)-\delta\binom{t+1}{2}`$ points.
The same number is a lower bound from pairwise union
counting, since any point of multiplicity $`d`$ is
overcounted $`d-1\le\binom d2`$ times.

Related literature: [Das–Gan–Sudakov](https://arxiv.org/abs/1305.6715)
minimize disjoint pairs in a single small uniform family by initial
lexicographic segments, which are successive star layers. The
single-support estimate used here is an elementary asymptotic
version of that phenomenon. The extra restriction in the petal
problem is the pointwise overlap cap: all supports must obey it
simultaneously for each disjoint pair of cuts.
