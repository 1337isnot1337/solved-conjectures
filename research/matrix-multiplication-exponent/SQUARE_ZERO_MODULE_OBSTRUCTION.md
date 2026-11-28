# A formal obstruction for the square-zero matrix multiplication module

Status: proved local deformation lemmas and a full obstruction to a
specific module source. Theorem 7 excludes a simultaneous diagonal
smoothing for the tuple (1) whenever $`n\ge2`$ and $`1\le m\le n`$.
It does not exclude other sources for matrix multiplication and does
not decide the matrix multiplication exponent.

## 1. Model

Fix $`n\ge2`$ and $`m\ge1`$, let
$`V=\mathbb C^n\otimes\mathbb C^m`$, and write
$`L_X=X\otimes I_m`$ for $`X\in\mathop{\mathrm{Mat}}_n(\mathbb C)`$.
The commuting tuple, indexed linearly by $`X`$, is

```math
N_X=\begin{pmatrix}0&L_X\\0&0\end{pmatrix}
\quad\text{on }V\oplus V.                       \tag{1}
```

At $`m=n`$ its action tensor contains $`M_n`$. A simultaneous
diagonal smoothing of this tuple would therefore give a
border-rank-$`2n^2`$ upper bound for $`M_n`$.

Consider any formal deformation, still linear in $`X`$,

```math
N_X(t)=
\begin{pmatrix}
tA_X+O(t^2)&L_X+tB_X+O(t^2)
\\ tC_X+O(t^2)&tD_X+O(t^2)
\end{pmatrix},
\qquad [N_X(t),N_Y(t)]=0.                       \tag{2}
```

## 2. A fixed-basis vanishing argument is false

One cannot assert that the lower-left block of every commuting
deformation remains zero. For any endomorphism $`K`$ of $`V`$, let

```math
S(t)=\begin{pmatrix}I&0\\tK&I\end{pmatrix}.
```

Then direct multiplication gives

```math
S(t)N_XS(t)^{-1}
=\begin{pmatrix}
-tL_XK&L_X
\\ -t^2KL_XK&tKL_X
\end{pmatrix}.                                  \tag{3}
```

The tuple (3) commutes because it is a common conjugate of (1),
but its lower-left block is generally nonzero. The omitted terms
in the failed argument are the commutators of the diagonal blocks:
they first occur at order $`t^2`$ and can cancel the first nonzero
lower-left terms. The example with $`K=I`$ already suffices.

This family is only a change of basis of the original nilpotent
tuple; it is not a smoothing.

## 3. Complete first-order classification

**Lemma.** In (2), $`C_X=0`$ for every $`X`$. There are unique
$`K\in\mathop{\mathrm{End}}(V)`$ and a linear map
$`\Phi:\mathop{\mathrm{Mat}}_n(\mathbb C)\to
\mathop{\mathrm{Mat}}_m(\mathbb C)`$ such that

```math
A_X=-L_XK+I_n\otimes\Phi(X),\qquad
D_X=KL_X+I_n\otimes\Phi(X).                     \tag{4}
```

The first-order upper-right coefficient $`B_X`$ is unrestricted
by first-order commutativity.

**Proof.** The diagonal block equations at order $`t`$ are

```math
L_XC_Y-L_YC_X=0,\qquad C_XL_Y-C_YL_X=0.
```

Taking $`Y=I_n`$ shows that
$`C_X=L_XC_I=C_IL_X`$. Thus $`C_I=I_n\otimes H`$ for some
$`H`$. Substitution gives $`[X,Y]\otimes H=0`$ for every pair
$`X,Y`$. Since $`n\ge2`$, there is a nonzero commutator, so
$`H=0`$ and every $`C_X=0`$.

The upper-right equation at order $`t`$ is

```math
L_XD_Y-L_YD_X+A_XL_Y-A_YL_X=0.                  \tag{5}
```

Expand all coefficients in a basis of
$`\mathop{\mathrm{End}}(\mathbb C^m)`$. Because multiplication by
$`L_X`$ acts only on the first factor, it is enough to solve (5)
for $`m=1`$. Put $`X=E_{ij}`$ and $`Y=E_{k\ell}`$. Its
$`(a,b)`$ entry is

```math
\delta_{ai}(D_{k\ell})_{jb}
-\delta_{ak}(D_{ij})_{\ell b}
+(A_{ij})_{ak}\delta_{\ell b}
-(A_{k\ell})_{ai}\delta_{jb}=0.                 \tag{6}
```

