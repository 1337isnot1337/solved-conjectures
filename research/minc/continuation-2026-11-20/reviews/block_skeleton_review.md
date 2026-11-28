# Independent review of the Problem 7 block construction

Review dated 21 November 2026 UTC. The review covers
`../sign/p7_skeleton_lifts.md` and its exact checker.
The reviewed identities and construction obstructions are correct.
They do not resolve Minc Problem 7 or provide a new admissible order.

## Scope and checks

I read the complete mathematical draft and ran its checker. I also wrote
`block_skeleton_review.py` independently, without importing the sign worker's
code. The independent script computes permanents by subset dynamic programming
and determinants by rational elimination.

The script reproduces every entry of the order-nine obstruction table from
the actual matrices. All thirty integer partitions are covered. It also
checks the general determinant and Stirling identities on all 64 sign
skeletons of order three with diagonal minus one. These small tests check
normalizations and indexing; they are not new existence results. An additional
case with an empty formal block checks that the determinant uses the principal
restriction to the nonempty skeleton indices.

Both checkers pass. The source attribution for the known order-nine solution
also checks: Wanless, page 431, gives the Toeplitz matrix negative at exactly
the offsets `j-i` in `{0,1,2,6,7}`, with common absolute value 256.
The matrix is a prior example and is not a new result of this work.

## General identities

Let the sign skeleton be C of order s with diagonal minus one. Set S=C+2I.
For positive block sizes m_i, write n=sum m_i,
L=diag(L_(m_1),...,L_(m_s)), and let Z be the block indicator matrix.
Then A=ZSZ^T-2L. Since each lower triangular all-ones block satisfies
L_m^(-1)1=e_1, one has Z^T L^(-1)Z=I. Thus

```math
\det A=(-2)^n\det(I-S/2)=(-2)^{n-s}\det C.
```

Here is an independent derivation of the permanent generating function.
The rook number r_j(L_m) equals the Stirling number
`{m+1 brace m+1-j}`. A direct bijection places the rook in row r, column c
at the directed edge c-1 to r on vertices 0,...,m. Nonattacking rooks give
disjoint increasing paths. The vertex sets of those paths are a set partition.

Expanding the permanent by the entries taken from -2L gives

```math
\mathop{\mathrm{per}}A
=\sum_{0\le k_i\le m_i}\mathop{\mathrm{per}}S[\mathbf k]
\prod_i(-2)^{m_i-k_i}{m_i+1\brace k_i+1}.
```

In this expression C[k] or S[k] repeats both row and column i exactly k_i
times. The selected rook positions remove m_i-k_i rows and the same number
of columns from block i; the remaining rank-s matrix is S[k].
The single-block exponential generating function is

```math
\sum_{m\ge k}(-2)^{m-k}{m+1\brace k+1}\frac{x^m}{m!}
=e^{-2x}\frac1{k!}\left(\frac{1-e^{-2x}}2\right)^k.
```

The repeated-index MacMahon identity therefore gives

```math
\begin{aligned}
F_C(\mathbf x)
&=\frac{e^{-2\sum_i x_i}}
 {\det(I-\mathop{\mathrm{diag}}((1-e^{-2x_i})/2)S)}
\\ &=\frac1{\det(I-\mathop{\mathrm{diag}}((e^{2x_i}-1)/2)C)}.
\end{aligned}
```

Expanding the second line proves the reviewed Stirling formula

```math
\mathop{\mathrm{per}}A
=\sum_{1\le k_i\le m_i}\mathop{\mathrm{per}}C[\mathbf k]
\prod_i2^{m_i-k_i}{m_i\brace k_i}.
```

Both identities hold formally with empty blocks if the empty matrix has
permanent one. In the determinant formula, empty indices must first be
removed from C and s must then count its remaining indices.

The all-ones off-diagonal specialization C=J_s-2I gives

```math
F_C(\mathbf x)
=\frac{2e^{-2\sum_i x_i}}{2-s+\sum_i e^{-2x_i}},
\qquad
\det A=(-2)^{n-1}(s-2),
```

as claimed. At order nine this family misses all the known solutions,
so it cannot by itself cover every admissible order. That conclusion is
about this family only.

## An additional repeated-index identity

Fix a skeleton index i and write C in block form as

```math
C=\begin{pmatrix}-1&r^T\\c&D\end{pmatrix}.
```

For 0<=ell<=s-1, define

