# Conditional-height path residues

Research status: Sections 1--4 prove an exact rank statement for an
ordered product of the rational intertwiner matrices. This is not a
four-party source-to-target identity and not a proof of a standard RTT
fusion formula. Section 6 proves that the natural full block braid cancels
every negative pole after the opposite gauge is included.

## 1. The controlled matrix product and its inverse

Fix s>=2, a nonzero complex eta, and k>=1. Write E=C^s and let
q=(q_1,...,q_s) vary over a Zariski-open set on which the finitely many
heights used below have distinct coordinates. The rational matrix
g(z,q) is the matrix defined in [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md):

```math
g(z,q)_{a h}=\frac{(z+\bar q_h)^{\rho_a}}
 {\prod_{j\ne h}(q_h-q_j)},\qquad
\bar q_h=q_h-s^{-1}\sum_jq_j,\quad
\rho=(0,1,\ldots,s-2,s).
```

For a word H=(h_1,...,h_k) in [s]^k define its prefix heights

```math
q^{(t)}(H)=q-s\eta\sum_{r<t}e_{h_r}.
                                                        \tag{1}
```

Let D_t(z_t) act by g(z_t,q-s eta sum_(r<t)e_(h_r)) on tensor
factor t, controlled diagonally by the first t-1 site labels. Set

```math
\mathcal F_k(z_1,\ldots,z_k;q)
 =D_1(z_1)D_2(z_2)\cdots D_k(z_k).                       \tag{2}
```

The rightmost factor acts first. Thus its column H has coefficients

```math
(\mathcal F_k)_{A,H}
 =\prod_{t=1}^k g(z_t,q^{(t)}(H))_{a_t,h_t}.              \tag{3}
```

Each D_t is block diagonal in its control labels, so its inverse is
obtained by replacing each g by its matrix inverse. Since
F_k^(-1)=D_k^(-1)...D_1^(-1), the already produced site labels h_r
control the later inverse factors. Consequently

```math
(\mathcal F_k^{-1})_{H,A}
 =\prod_{t=1}^k
   g(z_t,q^{(t)}(H))^{-1}_{h_t,a_t}.                     \tag{4}
```

Equations (3)--(4) are exact matrix identities, not products with a
suppressed independent summation label. Their intermediate labels are
the single word H. The product has dimension s^k before any exterior
projection.

## 2. The single-matrix residue

Let v(q) be the coefficient row of the monic polynomial

```math
P_q(x)=\prod_{j=1}^s(x-\bar q_j)
```

in the ordered basis of powers x^0,x^1,...,x^(s-2),x^s. The missing
x^(s-1) coefficient is zero because the roots sum to zero. Then

```math
\mathop{\mathrm{Res}}_{z=0}g(z,q)^{-1}
 =s^{-1}{\bf 1}\,v(q).                                 \tag{5}
```

Indeed g(0,q) has right kernel spanned by 1 and left kernel spanned
by v(q). Its determinant has a simple zero by the generalized
Vandermonde formula. Its inverse therefore has a rank-one simple
pole with residue c 1 v(q). Lagrange interpolation gives
g(z,q)1=s z e_top. Multiplying this relation by g(z,q)^(-1), and
using v(q)e_top=1, gives c=1/s.

## 3. A basis at every next height

For any fixed height q with distinct coordinates, the s rows

```math
v(q-s\eta e_h),\qquad 1\le h\le s,                      \tag{6}
```

are linearly independent.

To prove this, put b_j=bar q_j. The centered roots after the h shift
are b_j+eta for j!=h, and b_h-(s-1)eta for j=h. Hence the associated
polynomial is

```math
P_h(x)=P_q(x-\eta)
       +s\eta\frac{P_q(x-\eta)}{x-\eta-b_h}.             \tag{7}
```

Suppose sum_h lambda_h P_h=0. Comparison of the monic x^s terms
gives sum_h lambda_h=0. Equation (7) then gives a linear relation
among the s quotient polynomials P_q(x-eta)/(x-eta-b_h). Evaluating
at x=eta+b_j kills all but the j-th quotient; its value is the
nonzero product prod_(l!=j)(b_j-b_l). Thus every lambda_j=0.

