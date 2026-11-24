# Gravgaard–Lee’s mixed Lüroth sumset conjecture

Let $L_{\leq m}$ be the set of numbers with all Lüroth digits in $\{2,\ldots,m\}$. We prove
$$
 [2879/3520,2]\ \subseteq\ L_{\leq3}+L_{\leq4}.
$$
In particular, the sum contains $[1,2]$ and represents every real residue modulo $1$. This is the complete assertion of [Gravgaard–Lee, Conjecture 2.2](https://arxiv.org/html/2506.12513v2#S2.SS1).

## 1. A finite covering criterion

Write $A=L_{\leq3}$, $B=L_{\leq4}$, and $f_d(x)=1/d+r_dx$ where $r_d=1/[d(d-1)]$. These are the Lüroth inverse branches. The attractor of the branches with $2\le d\le m$ is $L_{\leq m}$: an infinite allowed digit string defines its point by composing the branches, and every such point belongs to those branches' genuine half-open digit intervals. Indeed all allowed tails are in $(0,1]$, so $1/d<f_d(x)\le 1/(d-1)$; it is the left endpoint, corresponding to tail zero, which is excluded by the source's convention.

The hulls of $A,B$ are $[2/5,1]$ and $[3/11,1]$, respectively, as seen by the constant maximum- and minimum-digit sequences. Consider $A+\lambda B$ for the state $\lambda>0$. Prepending digit $d$ on the $A$ side gives the embedding
$$
 \mathsf A_d:\quad z\longmapsto 1/d+r_d z,\qquad
 \text{next state }\lambda/r_d,\quad d\in\{2,3\}.
$$
Prepending a digit on the $B$ side instead gives
$$
 \mathsf B_d:\quad z\longmapsto \lambda/d+z,\qquad
 \text{next state }\lambda r_d,\quad d\in\{2,3,4\}.
$$

Suppose a finite set of positive states has a bounded set $J_\lambda$ for each state such that every point of $J_\lambda$ is in one of those branch images of a set $J_{\rm next}$ assigned to another allowed state. Then $J_\lambda\subseteq A+\lambda B$. To see this, repeatedly choose a branch and its inverse image in the next set. After $m$ choices, write $P_m,Q_m$ for the products of the selected contraction factors on the two sides, and $u_m,v_m$ for the two prefix maps evaluated at zero. The original point is
$$
 u_m+\lambda v_m+P_m z_m,\qquad
 z_m\in J_{\lambda_m},\quad \lambda_m=\lambda Q_m/P_m .
$$
Both sides must acquire infinitely many digits. Otherwise exactly one product would tend to zero, and $\lambda_m$ would tend to zero or infinity, contrary to its finite positive state set. Thus $P_mz_m\to0$, and the two prefix values converge to the allowed Lüroth numbers specified by the selected infinite digit strings. This proves the criterion without any assumption that the unnormalized map $\mathsf B_d$ contracts.

## 2. A seven-state certificate

Use the coordinate
$$
 h_\lambda(x)=2/5+3\lambda/11+\frac{x}{64}
             \bigl(1+\lambda-2/5-3\lambda/11\bigr).
$$
The coordinate interval $[0,64]$ is exactly the hull of $A+\lambda B$. In the table, a row gives $h_\lambda^{-1}(J_\lambda)$, followed by subintervals of it covered by the indicated branches. More precisely, a covered subinterval $I$ listed under $\mathsf A_d$ or $\mathsf B_d$ asserts that $h_\lambda(I)$ lies inside that branch image of the table's $J_{\rm next}$. All endpoints are rational.

| $\lambda$ | $h_\lambda^{-1}(J_\lambda)$ | Covered subintervals and branches |
|---|---|---|
| $1/6$ | $[3,19]\cup[28,64]$ | $[3,19]$ by $\mathsf A_3$; $[28,64]$ by $\mathsf A_2$ |
| $1/3$ | $[1,64]$ | $[1,26]$ by $\mathsf A_3$; $[24,64]$ by $\mathsf A_2$ |
| $1$ | $[7,64]$ | $[7,77/5]$ by $\mathsf B_3$; $[77/5,64]$ by $\mathsf A_2$ |
| $2/3$ | $[1,64]$ | $[1,34]$ by $\mathsf A_3$; $[16,64]$ by $\mathsf B_2$ |
| $2$ | $[1,64]$ | $[1,16]$ by $\mathsf A_3$; $[11,64]$ by $\mathsf A_2$ |
| $4$ | $[1,64]$ | $[1,15]$ by $\mathsf B_4$; $[9,55/2]$ by $\mathsf B_3$; $[55/2,64]$ by $\mathsf B_2$ |
| $12$ | $[1,22]$ | $[1,9]$ by $\mathsf B_4$; $[9,22]$ by $\mathsf B_3$ |

These are fifteen interval endpoint checks. For instance, in the row $\lambda=1$, $\mathsf B_3$ reaches state $1/6$ and the first interval there gives image $[1477/219,1127/73]$ in the state-$1$ coordinate. This contains $[7,77/5]$. Meanwhile $\mathsf A_2$ reaches state $2$ and gives image $[2225/146,64]$, containing $[77/5,64]$. The remaining checks use the same substitution. They can also be reproduced with [the exact rational verifier](check.py).

The covered intervals fill each of the seven rows, so the finite covering criterion applies. At state $1$ it gives $[h_1(7),h_1(64)]=[2879/3520,2]\subseteq A+B$, as asserted.

## Source and scope

The conjecture appears as Conjecture 1 in [arXiv v1](https://arxiv.org/pdf/2506.12513v1) and as Conjecture 2.2 in [v2](https://arxiv.org/html/2506.12513v2#S2.SS1). The journal article appeared in the *International Journal of Number Theory* ([DOI](https://doi.org/10.1142/S1793042126500958)). The source proves that $L_{\leq3}+L_{\leq4}$ is not globally an interval, an assertion compatible with the interval proved here. This proof establishes the whole modular sumset assertion, not a finite sample of residues. The different all-$k$ upper-and-lower-bounded sumset in Conjecture 2.6 is not addressed. Searches for the exact conjecture, paper title, arXiv identifier and the authors with the digit bounds did not surface a prior resolution. This is a bounded search, not a priority guarantee.
