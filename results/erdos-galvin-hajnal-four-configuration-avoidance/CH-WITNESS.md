# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

## CH already gives the simultaneous witness

**Theorem.** In ZFC there is an \(\aleph_1\)-chromatic triple system on \(\mathfrak c\) vertices omitting \(T_1,T_3,T_4,T_9\) simultaneously. In particular CH alone suffices for the positive answer to [Problem 9/C](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=58), with no forcing over the CH model.

The earlier [single-Cohen construction](ONE-COHEN.md) uses generic records to supply a pair of compatible directed edges. Here a node of a tree already carries the colours of all its predecessors along one branch. This lets it choose its records directly. The construction is a labelled two-edge adaptation of the ground-model tree setup in [Lambie–Hanson and Uhrik, Theorem 3.6](https://arxiv.org/html/2312.01828), not an assertion that their graph by itself eliminates the link path.

### Directed graph and selected triples

Let \(T={}^{<\omega_1}\omega\), and write \(x\upharpoonright\alpha\) for the restriction of a node of length \(\beta>\alpha\). Partition the set \(L\) of nonzero countable limit ordinals into \(\omega_1\) stationary sets by Solovay’s stationary splitting theorem. Label each part by an ordinal, delete from that part the bounded initial segment through its label, and give any leftovers label zero. This defines \(h:L\to\omega_1\) with stationary fibres and \(h(\beta)<\beta\). For each \(\beta\in L\), fix an increasing cofinal ladder \(\ell_\beta:\omega\to\beta\). Only nodes of lengths in \(L\) have nonempty lower-neighbour lists.

For every node \(x\) of length \(\beta\in L\), choose lower neighbours \(x\upharpoonright\alpha\) by stages \(2i,2i+1\) for \(i<\omega\). At any stage \(j\), a candidate level \(\alpha\) must be a nonzero limit below \(\beta\) and satisfy
\[
  \alpha>\ell_\beta(j),\qquad
  h(\alpha)>\max\big(\{h(\beta)\}\cup
                   \{\text{earlier selected levels at } x\}\big).
\]
At stage \(2i\), choose the least eligible \(\alpha\) with \(x(\alpha)=i\), if it exists, and mark the edge \(x\upharpoonright\alpha\to x\) as a **base** edge of index \(i\). At stage \(2i+1\), choose the least eligible \(\gamma\) with \(x(\gamma)=i\) and such that \(y=x\upharpoonright\gamma\) selected a base edge at its own stage \(2i\). Mark \(y\to x\) as a **top** edge, with its unique pointer to that base edge into \(y\). If no candidate exists, skip the stage. This is a well-defined recursion on node lengths, then on stages. A lower neighbour cannot be selected twice.

Take as hyperedges the three vertices of each top edge together with its pointed-to base edge. The directed graph has unique directed paths: its edges increase in height, and along a downward edge \(h\) strictly increases while staying below the new vertex's height. If two directed paths from a common lower vertex diverge and rejoin, take the rejoining vertex and its two respective immediate predecessors of heights \(a<b\). They were selected in that order, so the latter threshold \(h(b)>a\). Descending from height \(b\) cannot reach the common starting height, which is at most \(a\). This is the same path-separation proof as before, with \(h\) evaluated on a node's length. The graph is triangle-free.

Every triple is a directed two-path; bottom and top use different immutable edge modes; and each top edge has only one designated predecessor. A diagonal determines its unique directed two-path. Thus any repeated pair is the bottom pair of both triples. This rules out \(T_3,T_4\). A loose triangle would give a simple cycle of three monotone segments, hence exactly two turns and two directed paths with the same endpoints. For \(T_9\), the two pages of a repeated bottom pair are out-neighbours of its upper vertex; a third triple containing both gives a directed path between them, duplicating a path from their common predecessor. This rules out the other two patterns.

### The stationary lemma

For any countable map \(d:L\to\omega\), call \(\beta\) good if the \(h\)-values of same-colour predecessors in \(L\cap\beta\) are cofinal in \(\beta\). In each stationary fibre \(h^{-1}(\xi)\), some colour \(i_\xi\) occurs on a stationary set \(S_\xi\). One colour \(i\) is selected for unboundedly many \(\xi\); write \(A=\{\xi:i_\xi=i\}\). Choose \(\beta\) in any \(S_\xi\) with \(\xi\in A\), intersecting the club of limit points of \(A\) and the diagonal intersection of the clubs of limit points of all \(S_\eta\). For every \(\eta\in A\cap\beta\), there is \(\alpha\in S_\eta\cap\beta\); it has colour \(i\) and \(h(\alpha)=\eta\). Thus \(\beta\) is good.

Repeat this argument for the countable map \(\beta\mapsto(d(\beta),\boldsymbol 1_{\beta\text{ is good}})\). A good vertex for this refined map is good for \(d\), so its cofinally \(h\)-high predecessors of the same refined colour are also good for \(d\). This is the two-step form we need.

### Colouring along a branch

Suppose \(c:T\to\omega\). Define \(g:\omega_1\to\omega\) by \(g(\beta)=c(g\upharpoonright\beta)\), recursively. Apply the two-step stationary lemma to \(g\) restricted to \(L\). We obtain \(\beta\in L\), \(i=g(\beta)\), and predecessors \(\gamma<\beta\) of colour \(i\) with \(h(\gamma)\) arbitrarily high in \(\beta\), such that for each such \(\gamma\) there are colour-\(i\) predecessors with \(h\)-values unbounded in \(\gamma\).

At each such \(y=g\upharpoonright\gamma\), stage \(2i\) chooses a base edge from some node \(g\upharpoonright\alpha\) with \(g(\alpha)=i\): the finite earlier-stage and ladder bounds are exceeded by one of its cofinally available predecessors. Hence there are top candidates of index \(i\) of arbitrarily high threshold for \(x=g\upharpoonright\beta\). At stage \(2i+1\), at least one exceeds the bounds for \(x\), so the selected top edge and its pointer produce a triple whose vertices all have colour \(i\). This contradicts properness.

Colouring by height gives the \(\aleph_1\) upper bound, since a triple uses three distinct heights. The tree \(T\) has exactly \(\mathfrak c\) nodes, being a union of \(\aleph_1\) sets of at most that size and containing \({}^\omega\omega\). This proves the theorem and its CH consequence. The result does not assert that there is an \(\omega_1\)-sized witness in every model with large continuum.

### The other consistency direction

For completeness, the negative proof only needs \(T_3,T_4\). If a triple \(abc\) has two repeated pairs, say \(ab,ac\), let \(abx,acy\) be other occurrences. When \(x=y\), the three triples give \(T_3\); when \(x\ne y\), the link at \(a\) contains the path \(x,b,c,y\), giving \(T_4\). Thus every triple in a \(T_3,T_4\)-free system has two private pairs. Give two of its private pairs one shared label unique to that triple, and give every unlabelled pair a fresh label. This is a 2-bounded pair colouring, and no triple of the system is rainbow.

[Todorčević's rainbow partition model, §1 Remark (4), p. 715](https://doi.org/10.1090/S0002-9947-1983-0716846-0) partitions \(\omega_1\) into countably many rainbow sets for each finite-to-one pair colouring. Applied to these labels, the partition is a proper countable vertex colouring. In that model no 9/C witness exists. Together with the direct CH proof, this shows relative independence from ZFC without any large-cardinal assumption.

### Wider finite uniformity

The same tree proof works for the full [labelled path family](https://github.com/1337isnot1337/solved-conjectures/blob/9802acb8af6547a6747b0ec5044726cf5ec31cbb/research/erdos-galvin-hajnal-four-configuration-avoidance/ONE-COHEN-UNIFORM.md) of any fixed finite uniformity. For a colour \(i\) reserve one consecutive stage per edge label \(0,\dots,r-2\). A predecessor at label \(\ell>0\) must have chosen its own edge at the reserved stage for \((i,\ell-1)\); the pointer designates that edge. Along the colour-following branch, the finite nested stationary-good sets ensure successively that every suitable \(\ell\)-good predecessor can extend the previous labelled path. The final good vertex yields an \(r\)-edge. Pair intersections are common prefixes, divergent pages never co-occur, and loose triangles are excluded by the same unique-path proof. At \(\kappa^+\), for regular \(\kappa\), use \(T={}^{<\kappa^+}\kappa\), \(\kappa\)-length ladders and a supremum at each \(<\kappa\)-stage. This gives analogous order \(2^\kappa\) and chromatic number \(\kappa^+\), with equality of order and chromatic number when \(2^\kappa=\kappa^+\).
