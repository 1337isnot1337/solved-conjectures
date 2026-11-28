# Nonrectangular polynomial sources and a coordinate-embedding obstruction

Research note, 23 November 2026 (America/Chicago). The cheap-source lemma
below is established mathematics, reconstructed explicitly here. No
matrix multiplication exponent improvement is proved.

## 1. A source for every finite lower ideal

Let D be a nonempty finite lower ideal in $\mathbb N^d$: if $\alpha\in D$
and $0\le\beta\le\alpha$ coordinatewise, then $\beta\in D$. Define

```math
A_D=\mathbb C[x_1,\ldots,x_d]/
 (x^\alpha:\alpha\notin D).
```

Its basis is $`\{x^\alpha:\alpha\in D\}`$, and its multiplication tensor is

```math
T_D=\sum_{\substack{\alpha,\beta\in D\\\alpha+\beta\in D}}
 e_\alpha\otimes e_\beta\otimes e_{\alpha+\beta}.
```

Then $\underline R(T_D)=|D|$.

Here is an explicit proof. For every minimal element $\alpha$ outside D,
replace the ideal generator $x^\alpha$ by

```math
f_{\alpha,t}(x)=
 \prod_{i=1}^d\prod_{j=0}^{\alpha_i-1}(x_i-tj).
```

At $t=0$ this is the original monomial. These polynomials are monic with
leading monomials $x^\alpha$ for any order refining total degree, so the
monomials indexed by D span the quotient. If $t\ne0$, all the distinct
points $t\beta$, $\beta\in D$, annihilate every generator: for each
excluded $\alpha$, a point index $\beta\in D$ has some coordinate
$\beta_i<\alpha_i$. Thus the quotient has dimension at least |D|, and
the spanning bound gives equality. Its evaluation algebra is exactly
$\mathbb C^{|D|}$.

Over $\mathbb C[t]$, the same monic reductions show that D spans the
quotient. A relation among those monomials would specialize to a relation
for every nonzero t, where evaluation proves independence, so all its
coefficients vanish. Thus D is a free basis of the family. Its structure
constants specialize to those of $A_D$, and for $t\ne0$ multiplication
is isomorphic to the rank-|D| diagonal tensor. This proves the upper
bound. Contraction with the algebra unit gives an identity matrix of
size |D|, proving the lower bound.

