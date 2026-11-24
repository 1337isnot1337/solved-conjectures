# Exact quasipolynomial onset for semiprime multiplicities in infinite chains

**Extension of a known refutation, not a new resolution of a conjecture.** Rosas-Ribeiro and Bras-Amorós's [Conjecture 6.1](https://doi.org/10.1007/s00233-024-10487-x) predicts that the number i_g(m) of multiplicity-m, genus-g numerical semigroups lying in infinite chains is quasipolynomial for every g≥m−1. [Zhanhe Zhang, October 2026](https://doi.org/10.2139/ssrn.7566078), already refutes the original conjecture at m=8 and proves eventual quasipolynomiality for all m. His abstract also states the weighted quotient transform used below. The present note derives an exact onset formula for every semiprime multiplicity, yielding infinitely many distinct failures of the original full-range prediction and unbounded initial ranges where the eventual formula does not yet apply. It is not a claim to resolve the already settled conjecture.

## Result

For distinct or equal primes p,q, put m=pq and define

    B(P,D) = ((2D−1)(P²−3P+1)+1)/2,
    b(m) = max(m−1, B(p,q), B(q,p)).

There is a quasipolynomial that agrees with i_g(m) at every integer g≥b(m). If b(m)>m−1, no quasipolynomial agrees on a tail starting any earlier within the natural range. In fact, the unique eventual quasipolynomial undershoots the actual count at **every** integer g in [m−1,b(m)−1]. Thus for every semiprime with largest prime factor at least 5, the exact version fails. For m=p², p≥5, the onset is B(p,p), asymptotic to p³=m^{3/2}.

## 1. The weighted quotient transform

This transform is stated in Zhang's abstract; we give the short proof for the scope needed here. A numerical semigroup is an additive, cofinite submonoid of the nonnegative integers. Its genus G is its number of gaps; its Frobenius number F is its maximum gap, with F(ℕ₀)=−1. Its left part consists of the members below the conductor F+1. By Theorem 3.4 of Rosas-Ribeiro and Bras-Amorós, a nonordinary semigroup lies on an infinite chain if and only if its left part has gcd larger than 1. The one ordinary semigroup at genus g=m−1 lies on the ordinary infinite chain and its left part contains only 0.

Write m=DP, where D,P≥2, and require every left element of a multiplicity-m semigroup S to be divisible by D. Write F(S)=D Q+r, 0≤r<D. Define T by taking the scaled-down left elements up to Q, and adjoining all integers above Q. Then T is a numerical semigroup of multiplicity P, with F(T)≤Q and equality if r=0. In the ordinary case Q=P−1 and T is the ordinary multiplicity-P semigroup. Conversely, such a T and a pair (Q,r) give S by including the multiples of D up to F(S) whose quotients lie in T, and including all integers greater than F(S). It is closed under addition, and F(S) is a gap by r>0 or F(T)=Q. In the natural range stipulated below, its multiplicity is DP.

The genus relation is

    G(S) = (D−1)Q+r+G(T).

For fixed T, put s=G(T)+(D−1)F(T). The allowed pairs are (Q,r)=(F(T),0) and all pairs with Q≥F(T) and 1≤r≤D−1. Their differences G(S)−s run bijectively through all nonnegative integers. The only pairs here that give F(S)<m−1 would arise from the ordinary T and Q=P−1, r<D−1; those have G(S)<m−1 as well. Hence at g≥m−1 the count of the D-divisibility class is exactly

    A_g(P,D) = #{T : multiplicity(T)=P, G(T)+(D−1)F(T)≤g}.

For m=pq and distinct primes p,q, the two divisibility classes have intersection of size 1 for each genus: intersecting forces all left elements to be multiples of m, so above m they appear consecutively at spacing m until the conductor. Equivalently the quotient T is ℕ₀, and the same unique-parameter argument works, except one restricts to g≥m−1 to avoid the trivial small cases. For p=q there is only one class. Thus

    i_g(pq) = A_g(p,q)+A_g(q,p)−1 if p≠q,
    i_g(p²) = A_g(p,p).

## 2. An exact quasipolynomial for the relaxed count

Let U_g(P,D) count all numerical semigroups T *containing* P with weighted score at most g, without requiring P to be their minimum. For 1≤i<P, let w_i be the smallest T-element congruent to i modulo P, and put w_0=0. Conversely, admissible w vectors are precisely the nonnegative vectors with w_i≡i (mod P) and inequalities

    w_i+w_j ≥ w_{i+j mod P}.

Indeed, a closed monoid with these minima consists of the indicated arithmetic progressions with difference P. The numerical invariants are

    G(T)=Σ_i w_i/P−(P−1)/2,
    F(T)=max_i w_i−P.

