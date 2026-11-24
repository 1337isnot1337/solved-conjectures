# Linear potential templates and sparse potentials

Status: proved reduction using the generic-branch and approximate-factor arguments, independently checked in discussion by the graph-hardness worker. The sparsity lower bounds in Section 5 are unconditional. The later `CRITICAL_INCIDENCE_BARRIER.md` excludes the general all-instance polynomial-size hypothesis as well; the elementary restrictions proved here remain useful independent consequences. This note does not prove a BSS separation. No novelty claim is made.

## 1. A complete linear template would be too strong

Let `R_(X,y)` and the Boolean flips `T_i` be as in `BOOLEAN_POTENTIALS.md`. Fix, for each dimension `m`, a linear template

```math
Q_i(X,y,c;b)=Q_{i0}(X,y;b)
 +\sum_{k=1}^p c_k Q_{ik}(X,y;b),\qquad 1\le i\le m.
                                                               \tag{1}
```

Assume the entire collection of basis polynomials `Q_ik` has division-free arithmetic-circuit size polynomial in `m`, and `p` is polynomial in `m`. The basis circuits are fixed functions of `(X,y,b)`, with arbitrary dimension-dependent complex constants allowed. The unknown coefficients `c_k` may depend arbitrarily on the numerical instance; no efficient procedure for finding them is assumed.

The proposed completeness assertion is that, for every true numerical instance `y=per_m(X)`, there is a coefficient tuple `c` satisfying

```math
R_{X,y}(b)=\sum_i\bigl(Q_i(X,y,c;b)-Q_i(X,y,c;T_i b)\bigr)
\qquad(b\in\{0,1\}^m).                              \tag{2}
```

**Proposition.** This assertion implies polynomial border complexity of the permanent. Subject to the imported permanent border lower bound, no such polynomial-size complete linear template exists.

The restriction on the basis matters. If the basis itself could depend on arbitrary unknown instance-specific constants outside the linear coefficient tuple, it would no longer be the template in (1).

## 2. Selecting only polynomially many equations for a linear system

For fixed `(X,y)`, the conditions (2) form a linear system

```math
M(X,y)c=r(X,y),
```

with `2^m` rows and `p` columns. Each individual row is computed by evaluating the known basis circuits at one Boolean vector and its coordinate flips. It therefore has polynomial arithmetic complexity.

Let

```math
F(X,y)=y-\mathop{\mathrm{per}}_m(X),\qquad
G=V(F),\qquad K=\mathbb C(G).
```

The graph is irreducible. The completeness hypothesis implies consistency of the linear system over `K`. Otherwise its augmented matrix would have larger generic rank than `M`, and that rank inequality would hold on a nonempty Zariski-open subset of `G`, giving true numerical inputs with no solution.

Let `k` be the rank over `K`. If `k>0`, choose `k` row indices `I` and `k` column indices `J` such that

```math
D(X,y)=\det M_{I,J}(X,y)
```

is nonzero in `K`. Set

```math
c_J=M_{I,J}^{-1}r_I,\qquad c_{\{1,\ldots,p\}\setminus J}=0.
                                                               \tag{3}
```

The selected columns form a column-space basis over `K`. Since the full system is consistent, its right-hand side lies in their span; the selected invertible row minor determines its unique coordinates. Thus (3) solves every Boolean equation over `K`, not only the selected rows. If `k=0`, consistency gives `r=0` over `K`, and take `c=0`.

Only polynomially many entries of `M` are evaluated in (3). Matrix inversion or Cramer's rule supplies rational coefficient functions computed by polynomial-size circuits. Their denominators are nonzero on a dense open subset of `G`, because the chosen minor is nonzero in `K`. The Boolean row indices are selected nonuniformly for this proof; finding them efficiently is not required.

This is the important distinction from a general nonlinear certificate system. For a linear system, a maximal independent row-and-column minor suffices. There is no need to compute a generic linear combination of exponentially many equations.

## 3. A small nonzero multiple of the graph equation

Substitute the rational functions (3) into the template. For every fixed Boolean vector `b`, define the ambient rational residual

```math
E_b(X,y)=R_{X,y}(b)
-\sum_i\bigl(Q_i(X,y;b)-Q_i(X,y;T_i b)\bigr).
```

Each has a polynomial-size rational circuit and vanishes on a dense open subset of `G`. Summing over the Boolean cube as a mathematical identity gives

