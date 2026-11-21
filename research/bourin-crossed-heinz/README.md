# Bourin's conjecture

Research only. The full conjecture remains unresolved in this checkpoint. No result is added to the collection's resolution count, and no priority claim is made for the endpoint lemmas or route obstructions below. Coordination: [issue 214](https://github.com/1337isnot1337/solved-conjectures/issues/214).

## Exact target

For arbitrary positive semidefinite complex matrices of the same finite order, positive real exponents, and every unitarily invariant norm, Bourin asks whether

```math
\|A^pB^q+B^pA^q\|_u\leq\|A^{p+q}+B^{p+q}\|_u.
```

This is Question 4 on printed page 6 of [Bourin's original manuscript](https://arxiv.org/pdf/0805.1954). Replacing the inputs by their powers and putting $`t=p/(p+q)`$ gives the equivalent full target

```math
s\bigl(A^tB^{1-t}+B^tA^{1-t}\bigr)
\prec_w\lambda(A+B),\qquad 0<t<1.
```

All dimensions, all intermediate Ky Fan sums, and the full interior parameter interval are part of the problem. The central parameter interval, dimension two, and the trace, operator, and Frobenius norms already have prior proofs; they are not new targets here. [SOURCE_AUDIT.md](SOURCE_AUDIT.md) identifies the exact current sources and access limits.

## What this checkpoint establishes

For each fixed pair, the conjectured weak-majorization inequality holds in some interior neighborhood of each endpoint. The width can depend on the pair. The proof first treats positive definite matrices in [ENDPOINT.md](ENDPOINT.md), then treats singular summands in [SINGULAR_ENDPOINT.md](SINGULAR_ENDPOINT.md). For each Ky Fan sum, either equality holds for every parameter or the inequality is strict in these neighborhoods. An exact logarithm-resolvent identity controls the derivative, and the equality case uses Tian–Xu's prior global operator-norm theorem.

The positive-definite proof has an independent [combinatorics review](COMBINATORICS_REVIEW.md). The singular extension was drafted by that lane and has a separate [algebra review](SINGULAR_REVIEW.md) and [root review](ROOT_ENDPOINT_REVIEW.md). These are mathematical reviews, not formal verification.

[BRIDGES.md](BRIDGES.md) records two exact failures of stronger proof routes: the symmetric sandwich need not contain a contraction, and a natural spectral multiplier sending the sum to the crossed sum need not contract either the operator or trace norm. It also records the positive-block reduction to a sandwiched sum, with its prior literature attribution. The sandwiched weak-majorization statement remains unproved here. [check_routes.py](check_routes.py) checks the rational identities in the two route obstructions; it does not verify the endpoint theorems or resolve the conjecture.

## Why continue this target

This is a general matrix norm question posed in 2008, with continuing work on it through the November 2026 primary manuscripts cited in the audit. A full solution would decide one weak-majorization inequality simultaneously for every unitarily invariant norm, beyond the separately established norm cases. The remaining obstacle is control of all intermediate singular-value sums. Endpoint inequalities for two norms of one matrix do not imply that control.

The next useful route must supply that missing Ky Fan control. The two failed contractions and the existing sandwiched-sum literature constrain such a route. Neither a positive finite screen nor a further isolated parameter case will be counted as a solution.