The argument applies separately at every prefix height in (1).
The excluded collision conditions are finitely many proper affine
hyperplanes, so a common allowable q exists.

## 4. All k poles survive the conditional heights

Set z_1=...=z_k=epsilon and take the coefficient of epsilon^(-k)
in (4). Its row H is

```math
s^{-k}v(q)\otimes v(q^{(2)}(H))\otimes\cdots
            \otimes v(q^{(k)}(H)).                      \tag{8}
```

The last site label h_k does not appear in this row. Let
iota: exterior-power-k E -> E^(tensor k) be the ordinary
antisymmetric embedding, with any fixed nonzero normalization.
The row of the residue followed by iota is the corresponding wedge

```math
s^{-k}v(q)\wedge v(q^{(2)}(H))\wedge\cdots
             \wedge v(q^{(k)}(H)).                      \tag{9}
```

For 1<=k<=s, the row span in (9) is exactly

```math
v(q)\wedge\bigwedge^{k-1}E^*,
\qquad
\mathop{\mathrm{rank}}
 \left([\epsilon^{-k}]\mathcal F_k^{-1}\right)\iota
 =\binom{s-1}{k-1}.                                    \tag{10}
```

Here is the full induction. At length one the span is C v(q).
Suppose the prefix wedges of length t span
v(q) wedge exterior-power-(t-1) E^*. For any one prefix, its s
children wedge that prefix with the vectors (6) at its current
height. Section 3 says these children span the wedge of that
prefix with all of E^*. Taking all prefixes gives
v(q) wedge exterior-power-t E^*. This proves (10). The last
space has the stated dimension after extending the nonzero vector
v(q) to a basis of E^*.

Thus the inverse path matrix differs essentially from an ordinary
tensor product of identical rank-one residues. Its conditional
height changes prevent the k-fold wedge from vanishing. If
p=binom(s,k), the fraction in (10) is k/s. In the sparse regime
k->infinity, log k=o(log s), both k/s=p^(-o(1)) and
s^k=p^(1+o(1)). The repeated last label can be removed for this
residue matrix alone, leaving s^(k-1) distinct rows; it cannot
be removed from a still unproved full source identity by assumption.

## 5. The remaining exchange and locality requirements

The controlled products (2) are the explicit path matrices suggested
by the shifted IRF--vertex relation. Sections 1--4 use only their
displayed matrices. Before using the fundamental exchange identity in
Section 6, the following distinctions are necessary:

* Coincident z_t=epsilon and subsequent ordinary exterior projection
  are not the same operation as standard arithmetic-progression RTT
  fusion at u,u-eta,... . Their equality has not been established.
* Equation (10) is a rank statement over rational functions of q.
  It is not a fixed complex C map. A tensor construction must place
  every q-dependent factor at a party that has the flag, or remove
  its q dependence by a proved exchange identity.
* Section 6 calculates the complete natural block exchange and proves
  that its negative pole coefficients vanish after the opposite gauge.
  The residue of an isolated matrix is therefore insufficient.
* A source construction must supply the single shared word H,
  the independent CD-wire word, all scalar C maps, and the legal
  A-D-B product order. Rank (10) alone supplies none of those
  missing cancellations.

The direct algebra above identifies a way for k inverse-gauge residues
to survive before the opposite gauge is applied. The next section
checks that opposite gauge in the natural block-braiding construction.
It gives exact cancellation there.

## 6. The natural dynamical block braid cancels every negative pole

