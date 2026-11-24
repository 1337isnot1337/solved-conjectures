# A restriction on nonlinear potential templates with few parameter monomials

Status: reviewed reduction to the singular-witness lemma and the imported permanent border lower bound. The rank argument below is self-contained. It is retained as a restricted argument; the stronger `CRITICAL_INCIDENCE_BARRIER.md` now excludes the all-instance polynomial size bound for unrestricted arithmetic-circuit potentials as well. No novelty claim is made.

## 1. A finite coefficient space

Use the residual `R_(X,y)` and flips `T_i` from `BOOLEAN_POTENTIALS.md`. Suppose a fixed template specifies potentials

```math
Q_i(X,y;b,c),\qquad 1\le i\le m,
```

where `c=(c_1,...,c_p)` is a tuple of unknown complex constants. The template circuits have polynomial size. Their dependence on `c` may be nonlinear. At each numerical input, `c` may be chosen arbitrarily; no algorithm for choosing it is assumed.

For a Boolean vector `b`, form

```math
E_b(X,y;c)=R_{X,y}(b)
 -\sum_i\bigl(Q_i(X,y;b,c)-Q_i(X,y;T_i b,c)\bigr).
```

Assume these residuals have expansions

```math
E_b(X,y;c)=\sum_{\alpha\in A}M_{b,\alpha}(X,y)c^\alpha, \tag{1}
```

with one fixed finite set `A`, of cardinality `N`. For each Boolean `b` and each `alpha` in `A`, assume `M_(b,alpha)` has a circuit of size at most `L`. The constants used to describe a chosen `b` are allowed. The bounds below are polynomial in `m,p,N,L` and the template size.

**Proposition.** If `N,L,p` and the template size are polynomially bounded, this template cannot have a correct choice of `c` on a Zariski-dense constructible subset of the permanent graph, conditional on the imported border lower bound and the reviewed singular-witness lemma.

Thus a polynomial-size template whose parameter dependence has polynomially many efficiently extractable monomials cannot supply all true-instance certificates, even with nonconstructive, instance-dependent choices of its scalar parameters.

## 2. Rank drop exposes a small multiple

Let

```math
F(X,y)=y-\mathop{\mathrm{per}}_m(X),\qquad G=V(F).
```

View the coefficients in (1) as a `2^m` by `N` matrix `M(X,y)`. Its ambient rank is the rank over the rational function field `C(X,y)`, denoted `r`. Its graph rank is the rank after restricting its polynomial entries to the function field `C(G)`, denoted `r_G`. Necessarily `r_G <= r`.

If `r_G < r`, choose an ambient-nonzero `r` by `r` minor `D`. It vanishes on `G`, so

```math
D\ne0,\qquad F\mid D.
```

The minor uses at most `N^2` entries, each of circuit size at most `L`, and a determinant circuit of size polynomial in `N`. For example, the characteristic-zero Newton identities compute a determinant from traces of the first `N` matrix powers using polynomially many additions and multiplications and divisions only by fixed nonzero integers. Thus `L(D)` is polynomial in `N,L`.

Bürgisser's approximate-factor theorem, **arXiv:1812.06828v1, Theorem 1.3**, then makes the degree-`max(m,1)` factor `F` border-easy. Specializing `y=0` contradicts the imported permanent border lower bound. No complexity claim is made for constructing the full exponential matrix `M`; the proof uses only its selected minor.

## 3. Stable rank gives finitely many sufficient Boolean equations

It remains to consider `r_G=r`. The case `r=0` is impossible: it would give `E_b=0` identically for every `b`, whereas their Boolean sum is `per_m(X)-y`.

Choose row indices `I` and column indices `J`, each of size `r`, such that

```math
D(X,y)=\det M_{I,J}(X,y)
```

is nonzero on `G`. In particular `D` is an ambient-nonzero polynomial with a polynomial-size circuit.

The selected rows span every row of `M` over `C(X,y)`. More precisely, for any row index `b`,

