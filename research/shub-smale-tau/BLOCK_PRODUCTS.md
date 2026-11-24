# Block products and Newton coefficients

Status: research. No proof or disproof of the Shub–Smale tau conjecture is claimed. The construction in Section 1 is a self-contained reconstruction of a known upper bound. Sections 2–4 describe exact recurrences and the remaining obstacles in possible lower-bound arguments.

Write

```math
F_N(x)=\prod_{j=1}^{N}(x-j),\qquad
\mu(n)=\min_{0\ne Q\in\mathbb Z[x]}\tau(F_{2^n}Q).
```

The model starts with registers `1,x`; each subsequent register is a sum, difference, or product of two previous registers. All constants must be built and all scalar arithmetic is charged.

## 1. A charged reconstruction of the known square-root upper bound

### 1.1 Statement and source attribution

**Theorem.** For every real epsilon > 0 there is a constant C_epsilon such that for every integer N >= 1 there is a positive integer D_N with

```math
\tau(D_NF_N)\le C_\varepsilon N^{1/2+\varepsilon}.
```

Consequently any exponent C in the full tau conjecture must satisfy C >= 2. Also, for every epsilon > 0,

```math
\mu(n)=O_\varepsilon\!\left(2^{(1/2+\varepsilon)n}\right).
```

This is a known upper bound, not a new advance. Smale's *Mathematical Problems for the Next Century*, second version dated 7 August 1998, Problem 4, explicitly states that the exponent is at least 2, attributing the underlying result to Strassen. Koiran–Portier–Rojas, *Counting Tropically Degenerate Valuations and p-adic Approaches to the Hardness of the Permanent*, arXiv:1309.0486v1, the paragraph immediately following Theorem 1.14, gives the fast multipoint evaluation explanation. The proof below avoids importing a fast-multiplication black box and explicitly charges every integer constant and every denominator-clearing operation.

Primary sources:

- https://www.fim.uni-passau.de/fileadmin/dokumente/fakultaeten/fim/lehrstuhl/muller/SmaleProblems1998.pdf
- https://arxiv.org/html/1309.0486v1

### 1.2 Multiplication with a fixed finite set of rational constants

Fix an integer k >= 2 and put

```math
\alpha_k=\log_k(2k-1)>1.
```

Let R be any commutative Q-algebra. Multiplication of two coefficient arrays of length at most d over R is possible using O_k(d^{alpha_k}) scalar additions, subtractions, and multiplications in R, together with a fixed finite set of rational scalar constants depending only on k.

Here is the complete construction. First pad the arrays to length k^h, where k^(h-1) < d <= k^h. Put m=k^(h-1) and split

```math
A(t)=\sum_{i=0}^{k-1}t^{im}A_i(t),\qquad
B(t)=\sum_{i=0}^{k-1}t^{im}B_i(t),
```

where every block has degree less than m. Introduce an auxiliary formal variable z and form

```math
\widehat A(z,t)=\sum_{i=0}^{k-1}z^i A_i(t),\qquad
\widehat B(z,t)=\sum_{i=0}^{k-1}z^i B_i(t).
```

Evaluate both polynomials in z at the fixed integer nodes 0,1,...,2k-2. This requires O_k(d) scalar operations. Recursively multiply the corresponding 2k-1 pairs of length-m arrays. Their products are the values at these nodes of a polynomial of z-degree at most 2k-2. The associated Vandermonde matrix has nonzero determinant, since its nodes are distinct. Its inverse has rational entries depending only on k. Applying this fixed inverse coefficientwise recovers all z-coefficient arrays in O_k(d) operations. Substituting z=t^m and adding overlapping blocks costs another O_k(d) operations.

For padded lengths the recurrence is

```math
M(k^h)\le (2k-1)M(k^{h-1})+c_k k^h.
```

Since 2k-1 > k, summing the geometric series gives M(k^h)=O_k((k^h)^{alpha_k}). Padding enlarges length by less than a factor k, proving the assertion for all d. The rational constants used at every recursion level come from the same finite collection: the node powers and the entries of one fixed inverse Vandermonde matrix. There is no new set of input constants as d grows.

The exponent tends to 1 because

```math
\alpha_k=1+\frac{\log(2-1/k)}{\log k}\longrightarrow 1.
```

### 1.3 Monic division over the coefficient ring

Suppose A(t),B(t) belong to R[t], B is monic of degree d, and deg A < 2d. The remainder of A on division by B is computable in O_k(d^{alpha_k}) scalar operations with the same finite rational constants as in Section 1.2.

Use the fixed padded degree bounds e=2d-1 and m=d-1, and define rev_j P(t)=t^j P(1/t) for any polynomial of degree at most j. Reversing A=BQ+S with deg Q <= m and deg S < d shows

```math
\mathop{\mathrm{rev}}_mQ
\equiv
\mathop{\mathrm{rev}}_eA\,(\mathop{\mathrm{rev}}_dB)^{-1}
\pmod {t^{m+1}}.
```

The series g=rev_d B has constant coefficient 1. Its inverse to precision r can be doubled by

