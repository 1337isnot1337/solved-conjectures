# Higashitani–Kummer–Michałek conjecture

**Status: both clauses refuted by an exact counterexample; awaiting external review and priority verification.** Issue #316. Discovery and computation: ChatGPT research session, 2026-11-24, at the repository owner's request. No claim of exclusive authorship or first discovery.

## Statement and sources

A. Higashitani, M. Kummer and M. Michałek, [Interlacing Ehrhart Polynomials of Reflexive Polytopes](https://arxiv.org/abs/1612.07538), Selecta Math. 23 (2017), 2977–2998, DOI [10.1007/s00029-017-0350-6](https://doi.org/10.1007/s00029-017-0350-6), Conjecture 4.10 (p. 12 of arXiv v1; the published paper has the same numbering). For a complete multipartite graph with part sizes a_1 >= ... >= a_k, let E be the Ehrhart polynomial of its symmetric edge polytope. Clause (i) says every root lies on Re(z) = -1/2. Clause (ii) says the Ehrhart polynomial interlaces, along that line, the polynomial obtained by reducing a_1 by one.

M. Kölbl, [On a Conjecture Concerning the Roots of Ehrhart Polynomials of Symmetric Edge Polytopes from Complete Multipartite Graphs](https://arxiv.org/abs/2404.02136), 2024, and [Enumerative and algebraic invariants of lattice polytopes](https://doi.org/10.18910/101775), 2025 dissertation, Chapter 5, restate the conjecture and establish partial results. Searches on 2026-11-24 for the original authors/conjecture number, later work, counterexamples, cocktail-party graphs, and exact polynomial coefficients found no prior refutation. This is evidence of an unresolved question, not proof of novelty. In particular the example K_(3,3,1) versus K_(3,3) in the original paper removes a vertex from a **smallest**, not largest, part; it does not refute the conjecture. Our example below does remove a vertex from a largest part.

## 1. Exact lattice-point characterization

Let A_1,...,A_k partition [N], k >= 2, all nonempty. Let P be the convex hull of the vectors e_u-e_v where u,v are in different parts. For an integral vector z of coordinate sum zero, define p_i = sum of positive coordinates in A_i, q_i = sum of absolute values of negative coordinates in A_i, and p = sum p_i = sum q_i.

**Lemma.** For every nonnegative integer m,
    
    z in mP  iff  p <= m and p_i+q_i <= m for every i.

Necessity: for each edge vector the total positive mass equals one, and the l1-norm on each individual part is at most one. The corresponding convex functions are bounded by one on P and by m on mP.

Sufficiency: introduce p positive unit tokens and p negative unit tokens, attached to their coordinate indices. Form the bipartite graph connecting tokens whose coordinates belong to distinct parts. Its maximum matching has size p-h where

    h = max(0, max_i(p_i+q_i-p)).

Indeed the maximum Hall deficiency is that expression: a nonempty set of positive tokens spanning two or more parts has all p negatives as neighbors, while a subset in part i has exactly p-q_i neighbors. The largest deficiency of such a subset is p_i-(p-q_i), achieved by taking all positive tokens in that part when nonempty. For p_i=0 the expression is nonpositive anyway. The matching formula follows from Hall's theorem by adding h universal dummy negative tokens. The p-h matched pairs use one graph edge each. Pair the remaining h positive and h negative tokens arbitrarily. If they are in different parts, they use one edge; if in the same part, they use a path of length two through any other part. Each path telescopes to the required coordinate difference. Thus z is a sum of at most p+h edge vectors, and p+h = max(p,max_i(p_i+q_i)) <= m. Since 0 belongs to P, padding with zeros and averaging shows z in mP (for m=0 the inequalities force z=0). QED.

Connectedness gives dimension N-1: the edge differences of a spanning tree span the zero-sum hyperplane. Consequently E(m) is a polynomial of degree N-1 and is uniquely determined by the N evaluations m=0,...,N-1.

## 2. General counting formula

Let C_s(u,v) count s integer coordinates with positive sum u and negative absolute sum v. For s >= 1,

    C_s(u,v) = [X^u Y^v] ((1-XY)/((1-X)(1-Y)))^s.

This follows by taking the product of the one-coordinate generating function 1+X+X^2+...+Y+Y^2+.... In the complete graph only p <= m is required, because each part is a singleton. Its count is

    B_N(m) = sum_{p=0}^m C_N(p,p).

Inside that count at most one part can have p_i+q_i > m: two such parts would have total absolute mass > 2m, although the total is 2p <= 2m. Thus the violation events are disjoint and the following exact formula holds for **all** complete multipartite graphs:

    E_(a_1,...,a_k)(m) = B_N(m) - sum_i R_(N,a_i)(m),

    R_(N,a)(m) =
        sum_{p=0}^m sum_{0<=u,v<=p, u+v>m}
          C_a(u,v) C_(N-a)(p-u,p-v).

The formula is also an additive polynomial identity by interpolation; the correction for a part of size a depends only on a and N. It was used for the initial search. A separate verifier counts each admissible part directly and convolves, without using subtraction or the search routine.

## 3. Counterexample and exact polynomials

Take G=K_(2,2,2,2,2,2) and G'=K_(2,2,2,2,2,1). These have 12 and 11 vertices. For these sizes the local counts are particularly simple:

* C_1(u,v)=1 if min(u,v)=0, and 0 otherwise.
* C_2(u,v)=u+v+1 if min(u,v)=0, and 2 otherwise.

For each m, multiply the polynomials

    sum_{u,v>=0, u+v<=m} C_(a_i)(u,v) X^u Y^v

over all parts, retaining monomials with each exponent <=m. Sum the coefficients of X^p Y^p for p=0,...,m. By the lemma this gives E(m). The exact evaluation lists, starting at m=0, are:

    G:  1,121,4303,70663,697975,4811431,25393537,109149169,
        398945035,1279269867,3683468685,9693557805
    G': 1,101,3001,41741,353971,2123027,9871567,37805687,
        124348387,361953187,953233799

The corresponding h*-vectors (additional check) are

    G:  1,109,2917,26793,107892,211932,211932,107892,26793,2917,109,1
    G': 1,90,1945,14120,43540,62804,43540,14120,1945,90,1.

Define the following real polynomials with positive leading coefficients:

    f(x) = 87411*x^11 - 8333765*x^9 + 219501678*x^7
           - 1819237530*x^5 + 4596049711*x^3 - 3575490705*x,

    g(x) = 5061*x^10 - 354835*x^8 + 6387458*x^6
           - 33055190*x^4 + 50109481*x^2 - 13307175.

Their exact relation to the Ehrhart polynomials is

    f(x) = (2^11 * 11! / 8) * i^(-11) * E_G((i*x-1)/2),
    g(x) = (2^10 * 10! / 36) * i^(-10) * E_G'((i*x-1)/2).

The identities can be checked simply by substituting x=-i(2m+1) at the respective N integer arguments above. All such substitutions become integer/rational arithmetic by parity; the degree bound establishes the identities. The verifier independently reconstructs the evaluation lists by convolution and checks these identities. Thus roots on Re(z)=-1/2 correspond exactly to real roots of f or g.

## 4. Clause (i): an exact nonreal-root certificate

Write f(x)=x*h(x^2), where

    h(z) = 87411*z^5 - 8333765*z^4 + 219501678*z^3
           - 1819237530*z^2 + 4596049711*z - 3575490705.

If f has all real roots, h must have five nonnegative real roots with multiplicity. In fact h has exactly three positive real roots.

For z<=0, all six terms are nonpositive and the constant term is strictly negative. For 0<=z<=2 use four intervals [a,b] and the substitution z=(a+b*t)/(1+t). The table lists the coefficients in ascending order of (1+t)^5 h((a+b*t)/(1+t)), multiplied by a positive common denominator (the least common denominator of its coefficients):

| [a,b] | Coefficients |
|---|---|
| [0,1] | -3575490705, -13281403814, -19189945736, -13416819696, -4520297680, -587423200 |
| [1,3/2] | -18797542400, -68656805120, -96330684288, -64278483232, -20220215500, -2413066425 |
| [3/2,7/4] | -77218125600, -255612494000, -310495003856, -167247850200, -39400749562, -4253447407 |
| [7/4,2] | -4253447407, -3133724508, -22179749984, -87649900416, -100058487552, -35707972608 |

All coefficients are strictly negative. Since t>=0 parametrizes [a,b) and the leading coefficient also proves negativity at b, h has no zeros on these intervals.

For z>2, the coefficients of h(2+t) in ascending order are

    -34871067, -306567873, -695244942, 156327998, -7459655, 87411.

There are three sign changes, so Descartes' rule of signs bounds positive roots of h(2+t) by three, counting multiplicity. Signs at 8,9; 25,26; and 57,58 give a root in each of those disjoint intervals, establishing exactly three real roots of h. Hence f has seven real roots (zero and the six signed square roots) and four nonreal roots. This is a disproof of clause (i), with no floating-point step.

## 5. Clause (ii): independent exact interlacing obstruction

Even separately from the failure of clause (i), the comparison pair violates a necessary interlacing inequality. For real polynomials F,G of consecutive degrees d,d-1 and positive leading coefficients with weakly interlacing real roots,

    F'(x)G(x)-F(x)G'(x) >= 0

for every real x. In the strictly interlacing case, the rational function F/G has polynomial part of degree one with positive slope and simple-pole residues F(r)/G'(r)<0 at all roots r of G. Differentiation gives a positive function away from the poles, and multiplication by G^2 and continuity proves the inequality everywhere. The weak case follows by perturbing the ordered interlacing roots to strict interlacing and passing to the limit with leading coefficients fixed.

For the specific f,g,

    (f'g-fg')(3/2) = -63255230703736979625 / 1048576 < 0.

All coefficients and evaluations are integers or exact rationals. Thus clause (ii) also fails for a permitted pair, with G' obtained by reducing a largest part of G. The two clauses are not being counted as two separate conjectures.

## 6. Audit and reproducibility

* Original graph family, root line and decrement-largest hypothesis checked directly in Conjecture 4.10 of the original paper and its published version.
* The membership lemma proves necessity and sufficiency in the integer lattice, including the cases p=0 and m=0. The Hall argument works with multiple tokens attached to a coordinate; routing through an intermediate vertex may reuse vertices/edges, which is allowed for membership in a dilate.
* Dimension and interpolation use N points for degree N-1. Exact counting was done both with the general disjoint-violation formula and by an independent convolution of admissible local counts. The two methods agree. In the search, small cases were also cross-checked with direct reachable-vector sets and the published bipartite h*-formula from Higashitani, Jochemko, Michałek, [Arithmetic aspects of symmetric edge polytopes](https://doi.org/10.1112/S0025579319000147).
* The root certificates use rational interval transformations and Descartes' rule, not numerical approximations or an unproven CAS assertion. The Wronskian certificate checks the interlacing obstruction independently.
* Run python3 verify.py in this directory; it uses only the standard library. External mathematical review and a more exhaustive priority check are still needed before publication.
