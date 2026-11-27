# The last complementary-triangle palette orbit

After the [four-vertex](FOUR-VERTEX-PALETTE-CERTIFICATE.md) and
[five-vertex](FIVE-VERTEX-PALETTE-CERTIFICATE.md) exclusions, the
asymptotic two-triangle problem reduces to one maximal spectrum,
up to relabelling:

```math
\mathcal B=\{012,013,023,014,124,234,025,125,135,045\}.
```

This note gives the exact remaining obstruction and a counterexample
to an overstrong version of the graphon approach.

## Full support is essential

There **is** an exactly balanced six-coloured graphon supported on
$`\mathcal B`$ at the level of rainbow palettes. Take the
[explicit 12-type parity graphon](parity_triangle_hole_example.py).
Under the hue permutation $`(0,1,2,3,4,5)\mapsto(3,4,2,5,0,1)`$,
its rainbow triangle support is precisely

```math
\{012,013,025,045,125,135,234\}\subset\mathcal B.
```

In particular a universal flag-algebra exclusion of $`\mathcal B`$
without a full-support hypothesis cannot succeed. The automorphisms of
$`\mathcal B`$ simultaneously permute $`0,1,2`$ and their partners
$`3,4,5`$, and the explicit support meets every palette orbit.
Thus there is also no fixed allowed palette whose universal vanishing
could settle the full-support question.

## From large finite avoidance to full support

For exactly balanced colourings with no disjoint complementary rainbow
triangles, a rich palette is one for which there are four disjoint
triangles of that palette. Its complementary palette cannot occur at
all. The previously proved transversals and counting imply that the
rich family is one of the four connected-link possibilities for
all sufficiently large admissible orders. The graphon certificates
exclude all but $`\mathcal B`$ at large orders, since any palette that
is not rich occurs on only $`O(N^2)`$ triangles. Hence the rich family
for any large counterexample is **all ten** palettes of $`\mathcal B`$.
Because there is exactly one of each complementary pair in
$`\mathcal B`$, the global family is then exactly $`\mathcal B`$ too;
there are no exceptional forbidden triangles to remove.

A finite exactly balanced $`K_N`$ with global palette family contained
in $`\mathcal B`$ can be substituted into every vertex of itself
repeatedly. In the lexicographic product, a triangle whose vertices
are not all in the same first-coordinate block has either all three
distinct first coordinates (its palette is a base palette) or has
two in the same block (the other two edges share a hue). Thus no new
rainbow palettes arise. Its $`k`$-fold power is again exactly balanced:
the hue degree is

```math
\frac{N-1}{6}(1+N+\cdots+N^{k-1})=\frac{N^k-1}{6}.
```

Equivalently, the infinite product gives an atomless graphon: choose
the hue at the first differing coordinate of two infinite words.
Per hue its row degree is $`1/6`$, and its positive rainbow palette
support is exactly the base support, since each base triangle has
a positive first-coordinate probability.

Consequently **if no balanced graphon has exactly the full support
$`\mathcal B`$, the asymptotic Erdős–Tuza two-triangle statement
follows**. A stronger sufficient statement would be that every balanced
graphon supported on $`\mathcal B`$ is a parity cut for some set of
three hues. Neither statement is proved here. A full-support graphon
alone would not refute the finite conjecture.

The same lexicographic construction also shows that **a finite balanced
colouring with support contained in this family must already realize all
ten palettes**. Its arbitrarily large powers have no complementary pair
and retain the original support, so the large-order reduction applies to
them. This is why an exactly balanced finite counterpart of the seven-
palette graphon example above cannot exist, at any nontrivial order.

## A stronger hereditary reduction

If there are arbitrarily large finite counterexamples, there exists an
exactly balanced graphon with every palette of $`\mathcal B`$ present
on **every positive-measure induced subset**. To see this, choose one
finite counterexample past the palette reduction and form its infinite
lexicographic power as above. Given a measurable subset $`A`$ of
positive measure, choose a finite cylinder $`C`$ where the conditional
measure of $`A`$ is greater than $`1-1/N`$. Such a cylinder exists
by martingale convergence for the coordinate filtration. Every one
of the $`N`$ immediate child cylinders then meets $`A`$ in
positive measure. Choosing vertices in distinct child cylinders
reproduces every pattern on distinct vertices of the finite base.
The same argument with $`1-N^{-d}`$ reproduces every pattern in the
$`d`$-fold lexicographic power. Conversely the construction never
introduces a new rainbow palette.

Also, almost every marked root has all ten palettes in its rooted
support. Each base letter occurs infinitely often in its coordinates.
For each palette, choose a base triangle and a coordinate where the
root letter is one of its vertices; choosing the other two vertices
in their designated child cylinders produces that palette at the
given root with positive probability. Thus it is enough to prove a
structural theorem that forces the omission of a palette on some
positive-measure subset, or the omission of a rooted palette on a
positive-measure set of roots. No uniform lower bound over all sizes
of finite counterexamples is implied.

For a fixed edge of hue $`y_i`$, the only allowable unequal pairs
of other hues, after omitting $`y_i`$, form the path
$`y_j,x_k,x_i,x_j,y_k`$, where $`j,k`$ are the other indices.
Pairs of identical hues and any pair involving $`y_i`$ are always
allowed. This follows by reading the two paired-sign rules below:
the inner links repeat index $`i`$ with a lone positive hue, while
the end links have all three indices and two negative hues. The joint
distribution of the two incident hues at a random third vertex has
uniform marginals by balance; the path plus the universal hue and
the diagonal are its only possible support. The path restriction
alone does not enforce a bipartition.

## Paired signs

Write $`x_i=i, y_i=3+i`$ for $`i=0,1,2`$, and associate a sign bit
0 to $`x_i`$ and 1 to $`y_i`$. The palette restrictions are exactly:

- A triangle with three distinct pair indices must have even sign
  parity. Its possible palettes are $`012,234,135,045`$.
- On a triangle with exactly two pair indices, if the two edges of
  the repeated index use distinct hues, the lone-index edge must
  have sign bit 0.
- There is no extra restriction on a triangle with a repeated hue.

This describes $`\mathcal B`$ without an enumeration of palettes and
may be useful for a cocycle or structural argument. In particular,
the sign constraint on index-transversal triangles alone does not
check all triangles, so a completion to a vertex cut needs proof.

The original six-edge cases are described in
[Erdős–Tuza (1993)](https://doi.org/10.1016/S0167-5060(08)70377-7) and
[Clemen–Wagner (2023)](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v30i3p17).
The latter refutes the $`K_4`$ case, not the two-triangle case.
Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