```math
h_{\mathrm{new}}=h(2-gh)\pmod {t^{2r}},
```

starting with h=1 at precision 1. Indeed, if gh=1-u with t^r dividing u, then g h(2-gh)=1-u^2 modulo t^(2r). Each doubling uses a constant number of polynomial multiplications at the new precision. Their costs sum to O_k(d^{alpha_k}). Recover Q by reversal and then compute S=A-BQ with one more multiplication.

No division by an element of R occurs. The scalar 2 is built once as 1+1. The padded reversal works even if A or Q is zero and requires no test of the actual degree. Array truncation means retaining already represented coefficients, so it is bookkeeping and not a coefficient-extraction oracle applied to a black-box polynomial.

### 1.4 Multipoint evaluation and the block product

For b points a_0,...,a_(b-1) in R and a polynomial G in R[t] of degree at most b, build the balanced product tree with leaves t-a_i. Every node polynomial is monic. At a level with polynomial degrees bounded by d there are O(b/d) nodes, so the total product-tree cost is bounded by a constant times

```math
\sum_{\ell=0}^{\lceil\log_2b\rceil}
\frac{b}{2^\ell}(2^\ell)^{\alpha_k}
=O_k(b^{\alpha_k}).
```

Unbalanced end nodes or padding to the next power of 2 change only the constant. Compute the remainder of G at the root and propagate remainders to children by Section 1.3. A parent remainder has degree less than its parent modulus, at most twice a child's degree after padding to a complete tree. The same geometric cost bound therefore applies. At a leaf, the constant remainder is G(a_i). Thus all b evaluations cost O_k(b^{alpha_k}) scalar operations. If the tree is padded by duplicate points, monicity still holds and the argument is unchanged; interpolation is not used here.

Now take R=Q[x], b=ceil(sqrt N), q=floor(N/b), and r=N-qb. Construct the integers 1,...,b by successive additions, at cost O(b). Construct the coefficient array

```math
G_b(t)=\prod_{j=1}^{b}(t-j)
```

by a product tree, at cost O_k(b^{alpha_k}). Construct all points a_i=x-ib, for 0 <= i <= b, by successive subtractions of the already constructed integer b. Multipoint evaluation gives G_b(a_i) for 0 <= i < b. Multiply the first q of these values. Their product is

```math
\prod_{i=0}^{q-1}G_b(x-ib)=F_{qb}(x).
```

The remaining r < b factors are x-qb-1,...,x-qb-r. Construct and multiply them in O(b) gates, giving exactly F_N over Q[x]. The case r=0 uses the empty product 1. All points, integers, and final products are included in the cost O_k(b^{alpha_k})=O_k(N^{alpha_k/2}).

### 1.5 Clearing denominators with every gate charged

The circuit just constructed uses only +, -, and multiplication, starting from x,1 and a fixed finite list of rational numbers depending only on k. Write each such rational as a/b with a integer and b a positive integer. These finitely many numerators and denominators can be built from 1 in O_k(1) gates, using binary expansion or repeated addition. Also build 0=1-1 once if needed.

Represent each rational-polynomial register by a pair (P,D) with P in Z[x], D a positive integer, and value P/D. The initial registers are (x,1), (1,1), and the pairs (a,b) for the fixed rational constants. Simulate each gate as follows:

```math
(P_1,D_1)\pm(P_2,D_2)
=\bigl(P_1D_2\pm P_2D_1,\ D_1D_2\bigr),
```

```math
(P_1,D_1)(P_2,D_2)
=\bigl(P_1P_2,\ D_1D_2\bigr).
```

An addition or subtraction costs at most four allowed gates and a multiplication costs at most two. No denominator vanishes. The final numerator is D_N F_N for a positive integer D_N. Its circuit length is still O_k(N^{alpha_k/2}). Choose k sufficiently large that alpha_k/2 <= 1/2+epsilon. This proves the theorem.

If an exponent C < 2 satisfied the tau bound, choose epsilon > 0 with C(1/2+epsilon) < 1. The constructed polynomial has exactly N distinct integer roots, so

```math
N\le (1+C_\varepsilon N^{1/2+\varepsilon})^C
=O_\varepsilon\!\left(N^{C(1/2+\varepsilon)}\right),
```

which fails for large N. Thus C >= 2.

### 1.6 Exact division-free variant

If only the three-product Karatsuba identity is used for polynomial multiplication, all coefficient operations lie in Z[x] from the outset. Its recurrence gives alpha=log_2 3. The same monic-division and multipoint construction therefore gives the exact polynomial F_N with

```math
\tau(F_N)=O\!\left(N^{(\log_2 3)/2}\right).
```

No scalar multiple or rational constant is needed. This weaker bound by itself already excludes tau exponent 1. The sharper conclusion C >= 2 above is classical and was already stated in 1998.

## 2. Newton coefficients and the consecutive-root ideal

Translate x=z+1 and use the Newton basis B_j(z)=binomial(z,j). Every rational polynomial has the unique expansion

