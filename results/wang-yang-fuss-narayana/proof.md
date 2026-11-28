# Total positivity of the Fuss–Narayana matrices

Yi Wang and Arthur L. B. Yang's Conjecture 4.1 concerns four triangular matrices and two square matrices. Here TN means that every finite minor is nonnegative, and STP means that every finite minor is strictly positive. The authors use TP for TN. Fix an integer $m\ge2$ and put

```math
B(n,k)=\binom nk\binom{mn}{n-k},\qquad
A(n,k)=\frac{1}{n+1}\binom{n+1}{k}\binom{m(n+1)}{n-k}.
```

The triangular entries are zero when $k>n$. The theorem asserts TN for $A(n,k),B(n,k)$ and their row reversals, and STP for $A(n+k,k),B(n+k,k)$. The journal and preprint have the same six arrays. The ordinary Narayana case $m=1$ was proved in the source. [Published paper, §4](https://cfc.nankai.edu.cn/_upload/article/files/ca/07/264e89bc4d9bb418a6d91d482b90/ef62459f-bec2-470d-8199-b57a790de20a.pdf)

## A determinant for rational products

Take real numbers $t_h$ and affine functions $D_h$, including positive constants. Form $F_0=1$ and

```math
F_j(x)=\prod_{h=1}^{j}\frac{x-t_h}{D_h(x)}.
```

Choose $d+1$ increasing arguments $x_0,\ldots,x_d$ at which the denominators are positive. For columns $0,\ldots,d$ the determinant is

```math
\det[F_j(x_i)]_{i,j=0}^d=
\frac{\displaystyle\prod_{i\lt j}(x_j-x_i)
            \prod_{1\le i\le j\le d}D_j(t_i)}
     {\displaystyle\prod_{i=0}^{d}\prod_{h=1}^{d}D_h(x_i)}. \tag{1}
```

To see this, clear the denominators in each row. Column $j$ is then a polynomial $Q_j$ of degree at most $d$, with its first $j$ factors $x-t_h$ and its remaining factors $D_h(x)$. Its evaluation determinant is a constant times the Vandermonde by the monomial-basis factorization. Set $x_0=t_1$. Only column zero contributes in the first row, with entry $\prod_h D_h(t_1)$. In the other columns remove $x_i-t_1$ from each remaining row. The reduced determinant uses the list starting at $h=2$. Induction gives the asserted constant as a polynomial identity, also for coincident $t_i$. This is the rationally normalized form of the classical product determinant. [Krattenthaler, *Advanced determinant calculus*, Lemma 3](https://arxiv.org/abs/math/9902004)

For columns $b,\ldots,b+d$, factor $F_b(x_i)$ out of row $i$ and apply (1) to the factors numbered $b+1,\ldots,b+d$.

**Column criterion.** Suppose a finite matrix has positive determinants for every choice of equally many rows and *consecutive* columns. Then all minors are positive. To verify this, fix an ordered selection of $p$ rows, divide every column by its positive top entry, and form the $(p-1)$-row matrix of adjacent column differences below the top row. Each of its minors on consecutive columns and arbitrary rows is a consecutive-column determinant of the normalized matrix with the top row included. Indeed, subtract each preceding column from the next, proceeding from right to left, and expand along the top row. Induction on $p$ now gives positivity for arbitrary columns of the difference matrix. In the original selected rows, the determinant for columns $j_1<\cdots<j_p$ is the determinant of column differences between successive selected indices. Each difference sums the adjacent differences on an interval. Multilinearity gives a sum of positive minors, since these intervals are nonempty, disjoint and ordered. Restoring the positive top entries proves the criterion.

## The two squares

For $s=0,1$ write

```math
S_s(n,k)=\binom{n+k}{n}\binom{m(n+k+s)}{n}.
```

Then $B(n+k,k)=S_0(n,k)$ and $A(n+k,k)=S_1(n,k)/(n+1)$. Divide row $n$ by its positive value $S_s(n,0)$. Advancing the column index from $k$ to $k+1$ multiplies the entry, with row argument $x=n$, by

```math
\frac{x+k+1}{k+1}
\prod_{h=1}^m
\frac{x+u_{k,h}}{(1-1/m)x+u_{k,h}},
\qquad u_{k,h}=k+s+\frac hm. \tag{2}
```

This follows by cancelling factorials in the two binomial coefficients. Insert a column after **each** linear fraction of (2). Use the $m$ fractions in order of increasing $h$, followed by the fraction with constant denominator $k+1$. The original normalized square is the submatrix at the ends of the groups, together with column zero.

Every intermediate value is positive at $x\ge0$. If $D_j$ is a nonconstant denominator with parameter $u_{k,h}$, every numerator zero up to and including that step is $-v$ for $0<v\le u_{k,h}$. Indeed the earlier nonconstant fractions have smaller parameters, and the polynomial fraction in any preceding group $k'<k$ has $v=k'+1\le k$. Thus

```math
D_j(-v)=u_{k,h}-(1-1/m)v\ \ge\ u_{k,h}/m>0.
```

Constant denominators are positive at every argument. Formula (1), applied after any starting column, gives positive determinants on arbitrary increasing rows and consecutive intermediate columns. The column criterion gives STP of every finite section of the expanded matrix. Taking its indicated columns and restoring positive scalings proves STP for both squares.

## The ordinary triangles

We use the following triangular version of the minor test. Let $L$ be finite lower triangular with positive determinants on columns $0,\ldots,j$ and any $j+1$ consecutive rows. Then $L$ is TN. To prove it, divide each row by its positive first entry and subtract each preceding row from the next, from bottom to top. The result is the diagonal sum of the scalar $1$ and a lower triangular matrix $M$. The initial-column consecutive-row determinants of $M$ are those of the normalized $L$ with the row just above the interval and column zero included. This follows by the same adjacent differences and expansion along column zero. They are positive. By induction $M$ is TN. Undoing the differences multiplies on the left by the lower triangular matrix having ones on and below the diagonal. This matrix is TN, since it is the product, in decreasing row index $i$, of the elementary adjacent-row additions $I+E_{i,i-1}$. Cauchy–Binet and positive row scaling finish the proof.

In particular, if $a_0<\cdots<a_{N}$ and the factors of §1 have $t_h=a_{h-1}$, the matrix $[F_j(a_i)]_{0\le i,j\le N}$ is lower triangular. If the denominators are positive on all the nodes, (1) gives all its required positive flag minors. It is therefore TN. Lists of nondecreasing nodes are also allowed by taking strictly increasing approximations. On any fixed finite prefix with denominators nonzero, entries and their determinants converge.

Again let $s=0$ denote type B and $s=1$ denote type A. Divide row $n$ by its first entry and multiply column $k$ by $k!$. In both cases the normalized entry is

```math
P_{2k}(n)=
\prod_{j=0}^{k-1}
\frac{(n-j+s)(n-j)}{(m-1)n+ms+j+1}. \tag{3}
```

For type B this follows by dividing by $\binom{mn}{n}$. For type A the binomial coefficient in the divisor is $\binom{m(n+1)}{n}/(n+1)$. The product also gives zero at $k>n$.

For (3), list the knots in pairs $a_{2j}=j-s$ and $a_{2j+1}=j$. Use denominator $1$ on the first factor of each pair and $(m-1)x+ms+j+1$ on the second. The entire knot list is nondecreasing, and all the denominators are positive for $x\ge-s$. For example the smallest value of a nonconstant denominator on that half-line is $s+1$. On a finite prefix replace $a_i$ by $a_i+\varepsilon i$, both at its occurrence as a numerator zero and at its occurrence as an evaluation node. The preceding triangular test applies for every $\varepsilon>0$. In the limit, take columns $2k$ and the rows at the nodes $n$, namely indices $2n$ for $s=0$ and $2n+1$ for $s=1$. This gives (3) and proves TN for both ordinary triangles.

## The reversed triangles

Write $x_{\underline j}=x(x-1)\cdots(x-j+1)$ and $x_{\underline0}=1$. Directly from the source entries,

```math
 B(n,n-k)=\binom nk\binom{mn}{k},\qquad
 A(n,n-k)=\frac1{k+1}\binom nk\binom{m(n+1)}{k}.
```

Up to positive column factors, the common form of these entries is the evaluation at $x=n$ of

```math
Q_{2k}(x)=\prod_{j=0}^{k-1}(x-j)(x-j/m+s),\qquad s=0,1. \tag{4}
```

For the initial products $Q_i$ including the intermediate odd columns, write $Q_i(x)=\sum_j C_{ij}x_{\underline j}$. We apply Galvin and Pacurar's Theorem 1.2 on change of Newton bases. For the target knots $0,1,2,\ldots$, its sufficient condition on a sequence of source knots is the following. Start with cap zero. Each source knot must be at most the current cap. Equality increases the cap by one and strict inequality leaves it in place. Under this condition the whole coefficient matrix $C$ is TN. The theorem allows arbitrary real source knots. [Galvin–Pacurar, Theorem 1.2](https://arxiv.org/abs/1807.08658)

In (4) the source pair at stage $j$ is $j,\ j/m-s$. The cap at the start of the pair is $j$. The first knot advances it to $j+1$ and the second is strictly below that value. Thus $C$ is TN. The evaluation matrix $H_{nj}=n_{\underline j}$ is TN by the triangular test with distinct knots $0,1,2,\ldots$ and constant denominators $1$. The matrix of all evaluations $Q_i(n)$ is $HC^{\mathsf T}$. For any finite minor the product can be truncated at the largest polynomial degree involved, and Cauchy–Binet gives nonnegativity. Taking the even-indexed columns and restoring the column factors proves TN for both reversed triangles.

Together the three arguments give all six conclusions of Conjecture 4.1 at every prescribed integer $m$.
