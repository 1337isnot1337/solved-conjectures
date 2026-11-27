# Exact finite tests for Bourin's inequality at bounded input rank

For positive semidefinite complex matrices $`X,Y`$, put
```math
C_t(X,Y)=X^tY^{1-t}+Y^tX^{1-t},\qquad 0\lt t\lt 1.
```
Write $`N_k`$ for the sum of the largest $`k`$ singular values. Bourin's question asks whether $`N_k(C_t(X,Y))\le N_k(X+Y)`$ at every rank, equivalently for every unitarily invariant norm. Fix a positive integer $`r`$. If $`X`$ has rank at most $`r`$, a strict violation at rank $`k`$ has a witness, at the same exponent and rank, of order at most
```math
k-1+4(r+3k-1)^2.
```
The order bound is independent of the size of the strict gap. Violations can occur only at $`2\le k\lt 2r`$. Thus the full set of unitarily invariant norm comparisons at input rank at most $`r`$ reduces, in all finite dimensions, to orders at most $`196r^2+2r`$. At every fixed rational exponent this gives an exact decision procedure for that rank-bounded question. One input of rank at most one satisfies the original inequality for all exponents and norms. The condition on $`X`$ can instead be imposed on $`Y`$ by symmetry. [Bourin, Question 4](https://arxiv.org/pdf/0805.1954#page=6) · [Tian and Xu, Theorem 1.1](https://arxiv.org/abs/2611.22363v2)

## Which Ky Fan ranks can fail?

The rank-zero input gives $`C_t=0`$. Let $`a`$ be the actual positive rank of $`X`$ and let $`P`$ project onto its range. Factor $`X^tY^{1-t}=X^t(PY^{1-t})`$. The singular values of the second factor are bounded by those of $`Y^{1-t}`$ term by term, and at most $`a`$ are nonzero. Schatten Hölder with conjugate indices $`1/t`$ and $`1/(1-t)`$ therefore gives
```math
\lVert X^tY^{1-t}\rVert_1\le (\mathop{\mathrm{tr}}X)^t N_a(Y)^{1-t}.
```
Taking the adjoint for the other term, applying the triangle inequality and then scalar Young in both directions yields $`\lVert C_t\rVert_1\le\mathop{\mathrm{tr}}X+N_a(Y)`$. The range of $`X`$ and a leading $`a`$-dimensional eigenspace of $`Y`$ span at most $`2a`$ dimensions. Whenever $`2a\le k\le n`$, a rank-$`k`$ projection containing them has trace against $`X+Y`$ at least $`\mathop{\mathrm{tr}}X+N_a(Y)`$. Thus $`N_k(C_t)\le N_k(X+Y)`$ for all such ranks. The operator-norm theorem gives the remaining comparison for $`a=1`$. [Tian and Xu, Theorem 1.1](https://arxiv.org/abs/2611.22363v2)

## Preserving the comparison budget with one resolvent

We prove the fixed-$`k`$ construction allowing the more general input $`X=bI+R`$, with $`b\ge0`$, $`R`$ Hermitian of rank at most $`r`$ and $`X\ge0`$. The resulting order bound is
```math
k-1+r+4(r+3k-1)^2.
```
When $`R\ge0`$, including the main case $`b=0`$, omit the first occurrence of $`+r`$. Both reconstructed matrices are positive semidefinite, and the new first input has the same scalar part and the same nonzero eigenvalues of $`R`$ with multiplicities.

Suppose there is a strict violation. Choose isometries $`U,V`$ with $`k`$ columns such that $`L=\Re\mathop{\mathrm{tr}}(U^*C_tV)=N_k(C_t)`$. Put $`S=X+Y`$. For any real $`z`$, $`N_k(S)\le kz+\mathop{\mathrm{tr}}(S-zI)_+`$, with equality at $`z=\lambda_k(S)`$ when the eigenvalues decrease. Choose $`z`$ slightly larger than this eigenvalue so that $`q=z-b`$ misses the finite spectrum of $`Y`$ and
```math
K=(S-zI)_+,\qquad kz+\mathop{\mathrm{tr}}K\lt L.
```
This uses continuity and the strict gap. Write $`e=\mathop{\mathrm{rank}}K\le k-1`$. The space $`H_+`$ of $`Y`$ for eigenvalues above $`q`$ has dimension $`m\le e+r`$: its intersection with $`\ker R`$ has codimension at most $`r`$ and on it the form $`S-zI`$ is strictly positive. If $`R\ge0`$ this form is positive on the entire high space, so $`m\le e`$. Keep $`H_+`$ and the restriction of $`Y`$ to it unchanged.

In $`H_+^\perp`$, let $`H_0`$ be the span of the projections of the ranges of $`R,K,U,V`$, of dimension $`d\le r+3k-1`$. Write $`H=H_+\oplus H_0`$. It contains those four ranges. In particular $`R,K`$ vanish on $`H^\perp`$. Let $`Y_0`$ be the restriction of $`Y`$ to the whole low spectral space $`H_+^\perp`$, and let $`J`$ be the isometry including $`H_0`$ there. The following four matrices on $`H_0`$ will be preserved:
```math
I,\qquad J^*Y_0^tJ,\qquad J^*Y_0^{1-t}J,\qquad J^*(qI-Y_0)^{-1}J.
```
The last inverse is positive definite whenever the low space is nonzero. If $`H_0`$ is zero the unused low space can be dropped entirely.

For each low eigenvalue $`y`$ compress its spectral projection to $`H_0`$ and split this positive matrix as a sum of rank-one matrices $`vv^*`$. The four stored matrices together are a sum of the generators
```math
\big(vv^*,\ y^t vv^*,\ y^{1-t}vv^*,\ (q-y)^{-1}vv^*\big).
```
The real dimension of four Hermitian $`d`$ by $`d`$ matrices is $`4d^2`$. Conic Carathéodory retains at most $`4d^2`$ generators with nonnegative weights. Indeed any linear dependence among more of them lets one subtract a multiple of the dependence from the positive weights until at least one becomes zero and none becomes negative; repeat. Absorb each remaining weight into its vector $`w_j`$, retaining its original eigenvalue $`y_j`$. Since $`\sum_jw_jw_j^*=I`$, the map $`h\mapsto(w_j^*h)_j`$ embeds $`H_0`$ isometrically into the coordinate space of the retained atoms. There define the new low operator as the diagonal matrix with entries $`y_j`$. All four stored compressions agree exactly. This is the finite spectral version of matrix-valued moment quadrature. [Mädler and Schmüdgen, matricial Richter–Tchakaloff theorem](https://arxiv.org/abs/2310.00957)

Use the identity on $`H_+`$ and the preceding isometry on $`H_0`$ to identify $`H`$ with a subspace of the new space. Let $`Y'`$ be the direct sum of the retained high restriction and the new low diagonal operator. Extend $`R,K`$ by zero on the new $`H^\perp`$, and put $`X'=bI+R`$. It is positive because it agrees with the old $`X`$ on $`H`$ and equals $`bI`$ outside. For $`s=t,1-t`$, the compression of $`(Y')^s`$ to $`H`$ is unchanged. Also $`X^s`$ maps $`H`$ into itself and its restriction stays unchanged under the replacement. Testing the first crossed product between $`X^tU`$ and $`V`$, and the second between $`U`$ and $`X^{1-t}V`$, therefore gives the same scalar $`L`$.

It remains to prove $`X'+Y'\le zI+K`$. Set $`T=qI-Y`$ in the old space and use $`T'=qI-Y'`$ in the new one. Both are invertible. In each case the compression to $`H^\perp`$ is positive definite when this complement is nonzero, since all high eigenvectors are in $`H`$ and all remaining eigenvalues of $`Y`$ or $`Y'`$ are strictly below $`q`$. The compressions of $`T^{-1}`$ and $`(T')^{-1}`$ to $`H`$ agree. On the high block they are the unchanged negative inverse. On the low block this is the stored positive inverse moment; the cross blocks vanish. In particular this common compression $`G`$ is invertible. The Schur complement of either $`T`$ or $`T'`$ relative to its complementary block is $`G^{-1}`$, by block Gaussian elimination. Adding $`K-R`$, supported in $`H`$, changes this complement to $`G^{-1}+K-R`$. Positivity of the entire matrix is equivalent to positivity of that last expression. When the complementary space is zero the expression is the entire matrix.

In the original model $`T+K-R=zI+K-S\ge0`$. The identical Schur complement proves $`T'+K-R\ge0`$, as required. The new pair obeys
```math
N_k(X'+Y')\le kz+\mathop{\mathrm{tr}}K\lt L\le N_k(C_t(X',Y')).
```
The common isometric copy of the frames ensures that the new dimension is at least $`k`$. It is at most $`m+4d^2`$, giving both stated bounds. The construction took place inside the original finite list of low eigenvalues; it introduced no artificial spectral values for the second input.

## Finite spectra and exact decisions

At fixed $`k`$, an input with at most $`s`$ distinct positive eigenvalues admits a further exact reduction without any multiplicity bound. In each of its positive eigenspaces keep only the span of the projections of the columns of $`U,V`$. Define $`\widehat X`$ to take the original eigenvalue on these retained subspaces and zero elsewhere. Then $`0\le\widehat X\le X`$, its rank is at most $`2ks`$, and its positive spectral values belong to the old list. Its powers agree with the original powers on both frames. The witness $`L`$ is preserved while $`N_k(\widehat X+Y)\le N_k(X+Y)`$. Applying the bounded-rank construction yields a witness of order at most $`k-1+4(2ks+3k-1)^2`$ with at most $`s`$ distinct positive eigenvalues in the first input.

For fixed rational $`t=p/h`$ in lowest terms, all the stated finite tests are sentences over the real closed field. In each allowed dimension introduce positive semidefinite $`h`$th roots of the two inputs. Their polynomial powers express the crossed matrices. A strict violation is equivalent to the existence of two $`k`$-column isometries, a real scalar $`z`$, and a positive matrix $`K`$ with $`K\ge X+Y-zI`$ for which the real part of the frame trace exceeds $`kz+\mathop{\mathrm{tr}}K`$. Here positive means positive semidefinite. This follows from the variational formulas used above. Real and imaginary entries, principal minors and rank minors give polynomial conditions. The bounded-number-of-spectral-values condition can be expressed using a unitary diagonalization with a finite choice of labels for its positive diagonal entries. Effective quantifier elimination therefore decides the exact inequality, including the zero-gap case, for fixed input rank and rational exponent across all matrix orders and Ky Fan ranks. It also decides it for fixed $`k,t`$ in the scalar-plus-bounded-rank and bounded-distinct-spectral-value classes. The proof of the reduction itself holds at each real $`t`$ in the open unit interval. It does not bound the input rank, the number of spectral values, or the order of an unrestricted counterexample independently of the gap.

The earlier fixed-Ky-Fan-rank result applies to arbitrary inputs and bounds the dimension needed to retain a specified positive violation margin. The present theorem uses a low-rank input perturbation and one resolvent to obtain a bound valid for every strict gap at once in the stated classes. Bourin's full question remains open. [Earlier finite-witness theorem](FINITE-WITNESS.md) · [Exact fixed-rank accuracy algorithm](EFFECTIVE-GAP.md) · [Source comparison and independent review](INPUT-RANK-REVIEW.md)
