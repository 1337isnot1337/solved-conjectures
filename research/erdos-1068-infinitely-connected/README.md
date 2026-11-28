# Erdős #1068: countable infinitely connected subgraphs

Tracking issue: #1118.

**Problem ([Erdős #1068](https://www.erdosproblems.com/1068), [Va99, 7.90]).** Does every graph with chromatic number $`\aleph_1`$ contain a countable subgraph that is infinitely vertex-connected?

A graph is *infinitely connected* if every two of its vertices are joined by infinitely many internally disjoint paths. Bowler and Pitz (arXiv:2402.05984, Remark (3)) list the question as open: "Does every uncountably chromatic graph have a countably infinite, infinitely connected subgraph?"

**Status of this file: research notes, no resolution.** The lemmas below are proved. They reduce the problem and isolate a sufficient condition for a counterexample. No counterexample or proof has been found yet.

## Screening (2026-11-28)

- erdosproblems.com lists #1068 as open, with no forum posts and no proof claims (database snapshot of 2026-11-24).
- Soukup (2015) and Bowler–Pitz (2024) give ZFC uncountably chromatic graphs with no *uncountable* infinitely connected subgraph. That answers #1067, not #1068. Both graphs contain countable complete graphs $`K_\omega`$: Bowler–Pitz's proof of uncountable chromatic number builds one explicitly.
- Komjáth (*Israel J. Math.* 61 (1988) 285–294) proved that under PFA every graph of size and chromatic number $`\aleph_1`$ contains an uncountably chromatic $`\omega`$-connected subgraph. By Lemma 1 below, such a graph then also has a countable infinitely connected subgraph. So under PFA there is no counterexample of size $`\aleph_1`$. Hence, if PFA is consistent (for example, relative to a supercompact cardinal), ZFC cannot prove that a counterexample of size $`\aleph_1`$ exists; such a counterexample can at best be consistent, for instance under $`\diamondsuit`$. Komjáth's forced example of size $`\aleph_1`$ (corrected in his later note) excludes only *uncountable* $`\omega`$-connected subgraphs. He also proved that every uncountably chromatic graph has uncountably chromatic $`n`$-connected subgraphs of minimum degree $`\omega`$ for every finite $`n`$.
- Soukup (arXiv:1409.2922, final section) states this exact question as open: "excluding countable $`\omega`$-connected subsets seems to be a very hard problem." His Proposition on transitive ladder systems shows that transitive ladders with uncountable chromatic number force a monochromatic $`K_{\omega+1}`$, which agrees with Lemma 8 below.
- Bowler–Pitz, *Thin ends and topological spanning trees* (arXiv:2610.40458, Oct 2026), re-uses their graph for spanning-tree questions and does not address #1068.
- No issue, PR or file in this repository on either branch matches.

## Lemma 1 (reflection)

> If a graph $`G`$ has an infinitely connected subgraph $`H`$ with at least two vertices, then it has a countably infinite one.

*Proof.* Let $`M\prec H(\theta)`$ be a countable elementary submodel containing $`G`$ and $`H`$, with $`\theta`$ large. Put $`H_0=H[V(H)\cap M]`$. For $`x,y\in V(H)\cap M`$ the statement "there are infinitely many internally disjoint $`x`$–$`y`$ paths in $`H`$" holds, so by elementarity $`M`$ contains an injective sequence $`\langle P_n:n<\omega\rangle`$ of such paths. Each $`P_n`$ is a finite object in $`M`$, so its vertices lie in $`M`$, and the $`P_n`$ are paths of $`H_0`$. Hence $`H_0`$ is infinitely connected. It is infinite because a vertex of an infinitely connected graph with two or more vertices has infinite degree (Lemma 2), and $`M`$ contains infinitely many neighbours of each of its vertices. $`\square`$

So #1068 is equivalent to: *does every uncountably chromatic graph contain an infinitely connected subgraph with at least two vertices (of any size)?* The countability in the question costs nothing.

## Lemma 2 (degree)

> In an infinitely connected graph $`H`$ with $`\lvert H\rvert\ge 2`$, every vertex has infinite degree.

*Proof.* Fix $`x\ne y`$. Infinitely many internally disjoint $`x`$–$`y`$ paths have pairwise distinct second vertices, all neighbours of $`x`$. $`\square`$

Consequence: if every subgraph of $`G`$ has a vertex of finite degree in that subgraph, then $`G`$ has no infinitely connected subgraph.

## Lemma 3 (a sufficient condition for a counterexample)

Call $`G`$ a *$`T`$-graph* if $`V(G)`$ is a tree $`(T,\le)`$ in which every chain is well-ordered, and every edge joins two comparable nodes.

> Let $`G`$ be a $`T`$-graph such that
> 1. (finite adhesion) any two incomparable nodes are separated in $`G`$ by a finite set; and
> 2. (finite upward degree along chains) for every node $`u`$ and every chain $`C\ni u`$, only finitely many $`t\in C`$ with $`t>u`$ are adjacent to $`u`$.
>
> Then $`G`$ has no infinitely connected subgraph with two or more vertices.

*Proof.* Let $`H`$ be an infinitely connected subgraph. Two incomparable nodes are finitely connected in $`G`$, hence in $`H`$, so $`V(H)`$ is a chain. A chain is well-ordered, so $`V(H)`$ has a least element $`m`$. Every $`H`$-neighbour of $`m`$ lies above $`m`$ in the chain $`V(H)`$, so by (2) $`m`$ has finite degree in $`H`$. That contradicts Lemma 2 unless $`\lvert H\rvert\le 1`$. $`\square`$

So a ZFC graph with $`\chi=\aleph_1`$ satisfying (1) and (2) would answer #1068 negatively.

The Bowler–Pitz graph $`\mathbf G`$ satisfies (1); this is their main lemma. It fails (2). For a successor node $`s`$, the set of $`t\ge s`$ on a branch $`b`$ with $`s\in A_t`$ is an initial segment of $`b`$ above $`s`$, and it is typically infinite. Their colouring argument uses exactly this: it builds $`t''_0<t''_1<\cdots`$ on one branch, pairwise adjacent.

Any subgraph of $`\mathbf G`$ keeps (1), because a finite separator in $`\mathbf G`$ is a separator in every subgraph. So the question is whether edges of $`\mathbf G`$ can be thinned to satisfy (2) while keeping $`\chi=\aleph_1`$.

### Attempt A: bounding the ordinal length of the upper endpoint

Keep the edge $`\{s^\star,t\}`$ only when $`\mathop{\mathrm{dom}}(t)-\mathop{\mathrm{dom}}(s)\in D(s)`$, for a finite set $`D(s)`$ of ordinals. Property (2) then holds, since a branch has at most one node of each length.

- The first half of the Bowler–Pitz argument survives. Take $`D(s)\supseteq\{\omega\cdot j:1\le j\le\mathop{\mathrm{last}}(s)\}`$, and run their Claim only over 1-extensions $`t''`$ with $`\mathop{\mathrm{dom}}(t'')=\mathop{\mathrm{dom}}(t')+\omega`$. Then $`\mathop{\mathrm{dom}}(t''_n)-\mathop{\mathrm{dom}}(t'_{m+1})=\omega\cdot(n-m)`$. The skipped values $`a_m`$ are strictly increasing, so $`\{t''_K,\dots,t''_{2K}\}`$ is a clique for every $`K`$, and bounded colours give a contradiction. The Claim's output extension has length difference in $`\{0\}\cup\{\omega\cdot j+1:j\ge1\}`$.
- The second half fails. The limit $`\hat t=\bigcup_n t_n`$ must be a 1-extension of each Claim output $`t'_n`$ of an allowed length. If infinitely many outputs have infinite length difference, then $`\mathop{\mathrm{dom}}(\hat t)-\mathop{\mathrm{dom}}(t'_n)=\omega^2`$ for every $`n`$. Adding $`\omega^2`$ to the allowed lengths lets the adversary choose $`\omega^2`$-long 1-extensions in the first half, which produces tails of length $`\omega^3`$, and so on. The set of lengths needed is not closed below any countable bound that a finite $`D(s)`$ can follow.

### Attempt B: bounding the last value of the upper endpoint

Keep $`\{s^\star,t\}`$ only when $`t`$ has successor length and $`\mathop{\mathrm{last}}(t)\le F(s)`$. Property (2) holds because a branch is one injective sequence, so only finitely many of its nodes have last value at most $`F(s)`$.

This fails for a different reason. The second half needs edges into Claim outputs $`t'_{n}`$, whose last values are not controlled. It also needs the Claim to apply to the limit node $`\hat t`$, which has no last value.

## Lemma 4 (ladder obstructions have an infinite-degree kernel)

The Bowler–Carmesin–Komjáth–Reiher theorem (arXiv:1512.02911) says that $`\mathop{\mathrm{Col}}(G)>\aleph_0`$ if and only if $`G`$ contains a type I or type II $`\aleph_0`$-obstruction. Since $`\chi\le\mathop{\mathrm{Col}}`$, every uncountably chromatic graph contains one. For a type II obstruction (a stationary ladder system $`\langle L_\alpha:\alpha\in S\rangle`$ on a regular $`\kappa`$):

> Let $`R^\ast=\{\beta: U_\beta\cap S \text{ is stationary}\}`$, where $`U_\beta=\{\alpha\in S:\beta\in L_\alpha\}`$, and let $`S^\ast=\{\alpha\in S:\lvert L_\alpha\cap R^\ast\rvert=\aleph_0\}`$. Then $`S\setminus S^\ast`$ is nonstationary. In the ladder graph, every vertex of $`S^\ast\cup R^\ast`$ has infinitely many neighbours in $`S^\ast\cup R^\ast`$.

*Proof.* Suppose $`S\setminus S^\ast`$ is stationary. Fodor's lemma gives a stationary $`T\subseteq S\setminus S^\ast`$ and a $`\gamma`$ with $`L_\alpha\cap R^\ast\subseteq\gamma`$ for $`\alpha\in T`$. A second application gives a stationary $`T'\subseteq T`$ on which the least element of $`L_\alpha`$ above $`\gamma`$ is a constant $`\beta`$. Then $`U_\beta\supseteq T'`$ is stationary, so $`\beta\in R^\ast`$, but $`\beta\ge\gamma`$, which is a contradiction. For the second statement: each $`\alpha\in S^\ast`$ has the infinite set $`L_\alpha\cap R^\ast`$ of neighbours. Each $`\beta\in R^\ast`$ has the stationary, hence infinite, set $`U_\beta\cap S^\ast`$ of neighbours. $`\square`$

So stationary ladders always contain a subgraph of infinite minimum degree, and Lemma 2 gives no obstruction there. A ladder graph alone can be countably chromatic, for example under $`\mathrm{MA}_{\aleph_1}`$ (Hajnal–Máté), so a positive answer has to use $`\chi>\aleph_0`$ and not only $`\mathop{\mathrm{Col}}>\aleph_0`$. For the same reason, Lemma 3 asks for $`\chi=\aleph_1`$ and not just an obstruction.

## A sufficient positive structure

A countable bipartite graph with parts $`B`$ and $`A`$ is infinitely connected if (i) every two vertices of $`B`$ have infinitely many common neighbours in $`A`$, and (ii) every vertex of $`A`$ has infinitely many neighbours in $`B`$.

*Proof sketch.* For $`b,b'\in B`$, use length-2 paths. For $`a\in A`$ and $`b\in B`$, pair distinct $`B`$-neighbours $`u_n`$ of $`a`$ with fresh common neighbours of $`u_n`$ and $`b`$. For $`a,a'\in A`$, pair distinct $`B`$-neighbours $`u_n`$ of $`a`$ and $`u'_n`$ of $`a'`$, and join each pair through a fresh common neighbour.

$`K_{\aleph_0,\aleph_0}`$ is the trivial instance. Uncountably chromatic graphs need not contain $`K_{\aleph_0,\aleph_0}`$, so (i)+(ii) is the structure to look for in a positive proof.

## Lemma 5 (one chain is never enough)

> Let $`G`$ be a graph on $`\omega_1`$ in which every vertex has only finitely many neighbours above it. Then $`G`$ has no edge between $`M\cap\omega_1`$ and $`\omega_1\setminus M`$ for any countable $`M\prec H(\theta)`$ containing $`G`$. In particular $`\chi(G)\le\aleph_0`$.

*Proof.* Let $`u\in M`$. Its finite set $`U(u)`$ of upper neighbours is definable from $`u`$, so $`U(u)\in M`$, and finite sets in $`M`$ are subsets of $`M`$. A vertex $`v\notin M`$ adjacent to $`u\in M`$ would satisfy $`v>u`$ (since $`M\cap\omega_1`$ is an initial segment), so $`v\in U(u)\subseteq M`$, which is absurd. A continuous chain of such models splits $`G`$ into countable pieces with no edges between them, and each piece can be coloured separately. $`\square`$

So condition (2) of Lemma 3 can only coexist with $`\chi=\aleph_1`$ if the tree branches: the upward neighbourhood of a node, taken over all branches at once, has to be infinite.

## Obstacle met in constructions (heuristic, not a theorem)

I tried two ways of building ladders $`C_t\subseteq A^\ast_t`$ inside the Bowler–Pitz tree with "each point is used by at most one ladder per branch": Soukup's ZFC diagonalisation over all pairs $`(A,f)`$, and $`\diamondsuit`$-guessing. Both run into the same problem. The colouring argument reflects a property of the template node $`t`$, the node whose colour must match a ladder point. But $`t`$ is itself a user of every earlier ladder point on its branch. A requirement satisfied by $`t`$ therefore cannot forbid the next chosen point from also being a user of an earlier point, and that second use is what (2) has to exclude. Budget variants, which allow $`B`$ users per branch, fail by exactly one: the template's own use.

A related observation for stage-by-stage ZFC constructions: if "$`u`$ is used as a ladder point" is decided in the final graph and $`M`$ contains the graph, then the first stage at which a node $`u\in M`$ is used lies in $`M`$. So the stage $`\delta_M=M\cap\omega_1`$ can never be the first use of a node of $`M`$. Any "use each point at one stage only" rule therefore starves the reflection step.

## Lemma 6 (colouring number is not enough)

Thomassen (*Combinatorica* 37 (2017) 785–793) proved the **edge**-connectivity version: every uncountably chromatic graph has an uncountably chromatic subgraph of infinite edge-connectivity. He notes that the same holds with colouring number in place of chromatic number. For **vertex** connectivity, the colouring-number version fails, by the following example.

> Let $`A=2^{<\omega}`$ be the nodes of the binary tree. Let $`B`$ be a set of $`\aleph_1`$ branches such that every node lies on $`\aleph_1`$ of them. Join a branch $`b\in B`$ to every node on $`b`$. The resulting bipartite graph $`\Gamma`$ has $`\mathop{\mathrm{Col}}(\Gamma)>\aleph_0`$, since it is a type I $`\aleph_0`$-obstruction in the sense of Bowler–Carmesin–Komjáth–Reiher. It has no infinitely connected subgraph with two or more vertices.

*Proof of the second claim.* Let $`a,a'`$ be incomparable nodes with meet $`\sigma`$. A branch through a node of the cone above $`\sigma\frown 0`$ meets only that cone and nodes $`\le\sigma`$. So the finite set $`\{\tau:\tau\le\sigma\}`$ separates $`a`$ from $`a'`$. Hence an infinitely connected subgraph $`H`$ has its nodes on one chain $`C`$. A branch with infinitely many $`H`$-neighbours must contain infinitely many nodes of $`C`$, so it is the unique branch through $`C`$. Every node of $`H`$ then has at most one branch-neighbour in $`H`$, which contradicts Lemma 2. $`\square`$

So any positive solution of #1068 must use chromatic number, not just one of the two BCKR obstructions. Lemma 4 shows the same for type II obstructions in another way.

## A sparse ladder graph can still be infinitely connected

Soukup's triangle-free example uses sparse ladder systems (no special cycles). That property alone does not exclude countable infinitely connected subgraphs. Take a single chain of height $`\omega^2+1`$ and give each limit $`\omega\cdot k`$ a ladder of successor ordinals that also contains the first $`k`$ points of every earlier $`\omega`$-block. Such ladders are automatically sparse, since successor points have no ladders of their own. The resulting bipartite graph satisfies conditions (i) and (ii) of "A sufficient positive structure" above, so it is infinitely connected.

## Forcing attempt (abandoned)

A ccc forcing with finite conditions was considered. It adds a $`T`$-graph with frozen finite "port" sets at successor nodes, which give finite adhesion, and fixed per-chain budgets, which give finite upward degree. Lemma 3 would then rule out infinitely connected subgraphs, and the usual $`\Delta`$-system amalgamation would add a monochromatic edge $`x_\xi < x_\eta`$ against any colouring name. The amalgamation works if $`x_\xi`$ has no predecessors outside the $`\Delta`$-root and no lower neighbours. It breaks in general because the extension deciding $`\dot f(x_\xi)`$ may insert frozen successor nodes below $`x_\xi`$. Merging the chains then puts frozen nodes, whose ports lack the new lower endpoint, inside the span of the new edge, or of an old edge. I found no way to stop deciding extensions from doing this without making every chain finite, and finite chains force $`\chi\le\aleph_0`$.

## Lemma 7 (one vertex never creates infinite connectivity)

> If $`G-v`$ has no infinitely connected subgraph with two or more vertices, then neither has $`G`$.

*Proof.* Let $`H\ni v`$ be infinitely connected with $`\lvert H\rvert\ge2`$. For $`x\ne y`$ in $`H-v`$, at most one of the infinitely many internally disjoint $`x`$–$`y`$ paths in $`H`$ passes through $`v`$, so $`H-v`$ is infinitely connected. It has at least two vertices because $`v`$ has infinite degree in $`H`$ (Lemma 2). $`\square`$

So on a well-ordered vertex set, deleting maxima finitely often turns any infinitely connected subgraph with two or more vertices into one without a largest element. A construction along $`\omega_1`$ therefore only has to control what happens at limit stages.

## Lemma 8 (Bowler–Pitz coherence forces infinite upward degree)

Write $`N^-(u)`$ for the set of neighbours of $`u`$ below $`u`$ in a $`T`$-graph. Bowler and Pitz prove finite adhesion from the coherence property $`(\star)`$: $`N^-(u)\cap s{\downarrow}\subseteq N^-(s)`$ whenever $`s\le u`$.

> In a $`T`$-graph with this coherence, if $`t`$ has limit height and $`x\in N^-(t)`$, then $`x`$ is adjacent to every node $`s`$ with $`x<s\le t`$. In particular condition (2) of Lemma 3 fails at $`x`$.

*Proof.* For $`x<s\le t`$ we have $`x\in N^-(t)\cap s{\downarrow}\subseteq N^-(s)`$. There are infinitely many such $`s`$ on the chain below $`t`$. $`\square`$

So a counterexample through Lemma 3 needs finite adhesion from a mechanism other than coherence.

## Finite adhesion from finite ports

Give every successor node $`s`$ a finite *port* $`P(s)`$ of nodes below or equal to its parent. Allow $`x\in N^-(u)`$ only if $`x`$ is *registered at* $`u`$, meaning $`x\in P(s)`$ for every successor node $`s\le u`$ whose parent lies at or above $`x`$.

> If every lower neighbour is registered, then any two incomparable nodes are separated by a finite set.

*Proof.* Let $`t,t'`$ be incomparable with last common node $`m`$, and let $`s`$ be the child of $`m`$ below $`t`$. A $`t`$–$`t'`$ path leaves the cone above $`s`$ along an edge $`uw`$ with $`u\ge s`$ and $`w\not\ge s`$. The nodes $`u`$ and $`w`$ are comparable, so $`w<u`$, hence $`w\le m`$. Registration at $`u`$ gives $`w\in P(s)`$. So the finite set $`P(s)`$ meets every $`t`$–$`t'`$ path. $`\square`$

Registration creates no edges, so unlike coherence it is compatible with (2). Some such device is needed, because one upper neighbour per chain alone does not prevent $`K_{\aleph_0,\aleph_0}`$. Take the tree $`\sigma\mathbb Q`$ of well-ordered subsets of $`\mathbb Q`$ with a maximum. Join $`s`$ to $`t`$ when $`t`$ is the least node above $`s`$ on its branch with $`\max t>\max s+1`$. Every node then has exactly one upper neighbour on each chain. Now take nodes $`c_0<c_1<\cdots`$ whose maxima increase to $`r<\max c_0+1`$. For every rational $`q>r+1`$ the node $`u_q=\bigcup_k c_k\cup\{q\}`$ is adjacent to every $`c_k`$, so $`\{c_k\}`$ and $`\{u_q\}`$ span a $`K_{\aleph_0,\aleph_0}`$.

## Lemma 9 (ports cannot be uniform along $`\omega_1`$)

> There is no choice of a cofinal $`\omega`$-sequence $`C_\mu`$ for every countable limit $`\mu`$ such that, for every $`\alpha<\omega_1`$, the set $`F_\alpha=\bigcup_{\mu>\alpha}(C_\mu\cap(\alpha+1))`$ is finite.

*Proof.* Let $`\nu_\beta`$ be the least $`\alpha\ge\beta`$ with $`\beta\notin F_\alpha`$, or $`\omega_1`$ if there is none. If $`\beta\in C_\mu`$ then $`\beta\in F_\alpha`$ for all $`\alpha\in[\beta,\mu)`$, so $`\nu_\beta\ge\mu`$. The set $`\Omega=\{\beta:\nu_\beta=\omega_1\}`$ satisfies $`\Omega\cap(\alpha+1)\subseteq F_\alpha`$ for every $`\alpha`$, so it is finite. Let $`\mu>\max\Omega`$ be a limit closed under $`\beta\mapsto\nu_\beta`$ for $`\beta\notin\Omega`$ (a club of such $`\mu`$ exists). Then every $`\beta\in C_\mu`$ has $`\nu_\beta\ge\mu`$, so $`\beta\in\Omega`$. Hence $`C_\mu\subseteq\Omega`$ is finite, a contradiction. $`\square`$

This is the level-by-level version of Lemma 5. The ports must use the branching of the tree, as Bowler and Pitz's sets $`A_t`$ do.

## A construction reduced to one witness lemma

The following construction satisfies (1) and (2) of Lemma 3 by design. Its colouring argument fails at exactly one step.

**Tree.** Each node is a sequence $`\langle(P_\xi,M_\xi):\xi<\alpha\rangle`$ with $`\alpha<\omega_1`$ and $`M_\xi\subseteq P_\xi`$ finite sets of ordinals $`\le\xi`$, ordered by extension. The pair at position $`\xi`$ decorates the successor node of height $`\xi+1`$: $`P_\xi`$ is its port, and $`M_\xi`$ is a set of *marks*. Every port is available at every node, and a node of limit height is determined by its predecessors, so the tree is Hausdorff.

**Ladders.** For $`\sigma`$ of limit height $`\alpha`$, let $`\Lambda(\sigma)`$ be the set of $`\eta<\alpha`$ such that:
- $`\eta`$ is registered at $`\sigma`$, meaning $`\eta\in P_\xi`$ for all $`\xi\in[\eta,\alpha)`$;
- $`\eta`$ is *fresh* at $`\sigma`$, meaning $`\eta\notin\Lambda(\sigma\restriction\beta)`$ for every limit $`\beta\in(\eta,\alpha)`$;
- $`\eta`$ is marked cofinally often below $`\alpha`$.

This is a recursive definition. Then $`\sigma`$ is joined to $`\sigma\restriction\eta`$ for each $`\eta\in\Lambda(\sigma)`$. These are all the edges.

**Proved properties.**
- Finite adhesion follows from the port section above.
- If $`\sigma_1<\sigma_2`$ both used $`\eta`$, then $`\eta`$ would not be fresh at $`\sigma_2`$. So the upper neighbours of a node form an antichain, which gives (2).
- Lemma 3 therefore applies: the graph has no infinitely connected subgraph with two or more vertices.
- Colouring each node by its height shows $`\chi\le\aleph_1`$.

**Colouring argument and its gap.** Suppose $`c`$ is a proper colouring with countably many colours. Take a countable $`M\prec H(\theta)`$ containing $`c`$, with $`\delta=M\cap\omega_1`$. Build nodes $`v_0<v_1<\cdots`$ in $`M`$ of heights cofinal in $`\delta`$, together with finite sets $`G_k`$ of heights. Each $`v_k`$ *keeps* $`G_k`$: the heights in $`G_k`$ are registered and fresh at $`v_k`$.

At a step handling colour $`n`$, look for $`v\ge v_k`$ that keeps $`G_k`$ and has $`c(v)=n`$. If one exists, take one in $`M`$, add its height to $`G_{k+1}`$, and then mark every height in $`G_{k+1}`$ once at each later step. The marks then accumulate only at $`\delta`$. Between steps, extend with ports $`G_{k+1}`$ and no marks.

The union $`t`$ is a node of height $`\delta`$. Suppose no chosen witness of limit height uses a height of the current $`G_k`$. Then $`t`$ keeps every $`G_k`$, and $`\Lambda(t)\supseteq\bigcup_kG_k`$. Let $`n=c(t)`$. At each step for $`n`$, the node $`t`$ itself solves the search, so by elementarity there is a solution in $`M`$. The height of that solution lies in $`\Lambda(t)`$, so $`t`$ is adjacent to a node of its own colour, which contradicts properness.

The gap is the supposition. The witness $`v`$ found in $`M`$ may itself have limit height and use some heights of $`G_k`$. Those heights are then no longer fresh above $`v`$, and $`t`$ loses them.

One cannot restrict the search to witnesses that avoid $`G_k`$. The node $`t`$ uses $`G_k`$, so the restricted statement no longer reflects. This is the template obstacle of the earlier section, now in exact form.

The same construction run under $`\diamondsuit`$, with tops added only for chosen generic branches, has the same single gap.

**Witness lemma (open).** In one of these constructions, there is a way to choose the witnesses so that, for the resulting top $`t`$, some node of colour $`c(t)`$ survives to $`t`$ registered and fresh. A witness lemma for the $`\diamondsuit`$ version would make the negative answer consistent; for the version above it would give a ZFC counterexample. Komjáth's PFA theorem constrains the second outcome. The ZFC version has size continuum, and under PFA every subgraph of it of size $`\aleph_1`$ would have to be countably chromatic, so it would also be an instance of chromatic incompactness at $`\aleph_2`$. The $`\diamondsuit`$ version has size $`\aleph_1`$. Together with Komjáth's theorem, it would make the size-$`\aleph_1`$ case of #1068 independent of ZFC.

**Where exactly the gap is.** For a stage $`(v,G)`$, let $`C'(v,G)`$ be the set of colours of nodes $`u\ge v`$ at which $`G`$ is registered and fresh. Let $`C(v,G)\subseteq C'(v,G)`$ be the colours of those $`u`$ that, in addition, do not use $`G`$ themselves. Both sets shrink as stages extend. A colour outside $`C'`$ at some stage is excluded for $`t`$ by elementarity. A colour in $`C`$ at every stage has witnesses that kill nothing, so it is harmless. The open case is a colour in $`C'`$ at every stage but outside $`C`$ from some stage on.

Excluding such a colour by elementarity would need $`t`$ to avoid the protected set at that stage. But $`t`$ must use the witnesses of the harmless colours, and those lie in the protected set. Ordering the colours repairs one-way dependencies. Suppose, for example, that every colour-1 node must use all registered fresh colour-0 points. Then take the colour-1 witness first, and a colour-0 witness above it.

A cyclic rule defeats this repair: colour-0 nodes use all registered fresh colour-1 points, and colour-1 nodes use all registered fresh colour-0 points. No such rule is yet known to extend to a proper colouring of the whole tree, and no proof that one cannot is known either.

Simple rules of this kind do not extend.

- *Use-all rules* ("colour-$`n`$ nodes use every registered fresh colour-$`m`$ point") are defeated by partial use. Leave one registered fresh colour-$`m`$ point unused at $`t`$; then $`t`$ cannot have colour $`n`$. Applied to the pair-cyclic version over all colours, this produces a limit node that the rule cannot colour.
- *Use-some rules* ("colour-$`n`$ nodes use some registered fresh colour-$`m`$ point") are defeated by decoys. Protect extra colour-$`m`$ points before taking a colour-$`n`$ witness, so that the witness consumes a decoy instead of the point $`t`$ needs.

A priority (finite-injury) scheme was also tried, in which a colour-$`n`$ witness may only kill points of larger colours. It breaks at the same place. A colour that is blocked because every candidate kills a higher-priority point can only be excluded if $`t`$ avoids those points, but $`t`$ must use the surviving higher-priority witnesses.

An equivalent target: the colouring argument needs a limit node $`\sigma`$ with $`c(\sigma)\in c(\Lambda(\sigma))`$. Every ladder $`\Lambda(\sigma)`$ is an *admissible chain*, meaning each of its points is registered and fresh at the later ones and is not used by them. So it would suffice to find, for every countable colouring, an admissible chain, built with free extensions in between, that meets every colour.

## Next steps

1. Prove or refute the witness lemma. The obstacle is that each witness uses at most one protected point of each colour but can use one of every colour, while each step protects only one new point.
2. Positive side: the template obstacle suggests that reflection forces reuse of earlier points. Try to turn that reuse into the (i)+(ii) structure, starting from a generic vertex outside a countable elementary submodel.
