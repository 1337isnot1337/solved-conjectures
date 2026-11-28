# Opposite pivots force disjoint exterior reuse

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This strengthens the [two-sided reuse count](TWO-SIDED-REUSE.md). Its proof uses where the witnesses actually intersect, not just their abstract incidence patterns. It requires no wing separation or core assumption.

## Statement

Use the [near-threshold setup](WITNESS-EXPANSION-WITH-SLACK.md):
$`r=5t+z`$, $`1\le z\le t/4`$, $`\tau>t`$, $`m=t+s`$ the minimum pair intersection, $`\delta=z-3s+2`$, $`L=r-m`$, and $`\ell=\lfloor m/s\rfloor`$ disjoint primary cuts. On each side of a minimum pair $`A,B`$, choose exactly $`b=\lfloor t/z\rfloor`$ witnesses at each pivot using disjoint secondary cuts. Put
```math
d=\left\lceil(\ell+2)/2\right\rceil,\qquad
h=d-2(z+\delta),\qquad B_d=L/d+\sqrt{L\delta}.
```
If $`h>0`$, $`h^2>5L\delta`$, and $`t-\delta-B_d>z+\delta`$, at least one side has at least
```math
\frac{\ell b-K(\ell-d+1)}{d-1}
\quad\text{distinct secondary edges, where}\quad
K=\left\lfloor\frac{Lh}{h^2-5L\delta}\right\rfloor .
```
If each side has at least one edge used at $`d`$ or more pivots, the bound holds on **both** sides.

For fixed $`z`$ this gives $`2\lfloor t/z\rfloor-O_z(1)`$ distinct near-minimum neighbors on at least one side. More generally it gives $`(2-o(1))\lfloor t/z\rfloor`$ for $`z=o(t^{1/3})`$. At the first jump $`z=1`$, the bound is $`2t-O(1)`$, improving the $`t+\Omega(\sqrt t)`$ bound obtained from abstract pivot incidences alone.

## Proof

Call an edge high-use on its side if it appears at $`d`$ or more pivots. Any two high-use edges have at least two common pivot indices because $`2d-\ell\ge2`$.

For a secondary edge $`F`$ write $`W_F=F\setminus(A\cup B)`$.
If $`F,F'`$ are distinct high-use edges on the same side, take two common pivots $`i,j`$. At $`i`$, their secondary cuts are disjoint, since exactly one edge was selected for each cut. The bound $`\delta+\alpha_i\le2\delta`$ on common exterior points of the pivot pair is proved in [Two-wing balance](TWO-WING-BALANCE.md). In particular
```math
|(W_F\cap W_{F'})\setminus W_i|\le2\delta .
```
Repeating at $`j`$ and using $`|W_i\cap W_j|\le\delta`$ shows
```math
|W_F\cap W_{F'}|\le5\delta.
```
At saturation these secondary exterior sets are disjoint.

Now take opposite high-use edges $`F,G`$. At a common pivot $`i`$ their intersection in each of the two wings is at most $`z+\delta`$, as in [Two-sided witness reuse](TWO-SIDED-REUSE.md). They must be distinct: if they were equal, their common $`A`$-wing would have size at most $`z+\delta`$, but the reused-edge estimate on the $`B`$ side gives $`|G\cap(A\setminus B)|\ge t-\delta-B_d>z+\delta`$. Each edge avoids a nonempty primary residue $`E_i\cap X`$ at every pivot where it is used, where $`X=A\cap B`$; these residues are pairwise disjoint and there are at least $`d`$ of them. Thus $`|F\cap G\cap X|\le m-d`$. Since $`|F\cap G|\ge m`$, their exterior intersection has size at least $`d-2(z+\delta)=h`$.

If there is one high-use $`B`$-edge $`G`$, choose $`h`$ points of $`W_F\cap W_G`$ for every high-use $`A`$-edge $`F`$. These sets lie inside the fixed set $`W_G`$ of size at most $`L`$, and pairwise intersect in at most $`5\delta`$ points. For $`u>0`$ such sets the second moment gives
```math
(uh)^2\le L(uh+5\delta u(u-1)).
```
Hence $`u\le K`$. The same assertion holds after interchanging the two sides. At least one side has at most $`K`$ high-use edges, even if the other side has none. If both sides have at least one then both counts are bounded by $`K`$.

On any side with at most $`K`$ high-use edges and $`N`$ distinct edges, the $`\ell b`$ incidences are at most $`(d-1)N+K(\ell-d+1)`$: a low-use edge occurs at most $`d-1`$ times and a high-use one at most $`\ell`$ times. Rearranging proves the finite bound.

For $`z=o(t^{1/3})`$, $`s\le z`$, $`\delta\le z`$, $`\ell\gg t/z`$, and $`h\gg t/z`$. Then $`L\delta/h^2=O(z^3/t)=o(1)`$, $`B_d=O(z+\sqrt{tz})=o(t)`$, and $`K=O(z)`$. Also $`\ell/(d-1)=2-O(1/\ell)`$, so the lower bound is $`2b-O(b/\ell+z)`$. For fixed $`z`$, $`K=O_z(1)`$ and $`b/\ell=O_z(1)`$. The problem of ruling out all hypothetical counterexamples remains open.
