# Exact determinant fusion with fixed flavours, and its rank loss

Research status: Sections 1--4 give an exact legal tagged-source
identity and an algebraic obstruction to obtaining the full target
from its fixed-flavour type sum. The obstruction is specific to the
displayed maps and their separate X/Y operator factors. It is not a
barrier theorem for arbitrary tagged maps or for coherent flavour
sums over a growing ambient flavour space.

The operator-to-finite-tensor realization is conditional on the exact
identity, as proved in [WEYL_DIVISION_TRADE_TRANSFER.md](WEYL_DIVISION_TRADE_TRANSFER.md).
The shared D input used here comes from
[TAGGED_OPERATOR_TRADE_TRANSFER.md](TAGGED_OPERATOR_TRADE_TRANSFER.md).

## 1. Algebra and scalar antisymmetrization

Fix integers s>=k>=1. Put p=binom(s,k), and let the source labels
h,c range over ordered words in [s]^k, so Q=s^k. Target auxiliary
labels A,B,I,J,K,L are increasing k-subsets of [s].

Use independent Weyl coordinates X_(i,t),Y_(j,t), i,j in [s],
t in [k], with derivatives P_(i,t),R_(j,t). The only nonzero
generator commutators are

```math
[P_{i,t},X_{j,u}]=[R_{i,t},Y_{j,u}]=\delta_{ij}\delta_{tu}.
```

All X/P generators commute with all Y/R generators. Define

```math
\Delta_I(X)=\det(X_{i,t})_{i\in I,t\in[k]},\qquad
\Delta_J(Y)=\det(Y_{j,t})_{j\in J,t\in[k]}.
```

For a word v in [s]^k, epsilon_A(v) is its permutation sign when
v lists A, and is zero otherwise. Thus epsilon_A is the coefficient
of e_A in e_(v_1) wedge ... wedge e_(v_k). No normalization by k!
is included.

Fix a type S subset [k], put T=[k] minus S, and write r=|S|.
Define two mixed row words

```math
v_t=\begin{cases}c_t&t\in S,\\h_t&t\in T,\end{cases}
\qquad
w_t=\begin{cases}h_t&t\in S,\\c_t&t\in T.\end{cases}
```

The scalar C map is

```math
\gamma^{S}_{KL,hc}=\epsilon_K(v)\epsilon_L(w).             \tag{1}
```

For output D label (I,J), the middle operator is

```math
\xi^{IJ}_{S,hc}
 =\epsilon_I(v)\epsilon_J(w)\Delta_I(X)\Delta_J(Y).        \tag{2}
```

The dependence of (2) on h uses the proved source-tagging
construction. Formula (2) does not give h to C, A, or B by any
additional operation.

## 2. The legal outside maps

For a fixed h define

```math
\begin{split}
\mathcal A_{S,h}^{A}
 &=\sum_{a_1,\ldots,a_k}
     \epsilon_A(a_1,\ldots,a_k)
     \prod_{t\in S}P_{a_t,t}
     \prod_{t\in T}\delta_{a_t,h_t},\\
\mathcal B_{S,h}^{B}
 &=\sum_{b_1,\ldots,b_k}
     \epsilon_B(b_1,\ldots,b_k)
     \prod_{t\in T}R_{b_t,t}
     \prod_{t\in S}\delta_{b_t,h_t}.
\end{split}                                                \tag{3}
```

The first depends only on h_T and X derivatives; the second depends
only on h_S and Y derivatives. Set

```math
\mathcal D_t=\begin{cases}R_{h_t,t}&t\in S,\\
                          P_{h_t,t}&t\in T.
             \end{cases}
```

There is one family for every U subset [k]. Its outside maps are

```math
\alpha^{A}_{S,U,h}
 =(-1)^{|T|+k-|U|}\mathcal A_{S,h}^{A}
                 \prod_{t\in U}\mathcal D_t,
\qquad
\beta^{B}_{S,U,h}
 =\left(\prod_{t\notin U}\mathcal D_t\right)
                 \mathcal B_{S,h}^{B}.                    \tag{4}
```

Every derivative in (3)--(4) commutes with every other derivative,
so the displayed products can be ordered by increasing t. The
source label on both outside maps is exactly the same h. The
complete coefficient always has the permitted order alpha xi beta.

