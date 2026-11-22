# Referee report on IMPROVEMENT.md (Theorem B: Conjecture 6.1 for every n ≥ 155)

Under review: `IMPROVEMENT.md` (in the parent folder) and `improvement/`.
Setting taken from REPORT.md and review/REVIEW.md (seal-free partitions, fixed rainbow sub-valid block F, coupling proof G1).
Referee code: written from scratch in a separate working folder and copied into this folder. The author's scripts were read but not imported or run. The author's working folder was not read.

## Verdict

**Theorem B is correct.** It extends Theorem A to all odd n with 155 ≤ n ≤ 187, and hence via the deletion lemma to all n ≥ 155.
- **Lemma C.** Statement, hypotheses (L) and (W), and the induction are correct.
- **Hypothesis (L).** It is exactly what the coupling argument of REVIEW G1 gives.
- **Lemma D and the counts.** Lemma D (only connected-quotient events are needed) is correct, and so are the refined counts in §4.2–4.3.
- **Condition (∗).** Recomputed independently in exact rationals. It holds for every odd n in [155, 189], and it fails for every a > 1 at n = 145–153 (rigorous bound), as claimed.

I found no error that affects the theorem. There are two cosmetic errors and one weakness in the author's brute-force checks; my own checks close that weakness.

## Errors

1. **Instance diversity overstated (§5; affects checks only, not the proof).** §5 describes the instances in `bf.py` and `bf_big.py` as "Kempe-switched factorizations". At every prime n they are not.
   - The generator, `improvement/factor.py` = `review/factor.py`, starts from GK_{n+1} and applies Kempe switches.
   - For prime n, GK_{n+1} is a perfect 1-factorization: every two colour classes form a Hamiltonian cycle. So every Kempe switch only swaps the names of two colours, and the set of matchings never changes.
   - The prime cases are n = 13, 19, 23 (bf.py) and all of n = 31, 37, 41, 43, 47, 53 (bf_big.py).
   - At these n the "random" instances are therefore GK_{n+1} minus a random vertex, and every pair of colours spans a single path.
   - The output shows this: for example, at n = 41, 47 and 53 (j = 2) the exact counts for cyc and rnd are identical.
   - The f > 0 brute force for n ≥ 26 thus never saw a non-perfect factorization. (The same limitation applies to the prime-n instances of the previous review.)
   - My own runs, listed under Checks, close this using a doubling construction (two copies of a factorization of K_{(n+1)/2} plus K_{r,r}, followed by Kempe switches), which is far from perfect.
2. **Cosmetic constant (§7).** max_a (a−1)/(3a³+5a⁶) is 0.010046, not ≈ 0.01003. This does not affect the theorem.

## Gaps (with completions)

### G1. Lemma C against Harvey–Vondrák (the author had read only a summary)

I fetched arXiv:1711.06797v1. I read it only through the fetch tool's model summary of the PDF, with requested verbatim quotes, not as raw text. What it gives:
- **Condition (1).** P[E_i | ∩_{j∈J} Ē_j] ≤ p_i for all i and all J ⊆ [n] ∖ Γ⁺(i).
- **Lemma 5.** If (1) holds and p_i ≤ y_i / Y_{Γ⁺(i)}, where Y_S = Σ_{I∈Ind(G), I⊆S} y^I, then P[∩ Ē_i] ≥ 1/Y_{[n]}.

The reduction stated in §3.1 is correct. Take G to be "supports meet", y_E = P(E) Π_{v∈V(E)} a_v, and p_E = P(E).
- **Bounding Y.** The members of an independent set I ⊆ Γ⁺(E) are pairwise vertex-disjoint and each meets V(E). Choosing one vertex of V(E) from each member is therefore injective, so Y_{Γ⁺(E)} ≤ Π_{z∈V(E)} (1 + Σ_{G∋z} y_G) ≤ Π_{z∈V(E)} a_z by (W).
- **Conclusion.** The same argument gives Y_{[n]} ≤ Π_v a_v.
- **Zero denominators.** (L) is the product form of (1), so it also covers the case where the conditioning event has probability 0.

