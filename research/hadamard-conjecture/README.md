# Hadamard conjecture

**Status (2026-11-24).** The all-order conjecture remains open. This
checkpoint proves an obstruction to composing odd-size quaternionic
Hadamard arrays by an entrywise quaternion product and arbitrary orthogonal
changes of basis on its real four-dimensional block rows and columns.
It also identifies the unique residue rule for a different, position-dependent group-developed
composition. A second obstruction rules out every fixed entrywise block rule.
It establishes no new Hadamard order. There is no
independent review, Lean verification, or priority claim.
[Tracking issue #340](https://github.com/1337isnot1337/solved-conjectures/issues/340).

## Target and primary sources

For every positive integer $n$, the conjecture asks for a $4n$ by $4n$
matrix $H$ with entries in $`\{-1,1\}`$ and $HH^{\mathsf T}=4nI$.
Hadamard discussed this possibility in his 1893 paper on the determinant
bound. Paley explicitly formulated the general expectation in 1933 and
gave constructions at infinitely many orders. The statement would attain
Hadamard's determinant bound for all admissible orders and supply
orthogonal sign designs of unrestricted admissible size.
[Hadamard, 1893](https://zenodo.org/records/18674602),
[Paley, 1933](https://onlinelibrary.wiley.com/doi/10.1002/sapm1933121311).

The bounded source check on 2026-11-24 used the all-order statement,
Paley's formulation, and the quaternionic construction literature.
Alpöge, Voinov and Reynolds-Haertle announced twelve constructions
below 2000 in August. Egan, Kotsireas, London and Ó Catháin
independently verified those matrices and retain the all-order
statement as open. The November construction account credits the
search and constructions to Claude under the three supervisors. The OpenAI preprint on **circulant** Hadamard
matrices concerns a separate restriction.
[November construction account](https://hexagonmath.org/pdf/2611.00637v1),
[Egan–Kotsireas–London–Ó Catháin](https://arxiv.org/abs/2610.27175),
[Circulant Hadamard preprint](https://github.com/openai/math/tree/main/preprints/The-circulant-Hadamard-conjecture-September-23-2026).

The passage from a quaternionic perfect array to a sign matrix is the
quaternion construction underlying Williamson-type matrices. The
odd-order product condition in the inversion-symmetric special case
is Williamson's product theorem. The proofs below use the Hurwitz
residue field to address a different obstruction, composition with
independent row and column changes of basis. The bounded search
located no statement of this obstruction.
[Bennett–Bright–Colinot–Nayak, quaternionic perfect sequences](https://arxiv.org/abs/2601.22337),
[Bright, Williamson's product theorem](https://cs.uwaterloo.ca/~cbright/reports/williamson-product-theorem.pdf).

## Composition obstruction

Let $T$ be the group of 24 Hurwitz units, and let $P$ denote its
16 units with all four coordinates equal to $\pm1/2$.
For a quaternion matrix let $`Q^*`$ mean transpose with each entry
quaternion-conjugated.

**Theorem.** Suppose $n,m>1$ are odd. Let $Q=(q_{ik})$ and
$R=(r_{jl})$ be square quaternion matrices of sizes $n,m$,
respectively, with entries in $P$ and satisfying $`QQ^*=nI`$,
$`RR^*=mI`$. The product array

```math
A_{(i,j),(k,l)}=q_{ik}r_{jl}
```

satisfies $`AA^*=nmI`$. However, there are no real orthogonal $4$ by $4$ matrices
$U_{(i,j)}$ and $V_{(k,l)}$ for which every block
$U_{(i,j)}L(A_{(i,j),(k,l)})V_{(k,l)}$ has all entries in
$`\{-1/2,1/2\}`$. Here $L$ is the real matrix of left quaternion multiplication.

Each entry of the real $4$ by $4$ left multiplication matrix $L(q)$
for $q\in P$ is $\pm1/2$. Also $L(q)^\mathsf T=L(\bar q)$.
Thus replacing each quaternion entry of $Q$ by $2L(q)$ produces
a Hadamard matrix of order $4n$. The theorem excludes a direct
version of this construction at order $4nm$ from the two arrays.
The orthogonality of $A$ follows by summing first over $l$.

```math
\sum_{k,l}q_{ik}r_{jl}\overline{r_{j'l}}\overline{q_{i'k}}
=m\delta_{j,j'}\sum_k q_{ik}\overline{q_{i'k}}
=nm\delta_{j,j'}\delta_{i,i'}.
```

### The binary matrix behind an odd array

Let $h=(1+i+j+k)/2$. The Hurwitz order has integral basis $1,i,j,h$.
There is a ring homomorphism $\phi$ to $\mathbb F_4$ determined by

```math
\phi(1)=\phi(i)=\phi(j)=1,\qquad
\phi(h)=\omega,\qquad \omega^2+\omega+1=0.
```

For verification, $k=2h-1-i-j$ has image $1$.
The products of $i,j$ follow from $i^2=j^2=-1$, $ij=k$, $ji=-k$.
Also $h^2=h-1$, $ih=h-1-j$, $hi=i+j-h$, $jh=i+j-h$, and
$hj=h-1-i$. These products verify multiplicativity on the basis.
Conjugation corresponds to squaring in $\mathbb F_4$ since
$\bar h=1-h$ and $\overline i=-i$, $\overline j=-j$.
The eight coordinate units $\pm1,\pm i,\pm j,\pm k$ map to $1$.
Each element of $P$ is $h$ minus a sum of distinct elements of
$`\{1,i,j,k\}`$, so the residues of $P$ are $\omega,\omega^2$.
In particular the exponent map $\rho:T\to\mathbb Z/3$ defined
by $\phi(t)=\omega^{\rho(t)}$ has kernel the quaternion group
of eight coordinate units. These are exactly the elements of
$T$ of order dividing four, since the other elements have a
nontrivial image of order three.

Reduce $`QQ^*=nI`$ by $\phi$. Write the resulting matrix as
$M=B+\omega^2J$, with $B$ binary and $J$ the all-ones matrix.
Then $`MM^*=I`$ in $\mathbb F_4$. If $p_i$ is the parity of
row $i$ of $B$, its $(i,j)$ entry reads

```math
(BB^{\mathsf T})_{ij}+\omega p_i+\omega^2 p_j+1
=\delta_{ij}.
```

Here $n$ odd gives $JJ^{\mathsf T}=J$ in characteristic two.
The coefficient of $\omega$ shows all $p_i$ are equal.
If they are one, the equation gives $BB^{\mathsf T}=I$.
If they are zero, it gives $BB^{\mathsf T}=I+J$ and
$(B+J)(B+J)^{\mathsf T}=I$. Thus, after a possible global
complement of the bit assignment, the palette of $Q$ is described
by a binary orthogonal matrix. Its exponent matrix has the form
$c+\epsilon B$ over $\mathbb Z/3$ for a constant $c$ and a nonzero
$\epsilon$. The same holds for $R$.

Every two rows of a binary orthogonal matrix have odd weight and even
intersection, so patterns $10$ and $01$ both occur. On some two columns
the selected two rows form the identity. For three rows let $t$ be the
parity of the count of columns of type $111$. Even pairwise intersections
give parity $t$ for each type with exactly two ones. Odd row weights then
give parity $1+t$ for each type with exactly one one. It follows that on
some three columns those rows give either the identity or its complement.

### No row and column phase shifts

Left and right multipliers in $T$ only add a function of the row
index and a function of the column index to the exponent matrix.
Restrict $Q$ to a two-row, two-column identity
as above and $R$ to a three-row, three-column identity or complement.
By absorbing constants into the phase shifts, we reduce to a six-row,
six-column matrix with entries

```math
\eta\mathbf 1_{i=k}+\epsilon\mathbf 1_{j=l}+f_{ij}+g_{kl}
\quad\text{in }\mathbb Z/3,
\qquad 1\leq i,k\leq 2,\quad 1\leq j,l\leq3,
```

where $\eta,\epsilon\ne0$. We show these entries cannot all be nonzero.

For each $l$ let $X_l$ be the set of residues in the triple
$(f_{1j}+\epsilon\mathbf 1_{j=l})_{j=1}^3$ and define $Y_l$ from the
second row in the same way. Nonzero entries would require each of
$(X_l+\eta)\cup Y_l$ and $X_l\cup(Y_l+\eta)$ to omit a residue,
because the column shift translates the entire set. So each $X_l$
and $Y_l$ has at most two elements. If any shifted triple is constant,
the original triple has two entries equal to some $a$ and the shifted
entry equal to $a-\epsilon$. Shifting one of the other entries would
then produce all three residues. This is impossible, so each set
has exactly two elements. The two unions can omit a residue only
if $X_l+\eta=Y_l$ and $X_l=Y_l+\eta$. This would make a two-element
set invariant under nonzero translation $2\eta$, a contradiction.

### Orthogonal changes of basis and the $D_4$ lattice

Let $\Lambda=D_4$ be the lattice of even-sum integral vectors in
$\mathbb R^4$. Its dual consists of the integral vectors and the
vectors all of whose coordinates are half-integral. Testing inner
products with $e_i-e_j$ and $e_i+e_j$, which generate $\Lambda$,
gives this description. There are three nonzero cosets in
$`\Lambda^*/\Lambda`$. One, denoted $v$, is the integral odd-sum
coset. The other two are the half-integral cosets. Write $\pi$ for
the action of $\mathop{\mathrm{Aut}}(\Lambda)$ on these three cosets.
This is the usual triality action.
[Elkies, lattice notes](https://people.math.harvard.edu/~elkies/M272.19/sep30.pdf).

The stabilizer of $v$ consists of the signed coordinate permutations,
because the norm-one vectors in $v$ are exactly $\pm e_i$.
The kernel of $\pi$ consists of those with an even number of sign
changes. Coordinate permutations preserve the two half-integral
cosets, and one sign change interchanges them.

Every normalized real Hadamard matrix of order four lies in
$\mathop{\mathrm{Aut}}(\Lambda)$ and moves $v$. Its entries are
$\pm1/2$, so it takes even-sum integral vectors to integral vectors.
Its column sums are integers of the same parity. Two orthogonal sign
columns differ in exactly two positions, so the numbers of minus signs
have the same parity. The sum of the coordinates of the image of an
even-sum integer vector is therefore even. The same argument applies
to the transpose, which is also a normalized Hadamard matrix and is
the inverse. The columns are half-integral, so the matrix moves $v$.

For $t\in T$ the real matrix $L(t)$ preserves $\Lambda$.
It is a signed permutation on the coordinate units and a normalized
Hadamard matrix on $P$. The matrices $L(i),L(j),L(k)$ have an even
number of sign changes, so $\pi\circ L$ is trivial on the eight
coordinate units. Since $L(h)$ moves $v$ and $h^3=-1$, its action is
a three-cycle. Choose the orientation of the three cosets so that
$\pi(L(t))=\gamma^{\rho(t)}$ for one fixed three-cycle $\gamma$.

The cyclic action can be detected after conjugation by an arbitrary
orthogonal matrix. Suppose $S\le T$, $V\in O(4)$, and
$V^{-1}L(S)V\subseteq\mathop{\mathrm{Aut}}(\Lambda)$. Then
$s\mapsto\pi(V^{-1}L(s)V)$ is trivial precisely on $\ker(\rho|_S)$.

- The matrices of $1$ and $-1$ are in the kernel. For the remaining
  coordinate units $s^2=-1$. Their conjugate real matrices have square
  $-I$. A nontrivial action on three cosets could only be a transposition.
  Conjugate such a matrix inside the lattice automorphism group so
  that the fixed coset of the transposition is $v$. This is possible
  since $\pi(L(h))$ cycles all three cosets. The resulting matrix is
  a signed coordinate permutation with square $-I$. Its coordinate
  permutation must consist of two transpositions, each with opposite
  signs on the exchanged coordinates. It has exactly two negative
  entries, so its action on cosets is trivial, a contradiction.
- For $s\in P$, its scalar part is $\pm1/2$. The identity
  $s^2-2\mathop{\mathrm{Re}}(s)s+1=0$ shows $s^2$ has order
  three and scalar part $-1/2$. The trace of $L(s^2)$ is $-2$.
  An order-three signed coordinate permutation must have one
  three-cycle and one positive fixed coordinate, giving trace $1$.
  Hence $V^{-1}L(s^2)V$ is outside the kernel of $\pi$.
  Since $s^3=\pm1$, the action of $V^{-1}L(s)V$ has order three.

It follows that the action on the conjugate of $S$ lies in the cyclic
three-element subgroup of $S_3$ and agrees with $\rho|_S$ up to a single
sign. Two homomorphisms into a cyclic group of order three with the
same kernel differ in just this way, including the trivial case.

Index the product array by $x,y$, set $p_{xy}=L(a_{xy})$, and suppose
$b_{xy}=U_xp_{xy}V_y$ has the required normalized Hadamard blocks.
For a fixed base row and column $0$, cancellation gives

```math
V_0^{-1}(p_{x0}^{-1}p_{xy}p_{0y}^{-1}p_{00})V_0
=b_{x0}^{-1}b_{xy}b_{0y}^{-1}b_{00}.
```

Take $S$ to be the group generated by the quaternion cross ratios
$a_{x0}^{-1}a_{xy}a_{0y}^{-1}a_{00}$. The equation shows that
$V_0^{-1}L(S)V_0$ is in the lattice automorphism group. The fact just
proved gives, for one fixed $`\sigma\in\{1,-1\}`$,

```math
\pi(b_{x0})^{-1}\pi(b_{xy})\pi(b_{0y})^{-1}\pi(b_{00})
=\gamma^{\sigma(\rho(a_{xy})-\rho(a_{x0})-\rho(a_{0y})+\rho(a_{00}))}.
```

Thus $\pi(b_{xy})=A_x\gamma^{\sigma\rho(a_{xy})}B_y$ for some
permutations $A_x,B_y$ depending on the row and column. Since each
$b_{xy}$ moves $v$, we require
$\gamma^{\sigma\rho(a_{xy})}B_y(v)\ne A_x^{-1}(v)$ for all $x,y$.
In the three cyclic coordinates this is exactly the condition that
the exponent matrix, up to sign and row and column phases, never
takes a zero value. The six-by-six restriction above rules it out.
This proves the theorem for arbitrary orthogonal block changes.

## Constraint on position-dependent residue rules

A different composition may change the quaternion entries in a way
that cannot be obtained by row and column multiplication. In the
group-developed setting one can determine exactly what a two-input
residue rule must do if it is to preserve the mod-two orthogonality.

Let $F$ be a finite group of odd order, and let $q:F\to P$ be perfect
in the sense that $\sum_x q(sx)\overline{q(x)}=|F|\mathbf 1_{s=e}$.
Let $J_F$ be the sum of all group elements in the group ring, and
let $b$ be the binary indicator of one of the two palette classes.
Linear extension of $\phi$ identifies the residue of $q$ with
$b+\omega^2J_F$, with the labels $\omega,\omega^2$ exchangeable.
Let $`b^*`$ apply group inversion, and write $\epsilon(b)$ for the
augmentation, the sum of coefficients in $\mathbb F_2$.
Using $J_F^2=J_F$ and $bJ_F=J_Fb=\epsilon(b)J_F$, the residue
of orthogonality gives

```math
bb^*=1+(1+\epsilon(b))J_F.
```

Exactly one of the complementary choices of $b$ has odd augmentation.
Use that choice, so $`bb^*=1`$. It follows that neither palette class
can be empty when $|F|>1$. If $F$ is abelian and the odd mask is
invariant under inversion, $b^2=1$. Squaring the group elements is
a bijection and the Frobenius square of $b$ has support equal to
the squares of its support elements. Thus $b$ is the singleton
identity mask. This recovers the usual symmetric Williamson sign
product pattern, with a group-algebra proof.

Now assume $|F|>1$ and let $G$ be another finite group of odd
order greater than one. Let $d$ be an odd mask on $G$ with $`dd^*=1`$. Consider any
fixed Boolean function of the two mask values that is proposed
as the odd mask on $F\times G$. Its indicator is of the form

```math
z=A(b\otimes d)+B(b\otimes J_G)+C(J_F\otimes d)+D(J_F\otimes J_G),
\quad A,B,C,D\in\mathbb F_2.
```

In each group ring, the two central orthogonal idempotents
$J$ and $1+J$ split it into two nonzero summands. On the $J$ summand
the odd mask acts as the identity. On the $1+J$ summand it acts
as a unitary element, meaning its product with its involution
is the identity of that summand. In the four tensor summands, $z$
is respectively the tensor product of the mask restrictions
multiplied by $A$, $A+B$, $A+C$, and $A+B+C+D$, starting with
$(1+J_F)\otimes(1+J_G)$. Therefore $`zz^*=1`$ forces all four
scalars to be one. This gives $A=1$ and $B=C=D=0$.
Conversely $z=b\otimes d$ is unitary. The unique rule for the
normalized odd masks is Boolean AND. Choosing the complementary
output class exchanges AND and its complement.

This residue constraint is necessary for a perfect quaternion
product. It leaves open a construction that realizes the
required residues while retaining the full quaternion
autocorrelation. The obstruction covers all orthogonal changes of basis on the
individual four-dimensional block rows and columns of the specified
product. General Hadamard constructions remain open.


## Obstruction to a fixed entrywise block rule

Even a rule that changes the array outside the block changes of
basis in the theorem cannot work universally if it assigns each
output block using only the two corresponding input blocks.
The rule may be an arbitrary function of two real $4$ by $4$
input blocks. Its output may be any $4$ by $4$ matrix with
entries $\pm1/2$.

For an exact pair of inputs, let
$a=(1+i+j+k)/2$ and $b=(1-i-j-k)/2$. Let $K=J_3-I_3$.
The quaternion array $aI_3+bK$ has entries in $P$ and is
orthogonal with squared row norm three. Indeed, $I_3$ and
$K$ have a common real orthonormal eigenbasis with $K$-eigenvalues
$2,-1,-1$. The corresponding quaternion eigenvalues are
$a+2b$ and $a-b$, each of squared norm three since
$\mathop{\mathrm{Re}}(a\bar b)=-1/2$. Its real left multiplication
blocks give the two possible input values $L(a)$ and $L(b)$.

Feed this array and an identical copy into the putative fixed
rule. Denote its four block outputs by $A,B,C,D$ in the order
$(L(a),L(a)),(L(a),L(b)),(L(b),L(a)),(L(b),L(b))$.
The real output is

```math
I_3\otimes I_3\otimes A+I_3\otimes K\otimes B
+K\otimes I_3\otimes C+K\otimes K\otimes D.
```

For it to give a Hadamard matrix after rescaling by two, it
must have row Gram matrix $9I_{36}$. Conjugating by the tensor
of the two real eigenbases for $K$ and the four-dimensional
identity is orthogonal. It gives a block-diagonal matrix containing
both $W=A-B-C+D$ and $W+3(B-D)=A+2B-C-2D$. Both would need
row Gram matrix $9I_4$.

Take any row $w$ of $W$ and the corresponding row $p$ of $B-D$.
The entries of $w$ are integers of absolute value at most two,
and the entries of $p$ belong to $`\{-1,0,1\}`$. The only way for
four such squares of entries of $w$ to sum to nine is
$4+4+1+0$. For each of the two positions with $|w_j|=2$, the
four half signs in $A-B-C+D$ agree after the indicated signs.
Consequently $p_j=-\mathop{\mathrm{sign}}(w_j)$ in both positions.

Now $\lVert w+3p\rVert^2=\lVert w\rVert^2$ requires
$2w\cdot p=-3\lVert p\rVert^2$. The number of nonzero
entries of $p$ is even and at least two. If it is two, then
$w\cdot p=-4$ from the two forced positions, whereas the equation
requires $-3$. If it is four, then $|w\cdot p|\le\sum_j|w_j|=5$,
whereas the equation requires $-6$. Both cases are impossible.

The argument excludes every fixed rule of this form, including
ones that do not produce quaternion multiplication blocks.
Its finite pair of inputs is a witness against the universal
construction rule. The unrestricted Hadamard conjecture and
composition methods that can vary the output at equal pairs of
input blocks remain open.

## Exact diagnostic

```sh
python3 research/hadamard-conjecture/verify_triality.py
```

The script enumerates the 384 signed permutations and the 768
normalized Hadamard matrices of order four. It checks their coset
actions, including the 12 matrices squaring to minus the identity
and the 16 of order three with trace minus two. It also checks all
four sign choices of the phase obstruction, with a positive control
on the smaller grid. The written proof gives the all-size conclusion.