Using all S and U gives 4^k families. In particular this is a legal
fusion of the four elementary commutator families; it does not
formally antisymmetrize the source GHZ label.

## 3. Complete coefficient calculation

Because all the D_t commute, their iterated commutator satisfies

```math
\sum_{U\subseteq[k]}(-1)^{k-|U|}
 \left(\prod_{t\in U}\mathcal D_t\right) f
 \left(\prod_{t\notin U}\mathcal D_t\right)
 =\left(\prod_{t=1}^k\partial_{\mathcal D_t}\right)f       \tag{5}
```

for every coordinate polynomial f. The right side denotes
multiplication by the indicated ordinary derivative of f. Equation
(5) follows either by expanding the nested commutator or by applying
the one-variable Leibniz identity successively. No derivative on
the right side remains to act on the input flag.

The product of the scalar factors in (1) and (2) vanishes unless
K=I and L=J. When it is nonzero, the two signs each occur twice and
their product is one. For fixed h this leaves a contribution only
when h_T consists of distinct elements of I and h_S consists of
distinct elements of J. There are exactly r!(k-r)! choices of c
completing the two ordered row lists. Consequently define

```math
\begin{split}
G_S^{A,I}
 &=\sum_{h_T}
    \mathcal A_{S,h}^{A}
    \left(\prod_{t\in T}P_{h_t,t}\right)\Delta_I(X),\\
J_S^{J,B}
 &=\sum_{h_S}
    \left[\left(\prod_{t\in S}R_{h_t,t}\right)
                    \Delta_J(Y)\right]
    \mathcal B_{S,h}^{B}.
\end{split}                                                \tag{6}
```

In the first line, the derivatives inside the parentheses act only
on Delta_I; the preceding A operator then acts on that coefficient
and on the input flag. In the second line the bracketed derivative
is a multiplication operator. Sums in (6) can run over all words:
terms with repeated or absent row indices vanish.

Equations (1)--(6) give the exact identity

```math
\sum_{U,h,c}\gamma^S_{KL,hc}
       \alpha^A_{S,U,h}\xi^{IJ}_{S,hc}\beta^B_{S,U,h}
 =\delta_{KI}\delta_{LJ}
   (-1)^{k-r}r!(k-r)!\,G_S^{A,I}J_S^{J,B}.                \tag{7}
```

All output indices are quantified in (7); no off-target C/D terms
have been omitted. At k=1 the two types give respectively
(P_a X_i)delta_(j,b) and -delta_(a,i)(Y_j R_b), exactly the
elementary Sylvester relation.

## 4. Rank of the fixed-flavour sum

Let K be the division ring of the Weyl algebra in all the displayed
coordinates. For the rank argument, it is enough to take any
division ring containing these operators; the following
factorizations are polynomial identities.

As h_T varies, the columns A_(S,h) in (3) are alternating in the
k-r entries h_T and vanish when two entries coincide. Hence the
matrix G_S, with rows A and columns I, factors through a space
with basis the (k-r)-subsets of [s]. Similarly, J_S, with rows J
and columns B in exactly that order, factors through the r-subsets.
Thus

```math
\mathop{\mathrm{rank}}_K G_S\le {s\choose k-r},\qquad
\mathop{\mathrm{rank}}_K J_S\le {s\choose r}.              \tag{8}
```

This assertion uses the printed order J,B. A bare auxiliary matrix
transpose over a noncommutative division ring need not preserve
rank, so it cannot be used to change that order.

To combine the two bounds correctly, let tau be the formal-adjoint
anti-involution of the Y Weyl algebra:

```math
\tau(Y_{j,t})=Y_{j,t},\qquad \tau(R_{j,t})=-R_{j,t}.
```

It reverses products and fixes scalars, and it preserves the Weyl
relations. It extends to the division ring by tau(a^(-1))=tau(a)^(-1).
If J=UV is the factorization in (8), the matrix with entries
tau(J_(J,B)), rows B and columns J, equals tau(V)^T tau(U)^T.
It therefore has rank at most binom(s,r).

Consider any scalar linear combination of the type outputs,
absorbing all factorials and signs into scalars lambda_S:

