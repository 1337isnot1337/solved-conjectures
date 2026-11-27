# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**Explicit threshold: Conjecture 6 and its strict interior equality classification hold for every order $`n\ge36`$.** The [complete proof](PROOF.md) deals separately with smaller orders.

Use the notation of the [proof](PROOF.md): $`x,y`$ are the two connectivities and the target is $`F=x+y-2xy/n\ge1`$. We sharpen the unweighted input to the same interpolation. For every simple graph with both supports connected at order $`n\ge36`$ we prove
```math
x+y-\frac{2}{n}\max(x,y)>1.
```
This implies both strict linear inequalities used in that earlier proof, so its one-edge interpolation gives the whole weighted assertion at the indicated orders. Its equality argument using the visible fractional edge then applies unchanged.

## Range estimates

Let $`R_a,R_b`$ be the ranges of mean-zero unit Fiedler vectors in the graph and complement. The complete-pair fourth-moment identity of [Einollahzadeh–Karkhaneei, Lemma 4](https://arxiv.org/abs/1901.02047) gives
```math
1\le xR_b^2+yR_a^2.
```
Always $`R_a^2,R_b^2\le2`$. The [path bound](PROOF.md#a-path-bound-on-the-coordinate-range) also gives $`x\ge R_a^4/(16-4R_a^2)`$ in a connected graph, and similarly for $`y`$.

Suppose the displayed unweighted inequality fails (including equality), and without loss let $`x\le y`$ in the case $`\max(x,y)\ge1`$. Then $`x\le2/n`$ and $`y\le n/(n-2)`$. Hence
```math
R_a^2\ge (1-2x)/y\ge(1-4/n)(1-2/n)\ge68/81.
```
The path bound gives $`x\ge1/18+1/5184>2/n`$, a contradiction.

Suppose now both connectivities are below one. The elementary diameter-two Fiedler argument shows both graphs have diameter at least three. The complement of a graph of diameter at least four has diameter at most two, so both diameters are exactly three. Path-energy Cauchy–Schwarz gives $`R_a^2\le3x`$ and $`R_b^2\le3y`$, so $`xy\ge1/6`$ and hence $`x,y>1/6`$. The putative failure also gives
```math
x+y<1+\frac2n\le19/18.
```
Exchange the graph and complement if needed so that $`R_a^2\ge R_b^2`$. The moment inequality implies $`R_a^2\ge18/19`$.

## The two extreme vertices give an explicit bound

The extrema of $`a`$ are at distance three: in a simple graph with Fiedler eigenvalue below one, their opposite signs and the eigenvector equations forbid adjacency and a common neighbor, as in [Einollahzadeh–Karkhaneei, Lemma 5](https://arxiv.org/abs/1901.02047). Let $`s`$ count the maximum internally disjoint length-three paths between these extrema, and let $`\ell\ge0`$ be the corresponding cross-neighbor parameter of their proof (the maximum number of additional neighbors on the opposite side of one of the internal path vertices). Their conductance calculation (equation (3), before replacing the squared range by one) and complement calculation (10) give
```math
x\ge R_a^2\left(\frac{s-1}{3}+\frac{\ell+1}{\ell+3}\right),\qquad
y\ge\frac{n}{n+2+3s^2+6s\ell}.
```
These two estimates do not require range at least one: that requirement is used in their displayed (3) only to drop the prefactor in the first bound, and (10) uses no range hypothesis.

If $`s\ge3`$, or if $`s=2,\ell\ge3`$, the first parenthesis is at least one. Thus $`x+y\ge18/19+1/6>19/18`$, impossible. If $`s=2,\ell\le2`$, then $`x\ge12/19`$ and $`y\ge36/74`$, again giving $`x+y>19/18`$.

It remains that $`s=1`$. If $`\ell\ge30`$, then
```math
x+y\ge\frac{18}{19}\frac{31}{33}+\frac16
=\frac{19}{18}+\frac{2}{1881}.
```
If $`0\le\ell\le29`$, substitute $`n\ge36`$ and $`R_a^2\ge18/19`$ to obtain
```math
x+y-\frac{19}{18}\ \ge\
\frac{-222\ell^2+6241\ell+5817}
     {342(\ell+3)(6\ell+41)}>0.
```
The numerator is a concave quadratic positive at both endpoints (5817 and 104). This covers all parameters and proves the strict unweighted inequality.

Finally, if a simple endpoint in the weighted interpolation is disconnected, it contributes the appropriate non-strict corner line bound as in the [one-edge argument](PROOF.md#3-interpolation-to-all-weighted-graphs). The opposite-disconnection case is exactly the $`SE(s)`$ family. Therefore the strict proof for connected endpoints proves the inequality at all original weights for $`n\ge36`$ and identifies every equality case with both connectivities below one. No numerical spectral comparison is used in this threshold proof.
