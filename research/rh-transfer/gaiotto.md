# Gaiotto's positivity conjecture

Status: open; no complete proof, counterexample, or successful transfer from the accepted RH source has been obtained. Uncounted.

Owner: analytic_targets. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80#issuecomment-7050737643). Date: 2026-11-20.

## Exact homogeneous formulation

The primary formulation inspected is Pavel Etingof, [*On Some Special Cases of Gaiotto's Positivity Conjecture*, SIGMA20(2024),063][E], Conjecture1.1. Gaiotto's original setting is broader and allows quasi-homogeneous potentials; see the [original paper][G], sections7.6–7.7, as cited by Etingof.

For a homogeneous polynomial $`W\in S^d\mathbb C^{n*}`$, put

```math
(P,Q)_W=\int_{\mathbb C^n}
 P(z)\overline{Q(z)}
 e^{-|z|^2+W(z)-\overline{W(z)}}\,dz\,d\bar z.
```

Use the filtration by total polynomial degree. The conjecture asserts that every finite filtered restriction is nondegenerate, and that the resulting graded form from left/right Gram–Schmidt biorthogonalization is positive definite. The nondegeneracy assertion implies the positivity assertion by deformation from $W=0$.

Its scalar consequence, separately stated as Conjecture1.2, is

```math
I(W)=\int_{\mathbb C^n}
 e^{-|z|^2+W(z)-\overline{W(z)}}\,dz\,d\bar z>0
\qquad\text{for every }W.
```

The scalar assertion is not the full filtered assertion, and proving it would not by itself settle every Gram determinant.

## Existing results and the attempted transfer

Etingof's Theorem1.3 proves the full homogeneous assertion when $n=1$. Theorem1.4 proves scalar positivity when $n\le d$. Those results are already in the literature and are not campaign outcomes.

The proposed transfer was to apply the same Schoenberg and total-positivity machinery used for Xi kernels. The primary source makes the missing step explicit.

Define, for $d>2$,

```math
F_p(t)=\frac1{\pi d}\int_{\mathbb C}
 |z|^{2p}e^{-|z|^2+2it\mathop{\mathrm{Re}}(z^d)}\,|dz|^2.
```

Radial/projective disintegration of the scalar integral uses $F_{n-1}(|W(z)|)$, up to fixed positive measure normalizations. The relevant Mellin–Fourier expression is

```math
\frac{\Gamma(is)\Gamma(n-ids)}{\Gamma(1-is)}.
\tag{1}
```

For $n\le d$, cancellation of the denominator's zeros supplies the positive-kernel argument. That is an existing proof, not a missing consequence of RH.

## Why the direct extension fails

The crucial point is that a positive projective average does not require its integrand to be positive at every projective point. Replacing that average by a pointwise positivity claim would strengthen the conjecture without justification.

Indeed, the first uncovered case already blocks that route. Etingof's Remark2.11 gives

```math
F_d(t)\sim
-\frac{\Gamma(1+1/d)}
 {d\,\Gamma(1-1/d)}
 t^{-2(1+1/d)}
\qquad(t\to+\infty).
\tag{2}
```

The coefficient is strictly negative for every integer $d>2$. When $n=d+1$, the scalar project's kernel is exactly $F_d$. Consequently, an argument claiming pointwise nonnegativity of all the radial kernels would contradict (2).

The uncancelled factor can also be seen directly in (1). At $s=-i$, the numerator is $\Gamma(1)\Gamma(n-d)$, finite and nonzero for $n>d$, while the denominator $\Gamma(0)$ has a pole. The analytically continued gamma ratio therefore has a zero there. The cancellation used in the smaller-dimensional proof is genuinely absent.

Neither observation disproves Gaiotto's conjecture. A homogeneous holomorphic $W$ cannot prescribe arbitrary projective values or arbitrary averaging weights. A valid counterexample must evaluate the actual constrained integral or an actual filtered determinant. No such counterexample was obtained.

## What RH does and does not supply here

The accepted source pin
[9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e)
supplies RH and the consequent real-zero structure for Xi.

The inspected Gaiotto argument uses a different gamma-ratio family. No identity connecting its missing projective average to the accepted Xi positivity statements has been established. Substituting an unrelated totally positive Xi kernel would change the integral being studied.

The Riemann-zeta reference in Etingof's bibliography is Gröchenig's survey of Schoenberg's theorem. The theorem used here is classical and does not require RH. The common terminology therefore identifies a possible method, but supplies no completed implication.

## Literature screen and decision

Both search engines were queried for the exact positivity-conjecture title, Gaiotto with nonvanishing integrals, homogeneous potentials, counterexamples, and current2025–2026 resolutions. The accessible primary sources remain Etingof's article and Gaiotto's original paper. Search results about quantum-supergroup versions of a different “Gaiotto conjecture” were excluded by comparing their statements.

No full resolution of the homogeneous target was located in this bounded screen. This is not an exhaustive priority certification. Since the direct kernel transfer is blocked and no replacement proof is available, this target is left open rather than counted as a fixed-dimensional extension or a solved conjecture.

## Sources

[E]: https://emis.de/ft/37016
[G]: https://arxiv.org/abs/2307.12396

- [E] Pavel Etingof, *On Some Special Cases of Gaiotto's Positivity Conjecture*, SIGMA20(2024),063,8pages. DOI: [10.3842/SIGMA.2024.063](https://doi.org/10.3842/SIGMA.2024.063). Conjectures1.1–1.2 and Theorems1.3–1.4; sections2.2 and3; Remark2.11. The final journal PDF and the [arXiv author text](https://arxiv.org/html/2402.17174v2) were inspected.
- [G] Davide Gaiotto, *Sphere quantization of Higgs and Coulomb branches and Analytic Symplectic Duality*, arXiv:2307.12396v1(2023). Original attribution and broader context; the exact formulation analyzed above is Etingof's explicitly stated homogeneous formulation.
