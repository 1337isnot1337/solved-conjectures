# Athanasiadis–Chapoton’s q-zeta reciprocity conjecture

We prove the full q-form (21) of [Athanasiadis–Chapoton, Conjecture 4.9](https://arxiv.org/html/2605.26916v1#S4.SS4) for every finite preorder. The result follows from a coordinate-weighted version of the authors’ double Ehrhart count.

## 1. Weighted reciprocity

We use the opposite preorder τ* to define the polytopes in this section. For positive integers c_i and an integer v≥0 put
```
Q(c,v) = Σ_{i∈ E} c_i Δ_{U_*(i)} + v Δ_E,
```
where U_*(i) is the principal filter of i in τ*, and Δ_J=conv(0,e_j:j∈J). Its inequalities are y_i≥0 and y(J)≤c(J)+v for each nonempty ideal J of τ*. Here and below c(J)=Σ_{i∈J}c_i. The same description holds for nonnegative c. To see necessity, only summands indexed by i∈J can contribute to y(J), except for the universal summand. For sufficiency, the max-flow constraints on a set S of receiving coordinates reduce to its down-closure J: demand y(S)≤y(J)≤c(J)+v, and c(J)+v is the capacity of all summands that can serve S. (For S=∅ no condition is needed.) Each summand can send unused mass to the origin. This also proves the description directly for real nonnegative weights.

For clarity, the rank claim about P follows from the same integral max flow: each subject i can send at most one unit to one coordinate in its filter in τ. The capacity bounds for an integer a∈P are exactly the Hall constraints, so there is a matching serving demand a using distinct sources. If |a|<n, send an unused source to its own coordinate, raising |a| by one and staying in P. Thus maximal vectors are exactly those of sum n. The cover predecessors of a∈P are exactly a−e_i for its positive coordinates.

The bipartite presentation of Q(c,v) has a universal summand with index 0 and right vertex 0 for unused mass, as in [Athanasiadis–Chapoton, Theorem 2.1 and Lemma 4.1](https://arxiv.org/html/2605.26916v1#S4). Its draconian sequences are precisely (a0,a) for a∈Pτ: the non-universal neighborhoods are 0 plus filters of τ*, so the inequalities for the left-index sets reduce to the ideals of τ. This bipartite presentation does not depend on c,v. With generalized binomial coefficients, the number of lattice points of Q(c,v) is
```
Σ_{a∈P} binom(v+a0,a0) ∏_{i∈E} binom(c_i+a_i−1,a_i).
```
The counting expression holds also for all weights nonnegative, including v=0; it is [Postnikov, Theorem 11.3](https://arxiv.org/pdf/math/0507163#page=28) in its untrimmed form with the universal summand.

Now take c_i≥1 and v≥1. Q(c,v) is full-dimensional since it contains the unit cube (each c_i≥1 and i∈U_*(i)). By Ehrhart–Macdonald reciprocity applied to all weights scaled by the same variable, the evaluation at dilation −1 is (−1)^n times the number of interior lattice points. An integer vector in the interior has y_i≥1 and y(J)≤c(J)+v−1 for every nonempty ideal J. After subtracting 1 in every coordinate, it belongs exactly to Q(c−1,v−1). Thus the two evaluations of the lattice counts give
```
Σ_{a∈P} binom(v−1,a0) ∏ binom(c_i,a_i)
  = Σ_{a∈P} binom(v−1+a0,a0) ∏ binom(c_i+a_i−2,a_i).        (R)
```
Indeed the negative binomial identity introduces the sign (−1)^{a0+|a|}=(−1)^n. Both sides of (R) are polynomials in the weights; agreement on all positive integer tuples proves the polynomial identity.

Setting v=0 in the polynomial (R) gives the following identity: the left coefficient is `binom(−1,a0)=(−1)^{a0}`, and on the right `binom(a0−1,a0)` vanishes unless a0=0. Multiplying by (−1)^n,
```
Σ_{a∈P} (−1)^|a| ∏ binom(c_i,a_i)
   = (−1)^n Σ_{a∈P : |a|=n} ∏ binom(c_i+a_i−2,a_i).        (R0)
```

## 2. The q-zeta reciprocity conjecture

In the definition of the q-zeta polynomial, condition a multichain of m−1 points on its last point a. The lower interval is a product of coordinate chains. In coordinate i, the first m−2 entries are weakly increasing from 0 to a_i, so their rank-sum weights give a Gaussian binomial; the last entry contributes q^{a_i}. Consequently, writing the Gaussian product explicitly,
```
Z_q(P,[m]_q) = Σ_{a∈P} ∏_{i∈E} q^{a_i} ∏_{j=1}^{a_i} (1−q^{m−2+j})/(1−q^j).
```
Each factor is a polynomial in q^m and therefore in [m]_q over Q(q). The displayed formula holds as a polynomial since it agrees at the infinitely many distinct arguments [m]_q (m≥2, formal q). At m=−1 the coordinate contribution for a_i=0,1,2,≥3 respectively is
```
1,   −(1+q^{-1}),   q^{-1},   0.
```
The last zero is the factor j=3; the first three follow by direct simplification.

Replace q^{-1} by an independent variable t_i in coordinate i, so the resulting expression is a multiaffine polynomial in all t_i. At the Boolean vector t=1_B for any B⊆E, the coordinate values are precisely (−1)^{a_i} binom(c_i,a_i) for c=1+1_B. On the right of (R0), the binomial factor for any i in B equals 1 for every a_i≥0 and for i outside B equals 1 if a_i=0 and 0 otherwise (with the zero-index factor defined as 1). Thus (R0) at these values proves the multiaffine identity
```
Σ_{a∈P} ∏ F_{a_i}(t_i) = (−1)^n Σ_{a∈Max(P)} ∏_{i:a_i>0} t_i,
F_0(t)=1,  F_1(t)=−(1+t),  F_2(t)=t,  F_j(t)=0 for j≥3.
```
The Boolean cube determines all coefficients of a multiaffine polynomial (iterate interpolation in each variable). Specializing each t_i=q^{-1} gives the claimed equation (21), since a maximal vector covers exactly as many points as it has positive coordinates. Specializing further to q=1 gives equation (22).

## Prior work

[Evidence Press](https://www.evidencepress.org/releases/preorder-polytope-flag-spheres/) already established the q=1 specialization (22); only the remaining q-form (21) is claimed here. See the separate [M-triangle identity](../athanasiadis-chapoton-transmuted-m/PROOF.md).
