# Review of the two-sparse Gyires argument

Date: 20 November 2026 (America/Chicago).

The files reviewed were fetched directly from the current GitHub main branch:

- [gyires_sparse_support.md](https://github.com/1337isnot1337/solved-conjectures/blob/main/research/minc/gyires_sparse_support.md), blob f7498aff197104d25f512a8cbed89d933aa67739.
- [verify_gyires_sparse_support.py](https://github.com/1337isnot1337/solved-conjectures/blob/main/research/minc/verify_gyires_sparse_support.py), blob fef2401779614e26ea00b8548d700656154ba2a7.

## Conclusion

The mathematical proof is correct. In particular, it covers every doubly stochastic matrix with at most two positive entries in each row, including disconnected components with different weights. The two separate Gram inequalities and the stated strictness follow from the written estimates.

However, the non-strict inequalities for this entire class already follow from the two-permutation Gyires result stated on [Lavi's current Conjecture 20 page](https://yair-lavi.com/mincs-list/conjecture-20/index.html). A cycle block can be made symmetric by a column reflection, so the known Gyires inequality becomes exactly the required Gram inequality for that block. Multiplying those inequalities gives the different-weight extension. The argument is given in Section 4 below.

The correct scope is therefore an independent elementary proof, with an explicit cycle bound and a checked strictness statement, of a class whose non-strict inequality is already implied by the cited prior result. It is not a full resolution of Gyires's conjecture, and the different component weights do not establish a new inequality class.

## 1. Support decomposition

Each connected component of the positive support graph has equally many row and column vertices: the sum of its edge weights is both its number of row vertices and its number of column vertices. A vertex of degree one has incident weight one, so its neighbor also has degree one; this is an isolated singleton component.

In every remaining component, each row has degree exactly two, and every column has degree at least two. If the component has $`m`$ rows and $`m`$ columns, it has $`2m`$ edges. Thus every column has degree exactly two. A connected graph with all degrees two is a cycle. The row and column sum equations make its edge weights alternate between $`p`$ and $`1-p`$.

Independent row and column permutations therefore put the matrix into a direct sum of blocks

```math
C_m(p)=pI_m+(1-p)P_m
```

and singleton blocks. This reduction preserves $`\mathop{\mathrm{per}}A`$, $`\mathop{\mathrm{per}}(AA^{\mathsf T})`$, and $`\mathop{\mathrm{per}}(A^{\mathsf T}A)`$. It need not preserve $`\mathop{\mathrm{per}}(A^2)`$. The draft explicitly observes this and avoids using the invalid invariance.

For a genuine nontrivial support component, $`0<p<1`$. Allowing $`p=0,1`$ in the subsequent formulas is harmless; it merely treats a reducible endpoint by the same algebra.

## 2. Cycle formula and constants

For $`m\geq3`$, set $`q=1-p`$, $`a=p^2+q^2`$, and $`b=pq`$. Then

```math
\mathop{\mathrm{per}}C_m(p)=p^m+q^m,\qquad
C_m(p)C_m(p)^{\mathsf T}=aI_m+b(P_m+P_m^{\mathsf T}).
```

Every permutation supported on this last matrix consists of fixed points and disjoint adjacent transpositions, or is one of the two full directed cycles. Consequently, its permanent is

```math
\sum_{j=0}^{\lfloor m/2\rfloor}
\frac{m}{m-j}\binom{m-j}{j}a^{m-2j}b^{2j}+2b^m.
\tag{1}
```

This description is valid at $`m=3`$ and $`m=4`$, including the triangle's two directed cycles. At $`m=2`$, the two cyclic off-diagonals coincide, and the draft correctly uses the separate expression $`a^2+4b^2`$.

The estimates $`b\leq a/2`$, $`4b^m\leq(p^m+q^m)^2`$, and

```math
a^m\leq2^{m-2}(p^m+q^m)^2
```

are correctly oriented. The last follows from the two-coordinate power-mean inequality. They give

```math
\mathop{\mathrm{per}}(CC^{\mathsf T})
\leq\frac{S_m+2}{4}(\mathop{\mathrm{per}}C)^2,
\tag{2}
```

where $`S_1=2,S_2=6,S_m=2S_{m-1}+S_{m-2}`$.

The four displayed base constants are correct. For $`m\geq6`$, the ratio $`(S_{m+1}+2)/(S_m+2)<5/2`$, while

```math
\frac{\beta_m}{\beta_{m+1}}
 =\left(1+\frac1m\right)^m
 \geq2+\frac5{12}+\frac5{54}
 =\frac{271}{108}
 >\frac52.
```

Thus $`\beta_m(S_m+2)<4`$ for every $`m\geq3`$. Equation (2) proves the strict Gram inequality on every such cycle. At $`m=2`$, equality requires $`p=q=1/2`$.

## 3. Disconnected components and Gyires

The normalization is correct:

```math
\frac{\beta_{r+s}}{\beta_r\beta_s}
=\binom{r+s}{r}
\left(\frac r{r+s}\right)^r
\left(\frac s{r+s}\right)^s<1
\quad(r,s\geq1).
\tag{3}
```

It is a single probability in a nondegenerate binomial distribution. Therefore $`\beta_n<\prod_i\beta_{m_i}`$ whenever there is more than one component. Permanent multiplicativity and (3) combine the block Gram bounds regardless of the different parameters $`p_i`$. All Gram permanents are positive, so the strict inequality in (3) is retained.

Finally, for the symmetrized row and column tensors $`u,v`$ used in the draft,

```math
\mathop{\mathrm{per}}(AA^{\mathsf T})
+\mathop{\mathrm{per}}(A^{\mathsf T}A)
-2\mathop{\mathrm{per}}(A^2)
=n!\|u-v\|^2\geq0.
\tag{4}
```

This proves the needed inequality directly. The cross Gram entries are $`r_i\cdot c_j=(A^2)_{ij}`$, so no transpose error is present. Combining (4) with the separate Gram estimates proves the displayed Gyires inequality and its strictness in orders $`n\geq3`$.

## 4. Why the non-strict class follows from the known two-permutation case

Index an $`m`$-cycle by $`\mathbb Z/m\mathbb Z`$. Let $`P`$ be its cyclic shift matrix and let $`F`$ be the reflection permutation matrix $`i\mapsto-i`$. Then

```math
F^{\mathsf T}=F,\qquad F^2=I,\qquad FPF=P^{\mathsf T}.
```

Both $`F`$ and $`PF`$ are symmetric permutation matrices. For
$`C=pI+qP`$, define

```math
B=CF=pF+qPF.
```

The matrix $`B`$ is a symmetric doubly stochastic convex combination of two permutation matrices. Moreover,

```math
B^2=CF\,CF=CC^{\mathsf T},
\qquad \mathop{\mathrm{per}}B=\mathop{\mathrm{per}}C.
\tag{5}
```

Apply the already stated two-permutation Gyires inequality to $`B`$. Since $`B`$ is symmetric, the three matrices in its denominator are all $`B^2`$. The inequality reduces exactly to

```math
\beta_m\mathop{\mathrm{per}}(CC^{\mathsf T})
\leq(\mathop{\mathrm{per}}C)^2.
\tag{6}
```

Normality of $`C`$ gives the other Gram bound too. Apply (6) independently to every support component, with its own value of $`p`$, multiply the inequalities, and use (3). This gives the two separate Gram inequalities for every two-sparse matrix. Equation (4) then gives Gyires for the original matrix, including independent row and column permutations.

The direct-sum weights need not be equal. That does not evade the prior theorem, because it is applied separately to each symmetric cycle block before multiplication.

The current source page states the two-permutation inequality without separately spelling out its equality clause. The argument above therefore treats its non-strict implication as prior. The draft's explicit strictness estimate is independently correct; no claim that this quantitative detail is novel is justified by the present audit.

## 5. Code and source audit

The fetched standard-library checker was read before execution. It contains only exact arithmetic and local matrix computations. It ran successfully:

    Passed 288 exact checks for cyclic formulas, Gram bounds,
    mixed-weight blocks, and scalar recurrence

Its cyclic formula checks, normalization recurrence, and mixed-weight examples match the proof. The independent row and column permutation used in the mixed examples is valid because the column map $`j\mapsto3j+1`$ is used only when $`3\nmid n`$. The finite checks confirm conventions; they are not the all-order proof.

Sources inspected:

1. [Lavi, Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html), refreshed 20 November 2026. It explicitly states the all-order two-permutation result in its own progress section.
2. [Cheon and Wanless, An update on Minc's survey of open problems involving permanents](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf), 2005, Section 6, Conjecture 20. It records Chang's order-three and lower-entry-bound cases, not the later two-permutation result.
3. [Chang, On two permanental conjectures](https://doi.org/10.1080/03081089008817977), 1990, publisher abstract. It confirms the order-three scope. The full paper was not available in this review.

Both web search engines were used for the exact Gyires name combined with two-permutation mixtures, two-sparse matrices, Gram bounds, and Chang's title. No older direct theorem was identified from those searches. That negative search does not establish priority and is unnecessary for the decisive conclusion: the current cited two-permutation theorem already implies the entire non-strict sparse-support class.
