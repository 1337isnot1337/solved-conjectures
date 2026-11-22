# Referee report: `delta-2-mod-4/PROOF.md` (graphs with χ'_c = Δ + 2/3 for Δ ≡ 1, 2 mod 4)

Referee: independent model referee, 2026-11-22. I did not read `/home/claude/d2mod4/` (the author's scratch folder). My scripts and outputs are in `/home/claude/d2_review/`.

## Verdict

**Correct. Accept as written**, with only cosmetic remarks. I re-derived every hand claim of Sections 2–5 for general g, including the three M1 cases and O_g. My own verifier, which shares no code with `verify.py`, confirms the whole construction for 6 ≤ g ≤ 60. It checks all pairs of incident edges from the definition, and it confirms α' by a blossom matching for g ≤ 12. Theorem 1 (Δ = 4g+2, g ≥ 6), Theorem 1′ (Δ = 4g+1, g ≥ 6), Proposition 2 (Δ = 10, 14, 18, 22) and Corollary 3 (every even Δ ≥ 8, together with circulant Theorem 1 for Δ ≡ 0 mod 4) all hold.

## Errors

None found in the mathematics. Two minor points, neither affecting any claim:

- E1 (verify.py, negative control (c)). The control only checks that a list of lengths has duplicates. It never feeds the bad base to `check_family_B`, so it cannot show that the checker rejects a bad base. I filled the gap in `author_mut.py`: `check_family_B` does reject M1 := M0+1 and a rewired M1, and `check_KnF` rejects a perturbed colour and a wrong p.
- E2 (cosmetic, §6). "it is 30 lines": the per-vertex checker `check_colouring` is about 12 lines, and the whole of Part 2 is about 30. Harmless.

## Gaps (with completions)

No gap is needed for correctness. Some steps are terse:

- G1 (§4, Lemma 3 → all c). The step "by (T) it suffices to take c ∈ {0,…,5}" works without 6 being invertible mod 2n. Every c ∈ Z_{2n} is c0 + 6k with c0 ∈ {0..5}, k ≥ 0, and window c0+6k is window c0 translated by k.
- G2 (Lemma 4, separation). A window of 3 meets both blocks only if fewer than q−1 = 2 old classes separate them. The gaps are 6 and 2n−6, so no window meets both blocks. Both blocks use the **forward** form of the §7.3 insertion lemma: F_j copies E_0, E_1, E_2 (inserted before E_0), and F'_j copies E_6, E_7, E_8 (inserted before E_6). The mirror form is not used. I listed all ten windows that meet a block. Each is a permutation of the Lemma 3 windows c = −2, −1, 0, 4, 5, 6 and their reorderings.
- G3 (simplicity). This holds for four reasons. G^0 is simple (n odd, 2g distinct lengths in [1, 3g]). L1 and L2 are sets of length-1 edges with distinct x, and a length-1 edge determines x because n ≥ 3. X1 ∩ X2 = ∅. And 1 ∉ S. So no base translate coincides with an inserted edge, and the two blocks are edge-disjoint. My code checks this directly by counting distinct edges.
- G4 (the claim "distinct only for g ≥ 7"). This is a property of the given formulas: at g = 5 (odd formula) 2g+3 = 3g−2 = 13, and at g = 6 (even formula) 2g+4 = 3g−2 = 16. My code confirms that both fail. The base problem itself is unsolvable for g = 3, 4, 5. I confirmed this by an independent exhaustive search (`base_small.py`: no compatible pair of length sets), which agrees with §6 and §7.4 of the circulant file. At g = 6 there are 32 compatible pairs of length sets.

## Checks

### 1. Base matchings by hand (general g)

n = 6g+1 is odd. The length is min(d, n−d) ∈ [1, 3g], so "distinct lengths" is the same as "±residues 4g distinct", i.e. distinct up to sign mod n. My code checks both.

- **M0.** The vertices 3g+1−j (j = 1..g−2) give [2g+3, 3g], the vertices 3g+2+j give [3g+3, 4g], and with 0, 1, 3g+1, 3g+2 this is exactly W0. Lengths: 3g−1 (since 3g+2 > 3g), 3g, and 2j+1 = the odd numbers in [3, 2g−3].
- **M1, g odd (h = (g−3)/2).**
  - The 2g+4+2x run from 2g+4 to 3g+1, and the 4g−2x run from 4g down to 3g+3. These are all the even numbers of I, since 3g+2 is odd.
  - The 3g∓2j give the odd numbers of [2g+3, 3g−2] and of [3g+2, 4g−3]. With 3g and 4g−1, these are all the odd numbers of I.
  - Lengths: 3g−2; 2g+3 (from 4g−2 > 3g); 2g−4−4x, the numbers ≡ 2 mod 4 in [2, 2g−4]; and 4j, the multiples of 4 in [4, 2g−6]. Together these are all even numbers in [2, 2g−4].
  - Vertex count: 4 + 2(h+1) + 2h = 2g.
- **M1, g even.**
  - Odd vertices: 2g+3, 2g+5, the odd numbers of [2g+7, 3g+1] (j = 2..(g−2)/2), the odd numbers of [3g+3, 4g−3], and 4g−1. These are all the odd numbers of I.
  - Lengths of the fixed edges: 2g+4 (≤ 3g), 3g−2, 2g−4, and 2g−2−4j, the numbers ≡ 2 mod 4 in [2, 2g−10].
  - g = 4k+2 (k ≥ 2), even vertices of O_g:
    - 3g−4i for i ≤ k−1 runs from 3g−4 down to 2g+6, 3g+4i runs from 3g+4 to 4g−6, and 4g−2 is added. These are the numbers ≡ 2 mod 4 except 3g.
    - 3g+6−4i for i ≤ k gives [2g+8, 3g+2], 3g+2+4i gives [3g+6, 4g], and 2g+4 is added. These are the multiples of 4.
    - Lengths: 2g−6 ≡ 2 mod 4; 8i for i = 1..k−1; 8i−4 for i = 1..k; and 2g−4 = 8k. Together these are all multiples of 4 in [4, 2g−4].
  - g = 4k (k ≥ 2): this case is analogous. The vertices are 2g+4..3g−4, 3g+4..4g−4 and 4g (multiples of 4), and 2g+6, 2g+10..3g+2, 3g+6..4g−2 (≡ 2 mod 4). The lengths 8i, 8i−4 (i ≤ k−1) and 8k−4 are all multiples of 4 in [4, 8k−4].
  - Edge count: 3 + (g−4)/2 + (g−2)/2 = g in both cases.
- **Union.** The lengths are [2, 2g−3] ∪ {3g−2, 3g−1, 3g} ∪ {2g+3 or 2g+4}. These are 2g distinct values in [2, 3g] for g ≥ 7, and none equals 1.

By code (`indep_check.py`, with the formulas retyped independently): all of the above for 7 ≤ g ≤ 200, with the exact sorted length list. The formulas fail at g = 5 and g = 6, as expected.

### 2. The g = 6 base by hand

M0 covers {0,1} ∪ [15,24] with lengths 15 (37−22), 18, 9, 4, 6, 3. M1 covers {1,2} ∪ [15,24] with lengths 16 (37−21), 17, 8, 5, 7, 2. These are 12 distinct lengths, none equal to 1, all ≤ 18, and the internal lengths are exactly [2, 9]. The base is identical to `familyB_bases['6']` in `circular-index-upper-half-circulants/data/part2_certificates.json`.

### 3. The rest of Family B, by hand

- **Base windows and translation rule.** 3(4g+1) = 2n+1, and 6(4g+1) ≡ 2 mod 2n, so (T) E_{c+6} = E_c + 1 holds. The classes of colours 0..5 are K_0, K_{4g+1}, K_{8g+2}, K_1, K_{4g+2}, K_{8g+3}, i.e. M0, M1+2g, M0+4g+1, M1, M0+2g+1, M1+4g+1. I recomputed all six vertex sets, plus those of E_6 and E_7. I also recomputed the six windows: they are disjoint and miss 2, 0, 4g+3, 4g+1, 2g+3 and 2g+1 respectively.
- **Blocks.**
  - |X1| = 3g. The x-sets for V(E_0), V(E_1) and V(E_2) are {0} ∪ odd[2g+3, 4g−1], {2g+1} ∪ odd[4g+3, 6g−1] and odd[3, 2g−1] ∪ {4g+1}. Their union is X1.
  - V(F'_j) = V(E_{j+5}) by (T).
  - L1 is a matching missing 2, and L2 is a matching missing 3.
- **Degrees.** In G_g, vertices 2 and 3 have degree 4g+1 and all others have 4g+2. In G'_g, vertex 2 has 4g and all others 4g+1.
- **Counting.** |E(G_g)| = 2gn + 6g, α' ≤ 3g (n odd), and (2gn+6g)/(3g) = (2n+6)/3 = (12g+8)/3 = Δ + 2/3, which equals p/q with p = 2n+6. For one block: (2gn+3g)/(3g) = (2n+3)/3 = Δ + 2/3.
- **Lemmas 1 and 2.** These are standard and the proofs are correct. In particular, the measure argument in Lemma 1 needs r ≥ 1.
- **§7.3 of the circulant file.** The forward and mirror forms of the insertion lemma are correct; the mirror form follows by reversal c ↦ −c. "Separated by ≥ q−1 old classes" is the right threshold. The structural lemma V(E_{c+q}) = (V(E_c) ∪ {x_c}) \ {x_{c+1}} is correct: for example V(E_3) = (W0 ∪ {2}) \ {0} = W1. None of these is needed by this file, which re-proves Lemma 4 directly.

### 4. Independent verifier (`indep_check.py`, output in `indep_check.out`)

For 6 ≤ g ≤ 60 and for both G'_g and G_g, the verifier works as follows:

- **Colour assignment.** Each edge gets its colour from a closed formula. A base edge in K_a gets 3a mod 2n, shifted by +3, and by a further +3 if 3a ≥ 6 when there are two blocks. Block-1 edges get j−1 and block-2 edges get 8+j, where j is found from the closed-form vertex sets of E_0..E_2 and E_6..E_8.
- **Checks run:**
  - simplicity;
  - exact degree multiset (the deficient vertices are exactly {2} resp. {2,3});
  - **all pairs** of incident edges at circular distance ≥ 3 in Z_p;
  - every window of 3 colours has exactly 3g edges;
  - |E| = 2gn + 3g·(number of blocks);
  - |E|/(3g) = p/3 = Δ + 2/3;
  - α' = 3g by networkx blossom for g ≤ 12.

All pass, in 8 s. Seven mutations of the verifier are all rejected (`mut_test.py`):

- block colour +1;
- no second shift;
- block copying E_5..E_7;
- q = 4;
- X2 := X1;
- 5a instead of 3a;
- perturbed M0.

### 5. The K_n − tK_2 certificates (`kn_check.py`, all pairs)

| n | t | \|E\| | Δ | lower bound \|E\|/m | upper bound p/3 | conflicting pairs |
|---|---|---|---|---|---|---|
| 11 | 2 | 53 | 10 | 53/5 = 10.6 | 32/3 | 0 |
| 15 | 3 | 102 | 14 | 102/7 ≈ 14.571 | 44/3 | 0 |
| 19 | 4 | 167 | 18 | 167/9 ≈ 18.556 | 56/3 | 0 |
| 23 | 5 | 248 | 22 | 248/11 ≈ 22.545 | 68/3 | 0 |

In general, t/m = (n−3)/(2(n−1)) < 1/2. The edge sets equal E(K_n) minus a matching F with t = (n−3)/4, which misses a vertex, so Δ = n−1. The n = 27 certificate also passes. The certificates are byte-identical to those in `circular-index-complete-minus-edges/colourings.json`. The claim χ'_c(K_11 − 2K_2) = 32/3 exactly belongs to that folder and was not re-refereed here; Corollary 3 does not need it.

### 6. Author's `verify.py`

- Runs: GMAX = 60 (2.0 s) and GMAX = 150 (28 s) both print ALL CHECKS PASSED (`verify_author_60.out`, `verify_author_150.out`).
- It checks what §7 says it checks. The per-vertex test on cyclically sorted colours is equivalent to the all-pairs test, including equal colours (gap 0). It builds the blocks from X1 and X2 and asserts V(F_j) equals the target class. It then checks the final sequence directly, which is stronger than checking the hypotheses of the insertion lemma.
- It uses α' ≤ (n−1)/2 (n odd) for the lower bound, which is a theorem and not a computation.
- Weakness: E1 above. My mutation test confirms that the real checker does reject bad inputs.

### 7. Context and Corollary 3

- **Quotation.** The quotation of Mazák–Zrubák was confirmed against the arXiv HTML of [2603.08822v1](https://arxiv.org/html/2603.08822v1). The text after Problem 7 says that for any Δ ≥ 8 no graph with χ'_c ∈ (Δ+1/2, Δ+1) is known. The definition there (circular colouring of the line graph, distance ≥ 1) matches §2.
- **Δ ≡ 0 mod 4.** Circulant Theorem 1 (Δ = 4g, g ≥ 2): I read §2.3 (C1)–(C4) and they are correct. My spot check `circ_check.py` builds the explicit (2n,3)-colouring of C_{6g+1}(1..2g−2, 2g+1, 3g) for g = 2..40 and checks all pairs: pass.
- **Coverage.** Every even Δ ≥ 8 is covered:
  - Δ ≡ 0 mod 4: circulant Theorem 1;
  - Δ = 10, 14, 18, 22: Proposition 2;
  - Δ = 26: g = 6;
  - Δ ≥ 30: g ≥ 7.
- **Δ ≡ 1 mod 4, Δ ≥ 21.** Covered by Theorem 1′ (Δ ≥ 25) and the computer-certified Δ = 21 example of §7.3. Its check, `verify_part2.py`, passes.

Files: `indep_check.py`/`.out`, `mut_test.py`, `kn_check.py`/`.out`, `circ_check.py`/`.out`, `base_small.py`/`.out`, `author_mut.py`, `verify_author_60.out`, `verify_author_150.out`.
