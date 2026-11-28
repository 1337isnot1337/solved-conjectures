# Exterior-star shortcuts

The [exterior rotations](EXTERIOR-ROTATIONS.md) exposed labels not present on a path. This note instead starts with an actual cycle in the [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642). A vertex outside that cycle can be used to shorten it and at the same time add new chords. The two effects admit separate exact counts.

## Exact accounting

Let $`C`$ have length $`L`$ and $`k`$ chords, and let $`y\notin V(C)`$ have $`t\ge2`$ neighbors on $`C`$. In their cyclic order these neighbors partition $`C`$ into $`t`$ gaps. Suppose every gap has length at least two, as holds automatically in a bipartite graph. Write $`a_i`$ for the length in edges of gap $`i`$, $`U_i`$ for its open interior, and $`c_i`$ for the number of old chords with at least one end in $`U_i`$. Let $`C_i`$ replace the gap by the two-edge path through $`y`$.

Every rim edge lost belongs to the replaced gap. Every old chord survives, still as a chord, exactly when neither endpoint is removed. All $`t`$ marked neighbors survive, and two of their edges to $`y`$ are rim edges. Consequently
```math
|C_i|=L-a_i+2,\qquad k(C_i)=k-c_i+t-2.
```
In particular, for any $`\alpha\ge0`$,
```math
(k(C_i)-\alpha |C_i|)-(k-\alpha L)=t-2-c_i+\alpha(a_i-2).
```
Define $`D=2k-\sum_i c_i\ge0`$. A chord contributes zero to $`D`$ if its ends lie in two distinct gap interiors, one if both ends lie in the same interior or exactly one end is marked, and two if both ends are marked. Thus total improvement across the $`t`$ replacements is exactly
```math
t(t-2)+\alpha(L-2t)-2k+D.
```
Hands-on use of this identity need not assume any chord crossing pattern.

## Density and stock consequences

At a cycle maximizing chord fraction $`\rho=k/L`$ among all cycles of the host, no replacement increases $`k-\rho L`$. Hence every exterior vertex with $`t\ge2`$ satisfies
```math
\rho(L+2t)\ge t(t-2)+D.
```
This is a boundary constraint on a ratio-optimal cycle, not a lower bound on its length in arbitrary hosts. For example, if # Exterior-star shortcuts

The [exterior rotations](EXTERIOR-ROTATIONS.md) exposed labels not present on a path. This note instead starts with an actual cycle in the [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642). A vertex outside that cycle can be used to shorten it and at the same time add new chords. The two effects admit separate exact counts.

## Exact accounting

Let $`C`$ have length $`L`$ and $`k`$ chords, and let $`y\notin V(C)`$ have $`t\ge2`$ neighbors on $`C`$. In their cyclic order these neighbors partition $`C`$ into $`t`$ gaps. Suppose every gap has length at least two, as holds automatically in a bipartite graph. Write $`a_i`$ for the length in edges of gap $`i`$, $`U_i`$ for its open interior, and $`c_i`$ for the number of old chords with at least one end in $`U_i`$. Let $`C_i`$ replace the gap by the two-edge path through $`y`$.

Every rim edge lost belongs to the replaced gap. Every old chord survives, still as a chord, exactly when neither endpoint is removed. All $`t`$ marked neighbors survive, and two of their edges to $`y`$ are rim edges. Consequently
```math
|C_i|=L-a_i+2,\qquad k(C_i)=k-c_i+t-2.
```
In particular, for any $`\alpha\ge0`$,
```math
(k(C_i)-\alpha |C_i|)-(k-\alpha L)=t-2-c_i+\alpha(a_i-2).
```
Define $`D=2k-\sum_i c_i\ge0`$. A chord contributes zero to $`D`$ if its ends lie in two distinct gap interiors, one if both ends lie in the same interior or exactly one end is marked, and two if both ends are marked. Thus total improvement across the $`t`$ replacements is exactly
```math
t(t-2)+\alpha(L-2t)-2k+D.
```
Hands-on use of this identity need not assume any chord crossing pattern.

## Density and stock consequences

At a cycle maximizing chord fraction $`\rho=k/L`$ among all cycles of the host, no replacement increases $`k-\rho L`$. Hence every exterior vertex with $`t\ge2`$ satisfies
```math
\rho(L+2t)\ge t(t-2)+D.
```
This is a boundary constraint on a ratio-optimal cycle, not a lower bound on its length in arbitrary hosts. For example, if \rho\lt1`$, it implies $`t(t-4)+D<L`$ for every such exterior vertex.

A different consequence preserves stock. If
```math
2k-D\lt t(t-1),
```
some $`c_i\le t-2`$, so that $`C_i`$ keeps at least $`k`$ chords. If the graph is bipartite and $`C_4`$-free, every gap has length at least four: a length-two gap together with the two edges through $`y`$ would give a four-cycle. Thus this replacement strictly shortens $`C`$ by at least two while preserving stock, and strictly improves chord surplus. In particular, let $`C`$ be shortest among cycles with at least $`q`$ chords in such a host. It must satisfy the reverse inequality $`t(t-1)\le2k-D`$ at every exterior vertex with at least two neighbors on it. No assumption about the degree of vertices off the cycle was used.

There is a threshold-aware version. If only gaps of length at most $`L-\ell+2`$ may be removed to preserve length at least $`\ell`$, let $`I`$ be those gaps. If $`|I|(t-1)>2k-D`$, one of the allowed replacements preserves stock. If the goal is merely to improve $`k-\alpha L`$, the corresponding sufficient condition is
```math
|I|(t-2)+\alpha\sum_{i\in I}(a_i-2)>2k-D.
```
Both follow by summing over the eligible gaps and upper bounding their total chord losses by the total loss over all gaps.

## Sharpness for these local replacements

The strict threshold in the stock criterion cannot be relaxed to equality. For any $`t\ge2`$, arrange $`t`$ marks on a rim and put a vertex $`y`$ adjacent to exactly those marks. For each unordered pair of gaps put exactly one chord between private ports in their interiors, with distinct ports for different chords. Then the rim has $`k=\binom t2`$ chords, $`D=0`$, and each replacement loses exactly one chord: $`c_i=t-1`$ but adds only $`t-2`$. All these examples can be bipartite and have arbitrarily high girth. Prescribe all marks one color, give opposite colors to the two private ports of every chord, and give $`y`$ the other color. Replace each interval between consecutive marks or ports by a private rim path of sufficiently large length and of the prescribed parity. Every cycle must use an entire rim path, because the non-rim edges form a star and a disjoint matching. This is sharpness for the specified replacements, not an obstruction to all cycles or to high-minimum-degree forcing.

## What remains

The count needs a single exterior vertex with enough neighbors on the current support. The earlier [endpoint capture](README.md) and [exterior rotations](EXTERIOR-ROTATIONS.md) constrain neighborhoods, but neither gives the quadratic threshold uniformly at each shortening step. If no exterior vertex has two neighbors on the cycle, these replacements have no moves at all. The extremal conjecture remains open. For the general status and prior bounds see [Draganić et al.](https://doi.org/10.1002/rsa.21207) and [Draganić–Girão](https://arxiv.org/abs/2601.08769). No claim of priority is made for the shortcut or its edge accounting.
