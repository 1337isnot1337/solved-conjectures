# Erdős–Hajnal set-mapping conjecture

**Lean status:** none.

Matching missing colors to available subsets yields $`H(n)\le \log_2 n+\log_2\log_2 n+O(1)`$. A separate circuit obstruction restricts constructions from binary nullspaces.

The two conventions for whether a subset may name one of its own elements change the threshold by at most one. Erdős and Hajnal asked whether the excess above $`\log_2 n`$ diverges for arbitrary set mappings. That lower-bound question remains open. [Erdős and Hajnal, pp. 345–348](https://www.renyi.hu/~p_erdos/1968-01.pdf)

## Proofs

- [Matching argument and comparison of conventions](PROOF.md)
- [Common circuits in binary nullspaces](binary-circuits.md)

**Reproducible check.** Matching repairs and nullity-one faces. Run `python3 results/erdos-hajnal-set-mapping/check.py` from the repository root. [Verifier](check.py)

**Review record.** Independent proof review is pending. [Discussion and checks](https://github.com/1337isnot1337/solved-conjectures/issues/796) · [Original research files](https://github.com/1337isnot1337/solved-conjectures/tree/17fbd24838da0aff7b8081d6338b5e03d601893b/research/erdos-hajnal-set-mapping).

If you use these results, please credit the authors of the original problem and the proof you use, and cite [Cinna Davis’s site](https://itsdavis.com/) and [the specific proof in this repository](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-hajnal-set-mapping/PROOF.md).
