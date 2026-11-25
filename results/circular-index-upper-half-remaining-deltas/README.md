# Circular chromatic index in the upper half for Δ = 9, 11, 13, 15, 17, 19, 23

[Catalogue](../../CONTENTS.md) · [Certificates](certificates.json) · [Exact checks](verify.py) · Related: [Δ ≡ 2 mod 4](../circular-index-upper-half-delta-2-mod-4/README.md), [Δ ≡ 3 mod 4](../circular-index-upper-half-delta-3-mod-4/README.md), [circulants](../circular-index-upper-half-circulants/README.md)

**Status:** Seven explicit graphs, checked by `verify.py` (standard library only) and an independent exact replay. The combined all-degree statement also uses the three earlier notes, not just these seven certificates. No external refereeing or full Lean verification of the combined statement is claimed.

**Lean status:** partial for the combined all-degree result. Lean proves the real circular-index bounds for all seven new graphs, including six exact values. The earlier degree families are outside this Lean check. See the [verified scope](REVIEW.md).

**Attribution:** [tomdif](https://github.com/tomdif) supplied the graphs,
colourings, SAT encoding and original write-up in [PR #647](https://github.com/1337isnot1337/solved-conjectures/pull/647)
([original commit](https://github.com/1337isnot1337/solved-conjectures/commit/3a322cb10a9f476f79026e63691ae27d509b4063)).

## Question

Mazák and Zrubák (*Circular chromatic index of small graphs*, arXiv:2603.08822, Section 8, remark after Problem 7) note that for no Δ ≥ 8 was a graph with maximum degree Δ and χ'_c ∈ (Δ + 1/2, Δ + 1) known. The repository's three earlier notes settle every Δ ≥ 8 except Δ ∈ {9, 11, 13, 15, 17, 19, 23}. The structured search in the Δ ≡ 3 mod 4 note found no example of its form at those degrees.

## Result

**Proposition.** For each Δ ∈ {9, 11, 13, 15, 17, 19, 23}, `certificates.json` gives a simple graph G on an odd number n = 2m + 1 of vertices with maximum degree Δ and a (p, 3)-edge-colouring, p = 3Δ + 2, such that

    Δ + 1/2  <  |E(G)|/m  ≤  χ'_c(G)  ≤  p/3  =  Δ + 2/3  <  Δ + 1.

| Δ | n | \|E\| | bounds on χ'_c |
|---|---|---|---|
| 9 | 13 | 58 | = 29/3 |
| 11 | 13 | 70 | = 35/3 |
| 13 | 19 | 123 | = 41/3 |
| 15 | 23 | 171 | 171/11 ≤ χ'_c ≤ 47/3 |
| 17 | 25 | 212 | = 53/3 |
| 19 | 25 | 236 | = 59/3 |
| 23 | 31 | 355 | = 71/3 |

In six cases the bounds meet and χ'_c = Δ + 2/3 exactly. For Δ = 15 the value is only bracketed, which is enough for the question.

**Corollary (with the earlier notes).** For every Δ ≥ 8 there is a simple graph with maximum degree Δ and χ'_c ∈ (Δ + 1/2, Δ + 1). This answers the remark of Mazák and Zrubák for all Δ ≥ 8, by written proofs for large Δ and certificates for the rest.

## Why the bounds hold

- Upper bound: a (p, q)-edge-colouring (colours in Z_p, edges at a common vertex at circular distance ≥ q) gives χ'_c ≤ p/q.
- Lower bound: every colour class of a circular edge-colouring is a matching, and a matching in a graph on 2m + 1 vertices has at most m edges; so χ'_c ≥ χ'_f ≥ |E|/m.

## How they were found

[`search/sat2.py`](search/sat2.py) encodes the existence of a graph and colouring together: one variable per (edge, colour), one per (vertex, colour) meaning "the vertex has an edge of this colour", the window constraint (a vertex plays at most once in any 3 consecutive colours), and degree constraints (all vertices of degree Δ except a few of degree Δ − 1). The solver (CaDiCaL 1.5.3 via python-sat) chooses the graph freely. In tight runs every colour class has exactly m/3 edges, which forces |E|/m = p/3. Solve times on one core: 0.4 s (Δ = 9), 5 s, 6 s, 320 s, 52 s, 6,800 s (Δ = 19), 1,650 s (Δ = 23). The search tool is not needed to check the result.

Unlike the earlier notes, the graphs are not circulants or K_n minus a few edges; the solver chooses them freely. No structure has been extracted from them and no general construction is claimed.

## Verification

    python3 results/circular-index-upper-half-remaining-deltas/verify.py

Run from the repository root with Python 3 and no other dependencies (under a second).

For each certificate it checks simplicity and maximum degree, checks the colouring twice independently (all pairs of incident edges; and the window criterion that any 3 consecutive colour classes form a matching), and checks the two bounds with exact rationals. It ends with `ALL CHECKS PASSED`. See the [independent review and Lean scope](REVIEW.md).

## Scope and limits

- Only the seven listed degrees are new here; all other Δ ≥ 8 rest on the repository's earlier notes and their own verification status.
- Novelty rests on the repository's statement that these degrees were open (README of `circular-index-upper-half-delta-3-mod-4`, checked against the `main` and `research` branches on 2026-11-24). No independent literature search beyond that was made.
- Problem 6 (connectivity) and Problem 7 (every integer denominator q > 2) of Mazák–Zrubák are not resolved by these certificates.
