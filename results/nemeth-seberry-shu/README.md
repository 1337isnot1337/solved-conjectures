# Németh–Seberry–Shu conjecture

The 1979 conjecture predicted only $O(p)$ distinct permanent values among all binary circulants of prime order $p$. The proof gives $V(p)/p\to\infty$; a quantitative refinement gives $V(p)\ge cp^2$ for some absolute $c>0$ and all sufficiently large primes. The proof counts across dense row sums. It does not settle the separate Resta–Sburlati conjecture for a fixed sparse row sum.

- [Proof of the disproof](PROOF.md)
- [Quadratic lower bound](../../docs/nss/quadratic-refinement.md) and [longer manuscript](../../docs/nss/manuscript.md)
- [Literature check](../../docs/nemeth-seberry-shu-status-search.md)
- [Finite sanity-check script](../../docs/nss/sanity_check.py)
- [Research issue #54](https://github.com/1337isnot1337/solved-conjectures/issues/54)

**Verification:** Written proof with internal checks; no Lean formalization or external peer review. The finite checks are not part of the asymptotic proof.

Run from the repository root:

```bash
python3 docs/nss/sanity_check.py --output /tmp/nss-sanity-results.json
```
