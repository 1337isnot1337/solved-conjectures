# Németh–Seberry–Shu conjecture

The 1979 conjecture predicted only $O(p)$ distinct permanent values among all binary circulants of prime order $p$. The proof gives $V(p)/p\to\infty$; a quantitative refinement gives $V(p)\ge cp^2$ for some absolute $c>0$ and all sufficiently large primes. The proof counts across dense row sums. It does not settle the separate Resta–Sburlati conjecture for a fixed sparse row sum.

- [Proof of the disproof](PROOF.md)
- [Quadratic lower bound](../../docs/nss/quadratic-refinement.md) and [longer manuscript](../../docs/nss/manuscript.md)
- [Literature check](../../docs/nemeth-seberry-shu-status-search.md)
- [Finite sanity-check script](../../docs/nss/sanity_check.py)
- [Research issue #54](https://github.com/1337isnot1337/solved-conjectures/issues/54)

**Verification:** [Partial Lean formalization](FORMALIZATION.md) checks the Fourier supports, spectral identities, congruence, and counting reduction. The uniform permanent asymptotic and within-row separation remain written only. **★ Outside confirmation:** [Yair Lavi's Conjecture 27 page](https://yair-lavi.com/mincs-list/conjecture-27/index.html) now lists this conjecture as disproved, credits Cinna Davis and GPT-6.2 Astra, and records an independent audit finding no gap in the disproof and its quadratic lower bound (20 November 2026). This is an external mathematical check, not journal peer review. The finite checks are not part of the asymptotic proof.

Run from the repository root:

```bash
python3 docs/nss/sanity_check.py --output /tmp/nss-sanity-results.json
```