```math
M_{b,*}=M_{b,J}M_{I,J}^{-1}M_{I,*}.                    \tag{2}
```

The equality follows from the rank `r` and the invertibility of the selected minor. After multiplication by `D`, it is a polynomial matrix identity. Therefore it holds at every numerical input where `D` is nonzero, without any genericity restriction beyond that nonvanishing condition.

Multiplying (2) by the column of parameter monomials gives

```math
E_b=M_{b,J}M_{I,J}^{-1}E_I
\qquad\text{whenever }D\ne0.                          \tag{3}
```

Consequently, on the input open set `D != 0`, the at most `N` equations

```math
E_b(X,y;c)=0\qquad(b\in I)                             \tag{4}
```

are equivalent to all `2^m` Boolean equations for this template.

Introduce one more witness `u` and the equation

```math
uD(X,y)-1=0.                                          \tag{5}
```

Equations (4)–(5) define a polynomial-size existential incidence. Any point of its projection satisfies every Boolean residual equation by (3), and summing those equations gives `F=0`. Thus the projection lies in `G`.

By the proposed completeness assumption, its projection contains the intersection of a dense constructible subset of `G` with `D != 0`, which is still dense in `G`. Therefore some irreducible component of this incidence has projection closure exactly `G`. Treating `X` as base variables and `y` as its first output coordinate, the reviewed singular-witness lemma gives polynomial border complexity for the degree-`m` permanent. This again contradicts the imported lower bound.

These two cases prove the proposition. The rank distinction is necessary: simply selecting a maximal ambient basis of Boolean equations can discard the entire graph if the chosen minor vanishes there. The first case handles that possibility by factor extraction instead.

## 4. Bounded total degree in the unknown constants

Suppose each potential template has total degree at most `d` in the `p` parameter variables, and let

```math
N=\binom{p+d}{d}.
```

The residual has the same parameter-degree bound. Coefficients of all monomials of degree at most `d` can be extracted from a division-free circuit by running it in the truncated polynomial ring

```math
\mathbb C[X,y][c_1,\ldots,c_p]/(c_1,\ldots,c_p)^{d+1}.
```

There are `N` coefficient slots. Addition uses `O(N)` operations; naive multiplication uses `O(N^2)` operations. Terms of higher degree cannot affect lower-degree coefficients, even if the original circuit has higher-degree intermediate terms that cancel later. Substituting a fixed Boolean `b` before extraction preserves these bounds.

Hence the coefficient circuits required in Section 1 have polynomial size whenever the template size and `N` do. In particular, a fixed total-degree bound `d` and polynomially many parameters are covered. Constant-degree nonlinear dependence therefore does not evade the obstruction for linear templates.

A finite choice of such templates also does not help. For each fixed dimension, the input set where one template has correct witnesses is constructible. If finitely many such sets cover `G`, one has dense closure in `G`. Apply the proposition to that template. No polynomial bound on the number of alternative templates is needed for this nonuniform argument, but the individual size and coefficient-space bounds must be uniform.

## 5. Relation to the stronger critical-incidence argument

A polynomial-size arithmetic circuit can have exponential degree and exponentially many monomials in its scalar parameters. The universal template used to describe arbitrary circuit witnesses is not subject to the polynomial coefficient-space bound above. Thus this proposition does not collapse arbitrary Boolean checking to existential checking.

It excludes a specified class of potential constructions: polynomially many monomials in the unknown coefficients, with polynomial-size coefficient extraction. The later critical-incidence proof handles unrestricted parameter degree and support by using the derivative of the conservation identity. It adds derivative equations instead of seeking a small equivalent subset of the original Boolean equations. Consequently the full all-instance potential-size hypothesis is excluded by that stronger result, subject to the same reviewed singular-witness lemma and imported lower bound. Neither result proves that `P_C` differs from `NP_C`.

The local analytic input is `SINGULAR_WITNESS.md`. The factor input is Peter Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, **arXiv:1812.06828v1**, **Theorem 1.3**, <https://arxiv.org/abs/1812.06828v1>.