The general smoothable-algebra connection is Bläser–Lysikov,
[*On degeneration of tensors and algebras*, MFCS 2016,
Corollaries 3.3 and 3.6](https://drops.dagstuhl.de/storage/00lipics/lipics-vol058-mfcs2016/LIPIcs.MFCS.2016.19/LIPIcs.MFCS.2016.19.pdf),
restated as Proposition 4.1 of Homs–Jelisiejew–Michałek–Seynnaeve,
[arXiv:2103.12598v3](https://arxiv.org/pdf/2103.12598v3).
The latter paper, Section 5, also explicitly discusses monomial
algebras. The construction above is an explicit grid distraction;
it is not claimed as a new smoothing theorem.

Simplex domains, lower ideals cut out by several positive linear
inequalities, and unions of lower boxes are therefore all legitimate
cheap sources. Their cost is the number of lattice points in D, not
the size of a containing box.

## 2. Full matrix multiplication cannot come from coordinate selection

The following restricted obstruction is elementary. It explains why
choosing a more efficient degree domain is not enough by itself.

### Proposition

Suppose a full nonzero weighted size-n matrix multiplication tensor
is obtained from $T_D$ by selecting one distinct monomial basis element
for every target variable on each leg and rescaling those variables.
Then $|D|\ge n^3$.

The same bound holds if, after that coordinate selection, one also
uses diagonal Laurent-power weights and takes the leading coefficient.
It does not cover general linear combinations, maps that merge several
source basis vectors into one target variable, or partial support.

### Proof for coordinate restrictions

Write the selected exponent vectors as
$\alpha_{ij},\beta_{jk},\gamma_{ki}\in D$; on each of the three legs
the selected vectors are distinct. Every desired cycle has a nonzero
coefficient, so

```math
\alpha_{ij}+\beta_{jk}=\gamma_{ki}\qquad\text{for all }i,j,k.
```

Fixing one middle index and subtracting these equations gives vectors
$u_i,v_j,w_k\in\mathbb Z^d$ such that

```math
\alpha_{ij}=u_i+v_j,\qquad
\beta_{jk}=w_k-v_j,\qquad
\gamma_{ki}=u_i+w_k.
```

Let $v_{\max}$ be the coordinatewise maximum of the vectors $v_j$.
For every triple set

```math
\delta_{ijk}=u_i+w_k+v_j-v_{\max}.
```

Since $w_k-v_j\ge0$ for every j, one has
$w_k-v_{\max}\ge0$. Hence
$\delta_{ijk}=(u_i+v_j)+(w_k-v_{\max})\ge0$.
Also $\delta_{ijk}\le u_i+w_k=\gamma_{ki}\in D$.
The lower-ideal property therefore puts all $\delta_{ijk}$ in D.

If $\delta_{ijk}=\delta_{i'j'k'}$, then

```math
\alpha_{ij}+\beta_{j'k}=\gamma_{k'i'}.
```

The associated source monomial survives the coordinate restriction.
Its target is $X_{ij}Y_{j'k}Z_{k'i'}$, which is a matrix multiplication
cycle only if $i=i'$, $j=j'$, and $k=k'$. Off-cycle exclusion therefore
makes the $n^3$ vectors $\delta_{ijk}$ distinct. Thus $|D|\ge n^3$.

### Diagonal degeneration extension

Normalize the desired leading degree to zero. Let the three diagonal
weight arrays be $a_{ij},b_{jk},c_{ki}$. Nonzero coefficients at every
desired cycle require

```math
a_{ij}+b_{jk}+c_{ki}=0\qquad\text{for all }i,j,k.
```

The same subtraction argument gives scalars $r_i,s_j,t_k$ with

```math
a_{ij}=r_i+s_j,\qquad
b_{jk}=t_k-s_j,\qquad
c_{ki}=-r_i-t_k.
```

A collision $\delta_{ijk}=\delta_{i'j'k'}$ produces two source
monomials with target variables

```math
X_{ij}Y_{j'k}Z_{k'i'},\qquad
X_{i'j'}Y_{jk'}Z_{ki}.
```

Their diagonal weights are opposites. Unless the triples are identical,
both targets are off-cycle. Both would need strictly positive weight
to disappear without a negative leading coefficient. This is impossible.
There is no cancellation here: a coordinate selection gives at most one
source monomial for each target basis triple. The same injection into D
therefore proves the bound.

## 3. Remaining constructive possibilities

This obstruction applies to full support. A partial support need not
force the displayed additive-potential equations for every triple, and
general linear changes can also escape the proof. Those are the actual
remaining choices for the polynomial-source attack.

Li, [arXiv:2611.04175v1](https://arxiv.org/abs/2611.04175v1),
Theorem 2.11, gives $`m^{\omega/3}\le r`$ for a partial weighted
matrix multiplication tensor with $`m`$ nonzero cycles and border rank
at most $`r`$. It gives a concrete target: construct, by legal local maps, partial matrix multiplication
support of size $N^{3-o(1)}$ from a domain with
$|D|=N^{2+o(1)}$. All off-cycle coefficients must vanish. No such
family has been constructed here. The implication is explicit:
$`r\le|D|=N^{2+o(1)}`$ and $`m=N^{3-o(1)}`$ would give
$`\omega\le3(2+o(1))/(3-o(1))`$, and hence $`\omega=2`$.

Tensor products of boxes merely recover products of one-variable sources.
For a nonrectangular source, any new packing or extraction must be stated
as an actual degeneration with its coefficient maps. The lower rank
bound on $T_D$ alone is a supply of sources, not an extraction theorem.
