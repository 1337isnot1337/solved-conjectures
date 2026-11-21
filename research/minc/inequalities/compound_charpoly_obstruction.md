# Permanental-compound characteristic polynomial: current obstruction

Research checkpoint: 2026-11-21. No new algorithmic resolution is claimed.

## The full target and prior results

Minc's Problem 17 asks for an algorithm for the characteristic polynomial of the kth permanental compound of an arbitrary square matrix. For an n-by-n matrix A, this compound has size `N=binom(n,k)` and entry `per A[I,J]` at two k-subsets I,J. The intended question seeks something better than explicitly forming the compound and applying a general characteristic-polynomial algorithm.

The current problem page is <https://yair-lavi.com/mincs-list/problem-17/index.html>. It records a faster exact algorithm for k=2, bounded-rank methods for every k, and block-constant reductions. Those are existing results and do not resolve the unrestricted target. The older survey by Cheon and Wanless records no progress: <https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf>. Minc's special companion-matrix result is *Permanental compounds and permanents of (0,1)-circulants*, Linear Algebra and its Applications 86 (1987), 11–42, DOI <https://doi.org/10.1016/0024-3795(87)90285-0>.

## Exact operator representation

For a homogeneous multiaffine degree-k polynomial

`f(y)=sum_{|J|=k} v_J product_{j in J} y_j`,

the coefficient vector of the multiaffine part of `f(A^T x)` is `P_k(A)v`. Thus a fast exact compound matrix-vector product is a natural first step.

The full degree-k symmetric-power space has dimension

`M=binom(n+k-1,k)`.

An arbitrary linear substitution can be factored into elementary linear substitutions. Acting on all M monomial coefficients costs `poly(n,k) M` arithmetic operations; projecting at the end produces the desired compound product. This is exact but does not by itself give a uniformly faster characteristic-polynomial algorithm. Even an optimistic N-product Krylov calculation costs about `NM` before polynomial factors and multiplicity handling. At k near n/2,

`N=2^(n+o(n)), M=(3 sqrt(3)/2)^(n+o(n)), NM=(3 sqrt(3))^(n+o(n))`.

This does not uniformly beat the generic fast-linear-algebra exponent. The discrepancy becomes larger above the middle range. A black-box minimal-polynomial calculation also needs a separate argument to recover every characteristic-polynomial multiplicity; generic cyclicity cannot simply be assumed for every input.

For a triangular substitution, intermediate variables can be eliminated in an order that keeps at most n active squarefree variables. This gives a much smaller state space. It cannot be used factor by factor in an LU decomposition, because multiaffine projection between factors destroys terms that can later contribute. The smallest exact warning is

`L=[[1,0],[1,1]], U=[[1,1],[0,1]]`.

Then `per(LU)=3`, whereas `per(L)per(U)=1`. Thus `P_2(LU) != P_2(L)P_2(U)`.

## A Ryser and subset-transform factorization

For each subset S of size at most k define

`w_S=sum_{J superset S, |J|=k} v_J`,

`b_i(S)=sum_{j in S} a_ij`.

Ryser's identity, followed by interchange of finite sums, gives the exact formula

`(P_k(A)v)_I = sum_{|S|<=k} (-1)^(k-|S|) w_S product_{i in I} b_i(S)`.

The first transform, v to w, is an ordinary subset zeta transform. The remaining matrix has entries `product_{i in I} b_i(S)`: it is the transpose of an evaluation matrix for squarefree degree-k monomials at the points `A 1_S`.

This exposes the missing step rather than removing it. The points are a linear image of a Boolean grid. After a generic linear map they no longer form a Cartesian grid, so the usual Yates transform does not apply. Replacing the multiplication by an unrestricted multilinear multipoint-evaluation oracle is not an algorithm until that oracle's complexity is justified.

## Why recent near-linear multipoint evaluation does not directly close this route

Bhargava, Ghosh, Guo, Kumar and Umans, *Fast Multivariate Multipoint Evaluation over All Finite Fields*, Journal of the ACM 71(3) (2024), article 22, DOI <https://doi.org/10.1145/3652025>, give a deterministic bit algorithm with complexity

`(d^m+R)^(1+o(1)) poly(m,d,log|F|)`

for m variables of individual degree less than d and R evaluation points. The primary preprint is <https://eccc.weizmann.ac.il/report/2022/063/download>. The remark directly after Theorem 1.1 explicitly says that sufficiently large d means `d=omega(1)`.

Our immediate evaluation problem has fixed individual-degree bound d=2 and a growing number of variables. Consequently the theorem cannot be substituted with d=2 without further argument. Padding to a growing d replaces the 2^n coefficient budget by d^n. Ordinary Kronecker grouping also does not preserve evaluation at arbitrary tuples: different coordinates in a group are not powers of a single scalar.

The 2025 paper by Fischer, Kallmayer and Wennmann, *A Simple Algorithm for Trimmed Multipoint Evaluation*, DOI <https://doi.org/10.4230/LIPIcs.ESA.2025.89>, gives a clean near-linear algorithm on downward-closed subsets of Cartesian grids. Its grid hypothesis likewise does not directly cover `A 1_S` for arbitrary A.

## Trace identities

The zeon trace identity `per(I+tA)=sum_k t^k tr(P_k(A))` is known; see Feinsilver and McSorley, *Zeons, Permanents, the Johnson Scheme, and Generalized Derangements* (2011), DOI <https://doi.org/10.1155/2011/539030>. It gives the first power traces across all degrees. It does not give the higher power traces of one compound by replacing A with A^r: permanental compounds are not multiplicative. Time-cyclic block-permanent encodings do express those higher traces, but the block size grows with the power, so no faster exact characteristic-polynomial method follows here.

## Remaining task

A useful unrestricted advance would require a faster compound multiplication method, a more efficient method using the higher trace identities, or another representation with a rigorously smaller total arithmetic cost. No such method has been established in this investigation. The restricted methods and formal identities above are not counted as a resolution of Problem 17.
