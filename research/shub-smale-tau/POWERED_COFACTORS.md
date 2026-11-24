# Removing high multiplicities from a supplied small-degree cofactor support

Status: research. This note gives an endpoint-sensitive extraction for a
cofactor supplied as powers of polynomials of small total degree. The
multiplicities may be arbitrarily large. The cost depends polynomially on
the degrees of the supplied bases, so it does not solve the unrestricted
all-multiples problem or the Shub--Smale tau conjecture. No novelty claim
is made. Section 5 states a separate obstruction to accelerating arbitrary
anchored jets by a compiler that also works over symbolic coefficient
rings.

All constant-free programs start from `1,x` and use `+,-,*`. Every
integer constant is charged. Write


```math
F_N(x)=\prod_{j=1}^N(x-j),\qquad N\ge1.
```


## 1. A short power-lifting certificate

For `n>=1` define the homogeneous geometric sum


```math
\Gamma_n(a,b)=\sum_{j=0}^{n-1}a^{n-1-j}b^j.
```


Its polynomial identity is


```math
(a-b)\Gamma_n(a,b)=a^n-b^n.
\tag{1.1}
```


The triple `a^n,b^n,Gamma_n(a,b)` has a division-free program using
`O(log(n+1))` operations from the available registers `a,b,1`. One
can process the binary digits of `n`, using


```math
\Gamma_{2r}(a,b)=(a^r+b^r)\Gamma_r(a,b),
\qquad
\Gamma_{2r+1}(a,b)=a\Gamma_{2r}(a,b)+b^{2r}.
\tag{1.2}
```


The powers are squared at a doubling step and multiplied by their bases
at an odd step. Each binary digit costs a bounded number of operations.
These statements hold in every commutative ring.

### Lemma 1.1. Lifting a Bezout identity to large powers

Suppose available polynomials satisfy `u+v=c`, where `c` is an integer.
For every `m>=1`, let `L` be the smallest power of two at least `m`.
There are polynomials `U,V`, computable from `u,v,c` in
`O(log(m+1))` gates, such that


```math
u^m U+v^m V=c^{mL}.
\tag{1.3}
```


**Proof.** Put


```math
G=\Gamma_m(c,v),\quad C=c^m,\quad E=C-v^m=uG,
```


and set


```math
U=u^{L-m}G^L,\qquad V=\Gamma_L(C,E).
\tag{1.4}
```


Since `C-E=v^m`, equation (1.1) gives
`v^m V=C^L-E^L`. Also `E^L=u^m U`. Adding proves (1.3).
All exponents have `O(log(m+1))` bits, and (1.2) supplies the geometric
sums. The case `m=1` has `L=1` and `U=V=1`. QED.

In particular, if


```math
A(x)R(x)+B(x)S(x)=c\ne0,
```


then (1.3), applied to `u=AR,v=BS`, yields


```math
\widehat A R^m+\widehat B S^m=c^{mL},
\quad
\widehat A=A^mU,\quad\widehat B=B^mV,
\tag{1.5}
```


with only `O(log(m+1))` additional gates. No division by `c` occurs.

## 2. A charged small-degree Bezout certificate

### Lemma 2.1

Let `R,S in Z[x]` both have degree `d>=1` and be relatively prime in
`Q[x]`. Suppose their coefficient lists have been computed by charged
constant programs. One can compute `A,B in Z[x]` of degree less than
`d` and a nonzero integer `c` satisfying


```math
AR+BS=c
\tag{2.1}
```


with `O((d+1)^4)` additional constant-free gates, including the assembly
of `A,B`. The certificate permits arbitrary repeated roots within each
of `R,S`; only their common factor is excluded.

**Proof.** Let `ell=2d`. The coefficient map


```math
(A,B)\longmapsto AR+BS,
\quad \deg A,\deg B\lt d,
```


has an `ell`-square integer matrix `M` in the monomial bases. It is
invertible over `Q`: if `AR=-BS`, coprimality implies `R|B`, hence
`B=0`, and then `A=0`. We construct an integer vector `w` and a
nonzero integer `c` such that `Mw=c e_0`, without division.

Write


```math
\chi_M(z)=z^\ell+c_1z^{\ell-1}+\cdots+c_\ell,
\quad c_0=1,\quad p_i=\mathop{\mathrm{tr}}(M^i).
```


Newton's identities are


```math
k c_k=-\sum_{i=1}^k c_{k-i}p_i.
\tag{2.2}
```


They follow by differentiating `det(I-zM)` formally: multilinearity of
the determinant gives its derivative as the trace of the adjugate times
`-M`; the inverse `(I-zM)^(-1)=sum_(j>=0)z^j M^j` exists as a formal
power series. Comparing coefficients gives (2.2).

