# Kovalev’s square-root Taylor-section zero-free conjecture

Independent final-statement review by the campaign integrator, 24 November 2026.

The accepted endpoint is `Conjectures.KovalevZeroFree.kovalev_conjecture`. It quantifies every natural `d > 2`, every natural Taylor-section degree `n`, and every complex point of norm at most one. Its coefficients are the actual iterated complex derivatives at zero divided by factorials of the principal square root of `sum i in range (d + 1), w^i`. This is the branch with value one at zero required by Kovalev’s original Conjecture 1.2. The stronger positive-length wrapper neither replaces nor weakens that endpoint.

The final module discharges the temporary remainder-identity parameter in Assembly using the actual beta-integral theorem. The proof at `z = 1` uses finite positivity; all other boundary points are covered by the integral identity on the entire real segment. The Taylor coefficient identification is proved locally near zero, where branch uniqueness applies. The final theorem has no coefficient, probability-law, coupling, integration, or convergence premise.

The integrator read the final theorem and assembly, the actual beta and remainder definitions, the transport and comparison endpoints, and the frozen Taylor and derivative/integral files. Separate reviewers checked the transport chain, Taylor bridge, and FTC bridge. The recorded proof is Sections 1–3 of `PROOF.md` at `6432592c03b24aed190ed7b3204ed942a40a8da4`, by Cinna Davis; proposer and earlier length-three proof credit remain with Leonid V. Kovalev. No stronger priority claim is made.

The source gate passed 21 fresh strict modules, 291 owned declarations (265 theorems, 6 private), all 31 required endpoints, and the exact 21-module stock-kernel replay. Only `propext`, `Classical.choice`, and `Quot.sound` occur. Publication registration, exact-tree site checks, aggregate CI, and public deployment have separate receipts and statuses.

The fractional-exponent and sharp-segment supplements remain unformalized; the adjacent Conjecture 1.3 is not claimed. This completes one existing entry, without counting fixed lengths or individual degrees.
