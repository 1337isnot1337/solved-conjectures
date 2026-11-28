# Midpoint convexity for every tensor placement

Status: proved deduction from the pinned normalized price-extension
and CN results. This lemma does not prove conditional geodesic unit
uncrossing or the matrix multiplication exponent conjecture.

This note supplies the local-map and quantifier proof. No claim of
priority is made for the midpoint observation.

## 1. Model and statement

Let $`I`$ be a finite set of old parties, and let $`F`$ be a normalized
spectral point on complex finite-dimensional tensors on $`I`$. Products
are tensor products regrouped by party. Local restrictions use an
independent linear map at each party. The full unit has value
$`F(U_I(r))=r`$ for every positive integer $`r`$.

Write

```math
F(W_{XY}(r))=r^{d(X,Y)}
```

for wire values. We allow $`X=Y`$; the wire then becomes a local
nonzero vector and has exponent zero.

Let $`J`$ be another finite label set, let $`V_j`$ be
finite-dimensional vector spaces, and let

```math
T\in\bigotimes_{j\in J}V_j.
```

For a map $`\rho:J\to I`$, denote by $`\rho_*T`$ the tensor
obtained by grouping all $`V_j`$ with $`\rho(j)=i`$ at old party
$`i`$. Empty groups are one-dimensional. The map $`\rho`$ need not
be injective.

Let $`a,b,m:J\to I`$ satisfy, for every $`j\in J`$,

```math
d(a(j),m(j))=d(b(j),m(j))
=\frac12d(a(j),b(j)).
\tag{1}
```

**Theorem.** Every such tensor satisfies

```math
F(m_*T)\le\sqrt{F(a_*T)F(b_*T)}.
\tag{2}
```

More generally, let $`\mu`$ be any probability law on maps
$`\sigma:J\to I`$ such that the marginal law of $`\sigma(j)`$
is

```math
\frac12\delta_{a(j)}+\frac12\delta_{b(j)}
\qquad(j\in J).
\tag{3}
```

Then

```math
F(m_*T)\le
\prod_{\sigma}F(\sigma_*T)^{\mu(\sigma)}.
\tag{4}
```

Zero-probability factors are omitted. All placement tensors are
nonzero when $`T\ne0`$, so the product is then unambiguous. For
$`T=0`$, both assertions follow from $`F(0)=0`$.

## 2. A zero-distance factor transport lemma

Let $`G`$ be a spectral point on a finite party set $`K`$ and let
$`\rho,\tau:J\to K`$ satisfy
$`d(\rho(j),\tau(j))=0`$ for every $`j`$. Then

```math
G(\rho_*T)=G(\tau_*T).
\tag{5}
```

For a direct proof, fix bases $`e_{j,1},\ldots,e_{j,r_j}`$ of
$`V_j`$. Tensor $`\rho_*T`$ with a wire of size $`r_j`$ from
$`\rho(j)`$ to $`\tau(j)`$ for every moved factor. At each source
party, contract the designated $`V_j`$ factor with the source end
of its wire using the pairing
$`e_{j,k}\otimes e_{j,\ell}\mapsto\delta_{k\ell}`$.
The target end retains the corresponding coordinate. The resulting
tensor is $`\tau_*T`$, up to unused one-dimensional factors.

This remains a legal local map when several source factors are at one
party: their original tensor-product factors are specified, and the
party applies the product of the designated pairings. Several target
factors can likewise be grouped at one party. Source and target
assignments may overlap; the wire factors are distinct local tensor
factors, so the same contraction construction applies. Factors whose
source and target agree can be left in place.

Each auxiliary wire has value one. Monotonicity and multiplicativity
therefore give $`G(\tau_*T)\le G(\rho_*T)`$. Reverse the transport
to prove (5). No assumption that the original tensor is a unit, a graph
tensor, or diagonal in the chosen bases is used.

## 3. Proof of the theorem

Add a distinct new party $`j'`$ for each $`j\in J`$, disjoint from
$`I`$. Write $`I'=I\sqcup J'`$, and let
$`\iota:I\hookrightarrow I'`$ and $`\eta:J\hookrightarrow I'`$
be the old-party and copy-label inclusions.

For each map $`\sigma`$ in the support of $`\mu`$, define a
retraction $`\pi_\sigma:I'\to I`$ which fixes every old party and
sends $`j'`$ to $`\sigma(j)`$. Apply Theorem 2 of
`NORMALIZED_EXTENSION.md` to this one fixed finite law. It gives a
normalized point $`F'`$ on $`I'`$ satisfying

```math
F'(\iota_*S)=F(S)\quad\text{for every old tensor }S
\tag{6}
```

and

```math
F'(Q)\le\prod_\sigma
F((\pi_\sigma)_*Q)^{\mu(\sigma)}
\quad\text{for every tensor }Q\text{ on }I'.
\tag{7}
```

For a fixed $`j`$, apply (7) to the wires from $`j'`$ to its two
old endpoints. The marginal condition (3) gives

```math
d'(j',a(j))\le\frac12d(a(j),b(j)),\qquad
d'(j',b(j))\le\frac12d(a(j),b(j)).
```

The triangle inequality and preservation of the old endpoint distance
force equality in both bounds. Thus $`j'`$ is a midpoint of those
endpoints. The old label $`m(j)`$ is also a midpoint by (1) and (6).
Theorem C.1 of the pinned source, applied with $`j'`$ as midpoint
and $`m(j)`$ as test point, gives

