# Independent review of the entropy derivative

Reviewed 21 November 2026. The derivative calculation in `ENTROPY_DERIVATIVE.md` passes, including zero blocks and singular Grams. This review does **not** prove the proposed entropy inequality or Audenaert's conjecture. Sections 5–7 below give a concrete obstruction to one direct application of a recent entropy theorem, not a counterexample to that theorem or the conjecture.

## 1. Source and direction of the inequality

I read Conjecture 1, equations (1)–(2), in Audenaert's [arXiv:math/0702186v2](https://arxiv.org/abs/math/0702186v2), using the local primary PDF text. The compression uses the Schatten `p` norm **inside every block and again outside**. Its conjectured direction is

```math
F(p)=\log\|T\|_p-\log\|C_p(T)\|_p
\begin{cases}
\ge0,&1\le p\le2,
\\ \le0,&p\ge2.
\end{cases}
```

For every nonzero fixed `T`, equality holds at two. Therefore either local branch requires `F'(2)<=0`. A strictly positive derivative would contradict both branches for exponents sufficiently close to two, with the same fixed matrix. The note correctly treats that as one potential disproof of the universal conjecture.

## 2. Independent derivative calculation

Normalize `||T||_2=1`, put `rho=TT*`, let `w_ij=||T_ij||_2^2`, and let `B_ij=sqrt(w_ij)`. For each nonzero block, define `rho_ij=T_ij T_ij*/w_ij`.

For a fixed matrix of Frobenius norm one,

```math
\left.\frac{d}{dp}\log\|T\|_p\right|_{p=2}
=\frac14\mathop{\mathrm{Tr}}(\rho\log\rho)
=-\frac14 S(\rho).
```

Scaling a nonzero block separately gives the entry derivative

```math
\left.\frac{d}{dp}\|T_{ij}\|_p\right|_{p=2}
=-\frac14\sqrt{w_{ij}}\,S(\rho_{ij}).
\tag{R1}
```

At exponent two, the variation of the outer logarithmic Frobenius norm contributes

```math
\sum_{i,j}B_{ij}(C_p'(T)|_{p=2})_{ij}
=-\frac14\sum_{i,j}w_{ij}S(\rho_{ij}),
```

since `||B||_2^2=1`. The explicit change in the outer exponent contributes `-S(BB*)/4`. This reproduces

```math
F'(2)=\frac14\left[
S(BB^*)+\sum_{i,j}w_{ij}S(\rho_{ij})-S(TT^*)
\right].
\tag{R2}
```

The weighted block-entropy term is essential. Treating the compressed entries as fixed would omit (R1) and yield a different, incorrect necessary condition.

## 3. Zero and singular cases

- A zero block has Schatten norm zero for every positive exponent, so its derivative is identically zero. No normalized state is assigned to that block; its zero-weight entropy term is omitted.
- A nonzero singular block still has a strictly positive power sum over its fixed positive singular values. Its norm is real analytic near two. The fixed zero singular values contribute identically zero.
- A singular global `TT*` presents the same fixed-spectrum issue and does not invalidate the original-matrix derivative.
- The compressed Gram `M(p)=C_p(T)C_p(T)*` is analytic and positive semidefinite on both sides of two. If `M(2)` is singular, its eigenvalues are one and zero. They are distinct, so both have analytic continuations. The small one is nonnegative on a two-sided neighborhood and consequently has zero first derivative and is `O((p-2)^2)`. Its contribution raised to exponent `p/2` is `o(|p-2|)`. Thus the small eigenvalue contributes zero to the first derivative; the positive eigenvalue supplies exactly the trace derivative and entropy term in the note.

This checks the only potentially delicate step in passing from the moving matrix to its moving power. The identically zero `T` can be handled separately as equality in both original norm inequalities, without taking logarithms.

## 4. What the elementary entropy argument proves

The two successive entropy-concavity steps in Section 5 of the derivative note are valid for compatible rectangular blocks. The intermediate matrices share the required ambient dimensions before their nonzero spectra are identified. Zero row masses can be omitted. These steps give only

```math
S(TT^*)\ge\sum_{i,j}w_{ij}S(\rho_{ij}).
```

They do not supply `S(BB*)`. The rank-one compression and tensor examples are correctly identified as established or immediate equality cases, not new resolutions. A nonnegative first-order gap would still not prove the full norm inequalities at other exponents.

## 5. Exact scope of the nearby Schur theorem

