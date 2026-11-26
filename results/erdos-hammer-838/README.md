# Erdős–Hammer convex-subset problem

**Lean status:** none.

The binary Erdős–Szekeres order-type limit has convex-subset probability $`2^{-k^2/4+O(k\log k)}`$. Balanced substitutions give a quadratic exponent of at least one half for the minimum limiting density.

The density estimate first lets the number of planar points tend to infinity at fixed subset size. The existence of the total-count limit asked for by Erdős and J. Hammer remains open. The finite upper coefficient of one half and its size profile were already in the repository on 24 November. [Earlier proof and attribution](https://github.com/1337isnot1337/solved-conjectures/tree/9d2f8f10/research/erdos-hammer-838) [Erdős problem 838 and its original reference](https://www.erdosproblems.com/838)

## Proofs

- [Exact convex probabilities in the binary limit](BINARY-LIMIT.md)
- [Extremal density from balanced substitutions](DENSITY.md)
- [Varying templates](FLAT-SUBSTITUTION.md)
- [Earlier finite upper construction](STEEP-SUBSTITUTION.md)
- [Earlier size-profile recurrence](COUNT-PROFILE.md)

**Reproducible check.** Enumeration of planar subsets and exact limit coefficients. Run `python3 results/erdos-hammer-838/check_binary.py` from the repository root. [Verifier](check_binary.py)

**Review record.** Independent proof review is pending. [Discussion and checks](https://github.com/1337isnot1337/solved-conjectures/issues/832) · [Original research files](https://github.com/1337isnot1337/solved-conjectures/tree/17fbd24838da0aff7b8081d6338b5e03d601893b/research/erdos-hammer-838).

If you use these results, please credit the authors of the original problem and the proof you use, and cite [Cinna Davis’s site](https://itsdavis.com/) and [the specific proof in this repository](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-hammer-838/BINARY-LIMIT.md).
