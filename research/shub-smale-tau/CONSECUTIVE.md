# Consecutive-root route to the Shub–Smale tau conjecture

Status: research. The full tau conjecture and the superpolynomial lower bound for arbitrary nonzero multiples of the consecutive-root polynomial remain unresolved here. The results below are exact recurrences, counterexamples to particular rank arguments, and a precise sufficient implication for the BSS problem. No novelty claim is made for the elementary algebra or the established BSS transfer.

## 1. Model and separate target

A constant-free division-free straight-line program starts with `1` and `x`, and each charged gate applies one of addition, subtraction, or multiplication to two previously available values. Values can be reused. The length is the number of charged gates. Write `tau(f)` for the minimum length producing `f`.

For `n >= 1` put

```math
F_n(x)=\prod_{j=1}^{2^n}(x-j),\qquad
\mu(n)=\min\{\tau(H):0\ne H\in\mathbb Z[x],\ F_n\mid H\}.
```

The weak consecutive-root target is that `mu(n)` is not bounded by a polynomial in `n`. Written with quantifiers, for every real `A > 0` and integer `d >= 0` there exists an `n` with `mu(n) > A(1+n)^d`.

The full tau conjecture would give `mu(n) >= 2^(n/C)-1` for an absolute `C`, but the consecutive-root target alone does not establish the full conjecture; no converse is proved here. A lower bound only for `tau(F_n)` does not establish a lower bound for `mu(n)`.

The source for the established BSS connection is Shub and Smale, *On the intractability of Hilbert's Nullstellensatz and an algebraic version of NP != P?*, supplied preprint dated June 21, 1994, especially Section 3 Theorem 1 and Section 4 Propositions 1–2:

<https://janos.cs.technion.ac.il/COURSES/238900-13/Papers-1/ShubSmale-pap97.pdf>

The full proof of the classical implication appears in [PROOF.md](PROOF.md).

## 2. Exact input-block and gate recurrences

For an integer radix `q >= 2`, define

```math
E_q(f)(a,b)=f(a+qb),\qquad 0\le a<q,\quad b\in\mathbb Z.
```

This is a ring homomorphism into functions of `(a,b)`:

```math
E_q(f\pm g)=E_q(f)\pm E_q(g),\qquad
E_q(fg)=E_q(f)\odot E_q(g),
```

where the last product is entrywise. These identities do not incur carries; carries arise only when the input or output integers themselves are represented by digits.

### Translation with its exact carry

Write an arbitrary integer `c = qv+u`, with `0 <= u < q`, using Euclidean division even when `c` is negative. Put

```math
a'=(a+u)\bmod q,\quad
\kappa=\left\lfloor\frac{a+u}{q}\right\rfloor\in\{0,1\}.
```

For `T_c f(x)=f(x+c)`,

```math
E_q(T_cf)(a,b)=E_q(f)(a',b+v+\kappa).
```

Proof: `a+qb+c = a' + q(b+v+kappa)`.

For consecutive blocks with radices `q_i`, weights `Q_0=1` and `Q_(i+1)=q_i Q_i`, translate the digits using

```math
\kappa_0=0,\qquad
z_i=a_i+c_i+\kappa_i,\qquad
a'_i=z_i\bmod q_i,\qquad
\kappa_{i+1}=\lfloor z_i/q_i\rfloor.
```

The final, unbounded high block absorbs the final carry. The recurrence follows by induction from

```math
\sum_{j<i}(a_j+c_j)Q_j
=\sum_{j<i}a'_jQ_j+\kappa_iQ_i.
```

### Digits of gate outputs

Fix a precision `L` and radix `q`. For any integer, including a negative integer, use its least nonnegative residue modulo `q^L` and the resulting `L` digits. For an addition or subtraction gate, let the input digits be `a_k,b_k` and define

```math
c_0=0,\quad z_k=a_k\pm b_k+c_k,\quad
d_k=z_k\bmod q,\quad c_{k+1}=\lfloor z_k/q\rfloor.
```

