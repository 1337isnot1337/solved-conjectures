# Boundary monotonicity: source audit and a blocked reduction

Research date: 2026-11-20. No solution of Minc Problem 8 or Problem 11 is claimed.

## Exact scope and exclusions

Problem 8 asks for a description of the boundary matrices A in the doubly stochastic polytope for which

q_A(t) = per((1-t)J_n+tA)

is increasing on [0,1]. The current source already covers all row- or column-transitive group actions, hence all circulants and all finite-group matrices. It also reports nonmonotone boundary matrices in every order n>=9. An additional order or a single positive family would not settle this classification problem.

Source: https://yair-lavi.com/mincs-list/problem-8/index.html , refreshed 2026-11-20.

Problem 11 asks for all pairs (n,k) for which the minimum permanent of a k-regular zero-one matrix is strictly below every circulant. The current source already covers all sufficiently large orders at each fixed k>=3, the regime k^3 log(n)=o(n), and dense complements k=n-r for n>=16r^3. It also classifies k=n-2 and the four trivial degree lines. Another finite pair is not a solution of the full question.

Source: https://yair-lavi.com/mincs-list/problem-11/index.html , refreshed 2026-11-20.

## Bernstein coefficients of the radial permanent

Write sigma_k(A) for the sum of all k-by-k permanental minors, with sigma_0(A)=1. Expansion according to entries selected from A gives

q_A(t) = sum_{k=0}^n ((n-k)!/n^(n-k)) sigma_k(A) t^k (1-t)^(n-k).

Define

a_k = n^k sigma_k(A) / (k! binom(n,k)^2).

Then

q_A(t) = (n!/n^n) sum_{k=0}^n binom(n,k) a_k t^k (1-t)^(n-k),

and

q_A'(t) = (n n!/n^n) sum_{k=0}^{n-1} binom(n-1,k) (a_(k+1)-a_k) t^k (1-t)^(n-1-k).

The inequalities a_(k+1)>=a_k are precisely the Holens-Dokovic inequalities. They suffice for radial monotonicity, but nonnegativity of a Bernstein polynomial does not require each coefficient to be nonnegative. Thus this identity is not a characterization by coefficient signs.

The first coefficients obey a_0=a_1=1 and

a_2 = 1 + (||A||_F^2-1)/(n-1)^2 >= 1.

At the endpoint,

q_A'(1) = n per(A)-sigma_(n-1)(A)/n.

Therefore sigma_(n-1)(A)<=n^2 per(A) is necessary. It is not justified to promote that single necessary condition to sufficiency.

## Published obstruction to a unimodality argument

Wanless's 1999 paper explicitly exhibits a regular matrix for which the top Holens-Dokovic inequality holds and the preceding one fails. The graph is the disjoint union of four copies of the Jerrum graph G_(3,7), and the resulting matrix has order 256 and line sum 3. This is Example 3, printed page 284.

Source: I. M. Wanless, *The Holens-Dokovic conjecture on permanents fails!*, Linear Algebra and its Applications 286 (1999), 273-285. https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf ; DOI 10.1016/S0024-3795(98)10177-5.

This excludes a proposed argument that the normalized coefficients a_k increase and then decrease at most once, or that failure at a lower order forces failure at the top. It does not by itself disprove the possible sufficiency of the endpoint condition for q_A'(t)>=0, because Bernstein averaging can hide negative coefficients. No proof or counterexample to that stronger endpoint criterion was obtained here.

## Other already-known routes

Goldwasser proved closure under direct sums when every subpermanent sum is radially monotone for each summand: *Monotonicity of permanents of direct sums of doubly stochastic matrices*, Linear and Multilinear Algebra 33 (1993), 185-188, DOI 10.1080/03081089308818193. In particular, combining that result with current circulant results is prior-art deduction, not a fresh classification.

The Kopotun transform is also not an open target: Lavi's October 2026 paper establishes its subpermanent inequality in every order. Source: https://hexagonmath.org/pdf/2611.00201v1 . The Wang transform is already marked proved on https://yair-lavi.com/mincs-list/conjecture-4/index.html . Neither transform inequality implies monotonicity along the entire boundary segment.

## Status

No full structural characterization was found. Exact boundary differentiation and the Bernstein formula are useful reductions, not resolved Minc entries. No additional finite search was used to inflate the count.
