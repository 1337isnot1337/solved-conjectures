# Wild number of K_n, open range 13 ≤ n ≤ 154: third attempt (wild3)

Status (22 Nov 2026): **no new value of n is proved; the open range is still 13 ≤ n ≤ 154.** This file was written by the orchestrator from the agent's hand-back report (the agent could not write it). Log and scripts: this folder.

Products of this attempt:
- **Route 1 (deterministic peeling):** an exact potential identity (Theorem P, proved). It gives a rigorous "never stuck" test and a first-moment finishing test, and isolates the one missing lemma (a decrease lemma for Φ).
- **SAT with counterexample-guided refinement:** sound, validated encoding. Re-proves the paper's n = 9 and n = 11 in seconds (solver trusted, no DRAT certificate checked). For n = 13 it reduces the conjecture to one explicit finite statement, A13 (two DIMACS files), which no solver decided within the CPU budget.
- Routes 2 and 4 analysed; the reason each stalls is recorded.

Labels: **[proved]** complete written proof; **[computer]** solver or exhaustive check; **[heuristic]** evidence only.

## 1. Setting

n is odd. Colour u is the perfect matching M_u of V∖{u}; c(xy) is the colour of edge xy. Put π_u = {{u}} ∪ M_u, a partition of V. A block partition β is seal-free ⇔ β ∨ π_u = 1̂ for every u (join in the partition lattice).

**Peeling.** A state is a set T with one partition π_u|_T per colour. A move removes a triple A ⊆ T; it is **legal** iff A is not a union of π_u-parts for any u. After the move, the parts meeting A are merged and A is removed: M_A = (∪_{P∩A≠∅} P) ∖ A becomes one part.

**Lemma 1 [proved].** A triple partition A_1, …, A_t, listed in any order, is seal-free ⇔ the moves A_1, …, A_{t−1} are all legal. (When n ≢ 0 mod 3, peel the 4-/5-blocks first.) Proof idea: π_u|_{T_k} is the trace on T_k of the components of H_u^k = M_u plus a clique on each block peeled so far; a move is illegal exactly when a component becomes trapped inside the peeled set, and such a component is a closed union of blocks, which disconnects Q_u.

## 2. Route 1: an exact potential for peeling

For a state with |T| = m ≡ 0 (mod 3) and β a uniformly random triple partition of T, let p_m(s) = 𝒯(s)𝒯(m−s)/𝒯(m), where 𝒯(s) is the number of triple partitions of an s-set, and
Φ(T) = Σ_u Σ_S p_m(|S|), over nonempty proper unions S of π_u-parts with 3 | |S|.
Then Pr[completion fails] ≤ Φ/2. At the start Φ(V) = 2E[X] (about 4.4–5.2, independent of the factorization).

**Theorem P [proved].** Fix a vertex x, K = C(m−1, 2). Let β_A be the number of colours for which A is a union of parts, and Λ(A) the p-mass of the sets S that A straddles (A meets S, A ⊄ S).
1. Σ_{A∋x} Φ_A = K·Φ(T), where Φ_A is the conditional value given that A is a block (total probability over the block of x).
2. For legal A, Φ_A = Φ(T∖A) (bijection S ↦ S for S disjoint from A, S ↦ S∖A for S ⊇ A).
3. For illegal A, Φ_A ≥ Φ + 2β_A(1 − 1/K) − Λ(A) (conditional/unconditional ratios C(m−1,2)/C(m−|S|−1,2) ≥ 1 for disjoint S and C(m−1,2)/C(|S|−1,2) ≥ 1 for S ⊇ A; A and T∖A get conditional probability 1).
4. Hence if Λ(A) < 2β_A(1 − 1/K) for every illegal A ∋ x, a legal A ∋ x exists and min Φ(T∖A) ≤ Φ − Σ_{illegal A}(2β_A(1−1/K) − Λ(A))/#legal.
5. If Φ < 2 at some state, a seal-free completion exists.
Also Λ(A) ≤ 2 Σ_{v∈A} μ(v), μ(v) the mass of the small sets through v.

**Missing:** a lemma that Φ falls below 2 along some legal path (total decrease about 2.4–3.4 needed). The decrease per step is about 2|B_x|/K, B_x the illegal triples through x; invalid triples alone supply only about 2 in total, and no invariant bounding |B_x| from below along the path was found.

