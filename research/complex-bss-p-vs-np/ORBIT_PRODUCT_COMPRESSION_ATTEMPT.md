# Orbit products with large support and changing multiplicities

Status: failed compression route with an explicit obstruction. This constructs a complete family of invariant fibers with exponentially large generic support and nonproportional multiplicities. The available circuit construction is exponential. Section 5 proves that this particular family cannot have polynomial-size certificates for every true input under the standing border lower bound, because its polynomial identity gives a finite verifier. The weighted-protocol agent independently checked that identity and its rational-function soundness argument. This is a written review, not formal verification. All arithmetic operations in the displayed construction are charged; a resultant, norm, composition, or implicit orbit equation is not treated as a unit-cost gate.

Use the notation and digit/Ryser circuit in [SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md](SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md). Thus D=2^m, zeta is primitive, h(t)=H_X(t)-y/D, and on t^D=1 the sum of h over the full orbit is per_m(X)-y.

## 1. A product in the remaining support and multiplicity regime

Define partial orbit sums

```math
S_0(t)=0,\qquad
S_r(t)=\sum_{a=0}^{r-1}h(\zeta^a t)
\quad (1\le r\le D).
```

For a true input y=per_m(X), S_D(t)=0 at every root of unity. Define

```math
Q(t,g)=\prod_{r=0}^{D-1}\bigl(g+S_r(t)\bigr),
\qquad
W(t,g)=\prod_{r=0}^{D-1}\bigl(g+S_r(t)\bigr)^{r+1}.       \tag{1}
```

The degree in g of Q is D, and that of W is D(D+1)/2. Both are monic in g. Their common root support is the set of negatives of the partial sums, and hence is finite and nonempty.

The identity

```math
S_r(\zeta t)=S_{r+1}(t)-h(t)
```

shows that

```math
W(\zeta t,g+h(t))
=\prod_{r=0}^{D-1}\bigl(g+S_{r+1}(t)\bigr)^{r+1}.       \tag{2}
```

When S_D(t)=S_0(t)=0, the root supports of W(t,g) and the right side of (2) are equal. Thus W is a valid certificate for the moving-fiber verifier at every true input. This argument allows collisions among partial sums; collisions change multiplicities but not equality of the supports.

### Generic support size

For a generic complex matrix X on the true graph, the D partial sums at each t are pairwise distinct. Here generic means outside one proper algebraic subset, with m fixed.

To prove this, the difference between two partial sums is the sum of h over a nonempty proper interval of the cyclic root-of-unity list. Let its length be k, where 0<k<D. At roots of unity, the Ryser term H_X is indexed by a subset of the m columns. Fix any permanent monomial, corresponding to a permutation. That monomial occurs in the full-column Ryser term with coefficient one and in no other subset term, because no proper column subset can contain every column used by the monomial. Consequently its coefficient in the interval sum of h is either

```math
-k/D\quad\text{or}\quad 1-k/D,
```

according to whether the full-column term belongs to the interval. Both coefficients are nonzero. The difference of the two partial sums is therefore a nonzero polynomial in X. There are finitely many orbit starts and pairs of partial sums, so the union of their zero loci is proper.

On this generic set, the root multiplicities of W are 1,2,...,D in their displayed order. Under one skew step they rotate to D,1,2,...,D-1 on the same root support. These vectors are not proportional for D>1: their sums agree, so proportionality would imply equality, but the entries differ. Thus this explicit family lies outside both the polynomial-support and proportional-multiplicity restrictions at generic true inputs.

This is a statement about the shape of a certificate. It does not supply a small circuit for it.

## 2. Direct circuit cost

Let s_h=O(m^2) be the charged circuit size of h. Evaluate h(zeta^a t) separately for a=0,...,D-1. The successive powers zeta^a use O(D) additional scalar operations, and the D evaluations use O(D s_h) gates. Build all S_r by prefix additions, using O(D) more gates. Form the factors g+S_r and raise the r-th factor to r+1 by binary powering, using O(m) operations per factor. Finally multiply the D powers.

This gives

```math
L(W)\le O\bigl(D(s_h+m+1)\bigr)=O(2^m m^2).             \tag{3}
```

The bound counts the D evaluations. Writing one indexed product or giving a short rule for its factors does not reduce this arithmetic-circuit count. The definition has O(m)-bit index ranges but exponential product length.

## 3. Binary recursion and the cost of substituted copies

For k=2^j define

```math
T_j(t)=S_k(t),\qquad
Q_j(t,g)=\prod_{r=0}^{k-1}(g+S_r(t)),\qquad
W_j(t,g)=\prod_{r=0}^{k-1}(g+S_r(t))^{r+1}.
```

The base is T_0=h, Q_0=g, W_0=g. Set t'=zeta^k t and g'=g+T_j(t). Then

```math
T_{j+1}(t)=T_j(t)+T_j(t'),
```

