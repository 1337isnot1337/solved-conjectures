# Permanent graph from incidence boundaries: reductions and obstructions

Status: research. This note does not prove `P_C != NP_C`. It records an explicit uniformly existential incidence family, the exact polynomial a generic branch can expose, a sufficient degeneration criterion that survives arbitrary extra factors, and counterexamples to two proposed coefficient extractions. The reductions below are consequences of established factor and degeneration techniques; no novelty claim is made.

## 1. Sources and their exact roles

1. Peter Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, arXiv:1812.06828v1, 17 December 2018. This is the corrected version of the 2004 FoCM paper. Lemma 1.1 relates decision and exclusion complexity. Theorem 1.3 gives a degree-dependent border-factor bound. For a factor of a polynomial whose input complexity is already border complexity, use Proposition 3.4, its proof, the reconstruction in Section 3.3 (equation (11)), and Lemma 2.3, not a claim that approximate polynomials preserve exact divisibility. URL: https://arxiv.org/html/1812.06828v1 . PDF SHA-256: `9788a3c32743bf40e5476b5f4eac87e72bcbbda2da7fd1c28288b58c9ff51204`.
2. Peter Bürgisser, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, arXiv:2606.25121v2, 19 October 2026. Theorem 1.1 proves implications from BSS separation to constant-free Valiant separation. Conjecture 1.1 states the reverse implication from VNP outside border VP to separation of the nonuniform BSS classes with complex constants. Section 1.4 explicitly identifies extending resultant hardness to arbitrary nonzero multiples as missing. The user supplied v1; v2 is a separate updated source and must not be silently substituted for it. URL: https://arxiv.org/abs/2606.25121v2 . PDF SHA-256: `7792f424e0da14ea5f47bf094a0be2fd323b5ecfa5052fa9fb285b009da233a3`.
3. C. S. Bhargav, Radu Curticapean, Gorav Jindal, Himanshu Shukla, *Multivariate Resultants: Complexity and Applications to Real Feasibility*, public 49-page manuscript downloaded 23 November 2026. Theorem 1.4 proves that polynomial-size arithmetic circuits for quadratic resultants imply VP = VNP. Theorems 1.7/3.2 and Lemma 3.7 extract the permanent from a low-order coefficient, not from an irreducible factor. URL: https://bhargavcs.github.io/files/resultants-and-etr.pdf . Official landing page: https://bhargavcs.github.io/research/resultants-and-etr . PDF SHA-256: `8827709bc587c83f36a4ee5b958a624e5fcec3d03403ad846f24cb02037f8271`.

The last manuscript is a publicly available successor to the private communication cited as [BCJS26] in Bürgisser v2. Its scope does not include hardness of arbitrary nonzero multiples of resultants.

## 2. An explicit existential resultant family

Let `n >= 1`. Write `a = (a_{i,j,k})` for the coefficients of `n` homogeneous quadratic forms in `n` variables, with `1 <= i <= n` and `1 <= j <= k <= n`:

```math
F_i(a,z)=\sum_{1\le j\le k\le n}a_{i,j,k}z_jz_k.
```

There are

```math
N_n=n\binom{n+1}{2}=O(n^3)
```

input coefficients. Define the incidence set

```math
\mathcal I_n=
\left\{(a,z,u):F_i(a,z)=0\ (1\le i\le n),\quad
\sum_{j=1}^n u_jz_j=1\right\}.
```

The last equation is equivalent to `z != 0` after existentially quantifying `u`: if `z_j != 0`, take `u_j = 1/z_j` and all other coordinates zero. Conversely its left side is zero if `z=0`.

Therefore its projection to coefficient space is exactly

```math
S_n=\{a:\exists z\ne0,\ F_1(a,z)=\cdots=F_n(a,z)=0\}.
```

The witness has `2n` complex coordinates. The displayed equations have degree at most two in the witness coordinates, and a uniform verifier evaluates them using `O(n^3)` arithmetic operations and `O(n)` equality tests. Reading the dense coefficient array costs `O(n^3)` as well. This proves directly that `(S_n)` is uniformly NP_C-definable; it also reduces it to HN_C with polynomial overhead. No roots of a known polynomial need to be computed by the verifier.

By the defining theorem for the multivariate resultant, `S_n=V(R_n)` where