For a multiplication gate, use

```math
c_0=0,\quad
z_k=c_k+\sum_{i+j=k}a_i b_j,\quad
d_k=z_k\bmod q,\quad c_{k+1}=\lfloor z_k/q\rfloor.
```

These give the exact output modulo `q^L`. To prove the multiplication formula, induct on `k`, equating the partial convolution with the represented output plus the carry times `q^(k+1)`. These are integer digit recurrences, not new constant-free polynomial gates: floor and residue extraction must not be treated as free arithmetic-circuit operations.

### Consecutive products

Partitioning the roots into two halves gives

```math
F_{n+1}(x)=F_n(x)F_n(x-2^n).
```

More generally, for `0 <= k <= n`, if `q=2^k`, `r=2^(n-k)`, then

```math
F_n(x)=\prod_{b=0}^{r-1}F_k(x-qb)
      =\prod_{a=1}^{q}\prod_{b=0}^{r-1}(x-a-qb).
```

The first recursion is a compact description, not a polynomial-size straight-line program. A circuit for `F_n(x)` and a circuit for its shifted evaluation `F_n(x-2^n)` generally have separate variable-dependent gates. Directly duplicating a length-`s_n` program gives only

```math
s_{n+1}\le 2s_n+n+2,
```

where the extra gates construct `2^n`, form `x-2^n`, and multiply the two results. Shared constant subcircuits can improve this elementary upper bound, but the identity by itself does not justify reusing a gate value computed at a different input.

## 3. A short program with maximal rank at every digit cut

For a polynomial `f` and `n >= 1`, form its binary evaluation tensor

```math
\mathcal E_n(f)(b_0,\ldots,b_{n-1})
=f\left(1+\sum_{i=0}^{n-1}2^i b_i\right),\qquad b_i\in\{0,1\}.
```

A cut `A | B` of the digit positions gives a matrix with rows indexed by the `A`-digits and columns by the `B`-digits.

**Theorem 3.1.** Let `D` be a nonnegative integer. For distinct numbers

```math
0\le a_1<\cdots<a_p,\qquad 0<b_1<\cdots<b_q,
```

and `r <= min(p,q,D+1)`, every `r` by `r` minor of the matrix `[(a_i+b_j)^D]`, with its rows and columns in increasing order, is nonzero and has sign `(-1)^(r(r-1)/2)`.

**Auxiliary fact.** If `0<t_1<...<t_r` and `0<=k_1<...<k_r` are integers, then `det[t_i^(k_j)] > 0`.

First, a nonzero real polynomial supported on at most `r` monomials has at most `r-1` distinct positive roots. Induct on `r`: divide by the lowest power, differentiate, and apply Rolle's theorem and the induction hypothesis to the derivative. Consequently, the determinant in the auxiliary fact cannot vanish. Its sign is constant on the connected region of strictly increasing positive `t_i`. Set `t_i=epsilon^(r-i)` with `epsilon>0` small. In the determinant expansion, the identity permutation has the uniquely smallest exponent of `epsilon`, by the rearrangement inequality (or by successively exchanging inverted exponent assignments). Its coefficient is `+1`, proving the positive sign. If `t_1=0` is allowed, the determinant is nonnegative by continuity. It remains strictly positive for exponents `0,1,...,r-1`, by the ordinary Vandermonde formula.

**Proof of Theorem 3.1.** Restrict to any `r` rows and `r` columns. Factor the matrix using the binomial theorem:

```math
(a_i+b_j)^D=\sum_{k=0}^D a_i^k\binom Dk b_j^{D-k}.
```

Cauchy–Binet expresses the determinant as a sum over `0<=k_1<...<k_r<=D`. The minor from the `a` matrix is nonnegative by the auxiliary fact. After reversing the selected exponent order, the minor from the `b` matrix is strictly positive multiplied by the common sign `(-1)^(r(r-1)/2)` and the positive binomial coefficients. Thus no two nonzero summands cancel. The summand with `k_i=i-1` is nonzero, including when `a_1=0`. This proves the assertion.

