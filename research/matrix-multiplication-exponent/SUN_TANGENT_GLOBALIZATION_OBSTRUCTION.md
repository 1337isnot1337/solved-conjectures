# The printed tangent ledger cannot globalize to M32 at degree zero

Research audit, 24 November 2026 UTC. The result below excludes the simultaneous local-output and globalization assertions in the specified version of Sun's construction. It does not exclude an unspecified different degeneration from the same original source, and it does not settle the matrix multiplication exponent.

Primary source: Zhi-Wei Sun, *Tensor Degenerations for Matrix Multiplication*, [arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1). Relevant locators are Section 6.2, equations (6.2)--(6.3); Section 8, the two paragraphs before (8.2), and Theorem 8.1(a); and the source-resolved clarification in Section 9.2, equation (9.2), and Appendix A.5.

## 1. The precise conjunction being tested

The audit uses these statements from that fixed version:

1. A tangent pair consists of one corner tensor W and one companion C3. Its complete leading output has the eight dense records of T_ar and three clean one-bar endpoint records. W supplies seven dense records, and the companion supplies the remaining one.
2. In the source-resolved description, the dense records are grouped as auz, bvz, bus, and cwr. Each grouped collection varies on only one leg. The companion contributes cwr and the three endpoints.
3. The downstream dense, completion, row and Weyl transformations in Section 8 are fixed side maps, composed before taking the leading Laurent coefficient, and preserve that coefficientwise local description.
4. Theorem 8.1(a) identifies the result, after the sixteen outer rows, with M32.

The argument requires the first statement to describe the complete leading output of the selected tangent pair. It does not silently discard an unprinted extra leading term. The third statement is used in its ordinary degree-zero sense: a fixed linear map over C, rather than a Laurent map with an additional pole.

## 2. Six products suffice for the complete raw tangent tensor

Let a,b,c,e belong to the first local space; u,v,w,y_1,y_2,y_3 to the second; and z,s,r,z_1,z_2,z_3 to the third. No independence assumptions on these vectors are needed. Consider
```math
T_{\mathrm{tan}}
 =auz+bvz+bus+cwr+e\sum_{j=1}^3y_jz_j.                    \tag{1}
```
The first three terms are an arbitrary local image of the corner tensor W. The fourth is the remaining dense record. The last three are an X-bar endpoint block; the other two orientations are obtained by cyclically permuting the parties.

For a new parameter epsilon, the following is a sum of six simple tensors:
```math
\begin{split}
R_\epsilon={}&\epsilon^{-1}(b+\epsilon a)(u+\epsilon v)
                                  (z+\epsilon s)
 -\epsilon^{-1}buz+cwr+e\sum_{j=1}^3y_jz_j .
\end{split}                                                   \tag{2}
```
Direct expansion gives
```math
R_\epsilon=T_{\mathrm{tan}}
 +\epsilon(avz+aus+bvs)+\epsilon^2avs.                        \tag{3}
```
There is no negative coefficient. Thus
```math
\underline{\mathop{\mathrm{R}}}(T_{\mathrm{tan}})\le6.                          \tag{4}
```
This is an explicit degeneration, not an inference from a count of support monomials.

The printed raw record refinement does not invalidate (4). For example, replace a by a sum of four distinct X-side components carrying A3, B1, B2 and R; replace v by the sum of the two Y-side components carrying A1 and Q; and retain a separate s component for P. These substitutions are linear on single tensor factors. They preserve (2)--(3) exactly and retain all eight dense record names. The vectors c,w,r retain the single C1 record. Keeping the three endpoint names separate likewise changes none of the six-product bound.

More generally, every subsequent side-local linear map can be applied separately to all factors in (2). Its resulting image still has border rank at most six. A record assignment depending jointly on an entire support triple, rather than on the local coordinate being mapped, would be a different operation and would require its own source construction.

## 3. One tangent pair already contradicts the stated M32 bridge

The charged one-row source in Sun's equations (7.5), (7.6) and (8.1), also stated in Theorem 1.3(a), is
```math
S_{2048}=14C_3\oplus6C_2\oplus7W\oplus5D_4,
```
with border-rank budget
```math
14\cdot5+6\cdot4+7\cdot2+5\cdot4=128.                     \tag{5}
```
Here is an independent certificate for every term of this budget. Sun's Definition 2.4, equation (2.3), defines
```math
C_q=\sum_{i=1}^q(x_0y_iz_i+x_iy_0z_i+x_iy_iz_0)
       +x_\infty y_0z_0+x_0y_\infty z_0+x_0y_0z_\infty.
```
Put $`X_\Sigma=\sum_i x_i`$, and define $`Y_\Sigma,Z_\Sigma`$ in the same way. The following expression has $`q+2`$ simple-tensor summands over the Laurent field:
```math
\begin{split}
\Psi_{q,\epsilon}={}&
 \sum_{i=1}^q\epsilon^{-2}
 (x_0+\epsilon x_i)(y_0+\epsilon y_i)(z_0+\epsilon z_i)\\
&-\epsilon^{-3}
 (x_0+\epsilon^2X_\Sigma)(y_0+\epsilon^2Y_\Sigma)
 (z_0+\epsilon^2Z_\Sigma)\\
&+(\epsilon^{-3}-q\epsilon^{-2})
 (x_0+\epsilon^3x_\infty)(y_0+\epsilon^3y_\infty)
 (z_0+\epsilon^3z_\infty).
\end{split}                                                   \tag{5a}
```
The degree-minus-three coefficients in the last two lines cancel. The degree-minus-two coefficients are $`q x_0y_0z_0-qx_0y_0z_0=0`$. At degree minus one, the three aggregate linear terms in the first line cancel those in the second line. At degree zero, the first line gives precisely the three satellite families and the third line gives precisely the three corner terms. There are no other nonpositive degrees. Thus
```math
\Psi_{q,\epsilon}=C_q+O(\epsilon),\qquad
\underline{\mathop{\mathrm{R}}}(C_q)\le q+2.                                    \tag{5b}
```
In particular this proves the bounds four and five used for $`C_2`$ and $`C_3`$. Each scalar coefficient in (5a) can be absorbed into one tensor factor. The two-product tangent formula in (2), without its four extra simple tensors, proves $`\underline{\mathop{\mathrm{R}}}(W)\le2`$. Finally $`D_4`$ is already a sum of four simple tensors, and its flattening has rank four. These certificates justify (5) without importing any part of the disputed globalization.