```math
R_n=\mathop{\mathrm{Res}}_{2,\ldots,2}(F_1,\ldots,F_n)
```

is an irreducible polynomial over C, normalized by its value at `(z_1^2,...,z_n^2)`. Its degree in each coefficient block is `2^{n-1}` and its total degree is

```math
\deg R_n=n2^{n-1}.
```

These properties are Definition 2.1 and Lemma 2.2 of BCJS, using its convention of `n` forms in `n` variables. Bürgisser uses a shifted indexing convention in places; the formulas must not be mixed.

Thus the incidence already gives an irreducible hypersurface boundary. Its defining polynomial has exponential degree. That is the unresolved cost in direct approximate factorization.

## 3. What a generic BSS branch actually supplies

Here the arithmetic basis is `+`, `-`, multiplication, and division where defined, with equality branches and arbitrary complex constants. Every operation, equality test, and relevant input/register movement costs at least one step. The machine is total on the stated input space. A fixed input length can be unrolled to an algebraic computation tree of depth equal to its running-time bound; the number of branches need not be polynomial.

### Lemma 3.1: generic branch exclusion

Let `h` be a nonconstant irreducible polynomial in `C[x_1,...,x_N]`. Suppose a total algebraic computation tree of depth at most `T` decides `V(h)`. Then there is a nonzero polynomial `P` divisible by `h` and a division-free arithmetic circuit of size `O(T)` for `P`. The circuit may use the machine's constants and may depend on the selected input length and branch.

**Proof.** Run the tree symbolically on the generic point of `V(h)`, equivalently over the function field of `C[x]/(h)`. At each visited test, a rational function in that field is either zero or nonzero. Each nonzero answer and each divisor that is nonzero generically excludes a proper closed subset of `V(h)`. Every finite path prefix is therefore realized on a nonempty relatively open subset of `V(h)`. Totality and the time bound on complex inputs force this symbolic path to halt within `T` steps and prevent an undefined divisor. The generic path ends in acceptance.

Along this path, represent each register by a pair of polynomial circuits `(p,q)` meaning `p/q`. For addition use `(p_1q_2+p_2q_1,q_1q_2)`, for subtraction the analogous formula, for multiplication `(p_1p_2,q_1q_2)`, and for division `(p_1q_2,q_1p_2)`. Shared subcircuits are retained. This uses a constant number of gates per machine arithmetic operation. Equality between registers can be replaced by an equality-to-zero test of their difference.

Suppose every zero answer on the path had an identically zero numerator as a polynomial in the ambient variables. All remaining branch conditions and all valid divisors would be nonvanishing conditions on nonzero ambient polynomials. Those conditions hold on a nonempty ambient open subset. That open set meets the complement of the proper hypersurface `V(h)`. Such a point would follow the accepting path, contradicting correctness. Hence some zero answer has a numerator `P` that is a nonzero ambient polynomial. It vanishes on a dense relatively open subset of `V(h)` and consequently on all of `V(h)`. The Nullstellensatz and irreducibility imply `h | P`. The prefix of the simulated branch is an `O(T)` circuit for `P`. ∎

This is the content of Bürgisser's Lemma 1.1, with explicit denominator accounting. Undefined divisions cannot create an exception: along the selected generic path, each actual divisor is nonzero in the function field.

Applying the lemma to `S_n` gives

```math
P_n=R_n^{e_n}H_n\ne0,\qquad e_n\ge1,
\qquad L(P_n)=O(T(N_n)),
```

where `H_n` is arbitrary, with `R_n` not dividing `H_n` if `e_n` is chosen maximally. The branch does **not** supply a circuit for `R_n` itself or its value.

Bürgisser's factor bound is polynomial in `deg R_n` as well as in `L(P_n)`. Since `deg R_n=n2^{n-1}`, this only gives an exponential-in-`n` border upper bound for `R_n` when `T` is polynomial. It does not give the polynomial-size circuit hypothesis of BCJS Theorem 1.4.

The same branch argument holds for an essential hypersurface boundary of a constructible language: it suffices that the generic output on that hypersurface differs from the generic output in ambient space. For a component of higher codimension, a tested polynomial need only belong to the component's ideal. There is no automatic divisibility by any chosen elimination polynomial.

