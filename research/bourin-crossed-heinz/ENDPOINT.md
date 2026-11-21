# Endpoint behavior

Status: research only. This is a local statement for a fixed positive-definite pair, not a solution of Bourin's conjecture. No claim of priority is made. The global operator-norm theorem used below is due to Tian and Xu, not this campaign.

## Statement

Let $`A,B>0`$ be complex matrices of the same order and put

```math
S=A+B,\qquad D=A-B,\qquad E=\log A-\log B,
\qquad C_t=A^tB^{1-t}+B^tA^{1-t}.
```

For each $`1\leq k\leq n`$, let $`N_k`$ be the sum of the largest $`k`$ singular values, and let $`\mathcal P_k(S)`$ be the compact set of rank-$`k`$ orthogonal projections onto maximizing spectral subspaces of $`S`$. Thus every such projection commutes with $`S`$ and

```math
\mathop{\mathrm{tr}}\nolimits(PS)=N_k(S).
```

Then exactly one of the following occurs:

1. $`N_k(C_t)=N_k(S)`$ for every $`0\leq t\leq1`$.
2. The right derivative of $`N_k(C_t)`$ at zero is strictly negative. Consequently $`N_k(C_t)<N_k(S)`$ for all sufficiently small positive $`t`$, and also for all sufficiently small positive $`1-t`$.

The first alternative occurs precisely when some $`P\in\mathcal P_k(S)`$ satisfies $`DP=0`$.

In particular, for each fixed positive-definite pair there is $`\varepsilon(A,B)>0`$ such that the full weak-majorization inequality holds simultaneously for all $`k`$ when

```math
t\in[0,\varepsilon(A,B)]\cup[1-\varepsilon(A,B),1].
```

The interval is allowed to depend on the pair. This supplies no uniform parameter interval, no conclusion on all intermediate parameters, and no bound for pairs approaching the singular boundary.

## The Ky Fan directional derivative

The curve $`C_t`$ is differentiable near zero, $`C_0=S>0`$, and direct differentiation gives

```math
C'_0=-ED,\qquad
\frac{C'_0+(C'_0)^*}{2}=-\frac{ED+DE}{2}.
```

The variational formula for the Ky Fan norm, or first-order Hermitian perturbation on each eigenspace of $`S`$, gives

```math
\left.\frac{d}{dt}\right|_{t=0+}N_k(C_t)
=\max_{P\in\mathcal P_k(S)}
  \mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PC'_0)
=-\min_{P\in\mathcal P_k(S)}
  \mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE).
```

Here multiplicity at the $`k`$th eigenvalue is handled by the maximum over the entire set of maximizing projections. There is no choice of a distinguished eigenbasis. To see the perturbation statement directly, differentiate $`|C_t|^2=C_t^*C_t`$. On an eigenspace where $`S=\lambda I`$, the compression of the derivative of $`|C_t|`$ is exactly the compression of the Hermitian part of $`C'_0`$, because $`\lambda>0`$.

## A positive resolvent integral

For $`u\geq0`$, define

```math
Z_u=S+2uI,\qquad K_u=Z_u^{-1/2}DZ_u^{-1/2}.
```

Both $`I+K_u`$ and $`I-K_u`$ are positive definite, since

```math
A+uI=\tfrac12 Z_u^{1/2}(I+K_u)Z_u^{1/2},\qquad
B+uI=\tfrac12 Z_u^{1/2}(I-K_u)Z_u^{1/2}.
```

The logarithm resolvent identity therefore yields

```math
E=\int_0^\infty\bigl[(B+uI)^{-1}-(A+uI)^{-1}\bigr]\,du
=4\int_0^\infty
 Z_u^{-1/2}K_u(I-K_u^2)^{-1}Z_u^{-1/2}\,du.
```

For $`P\in\mathcal P_k(S)`$, the matrices $`P`$ and $`Z_u`$ commute. Multiplying by $`D=Z_u^{1/2}K_uZ_u^{1/2}`$ and cycling the trace gives

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE)
=4\int_0^\infty
\mathop{\mathrm{tr}}\nolimits
\bigl[P K_u^2(I-K_u^2)^{-1}\bigr]\,du\geq0.
```

The integrand is real and nonnegative because $`K_u`$ is Hermitian with spectrum in $`(-1,1)`$. The matrix $`K_u^2(I-K_u^2)^{-1}`$ is positive semidefinite and has kernel $`\ker K_u`$. At infinity the integrand is $`O(u^{-2})`$; near zero it is continuous. Thus all integrals are ordinary convergent matrix integrals.

For an orthogonal projection $`P`$, a zero integrand is equivalent to $`K_uP=0`$. Commutation of $`P`$ with $`Z_u^{-1/2}`$ shows that this is equivalent to $`DP=0`$. Consequently

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE)=0
\quad\Longleftrightarrow\quad DP=0.
```

If no maximizing projection has $`DP=0`$, compactness of $`\mathcal P_k(S)`$ makes the displayed minimum strictly positive. The endpoint derivative is then strictly negative.

## The zero-derivative case

Suppose $`DP=0`$ for a maximizing projection. Since $`D=D^*`$, also $`PD=0`$. Both $`S`$ and $`D`$ reduce the orthogonal splitting $`P\oplus(I-P)`$, so the same is true of $`A`$ and $`B`$. On the range of $`P`$,

```math
A=B=\tfrac12S,\qquad C_t=S
```

for every $`t`$. If $`k=n`$, this already proves the assertion. Otherwise let $`A_\perp,B_\perp,S_\perp`$ be the complementary blocks. Tian–Xu's Theorem 1.1 gives

```math
\|C_t(A_\perp,B_\perp)\|_{\mathrm{op}}
\leq\|A_\perp+B_\perp\|_{\mathrm{op}}
=\lambda_{\max}(S_\perp)
\leq\lambda_{\min}(S|_{\mathop{\mathrm{ran}}P}).
```

The last inequality holds because $`P`$ selects the top $`k`$ eigenvalues of $`S`$, including possible ties. Hence the largest $`k`$ singular values of the block-diagonal $`C_t`$ are exactly the unchanged eigenvalues on $`P`$, with harmless ties. This proves equality for every $`t`$.

Conversely, equality for every $`t`$ forces zero endpoint derivative, and the attained variational minimum then supplies such a projection.

Finally, $`C_{1-t}=C_t^*`$ gives the statement near one. There are only finitely many Ky Fan norms for this fixed matrix order, so taking the minimum of their positive neighborhoods gives one $`\varepsilon(A,B)`$ that works for all unitarily invariant norms by Ky Fan dominance.

## Prior input and scope

The only global crossed-Heinz theorem used in the zero-derivative transfer is Y. Tian and J. Xu, *Bourin's Crossed-Heinz Inequality in the Operator and Frobenius Norms*, arXiv:2611.22363v2 (18 November 2026), Theorem 1.1: for every pair of positive semidefinite matrices in every finite order and every $`0<t<1`$, the operator norm of $`C_t`$ is at most that of $`A+B`$. Its complete five-page primary manuscript was read: <https://arxiv.cnoctave.top/pdf/2611.22363>.

The resolvent calculation was supplied by the root research worker and independently checked in this lane. The equality transfer uses the cited prior theorem. These deductions are recorded as route constraints without a new-priority claim. In particular, a first-order endpoint separator cannot refute the full conjecture; the parameter interval still open in the full problem cannot be removed by taking a pair-dependent minimum.
