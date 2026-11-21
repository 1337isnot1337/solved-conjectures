# Chen–Khare–Sahi's conjecture

The Muirhead-semiring implication in Conjecture 5 of Chen, Khare and Sahi's
*Majorization via positivity of Jack and Macdonald polynomial differences*
is false. The normalized Macdonald difference for
$`(4,2,0)\succeq(4,1,1)`$ at $`q=1/10,t=9/10`$ lies outside the full
Muirhead semiring.

A rational linear functional is nonnegative on every product needed to
generate the degree-six part of that semiring, while its value on the
Macdonald difference is

```math
-\frac{4538292661539}{106631184392870}\lt0.
```

The proof covers all semiring products through an exhaustive reduction to
38 products and seven ordinary monomials. It also proves that every
rectangular translate of the partition pair is a counterexample. A
Hall–Littlewood calculation supplies a continuous family of parameters
with the same obstruction.

This disproves the full equivalence asserted in Conjecture 5 through its
semiring clause. The weaker evaluation-positivity inequality remains a
separate question; Sra has proved that inequality for this same partition
pair. The Jack-semiring Conjecture 4 is not resolved by this package.

## Files

- [Proof](PROOF.md): the complete semiring separation and the infinite
  family of rectangular translates.
- [Hall–Littlewood parameter family](HALL_LITTLEWOOD.md): an independent
  interval calculation and continuation to admissible positive parameters.
- [Source and priority audit](SOURCE_AUDIT.md): primary definitions and
  quantifiers, earlier results, archive searches, and their limits.
- [Independent mathematical review](ANALYSIS_REVIEW.md).
- [Independent root review](ROOT_REVIEW.md): full semiring coverage, two polynomial-identification methods, family arguments and current source comparison.
- [Exact verifier](verify.py): all 38 products, the defining Macdonald
  difference equations, and the rational separating value.
- [Independent cone check](independent_cone_check.py): a separate
  implementation of the exhaustive semiring calculation.
- [Independent orthogonality check](independent_orthogonality_check.py):
  construction from the defining Hall inner product, without the branching
  or difference-operator code.

All three verification scripts use only the Python standard library:

```sh
python verify.py
python independent_cone_check.py
python independent_orthogonality_check.py
```

The written argument and rational certificates are complete. They have
been independently reviewed within this research campaign; no external
peer-review claim is made. Lean formalizes the exact source counterexample, including the full real semiring and monic triangular eigenfunction characterizations. The rectangular-translate and continuous-parameter refinements are not yet formalized; see the [Lean status report](../../docs/lean-status.md).

Primary source: Hong Chen, Apoorva Khare and Siddhartha Sahi,
[arXiv:2509.19649v2](https://arxiv.org/html/2509.19649v2), Conjecture 5,
equation (5.7). Coordination and discovery history are in
[issue #201](https://github.com/1337isnot1337/solved-conjectures/issues/201).
