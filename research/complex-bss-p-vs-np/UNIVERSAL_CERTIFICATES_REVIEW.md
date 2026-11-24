# Adversarial review of universal chart certificates

Reviewed file: [UNIVERSAL_CERTIFICATES.md](UNIVERSAL_CERTIFICATES.md).

The divided-difference implication, denominator-clearing converse, dense-chart argument, leading-syzygy example, and finite-part obstruction pass the checks below. These are an equivalence and an obstruction, not a certificate lower bound or a complex BSS separation. Two definitional/conditional wording repairs are listed in Section 6; both were applied before publication.

## 1. Forward divided differences

Write f_i=c_i+h_i(B;Z), with c_i the W_1^2 coefficient. Substituting c'_i=-h_i gives the nonzero projective common root (1,Z), for every B,Z. Therefore the universal resultant, and hence every polynomial multiple P, vanishes after this substitution.

For each original circuit gate, the identity

```math
A_g-C_g=\sum_i(c_i-c'_i)D_{g,i}
```

is preserved by the displayed product recurrence. Each product needs two evaluation products, and two products plus one sum for each of N difference coordinates: exactly 3N+2 arithmetic operations. Addition or subtraction needs N+2 operations. All difference initializers are shared zero/one constants or wires; their initialization does not require arithmetic.

The h_i have total size O(M). The shared inverse 1/P costs one allowed parameter-only division, and forming N outputs costs N further products. Thus the stated bound (3N+2)s+O(M+N^2) is safe in the arithmetic-operation convention. No derivative approximation, factor extraction, cofactor degree bound, or multiplicity assumption is concealed.

## 2. Reverse denominator clearing

At every gate represent the rational register by P_g/Q_g, with nonzero Q_g in C[A] and P_g in C[A,Z]. Addition uses two cross-products, one sum, and one denominator product: four operations. Multiplication uses two. An allowed division by a parameter-only subcircuit has parameter-only nonzero numerator and denominator, so swapping and multiplying uses two operations and preserves the denominator invariant.

The product Q of the N output denominators is nonzero. It requires N-1 products beyond the shared clearing circuits. The displayed cleared certificate identity is valid as a polynomial identity after multiplying the rational identity by Q. The proof does not need to compute all its complementary denominator products in order to produce Q, so there is no missing quadratic overhead in bound (5).

## 3. Density of the chosen projective chart

For each nonzero projective W, evaluation of each universal quadratic at W is one nonzero linear functional in its own independent coefficient block. Their joint kernel has codimension N. The universal incidence is therefore the total space of a vector bundle of rank M-N over irreducible projective (N-1)-space and is irreducible.

Its chart W_1 nonzero is a nonempty dense open subset. The projective projection has image V(R_N). Continuity implies that the closure of the chart image contains the image of the closure of the chart, hence is V(R_N). Thus a polynomial Q vanishing on the chart image vanishes on the resultant hypersurface. Irreducibility over C gives R_N dividing Q.

This step correctly handles specialized systems whose only common projective roots have W_1=0. It does not assert pointwise equivalence of affine-chart and projective feasibility.

## 4. Leading terms can be a syzygy

For z and 1-z,

```math
U_1=1+\epsilon^{-H}(1-z),\qquad
U_2=1-\epsilon^{-H}z
```

satisfy zU_1+(1-z)U_2=1. Multiplying by epsilon^H and taking the constant term produces (1-z,-z), whose weighted sum is zero. When H=2^r, repeated squaring and one inverse give the claimed O(r) pole circuit.

This refutes only the proposed preservation of the normalized right side or a cost bound polynomial in pole order as measured against circuit size. The fixed system has a constant certificate, so it does not establish a lower bound for all normalization procedures or certificates.

## 5. The hard finite part is inserted correctly

With b=m+1, every monomial chosen from the product P_m has exponent sum_j c_j b^j with 0<=c_j<=m<b. There are no carries. Equality with E_m=sum_j b^j forces every c_j=1, so the coefficient is exactly the permanent over arbitrary complex matrices.

All powers epsilon^(b^j) can be built by repeatedly taking the b-th power of the preceding one, using O(m log m) multiplications in total. Their product is the denominator epsilon^E_m. The matrix-weighted row sums and row product use O(m^2) gates. The denominator is parameter-only and its construction is charged.

The syzygy insertion in U_1,U_2 is exact. Its coordinatewise finite parts have the displayed permanent terms, and specialization z=0 followed by subtraction of one recovers the permanent from the first. The same operation preserves a border bound. The obstruction therefore applies to extracting those particular supplied finite parts, not to finding an unrelated easy certificate.

## 6. Wording repairs sent to the root

1. Define L(P) explicitly as division-free arithmetic circuit size in Section 1. Proposition 2.1 assumes that convention and Proposition 3.1 produces such a circuit. The certificate model itself allows the stated parameter-only divisions.

2. Qualify the Boolean-specialization sentence in Section 6: if a short certificate remains defined after that specialization, or if a short certificate for the specialized system is supplied, it gives the quotient inverse. A generic certificate's parameter denominators can vanish identically on the specialization. The preceding syzygy and finite-part examples correctly identify the resulting normalization problem, so a successful specialization should not be asserted automatically.

These repairs do not change either proposition, the equivalence, or either explicit obstruction. No mathematical gap was found in those claims.
