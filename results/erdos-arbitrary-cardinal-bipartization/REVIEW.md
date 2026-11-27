# Independent proof review

**Verdict (2026-11-27): no mathematical gap found.** An independent
AI mathematical re-read checked the canonical proof at `cc9c1f2` and
the staged proof at `112f76ee7bd7207f968ea83082c3d1383280ae7e`.
The staged proof blob was verified to be
`4ff96a752f7cb1680854c9261bd75e5673bae651`. This is not a claim
of outside human review or formal verification.

* **Scope.** [Erdős, §3, p. 137](https://www.renyi.hu/~p_erdos/1982-24.pdf#page=7)
  proposes the exponent improvement from 3/2 to 1+ε in the benchmark
  above every prescribed chromatic cardinal. The next paragraph
  changes to a different countable-chromatic question. [Erdős–Hajnal–Szemerédi,
  Theorems 3–4](https://www.renyi.hu/~p_erdos/1982-11.pdf#page=6)
  give the 3/2 two-colour bound and a near-linear exponent with a
  larger finite palette, respectively. [Lambie-Hanson](https://arxiv.org/abs/1902.08177)
  supplies the separate exact-ℵ₁ case, not the arbitrary-cardinal one.
* **Defect bound.** For each arc with conflicting heavy-endpoint
  requests, the auxiliary orientation specifies exactly one failure
  and charges it to the corresponding source. The inductive
  outdegree therefore bounds failures separately at each heavy
  centre. At a light centre charge pairs to the smaller incidence
  side. Incidences enter the total only at their two arc ends.
* **Shift embedding and girth.** The lexicographic sliding windows
  preserve edges and identify the original tuple. In the reflected
  sign argument, the overlong suffix has nonpositive sign sum,
  justifying the index update; a forward step at index zero strictly
  increases the tracked entry. This rules out the short odd cycle.
* **Cardinal and strict bound.** Outgoing-arc colour sets distinguish
  both ends of every arc; iterating the power-set bound gives
  arbitrary chromatic cardinal. Choosing the larger shift order
  makes all finitely many small orders bipartite while retaining a
  constant that allows the strict deletion inequality for larger orders.

The finite regression checks in the draft are supplementary. The
additional transitivity and vector-chromatic notes are not part of
this review.