**Corollary 3.2.** The polynomial

```math
f_n(x)=x^{2^n}
```

has a length-`n` constant-free program, but every cut `A | B` of `E_n(f_n)` has maximal possible rank

```math
\mathop{\mathrm{rank}} \mathcal E_n(f_n)_{A|B}
=2^{\min(|A|,|B|)}.
```

**Proof.** Compute `f_n` by `n` repeated squarings. The row sums `a=sum_(i in A) 2^i b_i` are distinct and nonnegative; the column sums `b=1+sum_(i in B)2^i b_i` are distinct and positive. Apply Theorem 3.1 with `D=2^n`. Its degree condition holds for the smaller matrix dimension.

This disproves any proposed polynomial upper bound on ordinary evaluation flattening rank for length-`s` programs, even if the bound is imposed simultaneously at every balanced digit cut. The rank is already `2^floor(n/2)` at every balanced cut for a length-`n` program with only one distinct integer root. Taking a minimum or an average over balanced cuts does not repair that particular bound.

The same example applies to flattenings of the coefficient tensor of the unique multilinear polynomial representing the evaluations on the Boolean cube. Evaluation and multilinear coefficient tensors differ by an invertible `2` by `2` basis change on every digit, namely `[[1,0],[1,1]]`. At a cut, the change is left and right multiplication by invertible Kronecker products, so it preserves rank.

This does not rule out every invariant inspired by a simultaneous-cut argument. It rules out the specific premise that ordinary digit-cut ranks stay polynomially small for unrestricted short univariate programs.

### 3.3 The binary coefficient tensor has the same obstruction

One might instead use digit cuts of coefficient indices, avoiding evaluation at a short program's very large values. The following family rules out the corresponding ordinary-rank premise as well.

For a polynomial of degree at most `2^n-1`, define its full binary coefficient tensor by

```math
\mathcal C_n(f)(b_0,\ldots,b_{n-1})
=[x^{\sum_i2^i b_i}]f(x).
```

**Theorem 3.3.** For `n >= 1` and

```math
g_n(x)=(1+x)^{2^n-1},
```

there is a constant-free program of length at most `2n-1`, while every cut of `C_n(g_n)` has rank `2^min(|A|,|B|)`.

**Proof of the circuit bound.** Set `y=1+x`, `p_1=y`, and `p_(k+1)=p_k^2 y`. The exponent recurrence is `e_(k+1)=2e_k+1`, so `p_n=y^(2^n-1)`. The initial addition costs one gate, and every later stage costs two multiplications.

**Binomial minor lemma.** Let `D` be a nonnegative integer. Suppose `a_1<...<a_r` and `b_1<...<b_r` are nonnegative integers and `a_r+b_r<=D`. Then

```math
\det\left[\binom D{a_i+b_j}\right]_{i,j=1}^r
```

is nonzero with sign `(-1)^(r(r-1)/2)`.

To prove the lemma, index a finite matrix `T` by all integers in the interval from `-b_r` to `a_r`, and put `T_(u,v)=1` if `u=v` or `u=v+1`, with all other entries zero. Every minor of `T` is nonnegative: a nonzero permutation term must match ordered columns to ordered rows, since two crossed matches would require both `u_i>=v_j` and `u_j<=v_i+1` with `u_i<u_j` and `v_i<v_j`, an impossibility. Thus at most the identity matching is nonzero, and each minor is either zero or one. Cauchy–Binet implies that every minor of `T^D` is nonnegative. Its entries are

```math
(T^D)_{u,v}=\binom D{u-v},
```

because each step holds its position or moves up by one. Paths connecting indices in this interval never have to leave it.

