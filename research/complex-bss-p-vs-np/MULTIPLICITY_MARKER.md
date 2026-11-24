# A saturated path gives one uniquely marked multiplicity class

Research checkpoint, 23 November 2026 (America/Chicago). The construction below turns the small saturated presentation of an irreducible hypersurface into one small polynomial in which the target is the unique irreducible factor having a specified multiplicity. It performs no gcd or radical extraction. A low-order jet theorem for that marked factor would finish the resultant route, but no such degree-independent theorem is proved here.

## 1. Input and charged construction

Suppose `R` is irreducible, `F_1,...,F_r` are nonzero polynomials, `G!=0`, and

```math
R\mid F_i\quad\text{for every }i,
\qquad R\nmid G,
\qquad
\sqrt{(F_1,\ldots,F_r):G^\infty}=(R).              \tag{1}
```

Assume the `F_i` and `G` have a shared division-free circuit of size at most `s`. Increasing `s` by a fixed constant if needed, every degree is at most `2^s`. Set

```math
B=2^s+1,
\qquad
W=G^{B^r}\prod_{i=1}^{r}F_i^{B^{i-1}}.             \tag{2}
```

This polynomial has a circuit of size `O(s+rs+r)`. In detail, start with `W_r=G` and compute

```math
W_{i-1}=W_i^B F_i\qquad(i=r,r-1,\ldots,1).
```

The recurrence gives `W_0=W`. A `B`-th power is computed by `s` squarings followed by multiplication by the original argument, since `B=2^s+1`. Thus the high exponents are actually charged through a polynomial number of arithmetic operations; they are not free exponentiation instructions.

The degree satisfies

```math
\deg W
\le (B-1)\sum_{i=0}^{r}B^i
=B^{r+1}-1,
```

so its logarithmic degree is `O((r+1)s)`.

## 2. The target has a unique multiplicity

For an irreducible polynomial `p`, let `v_p` denote its factor multiplicity. Each digit below lies between zero and `B-1`, because it is at most the degree of the corresponding input polynomial. Hence

```math
v_p(W)=B^r v_p(G)+\sum_{i=1}^{r}B^{i-1}v_p(F_i)   \tag{3}
```

is the base-`B` encoding of the complete multiplicity vector, with no carries.

Define the marked integer

```math
k_R=v_R(W)=\sum_{i=1}^{r}B^{i-1}v_R(F_i).
```

All its first `r` digits are positive, its `G` digit is zero, and

```math
1\le k_R<B^r,
\qquad \log_2 k_R=O(rs).                          \tag{4}
```

If another irreducible factor `p` of `W` had multiplicity `k_R`, uniqueness of base-`B` digits would imply

```math
v_p(G)=0,
\qquad v_p(F_i)=v_R(F_i)>0\quad\text{for all }i.
```

Thus `p` would be a common factor of all the `F_i` outside the excluded divisor `G`. The saturation identity (1) forces it to be associated to `R`. Therefore:

**Marked-factor conclusion.** The polynomial `R` is the unique irreducible factor of `W` whose multiplicity equals `k_R`.

This conclusion concerns irreducible factors in the full coefficient ring. After restricting to a generic line, avoid pairwise factor collisions and tangencies. The roots inherited from any factor then have exactly that factor's divisorial multiplicity, so the roots coming from `R` are precisely the roots of multiplicity `k_R`.

The marker need not be computed from the input circuit by an algorithm here. The later circuit-lower-bound argument is nonuniform and permits it as one complex scalar constant. Equation (4) also gives it a polynomial binary length. Neither fact supplies a short ordinary certificate for evaluating multiplicities at singular points.

## 3. What the marker would suffice to extract

For the resultant accepting path of [SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md), `s,r`, and the coefficient dimension are polynomial in the hypothetical running time and input dimension. Thus (2) is a polynomial-size circuit, and the marker in (4) has polynomial bit length.

It would suffice to prove the following marked-factor jet statement: whenever a small polynomial `W` has exactly one irreducible factor `R` of a specified multiplicity `k`, every normalized degree-`D` Taylor jet of `R` at a generic nonzero center has border size polynomial in the supplied circuit size, the variable count, `D`, and `log(k+1)`.

Applying that statement to (2), then taking the full coefficient-space jet before the BCJS grid pullback, would contradict the pinned permanent border lower bound exactly as in Section 5 of the saturated-path note. This is an alternative unresolved extraction statement. No logical equivalence to the unrestricted Radical Conjecture is claimed.

## 4. A short differential expression detects the marked order on regular graphs

Choose a generic constant coefficient direction `partial`, so `partial p` is nonzero modulo every irreducible factor `p` of `W`. There are finitely many such factors, and each excludes only a proper linear subspace of directions. Define

```math
E_k=(k-1)(\partial W)^2-kW\,\partial^2W.          \tag{5}
```

This has a circuit of size polynomial in the circuit size of `W`. If `W=p^m h` with `p` not dividing `h`, its lowest term along `p=0` is

```math
E_k\equiv m(k-m)h^2(\partial p)^2p^{2m-2}
                 \pmod {p^{2m-1}}.               \tag{6}
```

Consequently

```math
v_p(E_k)=2m-2\quad\text{if }m\ne k,
\qquad
v_p(E_k)\ge2m-1\quad\text{if }m=k,                \tag{7}
```

where infinite valuation is allowed if (5) is zero. Since `v_p(partial W)=m-1`, the rational function

```math
\frac{E_k}{(\partial W)^2}
=\frac{k}{\mu_W}-1,
\qquad
\mu_W=\frac{(\partial W)^2}
                  {(\partial W)^2-W\partial^2W},  \tag{8}
```

extends regularly at the generic point of every factor of `W`, taking value `k/m-1`. On these regular graphs, the conjunction `W=0` and `mu_W=k_R` therefore selects the resultant component. The equation `mu_W=k_R` alone can also hold away from `W=0` and is not the desired predicate.

The raw polynomial conjunction `W=0,E_k=0` is insufficient: by (7), every other factor of multiplicity at least two satisfies both equations as well. Dividing by `(partial W)^2` only writes the intended regular function; it does not certify its value where the displayed denominator is zero. The vertical-fiber example in [SIGNED_MULTIPLICITY_RATIONAL_MAP.md](SIGNED_MULTIPLICITY_RATIONAL_MAP.md), Section 3, applies here.

The positive result is the charged reduction to a uniquely marked multiplicity class. The missing steps are a polynomial-cost regular-graph or marked-factor extraction and the resulting aggregate jet computation. The existence of the short integer marker and the differential identity do not establish either one.
