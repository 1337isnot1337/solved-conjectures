# Fixed-pair endpoint neighborhoods for semidefinite matrices

Status: research lemma, independently checked by the algebra lane in `SINGULAR_REVIEW.md`. This extends the positive-definite endpoint argument in `ENDPOINT.md`; it does not give a uniform interval or resolve Bourin's conjecture. The global operator-norm bound used in the equality case is the prior Tian–Xu theorem cited there. No priority claim is made.

## Statement

Let $`A,B\geq0`$ be a fixed pair of complex matrices of the same finite order. Put

```math
S=A+B,\qquad D=A-B,\qquad
C_t=A^tB^{1-t}+B^tA^{1-t}\quad(0<t<1).
```

For each Ky Fan sum $`N_k`$, either $`N_k(C_t)=N_k(S)`$ for all interior parameters, or there is a positive $`\varepsilon_k(A,B)`$ such that

```math
N_k(C_t)<N_k(S)
\quad\hbox{if}\quad
0<t<\varepsilon_k(A,B)
\quad\hbox{or}\quad
0<1-t<\varepsilon_k(A,B).
```

Thus one positive neighborhood, depending on the pair, works for every unitarily invariant norm. The endpoint derivative dichotomy from the positive-definite note is not asserted literally: for singular matrices the interior curve can have a limit different from $`S`$.

It suffices to prove the statement on $`(\ker S)^\perp`$. The common kernel is reduced by both matrices and contributes only zero singular values. If $`S=0`$, the statement is immediate. Hence assume for the proof that $`S>0`$, although either summand may be singular. Ky Fan indices greater than the dimension of this active subspace repeat the full active-space sum.

## The interior endpoint limit is a contraction times the sum

Let $`P_A,P_B`$ be the orthogonal support projections of $`A,B`$, and define

```math
J=P_A+P_B-I,\qquad
L=P_AB+P_BA.
```

The functional calculus gives $`C_t\longrightarrow L`$ as $`t\downarrow0`$. Since $`P_AA=A`$ and $`P_BB=B`$,

```math
L=JS,\qquad -I\leq J\leq I.
```

Consequently

```math
L^*L=SJ^2S\leq S^2,
\qquad |L|\leq S,
\qquad N_k(L)\leq N_k(S).
```

The middle inequality uses monotonicity of the positive square root. If the last inequality is strict, continuity already gives the required strict neighborhood at zero.

## Equality at the limit locates every maximizing subspace

Suppose $`N_k(L)=N_k(S)`$, and let $`P`$ be any rank-$`k`$ maximizing spectral projection of $`|L|`$. Then

```math
N_k(S)=\mathop{\mathrm{tr}}\nolimits(P|L|)
\leq\mathop{\mathrm{tr}}\nolimits(PS)
\leq N_k(S).
```

It follows that $`P`$ also maximizes for $`S`$, commutes with $`S`$, and satisfies $`(S-|L|)P=0`$. It commutes with $`|L|`$ by construction. Therefore

```math
(S^2-L^*L)P=0,
\qquad (I-J^2)SP=0,
\qquad (I-J^2)P=0.
```

The last implication uses the invertibility of $`S`$ on the invariant range of $`P`$.

For the two support projections,

```math
\ker(J-I)=\mathop{\mathrm{ran}}P_A\cap\mathop{\mathrm{ran}}P_B,
\qquad
\ker(J+I)=\ker P_A\cap\ker P_B=\ker S=\{0\}.
```

The first identity follows by applying positivity to $`(I-P_A)+(I-P_B)`$; the second follows by applying it to $`P_A+P_B`$. Thus

```math
JP=P,\qquad P_AP=P_BP=P,
\qquad LP=L^*P=SP.
```

These statements hold for every maximizing projection of $`|L|`$, including all choices at a repeated cutoff eigenvalue. Moreover, eigenvalue monotonicity from $`|L|\leq S`$ and equality of the top-$`k`$ sums gives equality term by term in that range. In particular the $`k`$th selected singular value is positive. Singular values below the cutoff may be zero; they do not obstruct first-order perturbation on the selected positive spectral subspaces.