## 4. The BCJS coefficient, and why multiplication changes it

BCJS defines the tensor determinant `Det_N(A)` as the resultant of the quadratic forms `(Az^2)_i`. The identity tensor satisfies `Det_N(I)=1`. Set

```math
\Phi_{N,s}(A)=[t^s]\mathop{\mathrm{Det}}_N(I+tA).
```

Theorem 3.2 takes a grid side `m=3^r+1`, with `m` comparable to the size of the permanent instance, and sets `N=5m^2`, `s=m^2`. Lemmas 3.3, 3.7 and the normalization in the proof of Theorem 3.2 give a p-projection `A=A_m(X)` with

```math
[t^s]\mathop{\mathrm{Det}}_N(I+tA_m(X))
=\mathop{\mathrm{per}}_k(X).
```

Here `k` is the original matrix dimension and `m=O(k)`. More precisely, choose `m=3^r+1>k+1` and apply the grid construction to `diag(X,kappa^{-1})`, where `kappa` is the known nonzero integer coefficient from BCJS Theorem 3.5. This absorbs the normalization without changing `N=5m^2`. The reduction is nonuniform and permits rational constants.

For a circuit computing the resultant itself, truncating the circuit in `t` through degree `s` costs a polynomial factor in `s`, independently of the resultant's full exponential degree. This is precisely the homogenization step in the proof of BCJS Theorem 1.4.

For `P=R^eH`, however,

```math
[t^s]P(I+tA)
=\sum_{i=0}^{s}[t^i]R(I+tA)^e\,[t^{s-i}]H(I+tA).
```

The extra terms are not known and need not vanish.

### Lemma 4.1: finite jets can be masked by a multiplier

Let `R(t,x)` be any polynomial over C with `R(0,x)=1`. For every integer `d >= 0`, define

```math
H_d(t,x)=\sum_{j=0}^{d}(1-R(t,x))^j.
```

Then `H_d` is a nonzero polynomial with constant term one, and

```math
R H_d=1-(1-R)^{d+1}\equiv1\pmod {t^{d+1}}.
```

**Proof.** This is the finite geometric-sum identity. Since `t | (1-R)`, its `(d+1)`st power is divisible by `t^{d+1}`. ∎

The same statement applies to `R^e` because it too has constant term one. Consequently no identity that recovers the permanent simply as the selected positive Taylor coefficient of an **arbitrary** multiple can hold. Choosing `d=s` erases that coefficient exactly.

This lemma does not construct small circuits for `R H_d` when `R` is hard. It is not a disproof of Bürgisser's Conjecture 1.1 or of a possible structured argument using the small circuit for a multiple. Its role is narrower: it disproves unconditional transfer of the coefficient identity from `R` to `RH`.

### A constant-size roots-of-unity filter does not remove the issue

For the grid support of BCJS Lemma 3.7, the proof also implies that the first possible degree congruent to one modulo three is `s=m^2`. Indeed the triangle multiplicities `b_{ij}` in a monomial are all congruent modulo three by Lemma 3.6. Their sum has the same residue, since `m^2=1 mod 3`. If that sum is `1 mod 3`, all `b_{ij}>=1`, so the degree is at least `m^2`.

For a primitive cube root of unity `omega`, the filter

```math
\Pi_1 R(t)=\frac13\sum_{j=0}^{2}\omega^{-j}R(\omega^j t)
```

retains exactly the degrees congruent to one modulo three. Thus after the BCJS specialization, its trailing coefficient is the permanent, up to the stated normalization. But this is a filter of a sum of three **values of R**. It is not a multiplicative valuation and it does not commute with an arbitrary multiplier. Lemma 4.1 with `d=s` shows that applying the same filter to `RH_d` erases the desired term. No polynomial-size existential system for the zero set of this filtered resultant has been supplied.

### Lemma 4.2: the grid component is not a coordinate-weight face excluding the constant term

Work with the independent symmetric tensor coordinates allowed by the grid support, before the further p-projection `A=A_m(X)`. Let `N>=3`, and fix one allowed coordinate `a=a_{ijk}` with three distinct indices. If all other entries of `A` are zero, then

```math
\mathop{\mathrm{Det}}_N(I+A)
=(1+8a^3)^{3\cdot2^{N-3}}.
```

