# Positive-border triangular constructions for Wang's problem

Research checkpoint: 20 November 2026, America/Chicago. This records exact identities and a construction obstruction. It does not resolve Minc Problem 7 or add a conjecture to the solved count.

## The construction

Let B be an N-by-N binary lower unitriangular matrix, put n=N+1, and define

```math
A(B)=\begin{pmatrix}1&\mathbf1^T\\\mathbf1&J_N-2B\end{pmatrix},
```

where J_N denotes the all-ones matrix in this note. Subtracting the first row from every other row proves

```math
\det A(B)=(-2)^N.
\tag{1}
```

This determinant does not depend on the strict lower triangle. Thus any B for which |per A(B)|=2^N gives a solution of [Minc Problem 7](https://yair-lavi.com/mincs-list/problem-7/index.html).

The partition subfamily takes B=diag(L_(m_1),...,L_(m_s)), where each L_m is lower triangular with all entries on and below its diagonal equal to one, and the positive integers m_i sum to N. The free positive border is essential: this is not the previously considered unbordered matrix J_n−2diag(L_(m_i)).

## Rook formula and exponential generating function

Write P_m for the permanent of the bordered partition construction, with m=(m_1,...,m_s). The k-th rook number of L_m is S(m+1,m+1−k), where S denotes a Stirling number of the second kind. Hence, if

```math
R_m(z)=\sum_{k=0}^m S(m+1,m+1-k)z^k,
```

ordinary expansion around the all-ones matrix gives

```math
P_{\boldsymbol m}=\sum_{k=0}^N(-2)^k(N+1-k)!
[z^k]\prod_{i=1}^sR_{m_i}(z).
\tag{2}
```

This is finite integer arithmetic. The factorial is (N+1−k)!, because the positive border adds one row and column.

The corresponding multivariate exponential generating function, with zero block sizes allowed formally, is

```math
F_s(x_1,...,x_s)=
\sum_{m_1,...,m_s\ge0}P_{\boldsymbol m}
\prod_i\frac{x_i^{m_i}}{m_i!}
=\frac{4\exp(-2\sum_i x_i)}{(2-s+\sum_i\exp(-2x_i))^2}.
\tag{3}
```

For a direct derivation, put B_m(t)=t^mR_m(−2/t). The Stirling generating function gives

```math
\sum_{m\ge0}B_m(t)\frac{x^m}{m!}
=e^{-2x}\exp\left(\frac t2(1-e^{-2x})\right).
```

Integrating t∏B_(m_i)(t) against e^(−t)dt gives (2). Multiplying the displayed generating functions before integration gives (3), since the remaining integral is ∫_0^∞t e^(−at)dt=a^(−2). This manipulation is valid analytically near zero, or coefficientwise as an identity of formal power series.

An equivalent expression uses u_i=tanh(x_i):

```math
F_s(\boldsymbol x)=
\frac{\prod_i(1-u_i^2)}{
\left(1-\sum_{r=2}^s(r-1)e_r(\boldsymbol u)\right)^2}.
\tag{4}
```

Indeed,

```math
\left(2-s+\sum_i\frac{1-u_i}{1+u_i}\right)\prod_i(1+u_i)
=2\left(1-\sum_{r=2}^s(r-1)e_r(\boldsymbol u)\right).
```

## Exact recurrence

Set f_m=P_m/(−2)^|m|, including f_0=1. Multiplying (3) by its denominator and comparing coefficients gives

```math
\begin{aligned}
4f_{\boldsymbol m}={}&4
-\sum_i\sum_{r=1}^{m_i}\binom{m_i}{r}(2+2^r)
f_{\boldsymbol m-re_i}
\\ &-2\sum_{i\lt j}\sum_{r=1}^{m_i}\sum_{t=1}^{m_j}
\binom{m_i}{r}\binom{m_j}{t}
f_{\boldsymbol m-re_i-te_j}.
\end{aligned}
\tag{5}
```

To check the coefficients, let q=2−s+Σe^(−2x_i). The nonconstant derivatives of q² supported on one coordinate, of total order r, equal 2(−2)^r+(−4)^r. Those supported on two coordinates, of total order r+t, equal 2(−2)^(r+t). There are no terms supported on more than two coordinates. The constant coefficient is four. This proves (5).

For one block, F_1(x)=sech²x. For two blocks,

```math
F_2(x,y)=\mathop{\mathrm{sech}}^2(x-y).
\tag{6}
```

Therefore every construction with at most two nonempty blocks has zero permanent when n is even. Two blocks cannot provide a general improvement over the single-block absolute permanent: their derivatives have the same absolute value at each fixed total order.

## An exact obstruction to the partition strategy

The partition construction already fails at n=8, an admissible order for Wang's problem. There are 15 partitions of N=7. The complete sets of possible permanents, divided by 32, are:

| Number of blocks | Permanent divided by 32 |
| --- | --- |
| 1 | 0 |
| 2 | 0 |
| 3 | −30, 17, 24, 35 |
| 4 | −43, 29, 72 |
| 5 | 22, 101 |
| 6 | 142 |
| 7 | 213 |

Equation (1) requires absolute permanent 128, so the target in the table is ±4. It never occurs. The accompanying checker enumerates all 15 partitions and independently checks (2), the determinant, and the permanent by subset dynamic programming. This rules out the partition family as a construction that works in every admissible order. It does not rule out all sufficiently large orders, a finite-exception construction, or the wider arbitrary-unitriangular family.

Admissibility at order eight is not a new claim. Wanless's published matrix T_8{1,4,5,6} has permanent and determinant both 128, where T_nS has entry −1 exactly when j−i lies in S. See I. M. Wanless, *Permanents of matrices of signed ones*, Linear and Multilinear Algebra **53** (2005), 427–433, printed page 431: https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf , DOI https://doi.org/10.1080/03081080500093990 . The checker also verifies this witness directly.

## The wider triangular family has a different recurrence

For A=A(B), index the positive border by zero and the remaining columns by 1,...,N. For S⊆[N], let P_S be the permanent obtained by replacing every column in S by the all-ones border column. Thus P_empty=per A.

Append a unitriangular binary row v to B, and put w_j=1−2v_j. The enlarged sign matrix has the form

```math
A'=\begin{pmatrix}A&\mathbf1\\1\quad w_1\ \cdots\ w_N&-1\end{pmatrix}.
```

Expanding its last row gives

```math
\mathop{\mathrm{per}}A'=\sum_{j=1}^N w_jP_{\{j\}},
\qquad\det A'=-2\det A.
\tag{7}
```

The cofactor at the new diagonal contributes −per A. The cofactor at the border column contributes +per A, because deleting that column replaces it by the identical all-ones new column. These two terms cancel. Each remaining cofactor is P_{j}, proving (7).

The same argument gives the full update hierarchy. For S⊆[N],

```math
P'_S=|S|P_S+\sum_{j\notin S}w_jP_{S\cup\{j\}},
\tag{8}
```

and, denoting the new column by *,

```math
P'_{S\cup\{*\}}=(|S|+2)P_S+\sum_{j\notin S}w_jP_{S\cup\{j\}}.
\tag{9}
```

In (8), the replaced columns have last entry one and all have cofactor P_S. In (9), replacing the new column changes its last entry from −1 to +1, adding 2P_S.

Equivalently, for the multiaffine polynomial H_B(z)=Σ_S P_S∏_(j∈S)z_j,

```math
H_{B'}(z,z_*)=(1+z_*)\sum_{j=1}^N(w_j+z_j)\partial_jH_B(z)
+2z_*H_B(z).
\tag{10}
```

This is an exact symbolic construction rule. An all-order induction still needs a choice of the signs w that guarantees the required permanent and preserves a usable invariant through future steps. Equation (7) alone does not establish that a signed-sum solution exists.

For concreteness, the wider family contains a matrix equivalent to Wanless's existing order-eight witness. One such B is

```math
\begin{pmatrix}
1&0&0&0&0&0&0
\\ 1&1&0&0&0&0&0
\\ 1&1&1&0&0&0&0
\\ 1&1&0&1&0&0&0
\\ 1&0&1&0&1&0&0
\\ 1&0&1&1&0&1&0
\\ 0&1&1&1&0&0&1
\end{pmatrix}.
```

Its bordered matrix has permanent 128 and determinant −128. Its first replacement-column permanents are

```math
(128,832,896,416,288,416,-32).
```

For example, w=(−1,−1,1,−1,1,1,−1) gives (7) equal to 256. This check shows that the partition obstruction does not also obstruct the arbitrary triangular construction. It is not a new order of Wang's problem, and no general existence inference follows from it.

## Remaining gap

The partition family cannot settle every admissible order. The wider family has an exact update rule, but no invariant has been found that forces the signed-sum target at all permissible steps or supplies controlled jumps across excluded orders. Increasing a finite search range would not fill this gap.
