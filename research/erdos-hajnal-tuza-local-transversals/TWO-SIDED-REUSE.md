# Two-sided witness reuse forces common residual points

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
Unlike the one-sided expansion dichotomy, this couples witnesses obtained by pivoting from the two opposite edges of one minimum pair.

Use $`r=5t+z`$, $`1\le z\le t/4`$, $`m=t+s`$, $`\delta=z-3s+2`$, $`L=r-m`$ and the disjoint primary cuts from [Witness expansion with slack](WITNESS-EXPANSION-WITH-SLACK.md). The primary witnesses are $`E_i`$; let $`X=A\cap B`$. Do the secondary selection both from $`A,E_i`$ (cuts in $`U_i`$) and from $`B,E_i`$ (cuts in $`V_i`$). A witness may occur at multiple pivots on either side.

Take a secondary edge $`F`$ from the $`A`$ side, reused at $`k`$ pivots, and $`G`$ from the $`B`$ side, reused at $`j`$ pivots. Assume these two pivot sets intersect. Write $`B_a=L/a+\sqrt{L\delta}`$. If
```math
B_k+B_j\lt t+s-2z-5\delta,
```
then $`F\cap G\cap X\ne\varnothing`$.

In particular, for $`z=o(t)`$ this holds eventually whenever each of the two reuse counts is at least ten. At $`r=5t+1`$, it holds for $`t\ge6`$ and both counts at least ten. At this exact jump, the two sets of primary indices cannot cover $`X`$: each pivot is a singleton $`x`$, and every secondary edge avoids every singleton at which it is reused on its side. More generally, the union of the actual $`E_i\cap X`$ residues of the two pivot sets cannot cover $`X`$.

## Proof

Put $`D_F=F\cap(B\setminus A)`$, $`D_G=G\cap(A\setminus B)`$.
The reused-edge estimate in the one-sided proof and its reflection give
```math
|D_F|\ge t-\delta-B_k,\qquad |D_G|\ge t-\delta-B_j.
```
Fix one common pivot $`i`$. The edge $`F`$ uses at most $`s+\alpha_i\le z`$ points in $`U_i`$; the reflected four-edge estimate gives $`|D_G\setminus U_i|\le\delta`$. Thus $`F,G`$ meet in at most $`z+\delta`$ vertices of the $`A`$-wing. Reflecting again gives the same bound in the $`B`$-wing.

Suppose now that $`F\cap G\cap X=\varnothing`$. Then $`F\ne G`$: otherwise this common edge would meet $`A`$ in at most $`z+\delta`$ vertices, whereas every secondary edge meets $`A`$ in at least $`m`$, and $`z+\delta<m`$. Neither secondary edge equals $`A`$ or $`B`$. For the non-pivot base edge, this follows because it contains the nonempty set $`E_i\cap X`$ which the secondary edge must avoid. Therefore the four edges $`A,B,F,G`$ have empty intersection and union of size at least $`3r-2`$. Writing $`W_F=F\setminus(A\cup B)`$ and $`W_G`$ similarly, this gives $`|W_F\cup W_G|\ge r+m-2`$. On the other hand
```math
|W_F|\le L-|D_F|,\qquad |W_G|\le L-|D_G|.
```
Consequently
```math
 |W_F\cap W_G|\le 2t+\delta-|D_F|-|D_G|
                  \le 3\delta+B_k+B_j .
```
Since $`F,G`$ are distinct, meet in no point of $`X`$, and meet in at most $`2(z+\delta)`$ points on the wings, their common exterior has at least $`m-2(z+\delta)=t+s-2z-2\delta`$ vertices. The hypothesis gives a strict contradiction. Finally, for $`z=o(t)`$ we have $`L=(4+o(1))t`$, $`\delta=o(t)`$; the sum of two reuse errors for counts at least ten is at most $`(4/5+o(1))t`$. At $`z=1`$ the error sum is at most $`4t/5<t-1`$ for $`t\ge6`$.

This cross-intersection rule is a restriction on the clustered-wing branch. It does not yet show that its surviving residual families on $`X`$ are impossible.

## An unconditional witness-count consequence at the first jump

At $`r=5t+1`$, $`t\ge19`$, put $`q=t+1`$. At every singleton pivot
there are $`t`$ selected witnesses per side. Let $`N_A=t+a`$,
$`N_B=t+b`$ be the numbers of distinct selected witnesses on the
two sides, with overlaps between the sides counted separately.
Then
```math
q\,ab\ \ge\ (t-a)_+(t-b)_+.
```
In particular, at least one side has at least
```math
t+\left\lceil\frac{t}{1+\sqrt{t+1}}\right\rceil
```
distinct secondary witnesses. If one side has exactly $`t`$, the
other must have at least $`2t`$.

To prove this, call an edge high-use on a side if it is used at more
than $`q/2`$ pivots. Across the $`A`$ side there are precisely
$`q(N_A-t)=qa`$ absent edge–pivot incidences: every pivot has exactly
$`t`$ distinct chosen edges. A non-high-use edge accounts for at
least $`q/2`$ absences, so there are at most $`2a`$ such edges.
Hence at least $`(t-a)_+`$ are high-use, and similarly at least
$`(t-b)_+`$ on the other side.

The pivot sets of any two opposite high-use edges meet because
each has more than half the $`q`$ pivots. Both have at least ten
uses. The two-sided result gives a common vertex $`x`$ in $`X`$;
both edges must then be absent at the pivot $`x`$. For each pivot
there are exactly $`a`$ absent $`A`$-side edges and $`b`$ absent
$`B`$-side edges. Counting opposite high-use pairs by such a common
absence proves the inequality. If $`d=\max(a,b)<t`$, it implies
$`qd^2\ge(t-d)^2`$, so $`d\ge t/(1+\sqrt q)`$. When $`d\ge t`$
that last conclusion is automatic. The case $`a=0`$ or $`b=0`$
follows directly from the displayed product inequality.

## Why cross-intersection alone stops at the square-root scale

The preceding order of magnitude is sharp for the abstract incidence
conditions used in its proof. This is not a hypergraph example.

Let $`p\ge5`$ be prime, $`q=p^2+p+1`$, and $`t=q-1`$. Use the points
of the projective plane over $`\mathbb F_p`$ as the $`q`$ pivot labels.
On each side introduce one abstract edge per projective line. Also
introduce $`p+4`$ extra edges whose corresponding lines, with
multiplicity, are the $`p`$ affine lines $`y=ax+a^2`$, plus a second
copy of any four of those lines. A point lies on at most two of
the $`p`$ different special lines: an affine point gives a
quadratic equation in $`a`$, and an infinite point is on at most
one since the line slopes are distinct. Thus the extra edges
have total point-degree at most four at every point.

Initially give each edge all pivot incidences except the points
on its own line. Every point is incident to $`p+1`$ original
lines and at most four extra edges, so at least
```math
(q+p+4)-(p+1)-4=q-1=t
```
edges are available at each pivot. Delete arbitrarily any excess
incidences at every pivot, leaving exactly $`t`$ per side. Every
opposite pair of edges still has a common absence: the two lines
intersect, including when they are copies of the same line.
There are at most $`q+p+4=t+p+5=t+O(\sqrt t)`$ used edges per side.
Together with the lower bound, this shows that the incidence count
and pairwise common-absence rule alone cannot force a linear
improvement. Additional geometric information on the witnesses is
needed to rule out such residual designs in a real hypergraph.
