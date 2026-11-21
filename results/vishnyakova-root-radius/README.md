# Vishnyakova's conjecture

An ordinary proof of the full outer-radius conjecture, including its weighted formulation. Internally reviewed on 21 November 2026; not externally peer reviewed. The documented priority search found no earlier full resolution and records earlier partial results and access limits.

For $`\beta>0`$, define $`L_\beta`$ by sending $`z^{\underline{k}}/(\beta)_k`$ to $`w^k`$. If a real polynomial $`P`$ has degree $`n`$ and every root of $`L_\beta(P)`$ belongs to $`[-1,0]`$, then every root $`z`$ of $`P`$ satisfies

```math
\left|z+\frac\beta2\right|\le n-1+\frac\beta2.
```

Hence the largest possible root modulus in this class is exactly $`n-1+\beta`$, attained by $`(z+\beta)_n`$. At $`\beta=1`$, this proves the original conjecture for polynomials whose samples at nonnegative integers form a totally positive sequence. The original and weighted statements are one conjecture family.

The proof extends an earlier equal-parameter tridiagonal argument to complex upper-half-plane parameters, then uses Grace–Walsh–Szegő polarization and Hurwitz's theorem to handle arbitrary independent parameters. The real-root bounds follow from positivity and reflection.

- [Complete proof](PROOF.md).
- [Source and priority audit](SOURCE_AUDIT.md).
- [Analysis review](ANALYSIS_REVIEW.md) and [root review](ROOT_REVIEW.md).
- [Exact algebra verifier](verify.py): run `python verify.py`; all 73 checks pass.
- [GitHub investigation](https://github.com/1337isnot1337/solved-conjectures/issues/182).

The original source is Anna Vishnyakova, *Polynomials interpolated totally positive sequences*, arXiv:2607.06207v1, Open Problem 6.2. The weighted source is her *Polynomially Deformed Normalized Pochhammer Sequences Having Generating Functions With Only Real Non-positive Zeros*, arXiv:2608.03723v1, Open Problem 7.2. Full source links and exact scope are in the audit.

**Lean status:** none.
