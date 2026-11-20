# Perron root of permanental compounds

Independent review of the parent agent’s proposed general approximation theorem, 2026-11-20. This is a review record, not an independent priority claim. The proposal gives an FPRAS for every nonnegative rational matrix and every compound order. It does not give an exact polynomial-time algorithm.

## Mathematical checks

Let `P_j(A)[R,S] = per A[R,S]` and `rho_j = rho(P_j(A))`, with `P_0=[1]`. On multiaffine polynomials in `x`, define `T_A f = MAP_x f(Aᵀx)`. On the degree-`j` squarefree monomial basis this acts by `P_j(A)`.

The multiaffine-part operator preserves real stability. A bounded-degree symbol for its action on variables of maximum degrees `lambda_i` is

`product_i z_i^(lambda_i−1) (z_i + lambda_i x_i)`.

It is stable. Additional `y` variables remain untouched. Nonnegative linear substitution also preserves stability; zero columns are covered by real specialization and a limit. These facts give stability of

`G_t(x,y) = T_A^t product_i (x_i+y_i)`.

The monomial `product_i y_i` survives, so this polynomial is not zero. It is homogeneous of total degree `n` and has nonnegative coefficients.

The diagonal restriction `p_t(x)=G_t(x,x)` is therefore a nonzero homogeneous stable polynomial of degree `n` in `n` variables. Expanding gives

`p_t(x) / product_i x_i = sum_j sum_{R,S} (P_j(A)^t)[R,S] x_R/x_S`.

For each `j`, this is the sum of the entries of a positive-diagonal similarity of `P_j(A)^t`. The sum of the entries of a nonnegative matrix dominates its spectral radius. Consequently `Cap(p_t) >= max_j rho_j^t`.

The coefficient of `x_1...x_n` in `p_t` is exactly

`Z_t = sum_j tr(P_j(A)^t)`.

The homogeneous stable-polynomial coefficient bound gives

`d_n max_j rho_j^t <= Z_t <= 2^n max_j rho_j^t`, where `d_n=n!/n^n`.

The upper bound follows from `tr(B^t) <= dimension(B) rho(B)^t` for a nonnegative matrix `B`: its trace is nonnegative, and the absolute value of the sum of its eigenvalue powers is at most that bound. Summing the binomial dimensions gives `2^n`. This avoids any irreducibility, aperiodicity, spectral-gap, or diagonal-positivity assumption.

## Log-concavity and zero-root cases

`T_A^t product_i(1+x_i)`, evaluated with all `x_i=z`, is a real-rooted polynomial with nonnegative coefficients. Its coefficient of `z^j` is the sum of the entries of `P_j(A)^t`. Newton’s inequality and passage to `t`th roots show `rho_j² >= rho_{j−1}rho_{j+1}`. The limit of the `t`th root of the sum of entries is the spectral radius, including zero spectral radius. This log-concavity was already recorded on Lavi’s Problem 18 page before the present work.

The same page records that the positive `rho_j` form the prefix `0<=j<=d`, where `d` is the maximum number of vertices covered by vertex-disjoint directed cycles in the support graph of `A`. This criterion has a polynomial-time implementation: choose a maximum-weight permutation after adding identity edges, giving each edge available in `A` weight one and each identity-only edge weight zero. The maximum weight is `d`. Loops in `A` correctly receive weight one.

An independent reason for the converse direction is that a directed cycle in the compound support provides an integral circulation in the original graph with vertex capacities after averaging over the compound cycle. The assignment polytope is integral, so some disjoint cycle packing covers at least as many vertices. The forward direction follows by applying a supported permutation on `d` vertices to its `j`-element subsets.

## Polynomial-size fugacity grid

Suppose `rho_k>0`. Put `b=min(1,min positive a_ij)` and `B=max(1,max a_ij)`. Every positive `rho_j` satisfies

`b^n <= rho_j <= n! B^n`.

For the lower bound, a positive cycle in `P_j(A)` has each edge at least `b^j`; its geometric mean is a lower bound for the spectral radius. For the upper bound, use the maximum row sum and bound each permanent by `j! B^j`.

The logarithms of all positive `rho_j` lie in an interval of width

`W = log(n!) + n log B − n log b`.

This width is polynomial in the binary input length. An integer upper bound can be chosen without evaluating any logarithms: if each positive input entry lies between `2^(−L)` and `2^L`, then `n²+2nL` suffices.

By log-concavity, a supporting slope at `k` supplies a fugacity `s*` such that

