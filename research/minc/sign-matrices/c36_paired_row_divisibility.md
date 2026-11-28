# Divisibility obstruction to the paired-row construction

Research checkpoint, 20 November 2026 (America/Chicago). This excludes a proposed construction for Kräuter's minimum-permanent conjecture in infinitely many orders. It does not disprove the conjecture, produce a new attaining order, or add a resolved entry to Minc's list.

## The proposed construction

For an $`m\times 2m`$ sign matrix $`V=(v_{ij})`$, define


```math
C(V)=[z_1^2\cdots z_m^2]
\prod_{j=1}^{2m}\left(\sum_{i=1}^m v_{ij}z_i\right).
\tag{1}
```


Let $`D(V)`$ be the square matrix obtained by repeating every row of $`V`$ twice. Assigning two columns to each row type gives


```math
\mathop{\mathrm{per}}D(V)=2^m C(V).
\tag{2}
```


The earlier odd-order lift appends a column with opposite signs in each row pair and then one arbitrary sign row:


```math
A=\begin{pmatrix}
v_1&1\\v_1&-1
\\ \vdots&\vdots
\\ v_m&1\\v_m&-1
\\ s&\varepsilon
\end{pmatrix},\qquad s\in\{-1,1\}^{2m},\quad\varepsilon\in\{-1,1\}.
\tag{3}
```


Its row-form product is


```math
\left(\prod_{i=1}^m((v_i\cdot x)^2-y^2)\right)
(s\cdot x+\varepsilon y).
```


Only the last summand can supply the single factor $`y`$ in the squarefree target monomial. Hence


```math
\mathop{\mathrm{per}}A=\varepsilon\mathop{\mathrm{per}}D(V)
=\varepsilon2^m C(V).
\tag{4}
```


At order $`2m+1`$, Kräuter's proposed minimum is


```math
2^{2m-\lfloor\log_2(m+1)\rfloor}.
```


Thus this construction would need


```math
C(V)=\pm2^{m-\lfloor\log_2(m+1)\rfloor}.
\tag{5}
```


The divisibility argument below proves that (5) is impossible for an infinite sequence of $`m`$.

## A coefficient divisibility bound

Write $`s_2(a)`$ for the number of ones in the binary expansion of a nonnegative integer $`a`$, with $`s_2(0)=0`$, and put


```math
E_m=\min_{0\le k\le2m}
\left(m+\left\lceil\frac{k}{2}\right\rceil-s_2(2m-k)\right).
\tag{6}
```


**Proposition.** For every $`m\times2m`$ sign matrix $`V`$,


```math
2^{E_m}\mid C(V),\qquad
2^{m+E_m}\mid\mathop{\mathrm{per}}D(V).
\tag{7}
```


This is a divisibility lower bound. It is not asserted to be sharp for every $`m`$.

### Proof

Set $`S=z_1+\cdots+z_m`$. Every column form in (1) is


```math
\sum_i v_{ij}z_i=S-2H_j(z),
\qquad H_j(z)=\sum_{i:v_{ij}=-1}z_i.
```


Expand the product by selecting the term $`-2H_j`$ from exactly $`k`$ columns. The contribution of such a selection is


```math
(-2)^k S^{2m-k}\prod_{j\in T}H_j,
\qquad |T|=k.
\tag{8}
```


Consider a monomial $`z^\alpha`$ of the last product that can contribute to $`z_1^2\cdots z_m^2`$. Its coefficient is an integer, every $`\alpha_i`$ belongs to $`\{0,1,2\}`$, and $`\sum_i\alpha_i=k`$. Let $`u`$ be the number of positive $`\alpha_i`$. In particular, $`u\ge\lceil k/2\rceil`$.

The coefficient contributed by the remaining power of $`S`$ is exactly


```math
[z^{2\mathbf1-\alpha}]S^{2m-k}
=\frac{(2m-k)!}{\prod_i(2-\alpha_i)!}
=\frac{(2m-k)!}{2^{m-u}}.
\tag{9}
```


Using the elementary factorial identity $`v_2(a!)=a-s_2(a)`$, the power of two dividing (8)--(9), before multiplication by its integer monomial coefficient, is


