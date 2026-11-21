# Simon's stable-infimum conjecture

For the spectrally negative strictly $`1/\alpha`$-stable Lévy process $`X^{(\alpha)}`$ normalized by $`\mathbb E e^{\lambda X_t^{(\alpha)}}=e^{t\lambda^{1/\alpha}}`$, define $`I_\alpha=-\inf_{0\le t\le1}X_t^{(\alpha)}`$. The mean-normalized infima increase in convex order throughout the full source interval:

```math
\Gamma(1+\beta)I_\beta\preceq_{\mathrm{cx}}
\Gamma(1+\alpha)I_\alpha,
\qquad \frac12\le\beta<\alpha<1.
```

This proves Remark 6 of Thomas Simon, [*Comparing Fréchet and positive stable laws*, Electronic Journal of Probability 19 (2014), no. 16](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/3058/3058-16117-1-PB.pdf), printed page 13. The Brownian endpoint is included.

The proof starts from the established Mellin transform of the stable infimum, credited to Patie and Simon. Malmsten's gamma integral gives two explicit Lévy densities for the logarithm of the normalized infimum. Both densities increase with the parameter, so each larger-parameter law is a product of the smaller-parameter law and an independent positive mean-one random variable. Conditional Jensen's inequality gives the conjectured convex order.

- [Complete proof](PROOF.md)
- [Source and priority audit](SOURCES.md)
- [Independent mathematical audit](AUDIT.md)
- [Issue 175](https://github.com/1337isnot1337/solved-conjectures/issues/175)

The proof is analytic and probabilistic. It uses no numerical evidence, finite-case inference or computer algebra. The independent audit checks the exact original statement, the Mellin strip, the endpoint, both Lévy kernels, all required integrability conditions and the martingale coupling. There is no numerical verifier to substitute for those arguments.

Status: complete proposed proof, independently reviewed internally; unrefereed. No earlier full resolution was found in the documented search. The classical stable factorization, Mellin transform and implication from an independent mean-one multiplier to convex order are credited as prior mathematics. The source audit records the search's limits.

**Lean status:** none.
