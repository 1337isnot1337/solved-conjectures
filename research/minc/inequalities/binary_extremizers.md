# Gyires’s ratio inequality

For doubly stochastic matrices of rank at most two, a counterexample to the stronger Gram inequality $`\mathop{\mathrm{per}}A\ge\sqrt{d_n\mathop{\mathrm{per}}(AA^T)}`$ would yield one of the same order with at most three distinct rows and at most three distinct columns. The same reduction holds separately for a counterexample to Lih–Wang's chord inequality at any fixed interpolation parameter, and for a negative radial derivative in Friedland and Minc's problem. This reduces the number of distinct rows and columns at **every** order. The class still has unbounded multiplicities and a continuous parameter.

## Two families of Bernoulli probabilities

Use the matrix $A(a,b)$ from [the binary occupation note](binary_occupation.md), now allowing any $p\in(0,1)$ with $\sum_i a_i=\sum_i b_i=np$. Every rank-two doubly stochastic matrix has this representation. Indeed $A-J$ has rank one since the all-ones line and its orthogonal complement are invariant for a doubly stochastic matrix. Write its rows as $(1-a_i)v+a_i u$ with $u,v$ the two endpoints among the actual rows. Their mean row is uniform, so, writing $p$ for the mean of $a_i$, put $b_j=np u_j$ and $1-b_j=n(1-p)v_j$. These numbers belong to $[0,1]$, have the required sums, and substituting gives the claimed representation. Rank one gives $J$ directly.

Fix $p$ throughout the reduction. In each of the two vectors independently we can require that its entries belong to $`\{0,c,1\}`$, with a possibly different $c$ on each side. Once the endpoint multiplicities and $p$ are given, the interior value is forced by the mean.

## Chords and derivatives

For fixed $t$, $`\mathop{\mathrm{per}}(J+t(A-J))`$ is symmetric and multiaffine in $a$ when $b$ is fixed, by row multilinearity and row permutation invariance. The same is true in $b$ by columns. This property persists under linear combinations of radial evaluations and differentiation in $t$. Minimize the signed chord margin or the radial derivative first over $a$, then over $b$, using the pair argument in the preceding note. Each step can only decrease the objective. A negative derivative still certifies failure of monotonicity. If the reduced matrix is interior, extending its ray from $J$ to the Birkhoff boundary preserves the failing part of the segment and the number of row and column types. For the chord claim the reduced matrix itself suffices.

## The Gram margin

Write $Q_A(z)=\prod_i\sum_j A_{ij}z_j$ and let $V(A)$ have coordinates $\sqrt{\alpha!}[z^\alpha]Q_A$, indexed by occupations of total $n$. The Gram identity gives $`\mathop{\mathrm{per}}(AA^T)=\|V(A)\|_2^2`$. If $A$ violates the stronger inequality, take $`w=V(A)/\|V(A)\|_2`$. For fixed $b$, the linear functional

```math
\mathop{\mathrm{per}}A-\sqrt{d_n}\,\langle w,V(A)\rangle
```

is symmetric and multiaffine in $a$. Its negative value survives reduction of $a$ to three levels, and the norm dominates the chosen linear functional at the new point.

For this fixed $a$, put $x=a-p\mathbf1$, $y=(b-p\mathbf1)/(np(1-p))$, so $A=J+xy^T$. Then $`AA^T=J+\|y\|_2^2 xx^T`$. With $e_k$ the elementary symmetric polynomial, expansion gives

```math
\mathop{\mathrm{per}}(AA^T)=\sum_{k=0}^n c_k s^k,\quad s=\|y\|_2^2,\qquad c_k=\frac{(n-k)!k!}{n^{n-k}}e_k(x)^2.
```

Here $c_1=0$ and all $c_k\ge0$. The square root is a convex nondecreasing function of $s\ge0$. Indeed it is the Euclidean norm of the vector with entries $\sqrt{c_k}s^{k/2}$, each nonnegative and convex for $k=0$ or $k\ge2$. Coordinatewise monotonicity of the norm on the positive orthant and the triangle inequality prove the assertion, including $s=0$.

Vary two $b$ coordinates while preserving their sum. The parameter $s$ is affine in their squared difference. The permanent of $A$ is likewise affine in that squared difference by symmetric multiaffinity. Thus the Gram margin is concave in the squared difference. Among its minimizers over $b$, choose one maximizing $\sum b_j^2$. If it has two unequal interior coordinates, an interior minimum of the concave pair restriction forces the function to be constant on that interval. Its far endpoint increases $\sum b_j^2$, contradicting the choice. This is the second three-level reduction.

## Remaining inequalities

The reduced Poisson-binomial laws on either side have the form $`s+\mathop{\mathrm{Bin}}(l,(np-s)/l)`$, allowing deterministic endpoints. For nonintegral $np$, their densities relative to $`\mathop{\mathrm{Bin}}(n,p)`$ can peak at different integers even with the same mean. For example take $n=8$, $np=5/2$. For the vector with three entries $5/6$ and five zeros the density peaks at 3. For the vector with one entry 1, four entries $3/8$, and three zeros it peaks at 2. Thus the common-mode proof in the preceding note leaves a genuine case. For Gyires the proof reduces the stronger Gram inequality. It makes no equivalence assertion for violations of the original symmetrized ratio.

The original entries remain [Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html), [Conjecture 34](https://yair-lavi.com/mincs-list/conjecture-34/index.html), and [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html). The symmetric multiaffine extremal argument is classical. [Hoeffding’s original paper](https://repository.lib.ncsu.edu/bitstream/1840.4/2268/1/ISMS_1955_128.pdf)