```math
E_\ell=
\sum_{\substack{I,J\subseteq[s]\setminus\{i\}\\|I|=|J|=\ell}}
\mathop{\mathrm{per}}D(I^c\mid J^c)
\prod_{a\in I}c_a\prod_{b\in J}r_b.
```

If i is repeated k times and every other index once, direct counting gives

```math
\mathop{\mathrm{per}}C[i^k]
=(-1)^k k!\sum_{\ell=0}^{s-1}(-1)^\ell(k)_\ell E_\ell.
\tag{1}
```

Indeed ell external rows and ell external columns connect to the repeated
block. Their assignments contribute (k)_ell squared. The remaining k-ell
repeated rows and columns contribute (-1)^(k-ell)(k-ell)!. Their product
is (-1)^(k-ell)k!(k)_ell, giving (1).

Since E_(s-1) is the product of the entries of c and r, it is plus or minus
one. Consequently the polynomial in k after dividing (1) by (-1)^k k!
has degree exactly s-1. In particular, for a fixed skeleton and index,
there are at most s-1 nonnegative integer repetition counts with zero
repeated-index permanent. This statement concerns literal repeated rows
and columns, not the triangular expansions themselves.

Summing (1) against y^k/k! gives

```math
\sum_{k\ge0}\mathop{\mathrm{per}}C[i^k]\frac{y^k}{k!}
=\sum_{\ell=0}^{s-1}\ell!E_\ell
\frac{y^\ell}{(1+y)^{\ell+1}}.
```

Substitute y=(e^(2x)-1)/2. The EGF for expanding just index i becomes

```math
g_i(x)
=(1-\tanh x)\sum_{\ell=0}^{s-1}\ell!E_\ell\tanh^\ell x
=(1-\tanh x)\mathop{\mathrm{per}}(D+\tanh(x)cr^T).
```

This agrees with the sign worker's independent Schur-complement derivation.

## Review of the fixed-skeleton obstruction

The last expression is Q(tanh x), where Q has degree exactly s. Its
highest coefficient is -(s-1)!E_(s-1), which is nonzero. Split Q into even
and odd parts. A constant even part or zero odd part gives zero derivatives
in all sufficiently large orders of its parity. Otherwise, if its parity
degree is d>=1 and its leading coefficient is a_d, the poles at plus and
minus i*pi/2 both have order d and leading coefficient a_d.

For m of the same parity as d, their leading Taylor contributions add:

```math
[x^m]Q_{\text{parity}}(\tanh x)
\sim
2a_d(-1)^d\cos\!\left(\frac{(m+d)\pi}2\right)
\left(\frac\pi2\right)^{-m-d}
{m+d-1\choose d-1}.
```

The cosine is never zero on that parity. Lower principal parts are smaller
by a polynomial factor. After subtracting both principal parts, the
remainder is analytic on any disk of radius less than 3*pi/2. Cauchy's
coefficient estimate then makes that remainder exponentially smaller.
This justifies the asymptotic without a possible cancellation between the
two nearest poles.

Multiplication by m! converts EGF coefficients to permanents. Dividing by
the determinant magnitude 2^(m-1)|det C| leaves a nonzero constant times
m! m^(d-1)/pi^m, which tends to infinity. The parity with zero derivatives
also cannot give equality to a nonzero determinant. Thus the reviewed
statement is correct: each fixed nonsingular skeleton expanded at one
fixed vertex gives only finitely many permanent-determinant equalities.

For a size-two expansion, both sign possibilities must be retained:
per A=2 per C+per C[i^2], so preservation of absolute equality is equivalent
to per C[i^2] being either zero or -4 per C. The draft includes both cases.

The argument does not cover simultaneous unbounded growth of several
blocks, or changing the skeleton with the order. No universal recursive
construction has been proved.

## Sources checked

- [Current Minc Problem 7](https://yair-lavi.com/mincs-list/problem-7/index.html).
- I. M. Wanless, *Permanents of matrices of signed ones*, Linear and
  Multilinear Algebra 53 (2005), 427-433.
  [Primary full text](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf),
  especially the Toeplitz definition on page 430 and examples on page 431.
- U. Chabaud, A. Deshpande, and S. Mehraban, *Quantum-inspired permanent
  identities*, Quantum 6, 877 (2022), Section 2.3, equation (20), for the
  classical repeated-index MacMahon identity.
  [Primary full text](https://arxiv.org/pdf/2208.00327),
  [journal page](https://quantum-journal.org/papers/q-2022-12-19-877/).

The identities here are deductions using classical tools. Independent
checking within this session does not establish historical priority.
