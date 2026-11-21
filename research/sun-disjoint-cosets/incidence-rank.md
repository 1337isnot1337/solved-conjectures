# An incidence-rank obstruction to disjoint cosets

Let $H_1,\dots,H_k$ be finite-index subgroups of a group, $k\ge2$. Pass to the finite quotient by the common normal core. For fixed $i$, make a matrix whose rows are the left cosets of $H_i$ and whose columns are all the left cosets of every $H_j$ with $j\ne i$. Put the cardinality of the intersection in each entry, and call the real rank $r_i$. If one coset of each subgroup can be chosen pairwise disjoint, then
$$
\sum_i\frac1{r_i}\le1.
$$
The same test applies to any subfamily after recomputing its ranks. It only requires the subgroups, so it can exclude every choice of representatives at once.

**Proof.** Use the counting inner product on functions on the finite group $G$. Let $V_i$ be the span of the coset indicators of $H_i$, $W_i=\sum_{j\ne i}V_j$, and $U_i=V_i\cap W_i^\perp$. The incidence matrix is the matrix of pairings of the spanning coset indicators. Its left kernel identifies with $U_i$, since the row indicators are linearly independent. Consequently the orthogonal complement of $U_i$ inside $V_i$ has dimension $r_i$. Denote projection onto that complement by $P_i$.

The normalized indicators of all $n_i=[G:H_i]$ cosets of $H_i$ form an orthonormal basis of $V_i$. Left translation permutes the basis transitively and preserves $U_i$ and $V_i$. The squared norm of $P_i e$ is therefore the same for each basis vector $e$. Its sum over the basis is the trace $r_i$, so each squared norm equals $r_i/n_i$.

Choose normalized indicators $e_i$ of the given disjoint cosets. They are orthogonal. Replacing $e_i$ by $P_i e_i$ preserves all off-diagonal inner products: the discarded vector is in $U_i$ and is orthogonal to every $V_j$ for $j\ne i$. It also preserves the inner product with the unit constant function, since constants lie in every $V_j$. For $e_i$ this inner product is $1/\sqrt{n_i}$. Thus after normalizing the projected vectors we have an orthonormal family with constant-function coefficients $1/\sqrt{r_i}$. Bessel's inequality gives the claim.

## Pairwise permutable subgroups

If $H_iH_j=H_jH_i$ for all pairs, the projections onto $V_i$ commute. Indeed the projection averages over right multiplication by $H_i$, and the product of two averages is the average over the subgroup $H_iH_j$. The multiplication map $H_i\times H_j\to H_iH_j$ has constant fiber size $|H_i\cap H_j|$. Simultaneous diagonalization therefore gives an explicit rank formula
$$
r_i=\sum_{\varnothing\ne J\subseteq\{1,\ldots,k\}\setminus\{i\}}
 (-1)^{|J|+1}\,[G:\langle H_i,H_j\ (j\in J)\rangle].
$$
In fact $r_i$ counts the common eigenbasis vectors lying in $V_i$ and at least one other $V_j$. Counting the union gives the formula. The index in each summand is the dimension of the corresponding intersection of invariant subspaces.

As a consequence Sun's exact inequality holds for this group setting whenever, for all but at most one $i$, the list of products $\{H_iH_j:j\ne i\}$ has a least member under inclusion. For any such $i$ the union of the relevant eigenvectors has size $[G:H_iH_j]$ for the least member. This index divides both subgroup indices and is at most the largest pairwise gcd $D$. If all $r_i\le D$, the reciprocal inequality yields $k\le D$. If there is one exception, the other $k-1$ terms contribute at least $(k-1)/D$ and the exceptional term is positive. The condition permits arbitrarily many prime divisors in the indices.

## Integer progressions

For cyclic $G$, passing to a common period, characters form a simultaneous eigenbasis. The order of a character fixed by $H_i$ divides $n_i$. There are $\varphi(t)$ characters of each order $t$ dividing the period. Hence
$$
r_i=\sum_{\substack{t\mid n_i\\t\mid n_j\ {\rm for\ some}\ j\ne i}}\varphi(t).
$$
Writing $M$ for the lcm of all pairwise gcds, these orders divide $\gcd(n_i,M)$. Thus $r_i\le\gcd(n_i,M)$ and the rank bound implies the classical reciprocal bound of Huhn and Megyesi in O'Bryant's Lemma 5. [O'Bryant, §2](https://arxiv.org/abs/math/0604347)

The implication can be strict even if every classical subfamily test is used. For $(4,4,6,12,18,18,18,18)$ the classical sum is $35/36$ and its maximum over subfamilies of size at least two is $1$. The ranks are $(4,4,6,8,18,18,18,18)$, giving $73/72$. For O'Bryant's seven-index example $(20,15,12,6,6,6,6)$ the rank test gives $89/84$ directly. Conversely, Sun's known infeasible tuple $(10,15,36,42,66)$ passes every rank test. These observations leave the full conjecture open. The [exact checker](character_bound.py) recomputes the ranks and both bounds for every subfamily of the three examples.
