# Independent endpoint review

Reviewer: combinatorics research lane, 21 November 2026.

Verdict: the mathematical statement in `ENDPOINT.md` passes. The multiplicity argument, the resolvent factor four, and the zero-derivative transfer are valid. This is a theorem about a neighborhood depending on a fixed positive-definite pair. It is not a resolution of Bourin's conjecture and this review makes no priority claim.

## Scope of the prior input

I independently opened the current [arXiv record](https://arxiv.org/abs/2611.22363) and the [full v2 manuscript](https://arxiv.cnoctave.top/pdf/2611.22363). The record identifies Yulong Tian and Jinli Xu and a revision on 18 November 2026. I read Theorem 1.1 and its proof in Section 2. Its quantifiers include every finite matrix order, arbitrary positive semidefinite matrices, and every interior parameter. The asserted operator-norm inequality is exactly the one used on the complementary block in the draft.

The proof of that input is also consistent: after normalizing the sum to have operator norm two, scalar tangent bounds make both power-sum factors contractions; the scalar remainder is between zero and one on the required spectral interval; the third factor is a contraction; expanding the product gives the crossed sum. The triangle inequality then gives the bound two before rescaling. No assertion about other unitarily invariant norms is imported from that theorem.

## Directional derivative, including repeated eigenvalues

Direct differentiation, without commuting the two matrices, gives

```math
C'_0=(\log A-\log B)B-(\log A-\log B)A=-ED.
```

Because $`S>0`$, the square-root map defining $`|C_t|`$ is differentiable near zero. If $`X=(d/dt)|_{0}|C_t|`$ and $`H=C'_0`$, differentiation of $`|C_t|^2=C_t^*C_t`$ gives

```math
SX+XS=SH+H^*S.
```

On an eigenspace of $`S`$ with eigenvalue $`\lambda>0`$, the compression of $`X`$ is therefore the compression of $`(H+H^*)/2`$. The directional derivative of the sum of the top $`k`$ eigenvalues selects the largest available first-order shifts within the cutoff eigenspace. It is consequently

```math
\max_{P\in\mathcal P_k(S)}
\mathop{\mathrm{tr}}\nolimits(PX)
=\max_{P\in\mathcal P_k(S)}
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PH)
=-\min_{P\in\mathcal P_k(S)}
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE).
```

Here the last equality uses conjugation and cyclicity of trace; it does not assume that $`D`$ and $`E`$ commute. Every projection in the maximizing family commutes with $`S`$, even when it selects only part of an eigenspace on which $`S`$ is scalar. The maximizing family is closed inside the compact set of rank-$`k`$ orthogonal projections, so minima and maxima are attained.

## Resolvent identity and equality criterion

For $`Z=S+2uI`$ and $`K=Z^{-1/2}DZ^{-1/2}`$, the two positive matrices $`A+uI`$ and $`B+uI`$ give $`I\pm K>0`$. The difference of their inverses is

```math
2Z^{-1/2}\bigl[(I-K)^{-1}-(I+K)^{-1}\bigr]Z^{-1/2}
=4Z^{-1/2}K(I-K^2)^{-1}Z^{-1/2}.
```

This confirms the factor four. Multiplying on the left by $`D=Z^{1/2}KZ^{1/2}`$ and using $`PZ=ZP`$ yields

```math
\mathop{\mathrm{tr}}\nolimits
\bigl[PD((B+uI)^{-1}-(A+uI)^{-1})\bigr]
=4\mathop{\mathrm{tr}}\nolimits
\bigl[PK^2(I-K^2)^{-1}\bigr].
```

The right side is real before a real part is taken. The positive matrix $`K^2(I-K^2)^{-1}`$ has kernel $`\ker K`$. Its trace against $`P`$ is zero exactly when $`KP=0`$. Since $`P`$ commutes with $`Z^{-1/2}`$, that condition is equivalent to $`DP=0`$.

All matrices are finite dimensional. At zero the integrand is continuous because both original matrices are positive definite; at infinity it is $`O(u^{-2})`$. Thus the logarithm integral and its trace converge ordinarily. If $`DP\ne0`$, the integrand is strictly positive for every $`u\ge0`$. The integrated equality criterion is therefore exact.

If every maximizing projection has $`DP\ne0`$, continuity and compactness make the minimum strictly positive. Pointwise positivity alone would not justify the strict minimum without this compactness step; the draft includes it.

## Zero derivative and the complementary block

If the minimum is zero, choose an attaining projection $`P`$. Then $`DP=PD=0`$. The commutation of $`P`$ with $`S`$ makes $`P`$ a reducing projection for both $`A=(S+D)/2`$ and $`B=(S-D)/2`$. On its range,

```math
A=B=S/2,\qquad C_t=S.
```

Functional calculus preserves this block decomposition. If the complement is nonempty, it is again a positive-definite pair, so the cited operator-norm theorem applies. The largest complementary singular value is at most the largest eigenvalue of the complementary sum. Since $`P`$ selects the top $`k`$ eigenvalues of $`S`$, this is no larger than the smallest eigenvalue selected by $`P`$.

Consequently the unchanged block supplies exactly the top $`k`$ singular values for every interior parameter. If a complementary singular value ties the cutoff, the sum of the largest $`k`$ is still the same; no strict spectral gap is required. At the endpoints the same conclusion is immediate. The case $`k=n`$ has no complementary block and is already covered by the unchanged block.

Conversely, equality for every parameter implies zero right derivative. The attained minimum then produces the required reducing projection. The two alternatives stated in the draft are disjoint and exhaustive.

## Endpoint neighborhoods and limits

For a negative right derivative, the defining first-order expansion gives a strictly smaller Ky Fan norm throughout a sufficiently small punctured right neighborhood of zero. The exact identity $`C_{1-t}=C_t^*`$ transfers the same singular-value statement to the other endpoint. There are finitely many Ky Fan sums for a fixed matrix order, so one positive minimum of their neighborhoods works for all of them. Ky Fan dominance then gives all unitarily invariant norms on that interval.

The interval can shrink with the matrix pair. This argument does not provide a universal interval, does not extend the conclusion to arbitrary middle parameters, and does not justify passage to singular pairs with a common neighborhood. The global equality conclusion for a zero derivative uses Tian–Xu's prior theorem explicitly. No numerical experiment is needed for this review.

Presentation correction only: the integral displays in the reviewed draft used literal `,du`; those should read `\,du`.