## The singular logarithm trace by regularization

Write $`\log_+A`$ for the spectral function that is $`\log a`$ on positive eigenvalues and zero on the kernel; this notation is not the positive part of $`\log A`$. Define

```math
E_0=\log_+A-\log_+B.
```

For $`\delta>0`$, put $`E_\delta=\log(A+\delta I)-\log(B+\delta I)`$. In operator norm,

```math
E_\delta
=E_0+\log\delta\,(P_B-P_A)+o(1)
\qquad(\delta\downarrow0).
```

If $`P`$ is one of the maximizing projections above, then

```math
\mathop{\mathrm{tr}}\nolimits\bigl[PD(P_B-P_A)\bigr]
=\mathop{\mathrm{tr}}\nolimits\bigl[(P_B-P_A)PD\bigr]=0.
```

For $`v>0`$, define

```math
Z_v=S+2vI,\qquad K_v=Z_v^{-1/2}DZ_v^{-1/2}.
```

Apply the positive-definite resolvent calculation to $`A+\delta I,B+\delta I`$. The projection still commutes with their sum. Changing variables in its integral gives

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE_\delta)
=4\int_\delta^\infty
\mathop{\mathrm{tr}}\nolimits
\bigl[PK_v^2(I-K_v^2)^{-1}\bigr]\,dv.
```

The left side has a finite limit by the cancellation just proved. The integrand is nonnegative, so monotone convergence supplies the convergent improper integral

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE_0)
=4\int_0^\infty
\mathop{\mathrm{tr}}\nolimits
\bigl[PK_v^2(I-K_v^2)^{-1}\bigr]\,dv\geq0.
```

For every $`v>0`$, the same kernel argument as in the positive-definite case shows that the integrand is zero exactly when $`DP=0`$. Hence the trace is zero if and only if $`DP=0`$. This argument does not take the difference of two separately divergent integrals at zero.

## Derivative on the selected positive singular subspaces

For this fixed pair, extending powers on the supports gives an analytic matrix curve through the interior limit $`L`$. Its derivative is

```math
H=(\log_+A)B-P_AB\log_+B
 +(\log_+B)A-P_BA\log_+A.
```

For every maximizing projection $`P`$ of $`|L|`$ in the equality case, the support identities give

```math
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PH)
=-\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE_0).
```

The selected left and right singular subspaces coincide, and $`L`$ is positive on them, because $`LP=L^*P=SP`$. First-order singular-value perturbation on the selected nonzero spectral levels therefore gives

```math
\left.\frac{d}{dt}\right|_{0+}N_k(C_t)
=-\min_{P\in\mathcal P_k(|L|)}
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}\nolimits(PDE_0).
```

This formula is for the continuous extension with value $`L`$, not an artificial assignment $`C_0=S`$. It is valid even when $`L`$ has zero singular values below the cutoff. If no maximizing projection has $`DP=0`$, continuity of the trace and compactness of the maximizing family make the derivative strictly negative. Since its initial value equals $`N_k(S)`$, this proves the required strict neighborhood.

## The remaining equality case

If a maximizing projection has $`DP=0`$, it is also maximizing for $`S`$. It reduces $`S,D,A,B`$ and satisfies $`A=B=S/2`$ on its range. The argument in `ENDPOINT.md` now applies unchanged: the selected block of $`C_t`$ is fixed, and the Tian–Xu operator-norm bound on the possibly singular complementary blocks prevents their singular values from exceeding the cutoff. Hence $`N_k(C_t)=N_k(S)`$ for every interior parameter.

Conversely, such global equality implies equality at the limit and a zero endpoint derivative; the attained minimum supplies a maximizing projection with $`DP=0`$. Thus global equality is characterized, on the active space, by the existence of a top-$`k`$ spectral projection of $`S`$ annihilated by $`D`$.

Finally $`C_{1-t}=C_t^*`$ transfers the zero-endpoint conclusion to one. Taking the minimum over the finitely many active Ky Fan sums proves the simultaneous endpoint neighborhood for all unitarily invariant norms. Its width still depends on the pair, with no uniform lower bound asserted.
