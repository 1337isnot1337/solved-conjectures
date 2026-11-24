# Lean formalization (incomplete)

Existing result: [PROOF.md](PROOF.md), which refutes Brennan Benfield and Oliver Lippard, [arXiv:2404.08193v2, Conjecture 10.1](https://arxiv.org/html/2404.08193v2#S10.Thmtheorem1), and discusses the intended reflection-domain interpretation of 10.2. This formalization follows the original repository proof (Davis / GPT-6.2 Astra attribution as recorded in the entry), specifically §1, §2's arithmetic, and the optional independent Apéry certificate. No new priority assertion.

Source: [WaringGapSymmetryCore.lean](../../lean/Conjectures/WaringGapSymmetryCore.lean).

## Checked partial result

For any additive membership predicate on natural numbers, the gap count up to a specified gap F obeys 2G >= F+1; a double-gap reflection pair forces strict inequality. For arbitrary positive reduction data satisfying the two certified relations, every nonnegative coefficient pair reduces, preserving the weight modulo x and subtracting a nonnegative multiple of x, to a reduced pair with weight bounded by the maximum of the two displayed corners. Both corners are reduced. Lean checks the exact determinant, truncation inequalities and gcd computations, and the numerical defects obtained from the explicit weight-sum formula at exponents 64 and 128.

This does not yet prove that the reduced pairs biject with the residues, the formulas for actual Frobenius number and genus, the four-generator truncation of the original infinite generating set, or the stable-offset identification. The numerical defect is not yet identified with the actual gap count. No completed conjecture is claimed.

## Verification receipt

- Source commit: [476865ed7557a36d33e032319fad34fa44d8f817](https://github.com/1337isnot1337/solved-conjectures/commit/476865ed7557a36d33e032319fad34fa44d8f817)
- SHA-256: `473eb47df7e303ccf714870856bb04e791d9cdc46227aeb4bd8d4b9a5ea0d549`
- Lean 4.35.0, compiler commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`, Linux x86-64
- Executed `lean -j1 -DwarningAsError=true -o Conjectures/WaringGapSymmetryCore.olean Conjectures/WaringGapSymmetryCore.lean` and a separate importing module with the following `#print axioms` statements. Both processes succeeded in the disposable runner.

| Endpoint | Axioms |
| --- | --- |
| twice_genus_ge, strict_defect_of_double_gap, corners_reduced | propext, Quot.sound |
| reduce_step, reduce, bounded_reduction | propext, Classical.choice, Quot.sound |
| shape_count64, shape_count128, truncation_arithmetic64, truncation_arithmetic128, numeric_defect64, numeric_defect128 | none |

The checked source imports only Init. These are endpoint audit results, not an all-owned audit or independent checker receipt. Full repository checks remain outstanding.