I independently read [Peixue Wu, arXiv:2610.40585v1](https://arxiv.org/html/2610.40585v1), Theorem 3.1, equations (3.3)–(3.4), and the surrounding definitions. It states, for positive semidefinite `C`, positive block matrix `H`, and positive block-diagonal `W`, an entropy lower bound for `C odot H+W`. Its scalar comparison is

```math
D_r^{1/2}CD_r^{1/2}+D_y,
\qquad r_i=\mathop{\mathrm{Tr}}H_{ii},\quad
y_i=\mathop{\mathrm{Tr}}W_i.
```

The additional terms are the normalized entropies within `H_ii` and `W_i`, with their indicated scalar weights. The positive-semidefinite hypothesis on `H` is indispensable when fitting a given `TT*` to this representation. A scalar bound on the block Frobenius masses does not automatically provide such an `H`.

Wu uses entropy in bits. Multiplication by `log(2)` converts the entire inequality to the natural-logarithm convention used here, with no change in its direction or hypotheses.

The theorem is relevant prior work, but no general substitution proving (R2)'s required entropy inequality has been established. The following family shows that a **single direct application with the original two-row partition** can be too weak even when the conjectured entropy inequality is strictly true.

I also read Theorem 4.2, equations (4.4)–(4.6), of the primary [Tang–Zhu–Bai–Wang paper, arXiv:2609.28592v1](https://arxiv.org/html/2609.28592v1), and the complete preserved OpenAI `block.tex` proof. The primary theorem allows arbitrary compatible rectangular blocks in the pattern `[[A,0],[B,D]]`, including zero weights. Its scalar entropy is exactly the entropy of the Gram of `[[sqrt(alpha),0],[sqrt(beta),sqrt(gamma)]]`. This is a genuine prior special case; it does not state the arbitrary two-row, arbitrary-column inequality in the derivative note. This review did not execute or inspect Lean verification.

## 6. A family obstructing the direct Schur representation

Let `a>b>0`, put `s=a^2+b^2`, and consider

```math
T=\frac1{\sqrt{2s}}
\begin{pmatrix}
a&0
\\ 0&b
\\ b&0
\\ 0&a
\end{pmatrix}.
\tag{R3}
```

Partition it into two block rows of height two and two block columns of width one. Every block is a rank-one vector. The two full columns are orthogonal and each has squared norm one half, so

```math
S(TT^*)=\log2,\qquad
\sum_{i,j}w_{ij}S(\rho_{ij})=0.
```

The desired scalar compressed Gram is

```math
\sigma=BB^*
=\begin{pmatrix}
1/2&ab/s
\\ ab/s&1/2
\end{pmatrix}.
\tag{R4}
```

Its eigenvalues are `1/2 +/- ab/s`, so it has entropy strictly below `log2`. The derivative entropy inequality is therefore true on this family. All blocks have rank one, putting it inside an already known positive class of the full conjecture as well.

Write `rho=TT*` in its original two-row partition:

```math
\rho_{11}=\frac1{2s}\begin{pmatrix}a^2&0\\0&b^2\end{pmatrix},
\quad
\rho_{22}=\frac1{2s}\begin{pmatrix}b^2&0\\0&a^2\end{pmatrix},
\quad
\rho_{12}=\frac{ab}{2s}I_2.
```

Suppose `rho=C odot H+W` is a representation to which Wu's theorem applies, using these same two row blocks. Both summands are positive semidefinite. The vectors

```math
(b,0,-a,0)^T,\qquad(0,a,0,-b)^T
```

belong to the kernel of `rho`. Positivity forces each into the kernel of `W`. As `W=W_1 directsum W_2` and `a,b` are nonzero, the first vector forces each `W_i` to vanish on its first coordinate vector, and the second forces each to vanish on its second coordinate vector. Thus **`W=0`**.

The diagonal entries of `C` are positive, since the diagonal blocks of `rho` are nonzero. Absorb their square roots into `H`, reducing to a positive scalar correlation matrix

```math
\widetilde C=\begin{pmatrix}1&\gamma\\\overline\gamma&1\end{pmatrix},
\qquad |\gamma|\le1.
```

The diagonal blocks of the correspondingly rescaled `H` must be `rho_11,rho_22`; its off-diagonal block is `rho_12/gamma`. The principal two-by-two sector using the first coordinate in each row block has determinant

```math
\frac{a^2b^2}{4s^2}
\left(1-\frac1{|\gamma|^2}\right).
```

The off-diagonal block is nonzero, so `gamma` cannot vanish. Positivity of `H` forces `|gamma|>=1`. Combined with positivity of `C`, this gives **`|gamma|=1`**.

It follows that the scalar comparison matrix in every such direct application has rank one. In particular it cannot be the desired (R4), which has positive determinant when `a!=b`. For the tempting exact-shadow choice `gamma=2ab/s<1`, the displayed determinant is strictly negative. At `a=3,b=1`, the offending principal block is

```math
\frac1{20}\begin{pmatrix}9&5\\5&1\end{pmatrix},
\qquad \det=-\frac1{25}.
```

No positive block-diagonal noise repairs the fit, because that noise was forced to zero before any choice of scalar factor was made.

## 7. Even an alternative scalar shadow is too weak on a subfamily

Let `h(x)=-x log x-(1-x)log(1-x)` denote binary entropy in natural units. Since every allowed direct representation has `W=0` and `|gamma|=1`, its scalar comparison entropy vanishes. The remaining weighted diagonal-block terms in Wu's conclusion sum to

```math
h\!\left(\frac{b^2}{a^2+b^2}\right).
```

The entropy required by the derivative condition is instead

```math
S(\sigma)=
h\!\left(\frac12-\frac{ab}{a^2+b^2}\right).
```

For every `a>=3b>0`,

```math
\frac{b^2}{a^2+b^2}\le\frac1{10},
\qquad
\frac12-\frac{ab}{a^2+b^2}\ge\frac15.
```

The second inequality follows because `r/(r^2+1)` decreases for `r>=1` and is `3/10` at `r=3`. Since binary entropy strictly increases on `[0,1/2]`, every direct bound obtained in this way is strictly weaker than the needed one:

```math
h\!\left(\frac{b^2}{a^2+b^2}\right)
\le h(1/10)\lt h(1/5)
\le S(\sigma).
```

This is an analytic obstruction to that specific theorem-application route, not a finite positive screen. It does not exclude regrouping, a different sequence of inequalities, or a stronger extension of Wu's result. It also does not provide a counterexample to the entropy condition itself: the true left side in (R3) remains `log2`.

## Disposition

The derivative reduction is correct and reviewable in all the stated finite-dimensional boundary cases. Its missing entropy inequality remains open in this work. The recent triangular and Schur-weighted theorems are relevant inputs but do not close the gap by the direct substitutions considered here. No new full theorem or conjecture resolution is established by this review.