```math
d'(j',m(j))^2
\le\frac{d(m(j),a(j))^2+d(m(j),b(j))^2}{2}
    -\frac{d(a(j),b(j))^2}{4}=0.
\tag{8}
```

This includes coinciding endpoints and zero-length wires. The transport
lemma and (6) now imply

```math
F'(\eta_*T)=F'(\iota_*m_*T)=F(m_*T).
\tag{9}
```

Apply (7) to $`Q=\eta_*T`$. Its regrouping under
$`\pi_\sigma`$ is exactly $`\sigma_*T`$. With (9), this proves
(4). The law placing every new factor according to $`a`$ with
probability one half and every factor according to $`b`$ otherwise
gives (2). ∎

## 4. Quantifiers and continuous interpolation

The conclusion holds for every coupling $`\mu`$ with the prescribed
midpoint marginals. The extension $`F'_\mu`$ used in its proof may
depend on that coupling. The left side of (4) is nevertheless always
the same old value $`F(m_*T)`$, since (6)--(9) identify each new
placement with the already fixed midpoint placement. Thus all these
upper bounds legitimately constrain that one old value.

This is different from demanding one extension which realizes arbitrary
incompatible barycenter laws. The midpoint identification is essential:
CN uniqueness identifies the new copies with specified old labels.

For nonzero $`T`$, wire transport also gives a quantitative continuity
bound between placements:

```math
\left|\log F(\rho_*T)-\log F(\tau_*T)\right|
\le\sum_{j\in J}\log(\dim V_j)\,
                 d(\rho(j),\tau(j)).
\tag{10}
```

Indeed the same auxiliary wires used in Section 2 now have values
$`(\dim V_j)^{d(\rho(j),\tau(j))}`$. Apply the restriction in
both directions and take logarithms. One-dimensional factors contribute
zero.

Consequently logarithmic tensor-placement values extend continuously to
the CAT(0) completion of a compatible finite midpoint construction.
Repeated midpoint interpolation in (2), followed by (10), makes this
logarithmic value convex along synchronized geodesic placement paths.
For subset units this includes ordinary convexity in each one of their
party labels, as used in `GEODESIC_UNCROSSING_EQUIVALENCE.md`.

## 5. Dependencies

The exact pinned source is *VP ≠ VNP over every field*, at commit
[`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
We use Proposition A.7 through the normalized, all-old-values extension
proved as Theorem 2 of `NORMALIZED_EXTENSION.md`, and Theorem C.1 for
CN midpoint uniqueness. Proposition C.3 supplies the standard
midpoint-completion construction; here the finite stages are chosen to
preserve all previously specified tensor values.

All local restrictions, zero-distance identifications, simultaneous
coupling conclusions, and the continuity estimate have been proved
above. No conditional unit equality is imported or inferred from this
lemma alone.

## 6. Unit-only applications still admit the energy countermodel

The full tensor inequality can contain information absent from the
wire and unit charges. Applying it only to units, or to products of
units, does not exclude the existing normalized energy tripod.

More generally, on any CAT(0) space define, for a nonempty finite set,

```math
g(S)=2\max_{\nu\in\mathcal P(S)}
       \sum_{x,y\in S}\nu_x\nu_y d(x,y).
\tag{11}
```

Duplicated labels do not change this value. For midpoint placements
and every coupling in (3), one has

```math
g(m(J))\le\sum_\sigma\mu(\sigma)g(\sigma(J)).
\tag{12}
```

To prove it, first consider two abstract labels $`i,j`$. Their joint
binary endpoint law is a convex combination of the coupling which
matches the two first endpoints and the two second endpoints, and the
coupling which matches opposite endpoints. Busemann convexity of
CAT(0) midpoints gives

```math
\begin{aligned}
d(m(i),m(j))
&\le\tfrac12\{d(a(i),a(j))+d(b(i),b(j))\},
\\ d(m(i),m(j))
&\le\tfrac12\{d(a(i),b(j))+d(b(i),a(j))\}.
\end{aligned}
```

Thus
$`d(m(i),m(j))\le\mathbb E_\mu d(\sigma(i),\sigma(j))`$.
If either marginal has coinciding endpoints, the same conclusion is
ordinary midpoint convexity with the other point fixed.

Multiply by $`2\nu_i\nu_j`$, sum over $`i,j`$, and then maximize
over probability vectors on $`J`$. For each realized map $`\sigma`$,
the pushforward of such a vector is a probability vector on
$`\sigma(J)`$. This gives

```math
\begin{aligned}
g(m(J))
&\le\max_\nu\mathbb E_\mu
     2\sum_{i,j}\nu_i\nu_jd(\sigma(i),\sigma(j))
\\ &\le\mathbb E_\mu g(\sigma(J)),
\end{aligned}
```

which is (12). Adding these inequalities handles every finite product
of subset units, including different unit sizes and repeated labels.

For the metric tripod with all three outer arms of length $`3/8`$,
the old outer triple has $`g(ABC)=1`$, while its three pair distances
are $`3/4`$, giving perimeter $`9/4`$. The countermodel is already
proved to satisfy the other required scalar unit constraints in
`TRIPOD_COUNTERMODEL.md`. Formula (12) verifies that all new coupled
midpoint unit inequalities also hold. The model is not asserted to
extend to a spectral point on all tensors. A use of (4) that resolves
the exponent question must therefore exploit values of other tensors
or a further tensor implication such as (G).
