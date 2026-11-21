# González D’León–Wachs research checkpoint

Status: no new resolution. Coordination [issue #202](https://github.com/1337isnot1337/solved-conjectures/issues/202). Date: 2026-11-21 UTC.

## Open targets

Primary source: Rafael S. González D’León and Michelle L. Wachs, [*Weighted bond posets and a new chromatic symmetric function*, arXiv:2608.08692v2](https://arxiv.org/html/2608.08692v2).

Conjecture 6.21 asserts elementary positivity of the sign-corrected Möbius symmetric function for every finite graph, together with elementary positivity of its difference from the function of any spanning subgraph with the same number of components. Conjecture 7.3 asserts Schur-log-concavity of the full weighted-bond symmetric function for every finite graph. These are separate numbered assertions; positive finite checks do not resolve either one.

The [authors' 18 November 2026 seminar](https://math.washington.edu/events/2026-11-18/weighted-bond-posets-and-new-chromatic-symmetric-function) still poses elementary positivity and Schur-log-concavity. Targeted searches of both engines using authors, exact identifier, conjecture numbers, and refutation terminology located no settlement of 6.21 or 7.3. A full final priority audit would still be required before promoting any candidate resolution.

## Exact implementation

`screen.py` computes Möbius symmetric functions in the complete-homogeneous basis from Theorem 5.7, equation (5.3). A subset recurrence partitions each induced graph by the unique block containing its smallest vertex. Only connected blocks are permitted. The same partition sums give the homogeneous components of equation (7.1).

Elementary-basis conversion uses the exact reciprocal generating-function identity between complete and elementary functions. Schur-basis conversion uses repeated Pieri horizontal strips. All coefficients are integers. The validation checks the source's path and triangle examples and the reversed chromatic polynomial for paths. `n10-results.jsonl` records a reproducible bounded graph screen with seed 260808692, including cycles, complete bipartite graphs, a wheel, random graphs, and all connected single-edge deletions of each connected graph. The bounded screen completed: 86 graphs on 10 vertices, 61 connected, no negative coefficient in the tested conditions; elapsed time 360.28 seconds. The positive finite result is not a proof.

Two displayed source examples should not be used blindly as test expectations. Equations (7.3)/(7.4) use a coefficient orientation inconsistent with equation (7.1)'s constant term 1 and the reversal identity (7.2). Example 7.4 prints the two Schur labels in reverse order: its own path polynomial gives $`3s_2+2s_{1,1}`$, not $`3s_{1,1}+2s_2`$. These corrections do not settle either target.

## Complete bounded corpus screen

`corpus_screen.py` and `graph8c-results.jsonl` record a completed exact screen of the 11,117 connected graphs on eight vertices in [Brendan McKay's published collection](https://users.cecs.anu.edu.au/~bdm/data/graphs.html). Every input passed the tested elementary-positivity condition 6.21(1) and the Schur-log-concavity condition 7.3. This run did not test every edge deletion for condition 6.21(2). It completed in 108.09 seconds with two local worker processes.

The input file is [graph8c.g6](https://users.cecs.anu.edu.au/~bdm/data/graph8c.g6), 77,819 bytes, SHA-256 `0002354f1ab3344a2706626a037ad15367bf23a2163aa68f552c3a169ca9a036`. McKay releases the graph data under CC BY 4.0. The corpus is referenced rather than duplicated in this checkpoint. After obtaining it, the offline replay is:

```sh
python corpus_screen.py graph8c.g6 --workers 2
```

The graph6 decoder uses the specified column order of the upper adjacency triangle. The corpus contains 11,117 distinct records, and the checker independently verifies that every decoded graph is connected. The script uses the same separately validated integer symmetric-function arithmetic described above. No finite positive result here resolves a conjecture.

## Excluded: Conjecture 4.13(2)

The paper also conjectures real-rootedness of the sign-corrected polynomial difference for a graph and a spanning subgraph with the same number of components. We independently found the following construction, then immediately excluded it because the exact same proof was already public in [TrureTuring's prior dossier](https://www.trureturing.org/research/gonzalez-dleon-wachs-conjecture-4-13-2-refutation/). The prior [source inventory](https://www.trureturing.org/knowledge/node/755bec1ba12f129c64133f45eebf3a2c497f165f663efdb72e8ff06aa2e64777/) records commit `535a6648df930c3bfdca8a945bfcebdb0d0e1ec7`; this is an exclusion, not a new result.

Let $`G=3K_3`$ and let $`H=3P_3`$ use a spanning path in each triangle. Both graphs have nine vertices and three components. With

```math
A=2+5t+2t^2,\qquad B=1+3t+t^2,
```

component multiplicativity gives $`\mu_G-\mu_H=A^3-B^3`$. The factorization is

```math
A^3-B^3=(1+t)^2(7+37t+63t^2+37t^3+7t^4).
```

The quartic is $`A^2+AB+B^2`$, strictly positive on the real line: its vanishing would force $`A=B=0`$, whereas $`A-B=(1+t)^2`$ and $`B(-1)=-1`$. This is exactly the prior counterexample, up to the equivalent last algebraic step. We performed no Lean verification and make no new count or priority claim from it.

The auxiliary `rr_screen.py` was written before this exclusion. Its bounded connected-graph screen is retained only as research provenance. The already resolved all-graphs assertion will not be replaced by an unposed connected-only variant.
