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

## Concrete partial theorem under independent audit

Using the two all-order estimates in Y. Lavi, *The Marcus–Minc Transform Inequality*, arXiv:2609.29262 (2026), a short deduction proves Gyires's stronger Gram inequality whenever `||A-J_n||_op <= 1/sqrt(n)`. This is a spectral class in every order, not a resolution of Conjecture 20. Full proof in `gyires_spectral.md`. No novelty claim is made pending a broader literature audit.

## Numerical discovery searches completed

All are floating exploratory searches and do not prove the conjectures.

- Marcus k=2: 25 local starts with m=5 and 40 with m=6, using several Gram ranks and analytic gradients; no negative logarithmic ratio found. The best runs approach block-diagonal equality.
- Strong Gyires: 40 local starts n=7; no violation beyond roundoff at J. Some boundary local minima have a positive gap.
- Lih–Wang midpoint: 40 local starts n=10; no violation found.
- Zero diagonal: 40 local starts n=8; no violation found.

Scripts and JSON records are included. The raw optimizer states and compiled shared object are disposable and should not be committed.

## Rejected symmetrization shortcuts

Replacing a zero-diagonal doubly stochastic A by `(A+A^T)/2`, or averaging simultaneous row/column transposition conjugates, can increase its permanent already in order four. Random searches found increases exceeding 10%; therefore neither operation is a valid universal descent argument for Conjecture 44. No full-conjecture counterexample is implied.

## Further rejected coefficient shortcut

For `P_A(x)=product_i sum_j a_ij x_j = sum_alpha c_alpha x^alpha`, it would suffice for the strong Gyires inequality to prove that `alpha! c_alpha <= per(A)` for every exponent vector. This tempting assertion is false. Let `A=(I+P_4)/2`, with `P_4` a cyclic permutation. Then `per(A)=1/8`, but for `alpha=(2,0,2,0)` one has `alpha! c_alpha=1/4`. Thus a coefficientwise central-maximum argument cannot prove Gyires. The desired weighted sum-of-squares inequality may still hold.

## Independent review of the Perron-root proposal

At the parent agent’s request, reviewed the proposed general FPRAS for Problem 18. The detailed audit is in `perron_review.md`. The stability, capacity, trace estimate, cyclic-block permanent identity, zero-root criterion, and polynomial-size fugacity grid survived review. This is the parent’s proposed result and is still under final error and novelty audit. It is not a result on any of the four inequality targets assigned here.

## Uniform centered-coefficient search

For real zero-margin `X` of Frobenius norm one, tested the proposed bound `|n^k sigma_k(X)/(n)_k|<=1` in orders 3 through 10 and all degrees 3 through n. Twenty optimized starts per pair found no violation. The bound remains unproved. `coefficient_search.py`, `subpermanent_grad.cpp`, and `coefficient_search.json` record the method and observations. These numerical results are not conjecture resolutions.

Bero Roos’s permanent-approximation estimates (https://arxiv.org/pdf/1612.03702) use only column centering and give a parameter of order `n||X||F²` in the relevant normalization, so do not supply the missing uniform radius. Peter McCullagh’s 2012 expansion (https://www.stat.uchicago.edu/~pmcc/pubs/dspermanent.pdf) uses both margins and has a determinantal asymptotic, but imposes additional moment conditions on `nX`; it is not uniform on a fixed Frobenius ball.