**Proof of the identity.** Relabel the indices as `1,2,3`. Put `q=2a`. For `N=3` the three quadratic forms are

```math
z_1^2+qz_2z_3,\qquad
z_2^2+qz_1z_3,\qquad
z_3^2+qz_1z_2.
```

Dehomogenize at `z_3=1`. For `q!=0`, the first two equations have four simple solutions: the origin and three solutions with `z_1^3=-q^3` and `z_2=-z_1^2/q`. At the three nonzero solutions, `z_1z_2=q^2`, so the third form takes value `1+q^3`; at the origin it takes value one. The first two forms have no common projective zero on `z_3=0`. The Poisson product formula therefore gives `(1+q^3)^3`. Equality for every `q` follows by polynomial identity.

Adding one unused variable with its square as an additional equation squares the previous resultant. To prove this identity, first keep the old homogeneous quadratic forms generic. The zero set of the new resultant specialized to these old forms and the additional square is exactly the zero set of the old generic resultant, which is irreducible. Its degree in each old coefficient block has doubled, so it equals the square of the old resultant up to a scalar. The normalization at diagonal squares fixes that scalar as one. Only then specialize the old coefficients to the displayed three-variable system. Repeating for `N-3` unused variables gives the formula. ∎

In particular the Newton polytope of `Det_N(I+A)` contains the origin and `K e_a` for every allowed triangle coordinate, where

```math
K=9\cdot2^{N-3}.
```

A grid-assignment monomial in BCJS has exponent vector `u` with exactly `s=m^2` unit entries. For its parameters, `s<K`, and

```math
u=\left(1-\frac{s}{K}\right)0
+\sum_{a\in\mathop{\mathrm{supp}}u}\frac1K(K e_a).
```

Every displayed coefficient is positive. Therefore if a linear weight attains its minimum on the Newton polytope at `u`, it also attains that minimum at the origin: a proper convex combination can attain an extreme value only if every point used in it does. Any weight face containing even one desired grid-assignment monomial also contains the constant monomial.

Thus weighting these independent tensor coordinates cannot isolate the degree-`s` grid polynomial as an initial form without the constant term. This assertion is restricted to this direct weight construction. It does not exclude additional affine specializations and cancellations, different polynomial substitutions, or a different resultant with a hard factor.

## 5. A degeneration criterion that does survive every multiplier

The preceding obstruction concerns interior coefficients or linear filters. A genuine initial-form factor would be sufficient, and possible annihilation of a multiplier under specialization can be repaired.

For a nonzero polynomial in `x` over `C(epsilon)`, let `tc_epsilon` mean the first nonzero Laurent coefficient, with the valuation taken across its finitely many coefficients in `x`.

### Proposition 5.1: preservation under a generic transverse perturbation

Let `R(a)` be a nonzero polynomial. Suppose a substitution

```math
a=\phi_\epsilon(x),\qquad
\phi_\epsilon\in\mathbb C(\epsilon)[x]^N
```

has an arithmetic circuit of size `S` over `C(epsilon)` and satisfies `R(phi_epsilon) != 0`. Suppose a nonconstant irreducible polynomial `g(x)` of degree `d` divides `tc_epsilon R(phi_epsilon)`.

If `P=R^eH != 0`, `e>=1`, has a circuit of size `T`, then there exists a nonzero polynomial `Q(x)` divisible by `g` whose border complexity is at most `T+S+O(N)`. Consequently

```math
\underline L(g)\le (T+S+N+d)^{O(1)}.
```

The constants, substitution, and extracted factor may depend nonuniformly on the dimension and on the circuit for `P`. No bound on `deg R`, `deg H`, `e`, or the Laurent valuation is required for this border-complexity assertion.

**Proof.** Choose a new parameter `delta` and a vector `b in C^N` so that

```math
H(\phi_\epsilon(x)+\delta b)\ne0.
```

Such a vector exists. Specialize `epsilon` and `x` at any values where `phi` is defined, obtaining a point `a_0`. Since `H` is a nonzero polynomial, some `b` satisfies `H(a_0+b) != 0`. Thus the displayed polynomial is nonzero already at `delta=1` for those specialized parameters.

Because `R(phi_epsilon) != 0`, the `delta`-valuation of `R(phi_epsilon+delta b)` is zero. Write