Choose $`a\ne i,k`$ and $`b=\ell\ne j`$. It follows that
$`(A_{ij})_{ak}=0`$. Hence $`A_{ij}`$ is supported on row
$`i`$ and the diagonal. The transposed argument shows that
$`D_{ij}`$ is supported on column $`j`$ and the diagonal.

In (6), take $`a=i,b=j,i\ne k,j\ne\ell`$. Then

```math
(D_{k\ell})_{jj}=(A_{k\ell})_{ii}.
```

Since $`i\ne k`$ and $`j\ne\ell`$ vary independently, all these
diagonal entries have a common value $`\lambda_{k\ell}`$.
Subtract $`\lambda_{ij}I_n`$ from both $`A_{ij}`$ and
$`D_{ij}`$. Scalar terms cancel from (5). The remaining matrices
have the forms

```math
A'_{ij}=e_i a_{ij}^{\mathsf T},\qquad
D'_{ij}=d_{ij}e_j^{\mathsf T}.
```

Equation (5) now says

```math
\bigl((d_{k\ell})_j+(a_{ij})_k\bigr)E_{i\ell}
=\bigl((d_{ij})_\ell+(a_{k\ell})_i\bigr)E_{kj}. \tag{7}
```

Whenever $`(i,\ell)\ne(k,j)`$, both coefficients vanish. For
fixed $`j,k`$, first choose $`\ell\ne j`$ to see that
$`(a_{ij})_k`$ is independent of $`i`$, and then choose
$`i\ne k`$ to include the case $`\ell=j`$. There is therefore a
single matrix $`K`$ such that

```math
(a_{ij})_k=-K_{jk},\qquad(d_{k\ell})_j=K_{jk}.
```

This gives $`A'_{ij}=-E_{ij}K`$ and
$`D'_{ij}=KE_{ij}`$. Extending linearly proves (4) for $`m=1`$;
the coefficientwise reduction proves it for arbitrary $`m`$.

For uniqueness, a zero representation at $`X=I_n`$ gives both
$`-K+I_n\otimes\Phi(I_n)=0`$ and
$`K+I_n\otimes\Phi(I_n)=0`$. Characteristic zero implies
$`K=0`$, and then all $`\Phi(X)=0`$. No first-order equation
contains $`B_X`$. This proves the lemma.

Conjugating (2) by the inverse of the shear in (3) removes $`K`$.
Thus, after a permissible common formal change of basis, the
first-order diagonal blocks are both $`I_n\otimes\Phi(X)`$.

## 4. Second-order integrability

**Lemma.** After the first-order shear has been removed, write the
lower-left block as $`t^2R_X+O(t^3)`$. Then

```math
[\Phi(X),\Phi(Y)]=0\quad\text{for every }X,Y,
\qquad R_X=0\quad\text{for every }X.             \tag{8}
```

**Proof.** The two diagonal block equations at order $`t^2`$ are

```math
I_n\otimes[\Phi(X),\Phi(Y)]+L_XR_Y-L_YR_X=0,
I_n\otimes[\Phi(X),\Phi(Y)]+R_XL_Y-R_YL_X=0.     \tag{9}
```

Put $`Y=I_n`$ and subtract the resulting formulas for $`R_X`$.
This gives

```math
[L_X,R_I]=-2I_n\otimes[\Phi(X),\Phi(I_n)].       \tag{10}
```

The partial trace over $`\mathbb C^n`$ of the left side is zero.
Since $`2n\ne0`$, (10) gives
$`[\Phi(X),\Phi(I_n)]=0`$. It follows that $`R_I`$ commutes
with every $`L_X`$, so $`R_I=I_n\otimes H`$, and the
$`Y=I_n`$ equations give $`R_X=X\otimes H`$.

Substituting in (9) yields

```math
I_n\otimes[\Phi(X),\Phi(Y)]+[X,Y]\otimes H=0.
```

Taking the same partial trace gives
$`[\Phi(X),\Phi(Y)]=0`$. A nonzero commutator $`[X,Y]`$ then
forces $`H=0`$. This proves (8).

The lemma alone does not establish a recursive vanishing theorem. At
higher orders the arbitrary upper-right perturbations $`B_X`$
can interact with later diagonal and lower-left coefficients.
Those terms cannot be discarded.

## 5. A necessary condition on first-order eigencharacters

Suppose in addition that the generic tuple (2) is simultaneously
diagonalizable. Let $`s`$ be the dimension of any joint generalized
eigenspace of the commuting tuple $`\Phi(X)`$ on
$`\mathbb C^m`$. Then

