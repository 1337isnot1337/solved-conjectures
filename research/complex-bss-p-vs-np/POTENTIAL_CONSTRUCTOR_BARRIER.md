# A generic-branch obstruction to constructing arbitrary Boolean potentials

Status: independently reviewed reduction to the imported permanent border lower bound. This is a consequence of the generic-branch and approximate-factor arguments; no novelty claim is made. It concerns algorithms that output the actual numerical constants of a certificate. Its argument alone does not disprove size existence, but the later `CRITICAL_INCIDENCE_BARRIER.md` excludes an all-instance polynomial size bound even with arbitrary instance-dependent constants.

## 1. Statement and the promise

Let

```math
K_X(b)=\prod_{j=1}^m(2b_j-1)
       \prod_{i=1}^m\left(\sum_{j=1}^mX_{ij}b_j\right),
\qquad
\delta_0(b)=\prod_{j=1}^m(1-b_j),
\qquad
R_{X,y}(b)=K_X(b)-y\delta_0(b).
```

Write `T_i b` for the Boolean vector with coordinate `i` flipped. Consider a deterministic BSS procedure over `C` with arithmetic, division where defined, and equality branches. Arbitrary fixed complex machine constants are permitted. Its input is `(X,y)`, with the promise

```math
y=\mathop{\mathrm{per}}_m(X).
```

On every promised input, suppose the procedure halts in at most `T(m)` operations and outputs actual division-free arithmetic circuits `Q_1,...,Q_m`, including their numerical scalar constants, of total size at most `S(m)`, satisfying

```math
R_{X,y}(b)=\sum_{i=1}^m\bigl(Q_i(b)-Q_i(T_i b)\bigr)
\quad\text{for every }b\in\{0,1\}^m.                    \tag{1}
```

There is no requirement to halt or to produce any valid output on a false input.

**Proposition.** These assumptions give

```math
\underline L(\mathop{\mathrm{per}}_m)
\le \mathop{\mathrm{poly}}\bigl(m,T(m)+mS(m)\bigr),         \tag{2}
```

where `L` is division-free straight-line-program complexity with arbitrary scalar constants and the underline denotes border complexity. In particular, the imported superpolynomial permanent border lower bound excludes a procedure with polynomial `T` and `S`.

The argument also applies separately to a nonuniform family of finite algebraic computation trees with these depth and output-size bounds. It never needs to construct the branch used in the proof.

## 2. A dense branch with one valid output topology

For fixed `m`, let

```math
F(X,y)=y-\mathop{\mathrm{per}}_m(X),
\qquad G=V(F).
```

The graph `G` is irreducible, and its vanishing ideal is the principal prime ideal `(F)`.

All promised computations halt within `T(m)`, so finitely many execution paths cover `G`. For each fixed path, every register is a rational function in the ambient variables `(X,y)` with coefficients in `C`. Its legal domain is constructible: branches specify rational equalities and inequalities, while every executed division imposes a nonzero divisor.

There are also only finitely many valid circuit topologies with at most `S(m)` gates and `m` inputs. Refine the path cells by the actual discrete topology of their output circuits. Such a refinement is constructible: the relevant wire indices and gate tags are required to equal the finitely many values of a fixed valid encoding. All true inputs produce valid encodings, so these refined cells still cover `G`.

Since `G` is irreducible, one refined cell `C` is dense in `G`. Freeze its path and its valid output topology. The output scalar constants are then rational functions

```math
a_1(X,y),\ldots,a_q(X,y)
```

computed along this path. Every denominator used on the path is nonzero at every point of `C`; in particular it is nonzero as an element of the function field of `G`. This includes denominators introduced by clearing an executed division. None is divisible by `F`.

Insert the rational functions `a_j` into the frozen topology. This defines polynomials

```math
Q_i(X,y;b)\in\mathbb C(X,y)[b_1,\ldots,b_m]
```

