# Parity triangle holes

This note concerns the two-disjoint-rainbow-triangles clause of the
Erdős–Pyber–Tuza problem ([#870](https://github.com/1337isnot1337/solved-conjectures/issues/870)).
It gives a necessary condition on parity limits of counterexamples, not a
classification of all such limits or a solution of either open clause.

## A cross pair has at most one missing inside hue

Let a balanced six-coloured graphon have a parity cut: inside each of its
equal halves the hues are $`0,1,2`$, and between halves they are $`3,4,5`$.
Write each half as a probability space, so its allowed hue rows have degree
$`1/3`$. A palette is present if its rainbow-triangle density is positive.
The inside palette $`012`$ is always present. In either half, sample three
vertices and independently colour the three edges according to their
kernels. The probability two prescribed incident edges have the same hue
is $`1/3`$. Inclusion–exclusion therefore gives
$`\Pr(\mathrm{rainbow})=2\Pr(\mathrm{monochromatic})`$.
The latter is positive by sampling a finite three-colour Ramsey complete
graph and summing over its triples.

**Lemma.** For each cross pair $`i,j`$, at most one of $`0ij,1ij,2ij`$
is absent.

Suppose two are absent, and let $`A`$ be the kernel of the third inside hue
in the left half. For almost every right vertex $`z`$, let $`P_z,Q_z`$ be
the support of the left row of $`i,j`$, respectively. Fubini applied to
both absent palette integrals gives $`A=1`$ almost everywhere on
$`P_z\times Q_z`$. Since their measures are at least $`1/3`$ by cross
balance and boundedness, the inside row degree gives equality for both.
In particular the cross rows of $`i,j`$ are indicators and $`P_z,Q_z`$
are disjoint up to null sets. Also by row degree, on almost all of $`P_z`$
the entire $`A`$-row is $`\mathbf1_{Q_z}`$; on almost all of $`Q_z`$ it
is $`\mathbf1_{P_z}`$.

For completeness, regard a row as an element of $`L^1`$, modulo null sets.
Any class of rows equal to $`\mathbf1_T`$ with $`\mu(T)=1/3`$ has measure
at most $`1/3`$: by symmetry and Fubini almost every row indexed by $`T`$
is 1 on almost all of that class. Consequently $`P_z,Q_z`$ are themselves,
up to null sets, whole row classes of measure $`1/3`$. There are at most
three such classes, and the union of those that arise as some $`P_z`$
has full measure: almost every left vertex lies in $`P_z`$ for a set of
right vertices of measure $`1/3`$, by cross balance and Fubini. Thus there
are exactly three. If one of those row classes is $`P_z`$, its common row
is the indicator of the distinct class $`Q_z`$, whose common row in turn
points back to $`P_z`$. This is a fixed-point-free involution on three
classes, a contradiction.

## Necessary pattern of holes in a counterexample limit

Suppose exactly balanced finite colourings with no two disjoint
complementary rainbow triangles have a parity graphon as a coloured cut
limit. Each present even palette has $`\Omega(n^3)`$ triangles, so it is
rich (it has at least four vertex-disjoint triangles) for all sufficiently
large members of the sequence. Then no triangle of its complement can
occur: any three vertices meet at most three disjoint triangles. In
particular $`345`$ cannot occur.

A missing even palette other than $`012`$ can be treated as an assignment
of an inside hue to a cross pair. The lemma makes this a partial function
from the three cross pairs. Let $`F`$ be the largest possible family
consistent with the positive limit palettes: keep each present even palette
and replace each missing even palette by its odd complement. The finite
rich palettes are a subset of $`F`$. By the transversal abundance results
in [ONE-TWO-THREE-TRANSVERSALS.md](ONE-TWO-THREE-TRANSVERSALS.md) and
[PAIR-TRIANGLE-TRANSVERSALS.md](PAIR-TRIANGLE-TRANSVERSALS.md), the rich link at
every hue is connected for all sufficiently large admissible orders.
Consequently every link in $`F`$ must be connected as well.

- With at most one hole, some inside hue occurs in no odd palette of $`F`$.
  Its link then has no edge between the two other inside hues and the
  three cross hues, so is disconnected.
- If two holes use the same inside hue $`a`$, write their cross pairs as
  $`ij,ik`$. In the link of $`a`$ there is no even edge $`ij`$ or $`ik`$,
  and the odd complements of those holes omit $`a`$. The only other
  possible odd complement uses $`i`$, not $`j`$ or $`k`$.
  Thus the nonempty proper set $`\{j,k\}`$ has no link edge leaving it.

Therefore exactly two or three holes exist, on distinct inside hues and
distinct cross pairs. Up to relabelling the only remaining even hole sets
are $`\{034,135\}`$ and $`\{034,135,245\}`$.

This does not show that either hole set is realizable. The supplied [exact](parity_triangle_hole_example.py)
12-type example shows why it does not suffice merely to forbid holes on
two different inside hues: its holes are $`034,135,145`$, involving two
different inside hues, but a repetition makes its completed link
disconnected.
