# Source and prior-resolution audit

Date checked: 27 November 2026. This is a bounded literature search,
not a claim that no unindexed text contains the result.

## Exact original target

P. Erdős, F. Galvin, A. Hajnal, *On set-systems having large
chromatic number and not containing prescribed subsystems*,
in *Infinite and Finite Sets*, Colloq. Math. Soc. János Bolyai 10,
North-Holland (1975), 425–513; MR 53#2727, Zbl 0324.04005.
[Author's archive scan](https://www.renyi.hu/~p_erdos/1975-24.pdf)
is 89 pages; the local copy's SHA-256 is
`a9621bbef90bc4adf249b204afbcb55f94ffd448b0589b5d4c81120fddda32b2`.
The print page number is the PDF page number plus 424.

- [Def. 6.2–6.3, print p. 448](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=24):
  $`P`$ realizes every edge label in one vertex-colour class;
  $`P^*`$ adds a fixed set contained in every witnessing edge.
  In graphs they suppress the fourth argument $`1`$, so the set
  is a single vertex. The third argument $`\aleph_0`$ means
  partitions into strictly fewer than $`\aleph_0`$ classes, hence
  every finite colouring, not countable colourings.
- [Thm. 8.1, pp. 454–455](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=30):
  the least $`\delta`$ with $`\lambda^\delta>\lambda`$ is
  $`\aleph_0`$ if $`\lambda=\aleph_0`$, so **the original paper
  already gives triangle-free countable witnesses**. This gives
  the positive side at girth four once the exclusion at girth
  five is known. It does not exclude quadrilaterals, and the
  stronger no-$`K_{\aleph_0,\aleph_0}`$ witness is not credited
  to this theorem.
- [Thms. 8.5 and 8.6, pp. 457–459](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=33)
  exclude short **odd** cycles on larger cardinalities and with
  other palette and partition parameters. They do not imply that
  one can exclude $`C_4`$ on a countably infinite host.
- [Thm. 9.21 and Problem 7, p. 466](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=42):
  the printed scan uses $`3\le i\le n+3`$ in Theorem 9.21, and contrasts
  excluding all short circuits with excluding only odd short
  circuits. Problem 7 immediately follows and asks whether
  one has the rooted property $`P^*(G,\aleph_0,\aleph_0)`$
  for arbitrarily large girth. The authors explicitly say
  the previous result answers only unstarred $`P`$ or each
  fixed **finite** edge palette. The $`C_4`$-free obstruction
  negates the full arbitrarily-large-girth assertion; with the
  known triangle-free result it gives the exact threshold.
- [Zentralblatt review](https://emis.muni.cz/classics/Erdos/cit/32404005.htm)
  corroborates the original volume, pagination, and subject.
  It does not give a resolution of this question.

## Later papers and neighbouring formulations

| Source examined | Why it does not settle the target |
| --- | --- |
| [Erdős–Hajnal, *On chromatic numbers of graphs and set-systems* (1966)](https://www.renyi.hu/~p_erdos/1966-07.pdf), §§5, 7; [Erdős–Hajnal, *Chromatic number of finite and infinite graphs and hypergraphs* (1985)](https://users.renyi.hu/~p_erdos/1985-08.pdf), pp. 281–285 | Ordinary chromatic number, girth, and unavoidable bipartite subgraphs at uncountable chromatic number are not the local countable-host palette condition. A countable $`C_4`$-free graph can have infinite ordinary chromatic number. |
| [Erdős–Hajnal, *Embedding theorems for graphs establishing negative partition relations* (1978)](https://users.renyi.hu/~p_erdos/1978-09.pdf), problem list and references | Its similarly numbered Problem 7 concerns embeddings/Sierpiński graphs in a different paper, not EGH75 §9. |
| [Hajnal–Komjáth, *Some remarks on the simultaneous chromatic number* (2003)](https://link.springer.com/article/10.1007/s00493-003-0015-2) and [MathSciNet review mirror](https://citeseerx.ist.psu.edu/document?doi=dd66b0c58d82b75a3c6906d1e8407bb18741c8d0&repid=rep1&type=pdf) | The accessible publisher abstract and detailed review are about all edge labels in one part without a common centre, mainly for uncountable chromatic number, rather than forbidding $`C_4`$ in the countable rooted problem. The subscription full text was not obtained. |
| [Džamonja–Komjáth–Morgan, *Wild edge colourings of graphs* (2004)](https://ueaeprints.uea.ac.uk/id/eprint/19949/) | Their wild colouring places all labels somewhere in a single part, not at one vertex. The main result concerns singular-cardinal consistency. |
| [Lambie-Hanson–Soukup, *Extremal triangle-free and odd-cycle-free colourings of uncountable graphs* (2020)](https://arxiv.org/abs/2002.02480) | It studies monochromatic short cycles of edge partitions of complete graphs. Its Problems 5.10–5.11 ask unrooted questions about uncountable hosts. Here the uncoloured host excludes a cycle and the test has a common centre in a finite vertex partition. |
| [Komjáth, *The Erdős–Hajnal Problem List* (2025)](https://doi.org/10.1017/bsl.2025.1) and [indexed scope/statement map](https://erdosproblems.ai/wiki/library/set_theory/komjath_2025_erdos_hajnal_problem_list) | The list updates a specific earlier 82-problem list; it is not a survey of every numbered problem in the 1975 memoir. No matching result was located in the published metadata and available indexed map. |
| [Howe–Huffman–Kohlmeyer–Kruer, *Relative Independence of the Simultaneous Chromatic Number at Aleph-1*, v1](https://hexagonmath.org/2611.00585v1), §1 | Explicitly concerns Erdős Problems #1176, universal over $`\aleph_1`$-chromatic graphs, with no shared centre. Not a resolution of the present existential countable high-girth problem. |
| [Erdős Problems source card for EGH75](https://erdosproblems.ai/wiki/library/set_theory/erdos_1975_set_systems_having_large_chromatic_number) and [its Problem 3 card](https://erdosproblems.ai/wiki/library/set_theory/erdos_1975_set_systems_having_large_chromatic_number/problem_3) | The indexed simultaneous-colouring conjecture is EGH75 Problem 3, not Problem 7. The 1975 paper also underlies #593 and #1177 on 3-uniform hypergraphs; those are different. No catalogue number is assigned here. |

Also searched the exact paper title jointly with *Problem 7*, the
original phrase *short circuitless graph*, the author surnames
jointly with *simultaneous chromatic number* or *rainbow star*, and
equivalent descriptions in terms of a missing incident label,
finite common neighbourhoods, absence of $`K_{2,\aleph_0}`$, and
monochromatic stars under finite vertex partitions. Included general
web indexing, arXiv, Hexagon, the Erdős Problems and Erdős Problem a
Day catalogues, Mathematical Reviews/Zentralblatt records exposed by
the search, and public work registries. No matching prior proof or
disproof of the exact rooted infinite-palette assertion was located.
The repository issue and branch check is recorded in
[the tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/1020).

## Scope and significance

This is the entire question posed in Problem 7 of a 1975 foundational
memoir, not the value of an isolated uniformity or a numerical
search. The result identifies a qualitative difference between
global and local simultaneous colouring: unlimited girth for the
global version, but a forced quadrilateral for the rooted version
with the same two palettes. The common-neighbourhood obstruction
also strengthens the original answer from exclusion of a single
cycle to unavoidable infinite bicliques with any finite side;
the construction shows a biclique with both sides infinite is not
forced. The new result is the obstruction and the stronger
biclique-controlled construction, not the already known existence
of some triangle-free witness.
