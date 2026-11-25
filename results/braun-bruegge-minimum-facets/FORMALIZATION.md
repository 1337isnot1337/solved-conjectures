# Lean formalization

The theorem `BraunBruegge.braun_bruegge_minimum_facets` proves Braun–Bruegge’s Conjecture 2(3)–(4). For every finite connected simple graph with at least two vertices, it bounds the number of facets of the symmetric edge polytope below by the balanced complete bipartite count. Equality is equivalent to a graph isomorphism to the complete bipartite graph with part sizes `n / 2` and `(n + 1) / 2`. `card_balancedCompleteBipartite_facets` proves attainment. The formulas `balancedFacetMinimum_even` and `balancedFacetMinimum_odd` give (2^{k+1}-2) and (3\cdot 2^k-2) for orders (2k) and (2k+1). [Lean theorem](../../lean/Conjectures/BraunBrueggeMinimum.lean)

The polytope is the convex hull of the actual oriented edge vectors in the real coordinate space. Its facets are maximal proper nonempty exposed faces. The proof constructs a bijection to the extreme points of the polar with one fixed zero coordinate. It proves the tight-edge connectedness criterion, the strict distance-potential comparison for incomplete bipartite graphs, and the strict bound for nonbipartite graphs by counting matching face vertices and recovering additional binary vertices. [Written proof](PROOF.md)

The proof closure passed strict compilation of 19 modules. The transitive axiom audit covered all 433 owned declarations, including 189 private declarations, and checked 30 named endpoints. The pinned kernel replay passed. The [receipt](../../docs/verification/lean-braun-bruegge-complete-20261124/receipt.json) records source and verifier hashes. The [fixed-matching-number refinement](FIXED-MATCHING.md) remains a written supplement. The two maximum clauses of the source conjecture are outside this result’s scope.

Run the scoped gate from the repository root with the pinned Lean toolchain and Mathlib available.

```bash
python3 scripts/verify_lean_target.py \
  --root Conjectures.BraunBrueggeMinimum \
  --require BraunBruegge.braun_bruegge_minimum_facets \
  --require BraunBruegge.card_balancedCompleteBipartite_facets \
  --out /tmp/braun-bruegge-minimum-lean
```