```math
k+(2m-k)-s_2(2m-k)-(m-u)
=m+u-s_2(2m-k)
\ge m+\left\lceil\frac{k}{2}\right\rceil-s_2(2m-k).
\tag{10}
```


Every contribution is consequently divisible by $`2^{E_m}`$. Summing them proves the first assertion of (7); (2) gives the second. This also covers zero coefficients and zero permanents.

## An infinite family where the lift cannot attain the minimum

Let


```math
m=2^r+1,\qquad r\ge3.
\tag{11}
```


Then


```math
E_m=m+1-r.
\tag{12}
```


To verify this exactly, split the minimum in (6) into even and odd values of $`k`$. For $`k=2q`$, set $`j=m-q`$. Its expression becomes


```math
2m-j-s_2(j),\qquad0\le j\le m.
```


For $`k=2q+1`$, set $`j=m-q-1`$. Its expression becomes


```math
2m-1-j-s_2(j),\qquad0\le j\le m-1.
```


Thus


```math
E_m=2m-
\max\left\{m+s_2(m),\;
1+\max_{0\le j\le m-1}(j+s_2(j))\right\}.
\tag{13}
```


For $`m=2^r+1`$, the first displayed term in the maximum is $`2^r+3`$. For $`0\le j<2^r`$, one has $`j+s_2(j)\le2^r-1+r`$, with equality at $`j=2^r-1`$. The remaining endpoint $`j=2^r`$ has value $`2^r+1`$, which is no larger when $`r\ge2`$. Hence the second term in (13) is $`2^r+r`$. It dominates the first for $`r\ge3`$, proving (12).

Since $`\lfloor\log_2(m+1)\rfloor=r`$, the required value in (5) has exponent $`m-r`$, one smaller than (12). Consequently every matrix of form (3) in order


```math
n=2m+1=2^{r+1}+3,\qquad r\ge3,
\tag{14}
```


has permanent divisible by twice Kräuter's proposed minimum. It cannot attain that minimum. The conclusion applies to every choice of $`V`$, $`s`$, and $`\varepsilon`$, not just a prescribed sequence of small examples. Row and column permutations, sign changes, and transposition preserve the conclusion.

The analogous repeated-row matrix $`D(V)`$ has order $`2^{r+1}+2`$. Its permanent is divisible by four times the proposed minimum in that order. This follows by comparing $`m+E_m=2m+1-r`$ with $`2m-\lfloor\log_2(2m+1)\rfloor=2m-r-1`$.

The odd-order statement is the obstruction relevant to the prior lift. The next theorem also excludes arbitrary fixed-width borders of paired cores, so changing the signs in the appended column does not repair the construction.

## Arbitrary borders of bounded width

The relevant additional divisibility bound concerns a sign matrix of order $`N`$ whose rows include $`(N-q)/2`$ identical pairs and $`q`$ other rows. Here $`0\le q\le N`$ and $`N-q`$ is even. Define


```math
F(N,q)=\min_{0\le k\le N}
\left[N+\max\left(0,\left\lceil\frac{k-q}{2}\right\rceil\right)
-s_2(N-k)\right].
\tag{17}
```


Such a matrix has permanent divisible by $`2^{F(N,q)}`$. To see this, use variables with target exponents two for the paired rows and one for the remaining rows. As in (8), choose $`k`$ negative-support forms. If their monomial hits $`u`$ of the paired-row variables, then


```math
u\ge\max\left(0,\left\lceil\frac{k-q}{2}\right\rceil\right).
```


Writing $`p=(N-q)/2`$, the row-labeling factor $`2^p`$ cancels the denominator $`2^{p-u}`$ from the remaining multinomial coefficient. The individual contribution is an integer multiple of


```math
2^{k+u}(N-k)!,
```


whose valuation is $`N+u-s_2(N-k)`$. This proves (17).

**Theorem.** Fix an integer $`d\ge0`$. Let


```math
r\ge d+1+\lfloor\log_2(2d+1)\rfloor,\qquad
N=2^{r+1}+2d,\qquad n=N+d=2^{r+1}+3d.
\tag{18}
```


Suppose an $`n\times n`$ sign matrix $`A`$ has an $`N\times N`$ submatrix whose rows can be partitioned into identical pairs. Then


```math
2^{n-r}\mid\mathop{\mathrm{per}}A.
\tag{19}
```


