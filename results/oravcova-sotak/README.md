# Oravcová–Soták conjecture for five to eight distances

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Certificates](certificates.json) · [Exact checks](verify.py) · [Issue #109](https://github.com/1337isnot1337/solved-conjectures/issues/109)

**Status:** Written proof with machine-checkable certificates. The proof is conditional on the four loneliness-spectrum classifications of this repository ([five](../../results/five-speed-spectrum/PROOF.md), [six](../../results/six-speed-spectrum/PROOF.md), [seven](../../results/seven-speed-spectrum/PROOF.md) and [eight](../../results/eight-speed-spectrum/PROOF.md) speeds). Those classifications are themselves computer-assisted and unrefereed. The note is unrefereed.

**Contributor:** [@aadrianvv](https://github.com/aadrianvv). Proof, certificates, verifier, and result package submitted in [PR #144](https://github.com/1337isnot1337/solved-conjectures/pull/144).

**Lean status:** partial. The formalization uses the actual distance graph on the integers. Its unconditional results include the greedy upper bound, periodic-word transport, loop concatenation, integer base change, the four unbounded one-parameter coloring families, the full two-parameter family, and the exceptional chromatic numbers. Theorem A, the Oravcová–Soták clique conclusion, and the primitive triangle-free corollary retain the explicitly named propositions `R5`, `R6`, `R7`, and `R8` as hypotheses. Those four real-loneliness classifications are not proved by this closure.

All nine new modules passed strict compilation with warnings treated as errors. The exact 28-module project closure passed an all-owned audit of 1239 declarations (1084 theorem declarations and 40 required endpoints) and independent stock-kernel replay. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. [Receipt](../../docs/verification/lean-named-20261121/oravcova-receipt.json), [source records](../../docs/verification/lean-named-20261121/oravcova-source-evidence.json), [complete inventory](../../docs/verification/lean-named-20261121/oravcova-all-owned-inventory.json).

The five initial source checks were repeated with complete contemporaneous records and reproduced the audited objects exactly. The combined repository gate and hosted validation remain separate. The original proof and certificates remain credited to @aadrianvv.

Primary source: J. Oravcová and R. Soták, *On a problem concerning integer distance graphs*, [arXiv:2401.12347](https://arxiv.org/abs/2401.12347), Conjecture 2.7.

## Result

For a set $D$ of positive integers, the distance graph $G(D)$ on $\mathbb Z$ joins $m$ and $n$ when $`|m-n|\in D`$. Its chromatic number is at most $`|D|+1`$. For $`k=|D|\in\{5,6,7,8\}`$ and $\gcd D=1$, the chromatic number equals $k+1$ exactly in the following cases:

```math
D=\{1,2,\ldots,k-1,ks\}\ (s\ge1),\qquad \{1,2,3,5,8\},\ \{1,4,5,6,7\}\ (k=5),\qquad \{1,2,3,4,5,7,12\}\ (k=7).
```

Consequently, Conjecture 2.7 of Oravcová and Soták holds for five to eight distances (still relative to the four classifications). The conjecture says that $`\chi(D)=|D|+1`$ forces $`D=\{1,4,5,6,7\}`$, a member of their family $`\{1,\ldots,2m-1,2m+1,4m\}`$, or a clique of order $`|D|`$.

By Lemma 1, every set with $\chi(D)=k+1$ is near-tight for the lonely runner problem, that is, $L(D)\lt1/k$. The 62 colourable sets in the spectrum tables are then handled by explicit periodic colourings. Four infinite one-parameter families are handled by "loops": proper colouring words whose lengths generate a numerical semigroup. The two-parameter six-speed family is handled by a base-change lemma that transfers periodic colourings between members of the family.

## Verification

Run from the repository root with Python 3.10 or later and no other dependencies:

```sh
python3 results/oravcova-sotak/verify.py
```

The script checks all six groups listed in the [proof](PROOF.md#verification) in about one second. Inside the repository it also compares the seven- and eight-speed tables with `../../results/*/sporadic.txt`. It prints one line per group and exits with status 0 only if every check passes.

An independent brute-force scan, [`search/bruteforce_scan.py`](search/bruteforce_scan.py), uses neither the spectrum classifications nor the certificates. Its output is [`search/bruteforce_scan.txt`](search/bruteforce_scan.txt). It decides the chromatic number of every primitive $k$-set with maximum at most 80, 60, 48 and 42 for $k=5,6,7,8$, using SAT. In that range it agrees with the theorem. It needs `python-sat`.

## Files

- [`PROOF.md`](PROOF.md): statement, lemmas, proof and sources.
- [`certificates.json`](certificates.json): the 65 table sets with their exact $L(D)$, the 62 periodic colourings, the three shortest non-colourable intervals, the loop certificates for the families A5, A6, W2 and W3, and the base loops for the two-parameter family.
- [`verify.py`](verify.py): standard-library checker for everything in the certificate.
- [`search/`](search): the SAT search scripts that produced the certificates, and the brute-force scan. None of them is needed to check the proof. See [`search/NOTES.md`](search/NOTES.md).