```math
f(z)=\sum_{j\ge0} c_j(f) B_j(z),\qquad
c_j(f)=\Delta^j f(0),\quad \Delta f(z)=f(z+1)-f(z).
```

For f in Z[z], every c_j(f) is an integer, since it is an integer linear combination of integer evaluations. The basis-to-evaluation matrix at 0,...,N-1 is unit lower triangular. Consequently

```math
f(0)=\cdots=f(N-1)=0
\quad\Longleftrightarrow\quad
c_0(f)=\cdots=c_{N-1}(f)=0.
```

This equivalence is independent of the unknown cofactor. It is exactly membership in the principal ideal generated by the falling factorial z(z-1)...(z-N+1).

Addition is coefficientwise. The exact multiplication rule is

```math
B_a(z)B_b(z)=
\sum_{j=\max(a,b)}^{a+b}
\frac{j!}{(j-a)!(j-b)!(a+b-j)!}\,B_j(z).
```

The structure constant counts pairs of subsets of a fixed j-element set of sizes a and b whose union is the whole set: choose the intersection of size a+b-j and the two differences of sizes j-b and j-a. Counting such pairs inside an integer z-element set proves the identity for all nonnegative integers z, hence as a polynomial identity. In the unnormalized falling-factorial basis it becomes

```math
(z)_{\underline a}(z)_{\underline b}
=\sum_{r=0}^{\min(a,b)}
\binom ar\binom br r!\,(z)_{\underline{a+b-r}}.
```

These formulas determine every gate of the full Newton coefficient array. They do not compress it: a polynomial of degree 2^s can have 2^s+1 nonzero Newton coefficients. For example, z^D has all positive Newton coefficients in indices 1,...,D although it has a repeated-squaring circuit of length log_2 D when D is a power of 2.

If all coefficients of nonzero f and g are nonnegative, the least supported Newton index satisfies

```math
\mathop{\mathrm{ord}}_{\mathrm{Newt}}(f+g)
=\min\{\mathop{\mathrm{ord}}_{\mathrm{Newt}}(f),
       \mathop{\mathrm{ord}}_{\mathrm{Newt}}(g)\},
```

```math
\mathop{\mathrm{ord}}_{\mathrm{Newt}}(fg)
=\max\{\mathop{\mathrm{ord}}_{\mathrm{Newt}}(f),
       \mathop{\mathrm{ord}}_{\mathrm{Newt}}(g)\}.
```

For the product, no coefficient can occur below that maximum, and the pair of leading supported indices contributes positively at the maximum. In a general straight-line program subtraction destroys this monotone rule. The unresolved lower-bound requirement is a bound on the creation of a long initial zero block by cancellations over the whole program history. The displayed identities alone provide no such bound.

## 3. Fixed divisors lose the residue profile needed by products

For nonzero f in Z[x], define its fixed divisor d(f)=gcd{f(a):a in Z}, taken positive. Consecutive-root divisibility implies

```math
F_N\mid f\quad\Longrightarrow\quad N!\mid d(f),
```

because F_N(a) is divisible by N! at every integer a. This remains true for an arbitrary integer cofactor.

A tempting product inequality is false even for primitive quadratics. Put

```math
u(x)=x(x-2),\qquad v(x)=(x-1)(x-3).
```

Then d(u)=d(v)=1, since u(1)=-1 and v(2)=-1. But uv=x(x-1)(x-2)(x-3) has fixed divisor 4!=24: every value is divisible by 24 and the value at 4 is exactly 24. In particular

```math
d(uv)\nmid \binom{4}{2}d(u)d(v)=6.
```

The fixed divisor alone discards complementary residue classes at product gates. A viable invariant must retain more of the functions a -> v_p(f(a)), not merely their minimum over a. The exact pointwise product rule is additive; at an addition gate only

```math
v_p(f(a)+g(a))\ge\min\{v_p(f(a)),v_p(g(a))\}
```

is automatic, and cancellation can make it strict by an arbitrary amount. No averaging lemma controlling this increase in terms of circuit history is proved here.

## 4. Repeated blocking does not automatically improve the exponent

The construction in Section 1 balances a block polynomial of degree b against about N/b evaluation points. Its two data sizes are b and N/b. Taking b near sqrt N minimizes their maximum. Replacing the procedure that *evaluates* the block polynomial by a shorter straight-line program does not supply its coefficient array, which is the input required by the remainder-tree algorithm.

More explicitly, suppose G_b has a circuit of length T(b). Applying that circuit separately at q=N/b translated arguments costs q T(b) in general. Gate reuse is valid only when the input registers agree. Translation changes every variable-dependent gate. Running the circuit in the algebra R[t]/P(t), where P has degree q and encodes all q points, represents each gate by q coefficients and costs O(T(b) M(q)); this is an exact batched simulation but does not remove the coefficient-array cost.

At this stage no recurrence of the form T(N) <= T(sqrt N) poly(log N) has been established. Such a recurrence would require a new operation for compressed products of translated values, with its own fully charged implementation. It cannot be inferred from the product identity F_(ab)(x)=product_(i=0)^(a-1) F_b(x-ib).

