# Ádám’s conjecture

**Status:** full conjecture negation kernel-verified as a standalone candidate; accepted-package registration and aggregate gate pending. Published resolution, not a new mathematical discovery. Tracking issue [#506](https://github.com/1337isnot1337/solved-conjectures/issues/506).

## Attribution and exact scope

A. Ádám, Research Problem 2–10, Journal of Combinatorial Theory 2 (1967), p. 393, as cited and restated in the resolution paper. The original 1967 page was not directly retrieved in this session.

Bernard Elspas and James Turner, [Graphs with circulant adjacency matrices](https://doi.org/10.1016/S0021-9800(70)80068-0), Journal of Combinatorial Theory 9 (1970), 297–307, §2, p. 299. The counterexample and even/odd isomorphism were read in the full-text mirror at https://www.academia.edu/80625490/Graphs_with_circulant_adjacency_matrices. Earlier technical-report priority and first Lean formalization priority are not claimed.

For any positive n and any zero-free symmetric connection sets S and T in the additive group Z/nZ, the conjecture asserts that an isomorphism of the two circulant graphs implies T=kS for a unit k modulo n. This is the substantive direction of the original equivalence; its failure refutes the full universal claim, including the directed version, since the witness is undirected. The later classification of all orders with the CI property is a separate theorem, not claimed here.

The Lean model represents residue classes by Fin n, connection sets by their Boolean characteristic functions, adjacency by membership of y-x, graph isomorphism by a bijection preserving adjacency in both directions, and multiplication by a unit via gcd(k,n)=1 and equality of the image and target membership predicates. The final declaration is `PublishedAdam.conjecture_false : ¬ PublishedAdam.conjecture`, with no order fixed in the conjecture itself.

## Source witness and independent check

- n=16, S={1,2,7,9,14,15}, T={2,3,5,11,13,14}.
- f(x)=x for even residues and x+4 mod 16 for odd residues, exactly as given in the 1970 paper.
- Offline Python independently passed bijectivity, all 256 adjacency equivalences, and exclusion of all eight units:

```python
S = {1,2,7,9,14,15}
T = {2,3,5,11,13,14}
f = lambda x: (x + 4 * (x % 2)) % 16
assert len({f(x) for x in range(16)}) == 16
assert all(((y-x)%16 in S) == ((f(y)-f(x))%16 in T)
           for x in range(16) for y in range(16))
assert all({(k*x)%16 for x in S} != T for k in range(1,16,2))
```

The conjecture is not a numerical classification at n=16; that witness is sufficient for its universal negation. No claims of proof novelty or minimality are made.

## Verification gate

Candidate source: `lean/Conjectures/AdamCirculant.lean`. On 2026-11-24 15:33 UTC, the [hosted candidate run 45426573246, job 138560079412](https://github.com/1337isnot1337/solved-conjectures/actions/runs/45426573246/job/138560079412) passed on PR merge commit `8283193` (candidate head `b30353304cbcc30f3877cf3c3f17e3165131f10a`, base `91790ee50d0c3d6b16ad8c3035e661ac821544fd`). The unchanged Lean source blob `dced8d9e6aac9882501c201f3567a8ec8ecf7421` compiled with Lean 4.35.0. `#print axioms PublishedAdam.conjecture_false` reported only `propext` and `Quot.sound`. The repository candidate helper audited eight project theorems against the standard-axiom whitelist; `lake env leanchecker Conjectures.AdamCirculant` passed. Local execution was blocked by persistent Pyroam connector errors and ephemeral toolchain extraction ENOSPC; the successful receipt is hosted, not local. The ordinary aggregate repository gate and accepted-package registration remain separate obligations. Do not add to the new-discovery README counts.

Bounded duplicate search: main/research README and project issues/code, mathlib and formal-conjectures code searches for Elspas, and web searches for Lean/Ádám/circulants returned no matching completed proof. This is not an exhaustive search of every formalization project or a first-formalization claim.