In particular, $`A`$ cannot attain Kräuter's value $`2^{n-r-1}`$. This holds for arbitrary entries in all $`d`$ added rows and $`d`$ added columns. It also holds when the core pairs are equal only up to sign, since row sign changes reduce that case to identical pairs.

### Proof

Permute the core to the first $`N`$ rows and columns. Write $`x`$ for its column variables and $`y_1,\ldots,y_d`$ for the added column variables. The two forms in core row pair $`i`$ are


```math
L_i(x)+Y_i(y),\qquad L_i(x)+Z_i(y),
```


where every displayed linear form has sign coefficients. Their product is


```math
L_i^2+L_i(Y_i+Z_i)+Y_iZ_i.
\tag{20}
```


The coefficients of $`Y_i+Z_i`$ are even. Modulo the ideal generated by $`y_1^2,\ldots,y_d^2`$, the coefficients of $`Y_iZ_i`$ are also even: the coefficient of $`y_a y_b`$, for $`a\ne b`$, is the sum of two signs. Therefore each pair supplying one or two of the border variables contributes a factor two. Terms with squared border variables never contribute to the permanent.

Consider a term in the expansion contributing to the squarefree product of all columns. Let $`a`$ pairs supply exactly one border variable and $`b`$ pairs supply two. Put $`h=a+b`$. These pairs supply $`a+2b`$ border variables, so exactly $`a+2b`$ of the $`d`$ bottom rows must instead supply core variables. The resulting core polynomial contains $`N`$ sign linear forms: $`N/2-h`$ identical pairs and


```math
a+(a+2b)=2h
```


single forms. Its contribution is consequently an integer multiple of


```math
2^h\,2^{F(N,2h)},\qquad0\le h\le\min(d,N/2).
\tag{21}
```


In fact, for every admissible $`h`$,


```math
h+F(N,2h)\ge F(N,0).
\tag{21a}
```


This follows termwise in the defining minimum from


```math
h+\max\left(0,\left\lceil\frac{k-2h}{2}\right\rceil\right)
=\max\left(h,\left\lceil\frac{k}{2}\right\rceil\right)
\ge\left\lceil\frac{k}{2}\right\rceil.
```


Thus there is a general inheritance statement: **for every even core order $`N`$, an arbitrary sign border of any width preserves the guaranteed divisor $`2^{F(N,0)}=2^{N/2+E_{N/2}}`$ of a paired-row core.** It is enough to use the pairs that remain after a core row normalization. This statement has no binary-order hypothesis.

For the values in (18),


```math
F(N,2h)=N+d-h-r\qquad(0\le h\le d).
\tag{22}
```


Indeed, if $`N-k\ge2^{r+1}`$, then


```math
s_2(N-k)\le1+\lfloor\log_2(2d+1)\rfloor,
```


so the expression in (17) is at least $`N+d-h-r`$ by the assumed lower bound on $`r`$. If $`N-k<2^{r+1}`$, then $`k\ge2d+1`$, and hence


```math
\max\left(0,\left\lceil\frac{k-2h}{2}\right\rceil\right)
\ge d-h+1,\qquad s_2(N-k)\le r+1.
```


These inequalities again give the same lower bound. Equality in (17) occurs at $`k=2d+1`$, where $`N-k=2^{r+1}-1`$. This proves (22).

Every term (21) is divisible by $`2^{N+d-r}=2^{n-r}`$. Summation proves (19). Finally, (18) ensures $`2^{r+1}\le n+1<2^{r+2}`$, so $`\lfloor\log_2(n+1)\rfloor=r+1`$, as used to identify Kräuter's target.

This excludes every fixed border width as an all-order repair of the paired-core method. It does not exclude border widths that grow with the order, or constructions with no such paired core.

## What remains possible

The one-row, one-column border of an order-$`n`$ matrix $`B`$ has the exact formula


```math
\mathop{\mathrm{per}}\begin{pmatrix}B&u\\v^T&a\end{pmatrix}
=a\mathop{\mathrm{per}}B+u^T C(B)v,
\qquad C(B)_{ij}=\mathop{\mathrm{per}}B(i\mid j).
\tag{15}
```