```math
M_{(A,B),(I,J)}=\sum_{S\subseteq[k]}
                    \lambda_S G_S^{A,I}J_S^{J,B}.          \tag{9}
```

Apply tau to its Y factors, coefficient by coefficient. This is an
operation on the displayed separate-factor expression (9); no
partial anti-automorphism of the combined division ring, or rule
for an arbitrary inverse mixing X and Y, is asserted. Since the
X and Y operator algebras commute, the result is a sum of ordinary
Kronecker products of G_S with the matrices just described. Their
factorizations give

```math
\mathop{\mathrm{rank}}_K M^{\tau}
 \le R_{s,k}:=\sum_{r=0}^k {k\choose r}
                           {s\choose k-r}{s\choose r}.    \tag{10}
```

For example, a full target identity M=I_(p^2) would imply
M^tau=I_(p^2), and so would require R_(s,k)>=p^2. More generally,
if this sum equals a scalar diagonal target retaining m distinct
ordered pairs (I,J) with nonzero coefficients, then m<=R_(s,k).
These conclusions concern an exact Weyl-operator identity; merely
normal-ordering (9) and keeping its scalar term is not sufficient.

There is also an exact obstruction to C-only postprocessing of this
output. Let L be any scalar linear map on the C space with basis
e_(I,J), and leave the A and B maps unchanged. Suppose applying L
to the output (9) gives the target with the same C compression L.
Choose a scalar functional g on the range of L that is nonzero on
every nonzero vector L e_(I,J). Such a functional exists because a
finite union of proper hyperplanes cannot exhaust a vector space
over C. Put w_(I,J)=g L e_(I,J).

Contracting C with g scales column (I,J) of (9) by w_(I,J). The
same contraction of the compressed target is a scalar diagonal
matrix whose nonzero diagonal positions are exactly the nonzero
columns of L. Partial formal adjoint fixes the w_(I,J), and scalar
column scaling does not increase the rank in (10). Therefore

```math
\#\{(I,J):L e_{I,J}\ne0\}\le R_{s,k},\qquad
\mathop{\mathrm{rank}}L\le R_{s,k}.                       \tag{11}
```

In particular, a high-rank C projection cannot repair this exact
fixed-flavour output. This assertion holds with A and B unchanged;
it does not cover additional local maps there that mix the two
flag algebras and destroy the displayed separate-factor structure.

The same test applies to a Laurent degeneration retaining these
separate X/Y factors and using central scalar Laurent coefficients
lambda_S. Apply tau separately to the Y factors of the displayed
expression; do not apply it to an unspecified mixed inverse. Rank
at most R is preserved under a coefficientwise regular
specialization. This can be seen by Gaussian elimination on a
hypothetical invertible (R+1)-square minor of the limit; a matrix
with invertible constant term is invertible as a matrix of formal
Laurent series.

## 5. Sparse-k resource count and scope

Take k tending to infinity with log(k)=o(log(s)). Then

```math
p={s\choose k},\qquad Q=s^k=p^{1+o(1)},\qquad
4^k=p^{o(1)}.
```

The equality Q=p^(1+o(1)) follows from
log(p)=k log(s)-log(k!)+O(k^2/s). Uniformly for 0<=r<=k,

```math
{s\choose r}{s\choose k-r}
 =p{k\choose r}\exp(O(k^2/s)).
```

Using sum_r binom(k,r)^2=binom(2k,k), (10) becomes

```math
R_{s,k}\le p{2k\choose k}\exp(O(k^2/s))
          =p^{1+o(1)}.                                    \tag{12}
```

Thus this legal fixed-flavour sum cannot give the full scalar
operator target, or a scalar diagonal partial target of density
p^(-o(1)): its retained pair density is at most p^(-1+o(1)).
Multiplying the number of such separate fixed-flavour constructions
by p^(o(1)) does not change that conclusion when the same formal
adjoint and factorization argument applies to each construction.

This does not rule out a coherent sum over many flavour subsets
implemented inside the local operators. Nor does it rule out
arbitrary C compression used in a different source identity, maps
mixing the two flag algebras in a way that destroys (9), or an
unrelated use of the source. Those would require a different
complete coefficient calculation.
