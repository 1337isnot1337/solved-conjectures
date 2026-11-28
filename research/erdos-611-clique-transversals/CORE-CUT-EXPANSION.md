# Cut expansion of a two-sided core

This note strengthens the [two-sided connectivity reduction](TWO-SIDED-CONNECTIVITY.md) for [Erdős #611](https://www.erdosproblems.com/611). It gives a cut-limit restriction without assuming that sparse edge cuts are vertex separators.

Let $H$ be a graph and let $F=\overline H$. Write $i=i(H)$ for the minimum size of a maximal independent set of $H$, equivalently the minimum size of a maximal clique of $F$. For any partition $A,B$ of $V(F)$, write $e=e_F(A,B)$. Then
```math
e\ \ge\ \frac i2\min\bigl\{|A|,|B|,\kappa(F)\bigr\}.
```

**Proof.** Every crossing edge $uv$ with $u\in A$ and $v\in B$ extends to a maximal clique $K$ of $F$. Its vertices in $A$ are cross-neighbors of $v$ and its vertices in $B$ are cross-neighbors of $u$, so
```math
d_{F,B}(u)+d_{F,A}(v)\ge |K|\ge i.
```
Sum this over a maximum matching of the bipartite cut graph. The matched endpoints are distinct, so the left side counts each crossing edge at most twice. The matching therefore has size at most $2e/i$. By König's theorem there is a vertex cover of the cut of that size. Unless it exhausts a side, it is a vertex separator of $F$. The inequality follows.

Thus when $i(H)\ge c|H|$ and $\kappa(\overline H)\ge \delta |H|$, the complement has at least $c\min(\delta,\rho)|H|^2/2$ edges across every cut with both sides of size at least $\rho |H|$. Every cut-metric limit of such complements is connected, in the graphon sense, with the same quantitative lower bound on cuts of side measures at least $\rho$. For the passage to graphons, a measurable cut that splits finitely many vertex cells can be rounded by assigning each vertex independently in accordance with the fraction of its cell in one side. The expected cross count is the graphon integral times $|H|^2$, and size and cross count concentrate at scale $o(|H|)$ and $o(|H|^2)$ respectively, by bounded differences. Then pass to the cut limit. This argument only concerns the complement; vertex connectivity alone does not give an analogous graphon conclusion for $H$.

For comparison, a transversal of one induced part can be lifted even across a nonempty cut. If $T$ hits every maximal independent set of $H[A]$, then $T\cup N_H(T)\cap B$ hits every maximal independent set of $H$. Otherwise such a maximal set $I$ avoiding the union must dominate every vertex of $T$ from $I\cap A$. Extending $I\cap A$ to a maximal independent set of $H[A]$ could then add no vertex of $T$, a contradiction. Equivalently
```math
\tau(H)\ \le\ \min_{T}\left(|T|+\left|N_H(T)\cap B\right|\right),
```
where the minimum is over the transversals of $H[A]$. No general bound on that weighted cost is asserted here.

The cut estimate uses only maximal-clique extension and the classical matching-cover theorem. Searches for the minimum-maximal-clique condition and cut expansion under Erdős–Gallai–Tuza's clique-transversal hypothesis did not locate this application. The original conjecture remains open. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
