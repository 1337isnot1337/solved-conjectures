# Minc inequalities research, 2026-11-20

Status: research in progress; no new full resolution established.

## Targets and verified statements

- Gyires's ratio inequality, Minc Conjecture 20: for doubly stochastic A of order n, `4 per(A)^2 >= (n!/n^n) [per(AA^T)+per(A^T A)+2per(A^2)]`, equality only at J. Source https://yair-lavi.com/mincs-list/conjecture-20/index.html . General n remains listed open. Chang 1990 treats n<=3; Chris Ozols's 2026 repository treats n=4, with a finite certificate and explicit compiler trust disclosures: https://github.com/cozuya/gyires-permanent-4x4 .
- Lih–Wang convexity inequality, Conjecture 34: for doubly stochastic A and 1/2<=alpha<=1, `per(alpha J +(1-alpha)A) <= alpha per(J)+(1-alpha)per(A)`. Source https://yair-lavi.com/mincs-list/conjecture-34/index.html . General case remains listed open. Udayan–Somasundaram 2024 (https://doi.org/10.1515/spma-2024-0006) proves order-four result and conditional order-six results; preprint abstract overstates order-six scope. Lavi also lists order-four proof and n=5 mixtures of four permutations, not a general solution.
- Zero-diagonal doubly stochastic minimum, Conjecture 44: `per(A)>=D_n/(n-1)^n` for zero-diagonal doubly stochastic A; equality only off-diagonal uniform U_n. Source https://yair-lavi.com/mincs-list/conjecture-44/index.html . Known n<=4, strict local minimum in all orders, quantitative exclusions in Lavi's project; no full proof found.
- Marcus's block-permanent inequality, Conjecture 9: for PSD Hermitian A with m-by-m blocks of size k, G_ij=per(A_ij), conjecture per(A)>=per(G). Source https://yair-lavi.com/mincs-list/conjecture-9/index.html . This is a special case of Lieb's permanental dominance for a wreath product.

## New status finding beyond Lavi's page

Daniel Tubbenhauer, *Positivity in symmetric webs and block permanents*, arXiv:2611.22058, submitted 2026-11-17; author page updated 2026-11-18. Primary URLs:

- https://www.dtubbenhauer.com/blockpermanents.html
- https://arxiv.org/abs/2611.22058
- https://arxiv.org/pdf/2611.22058

Theorem 1A.1 claims the full Marcus inequality for m<=4 and all k, m=5 and k>=3, and all m,k satisfying `2^k-1 >= m(m-1)(2m-1)/(6 floor(m/2))`. These statements must not be counted as new research here. The first unhandled quadratic block case is m=5,k=2; the general conjecture remains open. Section 9 gives a negative *marked closure* but explicitly says its averaged quantity stays positive, so it is not a counterexample.

## Approaches under investigation

1. Gyires: the stronger `per(AA^T) <= per(A)^2/(n!/n^n)` suffices, using Gram Cauchy–Schwarz. In polynomial language P_A(x)=product_i sum_j a_ij x_j, the Gram permanent is the Fischer norm squared `sum_alpha alpha! [x^alpha]P_A^2`. Doubly stochasticity fixes P_A(1)=1 and its logarithmic gradient; a sharp central-coefficient/norm inequality would prove the result. No such general inequality established.
2. Lih–Wang: normalize k-subpermanent sums by their values at J to q_k. Then `per((1-t)J+tA)/per(J) = E q_K`, K~Binomial(n,t). The target is `E q_K <=1+t(q_n-1)` for 0<=t<=1/2. Naive coefficientwise convexity is false already at n=3, and normalized subpermanent monotonicity is related to disproved Holens–Djokovic claims.
3. Marcus: rank-two Gram matrices correspond to binary homogeneous polynomial factors. Quadratic factors are automatically products of linear forms over C. This gives a fast exact candidate search using convolution for the large permanent and a small permanent for packet inner products. Floating search is only a discovery tool; any negative candidate requires rational/algebraic exact certification.
