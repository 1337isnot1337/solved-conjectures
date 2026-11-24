# Hartke–Stolee–West–Yancey matching-excess conjecture

**Proved.** The edge surplus for graphs with exactly $p$ perfect matchings tends to infinity as $p$ grows. The proof gives a uniform lower bound of order $\sqrt{\log p}$ for both $c_p$ and the minimum over its tail. This answers Conjecture 9.15 in the [public author manuscript](https://dwest.web.illinois.edu/pubs/perfmat.pdf#page=21).

A single deleted edge in a directed path-count gadget turns powers of two into multiples of a Mersenne integer. Binary long division forces many selected return edges even when $p-1$ itself has few binary ones. The separate stronger conjectured rate and the proposed upper bound are not claimed.

- [Complete proof](PROOF.md)
- [Primary sources and review](AUDIT.md)
- [Exact supplementary checks](verify.py)
- [Discovery and review, issue #387](https://github.com/1337isnot1337/solved-conjectures/issues/387)


- [Complete Lean formalization and statement correspondence](FORMALIZATION.md)
- [Lean import root](../../lean/Conjectures/HartkeMatchingExcess.lean)
- [Independent mathematical review](LEAN_REVIEW.md)
- [Independent source-statement review](STATEMENT_REVIEW.md)
- [Exact verification receipt](../../docs/verification/lean-hartke-matching-excess-complete-20261124-162051/receipt.json)

The full conjecture and recorded quantitative bounds are Lean verified for all matching counts. The 22-module closure passed strict source builds, the complete owned/private axiom audit and exact stock-kernel replay. The written proof does not rely on finite checking. Aggregate dependency-artifact, hosted and deployment obligations are tracked separately in [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563). No external refereeing or exclusive priority is claimed.
