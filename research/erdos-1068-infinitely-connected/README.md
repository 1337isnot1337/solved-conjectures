# Erdős #1068: countable infinitely connected subgraphs

Tracking issue: #1118.

**Problem ([Erdős #1068](https://www.erdosproblems.com/1068), [Va99, 7.90]).** Does every graph with chromatic number $\aleph_1$ contain a countable subgraph that is infinitely vertex-connected?

A graph is *infinitely connected* if every two of its vertices are joined by infinitely many internally disjoint paths. Bowler and Pitz (arXiv:2402.05984, Remark (3)) list the question as open: "Does every uncountably chromatic graph have a countably infinite, infinitely connected subgraph?"

**Status of this file: research notes, no resolution.** The lemmas below are proved. They reduce the problem and isolate a sufficient condition for a counterexample. No counterexample or proof has been found yet.

## Screening (2026-11-28)

- erdosproblems.com lists #1068 as open, with no forum posts and no proof claims (database snapshot of 2026-11-24).
- Soukup (2015) and Bowler–Pitz (2024) give ZFC uncountably chromatic graphs with no *uncountable* infinitely connected subgraph. That answers #1067, not #1068. Both graphs contain countable complete graphs $K_\omega$: Bowler–Pitz's proof of uncountable chromatic number builds one explicitly.
- Komjáth's consistency results (1988, 2013) are also about uncountable subgraphs.
- Bowler–Pitz, *Thin ends and topological spanning trees* (arXiv:2610.40458, Oct 2026), re-uses their graph for spanning-tree questions and does not address #1068.
- No issue, PR or file in this repository on either branch matches.

## Lemma 1 (reflection)

> If a graph $G$ has an infinitely connected subgraph $H$ with at least two vertices, then it has a countably infinite one.

*Proof.* Let $M\prec H(\theta)$ be a countable elementary submodel containing $G$ and $H$, with $\theta$ large. Put $H_0=H[V(H)\cap M]$. For $x,y\in V(H)\cap M$ the statement "there are infinitely many internally disjoint $x$–$y$ paths in $H$" holds, so by elementarity $M$ contains an injective sequence $\langle P_n:n<\omega\rangle$ of such paths. Each $P_n$ is a finite object in $M$, so its vertices lie in $M$, and the $P_n$ are paths of $H_0$. Hence $H_0$ is infinitely connected. It is infinite because a vertex of an infinitely connected graph with two or more vertices has infinite degree (Lemma 2), and $M$ contains infinitely many neighbours of each of its vertices. $\square$

So #1068 is equivalent to: *does every uncountably chromatic graph contain an infinitely connected subgraph with at least two vertices (of any size)?* The countability in the question costs nothing.

## Lemma 2 (degree)

> In an infinitely connected graph $H$ with $\lvert H\rvert\ge 2$, every vertex has infinite degree.

*Proof.* Fix $x\ne y$. Infinitely many internally disjoint $x$–$y$ paths have pairwise distinct second vertices, all neighbours of $x$. $\square$

Consequence: if every subgraph of $G$ has a vertex of finite degree in that subgraph, then $G$ has no infinitely connected subgraph.

## Lemma 3 (a sufficient condition for a counterexample)

Call $G$ a *$T$-graph* if $V(G)$ is a tree $(T,\le)$ in which every chain is well-ordered, and every edge joins two comparable nodes.

> Let $G$ be a $T$-graph such that
> 1. (finite adhesion) any two incomparable nodes are separated in $G$ by a finite set; and
> 2. (finite upward degree along chains) for every node $u$ and every chain $C\ni u$, only finitely many $t\in C$ with $t>u$ are adjacent to $u$.
>
> Then $G$ has no infinitely connected subgraph with two or more vertices.

*Proof.* Let $H$ be an infinitely connected subgraph. Two incomparable nodes are finitely connected in $G$, hence in $H$, so $V(H)$ is a chain. A chain is well-ordered, so $V(H)$ has a least element $m$. Every $H$-neighbour of $m$ lies above $m$ in the chain $V(H)$, so by (2) $m$ has finite degree in $H$. That contradicts Lemma 2 unless $\lvert H\rvert\le 1$. $\square$

So a ZFC graph with $\chi=\aleph_1$ satisfying (1) and (2) would answer #1068 negatively.

The Bowler–Pitz graph $\mathbf G$ satisfies (1); this is their main lemma. It fails (2). For a successor node $s$, the set of $t\ge s$ on a branch $b$ with $s\in A_t$ is an initial segment of $b$ above $s$, and it is typically infinite. Their colouring argument uses exactly this: it builds $t''_0<t''_1<\cdots$ on one branch, pairwise adjacent.

Any subgraph of $\mathbf G$ keeps (1), because a finite separator in $\mathbf G$ is a separator in every subgraph. So the question is whether edges of $\mathbf G$ can be thinned to satisfy (2) while keeping $\chi=\aleph_1$.

### Attempt A: bounding the ordinal length of the upper endpoint

Keep the edge $\{s^\star,t\}$ only when $\operatorname{dom}(t)-\operatorname{dom}(s)\in D(s)$, for a finite set $D(s)$ of ordinals. Property (2) then holds, since a branch has at most one node of each length.

- The first half of the Bowler–Pitz argument survives. Take $D(s)\supseteq\{\omega\cdot j:1\le j\le\operatorname{last}(s)\}$, and run their Claim only over 1-extensions $t''$ with $\operatorname{dom}(t'')=\operatorname{dom}(t')+\omega$. Then $\operatorname{dom}(t''_n)-\operatorname{dom}(t'_{m+1})=\omega\cdot(n-m)$. The skipped values $a_m$ are strictly increasing, so $\{t''_K,\dots,t''_{2K}\}$ is a clique for every $K$, and bounded colours give a contradiction. The Claim's output extension has length difference in $\{0\}\cup\{\omega\cdot j+1:j\ge1\}$.
- The second half fails. The limit $\hat t=\bigcup_n t_n$ must be a 1-extension of each Claim output $t'_n$ of an allowed length. If infinitely many outputs have infinite length difference, then $\operatorname{dom}(\hat t)-\operatorname{dom}(t'_n)=\omega^2$ for every $n$. Adding $\omega^2$ to the allowed lengths lets the adversary choose $\omega^2$-long 1-extensions in the first half, which produces tails of length $\omega^3$, and so on. The set of lengths needed is not closed below any countable bound that a finite $D(s)$ can follow.

### Attempt B: bounding the last value of the upper endpoint

Keep $\{s^\star,t\}$ only when $t$ has successor length and $\operatorname{last}(t)\le F(s)$. Property (2) holds because a branch is one injective sequence, so only finitely many of its nodes have last value at most $F(s)$.

This fails for a different reason. The second half needs edges into Claim outputs $t'_{n}$, whose last values are not controlled. It also needs the Claim to apply to the limit node $\hat t$, which has no last value.

## Lemma 4 (ladder obstructions have an infinite-degree kernel)

The Bowler–Carmesin–Komjáth–Reiher theorem (arXiv:1512.02911) says that $\operatorname{Col}(G)>\aleph_0$ if and only if $G$ contains a type I or type II $\aleph_0$-obstruction. Since $\chi\le\operatorname{Col}$, every uncountably chromatic graph contains one. For a type II obstruction (a stationary ladder system $\langle L_\alpha:\alpha\in S\rangle$ on a regular $\kappa$):

> Let $R^\ast=\{\beta: U_\beta\cap S \text{ is stationary}\}$, where $U_\beta=\{\alpha\in S:\beta\in L_\alpha\}$, and let $S^\ast=\{\alpha\in S:\lvert L_\alpha\cap R^\ast\rvert=\aleph_0\}$. Then $S\setminus S^\ast$ is nonstationary. In the ladder graph, every vertex of $S^\ast\cup R^\ast$ has infinitely many neighbours in $S^\ast\cup R^\ast$.

*Proof.* Suppose $S\setminus S^\ast$ is stationary. Fodor's lemma gives a stationary $T\subseteq S\setminus S^\ast$ and a $\gamma$ with $L_\alpha\cap R^\ast\subseteq\gamma$ for $\alpha\in T$. A second application gives a stationary $T'\subseteq T$ on which the least element of $L_\alpha$ above $\gamma$ is a constant $\beta$. Then $U_\beta\supseteq T'$ is stationary, so $\beta\in R^\ast$, but $\beta\ge\gamma$, which is a contradiction. For the second statement: each $\alpha\in S^\ast$ has the infinite set $L_\alpha\cap R^\ast$ of neighbours. Each $\beta\in R^\ast$ has the stationary, hence infinite, set $U_\beta\cap S^\ast$ of neighbours. $\square$

So stationary ladders always contain a subgraph of infinite minimum degree, and Lemma 2 gives no obstruction there. A ladder graph alone can be countably chromatic, for example under $\mathrm{MA}_{\aleph_1}$ (Hajnal–Máté), so a positive answer has to use $\chi>\aleph_0$ and not only $\operatorname{Col}>\aleph_0$. For the same reason, Lemma 3 asks for $\chi=\aleph_1$ and not just an obstruction.

## A sufficient positive structure

A countable bipartite graph with parts $B$ and $A$ is infinitely connected if (i) every two vertices of $B$ have infinitely many common neighbours in $A$, and (ii) every vertex of $A$ has infinitely many neighbours in $B$.

*Proof sketch.* For $b,b'\in B$, use length-2 paths. For $a\in A$ and $b\in B$, pair distinct $B$-neighbours $u_n$ of $a$ with fresh common neighbours of $u_n$ and $b$. For $a,a'\in A$, pair distinct $B$-neighbours $u_n$ of $a$ and $u'_n$ of $a'$, and join each pair through a fresh common neighbour.

$K_{\aleph_0,\aleph_0}$ is the trivial instance. Uncountably chromatic graphs need not contain $K_{\aleph_0,\aleph_0}$, so (i)+(ii) is the structure to look for in a positive proof.

## Lemma 5 (one chain is never enough)

> Let $G$ be a graph on $\omega_1$ in which every vertex has only finitely many neighbours above it. Then $G$ has no edge between $M\cap\omega_1$ and $\omega_1\setminus M$ for any countable $M\prec H(\theta)$ containing $G$. In particular $\chi(G)\le\aleph_0$.

*Proof.* Let $u\in M$. Its finite set $U(u)$ of upper neighbours is definable from $u$, so $U(u)\in M$, and finite sets in $M$ are subsets of $M$. A vertex $v\notin M$ adjacent to $u\in M$ would satisfy $v>u$ (since $M\cap\omega_1$ is an initial segment), so $v\in U(u)\subseteq M$, which is absurd. A continuous chain of such models splits $G$ into countable pieces with no edges between them, and each piece can be coloured separately. $\square$

So condition (2) of Lemma 3 can only coexist with $\chi=\aleph_1$ if the tree branches: the upward neighbourhood of a node, taken over all branches at once, has to be infinite.

## Obstacle met in constructions (heuristic, not a theorem)

I tried two ways of building ladders $C_t\subseteq A^\ast_t$ inside the Bowler–Pitz tree with "each point is used by at most one ladder per branch": Soukup's ZFC diagonalisation over all pairs $(A,f)$, and $\diamondsuit$-guessing. Both run into the same problem. The colouring argument reflects a property of the template node $t$, the node whose colour must match a ladder point. But $t$ is itself a user of every earlier ladder point on its branch. A requirement satisfied by $t$ therefore cannot forbid the next chosen point from also being a user of an earlier point, and that second use is what (2) has to exclude. Budget variants, which allow $B$ users per branch, fail by exactly one: the template's own use.

A related observation for stage-by-stage ZFC constructions: if "$u$ is used as a ladder point" is decided in the final graph and $M$ contains the graph, then the first stage at which a node $u\in M$ is used lies in $M$. So the stage $\delta_M=M\cap\omega_1$ can never be the first use of a node of $M$. Any "use each point at one stage only" rule therefore starves the reflection step.

## Next steps

1. Look for an edge-thinning of $\mathbf G$, or of a Todorčević-type tree graph, that keeps (1) and (2) of Lemma 3 and has a colouring argument that does not escalate in ordinal length.
2. Positive side: use generic points (a vertex outside $M$ that lies in no countably chromatic set from $M$) to build the (i)+(ii) structure.
