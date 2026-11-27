# Effective dandelion threshold

**Theorem.** For every $`n\ge 500`$, among simple $`n`$-vertex graphs
with both $`G,G^c`$ connected, every minimizer of
$`\lambda_2(G)+\lambda_2(G^c)`$ is a generalized dandelion, up to
complementation. In fact, at these orders, if
```math
  \lambda_2(G)+\lambda_2(G^c)\le 7/5,
```
then each of $`G,G^c`$ has a leaf. The
[all-orders double-leaf comparison](MISSING-LEAF.md) then applies:
a leaf $`l`$ of $`G`$ and a leaf $`h`$ of $`G^c`$ witness that
comparison in $`G`$ if $`lh`$ is a nonedge, and in $`G^c`$
otherwise. The theorem makes the original unrestricted finite gap
explicit: only orders below 500 need further treatment.

In the degree-one dandelion regime, ground the hub and use the
two-entry stem mode of eigenvalue $`\alpha=(3-\sqrt{5})/2`$ as a
centered test vector. In the complement use the leaf-only centered
test vector. These show the dandelion value is at most
$`\alpha n/(n-2)+n/(n-1)<7/5`$ for $`n\ge 500`$, so the threshold
includes every candidate for the minimum.

## Coordinate inequalities

Write $`x=\lambda_2(G)\le y=\lambda_2(G^c)`$, changing the roles of the
two graphs if needed. Let $`a,b`$ be their unit mean-zero Fiedler
vectors. Choose signs so $`M=a_l=|a|_\infty>0`$ and
$`H=b_h=|b|_\infty>0`$. Write $`d_l=\deg_G(l)`$ and
$`e_h=\deg_{G^c}(h)`$. We have $`x\le 0.7,y\le 1.4`$. All terminating
decimals used below denote exact rationals.

Three elementary inequalities will be used:

1. For a unit mean-zero Laplacian eigenvector $`f`$ of eigenvalue
   $`\lambda`$, at a vertex of degree $`k>\lambda`$,
   ```math
      |f_v|^2\le \frac{k}{(k-\lambda)^2}.
   ```
   This is Cauchy–Schwarz on the row equation. At a vertex with $`k`$
   non-neighbours, the zero-sum row equation instead gives
   ```math
      |f_v|\le \frac{\sqrt{k}}{n-k-\lambda}.
   ```
   The former bound decreases with $`k>\lambda`$; the latter increases
   with $`k`$ in its range of positive denominators.
2. For a unit mean-zero vector of maximum absolute entry $`U`$, the
   energy of the star at a vertex with $`k`$ missing edges is at least
   $`1-knU^2/(n-k)`$. Indeed, the complete star costs $`1+nf_v^2`$;
   subtract at most $`k(|f_v|+U)^2`$, then minimize that quadratic in
   $`|f_v|`$. The energies of stars at two vertices can be added when
   their joining edge is absent.
3. The complete-pair product bound gives $`1\le 4(yM^2+xH^2)`$.
   Thus at least one of $`M,H`$ is at least $`0.4`$, since
   $`4(1.4)(0.4)^2<1`$.

## Uniform bounds and the first leaf

Use the following two cases; take Case A when $`H\ge 0.4`$.

| Bound | A | B |
| --- | ---: | ---: |
| $`M`$ at least | 0.19 | 0.4 |
| $`H`$ at least | 0.4 | 0.08 |
| $`d_l`$ at most | 29 | 7 |
| $`e_h`$ at most | 8 | 159 |
| $`\lvert a_h\rvert`$ at most | 0.006 | 0.038 |
| $`\lvert b_l\rvert`$ at most | 0.012 | 0.0054 |

