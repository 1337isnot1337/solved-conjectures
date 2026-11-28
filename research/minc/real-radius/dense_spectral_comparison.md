# Gyires’s ratio inequality

For every fixed $`K\ge1`$, the following holds for all sufficiently large $`n`$. Every doubly stochastic $`A`$ with $`\max a_{ij}\le K/n`$, other than the uniform matrix $`J`$, satisfies both strict inequalities

```math
 d_n\mathop{\mathrm{per}}(AA^T)<(\mathop{\mathrm{per}}A)^2,\qquad
 d_n\mathop{\mathrm{per}}(A^TA)<(\mathop{\mathrm{per}}A)^2,\qquad d_n=n!/n^n.
```

These imply [Gyires’s inequality](https://yair-lavi.com/mincs-list/conjecture-20/index.html), with equality only at $`J`$. The same class satisfies the [Lih–Wang inequality](https://yair-lavi.com/mincs-list/conjecture-34/index.html), strictly off the endpoints and $`J`$, on every fixed interval $`0<t\le1-\eta`$ for the coefficient $`t`$ of $`A`$. Both conclusions allow zeros, disconnected support, and arbitrarily small spectral gaps. The threshold may depend on $`K`$ (and on $`\eta`$ for the extended chord).

The comparison behind these statements holds at every order. With $`B=A-J`$,

```math
 \frac{\mathop{\mathrm{per}}A}{d_n}\asymp_K
 \det\big(I-(1-1/n)B^TB\big)^{-1/2}.                         \tag{1}
```

The constants are uniform over the stated class. This is a two-sided bound, with no assertion that the quotient tends to one when the spectral gap closes. For instance at two completely disconnected equal uniform blocks, both sides have order $`\sqrt n`$. With no spectral-gap hypothesis the regularization in (1) matters. McCullagh's [determinant asymptotic](https://arxiv.org/abs/1205.5723) is an antecedent in the gapped regime. We use the [bounded Frobenius centered coefficient estimate](hilbert_schmidt_limit.md) and [Sra’s Theorem 2.1 on permutation entropy](https://hexagonmath.org/pdf/2611.00118v1). The two Minc entries remain open outside these conditions.

## Entropy of a table with prescribed means

Partition the rows and columns of a doubly stochastic matrix into a fixed number of classes. Denote the respective sizes by $`r_i,c_j`$, and the rectangle totals by $`x_{ij}`$. On the complete bipartite graph of the classes let $`T`$ be a maximum-weight spanning tree for edge weights $`x_{ij}`$. There is a constant depending only on the numbers of classes such that

```math
 \frac{\mathop{\mathrm{per}}A}{d_n}\ \ge\ c\left[
 \frac{\prod_i(1+r_i)\prod_j(1+c_j)}{(1+n)\prod_{ij\in T}(1+x_{ij})}\right]^{1/2}.       \tag{2}
```

Here is a proof including zero means. Round $`x`$ randomly to an integral table $`K^0`$ with the same margins, expectation $`x`$, and all entries between their floors and ceilings. This follows by convex decomposition in the transportation polytope with these integral box constraints (the bipartite incidence matrix is totally unimodular). For each non-tree edge $`e`$ independently choose a uniform integer increment in $`[-a_e,a_e]`$, where $`a_e=\lfloor\sqrt{x_e}/(4s)\rfloor`$ and $`s`$ is the total number of edges. Add that increment on the edge and with alternating signs on its fundamental cycle. The margins stay fixed. Every tree edge $`f`$ on that cycle satisfies $`x_f\ge x_e`$. If its mean is less than one, all the corresponding increments vanish. Otherwise their total absolute size is at most $`\sqrt{x_f}/4\le\lfloor x_f\rfloor`$, and the same bound ensures nonnegativity on a changed non-tree edge. Call the final table $`K'`$. It has mean $`x`$, $`\mathop{\mathrm{Var}}K'_f\le C_s x_f`$ (use independent mean-zero increments and $`\mathop{\mathrm{Var}}K^0_f\le x_f`$), and

```math
 H(K')\ge H(K'\mid K^0)=\sum_{e\notin T}\log(2a_e+1)
 \ge\tfrac12\sum_{e\notin T}\log(1+x_e)-C_s.
```

Conditional on the rounded table the increments can be recovered from their non-tree edges.

Write $`I(A)=S(A)-H_{\max}(A)`$, where $`S(A)=-\sum a_{ij}\log a_{ij}`$ and $`H_{\max}`$ is the maximum entropy of a permutation law with marginals $`A`$. The Gibbs variational bound gives $`\log\mathop{\mathrm{per}}A\ge-I(A)`$. By Sra's pair-averaging theorem, averaging rows and columns inside each class increases $`I`$. Finite successive pair averages implement a full class average as in [the two-class proof](../extremal-graphs/positive_density_minimum.md). On the averaged matrix, choose a uniform permutation conditional on the random counts $`K'`$. Its marginals equal the block means. The number of permutations at each table is $`\prod r_i!\prod c_j!/\prod K'_{ij}!`$. Writing $`\phi(s)=\log(s!)-s\log s+s=\tfrac12\log(1+s)+O(1)`$, the entropy comparison gives

```math
 \log(\mathop{\mathrm{per}}A/d_n)\ge H(K')+\sum_i\phi(r_i)+\sum_j\phi(c_j)-\phi(n)
 -\sum_e\mathbb E\phi(K'_e)-\sum_e\mathbb E[K'_e\log(K'_e/x_e)].
```

Terms at zero mean are zero in the relative entropy sum. For positive means, $`\log t\le t-1`$ bounds it by $`\sum_e\mathop{\mathrm{Var}}(K'_e)/x_e=O_s(1)`$. Jensen bounds each expected $`\phi`$ above by $`\tfrac12\log(1+x_e)+O(1)`$. Cancellation of the non-tree logarithms proves (2).

## Locating the classes

It suffices for uniformity in (1) to show that every sequence of orders tending to infinity has a subsequence with ratios bounded above and away from zero. Otherwise start with a sequence along which a bound fails by an unbounded factor. Fixed orders are compact, and the permanent is positive by van der Waerden.

Use the weighted undirected bipartite graph with adjacency blocks $`0,A;A^T,0`$. Every vertex has weighted degree one. Choose the largest $`h`$ for which, on a subsequence, the $`2n`$ vertices have a partition into $`h`$ classes of size comparable to $`n`$ with total crossing weight $`o(n)`$. Such a class with $`r`$ rows and $`c`$ columns has internal weight $`r-o(n)=c-o(n)\le Krc/n`$. Thus both sides in every class have size at least $`n/K-o(n)`$, bounding $`h`$. Minimize crossing weight over $`h`$-partitions with every size at least $`\lfloor n/(3K)\rfloor`$ on that subsequence. This still gives $`o(n)`$ crossing weight, and each class has both part sizes at least $`n/K-o(n)`$. Moving any one vertex is therefore feasible, so by minimality each vertex has internal degree at least $`1/h`$.

For a set $`U`$ within a class with $`|U|\le n/(4Kh)`$, its weight to the class complement within that class is at least $`|U|/h-K|U|^2/n\ge |U|/(2h)`$. For larger sets up to half the class size, the ratio of this internal cut weight to $`|U|`$ stays bounded below. Otherwise a subsequence and one more split contradict maximality of $`h`$. Reflecting external weights onto loops, the internal chains have uniform gaps by the [finite reversible Cheeger inequality](https://pages.uoregon.edu/dlevin/MARKOV/mcmt2e.pdf). The internal Dirichlet energy thus controls the sum of squared deviations from each joint class mean in unweighted Euclidean norm.

Let $`x_{gh}`$ again be the rectangle totals for these row and column classes, with matching labels. The diagonal totals and the class sizes are comparable to $`n`$, and all other totals are $`o(n)`$. Put $`w_{gh}=x_{gh}+x_{hg}`$ for distinct classes and take a maximum-weight tree $`T_0`$ on the $`h`$ classes with weights $`w_{gh}`$. In (2) each diagonal edge belongs to the tree eventually: they form a matching and outweigh every off-diagonal edge. Contracting those edges leaves a tree maximizing the product of $`1+\max(x_{gh},x_{hg})`$. This maximum differs from the maximum for $`1+w_{gh}`$ by at most $`2^{h-1}`$. The greedy tree maximizes the product in either case by ordering the edge weights. Consequently

```math
 \mathop{\mathrm{per}}A/d_n\ \ge c\,U,\qquad
 U= n^{(h-1)/2}\prod_{gh\in T_0}(1+w_{gh})^{-1/2}.             \tag{3}
```

## The same tree controls the upper bound

Let $`M=AA^T`$, $`Q=M^{1/2}`$, $`E`$ be the row-class averaging projection and $`F=I-E`$. Identify $`\mathop{\mathrm{ran}}E`$ with class values $`a_g`$ of norm squared $`\sum_g r_g a_g^2`$. Let $`L`$ on that space have quadratic form $`\sum_{g<h} w_{gh}(a_g-a_h)^2`$, and extend it by zero on $`F`$. There is a constant $`c>0`$ along the subsequence with

```math
 I-M\succeq c(F+L),\qquad E(I-M)E\preceq L.                    \tag{4}
```

Indeed $`\langle u,(I-M)u\rangle=\min_v\sum A_{ij}(u_i-v_j)^2`$. For the upper bound take a class-constant $`u`$ and set $`v_j`$ to the matching class value. For the lower bound let $`a_g`$ be the row mean of $`u`$ in class $`g`$. The internal gap controls $`\sum_i(u_i-a_{g(i)})^2+\sum_j(v_j-a_{g(j)})^2`$ for every $`v`$: replacing the optimal joint mean by the row mean increases total squared deviations by a bounded factor, since rows occupy a bounded-below fraction in each class. Now square $`a_{g(i)}-a_{g(j)}=(a_{g(i)}-u_i)+(u_i-v_j)+(v_j-a_{g(j)})`$, multiply by $`A_{ij}`$ and sum. Unit margins control the two deviation terms. This proves (4). In particular $`I-Q\succeq (I-M)/2\succeq c'(F+L)`$.

Choose a fixed $`\gamma>0`$ small enough along the subsequence. The coarse matrix $`E-\gamma L`$ in class values is a stochastic matrix $`P`$ with off-diagonal entries $`\gamma w_{gh}/r_g`$ and diagonal entries at least $`1/2`$. It is positive semidefinite in the weighted inner product. Also $`I-Q-\gamma L\succeq c''F`$. The [Schur complement and block pinching construction](../extremal-graphs/dense_maxima.md) gives

```math
 Q\preceq E-\gamma L+V,
```

where $`V`$ is block diagonal, positive semidefinite, centered within each class, with bounded Frobenius norm and operator norm at most a fixed $`\rho<1`$. For clarity, apply that construction to $`Q+\gamma L`$ in place of $`Q`$. This is a positive contraction by the last inequality, with bounded Frobenius norm since $`\|Q\|_F^2=\sum a_{ij}^2\le K`$ and $`L`$ has bounded rank and norm. Subtracting $`\gamma L`$ yields the displayed order.

The permanent is increasing in PSD order by the symmetric tensor representation. Represent the upper covariance by a proper complex Gaussian, the sum of independent coarse and within-class Gaussians. Its coarse coordinate has value $`Z_g/\sqrt{r_g}`$ at each of the $`r_g`$ sites of class $`g`$. The covariance of $`Z`$ in the normalized indicator basis is the symmetric matrix $`C=\mathop{\mathrm{diag}}(\sqrt r)P\mathop{\mathrm{diag}}(1/\sqrt r)`$. Conditional on $`Z`$, the Gaussian moment in class $`g`$ expands as

```math
 \sum_{j=0}^{r_g}\sigma_j(V_g)(|Z_g|^2/r_g)^{r_g-j}.
```

Here $`\sigma_j`$ denotes the sum of order-$`j`$ subpermanents. These coefficients are nonnegative by the Gaussian formula. The [centered estimate (2)](hilbert_schmidt_limit.md) bounds them by $`C_0R^j(r_g)_j/r_g^j`$ for any fixed $`\rho<R<1`$, where $`(r)_j`$ is falling factorial. Dividing by $`\prod_g d_{r_g}`$ therefore bounds $`\mathop{\mathrm{per}}Q/\prod_g d_{r_g}`$ above by

```math
 C_0^h\sum_{0\le j_g\le r_g} R^{\sum_g j_g}
 \mathbb E\prod_g\frac{|Z_g|^{2q_g}}{q_g!},\qquad q_g=r_g-j_g.  \tag{5}
```

The final expectation is a return probability. Start $`q_g`$ independent particles in each class $`g`$, with single-step transition probabilities $`P_{gh}`$. The probability that the final count vector equals $`q`$ is the permanent of the matrix of $`P`$ with each index $`g`$ repeated $`q_g`$ times on both sides, divided by $`\prod q_g!`$ (expand by assignments of the particles). Diagonal similarity leaves that permanent unchanged and Gaussian pairing with covariance $`C`$ gives exactly the expectation in (5).

When $`q_g\ge r_g/2`$ for all $`g`$, Fourier inversion bounds this probability by the integral of $`\prod_g|\sum_hP_{gh}e^{it_h}|^{q_g}`$ over independent uniform angles. Using $`P_{gg}\ge1/2`$, expand the squared modulus and use $`1-u\le e^{-u}`$ to bound the integrand by

```math
 \exp\big[-c_1\sum_{g\lt h}w_{gh}(1-\cos(t_g-t_h))\big].
```

Keeping just the tree edges gives an upper bound. The angle differences along a tree are independent uniform angles, by integration from the leaves. The integral of $`e^{-v(1-\cos t)}`$ is at most $`C_1/\sqrt{1+v}`$ by the elementary quadratic lower bound on $`1-\cos t`$ on $`[-\pi,\pi]`$. Thus (5) is at most a constant times $`\prod_{T_0}(1+w_{gh})^{-1/2}`$. Indeed the geometric weights sum to a constant, and if any $`q_g<r_g/2`$ their tail is exponentially small in $`n`$ since $`r_g\asymp n`$; there the return probability is at most one. The tree product decreases at worst polynomially. Stirling gives $`\prod d_{r_g}/d_n\asymp n^{(h-1)/2}`$. We conclude that $`\mathop{\mathrm{per}}\sqrt{AA^T}/d_n\le C U`$. Transposition gives the same upper bound for $`\sqrt{A^TA}`$, since $`w`$ and $`T_0`$ are unchanged. Symmetric tensor Cauchy–Schwarz in the singular value decomposition gives $`|\mathop{\mathrm{per}}A|^2\le\mathop{\mathrm{per}}\sqrt{AA^T}\mathop{\mathrm{per}}\sqrt{A^TA}`$. This proves the matching upper bound to (3).

## Identifying the determinant

Let the eigenvalues of $`L`$ on the $`h`$ class constants be $`0=\ell_1\le\cdots\le\ell_h=o(1)`$, counting multiplicity. By (4) and min-max, the first $`h`$ eigenvalues of $`I-AA^T`$ lie between $`c\ell_j`$ and $`\ell_j`$; the remaining eigenvalues are bounded below. Removing one trivial constant eigenvector, the determinant factor in (1) is comparable to $`\prod_{j=2}^h(n^{-1}+\ell_j)^{-1/2}`$. Indeed all the other squared singular values stay bounded away from one, and their sum is at most $`K`$, giving a bounded product of inverse square roots. This argument allows further eigenvalues equal to one.

The eigenvalues of $`nL`$ are comparable individually to those of the ordinary $`h`$-vertex Laplacian with edge weights $`w`$, by the variational principle since $`r_g\asymp n`$. Adding unit weights to every edge of the complete graph adds $`h`$ to each centered eigenvalue of this ordinary Laplacian. The matrix-tree theorem gives the product of the resulting $`h-1`$ eigenvalues as $`h\sum_T\prod_{e\in T}(1+w_e)`$. With fixed $`h`$ this sum is comparable to its largest term, the product for $`T_0`$. Empty products are one when $`h=1`$. This identifies the determinant factor with $`U`$ up to bounded factors and proves (1) by the subsequence argument.

## Consequences for the two inequalities

If $`s=\|A-J\|_{\mathrm{op}}\to1`$, the determinant factor in (1) tends to infinity. Both Gram matrices are doubly stochastic, still have entries at most $`K/n`$, and their centered singular values are the squares of those of $`A`$. Hence (1) gives $`\mathop{\mathrm{per}}(AA^T),\mathop{\mathrm{per}}(A^TA)\le C_K\mathop{\mathrm{per}}A`$, and the normalized two Gram ratios $`(\mathop{\mathrm{per}}A)^2/(d_n\mathop{\mathrm{per}}(AA^T))`$ and its transpose tend to infinity. When $`s`$ stays away from one the [signed determinant asymptotic](hilbert_schmidt_limit.md) applies, since row and column norms are $`O_K(n^{-1/2})`$ and the Frobenius norm is bounded. The two ratios equal $`\prod_i\sqrt{(1+s_i^2)/(1-s_i^2)}+o(1)`$, with $`s_i`$ centered singular values. This is strictly separated from one if $`\|A-J\|_F`$ stays bounded below. For $`\|A-J\|_F\to0`$ the [small-norm estimate](diffuse-inequalities.md) supplies strictness off $`J`$. These alternatives suffice by subsequence contradiction. The remaining mixed permanent is bounded by the geometric mean of the two Gram permanents by Cauchy–Schwarz on the symmetric tensors of the row and column forms.

For the chord put $`p(t)=\mathop{\mathrm{per}}(J+tB)/d_n`$. In the gapped case the same signed asymptotic gives strict radial convexity on $`[0,1]`$ by Cauchy estimates on a slightly larger complex disk and $`[\det(I-t^2B^TB)^{-1/2}]''\ge\|B\|_F^2`$. For small positive Frobenius norm use [local strict convexity](../nov20-independent/inequalities/uniform_radial_permanent.md). If $`s\to1`$, the uniform coefficient estimate gives $`|p(t)-1|\le C_{K,\eta}t^2`$ for $`0\le t\le1-\eta`$ (choose $`1<R<1/(1-\eta)`$ in that estimate). Meanwhile (1) gives $`p(1)\to\infty`$. Then $`p(t)<1+t(p(1)-1)`$ on the entire stated punctured interval. This covers all sequences and proves the second assertion. No comparison uniform as $`K\to\infty`$ follows.

The [exact arithmetic replay](verify_dense_spectral.py) checks the tree determinant formula on 40 weighted graphs (including disconnected ones), all 36 occupancy coefficients of a non-symmetric three-class stochastic kernel, the reconstructed full seven-site Gaussian permanent, and all 25 feasible contingency tables for unequal row and column margins. These checks exercise identities in the proof. The uniform estimates and all-order quantifiers follow from the argument above.