To avoid all divisions by `k`, compute `b_k=k!c_k` from


```math
b_0=1,\qquad
b_k=-\sum_{i=1}^k
       \frac{(k-1)!}{(k-i)!}\,b_{k-i}p_i.
\tag{2.3}
```


The displayed factorial ratio is a product of `i-1` consecutive
positive integers, not a division gate. All these products can be
constructed in `O(ell^2)` gates by extending each row one factor at
a time. Matrix powers through `M^ell`, their traces, and (2.3) cost
`O(ell^4)` gates using ordinary matrix multiplication.

Put `D=ell!` and `C_j=(ell!/j!) b_j=D c_j`. The ratios `ell!/j!`
are computed by a descending chain of products. Cayley--Hamilton
gives


```math
M^\ell+c_1M^{\ell-1}+\cdots+c_\ell I=0.
```


For completeness, this identity follows by comparing coefficients in
`(zI-M) adj(zI-M)=chi_M(z)I` and telescoping the resulting matrix
coefficient equations after multiplying them by successive powers of
`M`. Thus the integer vector


```math
w=-\sum_{j=0}^{\ell-1} C_j M^{\ell-1-j}e_0
```


satisfies


```math
Mw=C_\ell e_0,\qquad
C_\ell=\ell!(-1)^\ell\det M\ne0.
```


Its first `d` entries give the coefficients of `A`, and its last
`d` entries give those of `B`. Horner's rule assembles the two
polynomials in `O(d)` further gates. Take `c=C_ell`. QED.

If a polynomial of degree at most `d` is supplied by a circuit of
length `t`, all its coefficients can be computed in `O((t+1)(d+1)^2)`
constant-free gates. Evaluate the circuit in the truncated ring
`Z[z]/(z^(d+1))`, storing `d+1` coefficient registers. Addition is
componentwise, and multiplication uses truncated convolution. This
works even when intermediate polynomial degrees exceed `d` and later
cancel. At the output, the degree promise makes the coefficient list
exact.

### Lemma 2.2. A short shift exists

For nonzero `R in Z[x]` of degree `d>=1`, some integer


```math
1\le h\le d^2+1
\tag{2.4}
```


satisfies `gcd(R(x),R(x+h))=1` over `Q`.

**Proof.** A bad shift satisfies `R(alpha)=R(alpha+h)=0` for some
complex root `alpha`. It is therefore a difference of two distinct
complex roots of `R`. There are at most `d^2` ordered pairs of roots,
even if multiplicities are counted. Hence at most `d^2` positive
integer shifts are bad. QED.

The choice of `h` is nonuniform, as is permitted for a circuit-existence
bound. The chosen integer has a program of length `O(log(d+1))`.
Given the coefficients of `R`, those of `R(x+h)` take `O((d+1)^2)`
charged gates by Horner substitution in a coefficient array. Lemma 2.1
then supplies a short integer Bezout certificate for these two
polynomials.

## 3. Transporting a translated cofactor through F_N

Define


```math
D_h(x)=\prod_{i=0}^{h-1}(x+i),\qquad
E_{N,h}(x)=\prod_{i=0}^{h-1}(x+i-N).
```


Iterating `(x-N)F_N(x+1)=xF_N(x)` gives


```math
E_{N,h}(x)F_N(x+h)=D_h(x)F_N(x).
\tag{3.1}
```


Consequently, for every `H=F_NQ`,


```math
\mathcal A_{N,h}H
 :=\frac{E_{N,h}(x)H(x+h)}{D_h(x)}
 =F_N(x)Q(x+h).
\tag{3.2}
```


This quotient is exact in `Z[x]`. A program of length `s` for `H`
gives one for `A_(N,h)H` of length


```math
O\bigl((s+1)(h+1)^4+\log(N+1)\bigr).
\tag{3.3}
```


Indeed, form `x+h`, replay the program for `H`, and multiply by
`E_(N,h)`, using `O(s+h)` gates after constructing `N`. Divide
exactly by the known monic degree-`h` polynomial `D_h` by the
Newton-basis matrix of Lemma 2.1 in [ANCHORED_DIFFERENCES.md](ANCHORED_DIFFERENCES.md):
evaluate the numerator on the `(h+1)`-square lower bidiagonal matrix
with diagonal `0,-1,...,-(h-1),x` and subdiagonal one, and take its
bottom-left entry. That proof is independent of the numerator degree.
The precomputed scalar `N` is shared by its scalar matrix, so its
construction cost is paid once. This proves the deliberately loose
bound (3.3).

## 4. Removing several bases with arbitrary multiplicities

### Theorem 4.1

