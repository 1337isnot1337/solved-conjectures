# A limitation of the original fibre construction

**Proposition.** Let $`\kappa`$ be any infinite cardinal, and write the vertices of a triple system $`H`$ as disjoint fibres $`V_t`$ over a tree $`T`$ of height at most $`\kappa^+`$. Suppose that:
1. Every triple has a base of two vertices in $`V_s`$ and a page in $`V_t`$, for $`s<_T t`$.
2. For fixed $`s<_T t`$, at most $`\kappa`$ distinct bases in $`V_s`$ have any page in $`V_t`$.
3. $`H`$ omits $`T_9=\{abx,aby,xyz\}`$ on five distinct vertices, noninduced.

Then $`\chi(H)\le\kappa`$, regardless of the sizes of the fibres or of the levels.

For $`t\in T`$, let $`B_t`$ be the graph on $`V_t`$ consisting of the pairs actually used as bases in $`H`$. For any lower base $`e\subseteq V_s`$ with $`s<_T t`$, let $`P(e,t)=\{x\in V_t:e\cup\{x\}\in H\}`$. Each $`P(e,t)`$ is independent in $`B_t`$. Indeed, if $`x,y\in P(e,t)`$ form a base in $`V_t`$, there is a page $`z`$ of that base in a strictly higher fibre. The triples $`e+x,e+y,xyz`$ give $`T_9`$; $`z`$ cannot be in the lower base or equal either of $`x,y`$.

Every node $`t`$ has at most $`\kappa`$ predecessors, so by condition 2 at most $`\kappa`$ page sets cover the vertices of $`V_t`$ that ever occur as pages. Enumerate these independent sets separately at each fibre using a common palette of size $`\kappa`$. Give each page vertex a colour for an independent set containing it, and give every non-page vertex a reserved colour. For any triple its page has an ordinary colour. Its base either includes a reserved-colour vertex or consists of two page vertices of different ordinary colours, since they are adjacent in $`B_s`$. In either case the triple is not monochromatic.

The historical construction in [EGH 1975, Lemma 11.5 and Theorem 11.6, printed pp. 475–477](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=52) has just one candidate lower base per predecessor fibre for each upper fibre: the upper sequence determines the lower pair. Consequently simply pruning its page sets cannot add $`T_9`$-avoidance while retaining $`\aleph_1`$-chromaticity. The direct CH proof on the tree of [PR #1082](https://github.com/1337isnot1337/solved-conjectures/pull/1082) does not fall under this obstruction: its selected triples are supported on paths through three different tree nodes, not by two vertices in one fibre and a page in a higher fibre.

This is a construction-class obstruction, not a resolution of any separate numbered problem. It explains why forbidding the remaining configuration by thinning the original $`T_1,T_3,T_4,T_8`$-free construction is not viable as it stands.
