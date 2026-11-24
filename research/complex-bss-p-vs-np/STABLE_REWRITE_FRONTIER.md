# What solution-preserving rewrites give a generic branch

Research checkpoint, 23 November 2026 (America/Chicago). This note tests stable padding and polynomial row operations as a way to remove the arbitrary cofactor in a generic HN branch. It supplies an exact padding family and an exact bounded-cost stable normalization from a supplied universal certificate. The padding does not force generic branch equations to lose their cofactors. The normalization is defined only on a generic rejecting open set and is undefined on the target hypersurface. No claim that all stable-equivalence approaches fail is made.

## 1. An explicit family and its charged size

Let `f_1(A,x),...,f_N(A,x)` be a polynomial system depending on a coefficient vector `A`. Introduce one new unknown `z` and auxiliary parameters `B`. Choose polynomials `h_i(B,x,z)` with a shared circuit of size `s_h`, and form

```math
g_i(A,B,x,z)=f_i(A,x)+z h_i(B,x,z)
                  \quad(1\le i\le N),
\qquad g_{N+1}=z.                                \tag{1}
```

For every complex value of `(A,B)`, the common zero set of (1) is exactly

```math
\{(x,0):f_1(A,x)=\cdots=f_N(A,x)=0\}.             \tag{2}
```

The equivalence follows by substituting the last equation `z=0`; it has no genericity or nonvanishing hypothesis. The shared circuit overhead is `O(s_h+N)`. The syntactic circuit construction retains each original `f_i` as a specified subcircuit, so a valid instance in this format can be decoded in polynomial time.

Suppose a deterministic polynomial-time HN decider exists. There is also such a decider that recognizes the format (1), extracts the original `f_i` circuits, and runs the original decider on them, ignoring `B`; on other valid inputs it runs the original decider directly. This is a correct decider on all input systems. On the padded family, every computation and every generic branch equation can be identical to the original computation in `A`. In particular, a branch multiple

```math
P(A)=R(A)^e Q(A)
```

can keep exactly the same cofactor `Q(A)` for every padding parameter. Invariance of the Boolean answer under (1) does not imply invariance, normalization, or loss of cofactors in its individual branch polynomials.

The same statement applies to explicitly retained invertible row-change parameters: undoing that row change is a polynomial-cost rational operation on the open set where the retained matrix is invertible. It does not apply automatically to every untagged rewrite. Its purpose is to rule out the inference from semantic stability alone to improved generic branch equations, not to rule out an additional normalization algorithm that genuinely uses other rewrites.

## 2. Pulling back a decider along any bounded rewrite family

Let `E(A,B)` be a polynomial-time construction of HN instances, with correctness and validity on an admissible open set `U=D(H_0)`. Assume the nonvanishing guard `H_0` has a supplied polynomial-size circuit, and assume `R(A)` does not divide `H_0(A,B)`. A polynomial number of supplied nonvanishing guards may be combined into this one by multiplication. The latter condition is essential: it says that `U` meets the target hypersurface, and hence meets it densely. On `U`, suppose solution existence for `E(A,B)` is equivalent to `R(A)=0`.

First reject when `H_0=0`, and otherwise compose the hypothetical decider with `E`, regarding `(A,B)` as the input coordinates. This gives a polynomial-time decider for `V(R) intersect U`. A generic accepting branch again supplies small equality polynomials divisible by `R(A)` and an excluded product not divisible by `R(A)`; include the supplied guard `H_0` in that product. These statements are obtained after restricting the machine to the parameter family, so tests that vanish identically because of padding relations can be discarded.

The result is another saturated presentation of the form already proved in [SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md). The charged guard controls components outside the rewrite's validity domain. A merely unspecified nonempty open set would not suffice: it could miss `V(R)` entirely, or require a guard with uncontrolled circuit size. In particular a nonzero equality in the stated setting gives

```math
P(A,B)=R(A)^e Q(A,B).                             \tag{3}
```

Nothing in the generic-path argument says that `Q` is independent of `A`, is a function of `R`, or has bounded radical degree. Even a proof that the coefficients of `Q` in `B` have no common divisor would leave a content computation: the common factor `R^e` would still have to be extracted from the coefficients of (3), or from generic specializations in `B`. Neither uncharged coefficient enumeration nor a degree-independent gcd theorem is provided by the rewrite.

