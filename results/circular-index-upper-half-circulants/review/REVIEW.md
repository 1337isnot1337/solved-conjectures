# Referee report: "Highly connected regular graphs with circular chromatic index Δ + 2/3 for every Δ ≡ 0 (mod 4), Δ ≥ 8"

Files reviewed: `/mnt/user-data/outputs/circulant-upper-half/PROOF.md`, `verify.py`, `verify_part2.py`, `data/part2_certificates.json`.
Referee code: `/home/claude/circ_review/check.py`, `/home/claude/circ_review/extra.py`. These were written from scratch, use networkx for matching numbers and connectivity, and do not import the authors' code.

## Verdict

**Theorems 1 and 2 are correct.** Every step of the proof checks out by hand, and independent computation agrees with it. The Part 2 certificates (Section 7) are valid: every claimed value of χ'_c, Δ, simplicity and κ was reproduced. The structural lemma (7.1) and the insertion lemma (7.3) are correct as stated.

I found no mathematical errors. There are some small gaps and imprecisions in Section 7 and in how one open problem is read. All are listed below with completions.

The literature claims are quoted and read correctly. A quick search found no prior simple graph with Δ ≥ 8 and χ'_c in (Δ+1/2, Δ+1), and no prior circulant construction of this kind. That fits the authors' own remark in Mazák–Zrubák (arXiv:2603.08822v1, March 2026), but the search was not exhaustive (see the Novelty notes).

## Errors

None found in the mathematics, the certificates or the quotations.

## Gaps and imprecisions (with completions)

1. **The Δ = 21 certificate uses the mirror form of the insertion lemma.** In 7.3 the lemma requires V(F_j) = V(E_{c+j-1}), meaning the inserted block copies the vertex sets of the q classes *after* the insertion point. In `delta21` the block inserted before colour 0 instead copies the vertex sets of colours 59, 60 and 61, the q classes *before* the insertion point. I checked this directly.
   - *Completion:* the mirror statement follows by reversing the colour order, which maps perfect (p,q)-colourings to perfect (p,q)-colourings. The certificate is also checked directly as a perfect (65,3)-colouring, so the value 65/3 is not in doubt. The text only says "generalised insertion search"; one sentence stating the mirror form would close the gap.
   - I tested both forms on 60 random insertions into the Family B bases (g = 6, 7). All passed, and the 60 negative controls (blocks inserted in the wrong order) all failed as expected.

2. **Several insertions at once: a hypothesis is missing.** "Insertions at points at least q−1 classes apart do not interact" is correct for the window structure. With q−1 or more old classes between two blocks, no window of length q contains classes from both blocks. For the result to be a *simple* graph, however, the blocks must also be pairwise edge-disjoint. Equivalently, each later block must be a set of matchings in the complement of G plus the earlier blocks.
   - *Completion:* add this hypothesis. In Family B it holds, because the two blocks use length-1 edges {x, x+1} with disjoint sets of x. I checked this, and the certificate check also rejects multi-edges.

3. **Wording of the structural lemma (7.1).** "W_0 + 1 differs from W_0 in at most r vertices" should read |(W_0+1) \ W_0| ≤ r, that is, at most r exchanges.
   - *Completion:* the number of maximal cyclic runs of W ≠ Z_n equals |{x ∈ W : x+1 ∉ W}| = |(W+1) \ W|, so the conclusion "union of at most r cyclic intervals" follows.
   - The identity V(E_{c+q}) = (V(E_c) ∪ {x_c}) \ {x_{c+1}} was verified for every c in the colourings of Theorem 2, C_31, C_33, and G_2, G_3, G_5.
   - The run counts of the certified base sets are (2,2,2), (2,2,3) and (2,2,2), all ≤ r = 3.

4. **Problem 6 has a second non-trivial reading.** The authors' observation is correct: read literally ("at least d + 1/2"), Problem 6 is trivial for even d. K_{d+1} is d-regular and d-connected, and Mazák–Zrubák themselves note in Section 4 that χ'_c(K_{d+1}) = d+1 for even d. The authors' non-trivial reading is χ'_c ∈ [d+1/2, d+1). The context before Problem 6 (the 3.5 cubic examples and the 4.5 examples of Theorem 9) also supports the reading "χ'_c = d + 1/2 exactly", and Theorems 1–2 do not answer that one.
   - *Suggestion:* name this reading explicitly and say it remains open.

