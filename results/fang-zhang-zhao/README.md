# Fang–Zhang–Zhao's infinite-log-convexity conjecture

The universal conjecture is false. For every integer $`m\ge4`$, the row-sum sequence of the $`m`$-Hoggatt triangle fails infinite log-convexity. An exact polynomial factorization proves a negative third iterate for every $`m\ge6`$; exact fourth iterates cover $`m=4,5`$.

The source is Fang, Zhang and Zhao, *Analytic properties arising from the Baxter numbers*, [arXiv:2505.05873v1](https://arxiv.org/html/2505.05873v1), Conjecture 4.3; [JMAA 561 (2026), 130615](https://doi.org/10.1016/j.jmaa.2026.130615). Its separate Baxter-number conjecture is not settled here. The parameter values are one counterexample family, not separate resolutions.

- [Complete disproof](PROOF.md)
- [Independent mathematical and combinatorial review](REVIEW.md)
- [Source and priority audit](NOVELTY.md)
- [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/160)

## Checks

From the repository root, with SymPy installed:

```bash
python3 results/fang-zhang-zhao/verify.py
python3 results/fang-zhang-zhao/independent_check.py
python3 results/fang-zhang-zhao/independent_symbolic_check.py
```

The independent finite check counts plane partitions directly and compares the counts with both product formulas. The symbolic checks verify the whole parameter-polynomial identity over the rationals. The written proof includes the sign argument and explicit integer witnesses. No Lean verification was performed.

Status: complete proposed disproof, independently checked internally; unrefereed. No prior resolution was found in the documented search. Inaccessible later full texts remain explicit limits on the priority audit.

The original universal conjecture is refuted in Lean by the exact m=6 witness: [`Conjectures.FangZhangZhao`](../../lean/Conjectures/FangZhangZhao.lean). The stronger all-m≥4 theorem is not yet formalized. The module and its kernel replay passed locally; the full repository gate remains pending.
