# Brualdi's cohesive-matrix conjecture: boundary diagnostics

Date: 2026-11-21 UTC. No resolution is claimed.

The family is C_n=J_n−I_n+E_11. Brualdi proposed that these supports are cohesive but not barycentric. Song proved non-barycentricity; cohesiveness is known at n=4 and, on the current Lavi page, n=5. The intended remaining target is the uniform assertion for all n≥4, not an additional fixed order.

Sources checked directly:

- [Minc Problem 14](https://yair-lavi.com/mincs-list/problem-14/index.html).
- [Minc Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html), the related zero-diagonal minimum conjecture.

## Why the PSW reduction does not transfer

Rows 2 through n have different forbidden positions, so Minc's repeated-support averaging theorem does not apply to them. Averaging simultaneous row-column conjugates is not justified by symmetry alone. Even transpose averaging can increase the permanent on the zero-diagonal doubly stochastic face: the sign-matrices agent supplied

```math
 A=\frac12\begin{pmatrix}0&1&1&0\\1&0&0&1\\0&1&0&1\\1&0&1&0\end{pmatrix},
```
with per A=1/8 and per((A+A^T)/2)=9/64. Thus optimizing the symmetric one-parameter family is not a full-face proof.

## A principal-cofactor shortcut is false

A possible way to exclude a zero-diagonal boundary minimizer would be a universal inequality

```math
 \sum_i\operatorname{per}A(i\mid i)\le n\operatorname{per}A.
```
It is false, even when every off-diagonal entry is positive. Let U_3=(J_3−I_3)/2 and

```math
 A_t=(1-t)(U_3\oplus U_3)
 +t\begin{pmatrix}0&J_3/3\\J_3/3&0\end{pmatrix},\qquad0<t<1.
```
Put a=(1−t)/2 and b=t/3. Counting permutations by the number of cross-block edges gives

```math
 P(t)=\operatorname{per}A_t=4a^6+81a^4b^2+144a^2b^4+36b^6.
```
Every principal cofactor equals

```math
 q(t)=2a^5+18a^3b^2+24ab^4.
```
At t=0, q=P=1/16, while (q−P)'(0)=1/16>0. Hence the proposed inequality fails throughout a positive interval. For a directly reproducible exact witness, t=1/10 gives

```math
 P=\frac{4787641}{129600000},\qquad
 q=\frac{185959}{4800000},\qquad
 q-P=\frac{58313}{32400000}>0.
```
The counting formulas were checked independently with the exact subset-DP permanent routine in `results/pula-song-wanless/verify.py`. This is an obstruction to a proof mechanism, not a counterexample to Brualdi's conjecture or Conjecture 44. A principal-cofactor argument would have to exploit minimizing conditions, and would still need to exclude other off-diagonal boundary zeros.
