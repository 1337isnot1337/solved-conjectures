# Source and prior-resolution check

## Exact question and significance

David Gajser and Bojan Mohar, [*Minimal Normal Graph Covers*,
arXiv:1601.01129v1](https://arxiv.org/pdf/1601.01129#page=15),
published in *Combinatorica* 38 (2018), 1415–1436
([DOI](https://doi.org/10.1007/s00493-017-3559-2)).
The target is the unnumbered question at the end of §4,
on p. 15 of the freely available author preprint: for every fixed
positive clique bound, must the maximum order grow at most
polynomially in the stable-set bound? The proof resolves that entire
question for all clique bounds and gives the optimal exponent,
not just a new fixed numerical case. The result is an asymmetric
extremal theorem for normal covers, a generalization of the
clique/stable-set geometry behind perfect graphs.

The same paper's broader Problem 1 asks for the extremal function
with both arguments free. Its Lemma 3.4 gives an exponential
bound, and its Proposition 4.2 gives exact smaller cases and
cubic-order upper and lower bounds at clique size three; the
unrestricted fixed-clique-bound polynomial question is then posed
explicitly. The C-reduce operation of Claim 3.1 deletes a private
vertex from one clique when reducing a minimal cover; the proof here
instead fixes a stable set and constructs a different restricted
normal cover for each of its vertices. The paper's eventual exact
classification and the two-variable diagonal growth are not claimed
here. The prefix-tree lower construction extends the small-bound
phenomenon already exhibited in §4, not the discovery of those small
cases.

The [Körner–de Simone normal graph conjecture](https://arxiv.org/abs/1508.05487),
disproved by Harutyunyan, Pastor and Thomassé, concerns recognition
by three forbidden induced subgraphs, not this extremal question.
The random-graph normality question in the introduction is also
different.

## Bounded search

Search on 2026-11-27: exact title and DOI; authors plus polynomial,
fixed-parameter growth, and the original function notation; normal
cover and minimum/maximum normal graph terminology; singleton
cross-intersections, rectangle partitions with bounded row and
column load, and Bollobás set pairs; open-problem databases,
preprint repositories, and public code/formal-library indexes.

- [Mohar’s publication list](https://www.sfu.ca/~mohar/Bibsci4.html)
  identifies this journal version and links its author preprint.
  [Crossref](https://api.crossref.org/works/10.1007/s00493-017-3559-2)
  and [OpenAlex](https://openalex.org/W2223490652) returned no
  indexed citing works at the time of lookup. That is not evidence
  that the paper has never been cited. The Semantic Scholar
  citation endpoint was rate-limited.
- The [graph-conjecture literature inventory](https://graph-theory-ai.github.io/graph-conjectures/arxiv/AX_normal_graphs_cover_sizes_max_order/)
  tracks the broader extremal question and reports no resolution
  through its May 2026 check. Its November 2026 candidate list
  separately transcribes the polynomial question at the end of §4.
  Both are leads, not authorities for a theorem.
- [Javadi–Maleki–Omoomi](https://arxiv.org/abs/1210.6965), §§5–6,
  discuss local rectangle covers of a triangular zero–one matrix
  and variants of Bollobás's set-pairs theorem; their diagonal
  conditions are different. [Pinto](https://doi.org/10.37236/3595)
  studies the minimum local load needed to cover or partition
  a prescribed graph into bicliques, not the maximum number of
  nonempty tiles of an all-one matrix with both local loads
  bounded. [Füredi, Gyárfás and Király](https://doi.org/10.1017/S0963548323000044)
  study systems with disjoint diagonal pairs and one-point
  off-diagonal intersections. In a normal cover the two members
  chosen for a vertex intersect at that vertex, so the disjoint
  diagonal hypothesis cannot simply be used.
- Neither title, author/DOI nor equivalent-formulation searches
  surfaced an earlier proof, disproof, or final formalization of
  the polynomial question. The repo issue searches found no
  pre-existing exact lane. The new claim is deliberately limited
  to the separately posed polynomial question and optimal exponent.

Reproducibility: run `python verify.py` in this directory. Finite
checks test the construction and the branching description, not
the truth of the theorem by exhaustion. The proof is written and
does not use Lean. Independent mathematical review is requested
on [issue #989](https://github.com/1337isnot1337/solved-conjectures/issues/989).
