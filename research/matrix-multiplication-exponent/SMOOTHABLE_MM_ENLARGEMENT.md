# Smoothable enlargements of the square-zero matrix multiplication algebra

Status: research. The family in Section 2 is a proved smoothing after a
cubic enlargement. It does not improve the matrix multiplication
exponent. No quadratic enlargement is constructed here.

## 1. The candidate algebra and the required statement

For a positive integer $`n`$, let $`A_n`$ have complex vector-space
basis

```math
1,\quad x_{ij},\ y_{jk},\ z_{ik}\qquad(1\le i,j,k\le n).
```

Its unit is $`1`$, its only nonzero products of nonunit basis vectors
are

```math
x_{ij}y_{j'k}=\delta_{jj'}z_{ik},                 \tag{1}
```

and multiplication is commutative. All products involving a $`z`$
and another nonunit basis element vanish. Associativity follows
because every product of three nonunit elements vanishes. Thus

```math
\dim A_n=1+3n^2.
```

Restrict the first input of its multiplication to the $`x`$ span,
the second input to the $`y`$ span, and project the output to the
$`z`$ span. The resulting tensor is matrix multiplication $`M_n`$.
For $`k\ge0`$, write $`A_n[k]`$ for the algebra obtained by adjoining
$`k`$ independent elements annihilated by every nonunit element.

If, for an unbounded sequence of $`n`$, there is a smoothing of
$`A_n[k_n]`$ with $`k_n=n^{2+o(1)}`$, then

```math
\underline R(M_n)\le 1+3n^2+k_n=n^{2+o(1)}.
```

This would imply $`\omega_{\mathbb C}=2`$. Here a smoothing means an
actual flat deformation to a reduced algebra of the same dimension.
The implication follows directly: a reduced complex algebra of
dimension $`d`$ is $`\mathbb C^d`$, whose multiplication tensor has
rank $`d`$; taking the limit and then the displayed restriction gives
the border-rank bound. The general algebra/tensor correspondence is
also stated in Bläser–Lysikov, *On Degeneration of Tensors and
Algebras*, MFCS 2016, Corollary 3.3:

<https://drops.dagstuhl.de/storage/00lipics/lipics-vol058-mfcs2016/LIPIcs.MFCS.2016.19/LIPIcs.MFCS.2016.19.pdf>.

## 2. An explicit splitting family, with its cubic cost

Partition the middle index set $`\{1,\ldots,n\}`$ into nonempty
blocks $`J_0,\ldots,J_{r-1}`$. Adjoin variables
$`w_{a,ik}`$ for $`1\le a\le r-1`$ and $`1\le i,k\le n`$.
Set $`w_{0,ik}=0`$. On the free $`\mathbb C[t]`$-module with basis
$`1,x,y,z,w`$, define

```math
x_{ij}y_{j'k}
=\delta_{jj'}\bigl(z_{ik}+t w_{a,ik}\bigr)
\quad\text{if }j\in J_a,                         \tag{2}
```

with the unit and all other products as in Section 1. This is a
commutative associative algebra over $`\mathbb C[t]`$: again every
triple product of nonunit basis elements is zero. Its underlying
module is free, so the family is flat.

The special fibre is $`A_n[(r-1)n^2]`$. For $`t\ne0`$, the
$`r n^2`$ vectors

```math
z^{(a)}_{ik}=z_{ik}+t w_{a,ik}
\qquad(0\le a\le r-1)
```

form a basis of the combined $`z,w`$ span. In this basis the generic
fibre is the fibre product, over its common residue field
$`\mathbb C`$, of the $`r`$ algebras for the rectangular products
$`(n\times |J_a|)(|J_a|\times n)`$. Products between their distinct
maximal ideals are zero.

For the singleton partition $`r=n`$, each factor is the algebra

```math
B_n\otimes B_n,
\qquad
B_n=\mathbb C[u_1,\ldots,u_n]/(u_i u_j:1\le i,j\le n).
```

The first copy of $`B_n`$ supplies the $`x`$ variables, the second
supplies the $`y`$ variables, and their products supply the $`z`$
variables. Its dimension is $`(n+1)^2`$.

There is an explicit smoothing of $`B_n`$: replace the equations
$`u_i^2=0`$ by $`u_i^2=s u_i`$, retaining
$`u_i u_j=0`$ for $`i\ne j`$. The basis
$`1,u_1,\ldots,u_n`$ is free over $`\mathbb C[s]`$, and the
nonzero fibres are the reduced points $`0,se_1,\ldots,se_n`$.
Taking two such factors gives a smoothing of $`B_n\otimes B_n`$
with a distinguished origin section.

Take the $`n`$ products of these point grids in pairwise disjoint
coordinate blocks, sharing their origin and no other point. Their
coordinate algebra is the fibre product of the grid algebras over
the augmentation at the origin. It is free with basis $`1`$ and
the union of the nonconstant bases of the factors. Its nonzero
fibres are reduced, and its zero fibre is the required fibre
product. Therefore that fibre product is smoothable.

