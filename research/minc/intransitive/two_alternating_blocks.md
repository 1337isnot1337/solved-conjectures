# Permanent dominance for degree-one characters

For every $k\ge5$ and every group $A_k\times A_k\subseteq H\subseteq S_k\wr S_2$ on two $k$-element blocks, the [Marcus–Minc inequality](https://yair-lavi.com/mincs-list/problem-2/) holds on every complex Hermitian positive semidefinite matrix of order $2k$. This includes subgroups with coupled internal parities and a block interchange. It also holds for every normalized character of $H$ factoring through $H/(A_k\times A_k)$.

## The first block-exchange coefficient

Write the matrix as $A=\left(\begin{smallmatrix}B&C\\C^*&D\end{smallmatrix}\right)$ with all blocks $k$-square, $k\ge2$. For $X=B,D$ let $Q(X)_{ij}=\operatorname{per}X[\widehat j\mid\widehat i]$ be the permanental adjoint. We use

```math
Q(X)\succeq0,\qquad \det Q(X)\ge(\det X)^{k-1}.                 \tag{1}
```

Indeed take a Cholesky factor $X=R^* R$ with $R$ upper triangular. For each $(k-1)$-subset $I$, let $F_I$ be the symmetrized tensor product of columns of $R$ indexed by $I$, multiplied by $\sqrt{(k-1)!}$. These vectors have Gram matrix $Q(X)^{\mathsf T}$ in deletion order. Project onto the span of the similarly normalized squarefree coordinate tensors, an orthonormal family indexed by $(k-1)$-subsets $J$. The coordinate matrix of the projections has entries $\operatorname{per} R[J\mid I]$. In lexicographic subset order this is upper triangular. A nonzero assignment requires each row coordinate to be at most its matched column coordinate, hence the sorted rows are coordinatewise at most the sorted columns. The diagonal entries are products of the corresponding $R_{ii}$. By Cauchy–Binet, the determinant of the full Gram is at least the squared modulus of the determinant of this square coordinate matrix. Each index appears $k-1$ times in the diagonal products, proving (1). The deletion order may differ by a simultaneous permutation which preserves the determinant. Singular inputs follow by continuity. The identification of the adjoint as a principal submatrix of an induced symmetric power is classical. [Marcus and Merris](https://doi.org/10.1017/S1446788700013173)

Consider the permanent after multiplying $C$ and $C^*$ by the same real scalar $t$. It has the form $\sum_{j=0}^k c_j t^{2j}$, with $c_j\ge0$ by [Lieb's block theorem](https://www.jstor.org/stable/24901474). The extreme coefficients are $c_0=(\operatorname{per}B)(\operatorname{per}D)$ and $c_k=|\operatorname{per}C|^2$. Counting one cross assignment in each direction gives

```math
c_1=\operatorname{tr}(Q(B)C Q(D) C^*)
\ge k\big(\det Q(B)\det Q(D)|\det C|^2\big)^{1/k}
\ge k|\det C|^2.                                               \tag{2}
```

For the identity, a row $i$ in the first packet goes to a column $l$ in the second; a row $j$ in the second goes to column $h$ in the first. The associated summand is $Q(B)_{hi}C_{il}Q(D)_{lj}\overline{C_{hj}}$. For the first inequality, cyclicity expresses the trace as the sum of eigenvalues of the PSD matrix $Q(B)^{1/2}C Q(D)C^* Q(B)^{1/2}$. Apply their arithmetic-geometric mean inequality. For the second, in addition to (1) use $|\det C|^2\le\det B\det D$, the Cauchy–Schwarz inequality on the two exterior products of Gram vectors. Consequently

```math
\operatorname{per}A\ge(\operatorname{per}B)(\operatorname{per}D)
                    +|\operatorname{per}C|^2+k|\det C|^2.       \tag{3}
```

The indices $0,1,k$ are distinct when $k\ge2$. The factor in (2) is attained when all three blocks $B,C,D$ equal $I_k$.

## Parity sums

For a square matrix $X$, put $E(X)=(\operatorname{per}X+\det X)/2$ and $O(X)=(\operatorname{per}X-\det X)/2$. They sum the monomials over the even and odd permutations, respectively. For $X=B,D$ both are nonnegative by Schur's permanent-determinant inequality. Write $E=E(C)$ and $O=O(C)$.

A linear character of $H$ is trivial on $A_k\times A_k$, since this subgroup is perfect. It is therefore constant on each of its cosets. Their weights for elements fixing the blocks are the products of a choice of $E(B),O(B)$ with a choice of $E(D),O(D)$. The sum of the absolute weights of all those cosets in the whole wreath product is $(\operatorname{per}B)(\operatorname{per}D)$. For the cosets interchanging the two blocks, the weights have the form $u\overline v$ where $u,v\in\{E,O\}$, one for each parity choice. The sum of their absolute weights is

```math
(|E|+|O|)^2\le2(|E|^2+|O|^2)=|\operatorname{per}C|^2+|\det C|^2 .
```

Restricting either collection of cosets to $H$ only decreases these upper bounds. A normalized character factoring through the quotient has absolute value at most one on each coset. Inequality (3) bounds their total weighted sum by $\operatorname{per}A$, proving the result. The same argument gives a gap of at least $(k-1)|\det C|^2$.

[Lieb](https://www.jstor.org/stable/24901474), [Marcus–Merris](https://doi.org/10.1017/S1446788700013173), the [2024 block-matrix paper](https://www.sciencedirect.com/science/article/pii/S0024379524002416), [Tubbenhauer's two-packet bounds](https://arxiv.org/abs/2611.22058) and the [catalogue's wreath-product results](https://yair-lavi.com/mincs-list/problem-2/) concern related inequalities. We found no explicit statement of this intermediate subgroup theorem; priority is unverified. This is partial progress on P2. [Exact Gaussian-integer checks, including equality in (2)](two_blocks_check.py)