**The self-contained proof is correct as written.** I checked it line by line.
- **Induction.** The induction is on |S|, with the statement "for all U".
- **Step 1.**
  - It uses the induction hypothesis only for T = S ∖ S_{z} ⊊ S, with U = V(E) ∖ {z}.
  - T has no member through z, so T ∖ T_{V(E)} = T ∖ T_{V(E)∖{z}}.
  - (L) is applied with R = T ∖ T_{V(E)}, whose members are disjoint from V(E).
  - (W) gives Σ_{E∈Q} P(E) Π_{v≠z} a_v ≤ (a_z − 1)/a_z, because Q ⊆ {E ∋ z} and all terms are nonnegative.
- **Step 2.** Step 1 is used only when S^{i−1} = S. Otherwise the induction hypothesis is applied to the proper subset S^{i−1} with U = {z_i}. The telescoping product gives S^m = S ∖ S_U.
- **Not circular.** At no point is the statement for S used while proving it.

### G2. Does the coupling give (L)?

**Yes.**
- **The events are canonical.** Every member of ℰ is a canonical event A_M, "these triples are blocks". The E1/E2 conditions are properties of M, not of the random partition. So R is a family of canonical events A_{M'}.
- **Compatibility.** V(M') ∩ V(M) = ∅ makes each M' compatible with M in the sense of REVIEW G1: every edge of M' is disjoint from U = V(M).
- **Conclusion.** B = ∧_{G∈R} Ḡ is exactly a conjunction of complements of canonical events, and the coupling gives P(A_M ∧ B) ≤ P(A_M) P(B).
- **Scope of (L).** (L) is never applied to complements or conjunctions as "E", and never to an R containing events that meet V(E). Lemma C's proof needs nothing beyond this.

Brute force on K_12^(3), over all 15400 matchings, with 300 random (M, R) pairs and events of 1–2 triples: 0 violations of the product form.

### G3. Lemma D (restriction to connected quotients)

The proof is correct. Every component of Q_u is a u-closed union of blocks with a connected quotient.
- **f = 0.** The smallest of the ≥ 2 components has at most t/2 triples.
- **f > 0.**
  - Either some component avoiding F has at most t/2 triples (an E1 event),
  - or there is exactly one component avoiding F, with more than t/2 triples. In that case the component containing F is F plus j′ < t/2 triples, and j′ ≥ 1 because F is never u-closed (REVIEW item 2). This is an E2 event.

Checked by definition in `decomp.py`. Every bad partition was searched over all sub-collections of j ≤ t/2 triples for an ℰ-member. Over 15900 random partitions, 13905 were bad, and none was missed (Checks).

### G4. Counts (§4.2–4.3)

I re-derived each count. All are valid upper bounds.

**Classes.**
- f = 4: there are 6 colours with int = 1 (ext 2, h_u = h−3), 4 colours u ∈ F (ext 3, h−3), and n−10 others (ext 4, h−4).
- f = 5: the classes are 10 (h−4), 5 (h−4) and n−15 (h−5).
- The colours of the edges of F lie outside F (sub-valid), so the large class has exactly C(f,2) + f members.

**E1 counts.**
- **conn(m,d).** conn(m,d) depends only on (m, d), because X ∖ {u} is perfectly matched by M_u inside X.
  - The root-component recursion is correct.
  - I recomputed it by the exponential formula (C₀ = log A₀, C₁ = A₁/A₀) for m ≤ 14.
  - Brute force confirms conn(1,1) = 1, conn(3,0) = 10, conn(4,1) = 240 (of 280), conn(6,0) = 14400 (of 15400) and conn(7,1) = 1209600 (of 1401400).
- **Even E1.** u ∉ X, so z must lie on a free u-edge. This excludes u = z and the f colours c(zy), y ∈ F. These f colours are distinct, and none equals z because M_z misses z. That leaves n−1−f colours, at most C(f,2)+f of them in the large class. The bound is correct, and in particular the subtraction of f is valid.
- **Odd E1.** u ∈ X ⊆ V∖F. The colour u = z contributes C(h_z, k) with h_z ≤ h−3 (f = 4) or h−4 (f = 5). The other N−1 colours contribute C(h_u−1, k−1). The f colours c(zy) are not excluded here, which only over-counts.

**E2 counts.**
- **Structure.** X ⊇ E_u, and X ∖ (E_u ∪ {u}) is a union of free u-edges: a partner in E_u would put x in F.
- **Through z.** z is forced (z ∈ E_u, or z = u) for at most f+1 colours, contributing C(h_u, k) each. Otherwise z lies on a free u-edge, contributing C(h_u−1, k−1).
- **Parity.** The parity constraint (δ = 1 only if u ∉ F) is handled correctly.
- **Code.** `counts.py` uses n instead of n−10 / n−15 for the middle class, which is a valid over-count.

**Independent recomputation.** My `bounds.py` implements these bounds independently.
- With the tighter class sizes, its coefficients are below the author's.
- With the author's class size n, it reproduces the W values of `ver.out` to all printed digits at the author's a, for all 18 values n = 155, …, 189. So `counts.py` implements §4.3.

### G5. Even n

The deletion lemma gives wld_ρ(K_{2k}) ≤ wld_{ρ_x}(K_{2k−1}), and the two lower bounds coincide (REVIEW item 1). It holds because:
- Every minimum proper colouring of K_{2k} is a 1-factorization: 2k−1 colours, each class of size ≤ k, k(2k−1) edges.
- Deleting x gives a near-1-factorization of K_{2k−1}, which Theorem B covers for all odd 2k−1 ≥ 155.

So every even n ≥ 156 is covered. F exists for n ≥ 19 (f = 4) and n ≥ 49 (f = 5).

## Checks (referee code in this folder, run with `nice -n 15`, one process at a time)

- **`fac.py`: near-1-factorizations.**
  - Three generators: cyclic; GK_{n+1} with Kempe switches (non-trivial only for composite n); and the doubling construction with Kempe switches (non-perfect).
  - Cycle-type diversity was checked in `kemcheck.py`.
  - F is a random rainbow, sub-valid set.
- **`conn.py`: conn(m,d).** Brute force, recursion and EGF all agree (see G4).
- **`brute_events.py`, `small2.out`: exact enumeration of ℰ.**
  - Method: by definition, with direct closure tests, all splits, a direct quotient-connectivity test, and events deduplicated across colours and types.
  - Coverage: n = 13, 15, 19, 21, 23, 25, 27, j ≤ min(3, ⌊t/2⌋). All subsets of V∖F of size 3j were scanned for n ≤ 25; full and structural generation agree at n = 25.
  - Larger n (`big.out`): n = 31, 41, 43, 47, 49, 53 with j ≤ 2, on non-perfect factorizations (doubling, or Kempe at 49).
  - Result: max_z #events ≤ E1(j)+E2(j) in every case, 0 violations.
  - Tightest cases: equality at j = 1 for n = 15, 21, 27 (f = 0); ratios 0.9978 (n = 21, j = 3), 0.9809 (n = 47, j = 2, f = 5) and 0.9858 (n = 53, j = 2).
- **`decomp.py`, `decomp.out`: Lemma D.**
  - 12 instances, n = 13–31, 800–1500 partitions each.
  - 13905 bad partitions (of 15900), 0 misses; 701 were caught only by E2.
- **`lemmaC_test.py`.**
  - (L) in product form: 300 random (M, R) pairs on K_12^(3), 0 violations.
  - Lemma C's conclusion on 60 random families satisfying (W): 2400 (S, U) checks and the final bound, 0 violations.
- **`cond.py`, `cond.out`: condition (∗) in exact Fractions, own coefficients.**
  - Every odd n in [155, 195] passes at a rational a. Slack: 155 → 0.00638, 157 → 0.00403, 159 → 0.00589, 161 → 0.0138, 163 → 0.0115, then ≥ 0.013 up to 195.
  - For FAIL cases, max_{a>1}(a−1−W(a)) is bounded rigorously by the tangent lines of the concave function at two rationals: 153 ≤ −0.00163, 151 ≤ −0.00381, 149 ≤ −0.00141, 147 ≤ −0.00957, 145 ≤ −0.01205 (also 143, 141).
  - So the criterion genuinely fails there, for every a, even with my tighter counts.
- **`authorform.py`.** At the author's a values with the author's class sizes, the condition holds for all n = 155, …, 189 (ALL OK), and these coefficients dominate mine termwise.
- **Asymptotics.** n·c₁ → 3 and n·c₂ → 5 (3.003 and 5.008 at n = 2001). The three j-groups at n = 153, a = 1.1225 are 0.0281, 0.0667 and 0.0294, as stated.
- **Not checked.** The §7 side claims: old counts reaching 159/185, the f = 3 variant, and the idealised vertex-dependent costs. These are not used in Theorem B.
