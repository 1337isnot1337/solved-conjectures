# A real planar witness at order sixteen

Lean proves that the published configuration at order 16 consists of sixteen noncollinear rational points. After embedding them in the real affine plane, every number of incident spanned lines occurs at most twice. Exactly two points have degree 9. This settles the existence question in Section 4, Problem 4 of Gyárfás’s paper. [Lean theorem](../../lean/Conjectures/GyarfasPlanarWitness.lean) · [Gyárfás’s original question](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf).

For each pair of distinct points, the formalization identifies its affine span with either the vertical line through the first point or the line with the computed slope. Different directions through a point give different sets of real points. An injective map from rational slopes to real slopes therefore preserves the number of distinct incident lines and the multiplicity of each degree. Three of the listed points form a noncollinear triangle. [Affine lines and directions](../../lean/Conjectures/GyarfasPlanarLines.lean) · [Transfer to the real plane](../../lean/Conjectures/GyarfasPlanarRational.lean).

The uniform construction for every order from 16 and its exact number of distinct degrees have a written proof. The independent checker computes the actual real-line incidences using primitive integer equations at 116 sample orders. [All-order proof](PROOF.md) · [Exact line counter](verify.py).

Independent research and publication runs each rebuilt three Lean modules from source, checked all 45 declarations and replayed every project module with the pinned stock kernel. The audit covered 31 theorems, nine private declarations and 13 required endpoints. [Verification receipt](verification/sixteen-receipt.json).

If you use the configuration or its Lean proof, please credit Cinna Davis, cite Gyárfás’s question and its attribution to Paul Erdős, and link both the author’s site and the proof record used. [Cinna Davis](https://itsdavis.com/) · [Specific proof record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/gyarfas-planar-degree-repetition).
