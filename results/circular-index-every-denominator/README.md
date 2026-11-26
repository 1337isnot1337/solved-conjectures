# Every denominator q > 2 occurs in the upper half: Mazák–Zrubák Problem 7

[Catalogue](../../CONTENTS.md) · [Exact checks](verify.py) · Related: [circulants](../circular-index-upper-half-circulants/README.md), [remaining degrees](../circular-index-upper-half-remaining-deltas/README.md)

**Status:** Complete written proof (short and elementary) with an exact standard-library check of the finite instances q ≤ 30. Unrefereed. No Lean formalization. **Possibly folklore:** the value follows from the circular chromatic number of a lexicographic product of an odd cycle with a complete graph (see "Novelty" below). The question is answered **for multigraphs**, which Problem 7 explicitly allows. The simple-graph version stays open for q ≥ 6.

Primary source: J. Mazák and F. Zrubák, *Circular chromatic index of small graphs*, [arXiv:2603.08822](https://arxiv.org/abs/2603.08822) (v1, 9 Mar 2026), Section 8:

> **Problem 7.** Does there for every integer q > 2 exist an integer p and a (multi)graph G with χ′_c(G) = p/q ∈ (Δ(G) + 1/2, Δ(G) + 1)?

The paper realises denominators 3, 4 and 5 (the last only as 23/5, for multigraphs with Δ = 4). This repository's [circulant note](../circular-index-upper-half-circulants/README.md) lists Problem 7 as open for q ≥ 6.

## Result

For k ≥ 2 and μ ≥ 1 let $`C_{2k+1}^{(\mu)}`$ be the multigraph obtained from the cycle $`C_{2k+1}`$ by replacing each edge with μ parallel edges. It is loopless, 2μ-regular, and has (2k+1)μ edges.

**Theorem.** $`\chi'_c\bigl(C_{2k+1}^{(\mu)}\bigr)=\dfrac{(2k+1)\mu}{k}=2\mu+\dfrac{\mu}{k}`$.

**Corollary (answer to Problem 7 for multigraphs).** For every integer q ≥ 3, the multigraph $`G_q=C_{2q+1}^{(q-1)}`$ has Δ(G_q) = 2q − 2 and

```math
\chi'_c(G_q)=\frac{(2q+1)(q-1)}{q}=\Delta(G_q)+\frac{q-1}{q}\in\Bigl(\Delta(G_q)+\tfrac12,\ \Delta(G_q)+1\Bigr).
```

The fraction is in lowest terms, because (2q+1)(q−1) ≡ 1·(−1) = −1 (mod q). So every denominator q > 2 occurs. More generally, every rational Δ + μ/k with even Δ = 2μ and k/2 < μ < k occurs, with denominator k/gcd(μ, k).

Small cases: q = 3 gives $`C_7^{(2)}`$ with 14/3, a value the paper already has at Δ = 4 from other graphs. q = 4 gives $`C_9^{(3)}`$ with 27/4 (Δ = 6), q = 5 gives $`C_{11}^{(4)}`$ with 44/5 (Δ = 8), and q = 6 gives $`C_{13}^{(5)}`$ with 65/6 (Δ = 10).

## Proof

Write n = 2k + 1, p = nμ, and number the cycle edges $`e_j=\{j,j+1\}`$ for j ∈ ℤ_n.

*Lower bound.* Every colour class of a circular edge-colouring is a matching. A matching in a multigraph on n = 2k + 1 vertices has at most k edges. Averaging over unit arcs gives $`\chi'_c(G)\ge\chi'_f(G)\ge|E(G)|/\alpha'(G)`$; this is Lemma 1 of the circulant note, and its proof does not use simplicity. Here |E| = nμ and α′ = k, so $`\chi'_c\ge p/k`$.

*Upper bound.* Give colour s ∈ ℤ_p to one copy of the edge $`e_{2s \bmod n}`$. As s runs over ℤ_p, the index 2s mod n runs μ times through ℤ_n (2 is invertible mod n and p = nμ), so each of the μ copies of every $`e_j`$ gets exactly one colour. It remains to check that any k cyclically consecutive colours s, s+1, …, s+k−1 form a matching. They are copies of $`e_j, e_{j+2},\dots,e_{j+2k-2}`$ with j = 2s mod n; this is still correct across the wrap-around of ℤ_p, because n divides p. These k edges cover the 2k distinct vertices j, j+1, …, j+2k−1 of ℤ_n, so they are pairwise disjoint. Hence edges sharing a vertex, parallel copies included, get colours at circular distance at least k. This is a (p, k)-edge-colouring, so $`\chi'_c\le p/k`$. ∎

The corollary follows with k = q and μ = q − 1: then μ/k = (q−1)/q ∈ (1/2, 1) for q ≥ 3.

## Novelty and scope

- **Probably known in a different language.** The line graph of $`C_{2k+1}^{(\mu)}`$ is the lexicographic product $`C_{2k+1}[K_\mu]`$, so the theorem is the statement $`\chi_c(C_{2k+1}[K_\mu])=\mu(2k+1)/k`$. Results of this kind on circular chromatic numbers of lexicographic products are classical, so a specialist may well regard the theorem as folklore. We give a self-contained proof and claim only that it answers Problem 7 as posed. Mazák and Zrubák do not mention odd cycles with multiplied edges, and their Section 8 states Problem 7 as open. A web search found no paper that answers it. This is a bounded search on 2026-11-25, not a guarantee.
- **Simple graphs: open.** The multigraphs here are far from simple, and the paper's remark that no simple graph with Δ ≥ 8 in the upper half was known suggests the authors may care most about simple graphs. For simple graphs denominators 3, 4 and 5 are known (this repository's notes). q ≥ 6 is open: the repository's cyclic SAT ansatz excludes several small circulant cases (circulant note §7.4), and a general SAT search for tight (6Δ+5, 6)- and (7Δ+r, 7)-colourings on 13 and 15 vertices did not finish in over an hour.
- **Problem 6 is not addressed.**

## Verification

```sh
python3 results/circular-index-every-denominator/verify.py
```

Standard library only, about 20 seconds. For all 2 ≤ k ≤ 30 and 1 ≤ μ ≤ 30 it builds the colouring above and checks every pair of incident edge copies for circular distance ≥ k. It computes the maximum matching (dynamic programming, cross-checked by brute force for n ≤ 15) and checks |E|/α′ = p/k. For q = 3, …, 30 it checks the denominator and the strict interval. It ends with `ALL CHECKS PASSED`. The finite check is a sanity check only; the proof above covers all k and μ.
