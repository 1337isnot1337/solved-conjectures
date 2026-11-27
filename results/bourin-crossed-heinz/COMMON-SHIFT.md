# Bourin’s inequality after a common scalar shift

Fix arbitrary Hermitian matrices $`A,B`$ of the same finite order. There is a finite $`\lambda_0(A,B)`$ such that Bourin's crossed-Heinz inequality holds for the pair $`X=\lambda I+A,\ Y=\lambda I+B`$ for every $`\lambda\ge\lambda_0`$, every $`0<t<1`$, and every unitarily invariant norm. The threshold works simultaneously for all exponents and all singular-value sums. Multiplicities of the eigenvalues of $`A+B`$ are unrestricted. This is a partial result on [Bourin's Question 4, p. 6](https://arxiv.org/pdf/0805.1954#page=6). The original unshifted problem remains open in [issue 214](https://github.com/1337isnot1337/solved-conjectures/issues/214).

Write $`S=A+B,\ D=A-B`$, and let $`N_k`$ be the sum of the largest $`k`$ singular values. For a Hermitian matrix $`M`$, write $`L_k(M)`$ for the sum of the largest $`k`$ eigenvalues in decreasing algebraic order. Define the nonnegative coefficient

```math
h_k=\min\bigl\{\mathop{\mathrm{tr}}(PD^2):
 P=P^*=P^2,\ \mathop{\mathrm{rank}}P=k,\ \mathop{\mathrm{tr}}(PS)=L_k(S)\bigr\}.
```

For $`C_t=X^tY^{1-t}+Y^tX^{1-t}`$ the following expansion is uniform in $`0<t<1`$:

```math
N_k(X+Y)-N_k(C_t)=\frac{t(1-t)}{\lambda}h_k+
O_{A,B,k}\!\left(\frac{t(1-t)}{\lambda^2}\right).
```

If $`h_k>0`$ there is a strict inequality for all sufficiently large shifts and all interior exponents. If $`h_k=0`$, equality holds at every common shift for which the two inputs are positive definite, throughout the interior exponent interval.

## Expansion before taking singular values

Use the exact noncommutative factorization
$`X+Y-C_t=(X^t-Y^t)(X^{1-t}-Y^{1-t})`$. Sababheh and Bourin use this identity in their first preprint version. [Section 4](https://arxiv.org/pdf/2610.04567v1#page=9)

For $`0<r<1`$ and $`\lambda\ge 2\max(1,\lVert A\rVert,\lVert B\rVert)`$, scalar Taylor expansion of $`(1+x)^r`$ on $`[-1/2,1/2]`$ and spectral calculus give

```math
(\lambda I+A)^r-(\lambda I+B)^r
=\lambda^{r-1}\left(rD+O_{A,B}\left(\frac{r}{\lambda}\right)\right).
```

Indeed the absolute second derivative on this interval is at most $`4r`$. The estimate holds in operator norm uniformly for both exponent factors. Multiplying in the displayed order, with $`u=t(1-t)`$, gives
$`C_t=2\lambda I+S-uD^2/\lambda+O_{A,B}(u/\lambda^2)`$.
The main term on the right is positive definite for all sufficiently large shifts, uniformly in $`t`$. The Ky Fan triangle inequality changes its singular-value sum by at most $`k`$ times the operator norm of the error. It remains to expand $`L_k(S-\epsilon D^2)`$ at $`\epsilon=u/\lambda`$.

## Degenerate spectral cutoffs

Let $`S=\sum_i a_iP_i`$ range over its distinct eigenvalues. For any fixed Hermitian $`H`$, put $`H_0=\sum_iP_iHP_i`$. Choose the skew-Hermitian matrix $`K`$ with diagonal blocks zero and off-diagonal blocks
$`P_iKP_j=P_iHP_j/(a_i-a_j)`$. If there is a single eigenvalue take $`K=0`$. Since $`[S,K]=H-H_0`$,

```math
e^{-\epsilon K}(S-\epsilon H)e^{\epsilon K}
=S-\epsilon H_0+O_{S,H}(\epsilon^2).
```

The variational principle bounds the change in $`L_k`$ by $`k`$ times this error. For sufficiently small positive $`\epsilon`$ the ordered distinct spectral levels of $`S`$ stay separated in $`S-\epsilon H_0`$. A maximizing subspace includes all eigenspaces above the cutoff and selects, inside the cutoff eigenspace, the eigenvectors of its compressed $`H`$ with the **smallest** eigenvalues. Thus, with $`H=D^2`$, $`L_k(S-\epsilon H)=L_k(S)-\epsilon h_k+O_{S,H,k}(\epsilon^2)`$. The error is uniform after substituting $`\epsilon=u/\lambda`$ because $`u\le1/4`$. This proves the claimed expansion, including at a tied cutoff.

## Exact equality and the common threshold

If $`h_k=0`$, compactness gives a maximizing projection $`P`$ with $`\mathop{\mathrm{tr}}(PD^2)=\lVert DP\rVert_F^2=0`$. It reduces $`S`$ and $`D`$, hence $`A,B`$. The restrictions of $`X,Y`$ to its range coincide, where $`C_t=X+Y`$. On the complement, when nonempty, the all-dimension operator-norm result bounds the largest singular value of $`C_t`$ by the largest eigenvalue of the complementary sum. That eigenvalue is no larger than the smallest eigenvalue selected on $`P`$, by its maximizing property. This proves equality for each admissible shift. [Tian and Xu, Theorem 1.1](https://arxiv.org/abs/2611.22363v2)

For $`h_k>0`$ the leading term dominates the uniform error once $`\lambda`$ is sufficiently large. There are only finitely many ranks. Taking their largest threshold and applying Ky Fan dominance proves the simultaneous norm comparison. The threshold may depend on the original pair. The theorem establishes the tail of each fixed common-shift ray. It does not prove the inequality at every positive shift. [Review, sources and checks](SHIFT-REVIEW.md)
