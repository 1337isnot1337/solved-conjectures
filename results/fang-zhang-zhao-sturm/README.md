# Fang–Zhang–Zhao's Sturm conjecture

The $`(q,t)`$-Hoggatt polynomials form a strict Sturm sequence for every real $`q>1`$ and every integer $`m\ge2`$. Together with the source's established $`q=1`$ theorem, this proves Conjecture 4.1 in its full stated range of positive integer $`q`$ and $`m=2,3`$.

The proof combines the classical Garloff–Wagner Hadamard theorem with strict geometric root separation and a Jackson derivative interlacing lemma. Its induction covers every row index. The final rescaling of the variable is independent of the row index.

Source: Fang, Zhang and Zhao, *Analytic properties arising from the Baxter numbers*, [arXiv:2505.05873v1](https://arxiv.org/html/2505.05873v1), Section 4; [JMAA 561 (2026), 130615](https://doi.org/10.1016/j.jmaa.2026.130615).

- [Complete proof](PROOF.md)
- [Source, priority and independent-review audit](NOVELTY.md)
- [Exact consistency checks](verify.py)
- [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/162)

## Checks

From the repository root, with SymPy installed:

```bash
python3 results/fang-zhang-zhao-sturm/verify.py
```

The verifier checks the Gaussian-binomial expansion, Jackson identity and MacMahon transfer independently, and uses exact rational root isolation on small adjacent pairs. These finite checks diagnose errors in the formulas; the ordinary mathematical proof establishes the unrestricted sequence. No Lean verification was performed.

Status: complete proposed proof, with two independent internal mathematical reviews; unrefereed. The priority audit found no earlier resolution and records inaccessible full texts explicitly. A November 2026 primary follow-up still distinguishes the original unscaled interlacing question from its normalized result.
