# Malek's conjecture

**Lean status:** incomplete candidate; verification pending. No verified matrix theorem.

For every nonnegative doubly stochastic matrix $`A`$ of order $`n\ge2`$ and every subpermanent degree $`0\le k\le n`$,

```math
\sigma_k(A)\ge
\sigma_k\!\left(\frac{nJ_n-A}{n-1}\right).
```

The complete proposed proof covers all parameters and classifies equality. Its new step is a reciprocal-mean capacity estimate for the stable polynomial representing a proper subpermanent degree. The full-permanent endpoint is previously proved work.

This is the historical conjecture attributed to Malek in Cheon–Wanless's 2005 survey, equation (9), linked from [Minc's list](https://yair-lavi.com/mincs-list/). The live numbered C3 page cites Malek but does not separately state this all-degree extension. It is a named subsidiary in that source chain, not another resolution of numbered Conjecture 3. The source audit makes this eligibility limit explicit.

- [Complete proof and equality cases](proof.md)
- [Incomplete Lean formalization and scope audit](FORMALIZATION.md)
- [Source and priority audit](source-audit.md)
- [Independent inequality review](review-inequalities.md)
- [Independent constants and text review](review-constants.md)
- [Exact scalar identity checker](verify.py)
- [Coordination issue](https://github.com/1337isnot1337/solved-conjectures/issues/145)

Both internal reviews found no mathematical gap. The exact checker uses only Python's standard library and tests scalar proof identities, not a finite set of matrices. The proof is unrefereed, historical priority remains provisional, and no Lean verification is claimed.
