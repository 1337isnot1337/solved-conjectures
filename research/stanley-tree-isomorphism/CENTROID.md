# Reconstruction from the centroid branches

**Status (2026-11-24).** This is a partial theorem for
[Stanley’s tree-isomorphism conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/315).
It gives a condition on centroid branches under which the ordinary
chromatic symmetric function reconstructs the tree among all trees.
The argument applies whether or not the tree is proper. The general
conjecture remains open. There is no independent review, Lean
verification, or priority claim.

Orellana and Scott use a single centroid to reconstruct a tree from
edge-labelled two-cut partitions. The labels in their hypothesis
carry information absent from the ordinary chromatic symmetric
function. Aliste-Prieto, de Mier and Zamora prove that the full rooted
$U$-polynomial reconstructs a rooted tree by factorization. The
argument below extracts a truncation at the centroid from the
unrooted data and proves a sufficient condition under which this
truncation determines all the branch factors. The 2026-11-24
source check located the two precursor results and no matching
truncation theorem.
[Orellana–Scott, §5](https://arxiv.org/abs/1308.6005),
[Aliste-Prieto–de Mier–Zamora, §3](https://arxiv.org/abs/2002.08186).

## The criterion

Write $n=|V(T)|$ and $D=\lfloor(n-1)/2\rfloor$. Suppose $T$ has a unique
centroid $v$, the vertex for which all components of $T-v$ contain
at most $n/2$ vertices. Root each component of $T-v$ at its neighbor
of $v$. Let $m_b$ count the branches of size $b$, and let $r_b$
be the number of all rooted isomorphism types of trees of size $b$.

**Theorem.** If
$D\ge b\min(2m_b,r_b)$ for every $b$ with $m_b>0$, then the
chromatic symmetric function of $T$ determines $T$ up to isomorphism
among all trees.

The first bound $D\ge 2m_b b$ applies when the total size of a
branch size class is sufficiently small. The second bound
$D\ge b r_b$ applies independently of the number of repetitions.
In particular any fixed bound on the maximum branch size suffices
for all sufficiently large $n$. The theorem also applies to families
having a fixed number of branches with distinct sizes growing
linearly in $n$, provided each size is at most $D/2$. For example,
take nine pairwise distinct sizes in $[s,2s]$ for $s\ge8$ and
attach arbitrary rooted trees of those sizes to a new vertex.
Their sum is at least $9s$, so every size is at most $D/2$.
This allows unrestricted branch shapes and unbounded diameter.

## The polynomial seen from the centroid

Give the variable $x_i$ weight $i$ and write $\tau_L$ for
truncation to monomials of weight at most $L$. For a tree $T$,
let $U_T$ be the polynomial in which each spanning subforest
contributes the product of the variables indexed by its component
orders. Stanley's power-sum expansion gives $U_T$ from $X_T$.
The sign of the coefficient contributed by a forest with $k$
components is $(-1)^{n-k}$. All forests of a given partition
therefore have the same sign.
[Stanley, §2](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf).

For a rooted tree $(A,w)$ define $P_A$ by multiplying the
component variables in each spanning subforest and omitting
the factor for the component containing $w$. Let $Q_A=P_A+U_A$.
The constant coefficient of $P_A$ and $Q_A$ is one. If $A$
has $a$ vertices, $P_A$ has weight degree at most $a-1$
and $U_A$ is homogeneous of weight $a$. At each root branch
$B$, the edge from the root to $B$ may be retained, giving
a contribution from $P_B$, or cut, giving one from $U_B$.
It follows that

```math
P_A=\prod_{B\text{ a branch at }w}Q_B.
```

The product is one for a single-vertex tree. This is the
root-weight specialization of the rooted $U$-polynomial
product recurrence. For $Q_B$ there is exactly one term
involving $x_b$, namely $x_b$ itself, from the connected
spanning subforest of $B$. Hence $Q_B=x_b+R_B$ where
$R_B$ uses only smaller subscripts and has constant one.

A centroid exists because moving from a vertex into a branch
larger than $n/2$ strictly decreases the size of the largest
branch. A tree has two centroids exactly when an edge separates
two equal halves. If an edge makes that split, its two endpoints
are centroids and every other vertex has a branch larger than
half. If there is no equal split, every branch at a centroid
is strictly smaller than half and every other vertex has a
branch larger than half. The coefficient of $x_{n/2}^2$ in
$U_T$ detects the equal split when $n$ is even.

When the centroid is unique, every connected subgraph of size
strictly greater than $n/2$ contains it. Otherwise that subgraph
would be contained in one of its branches. For each monomial
of $U_T$ with a part greater than $n/2$, retain its coefficient
and remove that single factor. The resulting polynomial is
exactly $\tau_D P_T$, with $T$ rooted at its centroid. Indeed
the other components have total size at most $D$, and any
contribution to $\tau_D P_T$ must come from such a forest.

## Recovering the factors of largest branch size

At an intermediate stage let $F$ be the product of the
remaining branch factors, with $\tau_D F$ known. All remaining
branch sizes are at most $D$. If $F$ is nonempty as a product of
branches, the largest index $b$ of a variable appearing in
$\tau_D F$ is the largest remaining branch size. It appears
because each branch of that size supplies $x_b$ with coefficient
one. Its coefficient as the single-variable monomial $x_b$ is
$m_b$, the number of remaining size-$b$ branches. Factors from
smaller branches cannot contain $x_b$. Thus both parameters are
detected in the truncation.

Write
$F=P_{\mathrm{small}}\prod_{j=1}^{m_b}(x_b+R_j)$,
where $P_{\mathrm{small}}$ contains the factors from smaller
branches. We recover the size-$b$ factors in either of two ways.

### Extraction by the largest power

If $D\ge2m_b b$, the coefficient of $x_b^{m_b}$ in
$\tau_D F$, viewed as a polynomial in $x_b$, is
$\tau_{D-m_bb}P_{\mathrm{small}}$. This gives the smaller product
through weight $m_b b$. Since its constant term is one, it can
be inverted as a power series to that weight. Divide
$\tau_{m_b b}F$ by it with this truncation. The result is the
whole polynomial $\prod_{j=1}^{m_b}(x_b+R_j)$, which has weight
degree at most $m_b b$. Its distinct monic linear factors in
$x_b$, with multiplicities, are now determined by polynomial
factorization. Each is irreducible over the rational polynomial
ring because it has degree one in $x_b$ and leading coefficient
one.

### Extraction using the possible rooted shapes

For each rooted tree $B$ of size $b\ge2$, $R_B=Q_B-x_b$ is
irreducible over the rational polynomial ring. For $b=2$ there
is only one shape and $R_B=1+x_1+x_1^2$. For $b\ge3$, view $R_B$
as a polynomial in $x_{b-1}$. The coefficient of this variable
is $L x_1+\delta$, where $L$ is the number of leaves of $B$ and
$\delta$ indicates that its root is a leaf. In $U_B$, a component
with $b-1$ vertices and one singleton comes from cutting a
leaf edge. In $P_B$, an off-root component of size $b-1$
requires the root itself to be a singleton and the other
vertices to induce a connected tree. This happens exactly
when the root is a leaf and contributes once. There is no
higher power of $x_{b-1}$.

Set all variables except $x_1$ and $x_{b-1}$ to zero. The
constant term in $x_{b-1}$ is a monic integral polynomial of
degree $b$ in $x_1$, with constant coefficient one. Its
leading term comes from cutting all edges in $U_B$ and its
constant term from retaining all edges in $P_B$. It is not
divisible by $Lx_1+\delta$. When $\delta=0$ it is nonzero at
zero. When $\delta=1$, $L\ge2$ and $-1/L$ cannot be a rational
root of a monic integer polynomial. Hence the coefficient and
constant term of $R_B$ in $x_{b-1}$ are relatively prime in
the full ring of smaller variables. This proves irreducibility
by primitivity and degree one. The case $b=1$ just has $R_B=1$.

For each $b$ one can list all $r_b$ rooted shapes and compute their
$R_B$ by the forest definition. These polynomials are distinct.
Indeed, $Q_B$ determines $P_B$ as its terms of weight less
than $b$. By the branch recurrence and the monic linear
irreducibility of $Q_C$ for each smaller branch $C$, factoring
$P_B$ recovers all the $Q_C$. Induction reconstructs the rooted
tree, beginning with the single-vertex tree. This also proves
the rooted reconstruction needed by both extraction arguments.

Evaluate the logarithmic derivative of $F$ at $x_b=0$. The
smaller factors are independent of $x_b$, giving

```math
\frac{(\partial F/\partial x_b)|_{x_b=0}}{F|_{x_b=0}}
=\sum_{B:|B|=b}\frac{c_B}{R_B},
```

where $c_B$ is the multiplicity of the rooted shape $B$.
The known truncation supplies this series through weight
$D-b$. The denominator at the left has constant one, so
the indicated division is defined in the truncated ring.
Multiply by the product of all $r_b$ possible $R_B$. This
gives a polynomial of weight at most $(r_b-1)b$ and therefore
recovers it exactly when $D\ge b r_b$.

The resulting numerator determines the multiplicities uniquely.
For $b\ge2$ the $R_B$ are distinct irreducibles with constant
coefficient one. In a difference of two possible numerators,
reduce modulo any one $R_B$. All terms except the term of
shape $B$ disappear. The product of the other $R$ factors
is not divisible by $R_B$, so the coefficient difference for
that shape is zero. For $b=1$ there is only one coefficient.
This recovers all size-$b$ factors, including repeated shapes.

## Completion and scope

At each size at least one of the two recovery inequalities
holds by hypothesis. Once the size-$b$ product is recovered,
divide it out through weight $D$ using its constant coefficient
one. This permits the same procedure at the next size. Each
recovered factor determines its rooted branch, and joining
them to the centroid reconstructs $T$.

A tree with the same $X_T$ has the same vertex count, the same
equal-split test, and the same initial truncation. At each stage
the same $b$ and $m_b$ are detected from that truncation, so it
satisfies the recovery condition at that stage as well. The
proof therefore distinguishes $T$ among all trees.

The method leaves open centroid size classes too large for both
truncation inequalities. It also lacks the centroid identification
step for two equal halves. The earlier typed core-edge recovery
uses a different part of the symmetric function and has separate
hypotheses.

## Exact diagnostic

```sh
python3 research/stanley-tree-isomorphism/verify_centroid.py
```

The diagnostic enumerates all 65,536 spanning subforests of a
17-vertex tree. It compares the large-component truncation with a
direct rooted enumeration and with the product of directly counted
branch polynomials. The single size-four branch exercises extraction
by the highest power. Two different rooted size-three branches
exercise the second method at a cutoff too small for the first.
