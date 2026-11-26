# Ma–Tang's random subset-sum threshold conjecture

**Statement.** Let $`f(N)`$ be the least $`k`$ for which a uniform $`k`$-element subset of every abelian group $`G`$ of order $`N`$ covers $`G`$ by its subset sums with probability at least $`1/2`$. Jie Ma and Quanyu Tang, [*An Erdős problem on random subset sums in finite abelian groups*, arXiv:2602.05768v2, Problem 4.1](https://arxiv.org/html/2602.05768v2#S4), ask for
```math
 c_*=\limsup_{N\to\infty}\frac{f(N)-\log_2N}{\log\log N}
```
and propose that the upper bound $`1/\log2`$ is sharp. This is the second-order problem from their paper, not the older question about an $`o(\log\log N)`$ error, already answered by Ma and Tang. Here $`\log`$ is natural.

**Theorem.** $`c_*=1/\log2`$. More precisely, along $`N=3\cdot 2^d`$ as $`d\to\infty`$,
```math
 f(N)\ge\log_2N+\log_2\log N-\log_2\log\log N-O(1).
\tag{1}
```

## Proof

Let $`G=\mathbb F_2^d\times\mathbb F_3`$. Choose $`k=d+r`$ independent uniform elements $`(v_j,c_j)\in G`$, initially allowing repetition. We will take
```math
 r=\left\lfloor\log_2\frac{d}{10\log d}\right\rfloor.
\tag{2}
```
Since $`k=O(\log N)`$, the probability there is a repetition is $`O(k^2/N)=o(1)`$. Conditioned on distinctness, the unordered sample is a uniform $`k`$-element subset of $`G`$. It suffices to show that the independent model fails to cover $`G`$ with probability $`1-o(1)`$.

The projection of the subset-sum map to the first coordinate is
```math
 A:\mathbb F_2^k\longrightarrow\mathbb F_2^d,\qquad x\longmapsto\sum_j x_jv_j .
```
If $`A`$ is not surjective, full coverage fails automatically. Its failure probability is at most $`(2^d-1)2^{-k}<2^{-r}`$, by taking a union over nonzero left-kernel vectors. Given that $`A`$ is surjective, $`K=\ker A`$ is uniformly distributed among the $`r`$-dimensional subspaces of $`\mathbb F_2^k`$, by invariance under invertible changes of coordinates in $`\mathbb F_2^k`$. Independently the $`c_j`$ remain independent uniform elements of $`\mathbb F_3`$.

We can sample this uniform subspace as the image of
```math
 t\longmapsto(\ell_1\cdot t,\ldots,\ell_k\cdot t),\qquad t\in\mathbb F_2^r,
```
with independent uniform $`\ell_j\in\mathbb F_2^r`$, conditioned on map injectivity. The probability the map before conditioning is not injective is at most $`(2^r-1)2^{-k}<2^{-d}=o(1)`$. Thus any event holding with probability $`1-o(1)`$ for the independent columns still holds after conditioning. The distribution of the event below does not depend on the chosen basis of $`K`$, since a basis change just permutes the column types and keeps the zero type fixed.

Write $`m=2^r`$. For each $`b\in\mathbb F_2^r`$, let its occupied indices be the $`j`$ with $`\ell_j=b`$ and $`c_j\ne0`$. Each $`j`$ independently occupies a given type with probability $`2/(3m)`$. The probability some type has exactly one occupied index is at most
```math
 m k\frac{2}{3m}\left(1-\frac{2}{3m}\right)^{k-1}
 \le \frac{2k}{3}\exp\!\left(-\frac{2(k-1)}{3m}\right)
 =o(1),
\tag{3}
```
by (2). We henceforth assume there are no singleton occupied types.

Choose bits $`u_j\in\mathbb F_2`$ so that
```math
 \sum_{j:\ell_j=b}c_j(-1)^{u_j}=0\quad\text{in }\mathbb F_3
 \qquad\text{for every } b\ne0.
\tag{4}
```
The choices for different $`b`$ are independent. With no nonzero $`c_j`$ the condition is automatic. Otherwise there are $`s\ge2`$ nonzero coefficients and each signed term can freely be $`1`$ or $`-1`$. In pairs choose $`+1,-1`$. If $`s`$ is odd, choose three $`+1`$'s and pair the rest. Their total vanishes modulo three. This proves (4).

Consider the full fiber of the first-coordinate subset sum with value $`A u`$, consisting of the vectors $`x=u+y`$, $`y\in K`$, where this addition is over $`\mathbb F_2`$. For $`y_j=\ell_j\cdot t`$, their second-coordinate values in $`\mathbb F_3`$ are
```math
 \sum_j c_jx_j
 =\frac12\sum_jc_j
  -\frac12\sum_{b\in\mathbb F_2^r}(-1)^{b\cdot t}
                 \sum_{j:\ell_j=b}c_j(-1)^{u_j}.
\tag{5}
```
Here $`x_j`$ as a bit is $`(1-(-1)^{u_j+\ell_j\cdot t})/2`$, evaluated in $`\mathbb F_3`$. By (4), the only surviving term in the second sum in (5) is the constant frequency $`b=0`$. Thus this entire fiber reaches only one of the three residues of the second coordinate. At least two elements of $`G`$ are missing, proving the coverage failure with probability $`1-o(1)`$.

For uniform subsets, coverage is monotone in $`k`$, by coupling through a random ordering of $`G`$. Hence $`f(3\cdot2^d)>d+r`$ for all sufficiently large $`d`$. By (2), $`r=\log_2 d-\log_2\log d-O(1)`$. Substituting $`d=\log_2N-\log_2 3`$ proves (1). Finally [Erdős and Rényi, 1965, Theorem 2](https://www.renyi.hu/~p_erdos/1965-15.pdf), in the form quoted by Ma–Tang (16), gives the universal upper bound
```math
 f(N)\le\log_2N+\log_2\log N+O(1).
```
Together with (1) it gives the claimed value of the limsup, and even convergence to that constant along $`N=3\cdot2^d`$. The proof does not assert the sharp constant for prime orders.

## Priority and scope

- Ma–Tang, arXiv:2602.05768v2, Theorem 1.2, establish a lower coefficient $`1/(2\log2)`$ along primes and independently answer the original Erdős question recorded as [#543](https://www.erdosproblems.com/543) and the duplicate [#274](https://www.erdosproblems.com/274). Their Problem 4.1 (the limsup over all orders) explicitly remains and suggests the value proved here.
- Erdős–Hall, [*Some new results in probabilistic group theory*, Comment. Math. Helv. 53 (1978), 448–457](https://users.renyi.hu/~p_erdos/1978-45.pdf), Theorem 2, show a smaller lower correction for cyclic groups. Their Theorem 3 gives a contrasting near-first-order threshold for elementary abelian 2-groups; the odd factor of order three is essential in the construction above.
- Ma–Tang's referenced note of Nat Sothanaphan discusses the elementary-abelian 2-group example and cyclic obstructions, according to their discussion. Exact-priority searches for the authors' Problem 4.1 and mixed $`2`$- and $`3`$-groups have not located an earlier resolution. Do not equate that search with proof of priority.
- For each fixed $`0<\epsilon<1`$, a missing element also violates the pointwise relative equidistribution condition in Erdős Problem 1179. Thus (1) gives its threshold an additional lower obstruction along the same orders. No matching second-order upper bound for equidistribution is asserted.