Reverse the columns in the claimed determinant, and set `c_j=-b_(r+1-j)`. This gives a minor of `T^D` with ordered rows `a_j` and ordered columns `c_j`. It is strictly positive. For `D>0`, define intermediate indices

```math
u_j(t)=\left\lceil\frac{(D-t)c_j+t a_j}{D}\right\rceil,
\qquad t=0,\ldots,D.
```

Every increment `u_j(t+1)-u_j(t)` is zero or one because `0<=a_j-c_j<=D`. The indices remain strictly ordered: both endpoint gaps are at least one, and convex interpolation followed by a ceiling preserves this separation. Hence at every step the minor of `T` with rows `u_j(t+1)` and columns `u_j(t)` has all its diagonal entries equal to one, and its determinant is one by the preceding noncrossing argument. The iterated Cauchy–Binet sum therefore contains a strictly positive term. When `D=0`, the hypotheses allow only the one-by-one case, which is immediate. Restoring the original column order gives the stated sign.

For Theorem 3.3, use `D=2^n-1`, with `a` and `b` the exponent contributions from the two sides of the digit cut. They are distinct nonnegative integers, and every sum is at most `D`. Apply the binomial minor lemma to a largest square submatrix. This proves full rank.

The family has exactly one distinct integer root, namely `-1`, and has degree exponential in its program length. Thus switching from evaluation cuts to exponent-digit coefficient cuts does not make ordinary flattening rank polynomially bounded under unrestricted constant-free programs. This does not exclude a measure that records more than those ranks or uses additional arithmetic information.

### 3.4 Squarefree normalization does not repair either rank measure

The preceding two rank examples have high-multiplicity roots. Removing repeated factors does not repair either rank bound.

**Corollary 3.4.** For `n>=2`, the polynomial

```math
q_n(x)=(1+x)^{2^n-1}-1
```

has a constant-free program of length at most `2n`, is squarefree, and has exactly one integer root. Both its binary coefficient tensor and its binary evaluation tensor have maximal rank at every cut.

**Proof.** The circuit bound follows from Theorem 3.3 and one subtraction. Put `D=2^n-1`, which is positive and odd. The derivative is `D(1+x)^(D-1)`, and its only possible zero `x=-1` is not a zero of `q_n`. Hence `q_n` is squarefree over characteristic zero. If an integer `a` is a root, `(1+a)^D=1`; oddness gives `a=0`, which is indeed a root.

For a nontrivial cut, the smaller dimension is an even number `r=2^min(|A|,|B|)`. For the coefficient tensor, choose any `r` sorted row and column indices containing zero on both sides. Relative to the binomial matrix in Theorem 3.3, only the top-left entry is decreased by one. If `M` is the original square submatrix,

```math
\det(M-E_{11})=\det(M)-\operatorname{cofactor}_{11}(M).
```

By the binomial minor lemma, the determinant has sign `sigma_r=(-1)^(r(r-1)/2)`, and its indicated cofactor has sign `sigma_(r-1)=-sigma_r` because `r` is even. Subtraction therefore adds magnitudes, giving a nonzero determinant. This proves maximal coefficient rank.

