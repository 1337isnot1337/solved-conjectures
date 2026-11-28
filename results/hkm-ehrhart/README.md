# Higashitani–Kummer–Michałek conjecture

**Prior work.** The conjecture was already disproved, with the same six-part graph, by Aran S. Ziegler, *Off-line Ehrhart roots for complete multipartite symmetric edge polytopes*, Zenodo, registered 8 October 2026, [doi:10.5281/zenodo.23236860](https://doi.org/10.5281/zenodo.23236860). Cite that note for the disproof. This page records a later derivation dated 24 November 2026. It is unranked and is not counted as a new resolution. [Details](PROOF.md)

Complete internally audited disproof of both clauses of [Conjecture 4.10](https://arxiv.org/html/1612.07538v1). The complete multipartite graph with six parts of size two yields an Ehrhart polynomial with four roots off the canonical line. Its comparison graph, with one largest part decreased from two to one, fails the interlacing Wronskian inequality. The proof derives an exact lattice-point characterization, counts the polynomials and gives rational root certificates.

- [Complete proof](PROOF.md)
- [Exact standard-library verifier](verify.py)
- [Internal mathematical and source audit](AUDIT.md)
- [Discovery and attribution: issue #316](https://github.com/1337isnot1337/solved-conjectures/issues/316)

Run `python3 verify.py` in this directory. The exact checks passed. Lean [verifies the full disproof of the published conjecture](FORMALIZATION.md) via an off-line root; the independent Wronskian certificate remains written. The result is internally reviewed but unrefereed; priority is not asserted. Both clauses count as one result.

## Further results, not separate conjecture resolutions

The six-part witness already appeared in issue #316. The newer noninterlacing pair remains on the canonical line on both sides, strengthening the earlier result.

[Stronger interlacing witness](INTERLACING-CL.md) · [Alternative Sturm certificate](STURM-CERTIFICATE.md) · [Supplement audit](SUPPLEMENT-AUDIT.md)
