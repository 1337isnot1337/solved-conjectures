# Dense lattice sections satisfy the linear diameter bound

**Theorem.** Fix $`0<\rho\le1`$. Let $`\Lambda`$ be any affine full-rank lattice in the plane and $`K`$ any convex body. If $`A\subset K\cap\Lambda`$ satisfies the separation hypothesis of [Erdős Problem 100](README.md) and $`|A|\ge\rho|K\cap\Lambda|`$, then $`\mathop{\mathrm{diam}}(A)\gg_\rho |A|`$ for $`|A|\ge2`$. The bound is uniform over the affine lattice, its scale and shape, and the eccentricity and orientation of $`K`$. No convexity assumption is imposed on $`A`$ itself.

The mechanism is a short horizontal lattice displacement $`u`$ and a much longer, almost perpendicular displacement $`v`$. Positive density forces a small grid with these step directions, where the distances $`|v|`$ and $`|v\pm u|`$ are too close to be distinct. At least one is strictly different.

## Lattice geometry and density

Replace $`K`$ by the convex hull of $`A`$: it still contains at most $`|A|/\rho`$ lattice points and now has diameter $`D=\mathop{\mathrm{diam}}(A)`$. A collinear set has $`|A|\le D+1`$, so assume nonempty interior. We argue by contradiction under $`n=|A|>C(D+1)`$ for a sufficiently large constant $`C=C(\rho)`$; the proof specifies all its dependencies.

Let $`E\subset K\subset 2E`$ be the planar John ellipse, centered at $`o`$, with semiaxes $`a\ge b>0`$, where the dilation is about $`o`$. Thus $`2a\le D\le4a`$ and $`|K|\le4\pi ab`$, here writing $`|K|`$ for area only. If $`b<1`$, the disjoint disks of radius $`1/2`$ centered on $`A`$ fit in a rectangle of sides $`4a+1,4b+1`$; this gives $`n=O(D+1)`$. Take $`b\ge1`$. The same packing estimate now gives $`n\le C_0 Db`$ with an absolute $`C_0`$, since $`D\ge2a\ge2`$.

Choose a shortest nonzero vector $`u`$ of the translation lattice with length $`\delta`$. It is primitive, so take a basis $`u,v_0`$ and subtract a multiple of $`u`$ from $`v_0`$ so that its projection on the direction of $`u`$ has absolute value at most $`\delta/2`$. Let $`h`$ be the length of the perpendicular component of $`v_0`$, the distance between lattice rows parallel to $`u`$. Since $`|v_0|\ge\delta`$, we have $`h\ge\sqrt3\delta/2`$. The lattice determinant is $`\Delta=\delta h`$, and centered fundamental parallelograms tile the plane with every cell contained in the disk of radius $`2h`$ about its center.

Write $`N=|K\cap\Lambda|`$. If $`A`$ occupies at most $`n/2`$ lattice rows, the two extreme $`A`$-points in any occupied row with $`q`$ points enclose a segment of length at least $`q-1`$. Convexity puts at least $`(q-1)/\delta+1`$ ambient lattice points in that segment. Summing, $`N\ge n/(2\delta)`$; since $`n\ge\rho N`$, it follows that $`\delta\ge\rho/2`$.

Otherwise the row bound $`D/h+1`$ gives $`h\le 4/C`$ for sufficiently large $`C`$. In particular $`2h<b/2`$. The centers of lattice cells hitting $`\frac12E`$ all lie in $`E`$: the centered ellipse contains a disk of radius $`b`$, so a perturbation of size at most $`b/2`$ of a point of $`\frac12E`$ remains in $`E`$. By the tiling,
```math
N\ge \frac{\pi ab}{4\Delta}\ge \frac{\pi Db}{16\Delta}.
```
Using $`n\le C_0Db`$ and $`n\ge\rho N`$ gives $`\Delta\ge \pi\rho/(16C_0)`$, which contradicts $`\Delta\le2h^2`$ if $`C`$ was large enough in terms of $`\rho`$. We have proved $`\delta\ge\rho/2`$ and $`h\gg\rho`$.

The chord lengths of $`K`$ in the rows' direction form a concave function on the perpendicular projection interval. Extended by zero outside, its total variation is at most $`2D`$. The equally spaced sample sum of the chord lengths is therefore at most $`|K|/h+2D`$: on each adjacent interval of length $`h`$, bound the discrepancy between its integral and its left endpoint times $`h`$ by $`h`$ times the variation on the interval, and add. Each row of chord length $`\ell`$ has at most $`\ell/\delta+1`$ lattice points. It follows that
```math
n\le N\le D/h+1+2D/\delta+|K|/\Delta
\le C_1(\rho)(D+1)+2\pi Db/\Delta.
```
Thus for large $`C`$ the hypothesis $`n>C(D+1)`$ gives $`\Delta\le 4\pi b/C`$. In particular, by the lower bound for $`\delta`$, the ratio $`h/b`$ can be made as small as necessary in terms of $`\rho`$.

## Put a nearly orthogonal grid inside the chosen subset

