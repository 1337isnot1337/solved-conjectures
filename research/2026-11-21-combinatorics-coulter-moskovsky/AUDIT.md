# Coulter–Do–Moskovsky's conjecture: independent audit

21 November 2026. Reviewed independently by the graph/number-theory worker.

**Status: the all-profile asymptotic theorem passes this mathematical review. A direct exact calculation also disproves monotonicity starting at genus zero. The source's asymptotic wording leaves the intended starting-genus scope uncertain, so the package remains outside the completed-conjecture count.**

## 1. Exact source scope

The primary source is Xavier Coulter, Norman Do and Ellena Moskovsky,
*Integration on complex Grassmannians, deformed monotone Hurwitz numbers, and interlacing phenomena*, Canadian Journal of Mathematics, published online 30 June 2025, DOI [10.4153/S0008414X25101168](https://doi.org/10.4153/S0008414X25101168), [published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1D1EAFA4F78A147F6B88ECD63EEA9850/S0008414X25101168a.pdf/integration-on-complex-grassmannians-deformed-monotone-hurwitz-numbers-and-interlacing-phenomena.pdf).

I read Definition 3.1, Proposition 3.3, Proposition 3.9, the root-conjecture discussion, and Conjecture 3.15, including screenshots of printed pages 23–24. Conjecture 3.15 specifies the root limits as genus tends to infinity and adds that convergence on the two sides of −1 is respectively “increasing from below” and “decreasing from above.” It does not qualify monotonicity by an eventual threshold. Figure 3 displays genera 10 through 20 for profile (4,2,1); that finite display does not restrict the quantifier in the conjecture. The surrounding family is defined for every nonnegative genus.

The current theorem proves every specified root limit, the side of approach, and eventual strict monotonicity for every fixed nondegenerate profile. The additional exact calculation in Section 6 shows that monotonicity starting at genus zero is false. Since the source introduces the claim in an asymptotic context, an unqualified declaration that its conjecture is false would also overstate what its wording establishes. The package should state both precise conclusions and retain the interpretation qualification. Separate Conjectures 3.13–3.14 remain open within this package.

## 2. Normalizations and connected generating functions

Write $d=\sum_i\mu_i$, let $n$ be the number of indexed parts, and put $R=d+2g-2+n$. The generating function for a fixed permutation, weighted by factorization length and the number of distinct larger transposition entries, has the character expansion

```math
W_\mu(u,t)=\frac{1}{d!}\sum_{\lambda\vdash d}
 f^\lambda\chi^\lambda_\mu
 \prod_{c\in\mathop{\mathrm{cont}}(\lambda)}
 \frac{1-(1-t)cu}{1-cu}.
```

This agrees exactly with the disconnected convention in source Proposition 3.3. The normalization of the connected coefficient is

```math
[u^R]C_\mu(u,t)=\left(\prod_i\mu_i\right)H_g(t).
```

The connected Möbius inversion is correct:

```math
C_\mu=\sum_{\pi\in\Pi_n}(-1)^{|\pi|-1}(|\pi|-1)!
 \prod_{B\in\pi}W_{\mu_B}.
```

Indeed, each orbit of the transpositions is a union of cycles of their product. For fixed orbits, factorization sequences on disjoint supports merge in a unique weakly increasing order of their larger entries. Larger entries from different supports cannot coincide. Thus no shuffle coefficient occurs, and the number of distinct larger entries is additive. Increasing standardization of each support preserves the relevant ordering and weight. Set-partition inversion applies to the indexed cycles, including repeated cycle lengths.

## 3. Both largest pole pairs

All poles come from reciprocal nonzero integer contents. At $u=1/(d-1)$, only the row partition $(d)$ contributes, and no proper cycle-block product can have that pole. Its partial-fraction coefficient is

```math
\frac{L_d(t)}{d!(d-2)!},
\qquad
L_d(t)=t\prod_{j=1}^{d-2}(d-1-j+jt).
```

For the next positive pole put $k=d-2$ and let $m_1$ count the fixed points. Only $(d)$ and $(d-1,1)$ contribute within the size-$`d`$ character sum. Among proper cycle partitions, only a block of size $d-1$ together with an isolated fixed point contributes. There are exactly $m_1$ such choices, each with Möbius coefficient −1; its size-one generating function is 1.

After removing the factor $1-ku$, let

```math
B_k(t)=\frac{L_{d-1}(t)}{(d-3)!}.
```

The row contribution is $B_k(t)(1-(k+1)t)/d!$. The hook has dimension $k+1$ and character $m_1-1$, while its content −1 supplies the factor $(k+1-t)/(k+1)$. The singleton subtraction is $-m_1B_k(t)/(d-1)!$. Thus the total coefficient is

```math
\begin{aligned}
\frac{B_k(t)}{d!}
\bigl(1-(k+1)t+(m_1-1)(k+1-t)-m_1(k+2)\bigr)
&=-\frac{k+m_1}{d!}(1+t)B_k(t).
\end{aligned}
```

This confirms both the coefficient and its sign. Omitting the disconnected singleton term would invalidate the claimed profile-independent direction of approach.

The parity identity $C_\mu(-u,t)=(-1)^{d-n}C_\mu(u,t)$ follows either from transposition parity or from conjugating Young diagrams. Since $R\equiv d-n\pmod 2$, the negative pole in each pair contributes the same coefficient as its positive partner. The factors of two in the manuscript are therefore correct.

## 4. Remainder and root motion

After removing those four poles, all remaining absolute contents are at most $d-3$. For fixed profile, the rational functions have bounded pole order and bounded degree in $t$. Partial fractions therefore give a coefficientwise remainder $O(R^K(d-3)^R)$ for some fixed $K$; any polynomial part in $u$ disappears for large $R$.

Consequently the stated normalization satisfies

```math
F_g(t)=L_d(t)-A_\mu\rho^R(1+t)L_{d-1}(t)
 +O(R^K\sigma^R),
\quad
A_\mu=(d-2)(d-2+m_1),
\quad
\rho=\frac{d-2}{d-1},\quad \sigma=\frac{d-3}{d-1}.
```

The degree is $d-1$, by source Proposition 3.9 (also bounded directly by the number of possible larger transposition entries). The limiting polynomial has exactly $d-1$ simple real roots. Preserving its signs at the endpoints of disjoint root neighborhoods gives one real root in every neighborhood; degree counting excludes extra or multiple roots for all sufficiently large genus.

At a nonzero root $r_j=1-(d-1)/j$, first-order perturbation gives

```math
\alpha_{g,j}-r_j
 =A_\mu(1+r_j)\frac{L_{d-1}(r_j)}{L_d'(r_j)}\rho^R
 +O(\rho^{2R}+R^K\sigma^R).
```

Cancel the common factor $t$ from $L_{d-1}$ and $L_d$. Their remaining zeros strictly interlace, and both leading coefficients are positive. It follows that $L_{d-1}(r_j)/L_d'(r_j)>0$. Thus the leading displacement is negative below −1 and positive between −1 and zero.

The remainder is $o(\rho^R)$. Replacing $g$ by $g+1$ increases $R$ by two, so subtraction gives

```math
\alpha_{g+1,j}-\alpha_{g,j}
 =A_\mu(1+r_j)\frac{L_{d-1}(r_j)}{L_d'(r_j)}
 (\rho^2-1)\rho^R+o(\rho^R).
```

The main coefficient is nonzero except at $r_j=-1$, proving strict monotonicity for all sufficiently large genera. The exact zero and −1 roots are handled correctly by the factorization weight and palindromicity. Total sizes 2 and 3 give positive multiples of $t$ and $t(1+t)$, respectively. Size 1 is correctly separated: positive-genus connected polynomials vanish, so their roots cannot be used.

## 5. Review conclusion and interpretation limit

No mathematical gap was found in the all-profile asymptotic theorem. This review uses exact structural arguments; finite computations are not evidence for the missing all-genus statement.

The package should remain **uncounted while the source interpretation is unresolved**. The exact initial reversal below means that no proof of monotonicity from genus zero can exist as stated. The present asymptotic theorem establishes the limits and eventual monotone directions for every profile. These two precise results distinguish the possible readings without deciding authorial intent by fiat. All-genus real-rootedness and profile-increment interlacing remain outside the result.

This is a mathematical and source-scope audit. It does not certify that a complete priority search has been performed for the new asymptotic theorem; the research package must retain the limits of its literature and corpus searches.

## 6. Independent exact initial reversal

Take the indexed profile $(2,2)$, so $d=4$, $n=2$ and the source factorization length is $R=4+2g$. Both genera zero and one are in the defined domain. Fix the permutation $`(1\,2)(3\,4)`$.

The two polynomials below are already printed in the authors' earlier [MATRIX note, *Topological Narayana polynomials and interlacing conjectures*, page 5](https://www.matrix-inst.org.au/wp_Matrix2016/wp-content/uploads/2023/07/Coulter.pdf), in the row for $(2,2)$. I checked that table directly. The resulting initial reversal is therefore an elementary consequence of prior source data, not a claimed new numerical discovery or a separate novel resolution.

I independently enumerated the weakly monotone transposition sequences directly from the definition, with no use of the manuscript's cut-and-join or character implementation. The checker tracks the permutation product, the graph of transpositions, and the set of larger entries. Connectedness of that graph is exactly transitivity of the generated group. The results are:

| Length | All factorizations, by powers of $t$ | Transitive factorizations |
| --- | --- | --- |
| 4 | $4t+12t^2+4t^3$ | $4t+10t^2+4t^3$ |
| 6 | $50t+131t^2+50t^3$ | $50t+128t^2+50t^3$ |

The source normalization divides by the product of the cycle lengths, namely four. Thus

```math
H_0(t)=t^3+\frac52t^2+t
      =\frac t2(t+2)(2t+1),
\qquad
H_1(t)=\frac{25}{2}t^3+32t^2+\frac{25}{2}t.
```

The two nonzero roots at genus zero are exactly the conjectured limits, $-2$ and $-1/2$. At genus one they are

```math
\frac{-32-\sqrt{399}}{25},\qquad
\frac{-32+\sqrt{399}}{25}.
```

These satisfy

```math
\frac{-32-\sqrt{399}}{25}<-2,
\qquad
\frac{-32+\sqrt{399}}{25}>-\frac12.
```

For example, the quadratic $H_1(t)/t$ has positive leading coefficient and takes the exact negative values $-3/2$ at $t=-2$ and $-3/8$ at $t=-1/2$. Its roots therefore lie strictly outside the genus-zero pair. Equivalently, the radical inequalities reduce to $399>18^2$ and $399>(39/2)^2$.

This is an exact counterexample to the interpretation requiring the conjectured root directions at every step beginning with genus zero. It does not contradict the all-profile asymptotic theorem and does not, on its own, decide whether the source intended only eventual monotonicity. The checker is [verify_initial_reversal.py](verify_initial_reversal.py); its role is to reconstruct an exact counterexample, not to infer a universal statement from finite positive tests.
