# Athanasiadis–Chapoton polar-preorder duality

We prove [Athanasiadis–Chapoton, Conjecture 6.2](https://arxiv.org/html/2605.26916v1#S6) for every finite preorder τ. In fact an explicit positively homogeneous, piecewise unimodular homeomorphism takes the polar preorder polytope for τ onto the one for its reversal τ*. Thus it identifies lattice points in all dilates, and is a composition of dual mutation shears with convex intermediate images. This settles both parts of [Luo, Problem 5.2](https://arxiv.org/html/2609.28507#S5). We also give a direct finite combinatorial model with the functoriality and ordinal-sum factorization requested in Luo's Problem 5.3.

## 1. The gauge

Let E be the ground set, and P the quotient poset of equivalence classes C (elements are equivalent if each precedes the other). The polar preorder polytope Qτ is the convex hull in R^E of −e_i and the indicators of nonempty ideals of τ. Include the origin as a redundant generator, since it is in the convex hull of −e_i and 1_E. (The empty preorder is immediate.) For z∈R^E let
```
a_C = max(0, z_j : [j] ≥ C in P),
d_i = a_[i] − z_i,
ρτ(z) = max_C a_C + Σ_i d_i.
```
By [Luo, Proposition 2.4](https://arxiv.org/html/2609.28507#S2), ρτ is the dilation gauge of Qτ. For completeness, the least nonnegative order-reversing class-constant vector majorizing z is a. Any such majorant w is a nonnegative linear combination of nested ideal indicators with total coefficient max w (take the successive height differences between its distinct positive values), and z is w plus a nonnegative combination of negative unit vectors of total coefficient Σ_i(w_[i]−z_i). Hence the formula is attained by w=a. Conversely any nonnegative representation of z using the generators has a majorant w as the ideal-indicator part. This part uses total coefficient at least max w, and the other part uses exactly Σ_i(w_[i]−z_i). As w≥a, any such representation has total coefficient at least ρτ(z).

## 2. A reversal-invariant description of all coordinates

Apply the dual-oriented [Stanley transfer](https://doi.org/10.1007/BF02187680) to a on the quotient poset:
```
b_C = a_C − max(0, a_D : D > C).
```
The inverse recurrence is a_C=b_C+max(0,a_D:D>C), equivalently
```
a_C = max_{C=C0<C1<···<Ck} Σ_{j=0}^k b_Cj.
```
Thus every nonnegative b occurs on the order-reversing cone, and max_C a_C is the maximum sum of b on any chain in P.

We claim that z is in bijection with the following data:
```
b_C ≥ 0 for every class C,  d_i ≥ 0 for every i,
and b_C > 0 implies min_{i∈C} d_i = 0.
```
Starting with z, the nonnegativity is immediate. If b_C>0, then a_C>0 and every strict successor class has a_D<a_C. Therefore the maximum defining a_C must be attained at a coordinate inside C, yielding d_i=0 there.

Conversely consider any data as displayed, reconstruct a by the inverse transfer, and put z_i=a_[i]−d_i. The least nonnegative order-reversing majorant of z is at most a. To prove equality at a given class C with a_C>0, if b_C=0, then a strict successor D exists with a_D=a_C. Repeat while b remains zero; finiteness produces a successor or the initial class D≥C with b_D>0 and a_D=a_C. Some i∈D has d_i=0 by hypothesis, and hence z_i=a_C. This proves equality at C, and equality at a_C=0 is automatic. The data reconstructed from z are therefore its given b and d. This proves the bijection, with no assumption on equivalence-class sizes.

## 3. Duality

Keep b and d fixed and reconstruct a* by the inverse transfer on the opposite quotient P*, then set z*_i=a*_[i]−d_i. The admissibility condition on (b,d) is independent of the order direction. The inverse map does the same with P and P* exchanged. Chains of P and P* are the same sets, so their maximum b-sum is unchanged, and the total deficit is unchanged by construction. Thus
```
ρ_{τ*}(z*) = ρτ(z).
```
The two maps preserve the integer lattice because all formulas use integer-linear operations and finite maxima. They are continuous, positively homogeneous, piecewise integer-linear, with each other as inverses. On a common finite refinement where the forward map and the inverse on its image are both linear, their integer matrices on every full-dimensional piece are inverses, hence are unimodular. Therefore this is a piecewise unimodular homeomorphism preserving all dilation layers. The Ehrhart polynomials, hence the h* polynomials, coincide.

## 4. Factoring the reversal into convex mutations

For each class C, put h_C=max(0,z_j:[j]>C) in the original coordinates. Process the classes in a linear extension of P, from bottom to top. On processing C, subtract h_C from every coordinate in C. All strict upper classes are still untouched at that step, so h_C is simply the maximum over the corresponding **current** coordinates and zero. Each step is
```
φ_{w_C,F_C}(u) = u − min_{v∈F_C}⟨u,v⟩ w_C,
w_C=−1_C,    F_C=conv({0}∪{−e_j:[j]>C}).
```
The vector w_C is primitive, and F_C is a lattice polytope in w_C^⊥. Thus each step has exactly the form (3.2) in Luo's Problem 5.2, and its inverse has the same form with −w_C, since the affected coordinates do not enter h_C.

To check convexity of all intermediate polytope images, let D be the order ideal of processed classes and u the resulting coordinates. For C∉D, all upper classes are unprocessed, so
```
a_C=max(0,u_j:[j]≥C).
```
For C∈D, u_i=z_i−h_C=b_C−d_i. Consequently b_C=max(0,u_i:i∈C): when b_C>0 there is a zero deficit in C, and when b_C=0 all u_i there are nonpositive. Recover a_C for C∈D by the recursion a_C=b_C+max(0,a_A:A>C). In bottom-up terminology this reconstruction runs **from the top down**, with the unprocessed a-values already known. Every b_C and reconstructed a_C is a convex function of u, by this formula and finite induction. In the coordinates u the original dilation gauge is
```
max_C a_C + Σ_{C∈D}|C| b_C + Σ_{C∉D}|C| a_C − Σ_i u_i.
```
This follows by substituting d_i=b_C−u_i on D and d_i=a_C−u_i off D. Its convexity gives the required convexity at every intermediate step. The images are bounded rational polytopes containing the origin in their interior, because the gauges are finite piecewise linear convex functions and the shears are homeomorphisms.

After all steps the coordinates are u_i=b_C−d_i. The resulting gauge is the maximum sum of b on a chain plus Σ_i d_i, hence the fully transformed polytope is the same for τ and τ*. Concatenating the shears for τ with the reverse inverses for τ* gives the promised reversal; the convexity established for both halves verifies the additional clause of Problem 5.2. This factorization also makes its piecewise unimodularity immediate.

## 5. A finite model for the numerator

Write [m]_t=1+t+⋯+t^{m−1}, and for a poset R let W_R(t)=Σ_π t^{des(π)}, over linear extensions in any natural labeling. Then
```
h*(Qτ,t)=Σ_{S⊆P} t^{|S|} W_{P|S}(1/t) ∏_{C∈S}[|C|]_t.        (H)
```
Here P|S is the induced subposet, and the empty summand is 1. To prove the formula, by the gauge and the data bijection the series over z∈Z^E with weight t^{ρτ(z)} is
```
(1−t)^{−|E|} Σ_{b∈Z_≥0^P} t^{max_chain Σ b_C} ∏_{C:b_C>0}(1−t^{|C|}).
```
The factor (1−t^{|C|}) removes the cases with all deficits positive in class C. This gauge layer series is (1−t) times the Ehrhart series, since all gauge values are integers. Thus its numerator over (1−t)^{|E|} is h*(Qτ,t).

Fix S=supp(b). The maximum chain sum over P equals the maximum chain sum over P|S (delete all zero coordinates in a chain). On the induced poset the inverse transfer sends the strictly positive b to strictly order-reversing positive integers a, with max(a) equal to the chain sum statistic. The number with max(a)≤m is the strict order polynomial of P|S at m (order-reversing or order-preserving gives the same count by complementing the values in [m]). For a poset R on k naturally labeled elements, the P-partition identity and order-polynomial reciprocity give
```
Σ_{m≥0} Ω_R^strict(m) t^m = t^k W_R(1/t)/(1−t)^{k+1}   (k>0).
```
Indeed the summand for an extension with d descents is binom(m+d,k), giving t^{k−d}/(1−t)^{k+1}; this also proves the identity directly by sorting equal values in decreasing label order for strict maps. Passing from cumulative to exact maximum multiplies by (1−t), hence the contribution to the numerator on support S is t^{|S|}W_{P|S}(1/t) times the product of (1−t^{|C|})/(1−t) over S. This is (H).

To meet the precise functorial condition of Luo's Problem 5.3, one explicit choice of objects from (H) is as follows. Choose S⊆P. Divide P|S into its ordinal-indecomposable factors, preserving their order. Such factors are exactly the connected components of the incomparability graph: an element outside a component is comparable to all its vertices, and its comparison direction cannot change along an incomparable pair. Thus between components the direction is constant, and they are totally ordered. For each factor R use the lexicographically smallest binary adjacency matrix among its natural labelings by [|R|]. This is an intrinsic canonical encoding of its isomorphism type; no labeling of the original ground set is used. Choose a linear extension π_R of that canonical matrix. Also choose an integer j_C in {0,…,|C|−1} for every C∈S. The object's statistic is
```
Σ_R (|R|−des(π_R)) + Σ_{C∈S} j_C.
```
Natural labels in different factors can be taken consecutively in factor order; every linear extension concatenates the factors with no cross-boundary descents. Consequently this model yields exactly the summand of (H). A preorder isomorphism transports S and the j_C, maps the ordered components identically to their canonical encodings, and transports their words identically in those encodings. This prescription respects composition. If τ is an ordinal sum, the incomparability components of each nonempty induced subset are the concatenation of those from the two summands. Hence objects split by restriction and the statistic adds. These choices give the two requested compatibilities without choosing an order on the input labels or using the already computed h* coefficients.

## Priority scope

The original paper poses the exact statement in Conjecture 6.2. Luo proves the distinct ordinal-sum product conjecture (6.3), gives the gauge used above, and restates the reversal existence problem as his Conjecture 5.1 and Problem 5.2, and separately asks for the finite model in Problem 5.3. A November 2026 [independent preorder-polytope preprint](https://doi.org/10.5281/zenodo.24235777) still lists the reversal conjecture as open. Searches for exact source numbering, polar Ehrhart equality, opposite preorder lattice-point bijection and a Stanley-transfer proof did not uncover an earlier resolution. We do not claim priority beyond that search.