The weighted score bound is thus equivalent to the homogeneous inequalities

    Σ_i w_i + P(D−1) w_j ≤ P g + P(P−1)/2 + P²(D−1)
    for every j.

Let L be the right-hand side. The above inequalities, closure inequalities and nonnegativity describe a bounded rational polytope dilated by L, and the congruences restrict to the fixed lattice coset w∈(1,2,…,P−1)+Pℤ^{P−1}. The count is an exact quasipolynomial in integral L≥0, not just eventual, as follows.

Form the closed rational cone of pairs (L,w) with L≥0 and with w in the prescribed dilation. Triangulate into closed simplicial cones and use inclusion-exclusion for the lower-dimensional faces. The zero-dimensional cone never intersects this coset because P≥2. For each simplicial cone with k≥1 rays, choose integral ray generators whose w-coordinates are multiples of P. Let b_i>0 be their first coordinates. Subtract integral parts of the nonnegative ray coefficients. The remaining point belongs to a bounded half-open fundamental parallelepiped, stays in the given coset, and has first coordinate an integer a with 0≤a<Σ b_i. Conversely every such remainder plus a nonnegative integer combination of rays remains in the cone and coset. Its first-coordinate generating-function term is therefore z^a/∏(1−z^{b_i}).

Pick a common multiple B of every b_i. Rewriting all factors using denominator 1−z^B gives a sum of terms z^s/(1−z^B)^k with 0≤s<kB. In a residue class L=l+B n, 0≤l<B, only terms s=l+B j contribute, with 0≤j<k. The value is the polynomial binomial coefficient binom(n−j+k−1,k−1) even for n<j: there the upper argument is a nonnegative integer smaller than k−1 and the polynomial indeed vanishes. So each constituent applies from the beginning of that residue class. Inclusion-exclusion yields the required exact quasipolynomial. Since L is an integer affine function of g, U_g(P,D) is an exact quasipolynomial on the natural range.

## 3. Removing smaller multiplicities creates a transient

Now P is prime. If T contains P and has smaller multiplicity k<P, then it contains the numerical semigroup ⟨k,P⟩ because gcd(k,P)=1. Therefore all such T form a finite family. Their weighted scores are at most that of ⟨k,P⟩, since adding elements cannot increase genus or Frobenius number. The familiar two-generator formulas give

    F(⟨k,P⟩)=kP−k−P,
    G(⟨k,P⟩)=(k−1)(P−1)/2.

The score is strictly increasing in k and the largest score is uniquely attained by T=⟨P−1,P⟩ at B(P,D): any proper extension strictly decreases genus. These formulas include k=1 with semigroup ℕ₀ and Frobenius number −1.

Let C(P,D) be the total number of members of this finite smaller-multiplicity family, and R_g(P,D) the number of them whose scores exceed g. Then

    A_g(P,D)=U_g(P,D)−C(P,D)+R_g(P,D),

where R_g≥1 for g<B(P,D), R_{B(P,D)−1}=1, and R_g=0 for g≥B(P,D). Thus every individual class has an exact quasipolynomial plus a nonnegative finite transient. For distinct primes the two transients add, and for a prime square there is only one. This proves the asserted onset and sign of the discrepancy. Any other quasipolynomial that agreed on an infinite integer tail would have identical polynomials on every joint residue class, by polynomial identity, so could not absorb the initial discrepancy.

For P≥5, D≥2, put F₀=P²−3P+1. We have

    B(P,D)−(PD−1)=D(F₀−P)+(3−F₀)/2>0.

The right-hand side increases with D; at D=2 it is (3P²−13P+6)/2, positive at P=5 and increasing thereafter. For P=2 or 3, the maximum score is respectively −(D−1) or D, not beyond the natural onset. The prime-square asymptotic follows from the displayed B formula.

## Prior work / scope

- [Rosas-Ribeiro and Bras-Amorós, *Infinite chains in the tree of numerical semigroups*](https://doi.org/10.1007/s00233-024-10487-x), Theorem 3.4 and Conjecture 6.1. The [January 2025 correction](https://doi.org/10.1007/s00233-024-10496-w) changes only a citation in the abstract, not the conjecture.
- [Zhanhe Zhang, *Quasipolynomial Counts of Numerical Semigroups in Infinite Chains at Fixed Multiplicity*](https://ssrn.com/abstract=7566078), SSRN, 5 October 2026: the already known first failure m=8 at g=7, eventual result for every m, and weighted quotient transform. This note does not claim any of those items as new. Title/author searches for prime-square or semiprime onset found no earlier result proving this specific formula; the accessible SSRN abstract does not state it. The full SSRN PDF was not accessible in the literature check, so whether Zhang also has this result in the body is unverified.