```math
2ns\ge n^2+1.                                  \tag{11}
```

To prove this, use the sheared family from Sections 3–4. Conjugate
by $`\mathop{\mathrm{diag}}(tI_V,I_V)`$ and divide each matrix
by $`t`$. All entries remain formal power series because the
lower-left block has order at least three. The special tuple is

```math
\Psi_X=
\begin{pmatrix}
I_n\otimes\Phi(X)&L_X
\\ 0&I_n\otimes\Phi(X)
\end{pmatrix}.                                  \tag{12}
```

Choose one linear combination of the $`\Phi(X)`$ that separates
their distinct joint eigencharacters. The corresponding
generalized-eigenspace decomposition of (12) has blocks of
dimension $`2ns`$. This decomposition lifts to the formal family:
the characteristic-polynomial factors for distinct eigenvalues
are coprime modulo $`t`$, so their polynomial idempotent projectors
lift recursively over $`\mathbb C[[t]]`$. Since every matrix of
the tuple commutes with the chosen one, all these projectors
commute with the entire tuple.

Each block is therefore itself a limit of diagonal tuples on a
$`2ns`$-dimensional space. The span of its identity and all its
$`\Psi_X`$ has dimension $`n^2+1`$: a linear relation among the
$`\Psi_X`$ forces $`X=0`$ from the upper-right block
$`X\otimes I_s`$, and then the identity coefficient is zero.
For a diagonal tuple on a $`d`$-dimensional space, its generated
algebra has dimension at most $`d`$. The same inequality holds in
a limit, because the rank of every finite list of matrix words is
at most $`d`$ and this is a closed minor condition. Applying it
to this block gives (11).

At the target multiplicity $`m=n`$, (11) implies
$`s\ge\lfloor n/2\rfloor+1`$. There cannot be two distinct
joint eigencharacters. After subtracting one scalar linear
functional of $`X`$ from $`\Phi(X)`$, the whole commuting tuple
$`\Phi(X)`$ is therefore jointly nilpotent.

This rejects the simple construction that splits the multiplicity
space by distinct first-order eigencharacters. The first two orders
alone leave possible higher-order deformations through a nilpotent
first-order tuple. The additional algebra-dimension argument below
excludes that remaining case for $`m\le n`$, without rescaling the
multiplicity basis.

## 6. The algebra generated by the first-order limit

For any commuting linear tuple $`\Phi(X)`$ on $`\mathbb C^m`$,
let $`\Psi_X`$ be the matrices in (12), and let $`\mathcal B`$
be their generated unital algebra. Suppose that

```math
\dim\mathcal B\le 2n^2.                         \tag{13}
```

Then every $`\Phi(X)`$ is a scalar matrix.

**Proof.** First suppose the tuple $`\Phi`$ has at least two
distinct joint eigencharacters. Choose a linear combination that
separates them. Polynomial spectral projectors for the corresponding
$`\Psi`$ matrix belong to $`\mathcal B`$ and split its action into
the spaces $`\mathbb C^2\otimes\mathbb C^n\otimes E`$, where
$`E`$ runs through the joint generalized eigenspaces of $`\Phi`$.
To check that these are the spectral spaces, the restriction of
$`\Psi_X-\chi(X)I`$ to the corresponding space is the sum of two
commuting nilpotent operators, while it is invertible on a space
with a different eigenvalue for the chosen linear combination.

On each block, the identity and the $`n^2`$ matrices $`\Psi_X`$
are linearly independent, because their upper-right blocks are
$`X\otimes I_E`$. The central spectral projectors therefore give
at least $`2(n^2+1)`$ independent algebra elements, contradicting
(13). Thus there is only one joint eigencharacter $`\chi`$.
Replacing $`\Phi(X)`$ by $`\Phi(X)-\chi(X)I_m`$ does not change
the generated unital algebra, so assume every $`\Phi(X)`$ is
nilpotent.

Let $`R=\mathbb C[\Phi(X):X\in\mathop{\mathrm{Mat}}_n]`$,
faithfully represented on $`\mathbb C^m`$, and let $`J`$ be its
radical. Then $`R`$ is local, $`R/J=\mathbb C`$, and $`J`$ is
generated by the $`\Phi(X)`$. If some $`\Phi(X)\ne0`$, then
$`J\ne0`$ and $`J/J^2\ne0`$: otherwise $`J=J^2`$ and
nilpotence of $`J`$ would imply $`J=0`$. The classes of the
$`\Phi(X)`$ span $`J/J^2`$, so choose a linear functional
$`\lambda:J/J^2\to\mathbb C`$ for which