`max_j rho_j (s*)^(j−k) = rho_k`, with `|log s*|<=W`.

This remains true at the end of the positive prefix: a sufficiently large finite `s*<=exp(W)` suppresses all lower degrees. The case `k=0` can simply return one.

Use rational fugacities `s_l=(1+eta)^l`, where `eta` is a rational number of size `Theta(epsilon/n)` and `|l|<=ceil(2W/eta)+1`. The logarithmic spacing is at most `eta`, and the range covers `[-W,W]`. The envelope `log max_j rho_j s^(j−k)` is `n`-Lipschitz in `log s`. Hence some grid point approximates the envelope minimum within `exp(O(epsilon))`. The number of grid points and the bit lengths of their rational values are polynomial in the input size and `epsilon^(−1)`.

At each grid point compute an approximate permanent for the `nt × nt` block matrix with identity diagonal blocks and forward cyclic blocks `s_l A`. For `t>=2`, these positions do not overlap. Its permanent equals

`Z_t(s_l) = sum_j tr(P_j(A)^t) s_l^(jt)`.

The identity follows by recording the active subset at each time slice. Each perfect matching has the same number `j` of forward edges at every slice; fixing the active subsets contributes the product of the relevant `j`th compound entries. Closing the time cycle produces the trace.

With `t=Theta(n/epsilon)`, the lower factor `d_n^(1/t)` and upper factor `2^(n/t)` are both `exp(O(epsilon))` from one. A constant-relative-accuracy permanent FPRAS at each grid point is enough after taking the `t`th root. A union bound allocates failure probability over the polynomial-size grid. Taking the minimum of the successful estimates of `Z_t(s_l)^(1/t)/s_l^k` therefore gives the required relative approximation to `rho_k`. Rational approximations of the roots can be computed with polynomial bit complexity.

## Review conclusion

No mathematical obstruction was found in the stability, capacity, trace, zero-root, or grid steps. The parent manuscript must still specify constants for the final relative-error guarantee and cite the weighted nonnegative permanent FPRAS precisely. The distinction between a general approximation algorithm and an exact algorithm must remain explicit.

## Primary sources checked

- Target and earlier partial results: https://yair-lavi.com/mincs-list/problem-18/index.html .
- Multiaffine truncation and stability: J. Leake and N. Ryder, *Generalizations of the Matching Polynomial to the Multivariate Independence Polynomial*, Algebraic Combinatorics 2 (2019), https://alco.centre-mersenne.org/article/ALCO_2019__2_5_781_0.pdf .
- Explicit symbol computation: J. Leake, *Applications of Stable Polynomials*, 2020 lecture slides, https://www.jleake.com/teaching/2020/stable_applications_slides.pdf .
- Stable-polynomial coefficient bound: L. Gurvits, as restated with proof in Y. Lavi, https://arxiv.org/html/2609.29262v1 , Proposition 2.1.

An independent targeted search of the phrases “permanental compound approximation spectral radius”, “Perron root permanental algorithm”, “permanental compounds FPRAS”, and “permanental compounds trace stability” found the listed special-class FPRAS but no earlier all-matrix FPRAS. A negative search is not a proof of novelty.

## Final manuscript review

Read the full parent draft `research/minc/compound_fpras.md` after its explicit constants and grid were added. The choices `t=Q=ceil(16n/epsilon)`, `H=n(L+n+1)`, and `J=ceil(4HQ)` give the stated polynomial grid. The lower exponent is at least `−epsilon/8`; the upper exponent is at most `3epsilon/16`. Allowing `epsilon/16` for rational root approximation gives `exp(−3epsilon/16)` and `exp(epsilon/4)`, both inside the requested relative-error interval for `0<epsilon<1`. The argument includes `n=1`, zero entries, reducible supports, and periodic supports.

Two minor repairs were sent to the parent: obtain the initial positive prefix from full Newton interpolation or the cycle-packing criterion, since adjacent log-concavity alone does not rule out internal zero blocks; and return zero if an oracle gives a nonpositive estimate, so the root approximation step remains defined even on a failed-oracle event. These repairs do not change the successful-event proof.

The Leake–Ryder citation is verified: Jonathan D. Leake and Nick R. Ryder, Algebraic Combinatorics 2(5) (2019), 781–802, DOI 10.5802/alco.63. The MAP assertion is in the proof of Theorem 3.1 on printed page 788, immediately before Corollary 3.2. Full PDF successfully retrieved at https://www.numdam.org/article/ALCO_2019__2_5_781_0.pdf .

