# Incidence degree at the saturated petal-order threshold

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This extends the equality-order analysis beyond the first
jump to all saturated parameters. At the generalized order
threshold, every vertex must belong to at least
$`\binom{m-1}{s-1}`$ hyperedges. For $`s\ge2`$ even the
least positive allowed degree therefore grows with $`t`$.

Assume the local span condition, $`\tau>t`$,
$`r=5t+3s-2`$, $`m=t+s`$ minimum intersection, and
$`m>2s`$ in the near-threshold range.
Set
```math
p=r-2m+s=3t+2s-2,\quad
D=\binom ms,\quad M=\binom{m-1}{s-1}=\frac{s}{m}D.
```
Write the number of incident ground vertices as
```math
n=(2r-m)+mp/s+h,\qquad h\ge0.
```
The right side is the [all-cut petal order bound](NEAR-THRESHOLD-PETALS.md)
plus its defect. For each integer $`0\le k<M`$, there are at most
```math
(k+1)\frac{Mh}{M-k}
```
vertices of incidence degree at most $`k`$. Thus if $`h=0`$
every vertex has degree at least $`M`$. At $`s=1`$
the [separate first-jump argument](SMALL-ORDER-MINIMUM-DEGREE.md)
gives the stronger degree-four conclusion at equality.

## Proof

