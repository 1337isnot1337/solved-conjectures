# Juhnke’s conjecture

**Result:** The sequence of arbitrary-step east/north lattice paths by number of steps, with the two endpoints in Juhnke's stated Conjecture 6, is log-concave and hence unimodal in every dimension. This is the lattice-path conjecture in the 2026 Oberwolfach report, not the distinct coherent-path Conjecture 5.

## Exact statement and reduction to runs

See Martina Juhnke's Problem 9, Conjecture 6 in [*Enumerative Combinatorics*, Oberwolfach Report 2/2026, pp. 149–150](https://ems.press/content/serial-article-files/53596?nt=1#page=69). The paths start at (2,1) and end at either (d−1,d) or (d,d−1), and a step may have any positive integer length in the east or north direction. The definition of N_l for Conjecture 6 does not impose diagonal avoidance or a compatibility criterion. Both restrictions are discussed in the preceding paragraph only for the different coherent-path sequence of Conjecture 5.

Let m=d−3, initially m≥1. After translating the origin, the two endpoint compositions are (m,m+2) and (m+1,m+1); the number of unit edges in either kind of path is M=2m+2. Expand every long step into its unit-edge word. An r-run word has r−1 mandatory step boundaries at changes of direction and M−r optional boundaries within runs. If R_r counts the two endpoint families' unit words with r runs together, their arbitrary-step polynomial is therefore

    P(z) = Σ_r R_r z^r(1+z)^(M−r).

The proof is to show that the run sequence is log-concave, then apply the usual preservation of log-concavity under translation of a polynomial.

## Exact even and odd run coefficients

For a word consisting of a east and b north units, a fixed pattern of runs with h east runs and v north runs gives binom(a−1,h−1) binom(b−1,v−1) words, by the two positive composition counts. With an even number of runs there are two choices of starting direction; with an odd number the direction having the extra run determines the start. Sum the two endpoint compositions. Put

    C_j = binom(m,j),        H_j = 1+(m+1)(m−j)/(m(m+1−j)).

For 0≤j≤m, the even count is

    U_j = R_(2j+2)
        = 2[binom(m−1,j)binom(m+1,j)+binom(m,j)^2]
        = 2 H_j C_j^2.

For 0≤j<m, the odd count is

    V_j = R_(2j+3)
        = binom(m−1,j+1)binom(m+1,j)
          +binom(m−1,j)binom(m+1,j+1)
          +2C_j C_(j+1)
        = 2 H_j C_j C_(j+1).

For clarity, factor C_j C_(j+1) from the two mixed terms. Their ratios are (m+1)(m−j−1)/(m(m+1−j)) and (m+1)/m, with sum 2(m+1)(m−j)/(m(m+1−j)). The even simplification follows directly from binom(m−1,j)/C_j=(m−j)/m and binom(m+1,j)/C_j=(m+1)/(m+1−j). The outer even counts and all the displayed odd counts are positive; there are no other nonzero run counts.

The sequence H_j decreases, so

    V_j^2/(U_j U_(j+1)) = H_j/H_(j+1) ≥ 1.

For an interior even index 1≤j≤m−1, let s=m−j≥1. Direct subtraction gives

    H_(j−1)−H_j = (m+1)/(m(s+1)(s+2)) ≤ 1/(s+1).

Since H_j≥1, this implies H_(j−1)/H_j≤1+1/(s+1). The binomial ratio satisfies

    C_j^2/(C_(j−1) C_(j+1)) = (j+1)(s+1)/(js) ≥ 1+1/s.

It follows that

    U_j^2/(V_(j−1) V_j)
      = [C_j^2/(C_(j−1) C_(j+1))] [H_j/H_(j−1)] ≥ 1.

Thus the interleaving U_0,V_0,U_1,V_1,…,U_m is log-concave, including its boundaries when padded by zero. The formula also handles m=1, when there is no interior even index.

## Translation and conclusion

Reversing the coefficient list of P(z) with respect to M gives the polynomial

    z^M P(1/z) = Σ_r R_r(1+z)^(M−r) = A(1+z),
    A(z)=Σ_r R_r z^(M−r).

The coefficients of A are log-concave with no internal zeros by the preceding calculation. The translation A(1+z) has the same property, by Brenti's binomial-transform criterion. Here is a self-contained proof of that step. For coefficient sequence (a_i), extended by zeros, the sequence corresponding to A+εA' is b_i=a_i+ε(i+1)a_(i+1). For ε≥0,

    b_i^2−b_(i−1)b_(i+1)
     = a_i^2−a_(i−1)a_(i+1)
       + ε(i+2)(a_i a_(i+1)−a_(i−1)a_(i+2))
       + ε^2[(i+1)^2 a_(i+1)^2−i(i+2)a_i a_(i+2)].

All terms are nonnegative: respectively use log-concavity, the monotonicity of successive positive ratios (or an endpoint zero), and log-concavity with (i+1)^2≥i(i+2). The support interval of b remains an interval. Iterate the operator I+ε d/dz with ε=1/N a total of N times and let N→∞. On polynomials the derivative is nilpotent, so the operators converge coefficientwise to exp(d/dz), which is translation z↦z+1 by Taylor's theorem. The log-concavity inequalities are closed, and the translated coefficient list is positive throughout its support. Reversing again gives the desired log-concavity of P.

For d=3 one directly obtains P(z)=z+3z², because the endpoint displacements are (0,2) and (1,1); this is log-concave. If d=2 is included, only the empty path to (2,1) exists, and its singleton count is log-concave.

## Literature and scope

The translation criterion is classical: see Francesco Brenti, [*Unimodal, Log-Concave and Pólya Frequency Sequences in Combinatorics*](https://doi.org/10.1090/memo/0413), and the secondary attribution in Boros–Moll, [*An Extension of a Criterion for Unimodality*](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v8i1r30). The contribution here is the explicit log-concave combined run sequence for Juhnke's two different endpoints, and its application to the report's Conjecture 6. Searches for the statement, the exact report, and both endpoint conventions did not uncover an earlier resolution. This argument does not claim log-concavity for compatible coherent paths in the second hypersimplex or for a modified family with forbidden diagonal stops.
