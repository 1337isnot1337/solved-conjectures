# Independent analysis audit

## Reviewed statement and version

Reviewed the complete proof in [PROOF.md at f2abaf2acedb769421ca46827be9283faf34ed05](https://github.com/1337isnot1337/solved-conjectures/blob/f2abaf2acedb769421ca46827be9283faf34ed05/research/baricz-pogany-coefficients/PROOF.md).

The published primary source was independently read at [DOI 10.1007/s00365-023-09627-3](https://link.springer.com/article/10.1007/s00365-023-09627-3), Section 4.4. It defines the asymptotic coefficients by the displayed recurrence for $\alpha_n(\nu)$ and conjectures the strict inequality

```math
\alpha_n(\nu)>(\nu+1/2)^n
\qquad(n\ge2,\ |\nu|<1/2).
```

This is the full assertion proved in the candidate. The publisher records online publication on 2 March 2023, volume 58, pages 713–783.

## Mathematical audit

The proof passes. No mathematical correction was needed.

1. The normalization $a=\nu+1/2$ transforms the entire parameter domain exactly into $0<a<1$. The standard expansion of $I_\nu$ gives $c_n=(a)_n(1-a)_n/(2^n n!)>0$. The defining recurrence in the source is precisely $DA=N$, with constant coefficient $d_0=1$.
2. The denominator product has the exact telescoping ratio $d_n/c_n=-(n+a)/(n-a)$ for every $n\ge1$. The denominators are strictly positive throughout the stated domain. Hence $D=1-B$ with every nonconstant coefficient of $B$ positive.
3. The identity $d_n=c_n-(n+a-1)c_{n-1}$ follows from the explicit consecutive-coefficient ratio. It gives $D=(1-az)N-z^2N'$ in the formal power-series ring.
4. Consequently
```math
\frac{N(z)}{D(z)}-\frac{1}{1-az}
=\frac{z^2N'(z)}{(1-az)(1-B(z))}.
```

Every inverse on the right exists formally, and the geometric expansion of $(1-B)^{-1}$ has finitely many contributions in each degree. Its coefficients and those of $(1-az)^{-1}$ are nonnegative.
5. In degree $n\ge2$, the numerator contributes the strictly positive term $(n-1)c_{n-1}$. The other two factors each have constant coefficient one. Thus the stronger explicit bound $\pi_n(\nu)\ge(n-1)c_{n-1}>0$ follows without a limiting or numerical step.

The argument never sums the asymptotic expansion as an analytic power series. It proves its uniquely defined formal coefficient assertion. It also avoids differentiating an asymptotic error term.

## Independent prior-search supplement

On 20 November 2026, searches with both available web search engines used the exact author names, “Kaiser–Bessel” with “conjecture” and “coefficients”, “asymptotic-coefficient positivity”, “Bessel quotient asymptotic coefficients”, and the displayed $\pi_n$ and $\alpha_n$ terminology. These searches returned the original paper and related Bessel literature, without an exact earlier resolution.

The current [Baricz publication list](https://sites.google.com/site/bariczocsi/publications) includes a submitted follow-up titled *Properties of the four-parameter generalized Kaiser-Bessel distribution*, with D. Jankov Maširević, T. K. Pogány, L. Teofanov, and N. Ujić. This lead was sent to the primary investigator for a full scope check; this audit does not represent it as already checked.

This is a supplementary, bounded literature screen. The final novelty assessment belongs in the package's consolidated novelty file. Mathematical validity and prior-resolution status are separate conclusions.
