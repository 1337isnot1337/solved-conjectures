# Ellzey’s conjecture: independence number two

**Partial result.** Every circular indifference digraph whose underlying graph has independence number at most two has a coefficientwise elementary-positive chromatic quasisymmetric function. More generally this holds for digraphs all of whose induced subdigraphs have symmetric chromatic quasisymmetric functions, under the same independence-number hypothesis. This includes the induced-forbidden class of Ellzey’s Theorem 5.5. This proof does not establish elementary unimodality for this class, or the full positivity assertion for higher independence number. Priority of the circular $q$-result is not claimed.

Let $G$ be an $n$-vertex digraph with symmetric chromatic quasisymmetric functions for all induced subdigraphs, with $M$ arcs, $q=v^2$, and independence number $D$. Circular indifference digraphs have this property by Ellzey's Lemma 5.6 and Theorem 5.5. Use the squarefree version of the [circular quantum-torus reduction](quantum-torus-reduction.md):
$$
 [e_\lambda]X_G(x;v^2)=v^M[X_u]m_\lambda(Y),
 \qquad e_i(Y)=E_i=\sum_{I\text{ independent},\,|I|=i}X_{\sum_{a\in I}\mathbf e_a}.
$$
Here $u=\sum_{a\in V(G)}\mathbf e_a$. The commuting $E_i$ define an evaluation of symmetric polynomials on $D$ formal variables, so partitions with more than $D$ parts vanish on the right.

For any induced subdigraph $G[S]$, with $|S|=d\ge1$, the squarefree $S$-monomial coefficient of $p_d(Y)=m_{(d)}(Y)$ in the original graph alphabet is the same as when computed with the graph alphabet of $G[S]$: setting all vertices outside $S$ to zero in nonnegative-coordinate monomials gives the latter alphabet. The hereditary assumption makes the same construction applicable to $G[S]$. Applying the coefficient identity to $G[S]$ gives
$$
 [X_{\sum_{a\in S}\mathbf e_a}]p_d(Y)
 =v^{-M_S}[e_d]X_{G[S]}(x;v^2),
$$
where $M_S$ is the number of arcs internal to $S$. The right side is a Laurent polynomial with nonnegative coefficients by Ellzey's [Corollary 6.6](https://arxiv.org/abs/1709.00454), which expresses $[e_d]X$ by weighted acyclic orientations of the underlying graph with one sink.

If $D=2$, for $a>b\ge1$ one has in two commuting variables
$$
 m_{(a,b)}=e_2^b p_{a-b},\qquad m_{(b,b)}=e_2^b.
$$
On evaluation, $E_2^b$ has only nonnegative Laurent coefficients in the torus basis. The product coefficient at $X_u$ can involve only squarefree terms of $p_{a-b}(Y)$ with support disjoint from the chosen independent pairs, since every exponent in either factor has nonnegative vertex coordinates. Each of these terms has nonnegative coefficients by the previous paragraph. Torus multiplication merely shifts its exponent of $v$. Thus the $e_{(a,b)}$ coefficient of $X_G$ has nonnegative Laurent coefficients in $v$; as the original symmetric function is polynomial in $q=v^2$ and the elementary basis is independent, only nonnegative even degrees in $v$ can remain. Length-one partitions were covered by the same sink formula. If $D=1$ there are only those length-one partitions.

More explicitly, for $a>b$ this gives a nonnegative count over an ordered list of $b$ disjoint independent pairs, a set $S$ of $a-b$ unused vertices, and a unique-sink acyclic orientation of $G[S]$. The exponent of $q$ is the number of forward arcs between distinct blocks in their order, plus the number of arcs agreeing with the acyclic orientation inside $S$. Indeed, the cross-block contribution of the torus exponent is the number of forward arcs minus the number of backward arcs; multiplying by $v^{M-M_S}$ converts it to twice the number of forward arcs. For $a=b$ omit the residual set and orientation. This also shows why no negative or odd exponents occur.

The same reasoning proves a coefficientwise result for any independence number $D$: $[e_\lambda]X_G$ is nonnegative when $\lambda=(a,b,\ldots,b)$ has length $D$ with $a\ge b\ge1$. Replace the independent pairs by independent $D$-sets and use $m_{(a,b^{D-1})}=e_D^b p_{a-b}$ for $a>b$, while $m_{(b^D)}=e_D^b$. The reduction uses Ellzey's two-color path/cycle analysis and an extension of the unit interval quantum-torus extraction to circular digraphs. The ordinary $q=1$ co-triangle-free positivity goes back to Stanley; the associated abelian natural unit interval case at formal $q$ is established in prior work. The claim here concerns the circular directed class, not a new proof of those earlier results.

