# The Knaster threshold for rectangle-free triple systems

Write \(B(\omega,2)\) for an infinite matching of pairs with two distinct common pages, and \(Q(H)\) for the forcing of finite proper partial \(\omega\)-colourings. The following are equivalent over ZFC:

1. The ordered partition relation \(\omega_1\to(\omega_1,\omega:2)^2\): every graph on \(\omega_1\) has an uncountable independent set or infinitely many vertices below two later vertices, all adjacent to both.
2. \(Q(H)\) is Knaster for every \(T_4\)-free triple system \(H\) omitting \(B(\omega,2)\) (on any host).
3. The conclusion of 2 holds for every 2-colourable triple system on \(\omega_1\) omitting \(T_1,T_3,T_4,T_9\) and \(B(\omega,2)\).

This refines the unconditional ccc conclusion of the [rectangle obstruction](colouring-poset-rectangle-obstruction.md).

## 1 implies 2

Given uncountably many distinct conditions, use a \(\Delta\)-system of supports with fixed root colours and equal finite petal size. Index by \(\omega_1\), enumerate each petal by its finite positions, and list all possible monochromatic crossed-triple patterns. For each pattern define its conflict graph on the indices: \(i<j\) are adjacent if that particular pattern is realized monochromatically by the union of their conditions. Avoiding all finitely many conflict graphs makes the conditions pairwise compatible.

A root pattern, with one vertex in the root and one in each petal, has no infinite clique, since four indices ordered as two early and two late would produce \(K_{2,2}\) in the fixed root vertex's link, containing \(P_4\). A pattern with two vertices in the later petal also has no infinite clique: the first two indices of any infinite clique give two pages, the remaining indices give infinitely many disjoint common bases. In either case the Dushnik–Miller theorem gives an uncountable independent set. For a pattern with two vertices in the earlier petal, its conflict graph has no ordered \((\omega:2)\), since the two upper indices would give common pages to infinitely many disjoint earlier bases. Hypothesis 1 gives an uncountable independent set for this pattern too. Apply these extractions successively for the finite list of patterns, reindexing each surviving family in increasing order. The final family is pairwise compatible.

## 3 implies 1

Given a graph \(G\) on \(\omega_1\) with no ordered \((\omega:2)\), use disjoint named vertices \(a_i,b_i,z_i\) for each \(i<\omega_1\), and take the triples
\[
 \{a_i,b_i,z_j\} \quad(i<j,\ \{i,j\}\in E(G)).
\]
This triple system is 2-colourable by the two sorts, bases and pages. A pair repeated in two triples must be a nominated base \(\{a_i,b_i\}\), so neither \(T_3\) nor \(T_4\) occurs. A one-point intersection of two different triples must be a shared page, so three pairwise one-point intersections cannot form a loose triangle. No two pages ever occur in one triple, which excludes \(T_9\). Two common pages for an infinite matching of bases would give an ordered \((\omega:2)\) in \(G\), so this is impossible.

The zero-valued partial map on \(\{a_i,b_i,z_i\}\) is proper. Two such maps are compatible iff the corresponding indices are nonadjacent in \(G\). The Knaster property in 3 therefore gives an uncountable independent set. The implication 2 to 3 is immediate.

## Consequences

Hajnal's CH example negates \(\omega_1\to(\omega_1,\omega:2)^2\); Baumgartner and Hajnal proved the positive relation under \(\mathrm{MA}_{\omega_1}\). Both source attributions, and the distinction from the clique relation with \(\omega+2\), are documented in [Komjáth, *Distinguishing two partition properties of \(\omega_1\)* (1998)](https://matwbn.icm.edu.pl/ksiazki/fm/fm155/fm15517.pdf). The partition relation itself is old. The point here is its equivalence to the Knaster assertion for the explicit hypergraph colouring forcings.

Under CH, taking the disjoint union of the 2-colourable counterexample in the reverse implication with the [direct CH witness](https://github.com/1337isnot1337/solved-conjectures/pull/1082) gives an uncountably chromatic \(9/C\) witness omitting \(B(\omega,2)\) but with a ccc non-Knaster \(Q(H)\). All forbidden patterns here are connected and therefore cannot cross the two components. Over a CH ground, the one-Cohen ordinal witness retains CH and its own \(Q(H)\) has precaliber \(\aleph_1\); both behaviours can therefore occur in the same model. This does not identify the chain condition of all such witnesses with precaliber.