For evaluation rank, the entries are `(a_i+b_j)^D-1` with distinct nonnegative `a_i` and distinct positive `b_j` (absorb the input's shift of two into `b_j`). We claim that every even-order minor of size `r<=D+1` has sign `sigma_r` and is nonzero. Repeat the binomial Cauchy–Binet proof of Theorem 3.1, but replace the `k=0` row of the right factor by `b_j^D-1`. Terms not selecting `k=0` are unchanged. In a term selecting `0=k_1<k_2<...<k_r`, expand this modified right determinant as the original determinant minus the determinant whose first row is one and whose other rows have exponents `D-k_2,...,D-k_r`, retaining the positive binomial factors. If one of these other exponents is zero, the correction determinant is zero. Otherwise all are positive; reversing their order leaves exponent zero first and yields a strictly positive generalized Vandermonde determinant with sign `sigma_(r-1)=-sigma_r`. Thus the correction reinforces, rather than cancels, the original determinant. Every Cauchy–Binet summand still has sign `sigma_r` or is zero, and the choice `k_i=i-1` is nonzero. The claim follows. Apply it to a largest square submatrix of the evaluation cut.

At trivial cuts the tensors are nonzero vectors, so the rank is one. This completes the proof.

Consequently, neither high degree from repeated factors nor a complicated integer root set is needed for the rank obstruction: a squarefree short program with just one integer root already has full rank simultaneously at every coefficient and evaluation cut.

## 4. Unknown cofactors erase finite evaluation data

**Proposition 4.1.** If `F_n | H`, then `E_n(H)` is the zero tensor.

Every evaluation point in this tensor is one of `1,...,2^n`. The proposition follows directly. Consequently, raw evaluations on the prescribed roots have rank zero and cannot supply a positive rank lower bound for the target.

**Proposition 4.2 (off-root interpolation).** Let `R,T` be finite disjoint sets of integers with `T` nonempty, and let

```math
F_R(x)=\prod_{r\in R}(x-r).
```

There are a positive integer `D` and a nonzero `H in Z[x]`, divisible by `F_R`, such that `H(t)=D` for every `t in T`.

**Proof.** Lagrange interpolation gives a rational polynomial

```math
Q(x)=\sum_{t\in T}\frac{1}{F_R(t)}
       \prod_{u\in T\setminus\{t\}}\frac{x-u}{t-u},
```

with `Q(t)=1/F_R(t)`. Choose a positive common denominator `D` for the coefficients of `Q`. Then `H=D F_R Q` has integer coefficients and the stated properties. Since it is `D` at a point in `T`, it is nonzero. Its degree is at most `|R|+|T|-1`.

In particular, on any fixed off-root digit cube, an integer-coefficient multiple of `F_R` can have the constant evaluation tensor and hence rank one at every cut. The proposition does not assert that this multiple has a short program. Its consequence is that root divisibility alone cannot force high raw rank on a fixed off-root sample set.

**Proposition 4.3 (bounded jets).** For every nonnegative integer `r`, the nonzero multiple `F_R^(r+1)` has all derivatives of orders `0,...,r` equal to zero at every root in `R`.

**Proof.** Each `(x-a)^(r+1)` divides the polynomial, so differentiating at most `r` times leaves a factor of `x-a`. The repeated-power construction costs at most `2 floor(log_2(r+1))` multiplications in addition to a program for `F_R` (and costs zero extra when `r=0`).

Thus a fixed number of derivative layers cannot remove unknown multiplicities. One can also annihilate any fixed additional finite sample set by including its linear factors. These statements do not prohibit adaptive evaluations, degree-sensitive methods, or methods that separately use the cofactor's computational structure.

## 5. What integrality gives and what remains missing

The parallel arbitrary-root analysis supplies an elementary, cofactor-robust height bound through the first nonzero coefficient. Its conclusion for the present family is

```math
\log_2((2^n)!)\le 2^{s-1}
\quad\text{whenever }0\ne H\in\mathbb Z[x],\ F_n\mid H,\ \tau(H)\le s,\ s\ge1.
```

Hence, for n >= 1,

```math
\mu(n)\ge 1+\log_2\log_2((2^n)!)
=n+\log_2 n+1+o(1).
```

This uses the fact that distinct nonzero integer roots divide the first nonzero coefficient. The degree bound alone gives only `mu(n)>=n`. Neither bound is superpolynomial in `n`; neither proves a BSS separation. The full coefficient proof is in [ARITHMETIC.md](ARITHMETIC.md).

The missing consecutive-root statement is exactly the superpolynomial growth of `mu(n)`. A valid invariant would have to distinguish a short program from all nonzero multiples of `F_n`, survive gate reuse and subtraction, and avoid both the maximal-rank short-program example and the finite-sampling erasures above. No such invariant is established here.