even away from the promised graph, on the ambient open domain where their coefficient denominators are nonzero. They agree with the procedure's output on `C`. Freezing the valid topology does not require the output tags or wire-index functions to remain valid off `G`.

## 3. One Boolean residual is a nonzero small multiple

For each fixed Boolean vector `b`, define the rational function

```math
E_b(X,y)=R_{X,y}(b)
 -\sum_{i=1}^m\bigl(Q_i(X,y;b)-Q_i(X,y;T_i b)\bigr).
```

It vanishes on `C` by correctness of the output certificate. Its rational circuit has size

```math
O\bigl(T(m)+mS(m)+m^2\bigr).                            \tag{3}
```

The factor `m` safely allows differently substituted copies of a shared multi-output circuit. When the size convention already sums separate circuits, this factor can be reduced, but that improvement is unnecessary.

The finite Boolean sum of these rational functions is an identity in `C(X,y)`:

```math
\begin{aligned}
\sum_{b\in\{0,1\}^m}E_b(X,y)
&=\sum_b R_{X,y}(b)
  -\sum_i\left(\sum_b Q_i(X,y;b)-\sum_b Q_i(X,y;T_i b)\right)\\
&=\mathop{\mathrm{per}}_m(X)-y.
\end{aligned}                                                    \tag{4}
```

Each flip permutes the cube, so the potential terms cancel. Ryser's identity gives the remaining sum. Since the right-hand side of (4) is a nonzero ambient polynomial, at least one residual `E_b` is a nonzero ambient rational function. This argument only chooses a Boolean vector for the proof; it does not evaluate the exponential sum algorithmically.

Fix such a vector. Clear its divisions gate by gate by representing every register as a numerator-denominator pair. For example,

```math
\frac ab+\frac cd=\frac{ad+bc}{bd},\qquad
\frac ab\frac cd=\frac{ac}{bd},\qquad
\frac{a/b}{c/d}=\frac{ad}{bc}.
```

With shared gates, this takes constant overhead per arithmetic operation. We obtain

```math
E_b=\frac{N_b}{D_b},
\qquad
L(N_b),L(D_b)=O\bigl(T(m)+mS(m)+m^2\bigr).
```

The numerator `N_b` is nonzero because `E_b` is nonzero. The denominator is nonzero on `C`, since the only divisions are the legal computations of the output constants. Hence `N_b` vanishes on the dense subset `C` of `G`. Therefore

```math
F\mid N_b,\qquad N_b\ne0.                              \tag{5}
```

No degree or multiplicity bound is claimed for `N_b` or its cofactor.

## 4. Approximate-factor extraction and scope

Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, **arXiv:1812.06828v1**, 17 December 2018, **Theorem 1.3**, bounds the border complexity of a factor polynomially in the factor's degree and the circuit complexity of a nonzero multiple. Here `F` has degree `max(m,1)`, so (5) gives polynomial border complexity of `F` in the parameters of (2). Specializing `y=0` and multiplying by `-1` gives (2). The graph-specific improvement in **Remark 1.4(1)** is available but not needed. Source: <https://arxiv.org/abs/1812.06828v1>.

The imported lower bound applies with arbitrary complex constants, so the fixed constants on the selected branch cause no restriction. Its pinned source and the exact Lean-statement audit are recorded in the repository's source audit; no additional formal verification is claimed here.

This proposition rules out a polynomial-time constructor for every choice of valid potentials, including a constructor that chooses noncanonical potentials on each true input. Its assumption is stronger than the certificate-size assertion in `BOOLEAN_POTENTIALS.md`: that assertion allows every numerical instance to have small circuits whose scalar constants are not computed by any efficient BSS procedure.

The proof also explains why decision collapse is insufficient as a construction argument. A consequence of `P_C=NP_C` must be proved in the decision model actually assumed. It cannot be replaced by an unrestricted procedure for outputting the complex witness constants. The purely existential size assertion is excluded by the separate critical-incidence argument, rather than by adding an unsupported search principle to this proof.
