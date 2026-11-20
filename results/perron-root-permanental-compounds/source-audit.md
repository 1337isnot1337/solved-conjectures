# Perron root of permanental compounds: prior-art audit

Audit date: 20 November 2026. This file concerns Minc Problem 18, not the characteristic-polynomial problem and not a finite-dimensional case. It records what was found, rather than claiming that a web search can prove absence of prior work. The mathematical proof is maintained separately in [proof.md](proof.md).

## Conclusion at this checkpoint

I found no existing algorithm with the candidate theorem's full scope: a fully polynomial randomized approximation scheme for `rho(P_k(A))`, uniformly in `k`, for every nonnegative rational square matrix `A`, including nonsymmetric matrices with zero diagonal and arbitrary reducibility or periodicity.

The current problem page explicitly marks the problem open and records schemes only for positive-diagonal matrices and symmetric or diagonally symmetrizable matrices. The strongest additional overlap found is an older trace formula for zeon powers. That formula must be credited. It does not supply a uniform comparison between the sum of traces of powered compounds and their largest Perron root.

This supports treating the full-domain theorem as a candidate new approximation result, subject to checking its proof. It does not certify priority, peer review, or an exact polynomial-time solution of the unqualified historical question.

## Exact problem and nearest reported progress

[Lavi's current Problem 18 page](https://yair-lavi.com/mincs-list/problem-18/index.html) was opened directly on the audit date. It defines `P_k(A)` as the matrix of all `k` by `k` subpermanents, of order `binomial(n,k)`. It describes approximation as a natural goal because the degree-`n` case is the ordinary permanent.

Its reported approximation schemes assume either a positive diagonal or symmetry/diagonal symmetrizability. Other stated results are a polynomial-time zero-root criterion through directed cycle packings, reductions for bounded rank and block-constant matrices, an exact approximation procedure in degree two, and log-concavity of the compound Perron roots. These latter ingredients are prior work and must not be counted as new results of this investigation.

[Cheon and Wanless's 2005 survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), pp. 337–338, records no progress on Problems 17 and 18. This is a historical checkpoint, not sufficient evidence about current status by itself. The survey's DOI is [10.1016/j.laa.2005.02.030](https://doi.org/10.1016/j.laa.2005.02.030).

The original 1986 item is H. Minc, *Research problems: permanental compounds*, Linear and Multilinear Algebra 19 (1986), 199–201. The bibliographic record is repeated in both sources above. Its full text was not obtained in this audit; no unverified DOI is supplied here.

## Sources with genuine mathematical overlap

| Source | What it contains | What it does not establish |
| --- | --- | --- |
| [Minc, 1987, Permanental compounds and permanents of (0,1)-circulants](https://www.sciencedirect.com/science/article/pii/0024379587902850), [DOI](https://doi.org/10.1016/0024-3795(87)90285-0) | Companion-matrix compounds; convertible companion matrices; characteristic polynomials and asymptotic roots for specified circulant types. The publisher abstract was inspected. | A scheme for arbitrary nonnegative input matrices. Full-text access was not obtained. |
| [Al'pina and Al'pin, 2004/2006](https://www.mathnet.ru/eng/znsl814), [DOI](https://doi.org/10.1007/s10958-005-0483-6) | Comparisons with ordinary compounds, substochasticity, equality conditions, and eigenvalue-product/root-product estimates. The [12-page original](https://www.mathnet.ru/links/158926c2d813cbe9180a4ef35f2b4344/znsl814.pdf) was opened; extracted Russian text has encoding defects. | No general approximation scheme was found. The scope assessment also agrees with the English abstract and Lavi's summary. |
| [Feinsilver, Zeon Algebra, Fock Space, and Markov Chains](https://arxiv.org/pdf/0711.1680), arXiv 2007; Communications on Stochastic Analysis 2 (2008), 263–275 | Degree-two trace and integration-by-parts identities, substochastic bounds, and an ergodicity criterion involving `det(I-A^(vee 2))`. The full 18-page paper was inspected. It explicitly warns that the zeon-power operation is not multiplicative. | No arbitrary-degree FPRAS. Its ergodicity criterion is not an efficient numerical algorithm for every compound Perron root. |
| [Feinsilver and McSorley, Zeons, Permanents, the Johnson Scheme, and Generalized Derangements](https://arxiv.org/pdf/1710.00788), International Journal of Combinatorics 2011, article 539030, [DOI](https://doi.org/10.1155/2011/539030) | Theorem 2.2 gives `per(sI+tX) = sum_j s^(n-j)t^j tr(X^(vee j))`. Here the `j`th zeon power is exactly `P_j(X)`. There are also explicit formulas for `sI+tJ`, association schemes, and derangements. The complete paper was opened and the trace theorem checked. | This is the one-step identity. It is not a uniform-in-time lower bound for `sum_j tr(P_j(A)^t)`, and the inspected paper contains no approximation algorithm. |
| [Pate, On permanental compounds](https://www.sciencedirect.com/science/article/pii/S0024379507002273), [DOI](https://doi.org/10.1016/j.laa.2007.05.019) | A different matrix with entries `per(A[I,J]) per(A[I^c,J^c])`, extending Bapat–Sunder-type spectral conjectures. | Its weighted compound is not `P_k(A)`. Its PSD inequalities are not a general nonnegative Perron-root approximation scheme. |
| [Akian, Gaubert and Marchesini, Tropical bounds for eigenvalues of matrices](https://doi.org/10.1016/j.laa.2013.12.021), 2014 | Tropical spectral bounds, cited by the current problem page as upper bounds applicable to permanental compounds. | A bound does not by itself imply a fully polynomial relative approximation. No such result was found. |

The date distinction in the Feinsilver–McSorley citation matters: the paper was published in 2011 but uploaded to arXiv in 2017. The trace identity should not be described as a 2017 discovery or as new here.

## Stable-polynomial and algorithmic ingredients

The candidate construction uses established machinery. Its proposed novelty is the reduction combining that machinery, not a new permanent approximation oracle or a new stability-preservation theorem.

- [Jerrum, Sinclair and Vigoda](https://eccc.weizmann.ac.il/eccc-reports/2000/TR00-079/index.html), [published DOI](https://doi.org/10.1145/1008731.1008738), supplies the nonnegative permanent FPRAS. It is an ingredient and includes the degree-`n` case of Problem 18.
- [Gurvits and Leake, Counting matchings via capacity-preserving operators](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/counting-matchings-via-capacitypreserving-operators/9CF63D280E8003E749CEE81A9C2859C7), published online 2021, gives general capacity-preservation bounds for real stability preservers. The complete 32-page [arXiv v5 manuscript](https://arxiv.org/pdf/1804.04351), last revised 16 October 2020, was checked in a second independent audit. Theorems 4.11–4.12 concern the capacity change under a linear operator in terms of its symbol capacity. Section 3 treats derivative bounds, biregular matching counts and differential convolution. No trace, spectral-radius or compound FPRAS theorem was found. These results supply related classical machinery, rather than the specific Perron-root reduction here.
- [Leake and Ryder](https://numdam.org/item/10.5802/alco.63.pdf) records standard stability-preserving operations, relevant to multiaffine truncation. The candidate proof gives an independent verification of the specific operation it needs.
- [Chen, Guo, Vigoda and Yang, An O-tilde(n^3)-time FPRAS for the Permanent](https://arxiv.org/abs/2609.20717), v2 dated 16 October 2026, improves permanent approximation time. The primary arXiv abstract was checked. It concerns the ordinary permanent and is an optional stronger oracle, not a prior solution of the compound problem.

The search for general spectral-radius results for stability-preserving linear operators returned control-theory uses of the word stable, Lorentzian Hessian Perron–Frobenius arguments, and capacity-preserving operator results. None of the inspected sources states the full candidate theorem. Those searches are not a substitute for the specific compound and zeon searches.

## Recent zeon literature checked

[Hassan and Staples, Bipartite Matchings, Matrix Permanents, and Zeon Power Series](https://arxiv.org/pdf/2611.14802), arXiv:2611.14802, appeared in November 2026. Its full paper treats recursively defined zeon sequences, structured bipartite graph permanents, and formal Omega-exponentials. Text searches in the current PDF returned no occurrences of spectral, approximation, or compound. Its objects and aims do not overlap with the full Perron-root approximation theorem.

[Staples, A Spectral Theorem for Zeon Matrices](https://arxiv.org/abs/2201.09321), with a 2026 journal version, studies matrices whose entries belong to the zeon algebra and their spectrally simple eigenvalues. These are not scalar permanental compound matrices. The similar terminology is a false-positive risk in literature searches.

## Search record

Searches used both available web engines, with the stronger engine for current-status and exclusion checks. Results were followed to primary publisher pages, arXiv papers, author pages, or institutional repositories when possible. Secondary indexes were used as leads, not as proof of a mathematical claim.

Principal query families included:

1. `permanental compound` with `algorithm`, `approximation`, `approximation scheme`, `randomized`, `polynomial-time`, `Perron`, `spectral radius`, and `2026`.
2. `permanental compounds` with `trace`, `log-concavity`, `capacity`, and `stable`.
3. `zeon power`, `zeon` with `FPRAS`, `Perron`, `spectral radius`, `algorithm`, `transfer matrix`, and `entropy`.
4. `non-reflexive symmetric` with `Perron`; `boson` or `exclusion` with `permanental compound`.
5. `spectral radius` with `real stable`; `Perron` with `Lorentzian` or `stability preserving`; `stable polynomial` with `trace`, `capacity`, or `transfer matrix`.
6. Site-restricted searches on arXiv, GitHub, Hexagon, and the requested repository; exact problem-number and original-title searches.

The current [MColbrook/AIM catalog](https://github.com/MColbrook/AIM/blob/main/CATALOG.md) appeared in repository searches. Its full searchable text had no occurrence of `permanental compound`. GitHub and Hexagon searches yielded no additional full-domain approximation result. Search indexing is incomplete, so this is bounded evidence, not a claim to have inspected every repository or every submitted manuscript.

## Claims that the final proof should keep separate

1. The old one-step trace formula is known and credited.
2. Log-concavity and zero detection are already reported by Lavi; reproving them makes the manuscript self-contained but does not make them new.
3. The proposed contribution is the bound uniform in the power, its combination with a fugacity parameter, and the resulting FPRAS on the entire rational nonnegative domain.
4. The approximation theorem does not solve the exact characteristic-polynomial problem.
5. The historical phrase “find an algorithm” does not itself specify complexity or numerical accuracy. Any resolution claim should state explicitly that it is the fully polynomial randomized approximation formulation identified by the current problem page.