This observation also identifies a uniformity issue in using larger and larger padding dimensions. Branch polynomials at different input lengths are different functions. Correctness of the machine on all lengths does not supply a single relative-invariant polynomial whose value can be transported between them.

## 3. A small unit-ideal certificate does give a stable row normalization

There is a positive normalization statement when the certificate itself is supplied. Write `f` as the column of `N` input polynomials. Suppose a row `u` is given whose entries are polynomials in the unknown variables `x`, with rational parameter coefficients having a common nonzero parameter-only denominator `P(A)`, and suppose

```math
u f=1.                                           \tag{4}
```

In the universal-certificate construction, `u_i=D_i(A,x)/P(A)`, with a parameter-only denominator `P`, and (4) is an identity on `P(A)!=0`. All these functions are represented by charged circuits.

After adjoining one zero equation, use the `(N+1)` by `(N+1)` matrix

```math
M=
\begin{pmatrix}
 I_N-fu & f\\
 u      & 0
\end{pmatrix}.                                  \tag{5}
```

The rank-one identity `(fu)^2=f(uf)u=fu` gives

```math
M^2=I_{N+1},
\qquad
M\binom{f}{0}=\binom{0}{1}.                     \tag{6}
```

Thus this is an invertible polynomial row operation in the unknown variables, over the parameter localization where the entries of `u` are defined. For every such parameter value and every `x`, it sends the padded equations to a system containing the constant equation one. It preserves the zero set and proves it empty.

Its determinant is `-1`. Over the fraction field, it acts as the identity on `ker u` and exchanges the two vectors `(f,0)` and `(0,1)`, giving that determinant. The identity then holds in the parameter localization. Its shared entry-circuit size is `O(s_f+s_u+N^2)`, where `s_f,s_u` are the supplied shared circuit sizes. Constructing it does not require a Macaulay coefficient array or a high-degree determinant.

## 4. The domain needed to reach the accepting hypersurface is missing

For the universal certificate imported from a generic HN branch, `R` divides `P`. Hence the entire generic accepting hypersurface lies outside the domain of (5). The matrix gives a small normalization of the generic rejecting ideal, but it cannot be specialized to the target hypersurface or used there as a solution-preserving row change.

If `P=R^eQ`, its excluded set can also contain the extraneous divisor `Q=0` inside the rejecting region. The identity (4) does not prove that the displayed certificate, or matrix (5), extends regularly there. A different certificate exists at every genuinely inconsistent system by the Nullstellensatz, but its polynomial circuit size and compatible overlap normalization have not been bounded by this construction.

Artificial parameter poles can occur even for the simplest inconsistent ideal. For `f=(1,x)^T` and any nonzero parameter polynomial `q(A)`, the short row

```math
u=\left(1+\frac{x}{q(A)},-\frac1{q(A)}\right)
```

still satisfies `u f=1`. The ideal is the unit ideal for every parameter value, but this certificate and its matrix (5) have parameter poles on `q=0`. The example is an exact warning against identifying the pole divisor of one normalization with an intrinsic resultant divisor. It is not a lower bound for finding a different certificate in this elementary example.

Moreover, `det M=-1` shows that the determinant of the small normalization matrix does not recover the resultant: all of its parameter poles cancel in that determinant. Recovering the high-degree elimination divisor from a polynomial-module resolution would require a further construction and its charged complexity bound.

## 5. Surviving stable-equivalence question

A successful stable argument must provide more than solution-preserving transformations or abstract transitivity of presentations. It needs a bounded-cost construction valid on the relevant accepting component, or a proved way to extract and glue its limiting divisor across the poles of normalizations such as (5). The present calculations do not supply that operation.

The full decider can be queried on every bounded rewrite family, so it remains a possible source of additional identities. Each generic pullback currently yields data of the form (3), and the existing saturated-path and marked-factor statements explain exactly what can be extracted from those data. No Reynolds averaging, coefficient-content extraction, polynomial gcd, or global normalization is treated as a free step here.
