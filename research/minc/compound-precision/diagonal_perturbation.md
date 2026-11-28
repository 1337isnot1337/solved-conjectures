# Perron root of permanental compounds

Suppose a rational input matrix has a supplied decomposition $A=DP+UV^T$ with $D$ diagonal, $P$ a permutation matrix and $U,V$ of size $n\times r$. The full matrix can have rank $n$. At every degree $k$, an exact multiplication of $P_k(A)$ by an arbitrary vector takes $N(n+1)^{O(r+1)}$ rational operations, where $N=\binom nk$. The bound holds on both sides of the middle degree and allows a zero diagonal or singular input. When $A$ is entrywise nonnegative, the Perron root has a deterministic exact polynomial representation computable in $N^2(n+1)^{O(r+1)}$ operations. The factors in the decomposition may have either sign.

## A product of two-dimensional maps

A column permutation permutes the compound's columns, so it suffices to treat $A=D+UV^T$. Introduce formal variables $x_1,\ldots,x_r,y_1,\ldots,y_r$ and the rational linear functional $L(x^\alpha y^\beta)=\mathbf1_{\alpha=\beta}\alpha!$, where the factorial is the product of the individual factorials. Write $s_i=\sum_j U_{ij}x_j$ and $t_i=\sum_j V_{ij}y_j$. Define
```math
 T_i=\begin{pmatrix}1&t_i\\s_i&d_i+s_it_i\end{pmatrix}.
```
Index the tensor product of these two-state spaces by subsets of $[n]$. Its weight-$`k`$ principal block satisfies
```math
 P_k(A)=L\left[\left(\bigotimes_{i=1}^n T_i\right)_{|I|=|J|=k}\right].             \tag{1}
```
For row subset $I$ and column subset $J$, the factors on $I\cap J$ either contribute a diagonal $d_i$ or the product $s_it_i$. On the remaining positions the product uses one $s_i$ per remaining row and one $t_j$ per remaining column. Applying $L$ pairs the linear forms over all bijections, giving exactly the corresponding subpermanent of $UV^T$. Summing over the positions assigned to the diagonal proves (1). Ivanov gives the Gaussian contraction for a single permanent of identity plus finite rank and for higher local bosonic states. We use it on an arbitrary input vector at every occupation subset simultaneously. [Ivanov, 2024](https://scipost.org/SciPostPhysCore.7.2.022/pdf)

Every resulting entry has degree at most $k$ in each of the $2r$ individual variables. Tensor-product interpolation on $`\{0,\ldots,k\}^{2r}`$ expresses $L$ as an explicit weighted sum of $(k+1)^{2r}$ rational evaluations. For example the weight of a grid point is $L$ of its tensor-product cardinal Lagrange polynomial and factors over coordinate pairs. All the weights cost $(n+1)^{O(r+1)}$ operations to produce.

## Keeping the smaller weight layers

At each point apply the tensor product to an input supported at weight $k$ and keep only the weight-$`k`$ output. When $k\le n/2$ use
```math
 T_i=\begin{pmatrix}1&0\\s_i&1\end{pmatrix}
     \begin{pmatrix}1&0\\0&d_i\end{pmatrix}
     \begin{pmatrix}1&t_i\\0&1\end{pmatrix}.
```
The rightmost layer only removes occupied coordinates, the leftmost only adds them. No intermediate weight greater than $k$ is needed. Each full layer takes at most $O(n\sum_{j=0}^k\binom nj)$ operations by individual two-state updates on subset arrays.

For $k>n/2$ use holes. Interchange the two local coordinates at every site. The top-left entry becomes $p_i=d_i+s_it_i$. For any local matrix with entries $(p,q;u,v)$ and $p\ne0$, the same lowering-then-raising factorization has diagonal $(p,v-uq/p)$ and respective shear entries $q/p,u/p$. The input and output hole weight is $n-k$. To treat zero pivots uniformly, replace every $d_i$ by $d_i+h$ in (1). For each grid point at most $n$ rational shifts are forbidden. Choose $k+1$ allowed shifts among $0,\ldots,n+k$, compute the weight block action at those shifts, and interpolate at $h=0$. Its degree in $h$ is at most $k$ by (1) before applying $L$, directly from the intersection factors. No divisions by an unknown pivot occur. This includes $r=0$ and both endpoint degrees.

In either direction at most $(n+1)N$ subsets are kept. The extra shift interpolation and the accumulation of output vectors cost a polynomial factor in $n$. This proves the stated action bound over the rationals.

## The exact Perron root

For any nonnegative matrix $B$ of order $N$, put $s_j=\mathbf1^T B^j\mathbf1$. The generating series is $\mathbf1^T(I-zB)^{-1}\mathbf1$. It has numerator degree at most $N-1$ and denominator degree at most $N$, with denominator constant term one. Its reduced rational function is uniquely determined by $s_0,\ldots,s_{2N-1}$, since a difference has cross-multiplied numerator degree at most $2N-1$. Compute it by a Padé or extended-Euclidean algorithm in at most $O(N^2)$ rational operations, retaining a possible polynomial part.

If the reduced denominator is constant, $s_j=0$ eventually and $B$ is nilpotent since all entries are nonnegative. Return zero. Otherwise the reciprocal of its *smallest positive real zero* specifies the exact Perron root. To see this, $s_j$ is between $`\|B^j\|_1`$ and $`N\|B^j\|_1`$ in the induced column-sum norm, so the series has radius $1/\rho(B)$. A positive pole there also follows directly from a nonnegative nonzero Perron eigenvector $x$ scaled to have maximum entry one. Since $0\le x\le\mathbf1$, $s_j\ge\rho(B)^j\mathbf1^Tx$. The series diverges at the positive radius, while its denominator has no zero of smaller modulus after cancellation. Reducibility and periodicity cause no difficulty. The root specification is unambiguous without requiring rational eigenvalues or forming an isolating interval.

Apply this to $B=P_k(A)$, computing the $2N$ moments by repeated actions from (1). This gives the claimed arithmetic bound. For a signed input, the action bound still applies to the characteristic-polynomial algorithms discussed in the [compound black-box analysis](../nov20-independent/compound/blackbox_compound_bound.md). The Perron argument specifically uses nonnegative $A$ (or, more generally, nonnegative $B$).

[Minc Problem 18](https://yair-lavi.com/mincs-list/problem-18/index.html) concerns every nonnegative matrix. The restricted exact algorithm and its rational arithmetic cost do not extend this complexity bound to arbitrary input rank perturbations. The [earlier all-input FPRAS](../compound_fpras.md) addresses relative approximation.


The [rational replay](verify_diagonal_perturbation.py) compares 19 full-vector multiplications to independent direct subpermanent computations. The cases include 338 interpolation grids requiring a nonzero shift at the hole-layer step. It also checks positive-pole visibility on periodic, nondiagonalizable and nilpotent nonnegative inputs.
