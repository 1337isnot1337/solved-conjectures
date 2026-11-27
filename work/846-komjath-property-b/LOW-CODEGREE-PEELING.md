# Finite low-codegree witnesses and essential disjointness

This is a partial result for [Komjáth's property B problem, Erdős #602](https://www.erdosproblems.com/602), on a separate proof track from the two-occurrence counterexample in #863. It does not prove property B in general.

## A low-codegree criterion

Let \(\mathcal A\) be an almost disjoint family of countably infinite sets, with no restriction on which finite pairwise intersection sizes occur. For finite \(t\) let
\[
d_{\mathcal A}(t)=|\{A\in\mathcal A:t\subseteq A\}|.
\]
Suppose that for every \(A\in\mathcal A\) and every infinite \(S\subseteq A\) there is a finite \(t\subseteq S\) with \(d_{\mathcal A}(t)\le\aleph_0\). Then \(\mathcal A\) is essentially disjoint. In particular it can be two-colored with infinitely many points of both colors on every member.

The conclusion includes all almost disjoint families of countable sets with countable pair-codegrees, and it does not require a uniform bound on the size of a low-codegree witness. For example, standard uniform bounds on pairwise intersection imply the hypothesis by taking a tuple larger than that bound. A bound on the intersection size of \(\rho\) distinct members for some fixed finite \(\rho\) likewise implies it.

### Proof

The criterion is inherited by subfamilies and by replacing each member with any infinite subset of itself. Distinct members cannot produce the same infinite subset, by almost disjointness.

Induct on the cardinal \(\kappa=|\mathcal A|\). For a countable family, enumerate it in order type at most \(\omega\) and delete the finitely many points shared with earlier members. Now suppose \(\kappa\) is uncountable. Fix a sufficiently large regular \(\theta\), and build a continuous increasing chain \(\langle M_i:i<\operatorname{cf}(\kappa)\rangle\) of elementary submodels of \(H(\theta)\), each of size \(<\kappa\), containing \(\mathcal A\) as an element, and whose union contains every member of \(\mathcal A\) as an element. To construct it, enumerate the family and add increasing initial segments of that enumeration cofinal in \(\kappa\), taking elementary hulls and continuous unions. This construction works at singular \(\kappa\) since any stage \(i<\operatorname{cf}(\kappa)\) uses fewer than \(\operatorname{cf}(\kappa)\) models of size \(<\kappa\).

For any such \(M_i\), if \(A\in\mathcal A\setminus M_i\) then \(A\cap M_i\) is finite. Otherwise take a finite low-codegree witness \(t\subseteq A\cap M_i\). Every finite subset of \(M_i\) belongs to \(M_i\); the subfamily \(\{B\in\mathcal A:t\subseteq B\}\) is then definable in \(M_i\) and countable, so all its members, including \(A\), belong to \(M_i\). This is a contradiction.

Every member in \(\mathcal A\cap M_0\) is contained in \(M_0\) since it is countable, so inductively disjointify this smaller subfamily. Every other member lies in a unique first successor layer \(M_{i+1}\setminus M_i\), by continuity. Delete \(A\cap M_i\), which is finite; the remaining subset lies in the ground-set layer \(M_{i+1}\setminus M_i\) because \(A\subseteq M_{i+1}\). For every \(i\) the residual family in this layer retains the hypothesis and has size \(<\kappa\), so disjointify it by induction. Ground-set layers are disjoint, proving that all the resulting cofinite tails are pairwise disjoint. Split each infinite tail between the two colors.

## A countable peeling corollary

Define \(\partial\mathcal A\) as the subfamily of members \(A\) having an infinite \(S\subseteq A\) for which every finite \(t\subseteq S\) has uncountable codegree in \(\mathcal A\). The part removed by one peeling step satisfies the low-codegree criterion: any witness small in \(\mathcal A\) is small in the removed family. If iterating this derivative (taking intersections at limits) exhausts the family after some countable ordinal, then the family has a two-coloring putting infinitely many points of each color in each member.

In fact each removed layer has pairwise disjoint cofinite tails. Across countably many layers, every point belongs to at most countably many of these tails. The graph of tails, adjacent if they meet, therefore has countable degree (each tail is countable), and each connected component is countable. Inside a countable component one can give every tail infinitely many points in both colors by a recursion on countably many requirements, choosing fresh points from the required tail each time. Distinct components have disjoint ground sets.

The condition is sufficient, not necessary. Start with one infinite set \(B\), and for every finite \(t\subseteq B\) and each \(\xi<\omega_1\), add \(t\cup P_{t,\xi}\), with all \(P_{t,\xi}\) pairwise disjoint, countably infinite and disjoint from \(B\). If desired, restrict the finite roots \(t\) to unions of pairs in a fixed pairing of \(B\); every finite subset of \(B\) is still in uncountably many members, and nonempty intersections are never singletons. The family is essentially disjoint after deleting the finite roots from the petal members, but the low-codegree criterion fails on \(B\) before peeling. Even indefinite peeling is not necessary: duplicate each vertex of the perfect branch family \(\{\{x\!\upharpoonright n:n<\omega\}:x\in2^\omega\}\) into two clones. Every finite subset of every member lies in continuum many other members, but the two clone colors split every edge.

## Relation to known methods

The tools are the standard elementary-chain disjointification method (see [Soukup, Essentially disjoint families, conflict free colorings and Shelah's revised GCH](https://arxiv.org/search/?query=Essentially+disjoint+families+conflict+free+colorings+and+Shelah&searchtype=title) and [Csernák–Soukup, Splitting families of sets in ZFC](https://www.sciencedirect.com/science/article/pii/S0001870814003612)), applied to a point-pattern condition instead of a uniform intersection bound. The exact global question and the elementary finite/forcing cases are discussed in [Zeraoulia's 2026 note](https://doi.org/10.13140/RG.2.2.16215.12963). No exact prior formulation of the low-codegree peeling test was found in the sources searched. This note makes no priority claim about the elementary-chain method and leaves the rich stabilized core untreated.
