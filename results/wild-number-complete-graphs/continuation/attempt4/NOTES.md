# wild4: notes (A13 cube-and-conquer, Φ-decrease lemma)

Status: **nothing new is proved about the conjecture; the open range is still 13 ≤ n ≤ 154.** A13(0) is about half decided by computer (364 of 773 cubes UNSAT, none SAT). A13(1) was not started.

Labels: [proved] = complete written proof; [computer] = solver run (Kissat trusted; DRAT proofs not checked); [heuristic] = numerics only.

## A. Task A: deciding A13(k)

### A.1 Encoding and validation
- `gen13.py` re-implements wild3's A13(k): W = {0..8}, D-colours 9..12. For k=0: heavy colD = {0..5} (3 edges each), light N = {6,7,8} (2 edges each), D-colours 3 edges each. For k=1: colD = {0..4}, N = {5..8}, d0 = 9 (4 edges), d1..d3 = 10..12 (3 edges each).
- Bad triples (Lemma 13.2):
  - invalid triples {u} ∪ e;
  - unc_d for each size-3 D-colour d;
  - {u} ∪ unc_u for each heavy u;
  - k=1 only: {w*} ∪ e, where e is a d0-edge and w* is the W-vertex missed by d0.
- `val4.py` [computer]: on 1480 rainbow D with k ≤ 1, taken from 4 real factorizations of K_13, propagating the W-colouring gives exactly wild3's Bad(D). 0 mismatches.

### A.2 Symmetry group (derived from the encoding)
- k=0: G = Sym(colD) × Sym(N) × Sym({9..12}), order 103 680. A vertex and the colour with the same name move together.
- k=1: G = Sym(colD) × Sym(N) × Sym({10,11,12}), order 17 280. d0 is fixed: its class size and its Bad rule differ.

No other permutation is a symmetry:
- heavy and light vertices have different class sizes (3 against 2);
- a D-colour cannot swap with a vertex colour, because the endpoint rule and the Bad rules differ.

Every constraint and every Bad rule is defined uniformly in these labels. So G maps counterexamples to counterexamples [proved].

### A.3 Soundness of the symmetry breaking [proved]
1. **Global lex-leader** (used only in the first whole-instance run). The set of y-projections of solutions is G-invariant. The lex-minimal x* of any orbit satisfies x* ≤lex x*∘g for every g ∈ G, so adding these constraints for any subset of G (24 transpositions) keeps one solution per orbit. Truncating the comparison is still valid. `lextest.py` checks the clause pattern against the exact lex condition by brute force (8216 cases).
2. **Isomorph-free cubes.**
   - Fix x0. Its star is f: v ↦ c(x0 v), an injection with f(v) ≠ v.
   - Stab_G(x0) acts by conjugating the vertex part and relabelling the interchangeable D-colours. Its orbits are exactly the isomorphism classes of the type-labelled functional graph v → f(v): disjoint cycles of length ≥ 2, and paths ending at a D-colour sink (d0 is a distinguished sink).
   - `orbits.py` enumerates them. Brute-force orbit counts agree on 6 small cases (`orbcheck.py`), and orbit codes round-trip on 200 relabelled colourings (`orbtest2.py`).
   - Every counterexample is G-equivalent to one whose x0-star is a representative ρ. Hence all cubes UNSAT ⇒ A13(k).
   - k=0: x0 = a light vertex, 773 cubes.
   - k=1: x0 = w*, which is defined G-invariantly, so it is heavy or light. Each cube adds the unit "w* not covered by d0". This gives 1153 cubes (w* light) + 1400 cubes (w* heavy).
   - The global lex-leader is NOT combined with cubes: breaking constraints for different subgroups without a common order can be unsound.
