# Review of the Leech lattice cold-spot correction

## Target and attribution

The sentence following Table 3 in §5 of Bachoc, Moustrou, Vallentin and Zimmermann identifies $`A_{24}`$ as the limiting deep-hole type of the Leech lattice. Their Lemma 5.1 compares fixed points. Their Theorem 1.4 establishes absence of stable cold spots. The correction concerns the location approached by moving global minimizers. It agrees with both of those numbered results. [Published paper, p. 26](https://doi.org/10.1017/fms.2026.10169) · [Preprint v2, p. 27](https://arxiv.org/pdf/2502.08819v2#page=27)

Cinna Davis recorded the localization proof and the first coefficient verifier on 24 November 2026. On 26 November, separate Codex reviewers examined the proof, checked the source identity, and reconstructed the finite comparison independently of the verifier. This is an internal, AI-assisted mathematical review. The result has no Lean formalization or external referee report. [Original proof](https://github.com/1337isnot1337/solved-conjectures/commit/be93cae4aca1d3f41bf97180bec8cd039924ea3a) · [Original verifier](https://github.com/1337isnot1337/solved-conjectures/commit/532425ae2b42518ef21b277356996b338b583f86) · [Issue #376](https://github.com/1337isnot1337/solved-conjectures/issues/376)

## Mathematical review, 26 November 2026

- **Localization.** Away from deep holes the covering distance has a uniform gap on the compact lattice torus. At a deep hole the origin is interior to the convex hull of nearest lattice vectors, so a single summand in a supporting direction traps every neighborhood minimizer in a ball of radius $`O(1/\alpha)`$. The proof compares all minimizers at the given parameter.
- **The moving point.** In the rescaled coordinate $`y=\alpha(z-c)`$, the normalized nearest-shell sum has a positive-definite Hessian. On a fixed ball the next-shell gap gives a uniform exponentially small remainder, including the first two derivatives. Strong convexity on that ball yields the unique neighborhood minimizer and the stated position error of order $`\alpha^{-2}`$. Comparing its value at all finitely many hole representatives gives the global criterion.
- **Affine diagrams.** Orthogonal components decouple. In one affine simplex the image of the evaluation map is the orthogonal complement of its positive dependence vector. This realizes equality in weighted AM–GM. Reconstructing the exceptional marks from their three arm lengths gives the component constants in the proof. Nonconstant marks in each $`E_8`$ component imply a nonzero gradient at zero. The review checked the classification, orthogonality and affine-orbit statement against [Conway, Parker and Sloane](https://doi.org/10.1098/rspa.1982.0042) and [Shimada, Theorems 2.3 and 2.5](https://arxiv.org/pdf/1502.02099v3#page=7).
- **Quantifier on the limit.** The distance to the finite set of $`E_8^3`$ representatives goes to zero. Transitivity and invariance give a global minimizing branch converging to each representative. A choice of one minimizer at each parameter may switch branches. The publication makes this distinction explicit.

## Arithmetic replay

The reviewer independently transcribed the 23 distinct types from Table 3 and evaluated the entropy formula using 80-digit arithmetic. The smallest three values began 24.32239537548 for $`E_8^3`$, 24.42892506784 for $`D_{24}`$, and 24.55983982058 for $`D_{16}E_8`$. A separate enumeration of rank-24 ADE multisets of common Coxeter number reproduced the same 23 types. Integer powers verified the displayed exceptional-type inequalities and both leading intervals directly from their radical formulas. [Table 3](https://arxiv.org/html/2502.08819v2#S5.T3) · [Proof and closed forms](PROOF.md)

The [tracked verifier](verify.py) uses integer bisection on the affine marks and compares the resulting rational endpoints. Both `python3 verify.py` and `python3 -O verify.py` produced the following strict separations. Both modes also rejected deliberately duplicated types, an incorrect runner-up, overlapping intervals and an incorrect decimal bound.

| Deep-hole type | Lower bound, inclusive | Upper bound, exclusive |
| --- | ---: | ---: |
| $`E_8^3`$ | 24.322395375 | 24.322395378 |
| $`D_{24}`$ | 24.428925067 | 24.428925068 |
| $`D_{16}E_8`$ | 24.559839820 | 24.559839822 |

## Bounded prior-work and duplicate search

As of 26 November 2026, searches combined the journal title, authors, DOI and arXiv number with “correction”, “erratum”, “Leech lattice”, “Gaussian cold spots”, “inhomogeneous theta”, “limiting deep-hole type”, “E8”, and the two leading numerical constants. The arXiv record listed versions 1 and 2. The journal version retained the limiting-type sentence. The journal record and the checked author publication pages yielded no corrigendum. [Version history](https://arxiv.org/abs/2502.08819) · [Vallentin](https://www.mi.uni-koeln.de/opt/frank-vallentin/publications/) · [Moustrou](https://pmoustro.perso.math.cnrs.fr/) · [Zimmermann](https://www.marcchristianzimmermann.com/research)

The DOI metadata contained no linked update. The four works in the OpenAlex citing list at the time of review concerned planar lattice optimization, planar honeycomb polarization, covering-radius complexity, and heat kernels on two-dimensional tori. None identified the Leech limiting type. Citation indexes may omit recent or unindexed work. [Crossref record](https://api.crossref.org/works/10.1017/fms.2026.10169) · [OpenAlex citing works](https://api.openalex.org/works?filter=cites:W4407571033)

Bétermin and Petrache’s Theorem 1.5 compares a deep hole to a fixed translation at sufficiently large parameter. It gives a precursor to localization. The Conway–Parker–Sloane classification and Shimada’s diagram results supply the geometry. The checked sources yielded no earlier identification of the optimized $`E_8^3`$ coefficient as the Leech minimum. This bounded search establishes no general priority claim for the rescaling method. [Bétermin–Petrache, Theorem 1.5](https://arxiv.org/pdf/1607.08716#page=6)

Both repository branches and the issue and pull-request records were searched by authors, Leech lattice, cold spots, and source identifiers. The FCC/BCC result concerns different lattices and all Gaussian scales. The first-moment stability issue concerns balanced holes, and the shell-deformation work fixes shell data. Searches of Mathlib and Formal Conjectures yielded no matching formalization. This package records a correction to a published assertion, outside the ranked named-conjecture count. [FCC/BCC entry](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/betermin-fcc-bcc-cold-spots) · [First-moment issue #372](https://github.com/1337isnot1337/solved-conjectures/issues/372)
