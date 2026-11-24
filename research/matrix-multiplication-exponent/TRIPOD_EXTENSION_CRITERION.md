# An all-tensor criterion for a normalized geodesic tripod extension

Status: a proved conditional equivalence, using the pinned paper's
Proposition A.5 as an imported premise. The equivalent condition is not
proved for every normalized spectral point. This note does not prove
that every old triangle admits a geodesic tripod extension, and it does
not prove that the matrix multiplication exponent is two.

## 1. Statement

Let $`F`$ be a normalized spectral point on three parties
$`I=\{A,B,C\}`$ over the complex numbers. Thus it is restriction
monotone, multiplicative, additive on full direct sums, and has
$`F(U_I(r))=r`$. Write

```math
F(W_{ij}(r))=r^{d_{ij}},
```

and set

```math
a=\frac{d_{AB}+d_{AC}-d_{BC}}2,\qquad
b=\frac{d_{AB}+d_{BC}-d_{AC}}2,\qquad
c=\frac{d_{AC}+d_{BC}-d_{AB}}2.
```

The wire triangle inequalities imply that these numbers are
nonnegative. The following statements are equivalent.

1. There is a normalized spectral point $`F'`$ on
   $`I'=I\cup\{D\}`$ which agrees with $`F`$ on every old tensor
   padded by a scalar at $`D`$, and whose wire distances satisfy
   $`d'_{AD}=a,d'_{BD}=b,d'_{CD}=c`$.
2. For every old tensor $`T\in V_A\otimes V_B\otimes V_C`$, with
   finite positive factor dimensions, one has

```math
F(T)\le (\dim V_A)^a(\dim V_B)^b(\dim V_C)^c.       \tag{1}
```

Statement 1 retains every old tensor value and the full-unit
normalization. Its three old pair distances satisfy
$`d_{AB}=a+b,d_{AC}=a+c,d_{BC}=b+c`$, so the new point is a
geodesic center for all three old pairs.

## 2. Necessity: the star realizes any old tensor

Put $`n_i=\dim V_i`$. Every old tensor $`T`$, padded by a scalar at
$`D`$, is a restriction of

```math
W_{AD}(n_A)W_{BD}(n_B)W_{CD}(n_C).                 \tag{2}
```

Indeed, leave the three old endpoints of the wires unchanged and let
$`D`$ apply the coefficient array of $`T`$ as a linear functional on
its three wire registers. Monotonicity and multiplicativity of $`F'`$
give (1).

## 3. Sufficiency: a cover gauge with star resources

Assume (1). Denote scalar padding from $`I`$ to $`I'`$ by
$`\iota`$. For an old tensor $`S`$ and three positive integers
$`n_A,n_B,n_C`$, use the resource

```math
R(S;n_A,n_B,n_C)
 =\iota S\,W_{AD}(n_A)W_{BD}(n_B)W_{CD}(n_C)
```

with cost

```math
w(S;n_A,n_B,n_C)=F(S)n_A^a n_B^b n_C^c.
```

For an arbitrary tensor $`T`$ on $`I'`$, let $`p(T)`$ be the
infimum of the total cost of all finite covers of $`T`$ by these
resources. A cover means that $`T`$ is a sum of tensors, each one a
restriction of its displayed resource.

This infimum is finite. A tensor on $`I'`$ is a restriction of a
three-star resource with $`S=1`$ and $`n_i`$ equal to its old factor
dimensions: at $`D`$, map the incoming three-register basis to the
desired coefficient vector in the output factor at $`D`$.

The gauge is monotone under restrictions and satisfies the cover
inequality by composing and combining covers. Multiplying resource
covers gives a resource cover because

```math
R(S;n_A,n_B,n_C)R(S';m_A,m_B,m_C)
\cong R(SS';n_Am_A,n_Bm_B,n_Cm_C),
```

