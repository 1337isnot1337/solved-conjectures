# Modular root cover semantics

This document describes the semantic bridge from a finite normalized modular
root certificate to arbitrary five-coordinate natural-number inputs. The
concrete normalized cover is a separate finite certificate. These modules do
not assume that a Python or C++ search proves that certificate.

## Statements and scope

For a modulus `p`, write

\[
\operatorname{fold}_p(a)=\min(a\bmod p,\ p-(a\bmod p)).
\]

`NormalizedQuintuple p inv q` means that the five natural-number coordinates
of `q` satisfy all four conditions:

1. `q 0 = 1`.
2. The coordinates are strictly increasing.
3. `2 * q 4 ≤ p`.
4. For every pair of distinct coordinates `i,j`, the folded ratio
   `folded p (inv (q i) * q j)` is at least `q 1`.

The inverse function must satisfy

\[
a\operatorname{inv}(a)\equiv1\pmod p
\qquad(0<a,\ 2a\le p).
\]

`NormalizedRootCover p inv` states that every such normalized quintuple has
one of three outcomes: a modular loneliness witness at threshold `1/5`, at
least two distinct short zero forms, or a folded dilation of `{1,3,4}`.

`rootCover_of_normalized` turns that hypothesis into `GlobalRootCover p`.
Its other hypotheses are `2 ≤ p` and the displayed inverse property. For
every `v : Fin 5 → ℕ`, the global conclusion is the disjunction

\[
\begin{aligned}
&\text{a modular witness at threshold }1/5,\\
&p\mid v_i\text{ for some }i,\\
&p\mid(v_i-v_j)\text{ or }p\mid(v_i+v_j)\text{ for some }i<j,\\
&\text{at least two distinct short forms vanish modulo }p,\\
&\text{a folded dilation of }\{1,3,4\}\text{ occurs among the coordinates.}
\end{aligned}
\]

The input does not need to be sorted, distinct, positive, primitive, or
already reduced modulo `p`. The zero and collision branches cover precisely
the degeneracies excluded by strict normalized quintuples. The subsequent
prime-product argument includes the coordinate and signed-pair factors.

`rootCover_of_scalar_table` obtains the inverse property from the separately
checked scalar table. `rootOutcome_of_value_lt` removes the witness branch
when `Loneliness.value (List.ofFn v) < 1/5`.

## The 80 signed forms

A coefficient vector is a function `Fin 5 → ℤ`. `ShortShape` requires that
the sum of its five absolute coefficients is `3` and that each absolute
coefficient is at most `2`. `CanonicalForm` additionally requires that the
first nonzero coefficient is positive.

These conditions give exactly 80 forms:

- 40 forms of shape `2*v_i ± v_j`, with `i ≠ j`, modulo overall sign.
- 40 forms of shape `v_i ± v_j ± v_k`, with `i < j < k`, modulo overall sign.

`formRows : Fin 80 → Row` lists the vectors in lexicographic order.
`formRows_spec`, `formRows_complete`, `formRows_injective`, and
`formRows_eq_up_to_sign_iff` establish the shape, completeness, and uniqueness
of this list. The finite checks are Lean kernel computations over explicit
finite domains. The source does not use `native_decide`.

The 50 rows with both positive and negative coefficients are the later
positive integer relation catalogue. The other 30 rows cannot vanish on a
strictly positive integer tuple, but they can vanish modulo a prime. They
remain present throughout the modular root argument.

`TwoShortRelations p v` is the assertion that at least two indices in
`Fin 80` satisfy

\[
p\mid\sum_i r_i v_i.
\]

`twoShortRelations_iff` exposes two distinct indices. `exists_zero_form_ne`
allows the later prime-product argument to exclude any one designated
relation and retain another zero form.

## Computable structural leaf checker

`rootStructuralCheck p q` counts the zero forms once and tests five possible
bases for the folded `{1,3,4}` pattern. It does not enumerate pairs of the 80
forms. Its result implies

```lean
TwoShortRelations p q ∨ Folded134 p q
```

by `rootStructuralCheck_sound`. For `0 < p`,
`rootStructuralCheck_complete` proves the converse. The finite root scan can
therefore use this Boolean function as its structural leaf callback.

## Transport to unrestricted coordinates

The construction reuses `Loneliness.Modular.minimum_pair_normalization`.
For five distinct nonzero folded coordinates, that theorem produces a
common modular unit and its inverse. Sorting the resulting support gives
the strictly increasing `q` and a coordinate permutation `π` with

\[
q_i=\operatorname{fold}_p(u\,v_{\pi(i)}).
\]

The three normalized outcomes transfer as follows:

| Outcome | Formal transport |
| --- | --- |
| Modular witness | Existing folded-unit witness invariance and list permutation invariance |
| Two short zero forms | Coordinate signs, permutation, unit cancellation, and canonicalization modulo overall sign |
| Folded `{1,3,4}` | Multiplication of the pattern base by the inverse unit |

The short-form transformation is injective modulo overall sign.
`two_distinct_forms_signPerm` proves that two distinct canonical indices stay
distinct. The proof does not replace the two-relation condition by a weaker
single-relation statement.

## Files and verification

The implementation consists of these five modules in the Lean project:

- `Conjectures.LonelinessFiveSpeedRootSemanticsForms`
- `Conjectures.LonelinessFiveSpeedRootSemanticsDefs`
- `Conjectures.LonelinessFiveSpeedRootSemanticsNormalize`
- `Conjectures.LonelinessFiveSpeedRootSemanticsTransport`
- `Conjectures.LonelinessFiveSpeedRootSemantics`

All five source files pass Lean source checking. The transitive namespace
audit passes for 76 theorem declarations, using only `propext`,
`Classical.choice`, and `Quot.sound`. All five modules also pass independent
stock `leanchecker` replay, with one target per checker process.

The Forms and Defs replays were completed locally after the first hosted
root-star run stopped before its replay stage. No verification claim relies
on that failed run. The successful local replay receipts match all five
source hashes below.

| Module suffix | SHA256 |
| --- | --- |
| `Forms` | `da1326f1d3327a3635987873f69751e08593c491cec9185a2773cce9bf0f68ad` |
| `Defs` | `224f3bdc6c694529d359e0f5aadffe1a61d6400d9377897ed0007dd998d4869b` |
| `Normalize` | `6913ef544e631210fa61668287ef90c161e744a549a4325555c9e29864d81db8` |
| `Transport` | `ccd1a686ea3b0b7450aa59423f35b274668de8292c2e17ddee6e089f6ee82d79` |
| Final wrapper | `0f40fd4f4a488d93cd1e4467ad073c4e0f1a883a188b57f7c3815064f2731234` |

These semantic theorems do not assert a concrete normalized root cover or
the full five-speed classification. A concrete cover remains an explicit
finite premise in the root-cover transfer theorem.