```math
H(\phi_\epsilon(x)+\delta b)=\delta^q C(\epsilon,x)
+O(\delta^{q+1}),\qquad C\ne0.
```

Then

```math
\mathop{\mathrm{tc}}_\delta
 P(\phi_\epsilon(x)+\delta b)
=R(\phi_\epsilon(x))^e C(\epsilon,x).
```

Taking `epsilon`-trailing coefficients in the integral domain of Laurent series gives

```math
Q(x)=
\bigl(\mathop{\mathrm{tc}}_\epsilon R(\phi_\epsilon(x))\bigr)^e
\mathop{\mathrm{tc}}_\epsilon C(\epsilon,x)\ne0.
```

In particular `g | Q`.

The circuit for `P(phi_epsilon+delta b)` has size `T+S+O(N)`. Multiplying by `delta^{-q}` and taking the first limit costs at most one additional gate in border complexity; multiplying by the necessary power of `epsilon` and taking the second limit costs at most one more. Iterated limits are combined by Bürgisser Lemma 2.3(1),(3); equivalently substitute `delta=epsilon^M` for a sufficiently large `M` after the relevant valuation normalizations. Powers of the deformation parameter are permitted as constants in the border model. Thus `Q` has the claimed border-complexity bound.

Finally apply the factor-from-border-input bound obtained from Bürgisser Proposition 3.4 and Section 3.3. Its proof uses the actual exact factor `g | Q` and the bound on `underline L(Q)`. It does not assume the approximants to `Q` are divisible by `g`. ∎

For the permanent graph, the decisive missing construction is therefore explicit:

```math
\exists\ \text{polynomial-size }\phi_{m,\epsilon}(X,y)
\quad\text{such that}\quad
R_{q(m)}(\phi_{m,\epsilon})\ne0,
\quad
y-\mathop{\mathrm{per}}_m(X)
\mid\mathop{\mathrm{tc}}_\epsilon
R_{q(m)}(\phi_{m,\epsilon}),
```

with `q(m)` and the substitution size polynomially bounded. If these substitutions existed, Lemma 3.1, Proposition 5.1, and the permanent border lower bound would rule out polynomial-time HN_C. The present note supplies no such substitution. The BCJS interior-coefficient projection is not one.

## 6. Explicit matching witnesses produce a norm, not a sum

It is useful to see the gap in a completely specified incidence system. Given `X=(X_ij)` and `y`, use witnesses `b_ij`, `v_0,...,v_m` and equations

```math
b_{ij}^2-b_{ij}=0,\qquad
\sum_j b_{ij}=1,\qquad
\sum_i b_{ij}=1,
```

```math
v_0=1,\qquad
v_i=v_{i-1}\sum_j b_{ij}X_{ij}\quad(1\le i\le m),
\qquad v_m=y.
```

Over C the first equations force Boolean values. The row and column equations make `b` a permutation matrix. Hence this uniformly NP_C-definable projection is

```math
E_m=\left\{(X,y):\exists\sigma\in S_m,
y=\prod_{i=1}^mX_{i,\sigma(i)}\right\}.
```

There are `m^2+m+1` witnesses, `O(m^2)` equations, and a verifier using `O(m^2)` arithmetic operations. Each equation has degree at most two in the witnesses, with `X` treated as input coefficients. Thus this example does not fail on encoding size.

Write `w_sigma(X)=prod_i X_{i,sigma(i)}`. The projection is exactly the closed set

```math
E_m=V\left(N_m(X,y)\right),\qquad
N_m(X,y)=\prod_{\sigma\in S_m}(y-w_\sigma(X)).
```

The distinct irreducible boundary components have generators `y-w_sigma(X)`, each with a linear-size circuit. Its next-to-leading coefficient is

```math
[y^{m!-1}]N_m(X,y)
=-\sum_{\sigma\in S_m}w_\sigma(X)
=-\mathop{\mathrm{per}}_m(X).
```

Consequently the permanent is present as a coefficient of a norm polynomial, not as one of the boundary components.

For example, if every entry of `X` is one, every `w_sigma=1` whereas `per_m(X)=m!`. For `m>=2`, the genuine permanent graph point `(X,m!)` is absent from `E_m`. With