```math
\ell(X)=\lambda([\Phi(X)])
```

is nonzero. Fix $`Y`$ with $`\ell(Y)\ne0`$.

Use the faithful inclusion

```math
\mathcal B\ \subseteq
\ \mathop{\mathrm{Mat}}_2\otimes
\mathop{\mathrm{Mat}}_n\otimes R
\ \subseteq
\ \mathop{\mathrm{End}}(\mathbb C^2\otimes\mathbb C^n\otimes\mathbb C^m),
```

and filter its ambient vector space by powers of $`J`$ on the last
factor. Modulo $`J`$, the identity and $`\Psi_X`$ are the
$`n^2+1`$ independent matrices $`I`$ and $`E_{12}\otimes X`$.
Their span therefore intersects the first filtered piece trivially.

The products $`\Psi_X\Psi_Y`$ belong to the first filtered piece.
Modulo its second piece their only contribution is

```math
E_{12}\otimes
\bigl(X\otimes[\Phi(Y)]+Y\otimes[\Phi(X)]\bigr).
```

Applying $`\lambda`$ gives the map

```math
X\longmapsto \ell(Y)X+\ell(X)Y.                \tag{14}
```

This map is invertible: it acts by $`\ell(Y)`$ on
$`\ker\ell`$ and by $`2\ell(Y)`$ on $`\mathbb C Y`$.
Consequently these products span at least $`n^2`$ further
directions, independent of the identity and the original generators.
It follows that

```math
\dim\mathcal B\ge 2n^2+1,
```

again contradicting (13). Thus all nilpotent parts are zero, which
proves the assertion.

This argument was proposed by the parent research worker after the
local calculations above and independently checked by both the
source-audit and spectral workers. It uses an algebra-dimension
constraint on a genuine matrix tuple; no scalar spectral-point
extension is assumed.

## 7. No simultaneous diagonal smoothing for $`m\le n`$

**Theorem 7.** Let $`n\ge2`$ and $`1\le m\le n`$. There is no
formal family $`N_X(t)`$ over $`\mathbb C[[t]]`$, linear in
$`X\in\mathop{\mathrm{Mat}}_n(\mathbb C)`$, whose special tuple
is (1) and whose generic tuple is simultaneously diagonalizable
over an algebraic closure of $`\mathbb C((t))`$.

**Proof.** Assume such a family exists. A simultaneous diagonal
tuple on a $`d`$-dimensional space generates an algebra of
dimension at most $`d`$. This bound passes to a formal special
fibre: every list of $`d+1`$ matrix words is linearly dependent in
the generic fibre, so all its $`(d+1)`$-minors vanish as formal
series and also in the special fibre. Here $`d=2nm\le2n^2`$.

Write its blocks as

```math
N_X(t)=\begin{pmatrix}A_X(t)&Q_X(t)\\C_X(t)&D_X(t)\end{pmatrix},
\qquad Q_X(0)=L_X.
```

We inductively remove all diagonal coefficients by common formal
lower shears and scalar translations. At step $`k\ge1`$, suppose
$`A_X(t),D_X(t)\in t^k\mathop{\mathrm{End}}(V)[[t]]`$.
If a lower-left coefficient first occurs in a degree $`h<2k`$,
the diagonal commutators have order at least $`2k`$, so the
degree-$`h`$ equations are

```math
L_XC_{Y,h}-L_YC_{X,h}=0,
\qquad C_{X,h}L_Y-C_{Y,h}L_X=0.
```

The proof of Section 3 forces that coefficient to vanish. It
follows that $`C_X(t)`$ has order at least $`2k`$.

The degree-$`k`$ upper-right equation is (5), involving only
$`Q_X(0)=L_X`$ and the degree-$`k`$ diagonal coefficients.
Section 3 supplies a matrix $`K_k`$ and a linear tuple
$`\Phi_k(X)`$ with those coefficients equal to

```math
-L_XK_k+I_n\otimes\Phi_k(X),\qquad
K_kL_X+I_n\otimes\Phi_k(X).
```

Conjugate by the inverse of

```math
S_k(t)=\begin{pmatrix}I&0\\t^kK_k&I\end{pmatrix}.
```

