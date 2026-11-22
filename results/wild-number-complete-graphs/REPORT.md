# Conjecture 6.1 of Dawkins–Nappo–Tong–Zimbizi (wild number of K_n): partial result

Status: **partial**. Proved for all n ≥ 189 (odd) / n ≥ 190 (even) and for n ∈ {165, 166, 171, 172, 177, 178, 183, 184}; the paper covers 3 ≤ n ≤ 12. Open: 13 ≤ n ≤ 188 except those eight values. One independent model referee pass (Section 10): no error affecting Theorem A; two minor errors corrected below, two gaps closed.

> **Repository note.** This note is kept as written, apart from file paths. Theorem B in [IMPROVEMENT.md](IMPROVEMENT.md) lowers the threshold to every n ≥ 155, so the open range is now 13 ≤ n ≤ 154; see the [landing page](README.md). The scripts named below (`verify.py`, `lll2.py`, `lll_verify.py`, `tail.py`, `lam.py`, `modes.py`, `evid.py`, `fast.py`, `n1f.py`, `core.py`, `peel.py`, `peel2.py`) and `data/` are in [`theorem-a/`](theorem-a/).

## 1. Statement

Source: A. Dawkins, A. Nappo, J. Tong, C. Zimbizi, "Wild number for spanning trees in complete and complete bipartite graphs", arXiv:2610.22142v1 (read through the HTML version; the HTML numbering differs from the numbering we used earlier: the lower bound is HTML Theorem 3.4, the small cases HTML Theorem 3.5).

- For colour classes G_i of an edge colouring and a set W of edges, G_i^W is the spanning subgraph with edge set E(G_i) ∪ W. W is *colour-connecting* if every G_i^W is connected; wld = min |W|.
- A minimum proper colouring of K_n is a 1-factorization (n even) or a near-1-factorization (n odd: n colours, colour c_i a matching M_i missing exactly one vertex v_i).
- Lower bound (paper): wld_ρ(K_n) ≥ ⌊4⌈n/2⌉/3⌋ for every minimum proper colouring ρ. Equality for 3 ≤ n ≤ 12 by explicit constructions.
- **Conjecture 6.1.** Equality for every n ≥ 3 and every minimum proper colouring.