```math
X=\begin{pmatrix}1&1\\1&-1\end{pmatrix},
```

the two matching weights are `-1` and `1`, and the permanent is zero. A nonzero matching term still exists. Neither existence of a term nor existence of a nonzero term verifies the weighted sum on arbitrary complex inputs.

Reciprocal scaling does put the permanent in a low-order jet:

```math
t^{m!}N_m(X,1/t)
=\prod_{\sigma\in S_m}(1-tw_\sigma(X))
=1-t\mathop{\mathrm{per}}_m(X)+O(t^2).
```

But if only a multiple `F=N_mH` is available, the reciprocal polynomial has the form

```math
\bigl(1-t\mathop{\mathrm{per}}_m(X)+O(t^2)\bigr)
\bigl(h_0(X)+th_1(X)+O(t^2)\bigr),
```

whose coefficient of `t` is `h_1-h_0 per_m`. The unknown multiplier contributes at the same order. Reciprocal scaling therefore fixes the location of the coefficient, not its separation from the multiplier.

### A restricted degeneration obstruction

Suppose a nonzero product of term-graph polynomials is subjected to a substitution of polynomial circuit size over `C(epsilon)`, whose coordinates are polynomials in the new input variables, and every substituted factor remains nonzero. Each substituted factor has a small circuit over `C(epsilon)`, so its normalized `epsilon`-trailing coefficient has polynomial border complexity. Since

```math
\mathop{\mathrm{tc}}_\epsilon\prod_\sigma f_\sigma
=\prod_\sigma\mathop{\mathrm{tc}}_\epsilon f_\sigma,
```

every irreducible factor of the initial product divides one factor on the right. A polynomial-degree target factor therefore has polynomial border complexity by the border-factor theorem. Subject to these stated bounds, merely taking such a degeneration of this term norm cannot create a permanent-graph factor that violates the permanent border lower bound. This is a restriction on this explicit product-of-easy-factors construction, not on general irreducible resultants.

## 7. A limitation of projecting a hypersurface boundary

### Lemma 7.1: a hypersurface projecting into another hypersurface is a cylinder

Let `pi:A^M -> A^N` be a surjective affine linear map over C. Let `G=V(g)` be an irreducible hypersurface in `A^N`, and let `B` be an irreducible hypersurface in `A^M`. If `pi(B)` is contained in `G`, then

```math
B=\pi^{-1}(G).
```

**Proof.** Choose affine linear coordinates so that `pi` is the coordinate projection. Then `g` remains irreducible after adjoining the omitted variables: the quotient polynomial ring is a polynomial ring over the domain `C[x]/(g)`. The irreducible defining polynomial `b` of `B` divides `g circ pi`, since the latter vanishes on `B`. Both are irreducible, so they differ by a nonzero scalar and have the same zero set. ∎

Thus a codimension-one boundary whose affine projection is the permanent graph must already be a permanent-graph cylinder. For a component of higher codimension, an easy equation may hide the difficult projected equation: `B=V(z,y-per_m(X))` lies in the easy hyperplane `z=0`. A generic branch producing some polynomial vanishing on `B` does not by itself expose `y-per_m(X)`.

This lemma concerns geometric affine projection of varieties. It is not a statement about coefficient p-projections of polynomial families, and it does not cover nonlinear maps or projection after intersecting with additional equations.

This does not rule out incidence or elimination approaches. It specifies what must be proved: either a genuine hard hypersurface boundary, a multiplier-preserving initial-form factor as in Proposition 5.1, or a separate complexity-controlled elimination theorem for a higher-codimension component.

## 8. Unresolved implication

The following established chain stops at its final arrow:

```math
\mathrm{HN}_{\mathbb C}\in\mathrm P_{\mathbb C}
\Longrightarrow
L(P_n)=n^{O(1)}\text{ for some }0\ne P_n\in(R_n)
\quad\not\Longrightarrow_{\text{proved here}}\quad
\underline L(\mathop{\mathrm{per}}_m)=m^{O(1)}.
```

BCJS Theorem 1.4 supplies the last consequence when a small circuit for `R_n` itself is given. The explicit initial-form construction in Section 5 would extend it to arbitrary multiples and finish this route. Its existence has not been proved. All claims in this note remain research reductions or recorded failed attacks, not a resolution of the target problem.