and the costs multiply. Taking infima proves submultiplicativity.
Every nonzero resource has cost at least one, since $`F(S)\ge1`$
for nonzero $`S`$ and $`a,b,c\ge0`$. Every cover of the scalar
tensor contains a nonzero summand. Consequently $`p(1)\ge1`$, and
the resource $`R(1;1,1,1)`$ shows equality. The empty cover gives
$`p(0)=0`$. Hence $`p`$ is an upper functional in the terminology
of the pinned paper, Definition A.1 and Section A.4.

The essential point is

```math
p(\iota T)=F(T)\qquad\text{for every old tensor }T. \tag{3}
```

The inequality $`p(\iota T)\le F(T)`$ uses the single resource
$`R(T;1,1,1)`$. For the opposite inequality, consider any resource
cover of $`\iota T`$. Its output space at $`D`$ is one
dimensional. In one summand, the local map at $`D`$ contracts its
three wire registers against some coefficient tensor $`L`$ on the
old parties with factor dimensions $`n_A,n_B,n_C`$. After that
contraction, the summand is an old local restriction of $`S L`$.
Assumption (1) therefore gives its $`F`$ value at most

```math
F(S)F(L)\le F(S)n_A^a n_B^b n_C^c.
```

Apply the cover inequality of $`F`$ and sum over the cover. Taking
the infimum gives the reverse inequality in (3). No joint operation
on two old parties is used in this argument.

## 4. Saturation and preservation of every old value

For completeness, the upper gauge in the preceding section can be
turned into a spectral point while retaining all the equalities (3).
This is the same saturation and compactness argument used in
`NORMALIZED_EXTENSION.md`, Theorem 2.

For a fixed nonzero old tensor $`C`$, put $`f=F(C)`$ and define

```math
q_C(T)=\inf_{m\ge0}\frac{p(T(\iota C)^m)}{f^m}.
```

Submultiplicativity of $`p`$ and (3) show that the sequence is
nonincreasing. The function $`q_C`$ is an upper functional below
$`p`$: products use two indices and then their sum; finite covers
pass to the common limit; and (3) gives $`q_C(1)=1`$.
The sequence shift also gives

```math
q_C(T\iota C)=f q_C(T).
```

In particular $`q_C`$ respects the triple
$`(1,\iota C,1/f)`$ in the sense of Section A.4 of the pinned
paper. Proposition A.5 supplies a cover spectral point $`G_C`$
below $`q_C`$ respecting that triple. Hence

```math
f\le G_C(\iota C)\le p(\iota C)=f.
```

To preserve any finite list of nonzero old tensors, let $`C`$ be
their product, including $`U_I(2)`$. Each factor has $`G_C`$
value at most its $`F`$ value by (3). Equality on their product and
positivity force equality on each factor. In particular
$`G_C(\iota U_I(2))=2`$.

The old padded unit is a restriction of $`U_{I'}(2)`$. Conversely
the full unit is covered by two scalar tensors. Thus
$`G_C(U_{I'}(2))=2`$. The unit-exponent lemma and the
normalization-to-additivity lemma of `NORMALIZED_EXTENSION.md`,
Lemma 1, show that $`G_C`$ is a normalized additive spectral point
on $`I'`$.

Finally use compactness in the product of the intervals
$`[1,R(T)]`$ over nonzero tensor equivalence classes, with value zero
fixed on the zero tensor. The spectral axioms, normalization, the
upper bounds $`G(T)\le p(T)`$, and the desired equalities on old
tensors are closed conditions in finitely many coordinates. The
finite preservation construction proves the finite-intersection
property. Thus there is one normalized point $`F'\le p`$
preserving every old tensor value.

Its new wire values obey

```math
d'_{AD}\le a,\qquad d'_{BD}\le b,\qquad d'_{CD}\le c,
```

since each wire is one of the permitted resources. Old wire values
are preserved. Therefore

```math
a+b=d_{AB}\le d'_{AD}+d'_{BD}\le a+b,
```

and similarly for the other two pairs. The nonnegative deficits of
the three displayed upper bounds have pairwise sums zero, so all
three deficits vanish. This proves Statement 1.

