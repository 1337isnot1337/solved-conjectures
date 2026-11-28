# Independent-wire amplification is an overstrong extension target

Status: a nonconstructive counterexample to a proposed auxiliary-party
extension criterion. This is not progress toward deciding the matrix
multiplication exponent. The proof imports Proposition A.5 and the price
embedding theorem from the pinned Anthropic paper, and the three-party
edge classification from Alman--Li--Pratt. It does not provide the finite
cover whose existence it establishes.

All vector spaces are finite-dimensional over the complex numbers. All
products of tensors are regrouped by their named parties.

## Imported statements and notation

Let `F` be the symmetric three-party quantum spectral point on parties
`A,B,C`, with weights `(1/3,1/3,1/3)`. The existence, restriction
monotonicity, full-direct-sum additivity, multiplicativity, and full-unit
normalization of this point are imported from Christandl--Vrana--Zuiddam,
*Universal points in the asymptotic spectrum of tensors*,
[arXiv:1709.07851v3](https://arxiv.org/abs/1709.07851v3), Theorem 3.30 and
Corollary 3.31. In particular,

```math
F(W_{AB}(q))=F(W_{BC}(q))=F(W_{CA}(q))=q^{2/3}.
```

For a wire, the two endpoint entropy bounds are `log_2(q)` and the third
entropy is zero; the normalized maximally entangled state attains these
bounds simultaneously. Thus these values follow directly from the
quantum-functional formula. The crossing-wire identity and
multiplicativity then give

```math
F(\mathop{\mathrm{MM}}_q)=q^2.
```

Use two further parties `X,Y`, and define

```math
C=\mathop{\mathrm{MM}}_2\otimes W_{XY}(2).
```

For the pinned Anthropic paper, the version is the manuscript at commit
[`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
We use its Proposition A.5, which supplies a multiplicative cover
functional below any upper functional while preserving its respected
triples. We also use Proposition C.3: every price is the pullback of the
metric of a CAT(0) price space. The uniqueness of points on a geodesic is
Lemma C.4(a) of that manuscript.

The other imported statement is Alman--Li--Pratt,
*The edge of the asymptotic spectrum of tensors*,
[arXiv:2604.01386v2](https://arxiv.org/html/2604.01386v2), Theorem 1.6,
equivalently Corollary 8.10. It says that a normalized three-party
spectral point taking value `q` on one wire is an edge support
functional. In particular, its other two wire exponents sum to one.

## The projective cover functional

For a tensor `T` on `A,B,C,X,Y`, set

```math
P(T)=\inf_{T=\sum_{j=1}^m S_j\otimes M_j}
       \sum_{j=1}^m F(S_j)\mathop{\mathrm{rank}}(M_j),
```

where `S_j` is a tensor on `A,B,C` in the old local spaces of `T`, and
`M_j` is a matrix on `X,Y` in the new local spaces of `T`. The infimum is
over finite decompositions. Such decompositions exist by expanding in
coordinate tensors. Terms containing a zero factor may be removed.
Decomposing each matrix into its matrix-rank number of rank-one matrices
shows that the same infimum is obtained by requiring every nonzero
`M_j` to have rank one. The cost is then `sum_j F(S_j)`.

### Lemma 1: `P` is an upper functional in the sense of Proposition A.5

We have `P(0)=0`, `P(1)=1`, restriction monotonicity,

```math
P(S+T)\le P(S)+P(T),\qquad P(ST)\le P(S)P(T).
```

Consequently, if `T` is covered by `T_1,...,T_m`, then

```math
P(T)\le\sum_jP(T_j).
```

**Proof.** For any decomposition of `T`, local maps on `A,B,C` act only
on `S_j`, and local maps on `X,Y` act only on `M_j`. Restriction
monotonicity of `F` and of matrix rank therefore proves restriction
monotonicity of `P`, after taking infima. Concatenating decompositions
proves subadditivity.

Taking the pairwise products of two decompositions, multiplicativity of
`F` and of matrix rank gives a product decomposition whose cost is the
product of the original costs. Taking infima proves submultiplicativity.
These arguments also show that `P` is independent of a presentation of
a tensor up to mutual restriction.

The zero tensor has the empty decomposition, so `P(0)=0`. In the scalar
format, every nonzero summand in a decomposition of `1` has cost one.
At least one summand is nonzero, and the one-term decomposition attains
cost one. Hence `P(1)=1`. The same statement holds in padded formats by
restriction in both directions. Finally, a cover is an ordinary sum of
restrictions, so restriction monotonicity and subadditivity give its
cover inequality. This proves every hypothesis in Proposition A.5.
No full-direct-sum lower bound for `P` is assumed or needed. QED.

The infimum arguments use arbitrary approximations to the infimum and
then let the error tend to zero; attainment of an infimum is not
required. Every nonzero tensor has `1` as a restriction, so the preceding
lemma also gives `P(T)>=1` for nonzero `T`.

### Lemma 2: the two factor restrictions are exact

For any old tensor `S` and any positive integer `r`,

```math
P(S\otimes 1_X\otimes1_Y)=F(S),\qquad
P(1_{ABC}\otimes W_{XY}(r))=r.
```

**Proof.** In the first tensor's natural format, every matrix in a
decomposition is a scalar. A decomposition is therefore an ordinary
sum of scalar multiples of old tensors. The cover inequality for `F`
bounds its cost below by `F(S)`. The one-term decomposition gives the
reverse inequality.

In the second tensor's natural format, every old tensor is a scalar.
The matrix-rank inequality bounds the cost of a decomposition of `I_r`
below by `r`. The one-term decomposition, or its rank-one refinement,
attains `r`. Padded versions have the same values by Lemma 1. QED.

In particular, for all positive integers `m`,

```math
P(C^m)\le F(\mathop{\mathrm{MM}}_{2^m})\mathop{\mathrm{rank}}(I_{2^m})
       =8^m.                                               \tag{1}
```

## A pinning lemma

### Lemma 3

Let `p` be an upper functional, let `D` be a tensor, and let `c>0`.
If `p(D^m)=c^m` for every nonnegative integer `m`, there is a cover
functional `G<=p` with `G(D)=c`.

**Proof.** Set

```math
Q(T)=\inf_{m\ge0}\frac{p(TD^m)}{c^m}.
```

The terms in this infimum are nonincreasing in `m`, because
`p(TD^{m+1})<=p(TD^m)p(D)=c p(TD^m)`. Thus `Q` is their limit and
`Q<=p`. The assumed equalities give `Q(1)=1`.

If `T` is covered by `T_1,...,T_s`, then `TD^m` is covered by
`T_1D^m,...,T_sD^m`. Dividing the corresponding cover inequality by
`c^m` and passing to the decreasing limits gives the cover inequality
for `Q`. For all `a,b>=0`,

```math
Q(ST)\le {p(STD^{a+b})\over c^{a+b}}
       \le {p(SD^a)\over c^a}{p(TD^b)\over c^b}.
```

Taking the two independent infima gives submultiplicativity. Therefore
`Q` is an upper functional. Shifting the decreasing sequence by one
also gives the exact identity

```math
Q(TD)=cQ(T).                                             \tag{2}
```

In the terminology of the pinned paper, (2) says in particular that
`Q` respects the triple `(1,D,1/c)`. Proposition A.5 supplies a cover
functional `G<=Q` respecting that triple. At `T=1`, it gives
`1<=G(D)/c`. On the other hand, `G(D)<=Q(D)=c`. Hence `G(D)=c`, as
claimed. QED.

## Why the pinned point cannot exist

### Lemma 4

There is no cover functional `G<=P` satisfying `G(C)=8`.

**Proof.** Write `d_uv=log_2 G(W_uv(2))`. By the product decomposition
of `C`, multiplicativity gives

```math
8=G(W_{AB}(2))G(W_{BC}(2))G(W_{CA}(2))G(W_{XY}(2)).
```

Lemma 2 and `G<=P` bound the first three factors by `2^{2/3}` and the
last factor by `2`. All factors are positive, and the product of their
upper bounds is exactly eight. Every bound must therefore be an
equality:

```math
d_{AB}=d_{BC}=d_{CA}=2/3,\qquad d_{XY}=1.                 \tag{3}
```

For any `Z` in `{A,B,C}`, the unit tensor `U_{ZXY}(2)` restricts to
`W_XY(2)`, while its two rank-one terms cover it. Thus its value under
`G` is exactly two. More generally, the unit value is a nondecreasing
multiplicative function of its positive integer size. Its value two at
size two implies value `r` at every size `r`: compare `r^n` with the
two adjacent powers of two and take `n`th roots.

The restriction of `G` to the three parties `Z,X,Y` is consequently
fully normalized. For completeness, full normalization makes any
multiplicative cover functional additive on full direct sums. If
`a=G(S)`, `b=G(T)`, `c=G(S\oplus T)`, retaining the type with `k`
copies of `S` in `(S\oplus T)^n` gives the restriction

```math
(S\oplus T)^n\ \ge
\ U\!\left({n\choose k}\right)S^kT^{n-k}.
```

The word-specific factor permutations form legitimate block-diagonal
local maps. Thus

```math
c^n\ge {n\choose k}a^kb^{n-k}
```

for every `k`, and hence `c^n>=(a+b)^n/(n+1)`. Taking roots and
limits gives `c>=a+b`; the cover inequality gives the reverse bound.
This verifies every ordinary spectral-point axiom for the restriction
to `Z,X,Y`.

The same powers-of-two sandwich, using monotonicity and multiplicativity
of wire values, gives `G(W_XY(r))=r` for every positive integer `r` from
`G(W_XY(2))=2`. Thus the quantifier in the edge classification is met.
The edge classification, applied to its unit-price wire `XY`, now
gives

```math
d_{XZ}+d_{ZY}=1\qquad(Z=A,B,C).                         \tag{4}
```

The distances `d` form a price by Definition A.4 of the pinned paper.
By its Proposition C.3, map these five labels to a CAT(0) price space
preserving all their distances. The images of `X` and `Y` have distance
one. For each `Z`, (4) places the image of `Z` on their unique geodesic:
it has distances `t_Z=d_XZ` and `1-t_Z` from the two endpoints, and
Lemma C.4(a) says that exactly one point has these distances. Therefore

```math
d_{ZZ'}=|t_Z-t_{Z'}|\qquad(Z,Z'\in\{A,B,C\}).
```

Three real coordinates cannot have all three pair distances equal to
`2/3`. Indeed, order them. The largest pair distance is the sum of the
other two, whereas (3) would assert `2/3=4/3`. This contradiction proves
the lemma. QED.

The use of a unique geodesic is substantive. Triangle inequalities
alone do not identify different points satisfying (4), so they do not
give this contradiction.

## The nonconstructive finite counterexample

### Theorem 5

There are a positive integer `n` and a finite exact identity

```math
\mathop{\mathrm{MM}}_{2^n}\otimes I_{2^n}
 =\sum_{j=1}^{m} S_j\otimes u_jv_j^{\mathsf T}             \tag{5}
```

such that

```math
\sum_{j=1}^{m}F(S_j)<8^n
  =2^nF(\mathop{\mathrm{MM}}_{2^n}).                         \tag{6}
```

Moreover, along tensor powers of (5), the ratio of the left-side
projective-cover cost to `rF(S)` tends to zero exponentially. In
particular there is no constant `c_0>0` such that

```math
P(S\otimes I_r)\ge c_0\,rF(S)
```

for every `S=MM_{2^N}` and `r=2^N`.

**Proof.** Suppose there were no `n` with `P(C^n)<8^n`. The upper bound
(1) would give equality for all `n`. Lemma 3 with `p=P`, `D=C`, and
`c=8` would then give a cover functional `G<=P` satisfying `G(C)=8`,
contrary to Lemma 4. Hence there is an `n` with strict inequality.

By the definition of an infimum, some finite decomposition has cost
strictly below `8^n`. Refining each matrix factor into rank-one terms
preserves its cost and gives (5)--(6).

Let `B=sum_jF(S_j)<8^n`. Tensoring this finite identity `k` times
gives a finite identity for `C^{nk}` of cost exactly `B^k`, using
multiplicativity of `F` and rank-one matrix factors. Thus

```math
{P(C^{nk})\over 8^{nk}}
 \le\left({B\over8^n}\right)^k\longrightarrow0.
```

This rules out every positive uniform prefactor. For any additional
remainder `0<=s<n`, tensoring with the trivial cost-`8^s` cover of
`C^s` also gives

```math
{P(C^{nk+s})\over8^{nk+s}}
 \le\left({B\over8^n}\right)^k.
```

The exponential loss therefore holds along all sufficiently large
integer powers as well. QED.

## Scope of the conclusion

The verified deduction is that this proposed independent-wire
amplification principle is false, even for a known symmetric quantum
point and a specific family of old tensors. The deduction uses the
stated imported theorems; it is not an independent verification of
those papers. Neither the integer `n` nor the finite matrices and old
tensors in (5) have been found explicitly.

The old quantum point already has perimeter two. The contradiction
comes from demanding that it coexist with an independently normalized
new wire, which would impose collinearity on the old triangle. Thus
this is an obstruction to an overstrong auxiliary-party requirement,
not a counterexample to the desired matrix multiplication conclusion
and not a new upper or lower bound on the matrix multiplication
exponent.
