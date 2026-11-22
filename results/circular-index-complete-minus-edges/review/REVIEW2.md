# Referee report 2: results added after the first referee pass

Subject: `/mnt/user-data/outputs/circular-index-complete-minus-edges/PROOF.md`. This report covers the new material in Part C (K_11 − 2K_2, K_15 − 3K_2, the 3-edge rows for n = 9, 11, 13), the proved statements in Parts B and C, the status of Conjectures H and H′, and the Δ ≥ 8 claim. I did not read `/home/claude/kn2/`. All of my scripts and outputs are in `/home/claude/kn_review2/`.

## Verdict

**Accept with minor corrections.**

- **χ'_c(K_11 − 2K_2) = 32/3 is correct.** I checked every step by hand and re-ran all the computations with my own code.
- **102/7 ≤ χ'_c(K_15 − 3K_2) ≤ 44/3 is correct.**
- **The Δ = 10 and Δ = 14 claims are correctly derived.** Both graphs are simple, and in both cases χ'_c lies strictly inside (Δ + ½, Δ + 1).
- **The values 21/2 (K_11) and 25/2 (K_13) for every 3-edge F are correct.**
- **The value 17/2 for K_9 − F (every 3-edge F) is correct, but it rests on one SAT encoding.** That encoding is the author's encoding with redundant constraints. I checked by hand that the encoding is sound and reproduced its UNSAT results. My own plain encoding did not finish within 10 minutes for any of the five F (gap G1).
- **The Part B/C lemmas are correct.** Conjecture H is correctly marked refuted, and H′ is correctly marked as a conjecture.

## Errors

- **E1 (minor, table row K_11 − P_3).** The row lists 54/5 among the undecided candidates. But 54/5 is in lowest terms and its numerator is 54 > N = 53. Vince's numerator bound (F1, p′ ≤ |E|) therefore excludes it. The candidates below 11 are exactly {53/5, 32/3, 43/4}, and 53/5 is excluded by Corollary B1. The cause is that Lemma 0 as stated drops the condition p′ ≤ N, which its own proof uses. The lemma is still true, just weaker than it needs to be. Add "and nq − a ≤ N" to the statement (with a/q in lowest terms). The first referee's check 6 repeated the 54/5, which is correct only for t = 1. The same condition removes 77/6 for n = 13, t = 2, so the candidates there are {38/3, 51/4, 64/5}. The table row for n = 13 is not wrong, because it lists no candidates.
- **E2 (cosmetic).** The Verification section gives "0.4–144 s" for `verify_sat.py 2`. My re-run, under `nice` on a shared CPU, took 213.8 s for 3K_2. The others took 0.6 to 20.4 s. Say "a few minutes at most".

## Gaps

- **G1 (the 25/3 exclusion for n = 9, t = 3 has one encoding only).**
  - The author's redundant encoding returns UNSAT for all five F; I reproduced this (`author_sat2.out`). I checked each redundant constraint by hand, and every one is implied by any (p,q)-colouring:
    - (i) a vertex of degree d sees exactly d distinct colours;
    - (ii) the q-windows covering a colour at v are q in number and pairwise disjoint across colours (colours at v are ≥ q apart), so exactly p − qd windows miss v;
    - (iii) every window of q consecutive colours is a matching, and n is odd, so some vertex is uncovered.
  - The rotation fix X(0,0) is sound. The encoding returns SAT on the controls (26,3) and (17,2) for 3K_2 and K_3.
  - My independent plain encoding (`plainsat.py`) times out for all five F at about 10 minutes each (`sat25_plain.out`). This is the literal definition, pairwise conflict clauses with rotation and reflection symmetry breaking. It does pass its controls: SAT on (17,2) and (26,3) for all five F with checked models, and UNSAT on K_7 − P_3 at (19,3) in 30 s.
  - Adding window-matching cardinality (≤ 4 edges per 3-colour window) also times out (P_3+K_2, 300 s).
  - So the 25/3 exclusion is supported by one hand-verified encoding, with no second encoding and no checked proof certificate. Suggestion: emit DRAT proofs from CaDiCaL and check them with drat-trim. The text already says the UNSATs "have not been checked by a second encoding", which is accurate.