Fix a minimum pair $`A,B`$ and let $`X=A\cap B`$.
Choose one standard witness $`E_S`$ for every
$`S\in\binom Xs`$. Saturation implies that $`E_S\cap X=S`$,
that these chosen edges are all distinct and minimum to
both $`A,B`$, and that every exterior $`W_S=E_S\setminus(A\cup B)`$
has exactly $`p`$ points. Exterior petals for disjoint cuts
are disjoint. For each exterior vertex $`v`$, the cuts whose
petals contain it therefore form an intersecting $`s`$-family
on the $`m`$-set $`X`$. Its size $`d_v`$ is at most $`M`$
by Erdős–Ko–Rado (or the [Kneser bound](NEAR-THRESHOLD-PETALS.md#3-use-all-cuts-of-the-minimum-intersection)).
It is also at most the incidence degree of $`v`$, because the
chosen witnesses are distinct.

There are $`mp/s+h`$ exterior vertices and the sum of the
$`d_v`$'s is exactly $`Dp=Mmp/s`$. Hence
```math
\sum_{v\notin A\cup B}(M-d_v)=Mh.
```
At most $`Mh/(M-k)`$ exterior vertices can have true incidence
degree at most $`k`$, because each of them contributes at least
$`M-k`$ to this nonnegative sum.

Finally, the minimum-pair graph has a matching of size
at least $`\lceil D/2\rceil`$. Discard its isolated vertices;
every remaining graph vertex $`A`$ has at least $`D`$ neighbors,
since from any minimum pair $`A,B`$ the $`D`$ standard
witnesses are distinct minimum neighbors of $`A`$.
The endpoints of a maximal matching cover all edges. If
there is an unmatched vertex then its at least $`D`$ neighbors
are among those endpoints, so the matching has size at least
$`\lceil D/2\rceil`$. If the matching is perfect, the degree
bound already implies the same conclusion.
Since $`M<D/2`$, choose $`k+1`$ such hyperedge-disjoint
minimum pairs. Any vertex of incidence degree at most $`k`$
lies outside the union of at least one of the chosen pairs.
Summing the outside estimate proves the global bound.

## Uniqueness of exterior petals at equality

When $`h=0`$, for every selection of representatives at every
minimum pair, the Kneser equality condition says that each
exterior vertex belongs to the petals of exactly the cuts
containing a single index $`x\in X`$. Equivalently the
exterior partitions into pools of size $`p/s`$, with the
petal of cut $`S`$ equal to the union of the pools indexed
by $`S`$. The equality and divisibility conclusions are
also proved in [Near-threshold petals](NEAR-THRESHOLD-PETALS.md).

This assignment is independent of the choice of witnesses.
Change the chosen witness for just one cut $`S`$. The cut
membership set of each exterior vertex can change on at
most that one cut. But the membership sets before and after
are both full stars; distinct stars differ on at least two
cuts, since they have the same size. No membership set
changes, so the petal for $`S`$ was unique.
This leaves an exact partition condition at every
minimum pair, not a claim that equality can be attained.

## Stable pools for all witnesses, not just one selection

Assume $`s\ge2`$ and $`2s^2(s-1)<m-1`$. At a fixed minimum
pair, all but at most $`2h`$ exterior vertices can be assigned
a single index in $`X`$, independent of all representative
choices. **Every** witness for cut $`S`$ can use an assigned
vertex only when its index is in $`S`$. In particular the
partition model is stable when $`s=o(t^{1/3})`$.

For an exterior vertex $`v`$, take the family
$`\mathcal C_v`$ of all cuts which have **some** witness
with $`v`$ in its exterior. It is intersecting, because
actual witness petals for any two disjoint cuts are disjoint,
irrespective of which witnesses are chosen.
If a nonempty intersecting $`s`$-family on $`X`$ has empty
common intersection, fix a member $`S_0`$ and, for each
$`x\in S_0`$, choose a member $`T_x`$ missing $`x`$.
Every member contains some $`x\in S_0`$ and some
$`y\in T_x`$; hence the family has size at most
$`s^2\binom{m-2}{s-2}`$. Our inequality makes this
less than $`M/2`$.
A family with two common points also has size at most
$`\binom{m-2}{s-2}<M/2`$. Consequently
$`|\mathcal C_v|>M/2`$ guarantees one unique common index.

At most $`2h`$ exterior vertices have
$`|\mathcal C_v|\le M/2`$: for any fixed selection
their incidences $`d_v`$ are at most $`M/2`$, so they
cost at least $`M/2`$ each in the deficit identity.
Assign the remaining vertices to their unique index.
Let $`P_x`$ denote the set assigned to $`x`$.
In any fixed selection of witnesses the total missing
points of the expected pool unions is bounded by
```math
\sum_{S\in\binom Xs}
 \left|\left(\bigcup_{x\in S} P_x\right)\setminus W_S\right|
\le Mh.
```
Indeed each assigned vertex belongs to exactly $`M`$
expected cuts, and is present wherever selected precisely
$`d_v`$ times, so the contribution is $`M-d_v`$.
The average over cuts is at most $`sh/m`$. The unassigned
vertices can enter a petal but number at most $`2h`$ in
the entire exterior, not per cut.

## A three-family degree bound at equality

If $`h=0`$ and $`t\ge14s`$, every vertex has incidence degree
at least
```math
M+2\binom{t-1}{s-1}.
```
The added contributions are from the two opposite
secondary systems at a single pivot.

First take a vertex $`v`$ outside a minimum pair $`A,B`$.
Its pool index $`x`$ gives $`M`$ different primary witnesses
containing $`v`$, one for every $`s`$-cut containing $`x`$.
Choose an $`s`$-cut $`S`$ not containing $`x`$, and its
primary witness $`E_S`$, which misses $`v`$.
The pair $`A,E_S`$ is minimum. Here $`B`$ itself witnesses
the $`s`$-cut $`S`$, and its exterior does not contain $`v`$.
Thus the pool index of $`v`$ for $`A,E_S`$ belongs to
$`(A\cap E_S)\setminus S=U_S`$, a $`t`$-set.
Each of the $`\binom{t-1}{s-1}`$ cuts in $`U_S`$ containing
that index has a secondary witness containing $`v`$.
The same count applies to the other pivot $`B,E_S`$
with its cuts in $`V_S`$.

No such secondary witness on either side is one of the
primary witnesses $`E_T`$. If $`S\cap T\ne\varnothing`$,
a secondary cut wholly in a wing avoids $`S`$, whereas
$`E_T`$ contains a point of $`S`$. If $`S,T`$ are disjoint,
[two-wing balance](TWO-WING-BALANCE.md) gives each wing
overlap at least $`\tfrac12(m-(17/4)(3s-2))>s`$.
A secondary witness may meet the pivot intersection
in only the $`s`$ points of its cut, so it cannot be
that primary witness.

The two opposite secondary families at $`S`$ are also
disjoint. If $`F`$ served both, then in the pair $`A,E_S`$
its exterior would avoid the exterior of $`B`$, because
their cuts are disjoint. Thus $`F\cap(B\setminus A)
\subseteq V_S`$. Its $`B,E_S`$ cut would then give
$`|F\cap(B\setminus A)|=s`$. Both pairs $`F,A`$ and $`F,B`$
would be minimum, forcing $`|F\cap X|=m-s=t`$.
This contradicts the [minimum-triangle core bound](MINIMUM-TRIANGLE-CORE-BOUND.md)
since $`t>5s`$. Summing the three disjoint families
proves the degree assertion for $`v`$ outside a minimum pair.

If $`v`$ lies in the union of every minimum pair, its
degree is at least the size of the hyperedge-disjoint
matching of minimum pairs, which was at least $`D/2`$.
Here $`M+2\binom{t-1}{s-1}\le3M\le D/2`$, because
$`M=(s/m)D`$ and $`m\ge6s`$. This handles the remaining
vertices.