## 5. Equivalent support-functional formulation

Put $`S=a+b+c`$. Applying (1) to $`U_I(r)`$ shows $`S\ge1`$
whenever the criterion holds. In particular $`S>0`$. Define
$`\theta=(a,b,c)/S`$. The dimension criterion (1) is equivalent
to the all-tensor inequality

```math
F(T)\le\bigl(\zeta^\theta(T)\bigr)^S,             \tag{4}
```

where $`\zeta^\theta`$ is the usual upper support functional:
minimize over local bases the maximum of
$`2^{\sum_i\theta_i H(P_i)}`$ over probability distributions on
the resulting support. Multiplicativity of this upper support
functional is not assumed here.

To prove that (1) implies (4), fix local bases and expand
$`T^{\otimes n}`$ as a sum of its joint-support-type tensors. There
are at most $`(n+1)^{|\mathop{\mathrm{supp}}T|}`$ such types. For a
joint type $`P`$, the local factor is supported on strings with
marginal type $`P_i`$, whose number is at most
$`2^{nH(P_i)}`$. By (1), that summand has value at most
$`2^{n\sum_i a_iH(P_i)}`$. The cover inequality, followed by
$`n`$th roots and a limit, gives the entropy maximum for the fixed
bases. Taking the infimum over bases proves (4). Conversely, the
entropy bound $`H(P_i)\le\log_2\dim V_i`$ makes (4) imply (1).

Thus asserting a geodesic tripod extension for every normalized old
point is precisely asserting a family of all-tensor upper bounds.
The fixed-retraction extension theorem does not contain that
assertion.

## 6. Scope of the imported extension statements

