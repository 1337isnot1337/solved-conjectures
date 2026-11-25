# Higashitani–Kummer–Michałek conjecture

Complete internally audited disproof of both clauses of [Conjecture 4.10](https://arxiv.org/html/1612.07538v1). The complete multipartite graph with six parts of size two yields an Ehrhart polynomial with four roots off the canonical line. Its comparison graph, with one largest part decreased from two to one, fails the interlacing Wronskian inequality. The proof derives an exact lattice-point characterization, counts the polynomials and gives rational root certificates.

- [Complete proof](PROOF.md)
- [Exact standard-library verifier](verify.py)
- [Internal mathematical and source audit](AUDIT.md)
- [Discovery and attribution: issue #316](https://github.com/1337isnot1337/solved-conjectures/issues/316)

Run `python3 verify.py` in this directory. The exact checks passed. Lean status: [partial](FORMALIZATION.md). The result is internally reviewed but unrefereed; priority is not asserted. Both clauses count as one result.

## Further results, not separate conjecture resolutions

The six-part witness already appeared in issue #316. The newer noninterlacing pair remains on the canonical line on both sides, strengthening the earlier result.

[Stronger interlacing witness](INTERLACING-CL.md) · [Alternative Sturm certificate](STURM-CERTIFICATE.md) · [Supplement audit](SUPPLEMENT-AUDIT.md)
