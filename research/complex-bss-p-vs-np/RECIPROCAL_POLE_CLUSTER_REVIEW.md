# Review of the reciprocal pole-cluster obstruction

Reviewed file: RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md.

The full written construction passes this independent review, including its degree estimates and its stated distinction between a selected analytic cluster and an entire algebraic factor.

## 1. Size and degree

The digit recurrence has nonzero leading coefficient at every stage because zeta^(-2^j) differs from one for j<m. It gives

```math
\deg U_j=\prod_{i\lt j}(1+2^{m-i-1}),
\qquad
\deg B_j=2^{m-j-1}\deg U_j.
```

The latter degree increases with j, so its maximum is the stated product over r=1,...,m-1. Both products defining H_m have degree at most m times that maximum. The displayed bound h<=2m*2^((m-1)(m+2)/2) follows. H_m is nonconstant because its root-of-unity evaluations at the empty and full subsets are different polynomials in X.

Thus q_m has generic t-degree M=D+1+h, with log M=O(m^2), while its circuit has O(m^2) gates. The degree drop at special X is explicitly excluded from the fixed-X count in Section 4.

## 2. Irreducibility

In C[X,t], the factors of t^D-1 are the distinct t-zeta^a. At each one, J_m=1+H_m is a nonzero polynomial in X because its X-constant term is one. Also t is coprime to t^D-1. Hence the two coefficients of q_m as a linear polynomial in epsilon are coprime.

Gauss's lemma therefore makes this nonconstant linear polynomial irreducible in C[X,t,epsilon]. Its constant t-coefficient is the unit -1, so it is primitive over C[X,epsilon]. A second application of Gauss's lemma yields irreducibility over C(X,epsilon) in t. No specialization-dependent irreducibility claim is needed.

## 3. Finite-cluster jet

The t-derivative at each central root zeta^a is D*(zeta^a)^(D-1), nonzero and independent of X. The implicit function theorem therefore supplies D local holomorphic branches near every matrix center. A common neighborhood exists because the branch family is finite.

Implicit differentiation gives alpha'_a=(zeta^a)^2 J_m(X,zeta^a)/D. Differentiating the reciprocal cancels the square of the root, leaving -J_m/D. The Ryser identity then gives the exact coefficient -1-per_m(X)/D. The central reciprocal sum is zero since D>=2.

Each individual branch has a small jet; summing the D branch contributions is the hard operation. This does not contradict the singular-witness theorem.

## 4. Escaping cluster and all-root trace

For generic fixed X and nonzero epsilon, the polynomial has degree M. On any circle of radius greater than one, q_m converges uniformly to t^D-1. Rouché's theorem gives exactly D roots inside for sufficiently small epsilon. Since the radius is arbitrary, every other actual root escapes to infinity.

The constant and linear t-coefficients are -1 and zero, so the sum of reciprocals of all roots, counted with multiplicity, is exactly zero. The escaping-cluster reciprocal sum is therefore the negative of the finite-cluster sum. It tends to zero but has first deformation coefficient 1+per_m/D. No individual holomorphic labeling of escaping roots is needed.

## 5. Scope

The counterexample excludes a generic polynomial-cost operation for the low-order reciprocal trace of the selected finite analytic cluster, even with numerator one and a small irreducible denominator. It does not exclude extracting that entire denominator: the denominator is already supplied by a short circuit.

The selected D branches are not a factor over C(X,epsilon). Therefore the construction does not refute the desired full resultant-factor trace operation or the pure-pole full-denominator route. That distinction is correctly explicit in the note.
