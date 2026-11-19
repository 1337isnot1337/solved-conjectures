# Direct proof used by the Lean formalization

This proof derives the two rational identities from the actual Bulgarian-solitaire
operation. It does not assume the general rationality or degree-bound theorem
used in `PROOF.md`. The finite polynomial computations and the connection with
finite orbits are separate proof steps.

## Reverse moves and the infinite state

A positive partition is a multiset of positive integers. If its length is
`m`, a distinct part size `v` can be selected for a reverse move exactly when
`v ≥ m - 1`. The move deletes one occurrence of `v`, increments all remaining
parts, and adds `v + 1 - m` ones. Its length is `v`. Applying ordinary forward
Bulgarian solitaire recovers the original partition. Every positive, nonempty
preimage arises from exactly one selected size. These statements are proved in
[`DenominatorDynamics.lean`](../../lean/Conjectures/DenominatorDynamics.lean).

Fix a reference length `L`. Write the beginning of a descending partition as

```math
\lambda_i=L-1-i+a_i,
\qquad s=m-L.
```

The infinite state consists of a sequence of nonnegative integers `a`, an
integer offset `s`, and a finite bound beyond which `a_i ≤ 1`. The bound only
certifies a finite search; changing it does not change the move set or path
counts. A legal selected index satisfies

```math
j+s\le a_j,
\qquad j=0\quad\text{or}\quad a_j\ne a_{j-1}+1.
```

The second condition selects the first occurrence of a repeated physical part
size. The reverse move gives

```math
a'_i=
\begin{cases}
a_i+1,&i\lt j,
\\ a_{i+1},&i\ge j,
\end{cases}
\qquad s'=a_j-j-1.
```

`DenominatorForest.lean`, `DenominatorHead.lean`, and
`DenominatorFiniteLists.lean` prove these formulas and the correspondence between
legal indices and distinct actual selected sizes. The descending order and
positivity conditions are preserved.

Let `G_t(x)` count all finite reverse paths from an infinite state `t`, including
the empty path. Paths retain multiplicity even when their terminal infinite
states agree. The defining equation is

```math
G_t=1+x\sum_{j\text{ legal in }t}G_{t\cdot j}.
```

The coefficient of degree `n` is the number of paths of exactly `n` moves.
`DenominatorSeries.lean` proves this equation and the following uniqueness
principle: if a family of formal power series satisfies homogeneous equations
`E_t = x Σ E_child`, then every `E_t` is zero. The proof is induction on the
coefficient degree.

## Finite prefixes

For a finite list `a`, let `a · j` be its reverse update with the selected entry
deleted. Its length is exactly `length(a) - 1`. Define

```math
D(a,s)=1+x\sum_{j\text{ legal in the head}}D(a\cdot j,a_j-j-1),
\qquad F(a)=D(a,-|a|).
```

Every recursive call shortens the list. These expressions are polynomials,
defined directly by recursion on the head length. Adding the same nonnegative integer to
every entry of `a` leaves `F(a)` unchanged; adding that integer to both the head
and offset leaves `D(a,s)` unchanged.

Suppose a finite prefix is separated from a tail by a gap of at least two in
the head coordinates. If a head entry is selected, the tail becomes permanently
ineligible. The remainder of that branch therefore has series `D`. If a tail
entry is selected, all head entries increase by one, preserving the separation
and the value of `F`. The uniqueness principle gives the exact factorization

```math
G_{a\mid t}=F(a)G_t.
```

The offset in this formula is the tail offset minus the head length.
`DenominatorSplice.lean` and `DenominatorDecomposition.lean` prove the necessary
move-set decompositions and this product identity.

Both words in the result begin with `00` and end with `1`. Cut the periodic
binary sequence just before its initial `00`, and call the resulting tail
`t_0`. Its offset is zero. Let `t_1` be the state after selecting its first
zero.

For a finite head ending in a positive entry and satisfying `|a| + s ≥ 0`,
the only possible tail move before a head move is selection of the first zero.
It is legal exactly when `|a| + s = 0`. That move increments the head and
creates the separated situation above. Define the second polynomial by

```math
B(a,s)=\mathbf 1_{|a|+s\le0}\,xF(a)
  +x\sum_{j\text{ legal in the head}}B(a\cdot j,a_j-j-1).
```

Induction on the head length proves

```math
G_{a\mid t_0,s}=D(a,s)+B(a,s)G_{t_1}.
```

