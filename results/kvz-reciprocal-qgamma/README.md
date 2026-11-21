# Karp–Vishnyakova–Zhang's reciprocal q-gamma conjecture

For every $`0<q<1`$, the kernel $`1/\Gamma_q(x+y)`$ is strictly sign regular of every order on the positive quadrant. For any two strictly increasing positive node lists of length $`r`$, its determinant has sign $`(-1)^{r(r-1)/2}`$ and is nonzero.

This proves the full continuous-kernel conjecture in Section 3, Example 8 of Karp, Vishnyakova and Zhang, *Unimodality preservation by ratios of functional series and integral transforms*, [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2), [Results in Mathematics 80 (2025), 112](https://doi.org/10.1007/s00025-025-02431-4). The positive q-gamma kernel and the source's order-three discrete reciprocal lemma are prior results, not new claims here.

The q-binomial theorem gives a positive double-series factorization. Two finite Cauchy–Binet formulas show that all determinant summands have the required sign. A fixed nonzero summand preserves strictness when the truncations converge.

- [Complete proof](PROOF.md)
- [Source and priority audit](SOURCES.md)
- [Mathematical review](CHECKS.md)
- [Exact diagnostic checks](verify.py)
- [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/164)

## Checks

From the repository root:

```bash
python3 results/kvz-reciprocal-qgamma/verify.py
```

The script uses only the Python standard library. It checks the double-series coefficient identity, exact reciprocal-gamma minor signs at integer nodes, and finite Cauchy–Binet expansions. These are supplementary checks; the proof handles arbitrary positive real nodes and every order. No Lean verification was performed.

Status: complete proposed proof, independently reviewed internally; unrefereed. No previous reciprocal-kernel resolution was found in the documented search. The nearest located follow-up expressly resolves the positive kernel and excludes the reciprocal problem.
