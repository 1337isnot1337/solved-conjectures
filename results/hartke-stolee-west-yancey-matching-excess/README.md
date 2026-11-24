# Hartke–Stolee–West–Yancey matching-excess conjecture

**Proved.** The edge surplus for graphs with exactly $p$ perfect matchings tends to infinity as $p$ grows. The proof gives a uniform lower bound of order $\sqrt{\log p}$ for both $c_p$ and the minimum over its tail. This answers Conjecture 9.15 in the [public author manuscript](https://dwest.web.illinois.edu/pubs/perfmat.pdf#page=21).

A single deleted edge in a directed path-count gadget turns powers of two into multiples of a Mersenne integer. Binary long division forces many selected return edges even when $p-1$ itself has few binary ones. The separate stronger conjectured rate and the proposed upper bound are not claimed.

- [Complete proof](PROOF.md)
- [Primary sources and review](AUDIT.md)
- [Exact supplementary checks](verify.py)
- [Discovery and review, issue #387](https://github.com/1337isnot1337/solved-conjectures/issues/387)

The written proof does not use finite checking. The [partial Lean formalization](FORMALIZATION.md) verifies general binary arithmetic and the actual split-graph matching-count foundations in eight modules. It does not yet prove the divergence of the extremal constants or their tail minimum. The [scoped verification receipt](../../docs/verification/lean-hartke-matching-excess-partial-20261124-162051/receipt.json) records strict builds, an all-owned axiom audit, and stock kernel replay. No external refereeing or exclusive priority is claimed.
