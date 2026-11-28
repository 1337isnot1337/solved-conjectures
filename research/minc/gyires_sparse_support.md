# Gyires's inequality for two-sparse doubly stochastic matrices

## Status

**Complete all-order partial result for Minc Conjecture 20; not a resolution of its unrestricted statement.** Every doubly stochastic matrix with at most two positive entries in each row satisfies the stronger separate Gram-permanent inequalities below. The proof applies to direct sums of cycle mixtures with different weights in each component. No Lean work was done.

The [specialist problem page](https://yair-lavi.com/mincs-list/conjecture-20/index.html) still lists the general conjecture as open and credits an existing result for global convex combinations of two permutation matrices. That known case is not claimed as new. The new class and exact proof require external priority review.

## Theorem

Let $`n\ge1`$, $`\beta_n=n!/n^n`$, and let $`A`$ be an $`n\times n`$ doubly stochastic matrix with at most two positive entries per row. Then

~~~math
\beta_n\mathop{\mathrm{per}}(AA^{\mathsf T})\le(\mathop{\mathrm{per}}A)^2,\qquad
\beta_n\mathop{\mathrm{per}}(A^{\mathsf T}A)\le(\mathop{\mathrm{per}}A)^2. \tag{1}
~~~

In particular,

~~~math
\beta_n\left[\mathop{\mathrm{per}}(AA^{\mathsf T})+
\mathop{\mathrm{per}}(A^{\mathsf T}A)+2\mathop{\mathrm{per}}(A^2)\right]
\le 4(\mathop{\mathrm{per}}A)^2. \tag{2}
~~~

The last inequality is strict for $`n\ge3`$; for $`n=2`$, equality holds only when $`A=J_2`$. The unique order-one matrix gives equality.

## 1. Structure of the support

Interpret positive entries as edges in a bipartite graph, with rows and columns as vertex classes. Each connected component has the same number $`m`$ of rows and columns: summing its incident row and column masses yields $`m`$ in both cases. A degree-one vertex is connected by an edge of weight one, so its other endpoint is also degree one. Such a component is a singleton $`[1]`$.

In any other component all degrees are at least two. There are exactly $`2m`$ edges, because each of its $`m`$ rows has degree two. Hence every column also has degree two, and the connected component is a single even cycle. Row and column sums force the weights to alternate between two values $`p,q\ge0`$ with $`p+q=1`$. Independently permuting rows and columns puts the block in the form

~~~math
C_m(p)=pI_m+qP_m,\quad q=1-p,
~~~

where $`P_m`$ is an $`m`$-cycle permutation matrix, $`m\ge2`$. The Gram permanents and $`\mathop{\mathrm{per}}A`$ are preserved by independent row and column permutations. **The permanent of $`A^2`$ need not be preserved**, so we only use this reduction for the two Gram inequalities.

## 2. Cycle Gram permanent

Fix $`m\ge3`$ and set $`a=p^2+q^2`$, $`b=pq`$. The support of $`C=C_m(p)`$ has exactly two perfect matchings, giving

~~~math
P=\mathop{\mathrm{per}}C=p^m+q^m,\qquad
CC^{\mathsf T}=C^{\mathsf T}C=aI_m+b(P_m+P_m^{\mathsf T}).
~~~

A permutation in the support of the Gram matrix is either a union of disjoint adjacent transpositions and fixed points, or one of the two complete directed cycles. There are

~~~math
N(m,j)=\frac{m}{m-j}\binom{m-j}{j}
~~~

ways to select $`j`$ pairwise nonincident edges of the undirected $`m`$-cycle. Consequently,

~~~math
\mathop{\mathrm{per}}(CC^{\mathsf T})
=\sum_{j=0}^{\lfloor m/2\rfloor}N(m,j)a^{m-2j}b^{2j}+2b^m. \tag{3}
~~~

Let

~~~math
S_m=\sum_{j=0}^{\lfloor m/2\rfloor}N(m,j)2^{m-2j}.
~~~

By the monomer-dimer transfer matrix $`\begin{pmatrix}2&1\\1&0\end{pmatrix}`$, the sequence obeys

~~~math
S_1=2,\quad S_2=6,\quad S_m=2S_{m-1}+S_{m-2}\quad(m\ge3). \tag{4}
~~~

Three elementary inequalities valid for $`m\ge2`$ are

~~~math
b\le a/2,\quad
a^m\le2^{m-2}(p^m+q^m)^2,\quad
4b^m\le(p^m+q^m)^2. \tag{5}
~~~

The first and third are AM-GM; the second is the two-point power-mean inequality, with equality at $`p=q`$. Insert (5) into (3):

~~~math
\begin{aligned}
\mathop{\mathrm{per}}(CC^{\mathsf T})
&\le a^m\sum_j\frac{N(m,j)}{4^j}+2b^m
\\ &\le \frac{S_m+2}{4}P^2.
\end{aligned} \tag{6}
~~~

It remains to show $`\beta_m(S_m+2)<4`$ for every $`m\ge3`$. For $`m=3,4,5,6`$, the exact values are respectively

~~~math
\beta_m(S_m+2)=\frac{32}{9},\ \frac{27}{8},\ \frac{2016}{625},\ \frac{250}{81},
~~~

all below four. For $`m\ge6`$, recurrence (4) and positivity imply $`S_{m-1}<S_m/2`$, whence

~~~math
\frac{S_{m+1}+2}{S_m+2}<\frac52.
~~~

At the same time,

~~~math
\frac{\beta_m}{\beta_{m+1}}=(1+1/m)^m
\ge2+\frac{m-1}{2m}+\frac{(m-1)(m-2)}{6m^2}
\ge2+\frac5{12}+\frac5{54}>\frac52.
~~~

Thus $`\beta_m(S_m+2)`$ strictly decreases for $`m\ge6`$, proving the bound in all orders. Equation (6) now gives

~~~math
\beta_m\mathop{\mathrm{per}}(CC^{\mathsf T})<(\mathop{\mathrm{per}}C)^2\qquad(m\ge3). \tag{7}
~~~

The $`m=2`$ Gram matrix has overlapping cyclic diagonals and must be considered separately:

~~~math
\mathop{\mathrm{per}}C=a,\qquad
\mathop{\mathrm{per}}(CC^{\mathsf T})=a^2+4b^2.
~~~

Since $`2b\le a`$ and $`\beta_2=1/2`$, its Gram inequality follows, with equality only at $`p=q=1/2`$. A singleton $`[1]`$ has equality. Every cycle matrix is normal, so the corresponding $`C^{\mathsf T}C`$ bounds hold as well.

## 3. Combining components

For positive integers $`r,s`$,

~~~math
\frac{\beta_{r+s}}{\beta_r\beta_s}
=\binom{r+s}{r}\left(\frac r{r+s}\right)^r
\left(\frac s{r+s}\right)^s<1. \tag{8}
~~~

The expression is one proper atom in the nondegenerate binomial distribution. Hence $`\beta_n\le\prod_i\beta_{m_i}`$, strictly when there is more than one component.

Let $`C_i`$ be the cycle and singleton blocks of $`A`$ after independent row and column permutations. Permanent multiplicativity, (7), its order-two and order-one analogues, and (8) give

~~~math
\begin{aligned}
\beta_n\mathop{\mathrm{per}}(AA^{\mathsf T})
&\le\prod_i\left[\beta_{m_i}\mathop{\mathrm{per}}(C_iC_i^{\mathsf T})\right]
\\ &\le\prod_i(\mathop{\mathrm{per}}C_i)^2=(\mathop{\mathrm{per}}A)^2.
\end{aligned}
~~~

The same proof applies to $`A^{\mathsf T}A`$. This proves (1). It also proves strictness of both bounds in orders $`n\ge3`$.

## 4. Gyires follows from Gram bounds

For any real $`n\times n`$ matrix $`A`$, let $`r_i,c_i`$ be its row and column vectors. In the symmetric $`n`$-fold tensor power, put

~~~math
u=\mathop{\mathrm{Sym}}(r_1\otimes\cdots\otimes r_n),\qquad
v=\mathop{\mathrm{Sym}}(c_1\otimes\cdots\otimes c_n).
~~~

Direct expansion of the symmetrizer gives

~~~math
n!\langle u,u\rangle=\mathop{\mathrm{per}}(AA^{\mathsf T}),\quad
n!\langle v,v\rangle=\mathop{\mathrm{per}}(A^{\mathsf T}A),\quad
n!\langle u,v\rangle=\mathop{\mathrm{per}}(A^2).
~~~

Cauchy--Schwarz followed by $`2xy\le x^2+y^2`$ yields the universal inequality

~~~math
2\mathop{\mathrm{per}}(A^2)\le
\mathop{\mathrm{per}}(AA^{\mathsf T})+\mathop{\mathrm{per}}(A^{\mathsf T}A). \tag{9}
~~~

Writing $`X=\mathop{\mathrm{per}}(AA^{\mathsf T})`$, $`Y=\mathop{\mathrm{per}}(A^{\mathsf T}A)`$, and $`Z=\mathop{\mathrm{per}}(A^2)`$, use (9) and (1):

~~~math
\beta_n(X+Y+2Z)\le2\beta_n(X+Y)\le4(\mathop{\mathrm{per}}A)^2.
~~~

For $`n\ge3`$, (1) is already strict. For $`n=2`$, equality requires $`A=J_2`$ and holds there. This completes the proof.

## Exact verification and prior art

[The standard-library exact checker](verify_gyires_sparse_support.py) independently evaluates cyclic permanents and Gram permanents, checks the symbolic cycle formula for $`m\le9`$ at rational $`p`$, tests the normalization recurrence through $`m=200`$, and checks mixed-weight direct sums with independent row/column permutations. All 288 tests passed locally. The all-order proof is the algebra above, **not** the finite checks.

Primary target: B. Gyires, *On permanent inequalities*, Combinatorics (Keszthely 1976), Colloq. Math. Soc. János Bolyai 18 (1978), 471–484, as reported in [Yair Lavi's Minc Conjecture 20 entry](https://yair-lavi.com/mincs-list/conjecture-20/index.html). Historical survey: G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, LAA 403 (2005), 314–342. The known global two-permutation-mixture theorem is credited. Searches for existing two-sparse Gram bounds found no matching all-order result in inspected sources; search incompleteness prevents a priority claim. **This does not count as a full solution of C20.**
