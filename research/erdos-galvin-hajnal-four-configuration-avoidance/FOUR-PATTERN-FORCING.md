# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

**Candidate answer:** independent of ZFC, relative to the consistency of ZFC. This is the exact [1975 Problem 9/C, p. 482](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=58), on $\omega_1$, not on a larger vertex set or for separate avoidance. The earlier [working note](SHADOW-AND-LIFT.md) proves the negative direction using the rainbow model and gives an earlier three-configuration construction. The following small forcing gives a single witness omitting all four.

## Conditions

For a hypergraph $H$ let $\partial H$ be its graph of pairs contained in hyperedges. Say that a finite triple system $H$ on a set of ordinals has the two properties:

1. **Bottom pairs.** If distinct triples share a pair, it is the pair of the two lowest vertices of both triples.
2. **Complete triangle shadow.** Every triangle of $\partial H$ is an edge of $H$.

A condition $p=(s_p,H_p,b_p)$ consists of a finite subset $s_p$ of $\omega_1$, a triple system $H_p\subseteq[s_p]^3$ with these properties, and a bound function $b_p$ on $s_p$. At zero put $b_p(0)=0$ if needed; at every positive $v\in s_p$, require $b_p(v)<v$. Every pair $u<v$ in $\partial H_p$ must satisfy $b_p(v)\le u$.

Extensions enlarge the vertex set, extend the bound function, and preserve the hypergraph induced on old vertices: $q\le p$ iff $s_p\subseteq s_q$, $b_p\subseteq b_q$, and $H_q\cap[s_p]^3=H_p$. To add a new vertex one may add it isolated with any eligible bound. The poset has size $\aleph_1$.

## Free union lemma

Suppose finitely many conditions have supports with a common pairwise intersection $R$, and every vertex in $R$ is below every vertex in their disjoint petals. Suppose their bounds, their triples on $R$, and **their shadow pairs on $R$** all agree. Let $u$ be their union (take the union of hyperedges, not their triangle closure). Then $u$ is a common extension.

For the bottom-pair property, if a pair is shared by edges drawn from different conditions, the pair lies in $R$. If either edge is entirely in $R$, then it belongs to both relevant conditions and the property follows there. Otherwise both third vertices are above $R$, so the pair is the bottom pair of both. For the shadow property, no shadow edge joins different petals. A triangle therefore lies inside one support; each of its pairs contained in $R$ is already in the shadow of that condition by the agreement assumption, and every other pair is there because its petal endpoint occurs in only one support. Thus the triangle was already one of its triples. Bounds are preserved. No new triple lies wholly in any old support since the conditions agree on root triples.

By the finite $\Delta$-system lemma, any uncountable collection of conditions has an uncountable subcollection with root $R$. Disjointness of petals and countability of the ordinal segment up to $\max R$ allow all remaining petals to be put above $R$. There are only countably many possible bounds on $R$ and finitely many possible root triples and shadow pairs. Thin to simultaneous agreement. The free union lemma therefore gives precaliber $\aleph_1$, in particular the countable chain condition.

One further extension operation will be used. Suppose there are three conditions as in the lemma, and $x_i$ is in the petal of condition $i$ for $i=0,1,2$. Suppose additionally that each $x_i$ is isolated **from the root** in its own shadow, and $\max_i b(x_i)<\min_i x_i$. Add the triple $`\{x_0,x_1,x_2\}`$ to the free union. All three of its pairs are new, so the bottom-pair property is unaffected. Any new shadow triangle contains a new pair $x_ix_j$. A third vertex in $R$ cannot join this pair, by root isolation. A third vertex outside $R$ can have a cross-petal adjacency to a marked point only by being one of the other marked points. Thus the only new shadow triangle is the added triple. Bounds hold for all of its pairs. The triple is not contained in any of the three supports, so this is still a common extension.

## Double pressing down defeats a countable coloring