5. **Minor points of presentation.**
   - Section 3 lists the Part 2 additions but leaves out C_31(1,2,3,7,…,12) (Δ = 18, value 93/5), which Section 7.2 treats as a highlight.
   - Lemma 2(b) assumes implicitly that each class is a matching. This is harmless, since the window being a matching implies it.
   - Lemma 1's measure argument needs r ≥ 1. This holds by definition and is noted in the text.

## Checks run

**Theorem 1, by hand:**
- *Lemma 1.* The proof is correct: I_x is a half-open arc of length 1, each colour lies in I_x for x in a set of measure exactly 1, so |E| ≤ rα'.
- *Lemma 2.* Correct.
- *Classes.* M_0 and M_1 have vertex sets {0} ∪ [2g+2, 4g] and {1} ∪ [2g+2, 4g]. Their lengths are {2g+1} ∪ odd[1, 2g−3] and {3g} ∪ even[2, 2g−2], so together exactly S_g, each once.
- *Partition.* For each length the n translates are distinct (n is odd), so the classes partition E.
- *Colours.* 3·(4g+1) = 2n+1, so 3⁻¹ ≡ 4g+1 (mod 2n).
- *Reduction to (C1)–(C4).* I redid the case analysis on the parity ε of a and the shifts 4g+1 (odd) and 8g+2 (even, ≡ −2g mod n), and checked each of (C1)–(C4) by hand. All four are correct.
- *Matching number.* α' = 3g.

**Connectivity, by hand:**
- *Lemma 3 (atoms are disjoint).* I checked the proof line by line: s+t = u+v = 2κ; the case s ≤ κ; and in the case s > κ the chain X_33 = ∅, x_32 < x_21 < α_0, x_23 < x_12 < α_0, X_31 ≠ ∅ ≠ X_13, |N(X_13)| = κ, giving the contradiction. Fact (i), that F̄ is a fragment, is correct. The proof is valid for every connected non-complete graph.
- *Lemma 4 (the atom through 0 is a subgroup).* Correct.
- *Proposition 5.* Correct: index d' ∈ [2, 2g−1] makes every coset adjacent, because [1, d'−1] ⊆ S_g. Otherwise |H| < 4 divides n = 6g+1, which is odd and not divisible by 3.
- *Atom arguments for the examples.* For Z_25, S mod 5 ⊇ {1,2,3,4}. Z_31 is prime. For Z_33, index 3 is covered by 1 and 2, and index 11 by ±{1,…,5} covering all nonzero residues mod 11.

