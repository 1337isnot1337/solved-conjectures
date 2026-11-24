# Failure of the first-index inequality for inverse Kazhdan–Lusztig polynomials

**Scope:** related advance, not a new solution of Gao–Xie's original conjecture. Badalov already disproved the latter in September 2026 ([arXiv:2609.13417](https://arxiv.org/abs/2609.13417)); Section 8 explicitly leaves the universal first-index inequality unresolved. This note was independently derived from the coalescence construction in [the dual Chow counterexample](../caiolo-ferroni-hoster/COUNTEREXAMPLE.md). No earlier first-index counterexample was found in the literature search on November 23, 2026; priority remains unconfirmed. No claim of external or Lean verification.

## Theorem

For every prime power q >= 17 there is a simple rank-five matroid M with inverse Kazhdan–Lusztig polynomial Q_M(x) = c_0+c_1 x+c_2 x^2 satisfying c_1^2 < c_0 c_2. In particular the first-index inequality discussed in Section 8 of Badalov fails. Moreover the Turán ratio c_1^2/(c_0 c_2) is asymptotic to 18/q.

## Construction

Use the rank-five coalescence matroid constructed and proved valid in [COUNTEREXAMPLE.md](../caiolo-ferroni-hoster/COUNTEREXAMPLE.md). Briefly, let K=F_(q^4), V=K^2 over F_q, and m=q^4. Adjoin m free points p_a to the projective geometry on V. In the rank-five truncation coalesce the b=q^16 rank-five blocks P(W_(a,u,v,w)) union {p_a}, where W is the graph of t -> u t+v t^q+w t^(q^2)+a t^(q^3). Blocks intersect in rank at most three: distinct graphs in one a-class intersect in dimension at most two, and distinct a-classes have no common auxiliary point. The cited proof checks augmentation, all lower flats, and hyperplane multiplicities. The construction is an adaptation of the hyperplane coalescence and rank-metric-code methods of Bérczi, Coron, Eur and Li ([arXiv:2610.17135](https://arxiv.org/abs/2610.17135)).

## Exact coefficient formulas

Write A(S) for the number of flags of proper nonzero flats with ranks in S, in increasing order. A(empty)=1. For rank five, let R={1,2,3,4}. Then

- c_0 = sum over S subset R of (-1)^|S| A(S).
- c_1 = -A(1)+A(1,2)-A(1,2,3)+A(1,3)+A(2,3,4)-A(2,4)-A(3,4)+A(4).
- c_2 = A(1,2)-A(1,4)-A(2)-A(2,3)+A(2,4)+A(3).

To derive these formulas, use the original Gao–Xie reciprocity ([arXiv:2007.15349](https://arxiv.org/abs/2007.15349), also Definition 8.6 in Ardila–Sanchez, *Valuations and the Hopf Monoid of Generalized Permutahedra*):

    (-x)^r Q_M(1/x)
      = sum_F (-1)^rk(F) Q_{M|F}(x) x^(r-rk(F)) chi_{M/F}(1/x).

The reversed characteristic polynomial expands as sum_{G>=F} mu(F,G) x^(rk(G)-rk(F)). For a coefficient of x^(r-j), j<r/2, the top term F=M contributes zero by the degree restriction. A lower interval of rank d contributes its coefficient k only at G of rank g=r-j+d-k. If G=F, the exponent k is too low; otherwise expand mu(F,G) as a sum over strict chains from F to G with sign (-1)^(number of steps). The flags in the lower coefficient and in the chain concatenate, with F and G included exactly when interior. The resulting sign multiplier is (-1)^(r+d+number of intermediate ranks+1). Start with Q of the rank-zero lattice equal to 1. Applying this finite recursion up to rank five gives the three formulas above. The replay regenerates these weights rather than relying on a hand-entered list.

For clarity, compute the flag counts as follows. Let T(d,t;S) count flags of ranks S in the product lattice of the subspaces of F_q^d and the Boolean lattice on t elements. If S has largest rank v then

    T(d,t;S) = sum_i [d choose i]_q binom(t,v-i) T(i,v-i;S\{v}).

For S empty the answer is 1. Gaussian binomials follow the recurrence [d choose i]_q=[d-1 choose i-1]_q+q^i[d-1 choose i]_q, with the usual boundary values. For nonempty S with v=max S<4, A(S)=T(8,m;S). For v=4 the flags through old hyperplanes are corrected exactly once for each coalescence:

    A(S)=T(8,m;S)+b*(T(4,1;S\{4})-T(4,0;S\{4})-[4 choose 3]_q*T(3,1;S\{4})).

There are no corrections to lower ranks, and no removed rank-four flat lies in two coalesced blocks.

## Exact witness and infinite family

At q=17, the coefficients obtained by these formulas are

    c_0=1367432169863264385040621589
    c_1=236827334118626401257039561
    c_2=43971319705548460332837139

and

    c_1^2-c_0*c_2=-4040610930973941995066729476797524541048570545321150.

This alone disproves the universal inequality. The accompanying replay also treats q as an indeterminate over Q. The polynomial -(c_1^2-c_0*c_2) evaluated at q=17+s has degree 43, with all 44 coefficients strictly positive, including leading coefficient 1/2. Thus the defect is negative for every real q>=17 in the coefficient formulas, and for every prime power in the matroid construction. The leading terms of c_0,c_1,c_2 are respectively q^22, 3q^21, q^21/2, which gives the stated asymptotic ratio.

## Independent audit

The inverse-Z recursion supplies a separate computation. By Braden–Ferroni–Matherne–Nepal ([arXiv:2510.01086](https://arxiv.org/abs/2510.01086), Theorem 2.2),

    Y_M = sum_F (-x)^(r-rk(F)) mu(F,top) Q_{M|F}.

Möbius inversion in the weighted incidence algebra gives

    Q_M = sum_F (-x)^(r-rk(F)) Y_{M|F}.

Indeed substitute the first formula; the coefficient of Q for any lower flat G is (-x)^(r-rk(G)) times sum_{F>=G} mu(G,F), which vanishes unless G=top. Set S equal to the second sum over proper flats. The high coefficients of Q vanish; hence the high coefficients of Y_M are -S, and palindromicity determines the low coefficients. Consequently Q_M=Y_M+S, giving a second recursion. In the product lattices aggregate by flat type, then use the rank-four truncation for the coalesced hyperplanes. This independently recovers the displayed Q coefficients and gives Y_M coefficients

    (1367432169863264385040621589,
     1604275384447811244361679510,
     1648248575127069559732389010,
     1648248575127069559732389010,
     1604275384447811244361679510,
     1367432169863264385040621589).

These Y coefficients are log-concave; this construction does not itself refute the inverse-Z conjecture. The two calculations share the proved flat enumeration but use distinct defining polynomial recursions.

## Reproduction and scope

Run python3 verify.py with Python 3.9+ and SymPy. The exact checks are ordinary Python assertions; no floating-point roots, no random search, no unproved conjectural input. This is a complete disproof of the remaining first-index question from Badalov's Section 8, not a separate solved entry for the already-resolved Gao–Xie conjecture. Rank five is a witness to a universally quantified inequality, not a fixed-rank numerical target. The original coalescence proof is required for interpreting the flag counts as those of a matroid.

Issue #299.