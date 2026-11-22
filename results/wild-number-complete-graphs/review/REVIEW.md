# Referee report: "Conjecture 6.1 of Dawkins–Nappo–Tong–Zimbizi: partial result" (Theorem A)

Under review: `REPORT.md` (in the parent folder) and its scripts.
Referee code: written in a separate working folder and copied into this folder (`factor.py`, `brute.py`, `e2f5.py`, `negdep.py`, `lll_indep.py`, `run_range.py`, `range.out`, `tail_indep.py`; author scripts were copied to `authcopy/` and run there). `range.out` and `authcopy/` are not included; `python3 run_range.py 189 1201` regenerates the former.

## Verdict

**Theorem A is correct up to listed gaps, and this review closes the gaps.** Theorem A states that Conjecture 6.1 holds for odd n ≥ 189 and n ∈ {165, 171, 177, 183}, and for the even values n+1. Every step of the reduction and of the LLL argument checks out. The two weak points in REPORT.md are:
- (a) the negative-dependency theorem, which the author used only through a secondary source;
- (b) the tail n ≥ 1201, which was done in floating point with a monotonicity argument that is stated but not written out.

Section "Gaps" below closes both: a short self-contained coupling proof for (a), and an exact-rational tail bound that is monotone in n for (b). The errors found are minor. None affects Theorem A.

## Errors

- **E1 (minor, statement only). The inequality for the existence of a rainbow, sub-valid F is wrong as written.** REPORT §4 gives the bad-set count as n·C(h,2)·(n−4) + n·h·C(n−3,f−3) < C(n,f) for n ≥ 30.
  - **f = 4.** The factor (n−4) should be C(n−4, f−4) = 1. As written, the inequality is false for every n, since n·C(h,2)·(n−4) ≈ n⁴/8 > C(n,4).
  - **f = 5.** The correct inequality holds only for n ≥ 49, not n ≥ 30. It fails at n = 39, 41, 43, 45, 47.
  - **Corrected statement.** n·C(h,2)·C(n−4,f−4) + n·h·C(n−3,f−3) < C(n,f) holds for odd n ≥ 19 when f = 4 and for odd n ≥ 49 when f = 5. That covers everything Theorem A needs (n ≥ 165). The over-count itself is valid: two same-colour edges inside F, or an invalid triple inside F.
  - **Small cases.** At n = 11 and n = 17 no rainbow, sub-valid 5-set was found in 10⁵ random samples, for either factorization tried.
- **E2 (minor, artefacts).** The `lll_verify.py` shipped in the folder does not verify n = 165. Its μ list {1.1, 1.08, 1.06, 1.05, 1.04, 1.03} omits 1.11, which n = 165 needs. Run as shipped, it prints `FAIL 165` and then `SOME FAIL`; the bundled `data/lll_verify.out` shows the same.
  - `data/lll_verify.out` also records an earlier tail attempt at n = 801 that failed. Only `lll_verify2.out`, a partial run, ends in `ALL OK`.
  - The claim itself is true: `verify.py` includes μ = 1.11 and 1.12, and both the referee's code and the author's weights confirm n = 165 at μ = 1.11.
  - REPORT §4 says "μ between 1.03 and 1.1". In fact n = 165 needs μ = 1.11. Cosmetic.

## Gaps (with completions)

### G1. Negative dependency, cited only through slides