**Theorem 2, by hand:**
- The lengths of B_0, B_1, B_2 are {1,7,11}, {2,9,12} and {3,10,8}.
- 4⁻¹ ≡ 19 (mod 75). The nine triples (r, r', δ) were recomputed by program and match the text.
- I checked all nine translates against W_r.

**Computation (`check.py`, `extra.py`):**
- **Theorem 1, g = 2..40.** In each case the coloured edge set is exactly E(G_g), no edge is coloured twice, all 2n colours are used, and the colouring is a proper (2n,3)-colouring (every pair of edges at a vertex has circular colour distance ≥ 3). Also |E|/⌊n/2⌋ = 2n/3, and α'(G_g) = 3g by networkx max-matching for g ≤ 12.
- **Connectivity (networkx `node_connectivity`).**
  - κ(G_g) = 4g for g = 2..7.
  - κ(C_25(1,2,3,7..12)) = 18, κ(C_31(1,2,3,7..12)) = 18, κ(C_33(1..5, 9..15)) = 24.
  - κ(C_7(1,2)) = 4, matching the PROOF's attribution of this example to the paper.
- **Theorem 2 and Part 2 certificates.** For each one I rebuilt the colouring independently, confirmed it is proper and simple, and computed Δ, δ and α' (networkx). In every case |E|/α' equals p/q:

  | Certificate | n | Δ | δ | α' | χ'_c | κ |
  |---|---|---|---|---|---|---|
  | C_25 | 25 | 18 | 18 | 12 | 75/4 | 18 |
  | C_31 | 31 | 18 | 18 | 15 | 93/5 | 18 |
  | C_33 | 33 | 24 | 24 | 16 | 99/4 | 24 |
  | Δ21 | 31 | 21 | 20 | 15 | 65/3 | 20 (not claimed) |

  - For the three circulants, the graph equals the claimed circulant.
  - **Family B, g = 6..13, D = 1, 2:** Δ = 4g+D, α' = 3g, and χ'_c = Δ + 2/3 exactly, covering Δ ∈ {25, 26, 29, 30, …, 53, 54}. I also confirmed the hypotheses of the insertion lemma: the blocks lie in the complement and cover exactly V(E_c), V(E_{c+1}), V(E_{c+2}), and the two blocks are disjoint. I re-checked (C1)–(C4) for the Family B vertex sets by hand.
- **Family B base matching problem:** exhaustive enumeration confirms it is unsolvable for g = 3, 4, 5 and solvable for g = 6, as claimed. The parenthetical "internal lengths must be exactly {2, …, 2g−3}" is correct by counting: 2g−4 distinct internal lengths ≠ 1, all ≤ 2g−3.
- **Section 7.4 spot check:** brute force confirms no cyclic-ansatz colouring for (q,r,g) = (4,3,1), (5,3,1), (5,4,1). Positive controls (2,1,1) and (4,1,1) were found. The other UNSAT claims were not re-checked (instructions said to avoid long SAT runs).
- **Authors' scripts:** `verify.py` and `verify_part2.py`, run on a copy, both print ALL … PASSED.

## Novelty and literature notes

- **Quotations.** Re-fetched arxiv.org/html/2603.08822v1 (only v1 exists). These quotations are accurate:
  - the "upper half of [Δ, Δ+1]" sentence;
  - Problem 6 ("…circular chromatic index at least d + 1/2?") and Problem 7;
  - "Currently, for any Δ ≥ 8, we don't even know if there is a single graph with maximum degree Δ and χ'_c ∈ (Δ+1/2, Δ+1)";
  - Theorem 9 ("infinitely many 4-connected 4-regular graphs G with χ'_c(G) = 9/2").

  These attributions are also correct:
  - χ'_c(K_{d+1}) = d+1 for even d (Section 4, via the bound from Hackmann–Kemnitz [11]);
  - C_7(1,2) has χ'_c = 5 (via Zrubák's thesis [27]);
  - the upper-half values listed by the paper all have Δ ≤ 6;
  - q = 5 appears only as 23/5, for multigraphs with Δ = 4;
  - the paper has no simple graph with value 4 + 3/4.

  The paper also says experiments for Δ ≥ 7 are out of reach, and it gives no Δ = 7 example.
- **Related results found:**
  - Lin–Wong–Zhu realise only values near Δ for regular graphs: [n, n+1/4] or (n, n+1/4) for odd n, and [n, n+1/6] for even n (simple graphs).
  - Afshani et al. (arXiv:math/0701016) treat Δ = 3: there is no graph with 11/3 < χ'_c < 4.
  - Lukoťka–Mazák and Kráľ–Máčajová–Mazák–Sereni study cubic graphs.
  - Nadolski's thesis (2002, cubic graphs) and his paper in Discrete Math. 2007 (snarks and other Class 2 families; only the abstract was seen).
  - Mazák–Zrubák's Conjecture 2 says K_{d+1} − e still has χ'_c = d+1 (checked for d = 6..12), which suggests the obvious dense candidates fail.
- **Result of the search.** None of these sources gives a graph with Δ ≥ 8 in the open upper half, and none gives circulant constructions of this kind.
- **Caveat.** The search was quick (web search only). I did not read the full text of Hackmann–Kemnitz 2004 or Nadolski 2007. The method is elementary (the fractional bound is attained by a cyclic "perfect" circular colouring), so it is plausible that similar colourings appear somewhere in work on cyclic near-1-factorizations or on χ'_f versus χ'_c. Against that, the March 2026 remark by experts in the area is strong evidence that the result was not known to them.