The degree-$`k`$ diagonal coefficients are now both
$`I_n\otimes\Phi_k(X)`$. The upper-right blocks $`Q_X(t)`$
are unchanged exactly, and the lower-left blocks still have order
at least $`2k`$. The degree-$`2k`$ diagonal equations are (9).
Section 4 therefore shows that the $`\Phi_k(X)`$ commute and
that the lower-left coefficient of degree $`2k`$ vanishes.

Now conjugate this family by
$`\mathop{\mathrm{diag}}(t^kI_V,I_V)`$ and divide each matrix
by $`t^k`$. It remains a family over $`\mathbb C[[t]]`$: the
diagonal blocks have order at least $`k`$, and the lower-left
blocks have order at least $`2k+1`$. Its special tuple is (12)
with $`\Phi=\Phi_k`$. Its generic tuple is still simultaneously
diagonalizable. Therefore its generated special algebra has
dimension at most $`2nm\le2n^2`$. Section 6 implies

```math
\Phi_k(X)=\chi_k(X)I_m
```

for one scalar linear functional $`\chi_k`$. Return to the
unrescaled sheared family and subtract
$`t^k\chi_k(X)I_{2nm}`$. This preserves commutativity and generic
simultaneous diagonalizability, and makes both diagonal blocks
have order at least $`k+1`$. The induction continues.

Every shear is the identity modulo $`t^k`$, so their product
converges in the $`t`$-adic topology to an invertible common
lower-triangular formal matrix. In fact their lower-left entries
simply add. The scalar translations also converge coefficientwise.
In the resulting formal tuple, both diagonal blocks vanish. Its
lower-left blocks vanish as well, since at step $`k`$ they have
order at least $`2k+1`$. Its upper-right blocks remain the original
$`Q_X(t)`$. Hence the limit of these changes of basis is

```math
\begin{pmatrix}0&Q_X(t)\\0&0\end{pmatrix}.      \tag{15}
```

After base extension to the algebraic closure of
$`\mathbb C((t))`$, this tuple remains simultaneously
diagonalizable: it is obtained from the original generic tuple by
one invertible formal change of basis and one scalar translation
per generator. But every matrix in (15) is square-zero, and a
diagonalizable square-zero matrix is zero. Taking $`X=I_n`$
contradicts $`Q_{I_n}(0)=I_V`$. This proves the theorem.

The proof never discards the higher-order upper-right perturbations.
They are retained throughout, and each inductive calculation uses
only the lowest possible order, at which they cannot contribute.
No rescaling of the multiplicity space is performed.

## 8. Consequence for the identity-completed tensor

Let $`T_{n,m}`$ be the three-tensor with matrix slices
$`I_{2nm}`$ and $`N_{E_{ij}}`$. Define Laurent border rank using
formal rank-$`r`$ tensor families with coefficients in
$`\mathbb C((t))`$ whose entries are integral and specialize to
the specified tensor. Theorem 7 gives

```math
\underline R_{\rm Laurent}(T_{n,m})\ge 2nm+1
\qquad(n\ge2,\ 1\le m\le n).                 \tag{16}
```

Indeed, the identity slice gives a flattening-rank lower bound
$`2nm`$. If a rank-$`2nm`$ formal family existed, write its
rank-one factors in the two matrix directions as the columns of
square matrices $`B(t),C(t)`$, and its slice coefficients as
$`a_{j,s}(t)`$. The identity slice is invertible over
$`\mathbb C[[t]]`$, so

```math
T_0(t)=B(t)\mathop{\mathrm{diag}}(a_{0,s}(t))C(t)^{\mathsf T}
```

being invertible forces $`B,C`$ and the displayed diagonal matrix
to be invertible over the fraction field. Consequently

```math
T_j(t)T_0(t)^{-1}
=B(t)\mathop{\mathrm{diag}}
   \left(a_{j,s}(t)/a_{0,s}(t)\right)B(t)^{-1}.
```

These are simultaneous diagonalizations. They are integral formal
matrices because $`T_0(t)^{-1}`$ is integral, and they specialize
to $`N_{E_{ij}}`$. This contradicts Theorem 7.

Equation (16) is stated explicitly in the Laurent model. Identifying
it with ordinary complex Zariski border rank uses the usual complex
curve criterion for tensor degeneration, rather than an additional
claim about formal algebraization in this note.

At $`m=n`$ this rules out the proposed identity-completed module
source of size $`2n^2`$. It is not a lower bound of $`2n^2+1`$
for $`M_n`$ itself. A source with added trivial directions, a
different identity completion, or a different tensor structure is
outside the theorem.