```math
Q_{j+1}(t,g)=Q_j(t,g)Q_j(t',g'),
```

and

```math
W_{j+1}(t,g)
=W_j(t,g)W_j(t',g')Q_j(t',g')^{k}.                       \tag{4}
```

These equations are exact and use only ordinary arithmetic operations. The exponent k in the last line costs j squarings. The two argument tuples (t,g) and (t',g') are different. An arithmetic-circuit DAG does not obtain the second evaluation of an arbitrary subcircuit for free; it needs a substituted copy, unless a separate identity gives actual sharing.

For T_j alone, this literal construction obeys the gate-count upper recurrence

```math
L(T_{j+1})\le 2L(T_j)+O(j+1),
```

with the two copies accounting for the factor two. The corresponding simultaneous recursion for T_j,Q_j,W_j also expands exponentially. Equations (4) do not establish polynomial-size circuits merely because the recursion has depth m. Bound (3) is a simpler explicit upper bound for the final W.

### Why materializing block sums is already a hard operation

A circuit for T_m(X,y,t), constructed uniformly as a polynomial in X,y,t and zeta with polynomially many gates, would give a polynomial-size circuit for per_m(X)-y by specializing t=1 and zeta to a primitive root. Even T_(m-1) would suffice: two substituted copies give T_m. Such a symbolic construction is excluded by the standing permanent border lower bound.

This does not prove a lower bound for W by itself. A hypothetical compression might avoid representing any T_j. It also does not confuse numerical witness constants with polynomial functions of X: the certificate problem permits instance-dependent constants, while the preceding symbolic obstruction concerns an actual circuit computing T_j over all X.

There is a separate obstruction to supplying a complete small table of numerical block-sum circuits as witnesses. Suppose each true numerical input admitted polynomial-size circuits for every T_j(t). Their base identity and the recurrences for all t with t^D=1 could be checked with one Boolean universal orbit index, using all circuit coefficients as shared existential witnesses. The final identity T_m(t)=0 is checked in the same way. The recurrences determine the actual orbit sums on that finite set, so this verifier is sound. It has the excluded finite format. Therefore a complete family of small certified block-sum tables cannot supply the missing compression.

## 4. The quotient identity does not give an ordinary radical circuit

For a true input, (1) and (2) imply

```math
Q(t,g)=g^D\frac{W(t,g)}{W(\zeta t,g+h(t))}
\quad\text{in }\mathbb C(g),\qquad t^D=1.               \tag{5}
```

Indeed the numerator and denominator multiplicities differ by one at every nonzero indexed root, and at the root S_0=S_D=0 the factor g^D corrects the wrap. The identity remains valid when indexed roots collide, because it follows from the indexed products before cancellation.

If W had a small circuit, the displayed rational expression would be short. At every root of Q, however, its displayed denominator also vanishes. The circuit with this division is not an everywhere-defined polynomial-circuit certificate for Q. Removing that division without cost depending on the degree is an additional operation, not a consequence of (5). Section 5 uses the rational identity directly, so it does not need that removal.

For example, with D=2 and a nonzero S_1=s, W=g(g+s)^2 while the shifted W is g^2(g+s). Formula (5) reads

```math
g(g+s)=g^2\frac{g(g+s)^2}{g^2(g+s)}.
```

The right-hand expression is undefined at both roots even though the cancelled quotient is a polynomial. Root testing through that unreduced rational expression would remove all the intended roots. This small example isolates the domain issue; it is not a lower bound on quotient complexity.

## 5. A short identity excludes polynomial compression of this family

Set

```math
W_0=W_c(t,g),\qquad
W_1=W_c(\zeta t,g+h(t)),
```

```math
W_2=W_c(\zeta^2t,g+h(t)+h(\zeta t)).
```

For the true orbit product, Q in (5) is invariant under the skew map. Clearing its rational identity gives

```math
g^D W_0W_2=(g+h(t))^D W_1^2.                          \tag{7}
```

This identity has a small circuit whenever W does: it uses three evaluations of W, two evaluations of h, and O(m) repeated squarings. It does not use a circuit for Q, a factorization, or a trace.

### 5.1 Soundness for arbitrary candidate W

Assume (7) holds identically in g for every t with t^D=1 and every specialized polynomial W_c(t,g) is nonzero. Define the nonzero rational function

```math
F_t(g)=g^D\frac{W_c(t,g)}{W_c(\zeta t,g+h(t))}.
```

Equation (7), interpreted in the field C(g), says

```math
F_t(g)=F_{\zeta t}(g+h(t)).                            \tag{8}
```

Let d_t be the degree of W_c(t,g) in g. The exponent of the leading Laurent term of F_t at infinity is

```math
k_t=D+d_t-d_{\zeta t}.
```

Translation in g preserves this exponent. Equation (8) makes k_t constant around the orbit. Summing the displayed expression over all D roots telescopes the degrees and gives D*k_t=D^2. Thus k_t=D>0. In particular F_t is nonconstant, regardless of degree drops in individual W fibers.

