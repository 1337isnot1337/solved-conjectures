# Erdős–Pyber–Tuza rainbow six-cycle conjecture

**Four mixing colours suffice.** The [mixing-core theorem](MIXING-CORE.md) still forces a rainbow six-cycle when the positive-edge condition is imposed on just four of the six colours, with the same size and balance assumptions. The other two colours can have arbitrary macroscopic support holes even within the core.

Use the core sets and $r$ of that theorem. Fix one palette bit $p(c)$ for each colour, with three bits of each value. Let the two colours without a mixing hypothesis be $d,e$, and call the other four the mixing colours. As before, $Q(u,a)$ is the nonempty set of bits obtained from the available sides for colour $a$ at $u$, with the original parity bit $p(a)$ added modulo two. Nonemptiness uses only colour degrees and the number of exceptional vertices, not mixing.

Suppose there is no rainbow six-cycle. The rooted path proof now gives, for any edge $uv$ of colour $c$ and distinct terminal colours $a,b$ different from $c$,
```math
q\oplus q'=p(c)\qquad(q\in Q(u,a),\ q'\in Q(v,b))
\tag{1}
```
whenever the three colours outside $`\{a,b,c\}`$ are all mixing. Indeed these three colours alone are used for the three interior transitions between core reservoirs. The terminal edges are already available by definition.

## From the available-side sets to two vertex bits

Fix a vertex $u$. Take any edge of colour $d$ at $u$ and use terminal colour $e$ at the other endpoint. Vary the terminal mixing colour at $u$ in (1). It follows that the available-side sets for all four mixing colours of $u$ are equal singletons; denote their bit by $q_u$. Using the same edge and placing $e$ at $u$ and a mixing colour at the other endpoint shows that $Q(u,e)$ is a singleton. An edge of colour $e$ similarly makes $Q(u,d)$ a singleton. Denote these last two bits by $D_u,E_u$.

On a mixing-colour edge $uv$ of colour $c$, use terminal colours $d,e$ in both orders in (1). Then
```math
D_u\oplus E_v=E_u\oplus D_v=p(c).
```
Hence $D_u\oplus E_u$ is constant along the mixing-colour edges. Their union is connected because it has minimum degree $4n$ on $6n+1$ vertices, and two components of sizes at least $4n+1$ do not fit. Write $\tau$ for the common bit $D_u\oplus E_u$. Define $s_u=D_u$ and $\alpha_u=q_u\oplus D_u$.

On a colour-$`d`$ edge, use the terminal colours $e$ and a mixing colour in both orders. Equation (1) then forces $\alpha_u=\alpha_v$ and
$s_u\oplus s_v=p(d)\oplus\tau\oplus\alpha_u$.
On a colour-$`e`$ edge the corresponding statements are $\alpha_u=\alpha_v$ and
$s_u\oplus s_v=p(e)\oplus\alpha_u$. On each mixing-colour edge, the crossing parity is simply $s_u\oplus s_v=p(c)\oplus\tau$.

## Exact degrees rule out the two-bit pattern

Let $g$ be the number of mixing colours whose crossing parity is one. There are only three colours of each original parity, so $1\le g\le3$ even after flipping them all by $\tau$. In particular both classes of $s$ occur. For $`a\in\{0,1\}`$ let $b(a)$ count which of the two nonmixing hues would cross the $s$-split at a vertex of secondary bit $a$, using the two formulas above.

Every vertex $u$ is adjacent to every vertex of opposite $s$-bit, so the size of that other class is exactly $(g+b(\alpha_u))n$. If the values of $b(\alpha_u)$ are constant over all vertices then both $s$-classes have the same size, impossible because their total size is odd. Otherwise both $\alpha$-classes occur and no $s$-class can contain vertices of both $\alpha$ values: they would prescribe different sizes for the same opposite class. As there are exactly two nonempty classes of each kind, the two partitions must then coincide. But both nonmixing hues have all their edges inside $\alpha$-classes, hence inside $s$-classes. Since each hue has positive degree, the crossing count $b$ is zero on both occupied classes, a contradiction.

This proves the theorem. The [cut-limit corollary](MIXING-CORE.md#consequence-for-cut-limits) therefore needs full support for only four allowed hues on their specified blocks: the same lower-bound transfer establishes their mixing hypotheses and places no support condition on the other two hues. It is still open whether every arbitrary balanced colouring has a rainbow six-cycle.