Let $`m`$ be the dimension in the [density Hales–Jewett theorem](https://doi.org/10.1007/BF03041066) for a nine-letter alphabet and density $`\rho/100`$. Choose $`C`$ large enough that $`h\le b/(200m)`$. Take a positive integer multiple of $`v_0`$, then subtract a multiple of $`u`$, to obtain a vector $`v`$ whose projection along $`u`$ has absolute value at most $`\delta/2`$ and whose perpendicular component has length between $`b/(64m)`$ and $`b/(64m)+h`$. In particular,
```math
\delta\le b/(100m),\qquad b/(64m)\le |v|\le b/(32m).
```
For a word $`w=((\alpha_1,\gamma_1),\ldots,(\alpha_m,\gamma_m))`$ over $`\{0,1,2\}^2`$, put $`s(w)=\sum_i(\alpha_i u+\gamma_i v)`$. All these shifts have norm less than $`b/4`$.

Take a uniform random lattice point $`x`$ in $`T=(K+B(0,b/4))\cap\Lambda`$, using $`B(0,r)`$ for the disk of radius $`r`$. For each fixed word $`w`$, every point $`p\in A`$ gives exactly one $`x=p-s(w)\in T`$. Hence $`\Pr[x+s(w)\in A]=n/|T|`$. The union of all fundamental cells centered in $`T`$ fits in $`K+B(0,b/4+2h)`$, which lies in a rectangle with sides no larger than $`6a,6b`$. Thus $`|T|\le36ab/\Delta`$. The earlier lower bound $`N\ge\pi ab/(4\Delta)`$ applies again now that $`2h<b/2`$. Consequently $`|T|\le100N`$, and some $`x`$ makes a fraction at least $`\rho/100`$ of all words land in $`A`$. There is no injectivity assumption on words; we apply the theorem to the set of preimage words.

A combinatorial line in that preimage yields the nine distinct points of the form
```math
z+j(\alpha u+\gamma v),\qquad \alpha,\gamma\in\{0,1,2\},\quad 1\le j\le m,
```
where $`j`$ counts the nonempty variable positions in the line. The independence of $`u,v`$ gives distinct points. From $`z+ju`$ to the three points in the next row the lengths are $`j|v-u|,j|v|,j|v+u|`$. Because $`|\langle v,u\rangle|\le\delta^2/2`$,
```math
0\le |v\pm u|^2-|v|^2
=\delta^2\pm2\langle v,u\rangle\le2\delta^2.
```
At least one of the two differences is positive. The corresponding positive difference of lengths is at most $`2m\delta^2/|v|\le128m^2\delta^2/b`$. The distance hypothesis now forces $`\delta^2\ge b/(128m^2)`$. This contradicts $`\Delta=\delta h\ge\sqrt3\delta^2/2`$ and $`\Delta\le4\pi b/C`$, if $`C`$ was also chosen sufficiently large in terms of $`m`$. This proves the theorem.

## Scope

[Brass–Moser–Pach, §5.10](https://doi.org/10.1007/0-387-23815-8) notes that scaling a square lattice grid by a constant times its side length supplies a linear upper-bound construction. The argument here is a converse for **any** fixed-density portion of any planar convex lattice section, including varying lattice shapes and unbounded eccentricity. It does not claim that general separated-distance sets must have this density in any lattice. The bounded search for an earlier exact statement checked Brass, Baron, the original conjecture and references on planar lattice examples. The similarly titled paper of Palásti concerns [Erdős #217](https://www.erdosproblems.com/217), a different multiplicity question. No new priority assertion is made for the standard lattice or density tools.


## Bounded perturbations are also allowed

Suppose we have lattice labels $`Q\subset K\cap\Lambda`$, with $`|Q|\ge\rho|K\cap\Lambda|`$, and an injective map $`q\mapsto P_q`$ to a distance-separated point set. Assume $`|P_q-q|\le R`$ for all $`q`$, where $`R`$ is any fixed bound. Then $`\mathop{\mathrm{diam}}(\{P_q\})\gg_{\rho,R}|Q|`$. In particular, an argument extracting only an approximate lattice structure with fixed positive occupancy would suffice.

First take $`R\le1/100`$. The proof up through the grid extraction needs only a fixed lower bound for the spacing of the lattice labels. Here those labels have pairwise distance at least $`1-2R`$. In the packing count use disjoint disks of radius $`(1-2R)/2`$, and in the occupied-row argument replace $`q-1`$ by $`(1-2R)(q-1)`$. This merely changes $`C_0,C_1`$ and the lower bound for $`\delta`$ by absolute factors. Apply the proof to the labels, with $`D`$ there replaced by their diameter, which is within $`2R`$ of $`\mathop{\mathrm{diam}}(\{P_q\})`$. If $`|Q|`$ exceeds a sufficiently large constant times that diameter plus one, the same argument extracts the grid with $`\Delta/b`$ as small as desired in terms of $`m`$.

Use the two grid points $`z,z+ju`$ as one pair of labels and $`z+jv,z+jv+ju`$ as the other. All four cross distances for these labels belong to $`\{j|v|,j|v-u|,j|v+u|\}`$. The squared-difference inequality of the main proof places them in an interval of length $`128m^2\delta^2/b`$. Since $`\delta^2\le2\Delta`$, this interval can be made of length less than $`1/2`$, by increasing the constant in the putative violation of the linear bound. The actual cross distances change by at most $`2R`$ each. They therefore all lie in an interval of length less than $`1/2+4R<1`$, so all four actual lengths must agree.

Two nondegenerate pairs in the plane with all four cross distances equal have the same midpoint: their supporting lines are one another's perpendicular bisectors. But the midpoints of the two label pairs are separated by $`j|v|\ge1-2R`$, since $`z,z+jv`$ are distinct occupied labels. Perturbing changes each midpoint by at most $`R`$, so the actual midpoints remain distinct. This contradiction proves the small-perturbation case.

For a general fixed $`R`$, partition the set of displacement vectors in the disk of radius $`R`$ into boundedly many cells of diameter at most $`1/100`$. Retain the labels in one most populated cell and translate all actual points by one common vector from that cell. This retains a fixed positive fraction of the original density and puts the perturbations within the small bound. The linear estimate for the retained subset bounds the diameter of the original set as claimed.
