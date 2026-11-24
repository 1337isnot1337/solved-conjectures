# The size-three trace-cubic apolar algebra is not smoothable

Research note, 23 November 2026 (America/Chicago). This is a failed-source
certificate for one proposed route to exponent two. The finite rank part
is computer-assisted, using exact arithmetic and the attached reproducible
certificate. No Lean verification is claimed, and no superquadratic
matrix multiplication lower bound follows.

## 1. Statement and imported theorem

Let $`X=(x_{ij})_{1\le i,j\le3}`$ be a matrix of nine independent
variables. Put

```math
F(X)=\mathop{\mathrm{tr}}(X^3),\qquad
S=\mathbb C[z_{11},\ldots,z_{33}],\qquad
I=\{D\in S:D(\partial/\partial x)F=0\},\qquad A=S/I.
```

**Proposition.** The algebra $`A`$ has Hilbert function
$`(1,9,9,1)`$ and length $`20`$. Its negative tangent space consists
exactly of translations. In particular, $`A`$ is not smoothable.

Thus the candidate assertion that the apolar algebra of
$`\mathop{\mathrm{tr}}(X^3)`$ is smoothable for every matrix size
already fails at size three. This excludes that particular proposed
source family. It says nothing against using a different algebra, adding
extra directions, using a different apolar scheme, or proving a small
asymptotic rank without finite smoothability.