```math
\sum_b E_b(X,y)=\mathop{\mathrm{per}}_m(X)-y.
```

The right-hand side is nonzero in the ambient rational-function field. Hence some `E_b` is nonzero there. The proof chooses such a Boolean vector; it does not compute the exponential sum.

Clear the divisions of this one residual gate by gate, using shared numerator-denominator pairs. The resulting nonzero numerator `N` has polynomial-size division-free circuit complexity. Its denominator is nonzero on the selected dense open subset of `G`, so `N` vanishes there and

```math
F\mid N,\qquad N\ne0.
```

The degree of `F` is `m` for `m>=1`. Bürgisser's approximate-factor theorem, arXiv:1812.06828v1, Theorem 1.3, therefore gives polynomial border complexity of `F`, and then of the permanent by setting `y=0`. This proves the proposition.

## 4. Finite choices of templates and the gradient attempt

The same conclusion holds if the numerical input may choose among finitely many linear templates of the stated polynomial size. For each fixed template, feasibility of its linear system is a constructible condition, expressed by rank equalities. If finitely many such feasibility sets cover `G`, one is dense in `G`. Its system is consistent over `C(G)`, and the argument above applies to that template. The number of templates need not be polynomial, because the proof selects one nonuniformly and never evaluates the entire collection.

Consequently no complete polynomial-size scheme can use merely a polynomial list of fixed basis polynomials with unknown linear coefficients, even if those coefficients are allowed arbitrary nonconstructive dependence on the numerical matrix. This includes fixed collections of row-deleted products, first derivatives, or polynomially many higher mixed derivatives, provided their joint basis circuits are small.

The explicit seven-by-seven counterexample in `GRADIENT_FLOW_ATTEMPT.md` is a concrete failure of one such scheme. This proposition explains why increasing that scheme to another polynomial-size fixed linear span cannot establish completeness for every dimension and every true input. An unrestricted circuit template has nonlinear dependence on its certificate parameters, so it is not covered by this proposition.

## 5. Sparse potentials already have an unconditional exponential obstruction

Take the identity matrix `X=I_m` and its true value `y=1`. On the Boolean cube,

```math
K_{I_m}=\delta_{\boldsymbol 1},\qquad
R_{I_m,1}=\delta_{\boldsymbol 1}-\delta_0.
```

The unique multilinear representative in the standard `b` monomial basis is

```math
\prod_{j=1}^m b_j-\prod_{j=1}^m(1-b_j).
```

It has `2^m` nonzero monomials when `m` is odd, and `2^m-1` when `m` is even. A single monomial of a potential, even with arbitrarily high exponents, restricts on the cube to a squarefree monomial `b_S`. If `i` is not in `S`, its `i`th divergence is zero. If `i` is in `S`, that divergence is

```math
b_S-(1-b_i)b_{S\setminus\{i\}}
=2b_S-b_{S\setminus\{i\}}.
```

Thus one monomial in the potentials contributes at most two multilinear monomials to the residual. If the total number of monomials in all potentials is `s`, the residual has support at most `2s`. Therefore every valid potential family for this identity-matrix instance has

```math
s\ge 2^{m-1}.
```

There is an equally direct Fourier version. With `z_j=2b_j-1`, the residual has exactly the `2^(m-1)` characters of odd support, all with nonzero coefficient:

```math
\delta_{\boldsymbol 1}-\delta_0
=2^{1-m}\sum_{|S|\ {
m odd}}\prod_{j\in S}z_j.
```

Each flip-divergence acts diagonally on these characters. Every nonzero residual character must therefore occur in at least one potential, proving a total Fourier-support lower bound of `2^(m-1)`.

Neither statement is an arithmetic-circuit lower bound. The delta-path potentials from zero to the all-ones point have a shared circuit with `O(m)` gates and satisfy this identity. Their expanded monomial or Fourier representations are large. This explicit instance shows why sparse representations cannot settle the general circuit-potential question in either direction.

## 6. Scope record

The generic-rank argument and its rank-zero and finite-template cases were independently checked by the graph-hardness worker. The argument uses the approximate-factor theorem as a separate imported result. The sparse-support proof is elementary and does not use any permanent lower bound.

This note itself excludes linear templates and sparse descriptions. The subsequently reviewed critical-incidence argument also excludes a polynomial bound for unrestricted nonlinear arithmetic-circuit potentials on all true numerical instances, conditional on the imported border lower bound. Neither argument settles `P_C` versus `NP_C`.