Suppose a condition $p$ forces that $\dot f:\omega_1\to\omega$ properly colors the generic triple system. Fix a club on which all finite subsets of any point have codes below that point, using a fixed injection from $[\omega_1]^{<\omega}$ to $\omega_1$. We work at limit ordinals of this club above all of $s_p$.

For each eligible $h$ and each eligible $x>h$, add $x$ isolated with bound $h$, and choose an extension $q_{h,x}\le p$ of this condition deciding $\dot f(x)$. Keep the chosen bound $b_{q_{h,x}}(x)=h$ throughout.

Fix $h$. Press down the finite set $s_{q_{h,x}}\cap x$ as $x$ varies. On a stationary set $X_h$ it is a fixed finite set $R_h$. Put $U_h=R_h\cap h$. Thin $X_h$ to make the natural number $n_h$ forced for $\dot f(x)$, the bounds on $U_h$, the hyperedges on $U_h$, and the shadow on $U_h$ fixed. Only countably many choices occur, because all root bounds are below the fixed countable root ordinals. These profile values refer to the full finite conditions, even when the third point witnessing a shadow pair is outside $U_h$.

Now press down $U_h\subset h$ as $h$ varies. On a stationary set of $h$ it is the same finite set $R$. Thin again so that the profile on $R$ and the color $n_h=n$ agree for all those $h$.

Choose $h_0<h_1<h_2$ from this set, each higher than every point of the previous $R_{h_i}$. The finite sets $R_{h_i}\setminus R$ are pairwise disjoint, since each lies above or at its own $h_i$. Next choose $x_i\in X_{h_i}$ successively: all three are above all $h_j$ and all $R_{h_j}$, and each successive $x_i$ is above the entire support of the previously chosen conditions. The conditions $q_i=q_{h_i,x_i}$ then have pairwise intersection exactly $R$: their parts below $x_i$ are $R_{h_i}$ and their parts at or above $x_i$ are disjoint high tails. All points of $R$ are below all petal points. No order restriction between the entire petals is needed.

Each marked $x_i$ has no neighbor in $R$ because $R<h_i=b_{q_i}(x_i)$. Also all marked points are above all three bounds. Apply the further extension operation to these three conditions. Its result forces a triple whose three vertices all have color $n$, contrary to $p$.

## All four exclusions and independence

Every vertex can be added, and finite sets of generic edges are witnessed in a common condition. Thus the generic hypergraph on $\omega_1$ has both bottom pairs and complete triangle shadow. Its chromatic number is $\aleph_1$ by the preceding argument and ccc preservation of $\omega_1$.

* In $\mathcal T_3$ and $\mathcal T_4$, some triple has two different pairs that each belong to another triple. This violates the bottom-pair property.
* For $\mathcal T_1$, the three distinct pairwise intersections span a triangle in the shadow, so they form an edge. This edge shares a different pair with each of the three original edges, which again violates the bottom-pair property.
* In $`\mathcal T_9=\{abx,aby,xyz\}`$, the four vertices $a,b,x,y$ span a $K_4$ in the shadow. The shadow property would make all four of its triples edges, which already contains $\mathcal T_3$.

The positive forcing starts from any ZFC ground. If the ground satisfies CH it preserves CH, since the ccc forcing has size $\aleph_1$ and there are at most $(\aleph_1)^{\aleph_0}=\aleph_1$ nice names for reals. For the other direction, the [rainbow model](https://doi.org/10.1090/S0002-9947-1983-0716846-0) plus the [link-path encoding](https://github.com/1337isnot1337/solved-conjectures/pull/1047) already forces that every $\mathcal T_4$-free triple system on $\omega_1$ is countably chromatic. No large cardinals enter either direction.

The bound clauses resemble the finite forcing in [Komjáth–Shelah (1988), Theorem 3](https://shelah.logic.at/files/95727/303.pdf#page=6). Here the critical invariant is simultaneous control of root *shadows*, and the double pressing-down step separates the finite middles and high tails while leaving the marked vertices above all bounds. The construction does not use the old three-pattern lift, which could produce a loose triangle.
