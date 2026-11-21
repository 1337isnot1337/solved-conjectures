# López Pouso–Segura's node conjecture

The strict upper inequalities in published Conjectures 3 and 7 are false. One exact two-point Gauss–Legendre rule disproves both. For Conjecture 3, a controlled asymptotic expansion also proves failure at the smallest positive node for every sufficiently large even degree.

With $`\kappa=n+1/2`$, primary node $`x_i`$ and the source's secondary node $`z_i`$, the conjectured bound is
```math
\frac{x_i}{z_i}-1<\frac{\pi^2}{12\kappa^2}.
```
For $`n=2`$ the relevant ratio equals $`2/\sqrt3-1>1/7>\pi^2/75`$. For $`n=2m\to\infty`$, the stronger obstruction is
```math
\frac{x_{m+1}}{z_{m+1}}
=1+\frac{\pi^2}{12\kappa^2}
+\frac{\pi^4}{120\kappa^4}+O(\kappa^{-6}).
```
The positive fourth-order term rules out an eventual version of the exact upper bound. The leading asymptotic constant is unchanged.

Source: Óscar López Pouso and Javier Segura, *Uniform relations between the Gauss–Legendre nodes and weights*, Journal of Inequalities and Applications (2025), article 40, [published full text](https://link.springer.com/article/10.1186/s13660-025-03283-w), Sections 4.1 and 4.3.

- [Complete disproof](PROOF.md)
- [Independent mathematical audit](AUDIT.md)
- [Source and prior-resolution audit](SOURCES.md)
- [Research discussion, issue 184](https://github.com/1337isnot1337/solved-conjectures/issues/184)

The Legendre equation, weight formula, gamma-ratio asymptotics and prior general node/weight expansions are credited as existing mathematics. The contribution is their explicit contradiction to the published strict upper bounds. The two related assertions count as one package. The separate [Bessel-limit package](../lopez-pouso-segura-bessel/) concerns different limits and is compatible with this disproof.

Status: complete proposed disproof, independently reviewed internally; unrefereed. No earlier explicit refutation was found in the documented search. A related inaccessible full text remains an explicit priority-audit limit.

**Lean status:** none.

The exact two-node disproof is checked in [`Conjectures.LopezPousoSegura`](../../lean/Conjectures/LopezPousoSegura.lean), including the roots, weights, cubic quadrature and both inequalities. Strict compilation and isolated kernel replay passed; the eventual-even-degree strengthening and combined repository gate remain pending.