The imported smoothability criterion is Jelisiejew,
[*Elementary components of Hilbert schemes of points*,
arXiv:1710.06124v5](https://arxiv.org/pdf/1710.06124v5),
7 April 2019, **Theorem 1.2(1)**. The fixed-version PDF is also hosted
[here](https://pi.math.cornell.edu/~mike/7670-fa20/references/jelisiejew-2017.pdf).
It states that a finite scheme supported at the origin and having
trivial negative tangents is not smoothable or cleavable unless it is a
single point. Immediately before that theorem, trivial negative tangents
means that translations span $`\mathop{\mathrm{Hom}}_S(I,A)_{<0}`$.
The proof below establishes exactly this hypothesis.

## 2. One finite integer-matrix certificate

Write $`S_d`$ for the homogeneous degree-$`d`$ differential polynomials.
Order monomials by lexicographically ordered nondecreasing tuples of
variable indices, with matrix entries in row-major order. The map

```math
C_2:S_2\longrightarrow\langle x_{11},\ldots,x_{33}\rangle,
\qquad q\longmapsto q(\partial)F
```

has an integer $`9\times45`$ matrix of rank nine. The first derivatives
are also independent: $`\partial F/\partial x_{ij}=3(X^2)_{ji}`$,
and their diagonal-square and off-diagonal-times-diagonal coefficients
distinguish them. The degree-three derivative space has dimension one,
and all higher derivatives vanish. Hence the Hilbert function is
$`(1,9,9,1)`$.

Construct a rational basis $`q_1,\ldots,q_{36}`$ of
$`I_2=\ker C_2`$ by row reduction, and clear denominators separately
in each basis vector. These are integer polynomials. The products

```math
q_hq_k\qquad(1\le h\le k\le36)
```

give $`666`$ integer columns in the degree-four monomial space of
dimension $`\binom{12}{4}=495`$. The certificate proves that this
$`495\times666`$ matrix has rank $`486`$ modulo the prime $`1009`$.
A nonzero minor modulo a prime is a nonzero integer minor, so its rank
over $`\mathbb C`$ is at least $`486`$.

For any homogeneous ideal $`J\subset S`$, write

```math
J^\perp_d=\{G\in\mathbb C[x_{11},\ldots,x_{33}]_d:
                   D(\partial)G=0\text{ for every }D\in J\}.
```

This space is the dual of $`S_d/J_d`$ under the nondegenerate apolar
pairing. To see that testing the degree-$`d`$ part of $`J`$ is enough,
multiply every lower-degree $`D\in J`$ by all monomials of complementary
degree and use nondegeneracy of the same pairing.

Every quartic $`\ell F`$, with $`\ell`$ linear, lies in
$`(I^2)^\perp_4`$. Indeed, for $`q,q'\in I_2`$,

```math
q q'(\ell F)=q([q',\ell]F)=[q',\ell](qF)=0,
```

where the commutator $`[q',\ell]`$ is a constant-coefficient
first-order differential operator. The other terms vanish because
$`qF=q'F=0`$. Since $`I_0=I_1=0`$, the degree-four part of
$`I^2`$ is exactly the span of the products just considered.

The nine quartics $`x_{ij}F`$ are independent. Thus the rank lower
bound and this nine-dimensional included space force

```math
(I^2)^\perp_4=F\cdot\mathbb C[x_{11},\ldots,x_{33}]_1.
\tag{1}
```

The script separately checks the inclusion by the exact integer
apolar pairing, including its multi-index factorial factors. No modular
nullspace is lifted to characteristic zero.

## 3. There are no higher inverse-system pieces

First, $`F`$ is irreducible. A nontrivial factorization can be chosen
homogeneous. Restricting it to diagonal matrices would factor

```math
x_{11}^3+x_{22}^3+x_{33}^3
```

into two nonzero homogeneous polynomials of positive degree. This
Fermat cubic is irreducible: considered as a cubic in $`x_{11}`$ over
$`\mathbb C(x_{22},x_{33})`$, reducibility would give a root in that
field. But $`-(x_{22}^3+x_{33}^3)`$ is not a cube there, since its
valuation at $`x_{22}+x_{33}`$ is one. Gauss's lemma finishes the
argument. Neither restricted factor could vanish, because their product
is the nonzero Fermat cubic.

Now let $`G\in(I^2)^\perp_5`$. Differentiation preserves the inverse
system, so (1) gives $`\partial_aG=F\ell_a`$ with linear $`\ell_a`$
for each variable. Euler's identity implies

```math
5G=\sum_a x_a\partial_aG=F\sum_a x_a\ell_a,
```

and therefore $`G=FQ`$ for a quadratic polynomial $`Q`$. Differentiating
this equality and using divisibility of every $`\partial_aG`$ by $`F`$
shows that $`F`$ divides $`Q\partial_aF`$. Choose a nonzero
$`\partial_aF`$. It has degree two, so irreducibility of $`F`$ forces
$`F\mid Q`$, which is impossible unless $`Q=0`$. Hence

```math
(I^2)^\perp_5=0.
```

Every higher homogeneous inverse-system element also vanishes, by repeated
differentiation and characteristic zero. Thus $`(I^2)^\perp_d=0`$
for every $`d\ge5`$.

## 4. Frobenius duality and negative tangents

The apolar algebra of a homogeneous cubic is graded Gorenstein with
socle degree three. Explicitly, the functional

```math
\lambda:A_3\longrightarrow\mathbb C,
\qquad [D]\longmapsto D(\partial)F
```

induces nondegenerate multiplication pairings
$`A_i\times A_{3-i}\to\mathbb C`$. Nondegeneracy follows directly
from the definition of the apolar ideal: any nonzero derivative of
degree $`3-i`$ has some complementary derivative which is nonzero.

Let $`M=I/I^2`$, a finite $`A`$-module. Composition with $`\lambda`$
gives a graded Frobenius-duality isomorphism

```math
\mathop{\mathrm{Hom}}_S(I,A)_e
=\mathop{\mathrm{Hom}}_A(M,A)_e
\simeq M_{3-e}^{*}.
\tag{2}
```

For completeness, a linear functional $`L:M\to\mathbb C`$ determines
a unique $`A`$-linear map $`\phi:M\to A`$ by
$`\lambda(a\phi(m))=L(am)`$ for every $`a\in A`$, using the
nondegenerate multiplication pairing. Associativity proves
$`\phi(bm)=b\phi(m)`$. The grading gives the degree convention in (2).

For $`e<0`$, one has $`3-e\ge4`$ and $`I_{3-e}=S_{3-e}`$.
Consequently (1), the vanishing in Section 3, and (2) give

```math
\dim\mathop{\mathrm{Hom}}_S(I,A)_{-1}=9,
\qquad
\mathop{\mathrm{Hom}}_S(I,A)_e=0\quad(e\le-2).
```

The nine translation maps
$`q\mapsto\partial q/\partial z_a\pmod I`$ are genuine degree
$`-1`$ module homomorphisms: the extra Leibniz term is a multiple of
$`q\in I`$. They are independent. Otherwise $`I`$ would be stable
under a nonzero constant directional derivative $`D`$. Choose a linear
$`\ell`$ with $`D\ell=1`$. Since $`\ell^4\in I`$, repeated
differentiation would imply $`4!\in I`$, a contradiction.

Thus all negative tangent vectors are translations. Jelisiejew's
Theorem 1.2(1) applies to this length-twenty scheme supported at the
origin and proves that it is not smoothable. This proves the proposition.

## 5. Reproduction and scope

Run

```text
python3 check_trace_cubic_nonsmoothable.py
```

The script constructs $`F`$ from its $`27`$ cyclic-index terms,
differentiates exactly, constructs the rational quadratic apolar basis
using `Fraction`, clears denominators, and forms all $`666`$ products.
It checks their rank modulo $`1009`$ and verifies the nine claimed
annihilators over the integers. NumPy is used only for finite integer
arrays. Explicit bounds in the script certify that every integer-array
product and sum stays inside the signed 64-bit range. There is no
floating-point arithmetic or randomness.

Nonsmoothability of this particular apolar algebra does not establish
that the trace cubic itself has border rank greater than twenty. It also
does not rule out quadratic or nearly quadratic border rank of matrix
multiplication by another construction. The matrix multiplication
exponent is unresolved by this certificate.

## 6. Tensor powers of the same algebra remain nonsmoothable

The failed-source certificate persists under positive tensor powers of
this algebra. This statement concerns smoothability of the algebra and
does not give an asymptotic tensor-rank gap.

More generally, let $`A=S/I`$ and $`B=T/J`$ be connected nonnegatively
graded Artinian complex algebras with trivial negative tangents, where
$`S,T`$ are polynomial rings on disjoint degree-one variables. Put
$`C=A\otimes B`$ and $`K=I\otimes T+S\otimes J`$. The conormal
module splits as

```math
K/K^2\cong (I/I^2)\otimes B\;\oplus\;A\otimes(J/J^2).
```

Indeed, modulo $`K^2`$ the two summands generate and their intersection
$`I\otimes J`$ vanishes; reducing coefficients gives the displayed
quotients. Applying $`\mathop{\mathrm{Hom}}_C(-,C)`$ gives

```math
\mathop{\mathrm{Hom}}_{S\otimes T}(K,C)
\cong
\mathop{\mathrm{Hom}}_S(I,A)\otimes B
\;\oplus\;
A\otimes\mathop{\mathrm{Hom}}_T(J,B).
```

These are graded isomorphisms. For example, expanding an output in a
complex vector-space basis of $`B`$ identifies the first Hom module
with $`\mathop{\mathrm{Hom}}_A(I/I^2,A)\otimes B`$.
Each tangent factor has negative part only in degree $`-1`$, spanned
by its translations. The other tensor factor has no negative degrees
and has degree-zero part $`\mathbb C`$. Therefore the negative
part of the displayed module consists exactly of the translations of
the two original variable sets. Thus $`C`$ again has trivial negative
tangents.

Inductively, every $`A^{\otimes m}`$ for the algebra of Section 1
has this property. It is supported at the origin and has length
$`20^m>1`$, so Jelisiejew's Theorem 1.2(1) makes it nonsmoothable.
This does not exclude other apolar schemes, larger smoothable
algebras, or subexponential source overhead.