**What the sources say.**
- **Lu–Székely, arXiv:0905.3983, Theorem 3.**
  - Canonical events: A_M = {perfect matchings ⊇ M}.
  - Conflict: M₁ and M₂ conflict iff M₁ ∪ M₂ is not a matching.
  - Result: for matchings of K_N or K_{N,N'}, the conflict graph of any family of canonical events is a negative dependency graph, meaning P(A_i | ∧_{j∈S} ¬A_j) ≤ P(A_i) for every set S of non-neighbours.
- **Hypergraph version (Mohr; Lu–Mohr–Székely, PROMS 25, 2013).** Székely's MAPCON 2012 slides attribute to Austin Mohr the same statement for H = K_N^(r) with r | N.
- **Harris, arXiv:1702.02547, Appendix.** "Lu, Székely & Mohr showed non-constructively that the LLLL applied to this space for all s ≥ 2", the space being perfect matchings of K_n^(s).

I could not retrieve the primary texts: the thesis PDF and arXiv PDFs were blocked from this sandbox, and the PROMS chapter is paywalled. So I could not quote the theorem verbatim.

**How the events here relate to that theorem.**
- The events here are canonical: "j given disjoint triples are all blocks" is A_M for a partial matching M of K_N^(3) on V∖F. A uniform random partition of V∖F into triples is exactly a uniform random perfect matching of K_N^(3).
- In the complete hypergraph, two partial matchings whose union is a matching always extend jointly. So "conflict" means some edge of M₁ meets a different edge of M₂.
- "Share a vertex" is a supergraph of the conflict graph. A supergraph of a negative dependency graph is again one, because the condition only has to hold for subsets of non-neighbours. Duplicated events are adjacent to each other, which is harmless (or deduplicate them). So the usage is legitimate.

**Self-contained proof (closes G1).** Setting: Ω is the set of perfect matchings of K_N^(r), M is a partial matching on vertex set U, and each M_j is compatible with M (every edge of M_j is in M or disjoint from U). Let B = ∧_j ¬A_{M_j}.
- **The map.** Given P ∈ Ω, let E_U be the set of edges of P that meet U, and U* their union. Set Q = (P ∖ E_U) ∪ M ∪ R, where R is a uniformly random perfect matching of U* ∖ U. Its size, r(|E_U| − |M|), is divisible by r.
- **Q is uniform on A_M when P is uniform on Ω.** The kernel is equivariant under Sym(V∖U), which fixes U pointwise and hence fixes M. So the law of Q is Sym(V∖U)-invariant and supported on A_M, which is a single transitive orbit (A_M is in bijection with the perfect matchings of V∖U). So the law is uniform.
- **If Q ∈ B then P ∈ B.** If P ⊇ M_j, then each edge of M_j is either in M ⊆ Q, or disjoint from U, in which case it lies in P ∖ E_U ⊆ Q. So Q ⊇ M_j.
- **Conclusion.** P(B) ≥ P(Q ∈ B) = P(B | A_M), which is equivalent to P(A_M | B) ≤ P(A_M).

`negdep.py` checks this by brute force on K_9^(3) (280 matchings, 463 random families) and K_12^(3) (15400 matchings, 125 families): 0 violations.

### G2. Tail n ≥ 1201 was floating point with an unwritten monotonicity argument

Re-derived rigorously in exact rationals (`tail_indep.py`), with μ = 41/40.

**Ingredients, each re-derived:**
- **E1 count.** For j ≥ 3, C₁(3j) ≤ 1.125·n·C(h, ⌊3j/2⌋−1).
  - Even s: (n−1)C(h−1, s/2−1) ≤ n·C(h, s/2−1).
  - Odd s, with k = (s−3)/2 ≥ 3: C(h, k+1)/C(h, k) = (h−k)/(k+1) ≤ h/4 < n/8.
- **E2 count.** C₂(3j) ≤ (n+15)·C(h, ⌊3j/2⌋−1). Every E2 index is ≤ ⌊3j/2⌋−1, and ⌊3j/2⌋−1 ≤ N/4 ≤ h/2 for j ≤ t/2, so these indices stay where C(h, ·) is increasing.
- **Exact probability.** splits(j)·q_j = C(t,j)/C(N,3j). I checked this is identical to the author's product form.
- **Vandermonde.** C(h,a)·C(t,j)·C(D,e_j) ≤ C(N,3j), with a = ⌊3j/2⌋−1, e_j = ⌈j/2⌉+1, D = 2t − h. Here a + j + e_j = 3j and h + t + D = N.
- **Geometric range.** For i ≤ D/4 the ratio μ⁶(i+2)/(D−i−1) is at most μ⁶(D/4+2)/(3D/4−1) < 1.
- **Remaining range.** For D/4 < i ≤ i_max, use C(D,k) ≥ (D/k)^k ≥ 2^{D/2} for D/4 ≤ k ≤ D/2, plus symmetry.
  - i_max ≤ t/4 + 1 ≤ D/2 + 2. This holds because it is equivalent to f ≤ 5.
  - The number of such i is at most D/4 + 3.

**The bound B(n).** I replace D by D_low = (n−17)/6 ≤ D (its ceiling where an integer is needed), 2.125n+15 by 12.75D + 51.125 in the second-range term, and 1/√2 by 0.7072. The resulting pieces are:
- T₁ ≤ μ³(1.5n+8.5)·2/((n−6)(n−7))
- T₂ ≤ μ⁶(n³/8 + 1.25n² + 8.5n)·40/(n−10)⁴
- Tail₁ = (2.125n+15)·2μ¹²/(C(D_low,3)(1−ratio))
- Tail₂ = (12.75D+51.125)·2(D/4+3)μ¹²·(0.7072μ³)^D

Each piece is a product of positive non-increasing functions of n. The right-hand side (1 − 2μ³/((n−6)(n−7)))·L(μ) is non-decreasing in n.

**Result.**
- At n = 1201: B = 0.016967 ≤ RHS = 0.024687 (exact). Hence the condition holds for all n ≥ 1201.
- The tail argument alone already works from n = 957 at μ = 1.025, and from n = 777 at μ = 1.05.
- Sanity check: B(n) ≥ exact W(n) at n = 1201, 1203, 1205, 1501, 2001.

The author's crude values at 1201/1203/1205 (0.0168, 0.0162, 0.0168 vs 0.0247) agree with mine.

## Item-by-item findings

1. **Definitions, lemmas and reductions in the paper (arXiv:2610.22142v1 HTML, read in chunks).**
   - **Definitions.** G_i^W = (V, E(G_i) ∪ W). W is colour-connecting if every G_i^W is connected, and wld is the minimum |W|.
   - **Lower bound (Thm 3.4).** wld ≥ ⌊4⌈n/2⌉/3⌋. The proof: W touches ≥ 2⌈n/2⌉−1 vertices, is a forest, and its components have ≥ 3 vertices.
   - **Small cases.** Thm 3.5 covers 3 ≤ n ≤ 12.
   - **Conjecture.** The Section 6 conjecture is "for every n ≥ 3 and every minimum proper coloring ρ, wld_ρ(K_n) = ⌊4⌈n/2⌉/3⌋". Its number did not render in the excerpt.
   - **Seals.** The seal notion and the "seal-free ⇔ colour-connecting" proposition are the paper's own. A seal is (c_i, 𝒰) with v_i ∉ U and every M_i-edge touching U inside U. The even-to-odd deletion lemma, wld_ρ(K_{2k}) ≤ wld_{ρ_v}(K_{2k−1}), is also in the paper.
   - **The equivalence is exact.**
     - G_u^W is connected iff the quotient Q_u is connected, because every block is internally connected by its tree.
     - Q_u is disconnected iff some proper non-empty union of blocks is u-closed. Complements of u-closed sets are u-closed: if x ∉ S and M_u(x) = y ∈ S, then y ≠ u and M_u(y) = x ∉ S. So one side avoids v_u, and that side is a seal.
     - |W| = n − #blocks. For odd n, W must cover all n vertices, since each vertex is v_u for some u. Minimum size n − ⌊n/3⌋ therefore means exactly ⌊n/3⌋ blocks.
     - A 2-vertex block {a, b} is always a seal for the colour of ab, so blocks have size ≥ 3.
   - **Even-to-odd reduction is valid.** Deleting x turns each perfect matching into a near-perfect matching missing the neighbour y_i, and these neighbours are distinct. A colour-connecting W′ for K_{2k−1} works in K_{2k} with no extra edge, because x hangs on y_i by its colour-i edge. The bounds coincide, since ⌈2k/2⌉ = ⌈(2k−1)/2⌉ = k. I checked k ≤ 10⁴ numerically, and n − ⌊n/3⌋ = ⌊4⌈n/2⌉/3⌋ for odd n ≤ 20001.
   - **Brute force.** The direct check, the seal check and the proper-closed-union check agree on 2400 random partitions (block sizes 3–7, random spanning trees), using 16 factorizations with n = 7–13, cyclic and Kempe-switched.
2. **Block sizes and F.**
   - The forced block sizes are correct.
   - F is never u-closed:
     - f = 4, u ∉ F: closure would need two u-edges inside F, which rainbow forbids.
     - f = 4, u ∈ F: the other 3 vertices form an odd set, so they cannot all be matched inside F.
     - f = 5, u ∉ F: odd set, impossible.
     - f = 5, u ∈ F: closure would need two u-edges inside F.
   - The counting inequality is wrong as written; see E1.
3. **Event decomposition is correct.**
   - Take a component C of Q_u not containing F. It consists of j triples, and its complement is F plus t − j triples and is u-closed.
   - If j ≤ t/2, this is an E1 event. Otherwise it is an E2 event with 1 ≤ t − j < t/2. The lower bound t − j ≥ 1 holds because F alone is never closed, which also covers the case where the component containing F is small.
   - Brute force on partitions of the form F + triples, n ∈ {13, 15, 19, 21, 23, 25}, cyclic and Kempe-switched factorizations, 3333 partitions with a disconnected Q_u: every one is covered by E1 or E2 with j ≤ t/2, including 190 covered only by E2.
4. **Negative dependency.** Treated in G1 above. The events are canonical, "share a vertex" is a valid superset of conflict, and the theorem is now proved directly.
5. **LLL inequality.**
   - **Exact probability.** P(j given triples are blocks) = T(N−3j)/T(N) = Π_{i<j} 1/C(N−1−3i, 2) = q_j exactly.
   - **Derivation.** Neighbours of E are the events meeting V(E), which has 3j vertices. Then Π_{F∼E}(1−x_F) ≥ Π_{z∈V(E)} Π_{F∋z}(1−x_F) ≥ exp(−3j·max_z W(z)/(1−x_max)) ≥ μ^{−3j}, using −ln(1−x) ≤ x/(1−x) and W ≤ (1−x_max) ln μ. So x_E·Π(1−x_F) ≥ q_j = P(E). Also ln μ ≥ (μ−1) − (μ−1)²/2.
   - **Counts of u-closed sets through z.** Proved: a u-closed set is a union of u-edges, plus u itself if u ∈ S. Brute-forced for every z and every s on 16 factorizations with n = 7–13: 0 mismatches.
   - **E2 colour classes.**
     - Rainbow forces e_u ≤ 1; sub-valid forces e_u = 0 when u ∈ F.
     - Rainbow plus sub-valid also implies that the C(f,2) edge colours of F lie outside F.
     - The floor in C(h, ⌊(3j−ext)/2⌋) correctly covers both parities, including the case u ∈ X.
     - Checked by exhaustive enumeration at n = 13 and 19 (f = 4) and n = 23 (f = 5): the class histograms are exactly as stated (e.g. {2: 6, 3: 4, 4: 3} at n = 13), and the exact E2 counts never exceed the bound (equality at j = 1).
6. **Numerics.**
   - **Independent code.** `lll_indep.py` uses the closed form C(t,j)/C(N,3j) and exact Fractions, and searches μ on a 0.005 grid, refined to 0.001 if needed. Its coefficients are identical to the author's `lll2.weights` at n = 189, 191, 193, 401, 403, 405.
   - **189 ≤ n ≤ 1201.** Every odd n passes (`range.out`). The minimum relative slack is 3.4%, at n = 191 with μ = 1.11.
   - **Extra values.** 165, 171, 177 and 183 pass; n = 165 needs μ ≈ 1.11–1.125.
   - **Failures.** 185 and 187 fail for every μ in [1.001, 1.4]; the best slack is −0.0024 and −0.0003. All of 153–187 outside n ≡ 3 (mod 6) also fail, as do 153 and 159.
   - **Tail.** Covered in G2.
   - **Monotonicity claim.** The author's claim, "each summand decreases within a residue class mod 6", is plausible: D grows by 1 when n grows by 6. However, it was only sketched; G2 replaces it.
7. **`verify.py quick`.** Ran it (numpy 2.5.3, scipy 1.18.1); it passes all four sections:
   - [1] 960 partitions;
   - [2] 124 splits;
   - [3] 132 colourings with n from 13 to 42;
   - [4] the LLL sample, plus the tail at 1201/1203/1205 and up to 10⁵.

   It checks what REPORT.md says. Two limits:
   - Section [4] re-implements the same formulas as `lll2.py`, so it is not an independent check of the counting.
   - It does not test the u-closed counts, the E2 classes, the decomposition or the existence of F. The referee's `brute.py` and `e2f5.py` cover those.

   Section [3] gives computational evidence only, as the report says.

## Checks run (referee code, this folder)

- `brute.py`:
  - seal and quotient equivalence on 2400 partitions;
  - u-closed counts through z, all s, at n = 7–13;
  - E2 exact counts against the bound, and the decomposition test (n ≤ 25).
- `e2f5.py`: E2 counts for f = 5 at n = 23, and the inequality for the existence of F (error E1).
- `negdep.py`: brute-force negative dependency on K_9^(3) and K_12^(3); coincidence of the lower bounds.
- `lll_indep.py` and `run_range.py`: exact LLL condition for every odd n in [189, 1201] and for 165, 171, 177, 183; failures at 185 and 187 and below. Output is in `range.out`.
- `tail_indep.py`: rigorous exact-rational tail for all n ≥ 1201.
- Author scripts, run from copies: `verify.py quick` (passes), `lll_verify.py` (prints FAIL 165, see E2), `lam.py` (reproduces the E[X] table).
- Sources consulted:
  - arXiv:2610.22142v1 HTML, in chunks;
  - Lu–Székely arXiv:0905.3983;
  - Székely, MAPCON 2012 slides;
  - Harris arXiv:1702.02547, appendix;
  - the Mohr thesis abstract (scholarcommons.sc.edu/etd/1606).