- **G2 (wording of H′, "lower half").** "No value n − a/q with a ≥ 2" should say "in lowest terms, below n − 1/⌈m/t⌉". Values above the predicted one are irrelevant once the upper half holds. This is cosmetic.
- **G3 (scope of the novelty claim).** The claim "Mazák–Zrubák write that no such graph was known" is accurate (see check 9). I did not do a literature search beyond one web query, which found nothing relevant. The claim is correctly phrased as "MZ write", not "we are the first".
- **G4.** The exhaustive searches are uncertified computations. Two independent implementations agree, with different fixed edges and different search orders (check 4), which is adequate.

## Checks performed

1. **Colourings, own checker (`check_col.py`, using networkx).**
   - All 28 colourings in `colourings.json` are valid. For each one I checked the exact edge set of K_n − F, that colours lie in Z_p, and that the circular distance at every vertex is ≥ q. α′ was computed by maximum matching.
   - The F types were identified by isomorphism. n = 9, 11 and 13 each have all five 3-edge types: K_3, P_4, K_{1,3}, P_3+K_2 and 3K_2.
   - K_11 − 2K_2 (32,3): valid, |E| = 53, α′ = 5, Δ = 10.
   - K_15 − 3K_2 (44,3): valid, |E| = 102, α′ = 7, Δ = 14, so |E|/α′ = 102/7.
   - I did not check that the two n = 17 F with degree sequence [1,1,2,2,2] are P_5 and K_3 ∪ K_2 (older material).
2. **Lemma 0, by hand.**
   - χ′ = n because N/m > n − 1 for t ≤ m − 1. So χ′_c ∈ (n − 1, n].
   - If χ′_c < n, then χ′_c = p′/q′ with p′ ≤ N < mn (Vince, applied to the line graph). So q′ < mn/(n − 1) = m + ½, that is, q′ ≤ m.
   - a/q′ ≤ t/m follows from N/m.
   - The (mn − 1, m)-colouring follows from a/q′ ≥ 1/m.
   - All correct; see E1 for the omitted condition p′ ≤ N.
   - α′(K_n − F) = m for t ≤ m: confirmed in every case computed.
3. **Candidate enumeration (`cands.py`: all p/q with q ≤ m and p ≤ N in [N/m, bound)).**
   - K_11 − 2K_2 below 32/3: only 53/5.
   - K_15 − 3K_2 below 44/3: 102/7 and 73/5.
   - K_9, t = 3, below 17/2: 33/4 and 25/3.
   - K_11, t = 3, below 21/2: only 52/5.
   - K_13, t = 3, below 25/2: none (25/2 = N/m).
   - K_11 − P_3 below 11: 53/5, 32/3, 43/4 (E1).
4. **The window/gcd step and the perfect-sequencing searches.**
   - For (53,5): each union of 5 consecutive classes is a matching, so it has ≤ 5 edges. The sum over all 53 windows is 5·53 = 5p, so every window has exactly 5 edges. Then |C_{j+5}| = |C_j|, and gcd(5,53) = 1 makes all classes equal, of size 1. That is a perfect sequencing. Correct, and the same holds for Corollary B1 in general.
   - Own search (`pseq.c`): definition only, last edge fixed at position 0, reverse candidate order. Controls agree with the previous referee's `seqsearch.c`: K_5 − e gives 4; K_7 − (K_3 ∪ 2K_2) gives 12; K_7 − e, K_9 − e, K_7 − P_3 and K_7 − 2K_2 give 0.
   - K_11 − 2K_2: 0 sequencings (mine: 1.37·10⁹ nodes, 228 s; `seqsearch.c` re-run: 1,359,257,293 nodes, matches the claimed 1.36·10⁹).
   - K_11 − 3K_2: 0 (mine: 6.88·10⁸ nodes; `seqsearch.c`: 695,874,120, matches 6.96·10⁸).
   - K_9 − 3K_2: 0 (both programs).
   - Hence 53/5, 52/5 (3K_2) and 33/4 (3K_2) are excluded.
