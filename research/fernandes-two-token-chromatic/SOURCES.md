# Source and prior-resolution check

- **Exact source.** Cristina G. Fernandes, Carla N. Lintzmayer, Juan P.
  Peña, Giovanne Santos, Ana Trujillo-Negrete and José Zamora,
  [*A study on token digraphs*](https://doi.org/10.1016/j.disc.2025.114951),
  *Discrete Mathematics* 349 (2026), 114951; [published version,
  Appendix A, Conjecture A.1, p. 12](https://repositorio.unab.cl/server/api/core/bitstreams/545a6b1b-f821-46c6-b3ee-d832e4f99dda/content#page=12).
  The exact target is the original classification of **all** finite
  undirected base graphs with strict two-token chromatic decrease.
  The even-complete direction is in the original paper, as are
  obstructions for the stated odd-wheel and Mycielski cases.
- Their distinct non-complete example in the final paragraph of the
  appendix is the complement of a five-cycle inside K8, with strict
  decrease only for four tokens, not two. It is not an earlier
  counterexample to Conjecture A.1.
- [Fabila-Monroy et al., *Token Graphs*](https://arxiv.org/abs/0910.4774)
  give earlier chromatic bounds, complete-graph examples, and
  a different open question about the gap when the number of tokens
  is unrestricted. The authors also cite
  Alavi, Behzad, Erdős and Lick, *Double vertex graphs* (1991).
  [Alavi, Lick and Liu's survey](https://doi.org/10.1007/s003730200055)
  uses “double vertex graph” for the same two-token operation.
  The current target was proposed by Fernandes et al., not Erdős.
- [Luo and Hu, *Reconstruction and Symmetry of Two-Token Graphs*](https://arxiv.org/abs/2610.14135)
  address a conjecture about isomorphism and automorphisms, not chromatic
  decrease. [*On supertoken graphs*](https://arxiv.org/abs/2604.06164)
  concerns additional token placements and a different chromatic graph.
- Search on 2026-11-27 covered the title, DOI, exact statement and
  Appendix A.1 label, the author names, both “two-token” and “double
  vertex graph” terminology, the strict-decrease wording, and
  searches for eleven-vertex examples and five-color configurations.
  It included arXiv, journal and author publication indexes, MathWorld's
  token-graph entry, and repo issue searches. No earlier proof or
  counterexample to the specific classification was located.
  This is a bounded literature search, not a claim that no one
  investigated the question.

Discovery used a SAT search for a coloring of the edges of a complete
graph with the following restriction: pairs obtained from equal-colored
two-edge paths must form a triangle-free graph. The result is the
explicit cycle table above. The table is sufficient without the SAT
solver and has been checked against the definition of token adjacency.