After D applications of (8),

```math
F_t(g)=F_t(g+\delta),\qquad
\delta=\mathop{\mathrm{per}}_m(X)-y.
```

Write its Laurent expansion at infinity as F_t(g)=a g^D+b g^(D-1)+lower powers, with a nonzero. The coefficient of g^(D-1) in F_t(g+delta)-F_t(g) is aD*delta. Characteristic zero therefore forces delta=0. This proves soundness without assumptions on W's root supports or multiplicity vectors. Nonzero denominators are required as polynomials in C(g); pointwise zeros cause no problem in this proof.

### 5.2 Finite verification and the obstruction

Use a polynomial-size universal template W_c with p parameters and U gates, and the reciprocal parameter rho with zeta*rho=1. The residual in (7) is a polynomial in g with parameter tuple

```math
\theta=(X,y,\zeta,\rho,c,t),\qquad
M=m^2+p+4.
```

The identity-family argument supplies M+1 fixed scalar g-values testing whether this residual is zero for every parameter assignment. The same tuple can be chosen to hit every nonzero W_c(t,g): avoid the union of the two proper bad-tuple closures. Consequently the fiber-nonzero test is the finite disjunction that at least one W_c(t,g) evaluation is nonzero.

Choose zeta,rho,c existentially, encode t by m universal Boolean bits, and check (7) and the nonzero-fiber condition at that fixed tuple. The verifier has polynomial resources and needs no continuous universal g. Section 5.1 proves its soundness for all supplied coefficients. The actual orbit products from Section 1 prove completeness if they all had polynomial circuit size.

The finite-prefix theorem would then give polynomial border circuits for the permanent, contrary to the standing lower bound. Therefore the family (1) cannot supply polynomial-size certificates for every true numerical instance. The fact that its supports and multiplicities lie outside the earlier restrictions does not make it a viable compression: identity (7) gives another finite reduction.

### 5.3 General rational invariants have the same finite obstruction

More generally, suppose each true instance admits polynomial-size numerator and denominator circuits A(t,g),B(t,g) giving a nonconstant rational function F_t=A_t/B_t in each fiber and satisfying (8). Skew invariance is the polynomial identity

```math
A(t,g)B(\zeta t,g+h(t))
=A(\zeta t,g+h(t))B(t,g).
```

A parameter-family hitting tuple tests it. Nonconstancy is certified locally by two scalars u,v such that B(t,u) and B(t,v) are nonzero and

```math
A(t,u)B(t,v)-A(t,v)B(t,u)\ne0.
```

Such points exist for every nonconstant rational function over C. After Boolean-encoding t, these are polynomially many local witnesses. Iterating the rational invariance gives a nonconstant rational function with period delta. A rational function with a nonzero period cannot have a finite pole, since its translates would give infinitely many poles; without finite poles it is a polynomial, and its leading term rules out a nonzero period. Thus delta=0.

This is again a sound finite-block verifier, so a complete polynomial-size rational-invariant family is excluded. The argument does not exclude arbitrary root-set certificates: producing a short invariant rational function from a polynomial with setwise invariant roots is a further step, and is not proved in general.

## 6. Succinct local orbit equations lose the shared assignment

An explicit potential table v_0,...,v_(D-1) would satisfy

```math
v_{a+1}-v_a=h(\zeta^a),\qquad a\pmod D.                 \tag{6}
```

It exists if and only if the total sum is zero, but it contains D shared variables. Replacing the table by a separate existential pair at each universally chosen edge is unsound. Every individual edge equation has a solution for arbitrary h, including nonzero total sum.

The same failure holds for local tests that choose fewer than D distinct cycle edges and supply one consistent set of potential values only for that query. Every proper subgraph of the D-cycle is a forest. On a forest, choose one value per connected component and propagate along edges to solve all equations, with arbitrary edge increments. Thus even exact consistency inside every polynomial-size queried edge set does not impose the full cyclic sum when D is exponential. The values in different queries remain independent existential choices.

An implicit norm or resultant of the full system (6) has not removed this cost unless its ordinary arithmetic circuit, or a sound polynomial-size quantified replacement, is supplied. This is the remaining task for this construction.

## 7. What remains open in this attack

The family W gives unrestricted completeness with exponential generic support and genuinely changing, nonproportional multiplicities. Its proved circuit upper bound is exponential. The binary recursion needs substituted copies; the full orbit equations need exponentially many shared values. Its rational quotient has removable poles, but Section 5 bypasses pointwise root testing and uses a rational identity to exclude polynomial completeness for this family.

The remaining task is a different complete finite-fiber construction that has a charged polynomial circuit bound and avoids these finite identity reductions. No such construction is provided here. No implication to HN_C hardness or P_C different from NP_C follows from this note. The statements here are explicit algebraic identities, resource accounting, and a conditional obstruction to one candidate family, not a resolution of the original problem.