For A, the own-degree bound at $`h`$ gives $`e_h\le 8`$. Its
$`G`$-star and $`x\le 0.7`$ therefore imply
$`M^2\ge 0.3(500-8)/(8\cdot 500)>0.19^2`$, giving $`d_l\le 29`$.
For B, $`d_l\le 7`$. Any $`G`$-neighbour $`w'`$ of $`l`$ has
$`a_{w'}\ge (1-x)M\ge 0.12`$ by the row at $`l`$, so
$`\deg_G(w')\le 70`$. The two $`G^c`$-stars at $`l,w'`$ have no
common edge; the star bound and $`y\le 1.4`$ give
```math
  H^2\ge
  \frac{0.6}{500\cdot 7/(500-7)+500\cdot 70/(500-70)}>0.08^2.
```
This gives $`e_h\le 159`$. The opposite-coordinate bounds now give
the bottom two rows of the table.

In either case $`\lvert a_h\rvert/M\le 0.095`$, so $`lh`$ is
not a $`G`$-edge (the row at $`l`$ would give $`x\ge 0.905`$).
The complement row at $`h`$ gives
$`y\ge 1-\lvert b_l\rvert/H`$ and therefore $`x\le 0.47`$ in both
cases. Take $`z\ne l`$ maximizing $`a_z=Z`$. The row at $`l`$
and connectivity give $`Z\ge (1-x)M\ge 0.53M`$.
The own-degree bound gives $`d_G(z)\le 103`$ in A and at most
24 in B, so the opposite-coordinate bound gives $`|b_z|\le 0.026`$
and $`|b_z|\le 0.011`$, respectively. In particular $`z\ne h`$.
If $`hz`$ were a complement edge, the complement row at $`h`$
would give $`y\ge 2-(|b_l|+|b_z|)/H>1.4`$. Thus $`hz`$ is a
$`G`$-edge. The row at $`z`$ implies
```math
    (2-x)Z\le M+|a_h|.
```
If $`l`$ had at least two $`G`$-neighbours, its row would strengthen
$`Z\ge (1-x/2)M`$. This is impossible since
$`(2-0.47)(1-0.47/2)>1.095`$. Thus $`l`$ is a leaf.

## The second leaf

Now $`|b_l|\le 0.0021`$ from $`d_l=1`$, so $`x\le 0.427`$ by
the row at $`h`$. Also
$`(2-x)(1-x)\le 1.095`$ gives $`x>0.33`$, hence $`y<1.07`$.
The unique neighbour $`w`$ of $`l`$ is $`z`$: if not, the row at
$`z`$, with no negative contribution and containing $`hz`$, would
give $`x\ge 1-|a_h|/Z\ge 1-0.095/0.53>0.427`$.
In particular $`a_w=(1-x)M`$ and the previous bounds on $`b_z`$
are the corresponding bounds on $`b_w`$.

Suppose $`h`$ has at least two complement neighbours. If $`v\ne h`$
maximizes the second entry $`b_v=Z_b`$, the row at $`h`$, using
its neighbour $`l`$ and any other one, gives
$`Z_b\ge 0.93H-0.0021>0.072`$.
Thus $`v\notin{l,w,h}`$ by the previous bounds on $`b_l,b_w`$.
Its complement degree is at most 9 in A and at most 196 in B
by the own-degree bound; these give $`|a_v|\le 0.007`$ and
$`|a_v|\le 0.047`$, respectively. If $`wv`$ were present in
$`G`$, use the neighbours $`l,h,v`$ in the row at $`w`$
(all other terms are nonnegative):
```math
   (3-x)(1-x)\le 1+\frac{|a_h|+|a_v|}{M}.
```
The left side is at least $`(3-0.427)(1-0.427)>1.47`$; the
right side is below $`1.22`$ in either case. Thus $`v`$ is
adjacent to both $`l,w`$ in $`G^c`$. Its complement row has only
the possible negative contribution from $`h`$. Consequently
```math
   1.93(0.93H-0.0021)\le (3-y)Z_b\le H+|b_l|+|b_w|.
```
The two sides contradict $`H\ge 0.4, |b_w|\le 0.026`$ in A,
and $`H\ge 0.08, |b_w|\le 0.011`$ in B. Thus $`h`$ is a leaf
of $`G^c`$, proving the claim.

All decimal comparisons can also be rechecked in
[verify_effective_leaf_threshold.py](verify_effective_leaf_threshold.py)
with exact rational arithmetic.
[Coordination issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