**Numerics [heuristic]** (`phi.py`, exact Φ via knapsack over part sizes, Φ-greedy):

| n | Φ(V) | Φ at m ≈ 2n/3 | Φ at m ≈ n/2 | first m with Φ < 2 | m/n |
|---|---|---|---|---|---|
| 21 (3 factorizations) | 5.21 | 4.23–4.26 (m = 15) | 3.30–3.56 (m = 12) | 6 | 0.29 |
| 45 | 4.90 | 3.56 (m = 30) | 2.41 (m = 21) | 15 | 0.33 |
| 63 | 4.43 | 3.22 (m = 42) | 2.20 (m = 30) | 27 | 0.43 |

For small n, Φ < 2 is reached only at the very end, so an end-game argument is unavoidable there. For larger n it is reached while m is a constant fraction of n, where the never-stuck condition holds automatically (μ = O(1/m)); there only a decrease lemma in the large-m regime is needed.

## 3. SAT with counterexample-guided refinement (`cegar.py`)

The solver looks for a factorization in which every partition of a growing family F has a seal. UNSAT means every factorization has a seal-free member of F, which proves the conjecture for that n (and n + 1).

- Variables x_{ab,u} (edge ab has colour u); each edge exactly one colour; each v ≠ u meets exactly one u-edge.
- Each union U of blocks gets z_U → ∨_u w_{U,u}, with w_{U,u} → "every v ∈ U∖u has its u-partner in U"; each partition adds ∨_U z_U.
- Symmetry breaking (sound): the colours at vertex 0 form a fixed-point-free permutation of {1, …, n−1}; relabelling conjugates it, so one canonical representative per cycle type, one run per type.
- Validation (`encval.py`): 360 partitions at n = 9, 11, 13, 0 mismatches against a direct seal check.

Results [computer, CaDiCaL 1.5.3 via PySAT, no DRAT check]: n = 9 UNSAT instantly (family of 42 partitions). n = 11: all 12 cycle types UNSAT, about 1 s each, with 200 seal-free partitions added per iteration (`n11b.out`); with 5 per iteration one type took over 70 s. n = 13: undecided after 9.5 min with 1000 and 5000 partitions per iteration.

## 4. n = 13: reduction to one finite statement

D is a 4-set, W = V∖D (9 vertices), k(D) = number of edges of D coloured by a vertex of D (invalid triples inside D).

**Lemma 13.0 [proved].** Every near-1-factorization of K_13 has a rainbow 4-set D with k(D) ≤ 1. (At most 13·C(6,2) = 195 four-sets are non-rainbow; Σ_D k(D) = 78·10 = 780, so at most 390 have k ≥ 2; 195 + 390 < 715.)

**Lemma 13.1 [proved].** For rainbow D, {D, A, B, C} is seal-free ⇔ none of A, B, C lies in 𝔅(D) = {X ⊆ W : X closed, or X ∪ D closed}. (Up to complement the unions are D, A, B, C, A∪B, A∪C, B∪C = V∖(A∪D); D is not closed since it is rainbow.)

**Lemma 13.2 [proved; validated by `val13.py` on 309,120 (D, split) pairs, 0 mismatches].** Explicit form of 𝔅 for k ≤ 1, with unc_c = W∖({c} ∪ vertices covered by c-edges inside W):
- class sizes inside W: a W-colour that colours an edge of D has 3 edges, other W-colours 2; a D-colour has 4 edges if it colours an edge of D, otherwise 3;
- invalid triples {u} ∪ e, e a u-edge in W: 24 − k of them;
- closed with D: unc_d for each D-colour d with no d-edge inside D; unc_d ∪ e for each d-edge e in W when d colours an edge of D (|unc_d| = 1); {u} ∪ unc_u for each W-colour u colouring an edge of D (|unc_u| = 2);
- so |𝔅| ≤ 34 (k = 0), ≤ 35 (k = 1).

**Lemma A13(k), k = 0, 1 (open, finite).** Colour the 36 edges of K_9 on W with colours from W ∪ {d0, …, d3} so that no edge gets the colour of an endpoint, every colour class is a matching, and the class sizes are as in Lemma 13.2. Then some split of W into three triples avoids 𝔅. (A relaxation: it could in principle fail even if n = 13 holds.)

