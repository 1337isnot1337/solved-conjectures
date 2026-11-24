# Roots-of-unity filters and explicit block incidences

Status: research audit. The constructions below prove that the immediate block-product and zero-pattern routes do not represent the filtered resultant. They do not exclude an incidence with additional cross-block coupling.

## 1. The filtered polynomial

Let D_N(A) denote the resultant of the N quadratic forms (A z^2)_i for a symmetric order-three tensor A, normalized by D_N(I)=1. Let omega be a primitive cube root of unity. For a grid-supported tensor A, define

```math
R_j(t,A)=D_N(I+\omega^j tA),\qquad
S(t,A)=\frac13\sum_{j=0}^2\omega^{-j}R_j(t,A).
```

For BCJS grid parameters m=3^r+1, s=m^2 and N=5s, the coefficient argument of its Lemmas 3.6 and 3.7 implies that the first possible nonzero degree of S in t is s. The coefficient of that degree is a known nonzero scalar times the grid assignment sum. After the paper's permanent projection and normalization, it is the permanent.

This explains why S is an attractive boundary candidate. A polynomial-size circuit for R would make S available by three evaluations. A polynomial-size NP incidence for V(R) does not supply these evaluations.

## 2. What the block construction actually defines

For j in {0,1,2}, write

```math
F_{j,i}(t,A,z^{(j)})=
\bigl((I+\omega^j tA)(z^{(j)})^2\bigr)_i,
\qquad 1\le i\le N.
```

Consider the following explicit existential system, with 6N witness coordinates z^(j),u^(j):

```math
F_{j,i}(t,A,z^{(j)})=0\quad(0\le j\le2,\ 1\le i\le N),
\qquad
\sum_{j=0}^2\sum_{i=1}^N u^{(j)}_iz^{(j)}_i=1.
```

Each block can be zero. The normalization requires at least one block to be nonzero. Therefore the projected language is exactly

```math
V(R_0)\cup V(R_1)\cup V(R_2)
=V(R_0R_1R_2).
```

Proof. A solution has a nonzero z-block, which is a common nonzero root of that block's forms. Conversely, if one block has a common nonzero root, set the other blocks to zero and choose a dual vector u on the nonzero block to make the normalization one.

The same conclusion follows from the block resultant identity

```math
D_{3N}\bigl(\mathop{\mathrm{diag}}(I+tA,I+\omega tA,I+\omega^2tA)\bigr)
=\prod_{j=0}^2 R_j(t,A)^{2^{2N}}.
```

The exponent is forced by multihomogeneity: the full resultant has degree 2^(3N-1) in one equation's coefficients, while a block resultant has degree 2^(N-1). The identity is first established for independent generic blocks, whose resultants are irreducible; normalization at diagonal square systems fixes the scalar. Specialization then gives the displayed formula.

If instead each block is given its own normalization

```math
\sum_i u^{(j)}_iz^{(j)}_i=1\qquad(0\le j\le2),
```

the projection becomes the intersection of the three zero sets. Nonzero scalar weights on equations change neither the union nor the intersection. In particular the coefficients omega^(-j) in S cannot be encoded by merely rescaling the separate blocks.

## 3. An exact zero-pattern obstruction

There is no Boolean function B of three bits such that, on every grid-supported A and t,

```math
[S(t,A)=0]
=B\bigl([R_0(t,A)=0],[R_1(t,A)=0],[R_2(t,A)=0]\bigr).
```

At A=0, all three R_j equal one while S=0.

For a contrasting family, let A_* have value one in every allowed symmetric grid coordinate and zero elsewhere. There are five labels at each of the s grid positions, so its grid assignment sum is 5^s. BCJS Theorem 3.5 and Lemma 3.7 give

```math
[t^s]S(t,A_*)=\kappa_{N,m}\,5^s\ne0.
```

Thus S(t,A_*) is a nonzero polynomial. Each R_j(t,A_*) is also a nonzero polynomial, with constant term one. Choose t outside the finite root set of

```math
S(t,A_*)R_0(t,A_*)R_1(t,A_*)R_2(t,A_*).
```

Then all three R_j are nonzero and S is nonzero. Such t exists because C is infinite. More explicitly, any t transcendental over Q works: these polynomials have algebraic coefficients and are nonzero.

Both examples therefore have zero-pattern (false,false,false), but their filtered-zero answers differ. This disproves every reduction that uses only these three resultant-zero truth values, including arbitrary Boolean combinations of separate block existence tests. The proof does not presume that the three resultant values are algebraically independent.

## 4. Scope of the remaining obligation

Direct sums supply multiplicative resultant identities. They do not give addition of resultant values. An incidence asserting V(S) would need equations that connect the values of the three resultants, or a different construction whose elimination polynomial has S as a relevant factor. No such equations have been produced here.

This is not a general impossibility theorem for coupled incidence systems. Arbitrary polynomial equations coupling the three blocks can define new projected sets and fall outside the zero-pattern argument. Their correctness must be proved from actual witness equations; it cannot be inferred from closure of NP_C under union or intersection.

Even an NP_C incidence for V(S) would leave the next proof obligation: show that a generic HN-decider branch exposes a small nonzero multiple of a component whose multiplier-preserving degeneration carries the permanent graph. The fact that the trailing coefficient of S is a permanent is useful, but the variable y and the graph factor must still be supplied explicitly.

