# Graffiti.pc Conjecture 318: proof and sharpness

**Result and proof credited to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334).** The proof was publicly shared in a ChatGPT conversation on November 18, 2026 and contributed to this repository with permission. Cinna Davis is not the discoverer or author. This note independently checks and presents the argument.

**Original conjecture:** Ermelinda DeLaViña, [*Written on the Wall II*, Graffiti.pc Conjecture 318](https://www.uhd.edu/academics/sciences/mathematics-statistics/wowii/files/wowiiaii.pdf), announced March 4, 2007, listed open in the November 5, 2026 catalogue.

## Definitions

All graphs here are finite and simple. The complement `\overline G` has as edges the nonedges of `G`. For a vertex `v` of a connected graph, `\operatorname{dist}_{even}(v)` counts vertices at even distance from `v`, **including `v` itself** (distance zero).

A set `D\subseteq V(G)` is a *total dominating set* if every vertex, including those in `D`, has a neighbor in `D`. It is *minimal* if no proper subset is total dominating. A graph is *well total dominated* if every inclusion-minimal total dominating set has minimum cardinality.

**Conjecture 318.** If `G` is connected of order at least two, and

\[
\max_v \operatorname{dist}_{even}(v)\geq |E(\overline G)|,
\]

then `G` is well total dominated.

## Stronger theorem and proof

**Theorem.** Under the conjecture's hypotheses, every total dominating set contains a total dominating set consisting of two adjacent vertices. Hence every inclusion-minimal total dominating set has exactly two vertices and `\gamma_t(G)=2`.

**Proof.** Put `q=|E(\overline G)|`. Choose `v` for which `\operatorname{dist}_{even}(v)\ge q`. Let `r` be the number of nonneighbors of `v`, and `s` the number of missing edges with neither endpoint `v`. Then `q=r+s`.

Every vertex other than `v` at even distance from `v` has distance at least two, so it is a nonneighbor of `v`. The vertex `v` itself contributes at most one more vertex:

\[
q\leq \operatorname{dist}_{even}(v)\leq r+1.
\]

It follows that `s\leq1`. Thus the graph induced by `V(G)\setminus\{v\}` has **at most one missing edge**.

Partition `V(G)\setminus\{v\}` into independent parts. If a missing edge exists, its two endpoints make one part. All other parts are singletons. Distinct parts are completely adjacent to one another.

Take any total dominating set `D`. The vertex `v` must have a neighbor `a\in D`; let `A` denote the part containing `a`.

1. Suppose `D` meets another part at `b`. Then `\{a,b\}` totally dominates `G`: `a,b` dominate each other; `a` dominates `v` and every vertex in every other part; and `b` dominates every vertex in `A`.
2. Otherwise `D\subseteq A\cup\{v\}`. Since `A` contains no edges, every vertex of `A` can be dominated by `D` only via `v`. Therefore `v\in D` and `v` is adjacent to all of `A`. The pair `\{a,v\}` totally dominates: `a,v` dominate each other, `v` dominates `A`, and `a` dominates all other parts.

Every total dominating set therefore contains a total dominating pair. No singleton can totally dominate a simple graph, since its selected vertex has no loop. Every minimal total dominating set consequently has size two. This proves Conjecture 318. `\square`

## Sharpness of the hypothesis

Let `G=K_1\vee(2K_2)`. A universal vertex `z` is joined to four other vertices `a,b,c,d`; the only edges among those four are `ab` and `cd`.

The four cross-pair nonedges give `q=4`. Each of `a,b,c,d` has even distance to itself and the two endpoints of the opposite edge (at distance two via `z`); `z` has even distance only to itself. Thus

\[
\max_v\operatorname{dist}_{even}(v)=3=q-1.
\]

The pair `\{z,a\}` totally dominates, so `\gamma_t(G)=2`. The four-element set `\{a,b,c,d\}` also totally dominates, and is minimal: removing any endpoint leaves its partner undominated within the set. Hence this graph is not well total dominated. Replacing `\max_v\operatorname{dist}_{even}(v)\ge q` by `\ge q-1` would make the conjecture false.

## Verification and scope

Run `python3 results/graffiti-pc-318/verify.py` from the repository root. It enumerates all labeled simple graphs on 2–7 vertices with at most `n+1` missing edges, computes distances and total domination directly, and checks the stronger theorem on every qualifying connected graph. This covers all graphs of these orders that could satisfy the hypothesis (because `\operatorname{dist}_{even}(v)\le n` forces `q\le n`). The extra missing-edge layer covers the one-unit relaxation. A total of 419,235 graphs are examined, with 7,337 satisfying the original hypothesis; all pass. The explicit sharpness graph is checked separately.

The finite test is not a substitute for the all-order proof, and no Lean formalization or peer review is claimed. An open catalogue status is not proof of absolute historical priority.
