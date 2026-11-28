# Wild number of complete graphs for n ≥ 155

[Catalogue](../../CONTENTS.md) · [Theorem B](IMPROVEMENT.md) · [Setting and Theorem A](REPORT.md) · [Exact checks](verify.py) · [Continuation material](continuation/) · [Issue #155](https://github.com/1337isnot1337/solved-conjectures/issues/155)

**Status:** Partial result. Written proof of Conjecture 6.1 of Dawkins, Nappo, Tong and Zimbizi for every `n >= 155`. Together with the paper's own cases `n <= 12`, the conjecture is **open for `13 <= n <= 154`**. Each of the two theorems that make up the proof has been through one independent referee pass by a separate model instance; neither found an error affecting the theorems, and the minor errors they found are corrected in the notes. The notes are otherwise unrefereed.

**Follow-up for review.** The [external Lean results](continuation/EXTERNAL-LEAN.md) give exact values at additional orders in the gap described above, including the full interval from K77 through K154. The source package credits the nine-point reduction in this project.

**Contributor:** [@aadrianvv](https://github.com/aadrianvv). Proofs, verifier, referee passes and continuation material submitted by pull request.

**Lean status:** none. No Lean formalization is included.

Primary source: A. Dawkins, A. Nappo, J. Tong, C. Zimbizi, *Wild number for spanning trees in complete and complete bipartite graphs*, [arXiv:2610.22142](https://arxiv.org/abs/2610.22142) (October 2026), Conjecture 6.1. The paper was read through its arXiv HTML version.

An [earlier AFTD report](https://rainwangphy.github.io/aftd-platform/blog/2026-10-28-op-306-2/) gives a large-order result for $n\ge30,000,001$ by a related lopsided local lemma argument. The proof here lowers the threshold to $155$.

## Scope and limitations

- **Proved:** for every `n >= 155` and every minimum proper edge colouring `ρ` of `K_n`, the wild number equals the paper's lower bound. Odd `n >= 189` is Theorem A ([REPORT.md](REPORT.md)), odd `155 <= n <= 187` is Theorem B ([IMPROVEMENT.md](IMPROVEMENT.md)), and even `n >= 156` follows from odd `n-1` by a vertex-deletion lemma.
- **Open:** every `n` with `13 <= n <= 154`. No value in this range is claimed, and Issue #155 stays open.
- **Limit of the tested local-lemma criteria.** Both theorems apply a local-lemma-type criterion to a uniformly random partition into triples. The second referee showed rigorously that the Theorem B criterion fails for every weight `a > 1` at every odd `n` from 141 to 153, even with tighter counts than the author's ([`review2/cond.out`](review2/cond.out)). The author's estimate (IMPROVEMENT.md, Section 7) is that any criterion of this form for uniform triple partitions stalls near 150. Closing the gap needs a different argument.
- **Evidence is not proof.** For every odd `n` from 13 to 169 a random search found an optimal colour-connecting set for every factorization tried: cyclic, Steiner quasigroup, `F_2^k` minus a point, and several Kempe-switched ones (REPORT.md, Section 6). These factorizations are not a uniform or exhaustive sample, and the search proves nothing about other colourings.
- **Tools for continuing** are in [`continuation/`](continuation/) and are partial work, not results:
  - `n = 13` and `n = 14` are reduced, by proved lemmas, to a finite statement A13 about one 9-point end-game with two cases `k = 0, 1`. A13 is not decided.
  - For A13 with `k = 0`, an isomorph-free cube-and-conquer with a written soundness proof split the problem into 773 cubes. Cubes 0–363 were reported UNSAT by Kissat. The DRAT proofs were not checked and are not included (1.9 GB); cubes 364–772 and the whole case `k = 1` were not run. The resume scripts are included.
  - An exact potential identity for peeling triples one at a time (Theorem P) and a weighted variant (Lemma X) are proved. The missing piece is a lemma showing that the potential decreases along some legal path.
  - A SAT search with counterexample-guided refinement re-proves the paper's cases `n = 9` and `n = 11` (solver trusted, no proof certificate checked).
- **Sources.** The negative-dependency property of random triple partitions is used through a self-contained coupling proof written by the first referee. The cluster-expansion lemma (Lemma C) has a self-contained proof; the literature it is compared with (Harvey–Vondrák; Bissacot–Fernández–Procacci–Scoppola; Lu–Mohr–Székely) was read only through summaries or cited from memory, and no step depends on it.
- **Review.** The referee passes were made by model instances, not by human referees, and are not journal peer review. **Not formalized** in Lean.

## Result

A minimum proper edge colouring of `K_n` is a 1-factorization when `n` is even and a near-1-factorization when `n` is odd. For a colouring with colour classes `G_i`, a set `W` of edges of `K_n` is colour-connecting if every spanning graph with edge set `E(G_i) ∪ W` is connected, and the wild number $`\mathrm{wld}_\rho(K_n)`$ is the least size of such a `W`. The paper proves the lower bound below for every `n >= 3` and equality for `3 <= n <= 12`, and conjectures equality for all `n >= 3` (Conjecture 6.1).

**Theorem (Theorems A and B).** For every `n >= 155` and every minimum proper edge colouring `ρ` of `K_n`,

```math
\mathrm{wld}_\rho(K_n)=\left\lfloor \frac{4\lceil n/2\rceil}{3}\right\rfloor .
```

For odd `n` the statement is equivalent to the existence of a partition of the vertex set into $`\lfloor n/3\rfloor`$ blocks of size at least 3 with no seal, where a seal is a colour `u` and a nonempty union `U` of blocks avoiding the vertex missed by colour `u` that is closed under the matching of colour `u`. Even `n` reduces to odd `n-1` by deleting a vertex. For odd `n` the proof fixes a block `F` of size 0, 4 or 5, according to `n mod 3`, with distinct colours on its edges and no internal triple `{u,a,b}` where `ab` has colour `u`, and splits the remaining vertices into triples uniformly at random. A seal forces a union of triples, with or without `F`, to be closed under one colour. Uniform random perfect matchings of the complete 3-uniform hypergraph are negatively dependent for such events.

- **Theorem A** (odd `n >= 189`) applies the lopsided Lovász Local Lemma with exact rational counts for `189 <= n <= 1201` and an explicit monotone bound for `n >= 1201`. It also gives `n = 165, 171, 177, 183`.
- **Theorem B** (odd `155 <= n <= 187`) replaces the local lemma by Lemma C, a lopsided cluster-expansion criterion indexed by vertices with a self-contained proof. It restricts the bad events to those whose quotient is connected and counts them more sharply through a fixed vertex.

## Reading order

1. [REPORT.md](REPORT.md), Sections 1, 2 and 4: definitions, the seal reformulation, the reduction from even to odd `n`, the fixed block `F`, the event decomposition and Theorem A. Section 10 summarizes the first referee pass.
2. [IMPROVEMENT.md](IMPROVEMENT.md): Lemma C, the negative-dependency hypothesis (Lemma N), the restriction to connected events (Lemma D), the refined counts, the proof of Theorem B and its verification. Section 7 records what did not work.
3. [review/REVIEW.md](review/REVIEW.md) and [review2/REVIEW.md](review2/REVIEW.md): the two referee reports, including the coupling proof of negative dependency (first report, G1) and the rigorous tail bound for `n >= 1201` (first report, G2).
4. [continuation/README.md](continuation/README.md): partial work on the open range.

## Referee passes

- **First pass** ([review/REVIEW.md](review/REVIEW.md)), on Theorem A. Verdict: correct. It found that the inequality for the existence of `F` was misstated (corrected: it holds for odd `n >= 19` when `|F| = 4` and odd `n >= 49` when `|F| = 5`) and that the author's `lll_verify.py` omits the weight needed for `n = 165` (that value is now also covered by Theorem B). It closed two gaps: a self-contained coupling proof of negative dependency, and an exact-rational tail bound for `n >= 1201`.
- **Second pass** ([review2/REVIEW.md](review2/REVIEW.md)), on Theorem B, with code written from scratch. Verdict: correct. It checked Lemma C line by line and against Harvey–Vondrák, the use of the coupling for hypothesis (L), Lemma D and every count, and recomputed condition (*) independently in exact rationals for every odd `n` from 155 to 195. It found two minor errors, both corrected in IMPROVEMENT.md: the author's brute-force instances were less diverse than stated, because Kempe switches do nothing on perfect factorizations at prime `n` (the referee reran the checks on non-perfect factorizations, with no violation), and one numerical constant in Section 7 was slightly off.

## Verification

Run from the repository root with Python 3.10 or later and no other dependencies:

```sh
python3 results/wild-number-complete-graphs/verify.py
```

The script uses exact rational arithmetic throughout and ends with `ALL CHECKS PASSED`; it takes a few seconds. It checks:

1. the corrected counting inequality for the existence of the fixed block `F`, for odd `n` up to 20001;
2. condition (*) of Theorem B for every odd `n` from 155 to 189, with the author's coefficients ([`improvement/counts.py`](improvement/counts.py)) at a rational weight `a`;
3. that the second referee's independent coefficients ([`review2/bounds.py`](review2/bounds.py)) are termwise at most the author's and satisfy (*) at the same `a`;
4. the lopsided local-lemma condition of Theorem A for every odd `n` from 189 to 1201, with the first referee's coefficients ([`review/lll_indep.py`](review/lll_indep.py)), which agree exactly with the author's ([`theorem-a/lll2.py`](theorem-a/lll2.py)) at sample values;
5. the first referee's explicit tail bound at `n = 1201` ([`review/tail_indep.py`](review/tail_indep.py)), which covers every larger `n` because the bound is non-increasing and the right-hand side non-decreasing in `n`.

The counts that enter these conditions (the closed-set counts, the colour classes, the connected-split numbers and the event decomposition) are proved in the notes; the script evaluates them and does not re-derive them.

Optional checks, not run by CI. Every script below can be run as `python3 results/wild-number-complete-graphs/<path> <arguments>`.

- [`improvement/ver.py`](improvement/ver.py) `145 189` reproduces [`improvement/ver.out`](improvement/ver.out), including the failures of (*) below 155. [`improvement/ver_indep.py`](improvement/ver_indep.py) `155 189` is the author's second implementation. [`improvement/bf.py`](improvement/bf.py) and [`improvement/bf_big.py`](improvement/bf_big.py) brute-force the event counts on small instances (standard library).
- [`review2/cond.py`](review2/cond.py) `141 195` reproduces [`review2/cond.out`](review2/cond.out), with the rigorous failure bounds for odd `n` from 141 to 153. [`review2/conn.py`](review2/conn.py) checks the connected-split numbers three ways. [`review2/brute_events.py`](review2/brute_events.py), [`review2/decomp.py`](review2/decomp.py), [`review2/lemmaC_test.py`](review2/lemmaC_test.py) and [`review2/authorform.py`](review2/authorform.py) are the second referee's brute-force checks of the counts, of Lemma D and of Lemma C (standard library).
- [`review/run_range.py`](review/run_range.py) `189 1201` and [`review/tail_indep.py`](review/tail_indep.py) print the first referee's Theorem A computations. [`review/brute.py`](review/brute.py), [`review/negdep.py`](review/negdep.py) and [`review/e2f5.py`](review/e2f5.py) are its brute-force checks of the reformulation, the counts and negative dependency.
- [`theorem-a/verify.py`](theorem-a/verify.py) `quick` (needs NumPy and SciPy) checks the seal reformulation and the splitting lemma on random instances, builds optimal colour-connecting sets for many factorizations with `n <= 42` and rechecks them directly in `K_n` (evidence only), and samples the Theorem A condition. [`theorem-a/lll_verify.py`](theorem-a/lll_verify.py) prints `FAIL 165` because its weight list omits the value that `n = 165` needs (first referee, E2); the claim does not depend on it, since `n = 165` is covered by Theorem B (item 2 above).

## Files

- [`REPORT.md`](REPORT.md): statement, reformulation, Theorem A, structural lemmas, evidence, and the summary of the first referee pass.
- [`IMPROVEMENT.md`](IMPROVEMENT.md): Theorem B, its verification, and the routes that failed.
- [`verify.py`](verify.py): the standard-library check run by CI.
- [`theorem-a/`](theorem-a/): the author's original scripts and outputs for Theorem A and the evidence of REPORT.md, Section 6.
- [`improvement/`](improvement/): the author's scripts, outputs and work log for Theorem B.
- [`review/`](review/) and [`review2/`](review2/): the two referee reports and their scripts and outputs.
- [`continuation/`](continuation/): partial work on the open range, with its own [README](continuation/README.md).