This section uses the fundamental shifted IRF--vertex identity
Atalikov--Zotov, [arXiv:2303.02391v1](https://arxiv.org/abs/2303.02391v1), equation (1.17), with shift
normalization (1.16) and the rational dynamical matrix (3.1). The
identity was independently checked as an exact rational matrix
equality at s=3 in check_shifted_path_residue.py. The following
extension to a path is proved directly from that identity.

Let check R_V=P R_V and check R_D=P R_D, where P interchanges
the two adjacent tensor factors. For a spectral list Z=(z_1,...,z_n)
and an adjacent position t, let s_t Z interchange z_t,z_(t+1).
With F_n defined in (2), the exact adjacent relation is

```math
\check R_{V,t}(z_t-z_{t+1})\mathcal F_n(Z;q)
 =\mathcal F_n(s_tZ;q)\,
   \check R_{D,t}\!\left(z_t-z_{t+1};
     q-s\eta\sum_{r<t}E^{(r)}\right).                  \tag{11}
```

Here E^(r) means the diagonal site-label control at factor r;
on a prefix word its height is exactly (1). The parameter eta
of both R matrices is fixed and nonzero.

For n=2, equation (11) is (1.17) after multiplying by P: the
two left gauge factors are g_1(z_1,q) and
g_2(z_2,q-s eta E^(1)), and the exchanged path factors are
g_1(z_2,q) and g_2(z_1,q-s eta E^(1)). For general n, the
vertex R commutes with all preceding controlled gauges because
it is constant in q and acts only on factors t,t+1. Apply the
two-factor identity at the prefix height. The dynamical matrix
in (3.1) has only diagonal and swap matrix units. It therefore
preserves the total site weight in these two factors. Every later
controlled gauge depends on them only through that total weight,
so the dynamical matrix commutes past all later gauges. This proves
(11), including its control labels and order.

Now take n=2k and the spectral list

```math
Z(\epsilon)=(u,\ldots,u,\epsilon,\ldots,\epsilon),
\qquad u\ne0.                                         \tag{12}
```

Use adjacent exchanges to move the second block to the front,
crossing every u strand with every epsilon strand once. There
are exactly k^2 exchanges. Iterating (11), in its actual ordered
products, gives

```math
\mathcal B_V(u-\epsilon)\mathcal F_{2k}(Z(\epsilon);q)
 =\mathcal F_{2k}(wZ(\epsilon);q)
    \mathcal B_D(u-\epsilon;q),                        \tag{13}
```

where w swaps the blocks, B_V is a product of fixed complex
vertex R matrices at each fixed epsilon, and B_D is the corresponding
ordered product of dynamical R matrices at the controlled prefix
heights. No R matrix at a within-block difference zero is used.
The equality holds first away from poles, and hence as a rational
matrix identity and as a Laurent identity at epsilon=0.

Every dynamical factor (3.1) has spectral denominators only
z_t-z_(t+1) and the fixed nonzero eta. In this braid each crossed
difference is u-epsilon. Its other denominators are differences of
coordinates at finitely many shifted q heights. Choose q outside
those collision hyperplanes. Therefore B_D is regular at epsilon=0.
Multiplying (13) by the inverse opposite gauge gives

```math
\mathcal F_{2k}(wZ(\epsilon);q)^{-1}
 \mathcal B_V(u-\epsilon)
 \mathcal F_{2k}(Z(\epsilon);q)
 =\mathcal B_D(u-\epsilon;q),                          \tag{14}
```

and consequently

```math
[\epsilon^{-j}]
 \left(\mathcal F_{2k}(wZ)^{-1}\mathcal B_V
                    \mathcal F_{2k}(Z)\right)=0
\quad\hbox{for every }j\ge1.                          \tag{15}
```

In particular, the coefficient of epsilon^(-k) vanishes even
though the inverse path matrix by itself has the nonzero exterior
rank (10). Every fixed exterior projection at the local outputs
preserves the zero equality (15). The rectangular word dimension
s^k rather than binom(s,k) does not change this cancellation.

This excludes the proposed extraction of a nonzero all-k negative
residue from the complete natural dynamical block exchange (14).
It does not exclude a different semidynamical twist with genuine
absolute-height poles, a different local middle operator, or a
construction retaining other coefficients. Those alternatives still
need an actual shared-source six-index identity, including all
nonzero difference-shift coefficients and fixed scalar C maps.

## 7. Reproducible exact checks

check_shifted_path_residue.py checks the rank in (10) at
(s,k)=(3,2),(4,2),(5,3), both matrix inverse products in (3)--(4)
at s=3,k=2, and the complete fundamental shifted relation at s=3.
The script exits unsuccessfully if that relation has any nonzero
matrix coefficient. The general statements use the proofs above;
these finite checks supplement them.

The related single-shift source-column limitation is
[COLUMNWISE_OPERATOR_WEIGHT_BOUND.md](COLUMNWISE_OPERATOR_WEIGHT_BOUND.md).
It does not assign one shift to a full Lax column that retains many
independent internal subset shifts.
