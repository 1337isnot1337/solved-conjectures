# Lean verification of the bicyclic facet conjectures

Lean proves the global bicyclic maximum and the maximum within theta graphs, counting the geometric facets of the symmetric edge polytope in both theorems. These are Conjectures 13, 32 and 33 of Benjamin Braun and Kaitlin Bruegge. [Primary paper](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf) · [Written global proof](PROOF.md) · [Written theta proof](THETA-MAXIMIZER.md).

For each $n\ge4$, every connected simple graph on $n$ vertices with $n+1$ edges has at most the stated wedge benchmark number of facets. Lean also constructs an attaining graph at each such order. The proof uses exact cycle counts, graph gluing, a bridge reduction, and a classification of the bridgeless case by cycles and ears. [Global maximum theorem](../../lean/Conjectures/BraunBrueggeBicyclicMaximum.lean).

For each $n\ge10$, consider three positive path lengths with sum $n+1$. When $n$ is even the maximizing triple has one path of length one and two even paths differing by at most two. When $n$ is odd it has one path of length two and two odd paths differing by at most two. Every maximizing triple is a permutation of the specified one. The two parity formulas in Lean display all four cases from the paper. [Theta optimizer theorem](../../lean/Conjectures/BraunBrueggeThetaOptimizer.lean).

The finite part covers all 82,037 unordered positive triples with total length from 11 through 143. The Lean proof connects the integer binomial counts to the geometric facets and proves that permuting paths preserves the count. For every total length from 144 onward it uses Wallis bounds, strict balancing and a bound on the binomial masses away from the center. [Finite comparison](../../lean/Conjectures/BraunBrueggeThetaOptimizerFinite.lean) · [Uniform comparison](../../lean/Conjectures/BraunBrueggeThetaOptimizerLarge.lean).

## Verification

Cinna Davis's [research proof of the global maximum](https://github.com/1337isnot1337/solved-conjectures/commit/b8cab645) supplies the graph reductions. The joint gate checks the complete source closure of both theorems and replays it with the pinned stock Lean kernel. Lean audited all 2,396 project declarations across 96 modules, including 2,043 theorems and 1,254 private declarations. All 24 required endpoints passed. [Joint receipt](verification/lean-receipt.json).

From the repository root, the following command repeats the strict build, declaration audit and stock-kernel replay. It uses the repository's pinned Lean toolchain and Mathlib dependencies.

```bash
receipt=results/braun-bruegge-bicyclic-facets/verification/lean-receipt.json
mapfile -t endpoints < <(jq -r '.required_endpoints[]' "$receipt")
args=()
for theorem in "${endpoints[@]}"; do
  args+=(--require "$theorem")
done
python3 scripts/verify_lean_target.py --root Conjectures.BraunBrueggeBicyclicFacets \
  "${args[@]}" --out /tmp/braun-bruegge-bicyclic-facets-replay
```

If you use this result, please credit the authors, cite the original conjectures and link to the proof or verification record you used. [Cinna Davis](https://itsdavis.com/) · [Source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/braun-bruegge-bicyclic-facets).
