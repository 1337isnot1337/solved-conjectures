# Second adjacency eigenvalues of a graph and its complement

For a simple graph $`G`$ on $`n\ge2`$ vertices, let $`\lambda_2(G)`$ denote its second-largest adjacency eigenvalue, counted with multiplicity. Then

```math
\lambda_2(G)+\lambda_2(\overline G)
 \le -1+\sqrt{n^2/2-n+1}.
```

Equality holds precisely when $`4\mid n`$ and $`G`$ is obtained from the four-vertex path by replacing each endpoint with a clique and each inner vertex with an independent set, all four sets having size $`n/4`$. Consecutive sets are joined completely. This is Conjecture 17 of Abreu, Brondani, de Lima and Oliveira. Their Proposition 16 identifies the attaining family. [Primary paper, pp. 132–133](https://doiserbia.nb.rs/img/doi/1452-8630/2017/1452-86301701123A.pdf#page=10)

## From an arbitrary Seidel matrix to a threshold graph

A Seidel matrix $`S`$ is symmetric with zero diagonal and every other entry equal to $`1`$ or $`-1`$. Conjugation by a diagonal matrix with diagonal entries in $`\{1,-1\}`$ is called switching. Write $`s(S)`$ for the difference of its largest and smallest eigenvalues. Choose orthonormal eigenvectors $`u,v`$ for these eigenvalues and put $`x=(u+v)/\sqrt2`$, $`y=(u-v)/\sqrt2`$. Then $`x,y`$ are orthonormal and $`s(S)=2x^{\mathsf T}Sy`$.

Switch the matrix and vectors together to make $`x_i\ge0`$. At indices where $`x_i=0`$, choose the sign so $`y_i\ge0`$. Order the indices by nondecreasing $`|y_i|/x_i`$, assigning infinity when $`x_i=0`$. For an index with $`y_j\ne0`$ put $`c_j=\mathop{\mathrm{sign}}(y_j)`$. Otherwise choose either sign. For $`i<j`$ the coefficient $`x_i y_j+x_j y_i`$ either vanishes or has sign $`c_j`$. Indeed $`x_i|y_j|\ge x_j|y_i|`$ for positive $`x_i,x_j`$, and the same conclusion holds when either is zero. Define a symmetric matrix $`T`$ with zero diagonal and $`T_{ij}=c_j`$ for $`i<j`$. Thus

```math
 s(S)=2x^{\mathsf T}Sy\le2x^{\mathsf T}Ty\le s(T).
```

The last inequality follows by using $`(x+y)/\sqrt2`$ and $`(x-y)/\sqrt2`$ as unit Rayleigh test vectors. The graph of $`T`$, with edges for its negative entries, is a threshold graph. In this order each new vertex is isolated from all earlier vertices or adjacent to all of them.

## The exact maximum Seidel spread

In fact the maximum of $`s(S)^2`$ over matrices of order $`n\ge2`$ is

```math
 M_n=(n-2)^2+4\lfloor n^2/4\rfloor.
```

The Seidel matrix of a threshold graph of order at least two has no eigenvalues strictly between $`-1`$ and $`1`$. This is contained in the stronger eigenvalue-free interval theorem of Xiong and Hou, which excludes nontrivial eigenvalues in $`(-\sqrt2,\sqrt2)`$. If the threshold graph is disconnected, its complement is connected and is also a threshold graph. Complementation negates the Seidel matrix and preserves the symmetric forbidden interval. [Xiong–Hou, Theorem 3.3](https://doi.org/10.1016/j.amc.2022.127177) · [Subsequent derivation, Theorem 3](https://www.sciencedirect.com/science/article/abs/pii/S0024379525004914)

Let $`\mu_1\ge\cdots\ge\mu_n`$ be the eigenvalues of $`T`$. We have $`\mathop{\mathrm{tr}}(T^2)=n(n-1)`$. If at least three eigenvalues have absolute value different from one, some middle eigenvalue has absolute value at least $`\sqrt2`$ by the cited theorem. As all the other middle squares are at least one, their sum is at least $`n-1`$. Consequently

```math
 s(T)^2\le2(\mu_1^2+\mu_n^2)\le2(n-1)^2\lt M_n.
```

Indeed the final difference is two at even orders and one at odd orders. It remains to consider threshold completions with at most two nonunit eigenvalues. Haemers and Topcu’s Theorem 3.2 classifies graphs whose Seidel matrices have all but at most two eigenvalues in $`[-1,1]`$. Up to switching and complementation they are a clique and isolated vertices. This puts $`T`$ in the form

```math
 T_0=\begin{pmatrix}
 J_p-I_p & J_{p,q}\\ J_{q,p} & I_q-J_q
 \end{pmatrix},\qquad p+q=n.
```

The constant signatures $`\pm(J-I)`$ have spread $`n`$, strictly below $`\sqrt{M_n}`$ for $`n\ge4`$ and equal to it at orders two and three. If a block has size zero or one, the graph is switching-equivalent to a constant signature: for a single isolated vertex beside a clique, switch that vertex to join it to the clique. Thus it suffices to take $`p,q\ge2`$. [Haemers–Topcu, Theorem 3.2](https://arxiv.org/pdf/2109.02522#page=4)

On the subspaces of vectors with coordinate sum zero inside the first and second blocks, its eigenvalues are $`-1`$ and $`1`$, respectively. On the orthonormal block indicators its matrix is

```math
 K=\begin{pmatrix}p-1&\sqrt{pq}\\ \sqrt{pq}&1-q\end{pmatrix}.
```

Its two eigenvalues lie strictly outside $`[-1,1]`$, since both $`\det(K-I)`$ and $`\det(K+I)`$ are negative. Their difference is $`\sqrt{(n-2)^2+4pq}`$. The squared spread is at most $`M_n`$, with equality exactly when $`|p-q|\le1`$. Taking these block sizes realizes $`M_n`$ for all orders at least four. At orders two and three all signatures are switching-equivalent to a constant signature up to negation: first switch to make the first-row signs agree, and at order three one more switch of the first vertex makes all three signs agree if needed.

For an extremal original $`S`$ of order at least four, its completion also attains the maximum and both extreme eigenvalues of $`T`$ are simple. Equality of the two Rayleigh bounds shows that the same $`u,v`$ are its extreme eigenvectors. In the orthonormal block basis the difference of the positive and negative extreme projectors is $`(2K-\mathop{\mathrm{tr}}(K)I)/s(K)`$. In vertex coordinates the entries of $`uu^{\mathsf T}-vv^{\mathsf T}=xy^{\mathsf T}+yx^{\mathsf T}`$ on the first diagonal block, second diagonal block, and off-diagonal blocks are, respectively,

```math
 \frac{n-2}{p\,s(K)},\qquad -\frac{n-2}{q\,s(K)},\qquad \frac{2}{s(K)}.
```

All are nonzero. Switching, permutation, or overall negation preserves this property. Thus every pair had a uniquely maximizing sign in the threshold completion, and equality forces $`S=T`$ in its switched, reordered coordinates. This also classifies the spread maximizers at odd orders.

## Recovering the adjacency equality case

For the adjacency matrix $`A`$, put $`S=J-I-2A`$. Both $`2A`$ and $`2\overline A`$ are positive rank-one updates, of $`-I-S`$ and $`-I+S`$ respectively. Rank-one interlacing bounds their second eigenvalues by the largest eigenvalues of these unperturbed matrices. Therefore

```math
 \lambda_2(G)+\lambda_2(\overline G)
 \le -1+\tfrac12 s(S)\le -1+\tfrac12\sqrt{M_n}\le -1+\sqrt{n^2/2-n+1}.
```

The penultimate bound improves the proposed bound strictly when $`n`$ is odd. At $`n=2`$ the two graphs are the edge and the empty graph, with second eigenvalues $`-1`$ and $`0`$; the bound is strict. For $`n\ge3`$, equality requires equality in both interlacings and in the spread estimate. The largest eigenvalue of each unperturbed matrix is simple. If a simple eigenvalue of a real symmetric matrix remains an eigenvalue after adding $`\mathbf1\mathbf1^{\mathsf T}`$, its unit eigenvector is orthogonal to $`\mathbf1`$. Indeed the rank-one determinant identity at that eigenvalue gives a nonzero scalar times the square of this inner product. Thus $`\mathbf1`$ is perpendicular to both extreme Seidel eigenvectors. In switched balanced coordinates their span is the span of the two block indicators. Consequently the switching signs sum to zero on each block. Each block splits into two classes of the same size, proving $`4\mid n`$.

Denote these classes by $`P_+,P_-,Q_+,Q_-`$ in the positive and negative blocks of $`T_0`$. The signs show that $`Q_+,Q_-`$ are cliques, $`P_+,P_-`$ are independent, and the pairs of classes joined completely form the path $`Q_+,P_-,P_+,Q_-`$. An overall Seidel negation gives the complement, which is isomorphic to the same four-block path by the complement symmetry of this construction.

Conversely take these four equal classes. The balance makes $`\mathbf1`$ orthogonal to the two extreme eigenvectors, so their appropriate eigenvalue $`\rho-1`$ persists in each doubled adjacency matrix. Here $`\rho=\sqrt{(n/2-1)^2+(n/2)^2}`$. On the perpendicular complement of their span the Seidel eigenvalues are $`\pm1`$. The Rayleigh quotient of $`\mathbf1`$ for each doubled adjacency matrix is at least $`n-2`$ there. Since $`n-2\ge\rho-1`$ for $`n\ge4`$, each doubled adjacency matrix has at least two eigenvalues at least $`\rho-1`$, counting multiplicity. Together with rank-one interlacing this gives equality. This also recovers the sufficiency established in the original paper’s Proposition 16.