This is `special_prefix_series` in `DenominatorSpecialTail.lean`. Its hypotheses
are derived for every cyclic phase of either word in `DenominatorPeriodic.lean`.

## The rational identities

For phase `q = 0`, take the empty head. For `1 ≤ q < p`, take the suffix of
the word beginning at `q`. The initial offset is the preceding bit minus one.
Let `D_q` and `B_q` be the corresponding polynomials. Then

```math
G_q=D_q+B_qG_1,
\qquad (1-B_1)G_1=D_1.
```

The level series is

```math
H=(1-x)\sum_{q=0}^{p-1}G_q.
```

Consequently, with `A = Σ D_q` and `B = Σ B_q`,

```math
(1-B_1)H=(1-x)\bigl(A(1-B_1)+BD_1\bigr).
```

This identity holds in the ring of formal power series without a rationality
assumption. The recursive polynomial certificate computes its four finite
inputs. Put

```math
f=x^3+4x^4+6x^5.
```

For both words, `B_1 = f²`, so the common denominator is `1 - f²`. For the
primary word, the computed numerator is `R(1 + f)`. The factor `1 + f` is a
unit in the formal-power-series ring because its constant coefficient is one.
Cancelling it gives the denominator `1 - f` of degree five. For the dual word,
the computed numerator is the stated `R_*`, and the denominator `1 - f²` has
degree ten. The exact Bézout identities in `Denominator.lean` establish
coprimality in both cases.

The minimal-degree claim follows without any bound on a proposed alternative
representation. If `QH = R` and `BH = A`, then `BR = QA`. A Bézout identity
`UQ + VR = 1` gives

```math
B=Q(UB+VA).
```

Thus the reduced denominator `Q` divides every alternative denominator `B`.
For nonzero `B`, its degree is at least the degree of `Q`. This argument is
formalized in `DenominatorMinimality.lean`; it gives the lower bounds five and
ten attained by the displayed denominators.

`prefix_certificate.py` generates integer coefficient proposals for the finite
recursions. The Lean certificate checks each proposal using the recursive
equations and polynomial normalization. The generator is not a trusted proof
component.

## Stabilization of actual finite orbits

The finite roots for a word of length `p` repeated `k` times have `L = pk` and
parts

```math
\lambda_i^{(q)}=L-1-i+b_{q+i}
```

with zero parts omitted. `DenominatorCycles.lean` proves their positivity,
descending order, exact length offset, and agreement with the infinite roots.
`DenominatorCycleOrbit.lean` proves that a reverse move selecting the largest
pile rotates the word, and that the ordinary forward move reverses this
rotation. When `L ≥ p + 1`, distinct rotations give distinct actual cycle
partitions. The two concrete words have ten distinct rotations.

After `d` legal reverse moves, every head value is at most `d + 1`, and the
offset is at least `-d - 1`. Every legal index is therefore at most `2d + 2`.
The finite proof also excludes legal indices beyond the tracked prefix by
comparing their pile sizes with the last tracked pile and the actual partition
length.

More precisely, if a finite partition agrees with an infinite state on `W`
entries and `W ≥ 2d + 3r + 4`, their reverse-path counts for the next `r` steps
are equal. One reverse move reduces the tracked prefix by one entry and raises
the depth bound by one. Induction proves the statement for every `r`.
This is `pathCount_eq_actual` in `DenominatorLocality.lean`.

For the cyclic roots it suffices that

```math
L\ge3n+5.
```

Thus the equality of finite and infinite path counts holds at every fixed
depth for all sufficiently large repetitions. It is not a finite coefficient
screen.

For either length-ten word, the explicit sufficient bound `k ≥ n + 2` also
ensures that the finite cycle contains ten distinct partitions. The theorems
`primary_level_stabilizes` and `dual_level_stabilizes` state equality with the
actual level cardinalities for every such `k`.

The forward map is deterministic. A positive, nonempty partition has at most
one reverse path of a specified length to a specified cycle vertex. Summing
exact-length reverse-path counts over the cycle therefore counts partitions
that first reach the cycle in at most that many steps. Subtracting consecutive
counts gives the exact first-entry level sizes, which explains the factor
`1 - x` in `H`. The nonempty condition is required because the multiset formula
for `forward` is not a positive-partition operation at the empty multiset.

The source-build, axiom-audit, and independent-kernel status of these modules
is recorded separately in [the Lean status](../../docs/lean-status.md).