3. **Residual symmetry inside a cube.** Stab(ρ) = {g ∈ Stab_G(x0): g fixes ρ} maps the counterexamples with star ρ onto themselves. Lex-leader for any subset of Stab(ρ) is therefore sound inside the cube. `cubesb.py` finds the elements by brute force over Stab_G(x0) (group orders 1–2304), checks each one, and uses up to 60.
4. **Redundant constraints** that hold in every counterexample:
   - exact bad indicators;
   - |Bad| ≤ 34 for k=0 (24 + 4 + 6) and ≤ 35 for k=1 (23 + 4 + 3 + 5).

   The cardinality made hard cubes 3–7× faster (36 s → 5 s). The following were tried and did not help:
   - "complement of a good triple contains ≥ 10 bad triples": slower;
   - P2 ≤ 15|Bad| − 420 (from 10·#good triples ≤ 20|Bad| − 2·P2): no gain.

### A.4 Runs [computer]
- Whole instance, Kissat 4.0.4 + global lex-leader: UNKNOWN after 14 min (1.4 GB proof, deleted).
- CP-SAT (1 worker) + counting constraints: UNKNOWN after 10 min.
- CP-SAT minimisation of the number of good splits over the relaxation found a colouring with 44 good splits (`best_k0.json`). Real factorizations have ≥ 49. The relaxation seems to have plenty of slack; the difficulty is counting, which CDCL handles badly.
- **Cubes, k=0: cubes 0–363 of 773 UNSATISFIABLE** (contiguous range), each in about 1–40 s. None SAT, none UNKNOWN. Cubes 364–772 were not run.
- **Cubes, k=1:** the driver was not started. 8 sample cubes (`k1test.py`) were all UNSAT in 1.3–23 s. Projected cost about 4–5 h at nice 19 on a shared core.
- Status file: `cubes/STATUS.txt` (from `check_complete.py`). Resume and exact commands: `cubes/README_RESUME.txt`, `resume.sh`, `cuberun.py`. Solver binary: `bin/kissat` (from the PyPI wheel passagemath-kissat 10.8.14).
- **Proofs:** gzipped binary DRAT for cubes 0–244 (1.9 GB) are kept in `cubes/`. They are unchecked (no drat-trim available here). Cubes 0–53 used the plain base CNF, 54–98 added residual SB, and 99 onward also added exact bad + cardinality; see README_RESUME.
- CEGAR helper `extend.py` is ready for a SAT cube; it tests whether the W-colouring extends to a full K_13 near-1-factorization. It was never needed.
- Remaining cost to settle n = 13/14: about 1 h CPU for k=0 plus 4–5 h for k=1 at the observed rates, then independent checking of the DRAT proofs.

### A.5 Plan for n = 15, 16, 17 (not attempted)
**n = 15** (which gives 16).
- Lemma 1 for a 3-block end-game on a 9-set W: a split {A, B, C} is good iff none of A, B, C is a union of parts of π_u|_W, for every colour u.
- Choose two disjoint triples D1, D2 by counting. The requirements: peeling them is legal, and D1 ∪ D2 is generic (for example no colour inside, and the merged parts are large).
- The end-game is then a 9-point abstract instance with 15 colours. Each W-colour has 1 + j_u edges in W and each D-colour has 2 + j_d edges in W, where j_c is the number of c-edges inside D1 ∪ D2. The Bad triples are the 3-unions of parts, the parts being edges, singletons and the merged parts M_{D1}, M_{D2}.
- Run the same pipeline: case split on the type of the D-structure, isomorph-free star cubes, cardinality on |Bad|.
- The instance is about the size of A13. The new part is a counting lemma for D1, D2 ("Lemma 15.0").

**n = 17:** blocks 3,3,3,4,4. Choose two 4-sets by counting and reuse the n = 13 abstraction twice.

## B. Task B: Φ-decrease

**Setting.**
- State T with |T| = m and K = C(m−1, 2).
- σ(S) = min(|S|, m − |S|); small(S) is the side of size σ.
- The weighted potential is L(T) = Σ_u Σ_{S∈𝒮_u} p_m(|S|)·σ(S)/3. This is the κ = 3 case of c(σ) = Π_{j=2}^{σ/3} 3j/(3j − κ), which equals σ/3 at κ = 3.
- Since σ ≥ 3 for every S, L ≥ Φ. So L < 2 implies a seal-free completion (Theorem P5).

**Lemma X [proved].** Let x ∈ T with I_x < K, where I_x is the number of illegal triples through x. Then some legal A ∋ x has
L(T∖A) ≤ L − μ(x) + Err_x.
Here:
- μ(x) = Σ_{S: x ∈ small(S)} p_m(|S|), with S and its complement both counted;
- Err_x = Σ_{illegal A∋x} Λ_x(A) / (K − I_x);
- Λ_x(A) is the p-mass of the sets that A straddles, weighted by their image σ/3.

Proof:
1. For a legal A, L(T∖A) = L_A (the bijection of Theorem P2, re-checked).
2. Exact per-set flow over the K triples through x: Σ_{A∋x} L_A = K·L*_x. Every set S with x ∈ small(S) moves to σ − 3, and every other set keeps its σ, so L*_x ≤ L − μ(x).
3. For an illegal A, the conditional ratios are ≥ 1, so L_A ≥ L*_x − Λ_x(A). The fail sets A and T∖A carry weight c(0) = 0, so they need no correction.
4. Average over the legal A.

Also Σ_x μ(x) = 3L, so L*_x drops at the full rate 3/m on average.

**Corollaries [proved].**
- Λ_x(A) ≤ ρ(x) + ν(y) + ν(z) for A = {x, y, z}, where ρ(x) = Σ_{S: x∈small(S)} p·(σ/3 − 1) and ν(v) = Σ_{S: v∈small(S)} p·σ/3.
- Averaging over x: some move gives
  L' ≤ L·(1 − 3/m) + 3·I_max·(Q2 − L) / (m·(K − I_max)), with Q2 = Σ_S p·σ²/3.
- **Conditional theorem:** along any path where 3·I_max·(Q2 − L)/(K − I_max) ≤ (3 − κ')·L, L contracts by (1 − κ'/m) per step.

**What is missing:** an invariant bounding the illegal degree I_max (equivalently, vertex-mass concentration from singletons) along the path. The trivial start bound I_v ≤ 3(n−1)/2 is in terms of n, while K ≈ m²/2. That makes the error term die near m ≈ √(4.5·n·Q2/L), about 60 for n = 153. Numerically I_max ≈ 1.5–2·m, but I have no proof of that.

**Numerics [heuristic; exact Fractions for the start state, `start_eff.py`]:**
- L(V) = 6.07 and Q2/L = 5.61 at n = 153.
- Efficiency of the crude bound at the start: −0.18 (n = 15), 0.22 (n = 33), 0.62 (n = 63), 0.91 (n = 153).
- Along an L-greedy path at n = 63 (`phiX.py`), the certified per-step efficiency (μ − Err)/(3L/m) stays in 0.58–1.27 from L = 8.3 down to 0.45. At n = 33 it is only 0.0–0.36.
- Rough extrapolation: even if one proved I_v ≤ 1.5m + o(m), N₀ would land only around 120–150. This route cannot lower 155 substantially without control of the "gain" terms. Those gains nearly cancel the straddle loss: at n = 15 the true average over legal moves exceeds L* by only 0.018, while the bound loses about 0.9.

**Earlier variant [proved, superseded]:** the global form, Lemma W: min_legal L(T∖A) ≤ (1 − 3/m)·L + E.

## C. Files (working folder `wild4`; in the repository: `continuation/attempt4/`)

| File | Contents |
|---|---|
| `LOG.md` | time-stamped log (CET) |
| `gen13.py`, `val4.py` | encoding and its validation |
| `orbits.py`, `orbcheck.py`, `orbtest2.py` | cube orbits and their checks |
| `cubesb.py`, `lextest.py` | residual lex-leader and its check |
| `cuberun.py`, `resume.sh`, `mkcube.py`, `check_complete.py` | cube driver, resume, single-cube CNF, completeness check |
| `cubes/` | `res_k0_N.txt`, `STATUS.txt`, `README_RESUME.txt`, `*.drat.gz` |
| `bin/kissat` | Kissat 4.0.4 binary |
| `extend.py` | CEGAR extension check |
| `cpsat13.py`, `cpmin13.py`, `best_k0.json`, `incr.py`, `vartest.py`, `k1test.py`, `sbtest.py`, `cubetest4.py`, `a0_all.cnf`, `a1_all.cnf` | experiments |
| `phiW.py`, `phiW2.py`, `phiX.py`, `phiX63.out`, `start_eff.py` | Task B numerics |
