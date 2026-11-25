# Partial Lean verification: Nuttall’s conjecture

[Lean module](../../lean/Conjectures/NuttallThetaKernel.lean) · [Written proof](PROOF.md) · [John Nuttall, equation (1.3) and §4.5](https://publish.uwo.ca/~jnuttall/det3CAEXP_2.pdf)

Lean defines the exact summand at source index `n+1` and sums over all natural numbers. Every summand is positive for nonnegative real arguments. A summable geometric majorant verifies absolute convergence, continuity on the nonnegative half-line, and a uniform exponential decay bound for the kernel itself.

For positive cumulant order `m = n+1`, Lean uses the written proof’s single-integral formula with weight `v^n / n!`. It proves that the integrand is integrable and positive on the open half-line and that the resulting cumulant is strictly positive at every nonnegative argument. This covers the order-one minor of every cumulant kernel in that formulation. Index zero is the literal theta kernel.

The [literal iterated-tail module](../../lean/Conjectures/NuttallRepeatedTails.lean) separately uses the source recursion `Ψ₀ = Φ`, `Ψₘ₊₁(u) = ∫ t in (u, ∞), Ψₘ(t)` and checks that all iterates are integrable, continuous, strictly positive, and bounded by the same exponential majorant on the half-line. Its order-one endpoint requires only nonnegative arguments.

The [first-mode module](../../lean/Conjectures/NuttallThetaTail.lean) proves the undifferentiated part of §3. Set $y=\pi e^{4t}$ and $F_0=2\pi^2 e^{9t-y}$. The first term is exactly $F_0(1-3/(2y))$. For every nonnegative argument the remaining terms sum to a nonnegative amount at most $C F_0 e^{-3y}$ for an explicit finite constant $C$. Therefore $\Phi/F_0\to1$, and for all nonnegative arguments Lean also checks $\Phi(t)\le 2\pi^2(1+C)e^{-e^{2t}}$ (the order-zero case of the bound used in §3). Only the two formula definitions gained visibility to the new module; the underlying definitions and proofs were not changed.

The [individual-term derivative module](../../lean/Conjectures/NuttallThetaTermDerivatives.lean) sets $z=(n+1)^2\pi e^{4t}$ and represents the $j$th derivative of the $n+1$st theta summand by $e^{t-z}P_j(z)$. It checks $P_0(X)=2X^2-3X$ and $P_{j+1}=P_j+4X P_j'-4X P_j$, with exact degree $j+2$ and leading coefficient $2(-4)^j$. These statements hold for every real argument and every order.

The [termwise series module](../../lean/Conjectures/NuttallThetaTermSeries.lean) proves local uniform summability of the differentiated modes on bounded real intervals. The literal theta series can therefore be differentiated termwise in every order at all real arguments. For each fixed order $j$, Lean checks a bound $|\Phi^{(j)}(t)|\le C_j e^{-e^{2t}}$ for all $t\ge0$. It also bounds the difference from the $j$th derivative of the first summand by $C'_j e^{t-2y}$, with $y=\pi e^{4t}$. This is enough to isolate the exponentially smaller scale of every fixed-order tail, not a formalization of the higher Wronskian asymptotics.

The [literal tail calculus module](../../lean/Conjectures/NuttallTailCalculus.lean) proves continuity and integrability on every real tail and the exact identity $\Psi_{m+1}'(u)=-\Psi_m(u)$. Lean proves both index ranges: $D^j\Psi_{m+j}=(-1)^j\Psi_m$ and $D^{m+j}\Psi_m=(-1)^m D^j\Phi$, including the endpoint $u=0$. These identities use the literal recursive tails, not the weighted formula.

The [weighted-moment module](../../lean/Conjectures/NuttallTailMoment.lean) verifies every moment $\int_0^\infty v^k\Psi_m(u+v)\,dv=k!\,\Psi_{m+k+1}(u)$ for nonnegative $u$ and arbitrary natural $k,m$. It uses exact translation for the base case and integration by parts with checked integrability and both boundary limits. At $m=0$ this identifies the weighted formula with the literal recursion for every cumulant order, including order zero and the endpoint $u=0$.

The higher Wronskian asymptotics and higher minor signs remain unchecked. No implication for the separate RH-equivalent problem is claimed. John Nuttall proposed the conjecture; the written proof’s original provenance and priority caveat remain unchanged.

## Verification

[Literal repeated-tail receipt](verification/repeated/receipt.json) · [First-mode and single-integral receipt](verification/asymptotic/receipt.json) · [Individual-term derivative receipt](verification/term-derivative/receipt.json) · [Termwise series receipt](verification/term-series/receipt.json) · [Tail calculus receipt](verification/tail-calculus/receipt.json) · [Weighted-moment receipt](verification/moment/receipt.json). Each receipt lists the required endpoints and exact source hashes. Reproduce with `scripts/verify_lean_target.py` using the corresponding listed root and required endpoints and the pinned Mathlib cache. This does not verify the rest of the written argument or certify the aggregate repository gate.
