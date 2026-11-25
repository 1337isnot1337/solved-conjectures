# Partial Lean verification: Nuttall’s conjecture

[Lean module](../../lean/Conjectures/NuttallThetaKernel.lean) · [Written proof](PROOF.md) · [John Nuttall, equation (1.3) and §4.5](https://publish.uwo.ca/~jnuttall/det3CAEXP_2.pdf)

Lean defines the exact summand at source index `n+1` and sums over all natural numbers. Every summand is positive for nonnegative real arguments. A summable geometric majorant verifies absolute convergence, continuity on the nonnegative half-line, and a uniform exponential decay bound for the kernel itself.

For positive cumulant order `m = n+1`, Lean uses the written proof’s single-integral formula with weight `v^n / n!`. It proves that the integrand is integrable and positive on the open half-line and that the resulting cumulant is strictly positive at every nonnegative argument. This covers the order-one minor of every cumulant kernel in that formulation. Index zero is the literal theta kernel.

The [literal iterated-tail module](../../lean/Conjectures/NuttallRepeatedTails.lean) separately uses the source recursion `Ψ₀ = Φ`, `Ψₘ₊₁(u) = ∫ t in (u, ∞), Ψₘ(t)` and checks that all iterates are integrable, continuous, strictly positive, and bounded by the same exponential majorant on the half-line. Its order-one endpoint requires only nonnegative arguments.

The [first-mode module](../../lean/Conjectures/NuttallThetaTail.lean) proves the undifferentiated part of §3. Set $y=\pi e^{4t}$ and $F_0=2\pi^2 e^{9t-y}$. The first term is exactly $F_0(1-3/(2y))$. For every nonnegative argument the remaining terms sum to a nonnegative amount at most $C F_0 e^{-3y}$ for an explicit finite constant $C$. Therefore $\Phi/F_0\to1$, and for all nonnegative arguments Lean also checks $\Phi(t)\le 2\pi^2(1+C)e^{-e^{2t}}$ (the order-zero case of the bound used in §3). Only the two formula definitions gained visibility to the new module; the underlying definitions and proofs were not changed.

The equivalence of the two integral formulations, positive-order derivative bounds, higher Wronskians, and higher minors are not formalized here. No implication for the separate RH-equivalent problem is claimed. John Nuttall proposed the conjecture; the written proof’s original provenance and priority caveat remain unchanged.

## Verification

[Literal repeated-tail receipt](verification/repeated/receipt.json) · [First-mode and single-integral receipt](verification/asymptotic/receipt.json). Each receipt lists the required endpoints and exact source hashes. Reproduce with `scripts/verify_lean_target.py` using the corresponding listed root and required endpoints and the pinned Mathlib cache. This does not verify the rest of the written argument or certify the aggregate repository gate.
