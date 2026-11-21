# Sign matrices with |per A| = |det A|

Research checkpoint, 21 November 2026 UTC. This note gives exact block
expansion identities, an obstruction to a proposed partition construction,
and an all-order obstruction to stretching one block of a fixed skeleton.
It does not resolve Minc Problem 7 or establish a new admissible order.

The [current problem](https://yair-lavi.com/mincs-list/problem-7/index.html)
asks for every order admitting a nonsingular sign matrix with equal
absolute permanent and determinant. Its first undecided order is 32.
The known exclusion of orders 2^k−1 prevents indiscriminate iteration of
a size-increasing operation, but the identities below are valid at every
order without assuming a conjectural classification.

## 1. Arbitrary sign skeletons

Let C be an s×s sign matrix with c_ii=−1, and let m_1,…,m_s be positive
integers with sum n. Let L_m be the lower-triangular all-ones matrix,
including its diagonal. Write

```math
D=\operatorname{diag}(L_{m_1},\ldots,L_{m_s}),
\qquad S=C+2I_s.
```

Let Z be the n×s block-indicator matrix. Define

```math
A(\mathbf m;C)=ZSZ^T-2D.
\tag{1}
```

Off its diagonal blocks, A has the constant block c_ij J. Its i-th
diagonal block is J−2L_(m_i). Thus every entry of A is a sign.
The determinant lemma and 1^T L_m^−1 1=1 give

```math
\boxed{\det A(\mathbf m;C)=(-2)^{n-s}\det C.}
\tag{2}
```

Indeed Z^T D^−1 Z=I_s, so
det A=(−2)^n det(I_s−S/2)=(−2)^(n−s)det C.

For a vector k of nonnegative integers, let C[k] be the matrix obtained
by repeating row i and column i exactly k_i times. The permanent of the
empty matrix is one. With {m\brace k} denoting a Stirling number of the
second kind, the exact permanent formula is

```math
\boxed{
\operatorname{per}A(\mathbf m;C)
=\sum_{1\le k_i\le m_i}
\left(\prod_{i=1}^s2^{m_i-k_i}{m_i\brace k_i}\right)
\operatorname{per}C[\mathbf k].
}
\tag{3}
```

Equivalently, allowing empty formal blocks for this generating function,

```math
\sum_{m_1,\ldots,m_s\ge0}
\operatorname{per}A(\mathbf m;C)
\prod_i\frac{x_i^{m_i}}{m_i!}
=\frac1{\det\!\left(I_s-
\operatorname{diag}\!\left(\frac{e^{2x_i}-1}{2}\right)C\right)}.
\tag{4}
```

An empty block removes its index from the skeleton; formula (2), as
written, uses the number of nonempty blocks.

### Direct derivation of the permanent formula

For any matrix H, the coefficient of y_1⋯y_n in
det(I−diag(y)H)^−1 equals per H. To see this, expand the reciprocal
determinant as exp(∑_(l≥1) tr((diag(y)H)^l)/l). The squarefree coefficient
selects disjoint directed cycles covering all indices, which are exactly
the permutations and their permanent weights. This is the squarefree
form of MacMahon's identity.

Apply it to (1). Within block i set
w_i=∏_(a=1)^(m_i)(1+2y_ia). Elementary lower-triangular elimination gives

```math
q_i=\mathbf1^T(I+2Y_iL_{m_i})^{-1}Y_i\mathbf1
=\frac12(1-w_i^{-1}).
```

For completeness, if z=(I+2Y_iL_m)^−1Y_i1 and p_a=∑_(b≤a)z_b, then
(1+2y_a)p_a=p_(a−1)+y_a. Thus
1−2p_a=(1−2p_(a−1))/(1+2y_a), proving the displayed formula by induction.
The determinant lemma now yields

```math
\begin{aligned}
\det(I-YA)
&=\left(\prod_iw_i\right)\det(I-\operatorname{diag}(q_i)S)\\
&=\det\!\left(I-\operatorname{diag}\!\left(\frac{w_i-1}{2}\right)C\right).
\end{aligned}
```

The repeated-index form of the same cycle expansion is

```math
\det(I-\operatorname{diag}(t)C)^{-1}
=\sum_{\mathbf k\ge0}
\frac{\operatorname{per}C[\mathbf k]}{\prod_i k_i!}
\prod_i t_i^{k_i}.
```

After substituting t_i=(w_i−1)/2, the squarefree coefficient on the
m_i variables of block i in t_i^(k_i)/k_i! is
2^(m_i−k_i){m_i\brace k_i}: the selected nonempty subsets form an
unordered partition of those variables. This proves (3), and the
Stirling generating function proves (4).

## 2. Exact criteria for short expansions

Assume C is nonsingular and |per C|=|det C|. Put P=per C. Let P_i be
the permanent of C with index i repeated twice, all other indices once.
For m_i=2 and all other block sizes one, (2) and (3) give

```math
\operatorname{per}A=2P+P_i,\qquad \det A=-2\det C.
```

Therefore this one-vertex expansion preserves the required equality
**if and only if**

```math
P_i\in\{0,-4P\}.
\tag{5}
```

The second option reverses the permanent's sign relative to 2P. Keeping
only P_i=0 would omit valid possibilities.

For distinct indices i,j expanded to size two, let P_ij denote the
permanent with both indices repeated twice. The corresponding criterion is

```math
2P_i+2P_j+P_{ij}\in\{0,-8P\}.
\tag{6}
```

For one index expanded to size three, with P_ii denoting three copies of
that index, the criterion is 6P_i+P_ii∈{0,−8P}. None of these identities
asserts that a suitable index or pair always exists.

## 3. The all-ones off-diagonal skeleton already fails at order nine

For C=J_s−2I_s, (1) becomes

```math
A=J_n-2\operatorname{diag}(L_{m_1},\ldots,L_{m_s}),
\qquad \det A=(-2)^{n-1}(s-2).
\tag{7}
```

The rook polynomial of L_m has coefficients {m+1\brace m+1−k}. Hence

```math
\operatorname{per}A
=\sum_{k=0}^n(-2)^k(n-k)!\,[z^k]
\prod_{i=1}^s
\left(\sum_{j=0}^{m_i}{m_i+1\brace m_i+1-j}z^j\right).
\tag{8}
```

Its multivariate exponential generating function is

```math
\frac{2\exp(-2\sum_i x_i)}{2-s+\sum_i e^{-2x_i}}.
```

Permuting whole blocks simultaneously in rows and columns does not
change either quantity, so integer partitions of n exhaust this family.
At n=9 the thirty partitions give the following complete set of permanent
values, divided by 64, grouped by the number s of blocks:

| s | Values of per A / 64 | Required absolute value |
|---|---|---|
| 1 | −124 | 4 |
| 2 | −107, −26, 73, 124 | Singular |
| 3 | −107, −77, −60, 21, 25, 72, 90 | 4 |
| 4 | −60, −22, 21, 78, 90, 107 | 8 |
| 5 | −52, −43, 113, 131, 238 | 12 |
| 6 | −95, 160, 310 | 16 |
| 7 | 182, 411 | 20 |
| 8 | 553 | 24 |
| 9 | 766 | 28 |

Thus no choice of partition at this already-admissible order solves
Problem 7. This rules out the family as a single construction covering
every admissible order. It does not rule out its use at some orders
alongside other constructions. The n=9 existence result is prior work:
Wanless gives the Toeplitz sign matrix negative exactly when its offset
j−i belongs to {0,1,2,6,7}, with common absolute value 256.

The exact checker verifies every row of the table independently by
subset-DP permanents of the actual 9×9 matrices and by rook polynomial
expansion. It also checks the known n=9 witness. This certificate is an
audit of a proposed construction, not a new order result.

## 4. Stretching one vertex of a fixed skeleton eventually fails

Fix any nonsingular skeleton C and an index i. Let m_i=m and let every
other block size equal one. Put

```math
D_i=C(i\mid i),\qquad
c=C([s]\setminus\{i\},i),\qquad
r^T=C(i,[s]\setminus\{i\}).
```

Define

```math
g_i(x)=\sum_{m\ge0}\operatorname{per}A_m\frac{x^m}{m!}.
```

A Schur complement in (4), followed by the squarefree coefficient for
the other s−1 indices, gives the exact identity

```math
\boxed{
g_i(x)=(1-\tanh x)
\operatorname{per}(D_i+\tanh(x)c r^T).
}
\tag{9}
```

In detail, with t=(e^(2x)−1)/2, the diagonal entry of I−diag(t_j)C at i
is 1+t. Its Schur complement on the other indices is
I−diag(t_rest)(D_i+(t/(1+t))cr^T). Since t/(1+t)=tanh x and
1/(1+t)=1−tanh x, (9) follows.

Write (9) as g_i(x)=Q_i(tanh x). The polynomial Q_i has degree exactly s:
the top coefficient of per(D_i+u cr^T) is
(s−1)!∏_a c_a∏_b r_b, which is nonzero, and multiplication by 1−u adds
one degree. For s=1 the empty permanent gives g_i(x)=1−tanh x, so the
same description holds directly.

### Parity and pole cancellations

Split Q_i into its even and odd parts. On a parity ε∈{0,1}, a zero odd
part or constant even part gives zero derivatives of that parity in all
sufficiently large orders. These cannot equal the nonzero determinant.

Otherwise let d≥1 be the degree of that parity part and a_d its leading
coefficient. The two nearest poles of Q_i(tanh x) are at x=±iπ/2.
The residue of tanh at both poles is one, so this parity part has pole
order d and leading principal coefficient a_d at each. Put a=π/2.
For m of the same parity as d, the contribution of those leading poles
to the Taylor coefficient is

```math
2a_d(-1)^d\cos\!\left(\frac{(m+d)\pi}{2}\right)
a^{-m-d}{m+d-1\choose d-1}.
\tag{10}
```

The cosine is ±1. Lower principal parts contribute
O(a^−m m^(d−2)). After subtracting the full principal parts at both
poles, the remainder is analytic in every disk of radius less than
3π/2, so its coefficients are exponentially smaller. Consequently,

```math
|\operatorname{per}A_m|
=\left(\frac{2|a_d|a^{-d}}{(d-1)!}+o(1)\right)
m!\,m^{d-1}\left(\frac2\pi\right)^m
\quad(m\equiv d\pmod2).
\tag{11}
```

By (2), |det A_m|=2^(m−1)|det C|. The ratio of (11) to this value
tends to infinity, since m!/π^m tends to infinity faster than any
fixed inverse power of m. Thus each parity either has zero permanents
eventually or has absolute permanent strictly larger than the determinant
eventually. In both cases equality fails.

**Conclusion.** Every fixed nonsingular sign skeleton, expanded at just
one fixed vertex, supplies only finitely many solutions of Problem 7.
The same holds for a finite collection of such fixed-skeleton one-vertex
families. The proof explicitly handles the parity cancellation that
prevents a naive single-pole argument.

## 5. What remains

The general identities permit simultaneous block growth or a skeleton
that changes with the order. No construction satisfying (5), (6), or
their higher-order counterparts for every admissible order has been
proved. The fixed-skeleton obstruction does not apply to arbitrary
binary-dependent changes of skeleton.

The formulas were derived independently by the root and sign workers;
the regular worker independently checked the skeleton identities and
the polynomial-in-tanh specialization, and confirmed the pole argument.
A separately written checker reproduced all thirty partition values
and verified the skeleton identities on all 64 sign skeletons of order
three with diagonal −1. Internal checking does not
establish historical priority or replace external review.

Sources for the problem and known order-nine solution:
[current Minc Problem 7](https://yair-lavi.com/mincs-list/problem-7/index.html);
I. M. Wanless, *Permanents of matrices of signed ones*, Linear and
Multilinear Algebra 53 (2005), 427–433,
[primary full text](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf),
[DOI](https://doi.org/10.1080/03081080500093990).
For the classical repeated-index MacMahon identity, a modern primary
reference is U. Chabaud, A. Deshpande and S. Mehraban, *Quantum-inspired
permanent identities*, Quantum 6 (2022), 877, Section 2.3, equation (20):
[primary full text](https://arxiv.org/pdf/2208.00327),
[journal record](https://quantum-journal.org/papers/q-2022-12-19-877/).
