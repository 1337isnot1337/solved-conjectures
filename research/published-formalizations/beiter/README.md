# Beiter's conjecture

Status: incomplete formalization of a published disproof. Tracking issue: [#541](https://github.com/1337isnot1337/solved-conjectures/issues/541). Campaign: [#534](https://github.com/1337isnot1337/solved-conjectures/issues/534).

This entry records the disproof of the original coefficient bound. It is a formalization of prior mathematics, with no discovery or priority claim.

## Source and attribution

Yves Gallot and Pieter Moree, “Ternary cyclotomic polynomials having a large coefficient,” *Journal für die reine und angewandte Mathematik* 632 (2009), 105–125. The exact source used is [arXiv:0712.2365v2](https://arxiv.org/pdf/0712.2365v2), dated 14 April 2008. Conjecture 1 gives the original claim. Table 2 on PDF page 4 supplies p=17, q=29, r=41, coefficient index 4801 and coefficient magnitude 10.

Sister Marion Beiter proposed the bound in “Magnitude of the coefficients of the cyclotomic polynomial F_pqr(x),” *American Mathematical Monthly* 75 (1968), 370–372, and repeated it in 1971. Gallot and Moree's acknowledgments credit Tiankai Liu with computing counterexamples in summer 2007 and describe Gallot and Moree's independent September 2007 computation. This entry preserves that priority qualification.

## Exact target

For every triple of primes with 2<p<q<r, each coefficient of the cyclotomic polynomial Phi_(pqr) has absolute value at most (p+1)/2.

The formalization proves the published witness by evaluating the coefficient at index 4801:
```math
[X^{4801}]\Phi_{20213}(X)=-10,
\qquad 20213=17\cdot29\cdot41.
```

Since (17+1)/2=9, this disproves the original universally quantified conjecture.

Gallot and Moree also prove stronger counterexample families for every prime p at least 11 and formulate a corrected bound. Those separate results are outside this entry's claim.

## Proof construction

The proof uses Mathlib's cyclotomic polynomial, rather than an independently defined coefficient table. The divisor product identities give
```math
(1-X)(1-X^{493})(1-X^{697})(1-X^{1189})\Phi_{20213}(X)
=(1-X^{17})(1-X^{29})(1-X^{41})(1-X^{20213}).
```

Multiply by finite geometric sums with steps and lengths (1,4802), (493,10), (697,7) and (1189,5). Their products with the denominator factors are 1 minus powers of X of degrees 4802, 4930, 4879 and 5945. All those degrees, and 20213, exceed 4801. Coefficient extraction therefore removes them at the chosen index.

After expanding the three small numerator factors, the desired coefficient is a sum of 350 elementary integer expressions, one for each triple in ranges 10, 7 and 5. Every expression is the alternating sum of eight indicators, corresponding to shifts 0, 17, 29, 41, 46, 58, 70 and 87. Kernel reduction of that finite sum gives -10.

This separates the polynomial identity and truncation argument from the finite arithmetic certificate. No native-computation axiom is used.

## Lean statement audit

Source: [PublishedBeiter.lean](../../../lean/Conjectures/PublishedBeiter.lean).

| Published object or condition | Lean representation |
| --- | --- |
| Three primes | p.Prime, q.Prime, r.Prime |
| Odd, distinct and increasingly ordered | 2 < p, p < q, q < r |
| Cyclotomic polynomial over the integers | Polynomial.cyclotomic (p*q*r) Int |
| Every coefficient | forall k : Nat, with the polynomial coefficient function |
| Bound (p+1)/2 | 2 times absolute coefficient is at most p+1 in Int |
| Full disproof | Published.Beiter.beiter_conjecture_false : not BeiterConjecture |

Doubling the inequality avoids division and is equivalent to the source bound. Coefficients beyond the degree are zero, so the unbounded natural coefficient index has the same scope as the source's height formulation. The use of a published finite witness refutes the full universal assertion; it is not merely confirmation of one numerical case.

## Reuse and duplicate screen

The bounded screen checked both repository branches, issues and pull requests, Mathlib and public Lean search results using Beiter, the authors' names, the source identifier and the cyclotomic coefficient formulation. No existing formalization of this exact conjecture was located. Classical examples already formalized elsewhere, including the original Fermat-prime and Euler sum-of-powers conjectures, were excluded.

Mathlib supplies the actual cyclotomic polynomials, the product over divisors identity, coefficient extraction and geometric-sum algebra. The witness arithmetic and full-negation bridge are owned by this entry.

## Verification state and remaining work

The complete candidate proof scripts are present. The local compile was interrupted with process exit 137 during shared runtime resource exhaustion, followed by loss of the execution environment. There is no successful full compile receipt for this module. It is not counted as a completed formalization.

Remaining gates:

1. Compile the complete module with the repository's pinned Lean 4.35.0 and Mathlib manifest; repair any elaboration errors exposed by that pass.
2. Audit all owned declarations for transitive axioms, allowing only propext, Classical.choice and Quot.sound.
3. Replay the generated module with the pinned stock kernel.
4. Register the module with the repository-wide import, audit and replay lists; run repository verification and publication checks.

The source contains no placeholder proof or project-specific axiom. Closed finite computations use Lean's ordinary decide tactic.