**Theorem 13 (conditional) [proved].** A13(0) and A13(1) imply the conjecture for n = 13 and n = 14.

Status: `abs13.py` writes `abs13_k0.cnf`, `abs13_k1.cnf` (≈4.1k–4.3k variables, ≈9.6k clauses). Undecided after 9.5 min by CaDiCaL 1.5.3, CaDiCaL 1.9.5 and Kissat (k = 0), CaDiCaL 1.5.3 (k = 1). Cube-and-conquer too costly as tried (Glucose cannot settle a cube with the three 2-edge colours fixed in 20 s; thousands of cubes). Fixed-D full model (`local_sat.py`) also undecided.

Evidence [heuristic]: in 6 factorizations every rainbow D with k ≤ 1 leaves ≥ 49 good splits out of 280 (`good13.py`). The restriction k ≤ 1 is needed: SAT found a factorization with a rainbow D, k = 4, where all 280 completions have a seal (`n13local.out`).

Sufficient counting condition [proved]: #good splits = 280 − 10|𝔅| + P₂ − P₃ ≥ 280 − 10|𝔅| + (2/3)P₂ (P₂ disjoint pairs of bad triples, P₃ splits with all three blocks bad); for k = 0, P₂ ≥ 91 suffices. Observed minimum P₂: 102 (k = 0), 94 (k = 1; the 2/3 bound is not enough). Provable local lower bounds sum to only about 75.

## 5. Routes 2 and 4, superblocks

- **Route 2 (delete-and-repair).** Swapping u with a vertex y of another block is a 2-switch in every Q_w; it breaks colour w only through a crossed 2-edge cut or a bridge, and bridges are everywhere (each block is pendant in Q_w for the 3 colours of its internal edges). Controlling them needs bounds on almost-closed sets (Θ(n) times more numerous than closed sets), which the LLL does not give. Even removing all j = 1 events only moves the structural constant from 0.01005 to 0.0134 (threshold about 120–130 before paying for repairs). Not pursued.
- **Route 4 (induction).** After removing a block each colour class misses about 4 vertices; the cycle rank of Q_u becomes m/6 − c/2 + 1, so only O(1) induction steps are possible. The strong-invariant variant fails generically (about |T| blocks become isolated).
- **Superblock product model (not done).** Fixed 9-sets split independently remove j = 1 events and in-superblock j = 2 events (j = 2 weight about 20a²/n per superblock), but need a deterministic superblock partition with worst-case local counts — the design problem that blocked IMPROVEMENT.md §7.

## 6. Recommendation

1. **n = 13–14:** decide `abs13_k0.cnf`, `abs13_k1.cnf` with hours of CPU, lex-leader symmetry breaking for Sym(6)×Sym(3)×Sym(4), cube-and-conquer, DRAT-checked UNSAT proofs. The same pipeline might extend to n = 15–20 (fix 1–2 generic blocks by counting, solve a 9- or 12-point abstract end-game).
2. **Lowering 155:** prove a decrease lemma for Φ in the regime m ≥ cn (e.g. track the j = 1 and j = 2 parts of Φ, differential-equation-method style). With Theorem P this gives a deterministic proof for all n ≥ N₀.
3. Stop LLL counting (155 is its limit, per review2).

Confidence: Theorem P and Lemmas 1, 13.0–13.2 high (complete proofs; 13.1/13.2 also computer-validated). n = 9, 11 SAT results trust the solver. Everything else heuristic or undecided.

## 7. Files

| File | Contents |
|---|---|
| `LOG.md` | time-stamped log (CET) |
| `cegar.py`, `encval.py`, `n11b.out` | whole-conjecture SAT search, encoding check, n = 11 result |
| `n13.out`, `n13b.out` | undecided n = 13 runs |
| `local_sat.py`, `n13local.out` | fixed-D local lemma; k = 4 counterexample |
| `lib13.py`, `val13.py` | Lemmas 13.1–13.2 and their validation |
| `abs13.py`, `abs13_k0.cnf`, `abs13_k1.cnf` | A13 encoding and DIMACS files |
| `cube13.py`, `cubetest.py` | cube-and-conquer attempts |
| `exp13.py`, `good13.py`, `p2stat.py` | statistics on K_13 end-games |
| `phi.py`, `phi63.out` | potential trajectories |
| `fac.py` | copy of the second referee's factorization generator |
