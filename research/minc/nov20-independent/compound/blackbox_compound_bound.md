# A block black-box bound for permanental characteristic polynomials

Research checkpoint, 20 November 2026 (America/Chicago). This is a
source-backed algorithmic corollary, not a resolution of Minc Problem 17.
The construction handles repeated eigenvalues and multiple invariant
factors. Its improvement over the direct method holds for the parameter
ranges stated below, rather than uniformly for every k.

The algorithm uses exact field arithmetic and is Monte Carlo: its error
probability can be made arbitrarily small. This is not a deterministic or
Las Vegas claim. Arithmetic counts do not bound rational bit complexity.

## 1. The black-box theorem needed here

Let B be an N by N matrix and let E be the arithmetic cost of applying B
to one vector. For an integer block size 1 <= b <= N, Villard's
invariant-factor method gives the bound

```math
\widetilde O\!\left(
 \sqrt{\frac Nb}\,
 \left(NE+N^2+Nb^{\omega-1}+\operatorname{MM}(N,b)\right)
\right),                                                     \tag{1}
```

where MM(N,b) is the cost of multiplying an N by N matrix by an N by b
matrix. This is the bound obtained from Lemma 6.4.3 and the following
block binary search in Section 6.4, printed pages 46--47, of
[Villard's 2003 habilitation](https://perso.ens-lyon.fr/gilles.villard/BIBLIOGRAPHIE/PDF/Hdr.pdf).
The dimensions defining MM appear in Theorem 3.2.1.

The method obtains blocks of invariant factors using random additive
Toeplitz perturbations, projected matrix generators, Smith forms, and
gcds. The divisibility chain bounds the number of block queries by
O(sqrt(N/b)), apart from logarithms. It applies to arbitrary B; it does
not replace the characteristic polynomial by a scalar minimal polynomial
or assume a cyclic matrix. This distinction matters, for example, when
B is an identity matrix.

Random scalar samples come from a sufficiently large finite set. Over a
small finite field one may pass to an extension; over characteristic
zero the field already has arbitrarily large finite subsets.

## 2. Applying a permanental compound as a tensor

For an n by n matrix A, put N=binom(n,k). Given a vector v indexed by
k-subsets, define an order-k tensor, with each index running from 1 to n,
by

```math
T_{j_1,\ldots,j_k}=
\begin{cases}
v_{\{j_1,\ldots,j_k\}},&j_1,\ldots,j_k\text{ distinct},\\
0,&\text{otherwise}.
\end{cases}                                                  \tag{2}
```

Apply A to each tensor index. If i_1,...,i_k are distinct, the resulting
entry is

```math
\sum_{j_1,\ldots,j_k}
 a_{i_1j_1}\cdots a_{i_kj_k} T_{j_1,\ldots,j_k}
 =
\sum_{|J|=k}\operatorname{per}A[I\mid J]v_J.                  \tag{3}
```

Thus reading one ordering of each distinct output set gives P_k(A)v.
No factorial normalization is present in this tensor convention.

Each mode multiplication is an n by n matrix times an n by n^(k-1)
matrix. This gives the completely general action bound

```math
E_{n,k}\le
O\!\left(k\,\operatorname{MM}(n,n^{k-1})+k n^k\right),
\qquad k\ge2.                                                \tag{4}
```

Another available bound is

```math
E_{n,k}\le
\operatorname{poly}(n,k)\binom{n+k-1}{k},                     \tag{5}
```

from the symmetric-power representation, or the
[mixed-space implementation](mixed_compound_action.md).
Use the smaller applicable bound in (1). Formula (1), with either
(4) or (5), is a uniform bound in n and k. The fixed-k estimates below
are consequences of that uniform construction.

For k=0 the answer is scalar and for k=1 ordinary characteristic
polynomial algorithms apply.

## 3. Updating the rectangular arithmetic bound

Amanov, van den Berg and Zuiddam's
[2026 exposition, Theorems 1.1--1.2](https://arxiv.org/html/2610.30054v1)
gives omega <= 9/4 over every field and, for 1/2 <= beta <= 1,

```math
\omega(1,1,\beta)
 \le 1+\beta+\frac1{4\beta}.                                 \tag{6}
```

It also gives, for a >= b >= c >= 0,

```math
\omega(a,b,c)\le
\begin{cases}
a+b,&c(a+b)\le ab,\\
(ab+bc+ca)^2/(4abc),&c(a+b)>ab.
\end{cases}                                                  \tag{7}
```

Exponents at endpoints mean that an arbitrarily small positive slack is
permitted in the arithmetic running time. These are the current
primary-source bounds used here; old numerical comparisons based on
omega approximately 2.37 are not current benchmarks.

For fixed k>=2, apply (7), using symmetry of the matrix-multiplication
tensor, with (a,b,c)=(k-1,1,1). Formula (4) becomes

```math
E_{n,k}=n^{\,k+1/(4(k-1))+o(1)}.
```

Since N=n^{k+o(1)} for fixed k, write

```math
E_{n,k}=N^{1+\varepsilon_k+o(1)},\qquad
\varepsilon_k=\frac1{4k(k-1)}.                              \tag{8}
```

## 4. Optimizing the block size

More generally, suppose E=N^(1+epsilon+o(1)), with epsilon>=0, and
choose b=N^(beta+o(1)). From (1) and (6), a feasible exponent is

```math
c(\varepsilon,\beta)=
\frac{1-\beta}{2}+
\max\left\{
2+\varepsilon,\;
1+\frac54\beta,\;
1+\beta+\frac1{4\beta}
\right\},
\quad \frac12\le\beta\le1.                                  \tag{9}
```

The third term is at least the second: their difference is
(1-beta^2)/(4 beta). Thus the polynomial-matrix part of the black-box
method does not dominate this optimization.

Set

```math
\beta_0=\frac1{\sqrt2},\qquad
\varepsilon_0=\frac3{2\sqrt2}-1,\qquad
c_0=\frac32+\frac1{\sqrt2}.
```

For 0<=epsilon<=epsilon_0, choose beta=beta_0. The two relevant costs
in (9) are bounded by the rectangular-product cost, and

```math
c(\varepsilon,\beta_0)=c_0
=2.207106781\ldots.                                         \tag{10}
```

For epsilon_0<epsilon<=1/4, let

```math
\beta_\varepsilon=
\frac{1+\varepsilon+\sqrt{\varepsilon^2+2\varepsilon}}2.
```

This is the solution in [beta_0,1] to
1+beta+1/(4 beta)=2+epsilon. It gives

```math
c(\varepsilon)=
2+\varepsilon+\frac{1-\beta_\varepsilon}{2}.                 \tag{11}
```

These choices minimize (9). To check the second regime, the branch on
which 2+epsilon dominates decreases with beta. On the other branch,
the derivative is 1/2-1/(4 beta^2), which is positive above beta_0.

For 0<epsilon<1/4, equation (11) is strictly less than 9/4.
Indeed beta_epsilon > 1/2+2 epsilon is equivalent to
sqrt(epsilon^2+2 epsilon)>3 epsilon, which holds exactly when
epsilon<1/4. The first regime already has c_0<9/4.

## 5. Consequences for compounds

For every fixed integer k>=3, (8) satisfies
epsilon_k<=1/24<epsilon_0. Consequently,

```math
\chi_{P_k(A)}
\quad\text{can be computed in}\quad
n^{\,k(3/2+1/\sqrt2)+o(1)}                                  \tag{12}
```

field operations by a Monte Carlo algorithm, for every input A.
The direct dense characteristic-polynomial method has the current
bound n^(9k/4+o(1)), after forming the compound. For example, the
exponent in (12) is approximately 6.621321 for k=3.

For k=2, the same calculation gives the exponent
2 c(1/8)=4.429805898... in n. The
[current Minc-list page](https://yair-lavi.com/mincs-list/problem-17/index.html)
already reports a stronger specialized k=2 method,
soft-O(n^(omega+2)). The present calculation does not improve that
specialized result.

There is also a growing-k consequence. Let k/n tend to rho in (0,1/2],
and put

```math
H(\rho)=-\rho\log_2\rho-(1-\rho)\log_2(1-\rho),\qquad
F(\rho)=(1+\rho)H\!\left(\frac{\rho}{1+\rho}\right).
```

Using (5),

```math
\log_2N=nH(\rho)+o(n),\qquad
\log_2E\le nF(\rho)+o(n).
```

Thus (9)--(11) improve the current dense exponent whenever

```math
F(\rho)<\frac54 H(\rho).                                    \tag{13}
```

This is an exact entropy inequality specifying the improvement range.
Its crossing in (0,1/2) is approximately rho=0.40488817.
The decimal is explanatory; condition (13), not a numerical root
claim, defines the theorem's range.

At rho=1/2, F(rho)/H(rho) is approximately 1.37744, so this
argument does not improve the current dense characteristic-polynomial
bound. Taking a minimum with the direct method gives a general
algorithm, but does not remove that gap.

## 6. Scope and prior-art boundary

This note does not prove the unresolved optimal black-box target of
O(N) vector products and soft-O(N^2) additional arithmetic. It uses the
larger, published invariant-factor bound (1), which correctly includes
multiplicity recovery.

The literature check included Villard's primary 2003 exposition,
Pernet's [2023 survey slides](https://rtca2023.github.io/pages_Paris/DocM4/Pernet.pdf),
the 2026 rectangular theorem, the current P17 statement, and searches in
both indexes for black-box characteristic polynomials, permanental
compounds, invariant-factor multiplicities, and the resulting 2.207
exponent. No matching published compound corollary was located. This
does not establish historical priority.

The substantive conclusion is an all-input arithmetic improvement in a
broad parameter range. It remains partial progress on the listed
problem, and it contributes zero to the count of fully resolved entries.

