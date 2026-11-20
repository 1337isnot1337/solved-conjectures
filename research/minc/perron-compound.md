# Perron root of permanental compounds

Historical research checkpoint, 20 November 2026. The open-path convergence obstacle recorded below is bypassed by the later [general FPRAS proof](compound_fpras.md), using a sum of traces over all degrees. This file retains the initial route and its unresolved direct-convergence bound. It does not describe the status of the later algorithm. Coordination: [issue #140](https://github.com/1337isnot1337/solved-conjectures/issues/140).

## Exact target and exclusions

For a nonnegative rational matrix A of order n and 0 <= k <= n, the kth permanental compound B=P_k(A) has rows and columns indexed by k-subsets of [n], with B[I,J]=per(A[I,J]). Minc asks for an algorithm for its Perron root. Its dimension is N=binom(n,k).

Constructing all N squared entries and applying a generic eigenvalue algorithm is an existing elementary procedure, not a research solution. The [current problem page](https://yair-lavi.com/mincs-list/problem-18/index.html) already records approximation algorithms for positive-diagonal and symmetric inputs, as well as low-rank and k=2 methods. Those special classes are not new targets here.

The route below would be useful if its missing uniform bound could be proved. The finite counting identity alone is not a solution, and no priority claim is made for that identity.

## A layered permanent identity

For an integer t >= 0 put

```math
S_t=\mathbf 1^T B^t\mathbf 1.
```

Construct a square matrix M_t of order n(t+1)+k. Its ordinary vertices are pairs (ell,i), with 0 <= ell <= t and i in [n]. There are also k extra row labels, called sources, and k extra column labels, called sinks. The extra row and column labels occupy the same final k indices of the square matrix, but they have different roles in the bipartite matching interpretation.

The nonzero entries are:

1. M_t[(ell,i),(ell,i)]=1 for each ordinary vertex.
2. M_t[(ell,i),(ell+1,j)]=a_ij for 0 <= ell < t.
3. Every source row has entry 1 in every layer-zero ordinary column.
4. Every final-layer ordinary row has entry 1 in every sink column.

All other entries are zero. Then

```math
\mathop{\mathrm{per}} M_t=(k!)^2 S_t.
```

### Proof

Consider a nonzero weighted perfect matching of M_t. Each source chooses a distinct layer-zero column. The corresponding ordinary row cannot use its identity edge, since that column is already occupied, so it must choose an edge to the next layer. Repeating this argument produces k vertex-disjoint directed paths, each crossing every layer. They end in the k sink columns. Every ordinary vertex outside those paths uses its identity edge: if a nonidentity edge started without an incoming path edge, tracing backward would eventually reach layer zero without a source, which is impossible in a perfect matching.

Write I_ell for the k vertices used in layer ell. Summing the weights of the bijections from I_ell to I_(ell+1) gives per(A[I_ell,I_(ell+1)]). Summing over the intermediate subsets and both endpoint subsets gives S_t. For any such family of paths, the k labeled sources can be matched to its initial vertices in k! ways, and the k terminal vertices to the labeled sinks in another k! ways. This proves the formula. It also proves it for t=0 and k=0, with the usual empty-permanent convention.

The identity is polynomial and therefore holds over any commutative ring. Its counting and approximation interpretation uses nonnegative weights.

`compound_paths.py` verifies 72 instances with exact integer arithmetic, including zeros, nilpotent matrices, negative entries for the polynomial identity, every k, and t in {0,1,2}. These checks supplement the proof; they do not address the missing asymptotic estimate.

## The unresolved convergence step

For each fixed nonnegative B, the elementary matrix spectral-radius formula gives

```math
\lim_{t\longrightarrow\infty}S_t^{1/t}=\rho(B).
```

For example, the sum of all entries of a nonnegative matrix is between its maximum-column-sum norm and N times that norm, so the usual norm version gives this limit. Also rho(B)^t <= S_t for every t.

The nonnegative-permanent approximation theorem of Jerrum, Sinclair and Vigoda consequently gives efficient randomized approximation of S_t for each t supplied in unary. A fully polynomial approximation algorithm for rho(P_k(A)) would additionally need a bound such as

```math
\rho(B)\le S_t^{1/t}\le (1+\varepsilon)\rho(B)
```

with t bounded by a polynomial in n, the rational input bit length, and 1/epsilon. No such general estimate is established here. The zero-root case must be identified separately.

The distinction matters. For an arbitrary N-by-N matrix B=I+U, where U has ones on its first upper diagonal, rho(B)=1. For t<N,

```math
S_t=\sum_{j=0}^{t}(N-j)\binom tj
   =N2^t-t2^{t-1}.
```

Thus generic bounds can require time depending on N, which is exponential in n in the middle compound degrees. This example is not claimed to be a permanental compound; it shows why special structure must enter the argument.

An alternative route would add delta I to A, apply the known positive-diagonal algorithm, and control the perturbation uniformly in n and k. Generic eigenvalue continuity has exponent 1/N and is insufficient. A polynomial-degree Holder estimate, with explicitly controlled constants, is still missing.

## A structure lemma that does not close the gap

Represent a vector v on k-subsets by the homogeneous multiaffine polynomial

```math
f_v(x)=\sum_{|J|=k}v_J\prod_{j\in J}x_j.
```

The vector Bv is the coefficient vector of the multiaffine part of f_v(A^T x). Nonnegative linear substitution preserves real stability, or gives the zero polynomial. Projection to degree at most one in each variable also preserves real stability, or gives zero.

For completeness, the one-variable projection follows by reversing a degree-d stable polynomial in that variable using x^d f(-1/x), taking d-1 derivatives, reversing again, and rescaling x by d. Up to a nonzero constant, the result is a_0+a_1 x. Each operation preserves stability or gives zero. Apply this successively to the variables. Zero linear forms are handled by a limit of positive substitutions.

Starting with the stable elementary symmetric polynomial e_k therefore gives stable iterates. For strictly positive A, normalized positive iterates converge to its compound Perron vector, which thus has a real stable generating polynomial. For arbitrary nonnegative A, taking a subsequential limit of normalized Perron vectors for A+delta J, delta decreasing to zero, gives at least one nonnegative Perron eigenvector with a stable generating polynomial. The nonzero limit exists by compactness of the coefficient simplex, and the eigenvector equation passes to the limit by continuity of the spectral radius. Stability passes to the nonzero limit by Hurwitz's theorem.

This is an existence statement. It does not bound the smallest positive coefficient, produce an efficient representation of the vector, or prove a convergence rate. In particular, sums of stable polynomials need not be stable, so a resolvent sum cannot simply be asserted to preserve stability.

## Sources and scope of literature checks

- H. Minc, *Research problems: permanental compounds*, Linear and Multilinear Algebra 19 (1986), 199–201. Original source identified through the surveys; its full three-page text has not been retrieved in this investigation.
- G.-S. Cheon and I. M. Wanless, [*An update on Minc's survey of open problems involving permanents*](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), Linear Algebra Appl. 403 (2005), 314–342, Problems 17–18 on printed page 338.
- Yair Lavi, [Problem 18](https://yair-lavi.com/mincs-list/problem-18/index.html), checked 20 November 2026. Its general algorithm is still marked open; its reported special cases cannot be counted as new here.
- Exact-title, compound-algorithm, approximation, irreducibility, matrix-vector and symmetric-power searches with both search engines did not locate a published general resolution. This is a search record, not proof that none exists.

The original Minc algorithmic question does not specify a formal complexity threshold in the survey's wording. Any eventual claim must state its own complexity and explain the improvement over known generic algorithms, rather than treating the mere existence of a finite procedure as a resolution.