When $`n+1`$ is not a Mersenne order and $`B`$ attains Kräuter's value, that value doubles in order $`n+1`$. A zero border would therefore give an attaining border after flipping its corner. But it requires the actual equation


```math
u^TC(B)v=\pm\mathop{\mathrm{per}}B,
\qquad u,v\in\{-1,1\}^n.
\tag{16}
```


No universal solvability claim for (16) is made. Divisibility, a greatest-common-divisor condition on the cofactors, and knowledge of $`\mathop{\mathrm{per}}B`$ do not by themselves supply its sign vectors. A full construction still needs a separate transition at every Mersenne order as well as an invariant controlling the other borders. The bounded-border theorem proves that a core with paired rows cannot supply such an all-order invariant through any fixed number of added rows and columns.

The zero-border criterion is stronger than necessary. Normalize $`\mathop{\mathrm{per}}B=p>0`$, where $`p`$ is Kräuter's value in order $`n`$, and suppose $`n+1`$ is not a Mersenne order. An attaining border exists exactly when some sign vectors satisfy


```math
u^TC(B)v\in\{-3p,-p,p,3p\}.
\tag{16a}
```


Indeed, choosing the corner $`a\in\{-1,1\}`$ in (15) then gives $`\pm2p`$, and these are all possibilities. The classical divisibility theorem in order $`n+1`$ forces every value $`u^TC(B)v`$ to be an odd multiple of $`p`$: subtract $`ap`$ from the permanent of any sign border, which is divisible by $`2p`$. Thus the unproved discrepancy bound


```math
\min_{u,v\in\{-1,1\}^n}|u^TC(B)v|\le3p
\tag{16b}
```


would suffice. No proof of (16b) is supplied, and neither the cofactor identities nor their gcd information is treated as such a proof. The unrestricted border avenue stops at this missing bound.

## Source check and priority limit

The full C36 target is the one on [Lavi's live page](https://yair-lavi.com/mincs-list/conjecture-36/index.html). Its order-32 progress summary is not the latest finite certificate range: [the independent AC-11 submission](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/arithmetic-and-complexity/AC-11/README.md) reports exact certificates through 35 and explicitly leaves the universal question unresolved. No finite extension is attempted here.

The following primary material was inspected during this branch:

- I. M. Wanless, *Permanents of matrices of signed ones*, Linear and Multilinear Algebra 53 (2005), 427--433, [complete author PDF](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf). Section 3 gives finite attaining constructions and the classical divisibility lower bound. Its Section 4 gives the known zero-permanent construction; it does not establish zero borders of arbitrary attaining matrices.
- D. Ingram and A. Razborov, *On the range of the permanent of (±1)-matrices*, LAA 743 (2026), 271--285, [author preprint](https://arxiv.org/html/2507.09433v1) and [publisher record](https://www.sciencedirect.com/science/article/pii/S0024379526001928). The introduction retains minimum attainment as open. Its range-cardinality theorem does not give the required least lattice value.
- M. V. Budrevich, A. E. Guterman and K. A. Taranin, [*On the Divisibility of Permanents for (±1)-Matrices*](https://doi.org/10.1007/s10958-016-2937-4), J. Math. Sci. 216 (2016), 738--745, and [*On the Kräuter--Seifter Theorem on Permanent Divisibility*](https://doi.org/10.1007/s10958-018-3905-y), J. Math. Sci. 232 (2018), 760--767. Publisher abstracts and metadata were inspected. They concern the classical unrestricted bound and its sharpness in valuation. Their full texts were not obtained: the Math-Net full-text links returned article pages in this run.

Both search engines were queried for repeated-row divisibility, paired-row permanents, coefficient multiplicities, and the exact names of the general divisibility papers. No earlier statement of the displayed paired-core bounds was found in the inspected material. This is not a proof of historical novelty, particularly because the older divisibility papers were not read in full. The argument is recorded as a self-contained obstruction to this investigation's construction, with no priority claim.

The companion `c36_paired_row_divisibility.py` checks the factorial valuation bookkeeping, the even/odd reformulation, the claimed binary subfamily, and the lift identities with exact integers. Those checks support the derivation; the proof above supplies the infinite quantifier.

The [independent review](c36_border_review.md) checks the squarefree border parity, the inheritance inequality, and the extension from fixed widths to uniformly bounded varying widths.