The family (2) places $`A_n[(n-1)n^2]`$ in the closure of
smoothable algebras of the same length. Smoothability is closed
under specialization: the smoothable locus is, by definition, the
closure of the reduced locus in the fixed-length Hilbert scheme
(equivalently, in the corresponding finite-algebra presentation).
Consequently this proves a smoothing of an algebra of length

```math
1+3n^2+(n-1)n^2=n^3+2n^2+1.                    \tag{3}
```

No matrix multiplication algorithm is used as an input to this
construction. Its cubic cost is also explicit. The fully separated
generic fibre has $`n`$ independent output spaces, each of dimension
$`n^2`$; retaining all original $`x,y`$ directions leaves exactly
$`(n-1)n^2`$ extra output directions to add. A quadratic construction
must avoid this complete splitting or change the embedding of the
input directions.

## 3. A module version that avoids imposing algebra structure

Let $`V=\mathbb C^n\otimes\mathbb C^n`$ and
$`M=V\oplus V`$, so $`\dim M=2n^2`$. For each matrix unit
$`E_{ij}`$, define the square-zero endomorphism

```math
N_{ij}=
\begin{pmatrix}
0&E_{ij}\otimes I_n\\
0&0
\end{pmatrix}.
```

All products $`N_{ij}N_{k\ell}`$ vanish, so these endomorphisms
commute. Their action tensor, restricted to the lower copy of
$`V`$ at the input and the upper copy at the output, is $`M_n`$.
Adjoining the identity endomorphism gives a tensor with an
invertible slice.

A simultaneous degeneration of this tuple from diagonal tuples on
$`M`$ would provide a rank-$`2n^2`$ border decomposition, and would
therefore suffice for $`\omega_{\mathbb C}=2`$. This particular
source has now been excluded: [SQUARE_ZERO_MODULE_OBSTRUCTION.md](SQUARE_ZERO_MODULE_OBSTRUCTION.md),
Theorem 7, proves that it admits no formal simultaneous diagonal
smoothing, and Section 8 gives the corresponding Laurent-border-rank
lower bound $`2n^2+1`$ for its identity-completed action tensor.
The proof classifies the leading deformation, applies an algebra
dimension obstruction to its multiplicity part, and iterates by
convergent formal shears. It retains every higher-order upper-right
coefficient. This does not give the same lower bound for $`M_n`$
itself. A subsequent module construction must change the source,
for example by adding trivial directions instead of merely repeating
the same module at multiplicity at most $`n`$.

## 4. Source checks and a circular shortcut to avoid

Flavi–Jelisiejew–Michałek, *Symmetric powers: structure,
smoothability, and applications*, arXiv:2408.02754v2 (29 August
2025), Section 5.2, defines the same square-zero construction for a
partially symmetric tensor. Proposition 5.8, printed page 24, gives
the valid border-rank upper bound equal to the whole algebra
dimension $`1+n+k+m`$. Theorem 5.9 on that page constructs a
smoothable enlargement using a previously known partially
symmetric border rank $`b`$, with $`k=b-m`$.

<https://arxiv.org/pdf/2408.02754v2>.

Using Theorem 5.9 with an assumed quadratic border rank of matrix
multiplication would be circular. The family sought in Section 1
must be constructed without that rank assumption.

The fixed-version PDF also contains two incorrect upper constants
in Corollaries 5.11 and 5.13, printed page 25. Their displayed upper
bounds omit the output dimension $`m`$. This is present in the
actual PDF, not merely an HTML conversion issue. The following
counterexamples use their printed unrestricted output-dimension
hypotheses.

1. In Corollary 5.11, take the universal symmetric product
   $`S^2\mathbb C^3\to S^2\mathbb C^3`$, whose output dimension is
   $`6`$. Its algebra with $`k=0`$ is
   $`\mathbb C[u_1,u_2,u_3]/(u_1,u_2,u_3)^3`$, a smoothable monomial
   algebra. Output flattening gives border rank at least $`6`$,
   while the printed upper bound is $`1+3=4`$.
2. In Corollary 5.13, take the outer product
   $`\mathbb C^3\times\mathbb C^3\to\mathbb C^9`$. Its border rank
   is $`9`$ by output flattening and its nine displayed monomials.
   Its symmetrized algebra at $`k=0`$ is $`B_3\otimes B_3`$, which
   is smoothable by the explicit construction above. The printed
   bound is $`1+2\cdot3=7`$.

For the first example, smoothability can be checked without importing
a classification: the staircase of monomials of total degree at most
$`2`$ has the standard grid-distraction smoothing. The ten points
$`t\alpha`$, for $`\alpha\in\mathbb N^3`$ with $`|\alpha|\le2`$,
specialize flatly to that monomial algebra. Its staircase basis stays
free, as can be seen from the triangular evaluations of the falling
factorial basis.

Only the full-dimension bound of Proposition 5.8 is used here. These
constant errors do not change the quadratic-size smoothing target.