The original definition is in arXiv:2508.06711. An [earlier AFTD report](https://rainwangphy.github.io/aftd-platform/blog/2026-10-28-op-306-2/) gives the same equality for $n\ge30,000,001$.

## 2. Reformulation

**Seals (odd n).** Take a partition P of V into blocks of size ≥ 3 and let W be one spanning tree per block. A *seal* is a colour u and a nonempty union U of blocks with v_u ∉ U such that M_u restricted to U is a perfect matching of U. W is colour-connecting iff P has no seal; equivalently, for every colour u the quotient multigraph Q_u of M_u on the blocks is connected.

**Even n reduces to odd n.** Deleting a vertex gives wld(K_{2k}) ≤ wld(K_{2k−1}), and both lower bounds equal ⌊4k/3⌋. So the conjecture for 2k follows from the conjecture for 2k − 1.

**Odd n.** The conjecture is equivalent to: every near-1-factorization has a seal-free partition into ⌊n/3⌋ blocks of size ≥ 3. Forced block sizes: all triples (n ≡ 0 mod 3); triples and one 4-block (n ≡ 1); triples and two 4-blocks or one 5-block (n ≡ 2).

`verify.py` [1] compares a direct graph check, the quotient check and a brute-force seal search on 960 random partitions; they agree.

## 3. Random partitions fail too often for a union bound

For a uniformly random partition into triples (n ≡ 3 mod 6) the expected number of seals is independent of the factorization:

E[X] = Σ_m n·C((n−1)/2, m)·N(2m)·N(n−2m)/N(n), with N(s) = s!/((s/3)!·6^{s/3}).

| n | 15 | 21 | 27 | 33 | 45 | 63 | 99 |
|---|---|---|---|---|---|---|---|
| E[X] | 2.20 | 2.61 | 2.70 | 2.65 | 2.45 | 2.22 | 2.03 |

Empirically (4000 partitions each at n = 21, 45, 99): the number of bad colours is roughly Poisson with mean about 1.9; a random partition is seal-free with probability 0.06, 0.09, 0.13. Typical obstructions: an invalid triple {u, a, b} with ab ∈ M_u; a closed pair of triples; more rarely larger closed unions. Over the tested factorizations the success rate ranges from 0.02 to 0.33 (worst: n = 21, a Kempe-switched factorization, 0.023).

## 4. Theorem A (large n)

**Theorem A.** Conjecture 6.1 holds for every odd n ≥ 189 and n ∈ {165, 171, 177, 183}, hence (Section 2) for every even n ≥ 190 and n ∈ {166, 172, 178, 184}.

*Proof sketch.* Odd n, h = (n−1)/2. Let f = 0, 4, 5 as n ≡ 0, 1, 2 (mod 3). If f > 0 fix a block F of size f that is rainbow (distinct colours on its edges) and sub-valid (no triple {u, a, b} ⊆ F with ab ∈ M_u); such F exists by counting: the f-sets containing two edges of one colour number at most n·C(h,2)·C(n−4, f−4), and those containing an invalid triple at most n·h·C(n−3, f−3); their sum is below C(n, f) for odd n ≥ 19 when f = 4 and for n ≥ 49 when f = 5, which covers every n used in Theorem A. (An earlier version wrote the factor (n−4) instead of C(n−4, f−4) and claimed n ≥ 30; for f = 5 the inequality fails at n = 39–47.) F is never closed under a colour. Partition V \ F into triples uniformly at random; t = N/3 triples, N = n − f.

Bad events, for 1 ≤ j ≤ t/2: E1 "j given disjoint triples are blocks and their union is u-closed for some u"; E2 "F together with j given triples is u-closed". (S is u-closed if x ∈ S \ {u} implies M_u(x) ∈ S; complements of u-closed sets are u-closed.) If some Q_u is disconnected, a component not containing F gives an E1 event, or its complement gives an E2 event with fewer than t/2 triples. So if no event occurs, P is seal-free.

Negative dependency: for uniformly random perfect matchings of the complete r-uniform hypergraph on N vertices (r | N), the conflict graph of canonical events is a negative dependency graph (Mohr; Lu–Mohr–Székely 2013 †; the graph case is Lu–Székely, arXiv:0905.3983, Theorem 3; Harris, arXiv:1702.02547, appendix, states the hypergraph case). The referee also wrote a short self-contained coupling proof of the inequality P(A_M | B) ≤ P(A_M) used here (Section 10). Hence the lopsided LLL (Erdős–Spencer 1991) applies. With x_E = q_j μ^{3j}, q_j = Π_{i<j} 1/C(N−1−3i, 2), and neighbouring events sharing a vertex, it suffices that max_z W(z) = Σ_{E ∋ z} x_E ≤ (1 − x_max) ln μ.

Counting through a vertex z, summed over colours u: for even s the number of u-closed s-sets containing z is (n−1)·C(h−1, s/2−1); for odd s it is C(h, (s−1)/2) + (n−1)·C(h−1, (s−3)/2); each splits into triples in (3j)!/(j!·6^j) ways. E2 events: rainbow and sub-valid F restrict colours to the classes (number of colours, number of F-vertices matched outside F): f = 4: (6, 2), (n, 4), (4, 3); f = 5: (10, 3), (n, 5), (5, 4); for each colour the number of closed sets F ∪ X with |X| = 3j is at most C(h, ⌊(3j − ext)/2⌋). Their total weight is added to every W(z).

Verified in exact rationals (ln μ ≥ (μ−1) − (μ−1)²/2): the inequality holds for every odd n with 189 ≤ n ≤ 1201 (μ between 1.03 and 1.11) and for n ∈ {165, 171, 177, 183} (μ = 1.11 for 165, 1.1 otherwise; note that `lll_verify.py` and `data/lll_verify.out` omit μ = 1.11 and therefore report n = 165 as failing — `verify.py` and the referee's code include it and confirm 165); it fails at n = 185, 187 and below.

Tail n ≥ 1201: with D = N − h − N/3 and e_j = ⌈j/2⌉ + 1 (j ≥ 3), the E1 count is at most 1.125·n·C(h, ⌊3j/2⌋−1); Vandermonde gives C(h, m')·C(N/3, j)·C(D, e_j) ≤ C(N, 3j); so the j-th term (E2 included) is at most (2.125n + 15)·μ^{3j}/C(D, e_j). Pairs of terms form a geometric series up to i ≈ D/4; beyond, C(D, i+1) ≥ 2^{D/2}. With μ = 1.025 the bound is 0.0168, 0.0162, 0.0168 at n = 1201, 1203, 1205 against a requirement of at least 0.0247, and each summand decreases in n within a residue class. (The author's tail check was floating point; the referee redid it in exact rationals with μ = 41/40: at n = 1201 the bound is 0.016967 against 0.024687, each ingredient is non-increasing in n and the right-hand side non-decreasing, so the condition holds for all n ≥ 1201.) ∎

## 5. Structural lemmas (proved)

**Parts.** Fix a seal-free partition P and a block R. For each colour u split R into parts: {u} if u ∈ R; {x, M_u(x)} when both lie in R; and for each component C of Q_u − R, the set of vertices of R whose u-partner lies in C.

**Lemma 1 (splitting).** Split R into T and R′, both of size ≥ 3. The new partition is seal-free iff for no colour u is T a union of parts. Consequence: a partition is seal-free iff each step of peeling its blocks one by one from {V} satisfies this; each colour's partition of the shrinking set evolves independently, driven by the common sequence of triples. (`verify.py` [2]: 124 random splits.)

**Lemma 2 (end-game, |R| = 9).** Splitting R into triples A, B, C keeps seal-freeness iff none of A, B, C is a union of parts for any colour. If the family 𝔅 of 3-subsets of R that are unions of parts for some colour has |𝔅| ≤ 27, a good split exists (averaging argument); 27 is sharp for abstract families.

Peeling experiments: random non-bad triples get stuck only at the last split, in about 1–5% of runs; a greedy minimising |𝔅| never got stuck in tests.

## 6. Computational evidence for 13 ≤ n ≤ 169 (not a proof)

For every odd n from 13 to 169: cyclic factorization; Steiner quasigroup when n ≡ 1, 3 (mod 6); F_2^k minus a point when n = 2^k − 1; four factorizations obtained by random Kempe switches on GK_{n+1}. A seal-free partition with ⌊n/3⌋ blocks was found every time after 1 to 45 random tries. `verify.py` rebuilds such W and checks them directly in K_n (odd and even n up to 42 in quick mode, 102 in full mode): |W| equals the bound and every colour class plus W is connected. The sampled factorizations are not uniform.

## 7. Remaining gap

Odd n in [13, 187] other than 165, 171, 177, 183 (even cases follow). Missing: an argument uniform over all factorizations in this range.

Routes considered: first-moment / pessimistic estimators are blocked (E[X] ≈ 2–2.7 for every factorization); cluster-expansion or Shearer-type LLL might reach n ≥ 130 (estimated, not proved); a permutation model with a design avoiding invalid triples might reach n ≥ 50 but needs a design-existence lemma; Bonferroni/Stein–Chen hopeless near n = 21. Most promising: a deterministic potential-function analysis of the peeling game keeping |𝔅| ≤ 27 at |R| = 9 (with analogous end-games for n ≡ 1, 2 mod 3); experiments at n = 21 reach |𝔅| ≤ 29, so a sharper end-game (|R| = 12) is probably needed.

## 8. Files

`verify.py` (self-contained; `quick` mode passed; `full` not run), `lll2.py`, `lll_verify.py`, `tail.py` (LLL computation), `lam.py`, `modes.py`, `evid.py`, `fast.py`, `n1f.py`, `core.py`, `peel.py`, `peel2.py`, and `data/` (lll_verify.out, lll_verify2.out, rate.out, evid.out). The working log is not included.

## 9. Sources

- A. Dawkins, A. Nappo, J. Tong, C. Zimbizi, arXiv:2610.22142v1 (HTML).
- "The wild number of an edge-colored graph", arXiv:2508.06711.
- L. Lu, A. Mohr, L. A. Székely, "Quest for negative dependency graphs", Springer PROMS 25 (2013), doi:10.1007/978-1-4614-4565-4_21. † Statement seen only in Székely's MAPCON 2012 slides.
- P. Erdős, J. Spencer, "Lopsided Lovász Local Lemma and Latin transversals", Discrete Appl. Math. 30 (1991).

† read only through a summary; Theorem A depends on it.

## 10. Referee pass (independent model instance)

Verdict: Theorem A correct; no error invalidates any part. Checked: the seal characterisation and even-to-odd reduction against the paper (brute force on 2400 partitions, n = 7–13); forced block sizes; the event decomposition (3333 partitions with a disconnected quotient, all caught by an E1 or E2 event with j ≤ t/2, 190 only by E2); event probabilities equal q_j; counts of u-closed sets (brute force, n = 7–13); E2 bounds (exhaustive at n = 13, 19, 23); an independent exact recomputation of the LLL inequality for every odd n in [189, 1201] (smallest relative slack 3.4% at n = 191) and for 165, 171, 177, 183 (185, 187 fail for every μ ≤ 1.4); the tail redone in exact rationals. Negative dependency: a self-contained coupling proof (replace the edges of a perfect matching P meeting U by M plus a uniform matching of the leftover vertices; symmetry under permutations of V∖U makes the result uniform on A_M), and a brute-force check on K_9^(3) and K_12^(3) with no violation. Errors found: the existence inequality for F (corrected in Section 4) and the omission of μ = 1.11 in `lll_verify.py` (noted in Section 4). The referee's report and scripts are in `review/`.
