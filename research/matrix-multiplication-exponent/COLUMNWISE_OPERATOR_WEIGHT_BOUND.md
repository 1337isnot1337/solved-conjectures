# Columnwise weight bound for the tagged unit source

Research status: this is an exact obstruction for the stated finite
outside-support operator identities. It does not constrain operators
with many weights in each source column, or prove a matrix
multiplication lower bound.

## Statement

Use r tagged-unit families, with source unit label h in [Q_z] and
a C--D wire label c of arbitrary finite size. Suppose the complete
operator coefficients satisfy

```math
\sum_{z,h,c}\Gamma^{z}_{\gamma,hc}
 A^a_{z,h}D^\delta_{z,hc}B^b_{z,h}
 =T_{ab\gamma\delta}I.                                  \tag{1}
```

The C maps Gamma are constant complex maps. Operators occur in
the displayed order. For each fixed z,h assume that every outside
A coefficient has its weights in one finite set S_A(z,h), and every
B coefficient has its weights in one finite set S_B(z,h). These sets
may depend on h. No uniform support set across all source columns
is required.

Then

```math
\mathop{\mathrm{rank}}_{AB\mid CD}T
 \le \sum_{z,h}|S_A(z,h)|\,|S_B(z,h)|.                  \tag{2}
```

For the copied C-compressed target
T_L=sum_(i,j) A_i B_j L(C_(ij)) D_(ij), this implies

```math
\mathop{\mathrm{rank}}L
\le\#\{(i,j):L(C_{ij})\ne0\}
\le\sum_{z,h}|S_A(z,h)|\,|S_B(z,h)|.                   \tag{3}
```

## Weyl proof

Use the skew Laurent embedding and notation of
[FINITE_OPERATOR_WEIGHT_OBSTRUCTION.md](FINITE_OPERATOR_WEIGHT_OBSTRUCTION.md). With commuting Euler variables E,
write right-normal forms

```math
A^a_{z,h}=\sum_{\alpha\in S_A(z,h)}x^\alpha f^a_{z,h,\alpha}(E),
\qquad
B^b_{z,h}=\sum_{\beta\in S_B(z,h)}x^\beta b^b_{z,h,\beta}(E),
```

and expand D in that skew Laurent field. Its required coefficients
d^(delta)_(z,hc,mu)(E) are rational functions. Degree-zero extraction
uses only mu=-alpha-beta, and yields

```math
f^a_{z,h,\alpha}(E-\alpha)
d^\delta_{z,hc,-\alpha-\beta}(E+\beta)
b^b_{z,h,\beta}(E).                                   \tag{4}
```

Only finitely many coefficients occur. Evaluate E at a complex
tuple t avoiding their poles. For each fixed (z,h,alpha,beta), the
entire c-sum in (1) becomes

```math
\left(\sum_a f^a_{z,h,\alpha}(t-\alpha)A_a\right)
\otimes
\left(\sum_b b^b_{z,h,\beta}(t)B_b\right)
\otimes
\left(\sum_{c,\gamma,\delta}
 \Gamma^z_{\gamma,hc}
 d^\delta_{z,hc,-\alpha-\beta}(t+\beta)
 C_\gamma D_\delta\right).                             \tag{5}
```

This has AB-versus-CD matrix rank at most one. Summing (5) proves
(2). The D operators need not commute or have finite weight support.
The independence of the target D_(ij) tags proves (3).

## Rational difference version

The same conclusion applies to commuting translations
T_alpha f(q)=f(q+eta*alpha)T_alpha and finite outside translation
supports. In left-normal form the degree-zero coefficient of

```math
a(q)T_\alpha\,d_\mu(q)T_\mu\,b(q)T_\beta
```

is

```math
a(q)d_{-\alpha-\beta}(q+\eta\alpha)b(q-\eta\beta).       \tag{6}
```

Again, fixing z,h,alpha,beta and evaluating q generically leaves
one rank-one AB factor and one CD vector. Arbitrary rational
difference D operators are handled by their iterated skew Laurent
expansions, exactly as in the Weyl proof.

## Path scope

If each A column has one accumulated H-dependent shift and each
B column has one shift, its contribution to (2) is one, even when
the union of shifts over all H has Q distinct elements. Opposite
shifts are a special case; they force the relevant D shift to be
zero. Hence a family of single-shift path residues from Q unit
columns has bound rQ. A large scalar coefficient-row span does
not remove this obstruction.

The bound does not say that every fused difference matrix has
one shift per source column. The full site-oriented Lax matrices
may retain p independent site-subset shifts in each column, and
must be counted accordingly.

For a coupled Frobenius source, one cannot group its independent
A and B basis labels as a shared h. One may use this argument only
after stating an actual constant rank-one source decomposition
and computing the supports of the resulting A and B column images.
Those supports can be larger than the supports in the original
coupled basis.