Choose just one of the seven declared tangent pairs. Its charged cost is 5+2=7. The remaining source is $`13C_3\oplus6C_2\oplus6W\oplus5D_4`$, so its border-rank budget is at most $`13\cdot5+6\cdot4+6\cdot2+5\cdot4=121`$.

Under the premises of Section 1, replace the complete leading output of this pair by (2). All fixed downstream maps apply to its factors and preserve its order-zero coefficient. The other output terms can still be supplied by the remaining source. Consequently each outer row has output border rank at most 121+6=127, and the sixteen-row output has border rank at most
```math
16\cdot127=2032.                                           \tag{6}
```
No tensor-rank additivity theorem is used: only subadditivity supplies this upper bound. No deletion of the entire tangent module is made. The new six-product family retains its dense records and all three endpoints.

For completeness, the separation from the rest of the Laurent expression is legitimate. The selected pair has no negative coefficient, and its postcomposition has no added pole. If the complete global expression has leading order zero, subtracting this pair leaves no negative coefficient in the remaining expression. Its order-zero tensor is therefore a degeneration of the remaining source. Alternatively one can combine the two finite degeneration parameters by replacing epsilon with a sufficiently high positive power of the old parameter. Both descriptions give (6).

Landsberg--Michałek, *A 2n^2-log_2(n)-1 lower bound for the border rank of matrix multiplication*, [arXiv:1608.07486v1](https://arxiv.org/pdf/1608.07486v1), Theorem 1.1, gives
```math
\underline{\mathop{\mathrm{R}}}(M_n)\ge2n^2-\lceil\log_2n\rceil-1.
```
At n=32 this is
```math
\underline{\mathop{\mathrm{R}}}(M_{32})\ge2048-5-1=2042>2032.                 \tag{7}
```
Thus no degree-zero side-local globalization of the complete tangent ledger stated in Section 1 can produce M32. The proof needs only one chosen tangent pair and all sixteen outer rows; it does not rely on applying the compression to every tangent pair.

## 4. What an actual repair would have to change

Retaining source-record names alone is insufficient: Section 2 already keeps them through the factorable raw record groups. The obstruction is also independent of the missing scalar phase factorization in (8.3). It arises before any particular choice of the fixed downstream maps.

A proposed repair must therefore depart from at least one tested premise. For example, it could introduce additional leading source-resolved terms absent from (1), or use a later Laurent pole that promotes formerly positive terms into the final leading coefficient. Such a change must be written as three actual local maps and rechecked on the full source. Calling a support-dependent assignment a record refinement does not provide those maps.

The argument does not prove that the abstract border-rank bound 2048 for M32 is false. It proves that the printed complete tangent-output description and fixed downstream bridge cannot both be valid. In particular, the omitted degree-zero phase maps cannot be filled in while leaving all those premises intact.

## 5. Exact verification

The checker `check_sun_tangent_compression.py` expands the six products with independent source-record variables. It verifies all eleven order-zero records (eight dense and three endpoint), cancellation of the only negative term, and the full positive error. It also expands (5a) for q=2 and q=3, checks every leading coefficient and the absence of negative coefficients, and verifies the remaining-source count 121 and the bounds 2032<2042. It does not assume the claimed globalization, perform a physical record collapse, or test an alternative raw-record construction.

Independent review: the operator-comparison worker reopened Sections 6.2, 8, 9.2 and Appendix A.5 of the fixed primary HTML and checked the six-product implication, the preservation of the one-leg record refinements, and the degree-zero scope. The root reviewer independently reopened the same Sun sections and Landsberg--Michałek Theorem 1.1, checked the source count and local expansion, and replayed the exact checker, including the independent C2/C3 certificates. These are internal written-proof reviews and exact arithmetic checks, not external peer review or Lean verification.

A bounded primary-source search on 24 November 2026 for the exact identifier with tangent/criticism terms and the exact title with error terms found the original announcement and related nine-fourths sources, but no independent public treatment of this tangent compression. This search does not establish priority or absence of other critiques; no novelty claim is made.

