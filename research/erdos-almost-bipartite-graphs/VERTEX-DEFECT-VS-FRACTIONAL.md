# Hereditarily near-bipartite graphs can have unbounded fractional chromatic number

A companion to the vertex-deletion question preceding
[Erdős's arbitrary-cardinal edge-deletion conjecture, §3, p. 137](https://combinatorica.hu/~p_erdos/1982-24.pdf#page=7).
This is a finite obstruction to a proposed argument, not a resolution
of the historical question about size and uncountable chromatic
number being equal.

**Theorem.** For every \(\epsilon>0\) and every \(q\), there is a
finite graph \(G\) of fractional chromatic number greater than \(q\)
such that every induced subgraph on a vertex set \(S\) becomes
bipartite after deleting at most \(\epsilon |S|\) **vertices**.
The graph may also be required to have arbitrarily large odd girth.

This implies Walczak's Hall-ratio-near-two conclusion, since one
side of the surviving bipartition is independent and has size
at least \((1-\epsilon)|S|/2\). That Hall-ratio conclusion alone
was already announced by Davies, Hatzel and Yepremyan in their
[April 2026 Princeton seminar](https://www.math.princeton.edu/events/graphs-large-fractional-chromatic-number-and-small-hall-ratio-2026-04-16t190000),
so no priority is claimed for it. The theorem here bounds an
induced bipartite subset, not just an independent set; the seminar
abstract does not assert or rule out this stronger property.
The random model and weighted argument adapt
[Nguyen–Walczak, §5](https://arxiv.org/abs/2609.40192) and
[Steiner's analysis of Hall ratio](https://doi.org/10.1007/s00493-025-00164-0).
The deterministic parity-preserving cleanup below is the added step.

## 1. A finite random construction

It suffices to take \(0<\epsilon<1\) and integer \(q\ge2\). Choose
positive integers \(a,h,L,g\) with \(g>4a+2\) and
\[
\frac2L+\frac1h+\frac1g+\frac2a<\epsilon.
\]
We can raise \(g\) further for any prescribed odd girth.
Choose a finite template \(\Gamma\) on \([c]\) of girth at least
\(g\) with \(\alpha(\Gamma)<c/(16q^2)\).
For completeness, take the independent-edge random graph on
\(M\) vertices with probability \(M^{-1+1/(2g)}\).
The expected number of cycles shorter than \(g\) is \(O_g(\sqrt M)\).
The chance that any \(M/(40q^2)\)-element set is independent
tends to zero by the union bound: the event for a fixed set
costs \(\exp(-\Omega_q(M^{1+1/(2g)}))\), while there are at most
\(2^M\) sets. Take a realization with fewer than \(M/2\) short
cycles, and delete one vertex per short cycle.

Replace template vertex \(i\) with an independent part \(V_i\)
of size \(n_i\). For every \(i<j\) adjacent in \(\Gamma\), each
vertex of \(V_i\) independently chooses a single uniform neighbor
in \(V_j\). There are no other edges. The map sending every vertex
of \(V_i\) to \(i\) is a graph homomorphism to \(\Gamma\). Thus
\(G\) has no odd closed walk of length less than \(g\).

Let \(b=h+2\), \(B=b^c\), and \(n_i=R^{B-b^{i-1}}\), with
the integer \(R\) tending to infinity. The sizes decrease at least
geometrically with successive factor two. For sufficiently large
\(R\), the order of \(G\) is at most \(N_0=R^B\) and
\(\sum_{j\ge i} n_j\le 2n_i\).

### Weighted independence

Give every vertex in \(V_i\) weight \(1/n_i\), total \(c\).
Suppose an independent set has weight at least \(c/q\).
Retain only its heavy parts, those in which its weight is at
least \(1/(2q)\); they retain weight at least \(c/(2q)\).
In increasing order, greedily form an independent set of the
heavy template vertices. Each heavy part either belongs to
this independent set or has an earlier neighbor in it.
The greedy set has size less than \(c/(16q^2)\). Consequently
one of its indices \(i\) accounts for weight more than \(8q\)
when we retain its own part and its later heavy neighbors.

For a fixed choice of this remaining vertex set in the suffix,
at least \(n_i/(2q)\) vertices in \(V_i\) must avoid edges to
later template-neighbor parts of total weight greater than
\(8q-1\). These choices are independent. The probability is
at most \(\exp(-(8q-1)n_i/(2q))\le\exp(-3n_i)\).
There are at most \(2^{2n_i}\le\exp(2n_i)\) suffix sets.
Thus the total probability of such an independent set is
at most \(\sum_i e^{-n_i}=o(1)\). When there is none, the
weight function, scaled by its largest independent-set weight,
gives \(\chi_f(G)>q\) by fractional coloring duality.

### Earlier parts are locally sparse

With probability \(1-o(1)\), for every \(i\) and every set
\(X\subseteq V_1\cup\cdots\cup V_{i-1}\) with
\(0<|X|\le L n_i\) we have
\[
e(G[X])\le (1+1/h)|X|.
\]
For a proof, fix \(i\ge2\), \(x=|X|\le L n_i\), let
\(u=n_{i-1}\), and set \(d=\lceil(1+1/h)x\rceil\).
For any \(d\) prescribed distinct edges on an earlier \(X\)
the probability they all occur is at most \(u^{-d}\):
either they require conflicting choices at some vertex and part,
or they specify independent choices, each with target size
at least \(u\). The union bound at size \(x\) is at most
\[
\binom{N_0}{x}\binom{x^2}{d}u^{-d}
\le (3N_0/x)^x(3x/u)^d.
\]
As \(3x/u\le1\) and \(hd\ge(h+1)x\), raising this bound to
the power \(h\) gives at most
\[
(3^{2h+1}N_0^h x/u^{h+1})^x
 \le (3^{2h+1} L/R)^x.
\]
The last step uses
\(u^{h+1}/(N_0^h n_i)=R^{b^{i-2}}\).
Taking \(h\)-th roots and summing the geometric bound over
\(x\ge1\) and the finitely many \(i\) proves the assertion.
The first part has no earlier vertices. We may fix a realization
satisfying this property and \(\chi_f(G)>q\).

## 2. Clean an arbitrary induced subgraph

Let \(S\) be nonempty and choose the largest \(i\) with
\(|S|\le L n_i\). The condition holds at \(i=1\) because
\(|G|\le2n_1\) and \(L\ge2\).
Write \(X,Y,Z\) for the parts of \(S\) earlier than \(i\),
within \(V_i\), and later than \(i\). Remove \(Z\) at cost
at most \(2|S|/L\), by maximality of \(i\) and geometric decrease.
The middle part \(Y\) is independent; mark the vertices of \(X\)
that have any neighbor in \(Y\).

**Make the earlier part a bipartite pseudoforest.** In each
connected component of \(G[X]\) that has a cycle, keep a
spanning tree plus one cycle edge. A component with \(v\) vertices
and \(e\) edges has \(e-v\le v/h\) other edges by local sparsity,
since its own vertex set qualifies at the same \(i\).
Remove one endpoint per such edge, at a total cost at most
\(|X|/h\). The retained vertices now induce a subgraph of the
chosen pseudoforest. If a chosen cycle was odd, remove one
vertex of that cycle (if needed), at total cost at most \(|X|/g\),
since original odd cycles have length at least \(g\) and they
are in disjoint components. The remaining induced earlier graph
is a forest with possibly one even cycle in some components.

**Fragment the earlier part at low cost.** Such a pseudoforest
can be cut into bipartite connected components of diameter at
most \(4a\) by deleting at most \(2|X|/a\) further vertices.
For a tree component root at any vertex; for an even-unicyclic
component root the attached trees at their cycle vertices.
Delete one residue class of positive depths modulo \(a\).
Choose the class of lowest cost; it removes at most \(|X|/a\)
vertices. The components detached from roots have height less
than \(a\). For every remaining base cycle of length at least
\(a\), also label its vertices cyclically, choose a cheapest
residue class modulo \(a\), and remove that class. The additional
cost is at most \(|X|/a\) in total. Every residual cycle segment
has length at most \(2a\), including the segment that wraps
around the starting label. Shorter cycles have diameter at most
\(a\). Together with attached trees of depth less than \(a\)
this gives the diameter bound.

**Attach the middle part without parity conflicts.** For any two
marked vertices in the same surviving earlier component, take a
shortest path between them, of length at most \(4a\).
If its length were odd, project it to \(\Gamma\) and add at
its two ends the edges to the single template vertex \(i\).
This would make an odd closed walk in \(\Gamma\) of length
at most \(4a+2<g\). Distinct actual neighbors in \(Y\)
are harmless; their template vertex is always \(i\).
So all the marked vertices in one component lie on the same
side of its bipartition. Flip that component to put its marked
vertices on side 1, and color all of \(Y\) by 0. This is proper
on the surviving induced graph. The total cost is bounded by
\[
\left(2/L+1/h+1/g+2/a\right)|S| < \epsilon|S|,
\]
as required.

## Scope

The result separates a hereditary **unweighted vertex**
condition from the fractional chromatic parameter. In contrast,
if one can delete at most an \(\epsilon\) fraction of the
weight for **every** nonnegative weighting, the larger side
of its surviving bipartition gives independent weight at least
\((1-\epsilon)/2\), so \(\chi_f\le2/(1-\epsilon)\) by
duality. The unweighted-to-weighted step cannot be used for the
historical exact-size problem without additional structure.

Taking a countable disjoint union yields unbounded finite
fractional chromatic number while retaining the same uniform
vertex-deletion condition on every finite subset. This costs
no uncountable example, nor does it settle the stronger
arbitrarily slow absolute defect question or any edge bound.
