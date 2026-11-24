# Review of low extraneous radical-degree jet extraction

Internal written review by the alternate-PH agent, 23 November 2026. I read RADICAL_COFACTOR_JETS.md in full and found no mathematical gap in its extraction argument. This is not formal verification or external peer review.

Each extraneous irreducible q_i divides the supplied P, so the cited approximate-factor theorem gives its border circuit bound in terms of deg(q_i) and L(P). Summing the bounds gives at most a constant times (L(P)+1) delta^10, since delta is the sum of the factor degrees. Simultaneous approximation is legitimate: finitely many factor approximants can be chosen at once and their circuits combined without a larger asymptotic bound.

At P(b) nonzero, every normalized factor is a unit with constant term one. The logarithmic identity and its exponential inverse hold in the finite nilpotent Taylor quotient. The multiplicities are scalar constants, so their magnitudes do not enter the arithmetic gate count. The empty extraneous product is handled correctly.

The border-limit argument does not assume that approximants preserve their constant terms or divisibility. The truncated logarithm and exponential are fixed polynomial maps on finite jets. At the limiting jets their positive-order hypotheses hold, so the polynomial-map outputs converge to the desired Taylor polynomial. Moving generic centers then extends the same border bound to arbitrary centers, including zeros of P.

The resultant application correctly extracts the jet in the full coefficient space before applying the affine BCJS grid map. This prevents an extraneous cofactor vanishing identically on the grid from invalidating the argument. Polynomial factors in N can be absorbed into the imported exp(Omega((log N)^(4/3))) lower bound. The conclusion constrains the squarefree extraneous degree, not merely multiplicity or total cofactor degree.

I also inspected the author-hosted Dutta–Saxena–Sinhababu manuscript. Its Theorem 1 states a bound for factors of u_1 when f=u_0 u_1 and circuits for both f and u_0 are supplied, in terms of those sizes and deg(rad(u_1)). Taking u_0=1 includes the entire radical of P, hence includes the exponentially high-degree resultant. The note's distinction from that direct application is correct.

For notation, the symbol P_N used for the arbitrary multiple should be kept distinct from the pre-existing P_N^grid notation for the grid resultant. The prose identifies the intended jet, but an explicit notation reminder or a renamed grid symbol would prevent confusion. No mathematical change is required.
