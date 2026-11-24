# Sun v1: source-certificate audit and quotient obstruction

Research notes, 23 November 2026 (America/Chicago). These notes extend the committed audit;
they do not certify an exponent-two construction or refute its existence.

## Pinned source and access

The source is Zhi-Wei Sun, *Tensor Degenerations for Matrix Multiplication*,
[arXiv:2610.13971v1 PDF](https://arxiv.org/pdf/2610.13971v1), especially
Sections 8--10 and Appendix A. The matching
[v1 HTML](https://arxiv.org/html/2610.13971v1) is now accessible and exposes
the formulas without the PDF extraction ambiguities. The version number,
rather than inconsistent search-engine calendar metadata, is the pin.

## A complete positive check of Lemma 9.2's scalar table

The new checker `check_sun_dense_table.py` transcribes the twenty
nonzero packet columns from Appendix A.3, their original layer labels,
characters, retained support sets, both defect transports, and all sixteen
modules from Table 2. It implements equation (9.7) directly. No Walsh
formula is used to generate the table entries being checked.

For every one of the 4096 triples of indices, exact integer arithmetic gives

```math
C_\lambda(\rho,\beta)=
\begin{cases}
8(-1)^{\langle\rho+3b,\lambda+6\rangle},&\beta=15b,\\
0,&\beta\notin\{0,15\}.
\end{cases}
```

All 1024 entries of the subsequent gauged table equal the stated
unrenormalized Walsh coefficient:

```math
\frac1{128}(-1)^{gb+\langle d,6\rangle}
C_\lambda(d+3b,15b)
=\frac1{16}(-1)^{\langle d,\lambda\rangle+gb}.
```

This is a verification of the integer table and its scalar normalization
after the previously recorded correction that puts the common factor
$`1/128`$ on every surviving support. It does not prove that all the
source-resolved replacement maps have the stated coefficient tensor before
the global decoder. In particular, the scalar table cannot itself supply
the missing three-party locality data.

## What the new source read does and does not specify

The active record lift in equations (9.3)--(9.4) is explicit:

```math
\widehat A=auz+bvz+bus+cwr+e_Xe_Ye_Z,
```

```math
\mathcal R_t=t^{-1}(b+ta)(u+tv)(z+ts)-t^{-1}buz
             +cwr+e_Xe_Ye_Z.
```

Its first dense rank-one block uses four components of $`a`$, its second
uses two components of $`v`$, and the other two use one support each.
The side-colour table does justify the common side-colour labels inside
each block. This observation rules out an objection based only on counting
those support labels: a vector may have several components without adding
source summands.

Appendix A.11 gives an order of composition and schematic maps
$`\widehat F_{S,h,c}^{\rm den}`$ and
$`\widehat F_{S,h,c}^{\rm comp}`$. It does not give the individual entries
of these maps as functions of all source and output indices. Thus the
present audit still cannot instantiate a global sparse trilinear verifier
without choosing additional, unprinted maps. The fixed matrix-unit
decoder and Weyl multiplication identities verify properties of the
desired output; their source-local realization remains a separate step.

For the induction, Definition 10.1(iii) specifies the residual property
itself. Lemma 10.3 cites local first-jet identities for this condition, but
does not write a tensor-valued ordinary-row right-hand side
$`T_{\lambda,g}`$. Lemma 10.4 likewise gives no basis definition of the
old-cycle projection or of the next state's ordinary-row right-hand
sides. Consequently the exact scalar Schur calculation already in the
committed audit determines an operator on right-hand sides, not the right-
hand sides to which the printed construction applies it.

The previously checked conditional physical-cycle reconstruction remains
conditional. Its failure must not be relabelled as a failure of an
unprinted selector.

## A contradiction in the stated one-bit quotient construction

The following conclusion is stronger than an absent verification: the
literal quotient maps and the asserted target in Theorem 3.1 cannot both
be correct over $`\mathbb C`$. The argument also survives the two local
repairs previously recorded for Appendix A.4 and Appendix A.7.

### Deleting a source summand

Let $`S=S'\oplus U`$ be a direct-sum source, and suppose three local Laurent
maps give

```math
(A(t)\otimes B(t)\otimes C(t))S=t^dT+O(t^{d+1}).
```

If the image of $`U`$ is $`O(t^{d+1})`$, restricting these same three maps to
the source factors of $`S'`$ gives a degeneration from $`S'`$ to $`T`$.
Indeed, subtracting the image of $`U`$ preserves both the leading exponent
and its coefficient. In particular an identically zero summand can be
deleted. The argument does not require the maps to preserve direct-sum
coordinates on the output.

### The deleted summand is explicit in the paper

Appendix A.6 writes the character-six module as a diagonal source with
eight directions. Its eighth direction has image $`G_XG_YG_Z`$ and has
only the feature-zero completion role. It has no dense role. Section 9.6
identifies $`G_X,G_Y`$ with the feature $`f=0`$ and defines the local transport
by equations (9.18)--(9.20). In particular, when
$`\pi_4(\alpha_5)=\pi_4(\beta_5)=0`$, these maps give

```math
L_X^{\alpha_5}(G_X)=0,\qquad L_Y^{\beta_5}(G_Y)=0.
```

Section 3.2 restricts every new absolute character to
$`\{0,e_5\}`$. Both four-bit projections therefore vanish for every
allowed absolute character, independently of the old row, the new row,
and the channel. Thus the eighth direction's complete contribution is
zero in **each** outer copy. Subsequent linear maps preserve zero.

This conclusion also follows from the explicit statement in Section 3.3
that the eighth direction can be put above the leading Laurent order.
The literal zero projection is stronger: it avoids any assumption about
the sizes of later Laurent shifts. Equation (3.12) has outer source
$`D_{16}\boxtimes D_2\boxtimes D_2\cong D_{64}`$, so all 64 copies of
the eighth direction can be removed simultaneously.

If Theorem 3.1's claimed target were obtained by these maps, it would
therefore already be obtained from

```math
D_{64}\boxtimes
\left(14C_3\oplus4C_2\oplus7W\oplus5D_4\oplus D_7\right).
```

### Border-rank upper bound of the reduced source

The elementary estimates used here do not require Sun's global claims.
For the big Coppersmith--Winograd tensor

```math
C_q=\sum_{i=1}^q(x_0y_i z_i+x_i y_0z_i+x_i y_i z_0)
     +x_\infty y_0z_0+x_0y_\infty z_0+x_0y_0z_\infty,
```

choose vectors $`v_1,\ldots,v_{q+1}\in\mathbb C^q`$ satisfying
$`\sum_jv_j=0`$ and $`\sum_jv_jv_j^{\mathsf T}=I_q`$. Such vectors exist
by choosing an orthonormal basis of the orthogonal complement of the
all-ones vector in $`\mathbb C^{q+1}`$. Put

```math
\ell_{X,j}(t)=x_0+t\langle v_j,x\rangle+
                \frac{t^2}{q+1}x_\infty,
```

and similarly on the other sides. Expanding gives

```math
t^{-2}\left(\sum_{j=1}^{q+1}
\ell_{X,j}(t)\ell_{Y,j}(t)\ell_{Z,j}(t)
 -(q+1)x_0y_0z_0\right)=C_q+O(t).
```

There are $`q+2`$ rank-one summands, proving
$`\underline R_{\mathbb C}(C_q)\le q+2`$. The three-term tangent tensor
$`W`$ has border rank at most two by expanding

```math
t^{-1}\left((x_0+t x_\infty)(y_0+t y_\infty)(z_0+t z_\infty)
 -x_0y_0z_0\right).
```

The diagonal bounds are immediate. Direct sums and tensor products of
these explicit families, followed by the usual finite-parameter
composition, give the reduced one-row budget

```math
14\cdot5+4\cdot4+7\cdot2+5\cdot4+7=127.
```

Consequently the stated quotient construction would imply

```math
\underline R_{\mathbb C}(M_{64})\le64\cdot127=8128.
```

### Incompatibility with a proved lower bound

J. M. Landsberg and Mateusz Michałek, *A $`2n^2-\log(n)-1`$ lower bound
for the border rank of matrix multiplication*,
[arXiv:1608.07486v1](https://arxiv.org/abs/1608.07486v1), Theorem 1.1,
prove

```math
\underline R_{\mathbb C}(M_N)
\ge2N^2-\lceil\log_2N\rceil-1.
```

The theorem statement was inspected in the
[author-hosted primary PDF](https://people.tamu.edu/~jml/LMsubmmult160825.pdf),
page 1; the arXiv version record lists only v1. For $`N=64`$ it gives

```math
\underline R_{\mathbb C}(M_{64})\ge8192-6-1=8185>8128.
```

Thus the described quotient construction, including its stated
feature-zero transport, cannot yield $`M_{64}`$. This is a contradiction
between explicit assertions and a known theorem, not a numerical
heuristic. It is not a proof that border rank $`8192`$ for $`M_{64}`$ is
impossible, and it is not a disproof of $`\omega_{\mathbb C}=2`$. A different
construction retaining the missing rank-one directions is not excluded.
The contradiction also does not independently decide whether the full
$`M_{1024}`$ construction could be repaired: in that construction the new
absolute characters are not restricted to the line $`\{0,e_5\}`$.

## A separate constraint on the propagation inventory

Equation (10.5) marks 54 of the 80 available $`D_4`$ copies as spare.
The text does not specify their output maps and does not call them zero.
They must therefore not be silently deleted from the printed construction.
Nevertheless, any reconstruction that actually kills all of them fails:
at the first level-$`5`$ to level-$`7`$ step the claimed source budget is
$`2\cdot128^2=32768`$, whereas deletion of those copies gives at most
$`32768-54\cdot4=32552`$. The same imported lower bound gives
$`\underline R(M_{128})\ge32760`$.

More generally, from a claimed $`2N^2`$ budget a valid construction can
discard no more than $`\lceil\log_2N\rceil+1`$ diagonal rank-one directions
while retaining that budget calculation. This makes the nonzero output
maps of the spare and next-state copies an essential part of any repaired
certificate. The inventory by itself does not supply them.

## Verification

The quotient obstruction was independently reviewed against the fixed-version primary formulas by all three research workers and the coordinating reviewer. This is internal review, not external peer review. The finite checks are `check_sun_quotient_budget.py` and `check_sun_dense_table.py`; both use exact standard-library arithmetic. The former checks all 64 outer copies and all eight allowed character triples, and substitutes into the detailed Landsberg--Michałek bound with $`n=w=64`$ and $`m=57`$. The written proof, rather than the script, supplies the source-deletion implication. No Lean verification is claimed.
