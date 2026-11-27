# Free whole demand pairs in the prescribed-parity problem

A reduction for [Chen’s prescribed-parity exact-one-marker
conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/1012).
It avoids using a parity-constrained gammoid. In a hypothetical
inductive counterexample, a tangle-freeness theorem finds whole
pairs whose terminals are all free. This settles the branch
where the resulting tangle is aligned with a large odd clique
minor. The other rooted parity-routing branches are not settled.

Work in the finite supply graph. Each demand is an unordered
pair of distinct terminals and has a prescribed path parity.
Demands are a matching. An eligible path is simple, has the
required ends and parity, and uses no marker edge. Paths in a
packing must have distinct demands. Write $`\tau`$ for the
minimum transversal of all eligible paths.

## 1. The counterexample tangle

Fix integers $`s\ge t\ge2`$. Assume inductively that an instance with no
congestion-two packing of $`t-1`$ eligible paths has transversal
number at most $`f(t-1)`$. Let $`\Theta`$ be any integer at least
$`(2s+2)^3+2`$. Suppose the instance has no congestion-two
packing of $`t`$ and satisfies
```math
\tau>\max\{3\Theta,\ \Theta+(t-1)f(t-1)\}.
```

For every vertex set $`S`$ of size less than $`\Theta`$, exactly
one component of $`G-S`$ contains eligible paths. There are
at most $`t-1`$ positive components because a path in each gives
an integral packing of distinct demands. If every positive
component had transversal at most $`f(t-1)`$, the displayed
bound would fail by taking their covers and $`S`$. A component
with greater transversal has a congestion-two packing of
$`t-1`$ by induction, so no other component has an eligible path.

For every separation of order less than $`\Theta`$, choose as
large the side containing that component off the separator;
write $`(A,B)\in\mathcal T`$ with the small side first. This is a
tangle of order $`\Theta`$. Indeed, a path avoiding the union
of any three separators exists, and its vertices lie off all
three of the small sides. No single small side spans $`G`$
either. For the subgraph definition of separations used by
Marx–Wollan, orient by the vertex sets of the sides; the same
argument gives their tangle axioms.

A set $`X`$ of vertices is **free** in $`\mathcal T`$ if there is
no $`(A,B)\in\mathcal T`$ of order less than $`|X|`$ with
$`X\subseteq V(A)`$. We will show that the union of the
terminals of $`s`$ full demand pairs can be chosen free.

## 2. Replace failed freeness by single-gate sides

Apply [Marx–Wollan, Theorem 3.3](https://cs.bme.hu/~dmarx/papers/marx-wollan-sidma-immersion.pdf#page=7)
with the family of terminal two-sets, $`k=2`$ and $`w=2s`$.
Under the contrary assumption that no $`s`$ whole pairs have
free terminal union, the theorem gives a set $`Z`$ with
$`|Z|\le(2s+2)^3\le\Theta-2`$ such that every pair avoiding
$`Z`$ is nonfree in the inherited tangle $`\mathcal T-Z`$.
In $`H=G-Z`$, the inherited orientation still sends every
eligible path avoiding the separator to the large side:
the corresponding original separation has the extra
vertices $`Z`$ in its separator.

Fix any demand with a surviving eligible path. Since its two
ends are nonfree in $`\mathcal T-Z`$, some small side $`A`$ of a
separation $`(A,B)`$ of order at most one contains both ends.
In order zero the entire path would be on the small side,
impossible. In order one, write $`v`$ for the separator.
A simple path with both ends in $`A`$ cannot visit $`B\setminus A`$:
it would have to pass through the same vertex $`v`$ twice.
So every eligible path for this demand lies in $`A`$, and
must use $`v`$, since paths avoiding the separator lie on the
large side. Choose one such separation and gate for every
surviving active demand.

## 3. Distinct gates pack disjointly

For each distinct chosen gate $`v`$ choose one corresponding
demand, its separation $`(A_v,B_v)`$, and one eligible path
$`P_v`$ for it. Paths at different gates have different demands.
We claim they are vertex-disjoint. If $`P_w`$ meets $`P_v`$
for $`v\ne w`$, then $`P_w`$ must use $`v`$, since otherwise it lies
in $`B_v\setminus A_v`$, disjoint from $`P_v\subseteq A_v`$.
Symmetrically $`P_v`$ uses $`w`$. In particular
```math
v\in A_w\setminus B_w,\qquad w\in A_v\setminus B_v.
```

Let $`C=(B_v\setminus A_v)\cap(B_w\setminus A_w)`$ in $`H`$.
Any edge from $`C`$ to its complement would have to go to
$`v`$ or $`w`$: crossing the first large side requires $`v`$,
and crossing the second requires $`w`$. But $`v`$ lies in the
small open side of the other separation, as does $`w`$ in
the symmetric case, so neither can have a neighbour in $`C`$.
Thus no edge leaves $`C`$.

Because $`\tau>|Z|+2`$, there is an eligible path in $`H`$ avoiding
both gates. It must lie inside $`C`$. On the other hand
$`P_v`$ lies outside $`C`$. These paths are in different components
of $`G-Z`$, contradicting the unique positive component proved
above for the separator $`Z`$. This proves disjointness.

There are therefore at most $`t-1`$ gates. Together with $`Z`$
they hit all eligible paths of the original instance, which
contradicts the displayed lower bound on $`\tau`$. This
proves freeness of the terminals of $`s`$ whole pairs.

## 4. The aligned odd-clique branch

Suppose $`G`$ contains an odd $`K_{7t}`$ model aligned with
$`\mathcal T`$ in the following sense: every separation of order
less than $`2t`$ having a whole branch set on one open side
is oriented by $`\mathcal T`$ towards that side. An odd clique
model here is the convention of the parity linkage theorem:
branch trees are properly two-coloured, and each prescribed
edge between different branch trees joins like colours.

Take $`t`$ whole pairs from §3; their $`2t`$ terminals are free as a subset of a free set. There is no separation
of order less than $`2t`$ with those terminals in one side
and an intact branch set in the opposite open side, by
alignment and freeness. Thus [Kawarabayashi–Wollan–Reed,
*The Graph Minor Algorithm with Parity Conditions*,
Lemma 3.3](https://ieee-focs.org/FOCS-2011-Papers/The%20Graph%20Minor%20Algorithm%20with%20Parity%20Conditions.pdf)
gives an **integral** routing of the $`t`$ prescribed pairs
with their specified parities, a contradiction.

The normalization to free whole pairs is independent of
the type of core and uses only eligible simple paths. It
does not assert that every tangle has an aligned odd
clique model, nor that ordinary rooted linkage preserves
parity. Those missing geometric cases are the next step.