## 5. Independent check of the single-triangle Newton obstruction

For one symmetric coordinate a with three distinct indices, write q=2a. On the active three-dimensional block the forms are

```math
x^2+qyz,\qquad y^2+qxz,\qquad z^2+qxy.
```

At z=1, the affine quotient has basis (1,x,y,xy), with x^2=-qy and y^2=-qx. Multiplication by xy sends the basis vectors to

```math
xy,\qquad q^2x,\qquad q^2y,\qquad q^2xy.
```

Hence the determinant of multiplication by 1+qxy is (1+q^3)^3. The first two forms have no common projective point at z=0, so the normalized Poisson formula applies and gives the same resultant. Each inactive square variable contributes a two-dimensional quotient factor and squares this norm. Therefore

```math
D_N(I+A)=(1+8a^3)^{3\cdot2^{N-3}}.
```

The pure-axis exponent is K=9*2^(N-3). If a desired grid-assignment exponent vector u has s unit entries and s<K, then

```math
u=\left(1-\frac{s}{K}\right)0
+\sum_{a\in\mathop{\mathrm{supp}}u}\frac1K(K e_a).
```

All coefficients are positive. Every minimizing weight face containing u must contain the origin. This proves the incidence agent's claim for direct coordinate weights before the permanent projection.

The conclusion only prevents literal initial-form extraction of the assignment component while excluding the constant. It does not rule out an initial polynomial with a nontrivial hard factor, further affine substitutions causing cancellations, or a different incidence construction.

## 6. A concrete sufficient additive-incidence target

The unknown normalization scalar in the coefficient projection can be avoided by comparing to the identity matrix. This leads to a precise conditional route using a constant number of resultant values.

Let X be an n by n matrix. Use BCJS Lemma 3.3 to construct, uniformly in polynomial time, grid tensors A_m(X) and A_m(I_n) with

```math
H_m(A_m(X))=\mathop{\mathrm{per}}_n(X),\qquad
H_m(A_m(I_n))=1,
```

where m=O(n), s=m^2 and N=5m^2. Let S be the filter in Section 1, and define

```math
F_n(t,X,y)=S(t,A_m(X))-yS(t,A_m(I_n)).
```

This is a linear combination of six resultant values. Only the constants 1/3 and omega are needed in constructing the coefficients and tensors. The grid coefficient theorem gives

```math
F_n(t,X,y)
=t^s\left(\kappa_{N,m}(\mathop{\mathrm{per}}_n(X)-y)
+tB_n(t,X,y)\right),
\qquad \kappa_{N,m}\ne0.
```

There is no need to compute kappa. In fact the next possible filtered degree is s+3, but the displayed weaker remainder suffices.

### Conditional proposition

Suppose the languages V(F_n) admit a uniform polynomial-size NP_C incidence. Then, relative to the imported permanent border lower bound, HN_C is outside P_C.

Proof. Assume HN_C is in P_C. The hypothetical incidence gives polynomial-time deciders for V(F_n). Factor F_n in the unique factorization domain C[t,X,y] as

```math
F_n=c\,t^s\prod_{i=1}^r H_i^{e_i},
```

with c nonzero, every H_i irreducible and not divisible by t. Every H_i(0,X,y) is a nonzero polynomial. Comparing lowest t-coefficients gives

```math
c\prod_{i=1}^r H_i(0,X,y)^{e_i}
=\kappa_{N,m}(\mathop{\mathrm{per}}_n(X)-y).
```

The polynomial per_n(X)-y is irreducible, since it is linear and monic up to sign in y. Unique factorization therefore gives exactly one index i with

```math
e_i=1,\qquad
H_i(0,X,y)=c_i(\mathop{\mathrm{per}}_n(X)-y),\qquad c_i\ne0,
```

and all other specialized factors are nonzero constants. Denote that factor H.

The generic accepting branch along the component V(H) of V(F_n) exposes a nonzero polynomial P=HQ with a polynomial-size arithmetic circuit. The component need not be identified algorithmically: a nonuniform consequence is sufficient to contradict the circuit lower bound. The generic-branch proof applies because a generic point of V(H) is accepted, while a generic point of ambient space is rejected.

Normalize the circuit for P(epsilon,X,y) by the lowest epsilon power in its output. Border complexity permits this scalar Laurent monomial. Its limit is

```math
\mathop{\mathrm{tc}}_t P
=H(0,X,y)\mathop{\mathrm{tc}}_t Q,
```

a nonzero polynomial divisible by per_n(X)-y. This works even if Q vanishes identically at t=0, because its first nonzero coefficient is used. The output's border complexity remains polynomial. The degree-dependent approximate factor theorem then gives polynomial border complexity for per_n(X)-y, whose degree is n. Specializing y=0 contradicts the imported permanent border lower bound. This proves the conditional proposition.

An even more general sufficient assumption is uniform NP_C membership for the zero set of a six-term weighted sum of N-variable quadratic resultants, with the six coefficients and systems supplied as inputs. The tensor specialization above is then a uniform polynomial reduction.

No incidence for V(F_n), and no six-term additive resultant-value verifier, has been constructed here. Separate block incidences from Section 2 do not meet the assumption. The proposition identifies a concrete missing construction; it does not assert closure of resultant values under addition in NP_C.