5. **Lemma B and Corollary B1, re-derived.**
   - Lemma B: N ≥ 2m² − 1 ≥ m + 2 and min degree ≥ m − 1, so A2 applies and every gap is m or m + 1. The excess count gives d(m + 1) ≤ m + t ≤ 2m + 1, so d ≤ 1.
   - This covers the non-matching F for 52/5 (m = 5, t = 3, gcd 1) and for 33/4 (m = 4, t = 3, gcd 1).
6. **K_15 − 3K_2.**
   - Counting bound: Σ_j |W_j| = q|E| ≤ pα′, so p/q ≥ 102/7. Upper bound: 44/3 from the checked colouring.
   - 102/7 = 14 + 4/7 > 14.5, and 44/3 < 15. So χ′_c ∈ (Δ + ½, Δ + 1) whatever the exact value is.
   - The remaining candidates 102/7 and 73/5 are correctly marked undecided. 102/7 would need a perfect sequencing of K_15 − 3K_2, since gcd(7,3) = 1.
7. **Part B/C proved statements.**
   - Monotonicity: subgraph monotonicity of χ′_c, and every F with t ≥ ⌈m/2⌉ contains a subset of size ⌈m/2⌉. Correct, and it is correctly stated as a reduction only.
   - The m even, t = m/2 structure lemma:
     - 2N = m(4m + 1) = mp, so every pair of consecutive classes has exactly m edges and misses exactly one vertex.
     - |C_j| = |C_{j+2}| and p is odd, so every class has size m/2.
     - A vertex of degree 2m has gaps ≥ 2 summing to 4m + 1, so one gap is 3 and the others are 2, giving colours a, a + 2, …, a + 4m − 2. Multiplying by 2m + 1 = 2⁻¹ maps these to an interval.
     - Correct.
   - The slack m(t − 1) remark is correct.
   - The claim "2t < m implies N/m > n − ½" is correct.
8. **Conjectures.**
   - H is correctly marked refuted. The (32,3)-colouring alone gives χ′_c(K_11 − 2K_2) ≤ 32/3 < 11 with 2t = 4 < 5 = m, so the lower bound is not even needed.
   - H′ is stated as a conjecture. It matches every value listed: (3,2) 13/2; (4,2) and (4,3) 17/2; (5,2) 32/3; (5,3) 21/2; (6,3) 25/2; (8,4), (12,6), (20,10) n − ½; (7,3) 44/3. It is consistent with N/m, since 1/⌈m/t⌉ ≤ t/m.
9. **Context [MZ].**
   - The arXiv PDF 2603.08822v1, Section "Open problems" after Problem 7, reads: "Currently, for any Δ ≥ 8, we don't even know if there is a single graph with maximum degree Δ and χ′_c ∈ (Δ(G) + 1/2, Δ(G) + 1)". The remark is unqualified, so it covers multigraphs too, and simple-graph examples suffice.
   - K_11 − 2K_2: simple, Δ = 10, χ′_c = 32/3 = Δ + ⅔.
   - K_15 − 3K_2: simple, Δ = 14, χ′_c ∈ [Δ + 4/7, Δ + ⅔].
   - Both lie strictly inside the open interval. Correctly derived.
10. **The 25/3 exclusions for K_9.** See G1. Files: `sat25_plain.out` (plain: 5 timeouts at about 600 s each), `author_sat2.out` (redundant encoding: all UNSAT, 0.6 / 213.8 / 2.6 / 3.9 / 20.4 s for K_3 / 3K_2 / K_{1,3} / P_4 / P_3+K_2).

## Files

`check_col.py`, `cands.py`, `pseq.c` (and the binary `pseq`), `seqsearch_prev` (compiled from `../kn_review/seqsearch.c`), `k11_2k2_mine.out`, `k11_3k2_mine.out`, `prev_k11_2k2.out`, `prev_k11_3k2.out`, `plainsat.py`, `sat25_plain.out`, `author_verify_sat.py` (copy), `author_sat2.out`.