Suppose a length-`s` program computes


```math
H(x)=c_0 F_N(x)\prod_{i=1}^{r}R_i(x)^{m_i}\ne0,
\tag{4.1}
```


where `c_0` is a nonzero rational number, each `R_i in Z[x]` is nonconstant,
and `m_i>=1`. Programs of total length `T` for the `R_i` are supplied.
Let


```math
d=\sum_i\deg R_i,
\qquad B=\sum_i\log_2(m_i+1).
```


There is a constant-free division-free program for a nonzero constant
multiple of `F_N` whose length is bounded by


```math
O\left((s+T+1)(d+1)^8+(d+1)B+\log(N+1)\right).
\tag{4.2}
```


The bound is independent of the total cofactor degree
`sum_i m_i deg R_i`. No coprimality is assumed between different
`R_i`, or between any `R_i` and `F_N`.

In the stated setting each `m_i<=deg H<=2^s`, so
`B<=r(s+1)<=d(s+1)`. The exponent-bit contribution is therefore
automatically polynomial in `s,d`; it is displayed separately in
(4.2) to make the construction's costs explicit.

**Proof.** Put


```math
R=\prod_i R_i,\qquad m=\max_i m_i,\qquad
Q=\prod_i R_i^{m_i},\qquad
S=\prod_i R_i^{m-m_i}.
```


Then `QS=R^m`. The polynomial `R` has degree `d` and a program of
length at most `T+r-1`. Extract its coefficients by the truncated-ring
construction in Section 2. Choose `h` as in Lemma 2.2 and construct


```math
A R+B_0 R(x+h)=c\ne0
```


by Lemma 2.1. The combined cost is polynomial in `T,d`, with the
explicit bound `O((T+r+1)(d+1)^2+(d+1)^4)`.

Apply Lemma 1.1 to `AR` and `B_0R(x+h)`. If `L` is the smallest
power of two at least `m`, it produces polynomials `U,V` satisfying


```math
U R^m+V R(x+h)^m=c^{mL}.
\tag{4.3}
```


The gate cost beyond the existing registers is `O(log(m+1))`.
Substitute `R^m=QS` and its translate in (4.3):


```math
(US)Q+(VS(x+h))Q(x+h)=c^{mL}.
\tag{4.4}
```


The two polynomials `S,S(x+h)` have short programs: evaluate the
supplied bases at `x` and `x+h`, then use binary powering with
exponents `m-m_i`. This costs `O(T+r log(m+1)+r)` gates in addition
to the existing inputs. It remains valid for exponent zero and for
shared roots among the bases.

By (3.2), the program for `H` gives a program for
`A_(N,h)H=c_0 F_N Q(x+h)`. Combining this with (4.4) gives the exact
division-free identity


```math
(US)H+(VS(x+h))\mathcal A_{N,h}H
   =c_0 c^{mL}F_N.
\tag{4.5}
```


The scalar on the right is nonzero. The constructed left side lies
in `Z[x]`, and `F_N` is monic, so its leading coefficient shows that
`c_0 c^(mL)` is in fact a nonzero integer. It need not be explicitly
divided out. Since `h<=d^2+1`, the cost (3.3) is
`O((s+1)(d+1)^8+log(N+1))`. Since every base is nonconstant,
`r<=d`, and `log(m+1)<=B`. The remaining costs above are bounded
by (4.2). QED.

If there are no nonconstant bases, the original output is already a
constant multiple of `F_N`. Any nonzero constant bases can be absorbed
into `c_0` without computing that scalar separately.

### Example and limitation

For `H=c_0 F_N(x)(b x-a)^m`, where `b!=0` and `a,b` have supplied
short constant programs, take the shift `h=1`. The bases
`u=bx-a` and `v=u+b` differ by the nonzero constant `b`. Lemma 1.1
applied to `-u,v`, whose sum is `b`, gives a certificate for their
powers in `O(log(m+1))` gates; the sign `(-1)^m` is absorbed into
the coefficient of `u^m`. Thus a
nonzero constant multiple of `F_N` has a circuit of length


```math
O\bigl(s+\tau(a)+\tau(b)+\log(m+1)+\log(N+1)\bigr).
\tag{4.6}
```


This removes an exponentially large multiplicity even when `a/b` is
one of the required roots `1,...,N`. The proof does not assume that
the cofactor is relatively prime to `F_N`.

For an unrestricted cofactor, the supplied bases may have exponentially
large total degree, or no short programs for a factorization may be
known. The theorem provides no bound on either quantity from `s`
alone. Setting `r=1,R_1=Q,m_1=1` merely recovers a degree-dependent
method. A general extraction theorem still needs a way to find and
remove cofactor structure with cost polynomial in `s` and `log N`.