The imported upper-gauge theorem is Proposition A.5, in Appendix A.4
of *VP ≠ VNP over every field*, pinned at commit
[`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
The extension statements are in Appendix A.6 of the same version.
Proposition A.7 uses one finite family of retractions and one fixed
geometric-mean bound. Proposition A.8 extends its price consequence
to arbitrary sets and random maps by compactness and limits. Neither
statement supplies arbitrary metric extensions or an injective hull.

For example, in an equilateral old triangle of side $`d>0`$, a
single random retraction sending $`D`$ to the three old parties
with probabilities $`p_A,p_B,p_C`$ only gives the upper bounds
$`d'_{Di}\le d(1-p_i)`$. To certify the tripod values $`d/2`$
by all three of those bounds would require each probability to be
at least one half. This observation limits that certification method;
it does not disprove the existence of a tripod extension.

Proposition A.5 permits more general upper gauges, including the one
above. Its extra freedom becomes useful only after an all-tensor
preservation estimate such as (1) is proved.

## 7. Consequence of asserting the criterion universally

Suppose, as an additional unproved hypothesis, that every normalized
three-party point satisfies (1). For every tensor
$`T\in(\mathbb C^{q^2})^{\otimes3}`$ and every such point $`F`$,
the criterion gives

```math
F(T)\le q^{2(a+b+c)}
      =q^{d_{AB}+d_{AC}+d_{BC}}=F(M_q).
```

Spectral duality would therefore give $`T\lesssim M_q`$ for every
tensor of that format. More generally, for a tensor with three factor
dimensions at most $`n`$, maximizing the criterion over $`F`$
would give

```math
\widetilde R(T)\le n^{\omega_{\mathbb C}/2}.       \tag{5}
```

The same conclusion follows using only square formats: pad
$`T^{\otimes m}`$ to three factors of dimension $`q_m^2`$, where
$`q_m=\lceil n^{m/2}\rceil`$, apply the square-format comparison,
and take $`m`$th roots. The rounding factor tends to one.

This is not an established consequence of the existing price-extension
theorem. For comparison, the general dimension bound restated as
Theorem 18 of Brand, Curticapean, Kaski, Li, Orzel, Seppelt, and Wang,
[*Beyond Bilinear Complexity: What Works and What Breaks with Many
Modes?*, CCC 2026](https://drops.dagstuhl.de/storage/00lipics/lipics-vol383-ccc2026/html/LIPIcs.CCC.2026.11/LIPIcs.CCC.2026.11.html),
is $`\widetilde R(T)\le n^{2\omega/3}`$. Formula (5) is stated
here only under the explicit extra hypothesis.

Alman, Li, and Pratt,
[*The edge of the asymptotic spectrum of tensors*,
arXiv:2604.01386v2](https://arxiv.org/html/2604.01386v2),
Proposition 8.4 proves its all-tensor upper-support bound when a wire
exponent is one. That hypothesis places the point on an edge and does
not cover arbitrary interior wire triples. Their higher-party
commutative-rank construction, Corollary 3.16, also does not provide a
counterexample to the present three-party criterion: it ensures a
selected wire has exponent one, and normalized three-party
restrictions containing that wire are classified by Corollary 8.10.
[EDGE_METRIC_RIGIDITY.md](EDGE_METRIC_RIGIDITY.md) further proves that
every three-party restriction of such a higher-party point is an edge
restriction after rescaling, even when it omits the selected wire.

Known singleton quantum points pass (1), since their arm parameters
are their three singleton weights and marginal entropy is at most the
logarithm of the corresponding dimension. A large finite rank or
border rank of a generic tensor is not a counterexample: the criterion
concerns values of one genuine spectral point and hence its behavior
under all tensor powers.

## 8. Preserving only the old wires is a weaker problem

The matrix multiplication perimeter objective does not require
preserving every old tensor value. For a realized wire triple
$`\gamma=(d_{AB},d_{AC},d_{BC})`$, it would suffice to find some
normalized old spectral point with those wire values which satisfies
(1), and then extend that representative. The criterion of Sections
1–4 applies to a specified old point. Consequently:

```math
\begin{gathered}
\text{there is a normalized geodesic tripod point with old wire
triple }\gamma\text{ and }u(ABC)=1\\
\Longleftrightarrow\quad
\text{some normalized old point with wire triple }\gamma
\text{ satisfies (1).}
\end{gathered}                                    \tag{6}
```

The quantifier on the right is “some representative”, not “every
representative”. In particular, the universal asymptotic-rank
consequences of Section 7 do not follow merely by replacing an old
point with another point having the same wires.

The forward implication in (6) restricts the four-party point to old
tensors. Its value on $`U_{ABC}(r)`$ is $`r`$ by hypothesis, so
that restriction is normalized and additive by the normalization
lemma. Star routing then gives (1). The converse is Sections 1–4.

## 9. A finite-cover separation criterion for the wire-only problem

There is also an exact gauge criterion depending only on the three
wire prices, with no specified old all-tensor functional. Let
$`x=d_{AB},y=d_{AC},z=d_{BC}`$ be a nonnegative metric triple,
let $`a,b,c`$ be its arm parameters as in Section 1, and put
$`L=x+y+z`$. For positive integers
$`r,r_{AB},r_{AC},r_{BC},n_A,n_B,n_C`$, use the four-party
resource

```math
\mathcal R
=U_{ABC}(r)
 W_{AB}(r_{AB})W_{AC}(r_{AC})W_{BC}(r_{BC})
 W_{AD}(n_A)W_{BD}(n_B)W_{CD}(n_C)
```

with assigned cost

```math
w(\mathcal R)
=r\,r_{AB}^{x}r_{AC}^{y}r_{BC}^{z}
  n_A^a n_B^b n_C^c.                              \tag{7}
```

Here $`U_{ABC}(r)`$ is padded by a scalar at $`D`$. Its assigned
cost is exactly $`r`$, so the old full-unit normalization is part of
the resource list.

Define $`p_\gamma(T)`$ as the infimum of the total assigned cost
over all finite covers of $`T`$ by these resources. Put

```math
C=U_{ABC}(2)W_{AB}(2)W_{AC}(2)W_{BC}(2),
\qquad c_0=2^{1+L}.
```

Then the following are equivalent:

1. There is a normalized four-party point $`G`$ with
   $`G(U_{ABC}(r))=r`$ for all $`r`$, old wire triple
   $`(x,y,z)`$, and new spoke distances $`(a,b,c)`$.
2. For every integer $`m\ge1`$,

```math
p_\gamma(C^{\otimes m})=c_0^m.                  \tag{8}
```

3. Every finite cover of $`C^{\otimes m}`$, for every
   $`m\ge1`$, by the displayed resources has total assigned cost
   at least $`2^{m(1+L)}`$.

**Proof.** The resource family is closed under multiplication by
multiplying corresponding integer dimensions, and assigned costs
multiply exactly. Scalar resources give finite rank-one covers of
every tensor. Every nonzero resource has cost at least one. Thus the
same cover argument as in Section 3 proves that $`p_\gamma`$ is a
finite upper functional with $`p_\gamma(1)=1`$.

There is a single resource of cost $`c_0^m`$ equal to
$`C^{\otimes m}`$, so the left side of (8) is always at most its
right side. This proves the equivalence of Statements 2 and 3.

If Statement 1 holds, the value under $`G`$ of each resource is
exactly its assigned cost (7). The cover inequality gives
$`G(T)\le p_\gamma(T)`$ for every tensor. In particular
$`G(C^{\otimes m})=c_0^m`$, proving (8).

Conversely, assume (8) and form the saturated upper functional

```math
q(T)=\inf_{m\ge0}
      \frac{p_\gamma(TC^{\otimes m})}{c_0^m}.
```

Exactly as in Section 4, (8) proves $`q(1)=1`$ and the upper
functional axioms; it respects the triple $`(1,C,1/c_0)`$.
Proposition A.5 gives a cover spectral point $`G\le q\le
p_\gamma`$ with $`G(C)=c_0`$.

The individual resource upper bounds are

```math
G(U_{ABC}(2))\le2,\quad
G(W_{AB}(2))\le2^x,\quad
G(W_{AC}(2))\le2^y,\quad
G(W_{BC}(2))\le2^z.
```

Their product is $`G(C)=2^{1+L}`$, so positivity and
multiplicativity force equality in all four bounds. The unit
exponent law gives $`G(U_{ABC}(r))=r`$ for every integer
$`r`$. Since the old unit restricts from the full four-party unit,
and that full unit has a rank-$`r`$ cover, the latter also has
value $`r`$. The normalization lemma therefore makes $`G`$ a
normalized additive spectral point on all four parties.

The assigned costs of the three new wire resources give
$`d_{AD}\le a,d_{BD}\le b,d_{CD}\le c`$. The preserved old
wire values and their triangle inequalities force equality in each
of these bounds, as in Section 4. Statement 1 follows. No compactness
argument is needed here: one saturated product preserves the four
required old generators. This proves the equivalence.

This also gives a concrete separation statement. If the desired
wire-only extension does not exist, there is an integer $`m\ge1`$
and a finite cover

```math
C^{\otimes m}\ \text{covered by }\mathcal R_1,\ldots,\mathcal R_s,
\qquad \sum_{j=1}^s w(\mathcal R_j)<2^{m(1+L)}.    \tag{9}
```

Indeed, failure of (8) is a strict inequality for some $`m`$, and a
finite cover with cost still below the right side can be selected
from the defining infimum. Conversely any such finite certificate
rules out the extension by evaluating its cover under a proposed
$`G`$.

The old resources in (7) are monomials in old wires and the normalized
old full unit. Finite full direct sums of such monomials can be absorbed into the
cover list, and their products distribute. Thus this criterion
preserves the subsemiring generated by those old resources, without
requiring a prescribed value on any other old tensor. The existence
of an original three-party point with wire triple $`\gamma`$
does not by itself establish (8): the new star contractions in the
covers introduce arbitrary old coefficient tensors, and their
assigned cost must still be justified.
