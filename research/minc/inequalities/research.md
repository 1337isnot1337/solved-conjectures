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


## Additional independent reviews and failed routes

The final `research/minc/compound_fpras.md` review found no remaining gap after the draft added the full Newton interpolation argument for a positive initial prefix of Perron roots and handled nonpositive sampler output on a failure event. Reviewed the finite geometric grid, constants, rational root computation, zero-root assignment criterion, and n=1 case. A review comment was posted on GitHub issue 140. The cited Leake–Ryder source is *Generalizations of the Matching Polynomial to the Multivariate Independence Polynomial*, Algebraic Combinatorics 2(5) (2019), 781–802, DOI 10.5802/alco.63; the relevant multiaffine-part argument is in the proof of Theorem 3.1, p. 788.

The parent's regular, semiregular and abelian permutation-group dominance deduction was also checked in `research/minc/abelian-dominance.md`; no mathematical gap was found. The Grone–Pierce primary abstract explicitly states the required complex correlation-matrix bound. Allen Herman's 2007 manuscript (*A Maximal Eigenvalue Conjecture Equivalent to Permanental Dominance*, author upload at https://www.researchgate.net/publication/240903668_A_Maximal_Eigenvalue_Conjecture_Equivalent_to_Permanental_Dominance) does not establish those cases: its cyclic example only separates characters within one subgroup. Priority remains unverified because the full Grone–Pierce paper's corollaries have not been inspected.

A tempting strong-Gyires descent is false even in order three. For `A=(ones-I)/2`, `per(A)=1/4`, `per(AA^T)=1/4`, and hence `R(A)=per(A)^2/per(AA^T)=1/4`. Averaging any two rows gives `B`, with `per(B)=1/4`, `per(BB^T)=15/64` and `R(B)=4/15>1/4`. Here A commutes with the averaging matrix, so the same example covers column averaging. Therefore even the normalized Gram ratio is not monotone under ordinary pair averaging. This is an obstruction to a proof method, not a counterexample to Gyires.

A November 2026 primary source relevant to entropy methods is Suvrit Sra, *A new proof of van der Waerden's inequality, and beyond*, https://hexagonmath.org/pdf/2611.00118v1 (first public release 31 October 2026). Theorem 2.1 proves monotonicity under pair averaging for minimum total correlation of a permutation law with prescribed marginals, not for the permanent. Corollary 5.3 gives a quadratic permanent remainder with coefficient `(n-2)! minentry(A)^(n-2)/2`. This vanishes for zero-diagonal inputs and does not supply a uniform Frobenius ball.

The scanned Wanless paper https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf was sought for its exact order-22 Holens–Djokovic counterexample (Figure 1, PDF page index 4), to test structured failures against Lih–Wang and Gyires. Text extraction was inadequate, web screenshots returned only a textual image marker, and Pyroam persistent downloads failed at connector level. No matrix was reconstructed or evaluated from the unreadable scan.

## A reduction for the centered coefficient question

For each fixed k, maximization of `|sigma_k(X)|` over real zero-margin matrices with a fixed Frobenius norm reduces to symmetric positive semidefinite zero-margin matrices. Let `X=U S V^T` be a singular value decomposition on the orthogonal complement of the all-ones vector. In the symmetric-tensor representation, `sigma_k(X)=<v,X^(tensor k)v>`, where v is the sum of squarefree k-tensors. Cauchy–Schwarz after inserting `S^(tensor k/2)` gives

`|sigma_k(X)|^2 <= sigma_k(U S U^T) sigma_k(V S V^T)`.

Both matrices on the right have zero margins and the same Frobenius norm as X. The tensor normalization is the same on both sides and cancels. This reduces the proposed coefficient bound to a positive semidefinite optimization problem; it does not establish the bound.

## Further full-target investigation

Problem 17, the characteristic polynomial of a general permanental compound, was examined after the PSW review. The exact symmetric-power and Ryser/subset-transform representations do not presently yield a faster unrestricted algorithm. The growing-degree hypothesis in recent near-linear multivariate multipoint-evaluation results does not directly cover the multilinear transform needed here. Full details, sources, and the multiplicativity obstruction are in `compound_charpoly_obstruction.md`. No resolution is claimed.

The independent PSW review is in `psw_review.md`. It includes the repaired repeated-row reduction, the Laguerre logarithmic-derivative crossing argument, the threshold equality case, and a separate uniqueness deduction from van der Waerden's equality case. This resolves the full named Pula–Song–Wanless subsidiary conjecture if the reviewed proof and priority audit stand, but does not resolve the entire Minc Problem 14 or 15. The independent review was posted on GitHub issue 142.

The stable-polynomial route to Lih–Wang is documented in `lihw_stability_obstruction.md`: the interpolation permanent need not be real rooted, and the desired upper bound does not follow from a capacity lower bound. The stronger coefficientwise chord inequality is already false for the uniform zero-diagonal matrix of order three.

## Entropy and radial obstructions

Sra's minimum-total-correlation functional `I(P)=S(P)-H_perm(P)` gives the exact variational identity

`log per A = max_(Q doubly stochastic) {-I(Q)-D(Q||A)}`,

where `D(Q||A)=sum_ij q_ij log(q_ij/a_ij)` and distributions outside the support of A have infinite divergence. This follows directly from the Gibbs variational principle. Strong Gyires compares this infimal convolution at A and at `AA^T`; pair-averaging monotonicity of I does not itself supply the required comparison under matrix composition. The stable-pairing results in Section 6 of Sra's paper are lower bounds on Fischer pairings, whereas Gyires needs an upper bound relative to the central coefficient.

The normalized multinomial formulation is exact: if `p_alpha` are the coefficients of `product_i sum_j a_ij x_j`, `d=n!/n^n`, and `pi_alpha=d/alpha!`, then `per(AA^T)=d E_pi[(p/pi)^2]` and `per A=d (p/pi)(1,...,1)`. Strong Gyires requires the latter likelihood-ratio value to dominate its L2 norm. The pointwise repeated-column shortcut was already disproved above.

Radial ratio monotonicity also fails exactly. With normalized `J_3`, put `A_t=J_3-(t/2)(I-J_3)`, `0<=t<=1`. Then

`per(A_t)/d_3 = 1+3t^2/8-t^3/4`,

`per(A_t A_t^T)/d_3 = 1+3t^4/32+t^6/32`.

The first expression has derivative zero at t=1, whereas the second has derivative 9/16. Therefore the derivative at t=1 of `per(A_t)^2/per(A_t A_t^T)` is negative. This is not a counterexample to Gyires; it excludes another proposed monotonicity proof.

Finally, I is not concave even on the zero-diagonal face. An exact Gibbs/covariance witness is documented in `entropy_nonconcavity.md` and reproduced by `entropy_nonconcavity.py`. The sign-matrix worker separately gave an exact failure of simultaneous transposition-conjugation entropy monotonicity. Neither is a full-conjecture counterexample.