Exact symbolic checks verified the power-lifting identity for 18
choices of `c,m`, including negative `c` and `m=1`. Six complete
extraction checks covered bases with adjacent roots, bases sharing
roots, a repeated-root base, an irreducible quadratic base, and
cofactor roots inside the required interval. Each check verified the
scaled Sylvester-matrix certificate and the final polynomial identity
coefficientwise. These are transcription checks; the proofs do not
depend on them.

## 5. Limits of accelerating arbitrary anchored jets

Recall


```math
\mathcal T_NH=\frac{(x-N)H(x+1)-xH(x)}x,
\qquad
\mathcal T_N^k(F_NQ)=F_N\Delta^kQ.
```


### 5.1 The exact normalization already contains factorials

For `N=1`, the polynomial `H=(x-1)x^q` has a constant-free program
of length `O(log(q+1))`, but


```math
\mathcal T_1^q H=q!(x-1).
```


Evaluation at zero followed by negation recovers `q!`. Therefore a
general compiler for the exact unnormalized operator with cost
polynomial in the input size and `log q` would make the integer
factorials easy in that same sense. This is an exact reduction, not
an unconditional lower bound for factorial complexity. The extraction
in Theorem 4.1 avoids this particular normalization by returning a
different nonzero scalar multiple.

### 5.2 A symbolic all-order compiler would contradict the pinned theorem

The following statement concerns a stronger compiler model than the
original integer univariate problem. Assume a single algebraic
compilation procedure works over polynomial coefficient rings, allowing
additional indeterminates `X`, and takes a circuit for a multiple of
`F_1=x-1` and an arbitrary order `k` to a circuit for its exact
`T_1^k` image. Suppose its output size is bounded by a polynomial in
the input size and `log(k+1)`, and the same bound holds uniformly for
the symbolic coefficient inputs. All coefficients and operations in
the input and output are charged. This compiler cannot exist under
the repository's standing pinned Anthropic theorem.

Here is a direct reduction using its explicit permanent statement. The
Kronecker coefficient encoding is the classical argument in Kaltofen,
*Single-Factor Hensel Lifting and its Application to the Straight-Line
Complexity of Certain Polynomials* (STOC 1987), Section 2; see
[SOURCES.md](SOURCES.md). The adaptation below uses finite differences
and the pinned border theorem.
For an `n`-square matrix of indeterminates `a_ij`, put


```math
P_A(z)=\prod_{i=1}^{n}\left(
     \sum_{j=1}^{n}a_{ij}z^{(n+1)^{j-1}}\right),
\qquad k=\sum_{j=1}^{n}(n+1)^{j-1}.
\tag{5.1}
```


This polynomial has a circuit of size polynomial in `n`. Its degree
and `k` have `O(n log(n+1))` bits. Each term in the product chooses
one column from each row. In base `n+1`, the exponent records the
number of rows choosing each column; all these numbers are at most
`n`, so no carry occurs. Thus


```math
[z^k]P_A(z)=\mathop{\mathrm{perm}}(A).
\tag{5.2}
```


Introduce another indeterminate `epsilon` and apply the alleged
compiler to


```math
H(z)=(z-1)P_A(\epsilon z)
```


at order `k`. Evaluation at `z=0` and multiplication by
`-1/(k! epsilon^k)` give


```math
\frac{\Delta^k(P_A(\epsilon z))|_{z=0}}
     {k!\epsilon^k}
 =\mathop{\mathrm{perm}}(A)+\epsilon W(A,\epsilon).
\tag{5.3}
```


Indeed, `Delta^k z^j` is zero for `j<k` and equals `k!` for `j=k`;
every higher power contributes a multiple of `epsilon^(k+1)` before
normalization. Thus (5.3) has no negative powers of `epsilon` and
has constant coefficient equal to the permanent.

This is a polynomial-size border circuit in the exact sense of the
pinned `Statement.Approximates`: the scalar
`1/(k! epsilon^k)` is an allowed Laurent-series constant, and all
coefficients of the output are regular at zero. Over characteristic
zero, `Statement.MainTheoremApprox`, proved by
`Solution.mainTheoremApprox` from `Paper.thm_approx`, excludes such
polynomial-size approximations of the permanent. The checked version is
commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`:

<https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean>

<https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean>.

The reduction does not apply to a nonuniform existence claim restricted
to individual integer-coefficient univariate inputs. It also does not
rule out an extractor specialized to a terminal cofactor-annihilation
step, one that inspects coefficient-dependent branches, or one that
returns an unspecified nonzero scalar multiple of `F_N`. Those are
exactly the freedoms retained by the unresolved extraction problem.
