# Independent review of Vishnyakova's conjecture

Date: 2026-11-21. Reviewer: graph/number-theory worker. The reviewed package is `results/vishnyakova-root-radius/`, originally published at commit `21ea77089d0b0d0001acf03c890e641965f56289`; the complete proof content inspected has blob `555d7a669b12c74d5042e0b6e8d2ed7d5d634a3b`. This review is independent of the package's algebra, analysis and root reviewers. It does not alter their mathematics.

**Verdict: the full proof passes.** The original and weighted conjectures are one family, with a single new-result count. The earlier all-degree equal-parameter theorem does not already imply this proof's unrestricted conclusion: the complex-parameter exclusion and its use in polarization supply a real missing step.

## Source mapping

The July [primary paper](https://borowiecki.dev/pdf/2607.06207), arXiv:2607.06207v1, was inspected at Definition 1.4, its surrounding equivalence, and Open Problems 6.1–6.3. Open Problem 6.2 is exactly the all-degree outer-radius assertion for polynomials with totally positive samples. The positive-leading-coefficient convention can be enforced by a scalar and has no effect on roots.

The August [author-uploaded primary text](https://www.researchgate.net/publication/411305396_Polynomially_Deformed_Normalized_Pochhammer_Sequences_Having_Generating_Functions_With_Only_Real_Non-positive_Zeros), arXiv:2608.03723v1, was inspected at Definition 1.4, equation (8), and Open Problems 7.1–7.2. It uses precisely the weighted falling-factorial transform in the proof, for every positive real weight. Its radius is the supremum of the largest complex-root modulus, without a real-rootedness assumption on the original polynomial. The conclusion $R_n=\beta+n-1$ and the claimed full parameter range match.

## Independent mathematical reconstruction

The symmetric multiaffine family is the inverse image of the complete transformed factorization. Its leading coefficient in $z$ is $1/(\beta)_n$, regardless of the parameters, so it never collapses to the zero polynomial under specialization.

The diagonal generating function follows by writing the index as $n=k+j$ and summing the rising-factorial series with parameter $\beta+k$. Differentiating it gives the stated three-term recurrence. The tridiagonal determinant has the same recurrence: the product of its two off-diagonal entries is negative $t(1-t)j(j+\beta-1)$, so the determinant recurrence has the required plus sign.

The argument for complex $t$ does not improperly treat the tridiagonal matrix as Hermitian. For a normalized right eigenvector, $v^*Jv=z$ still holds; only $D$ and $K$ are used as Hermitian matrices. Writing $d=v^*Dv$ and $k=v^*Kv$, the sum of elementary two-term estimates is exactly

```math
|k|\le 2d+\beta-(n+\beta-1)|v_{n-1}|^2\le 2d+\beta.
```

The identity includes $n=1$ and uses only $\beta>0$.

The reciprocal-segment lemma is valid for either square-root branch. The endpoints have product one and opposite nonzero imaginary parts. If the midpoint has negative imaginary part, the endpoint in the upper half-plane has modulus less than one. The real-axis intersection is $2\operatorname{Re}r/(1+|r|^2)$, strictly between minus one and one. Convexity of the open disk then places the whole upper part of the segment strictly inside it. Applying this to the eigenvector identity excludes every upper-half-plane $z$ outside the claimed disk when $t$ is in the upper half-plane.

I checked [Borcea–Brändén, arXiv:0809.3087](https://arxiv.org/pdf/0809.3087), Theorems 1.1 and 1.5, directly. The open upper half-plane is a convex circular domain, and the parameter polynomial is symmetric and multiaffine. Grace–Walsh–Szegő therefore applies with no missing degree hypothesis. Its diagonal coincidence contradicts the just-established complex-parameter exclusion if any independent upper-half-plane parameters produce a zero.

For real parameter limits, the proof uses Hurwitz on an open connected domain in the **root variable**. This is stronger than an invalid assertion that limits of nonzero values are nonzero. The domain is connected, the convergence is locally uniform, and the fixed leading coefficient excludes an identically zero limit. Conjugation supplies the lower-half-plane statement.

The remaining real roots are bounded by coefficient positivity to the right and the exact reflection identity to the left. The finite Vandermonde identity has no alternating sign in its sum; the sign $(-1)^j$ occurs only when transforming $Q(-w-1)$. This yields the claimed diameter. All parameters equal to one give $(z+\beta)_n/(\beta)_n$, whose extreme negative root attains the modulus bound.

These checks establish the all-degree proof directly. No finite numerical calculation was used as evidence for a universal step, and no Lean work was done.

## Earlier work and the new scope

The complete [7 October 2026 interpolation report](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-continuation-2026-10-07/interpolation/REPORT.md) was fetched and read independently (blob `2164051fe9a0d921833116cc7b6650947b6f6f3d`). It proves the disk for equal real parameters in all degrees and for independent parameters through degree five, at weight one. It explicitly leaves independent parameters in arbitrary degree open. Its tridiagonal construction is appropriately credited. Its arbitrary-mixture counterexample is expressly outside the totally positive class.

The prior report's real-parameter quadratic norm bound is not a bound for complex upper-half-plane parameters. Therefore one cannot obtain the new theorem simply by invoking polarization on its old statement. The reviewed proof supplies exactly that missing complex exclusion, with a different eigenvector estimate and the reciprocal-segment lemma. This is a substantive completion of the whole source conjecture, not an additional fixed-degree case.

The complete ordinary scope statements in the [trureturing weighted-radius note](https://github.com/the-omega-institute/trureturing/blob/f289261bc3ed0ffa16f39f87868e93638d77f0c8/Blueprint/D5/S3/Zeros/PochhammerDeformation/QuadraticRadii.md) were inspected (blob `8ae57cc846383d02bd9b534eaefe37e0165fe597`). Theorem 1.12 expressly restricts the result to degree two and makes no assertion for higher degrees.

I also opened the [Cheng–Xin primary paper](https://arxiv.cnoctave.top/pdf/2611.17839), arXiv:2611.17839v1 (13 November 2026). Its main preservation theorems concern multiplication and gamma positivity. They do not state the complex-root disk conclusion. This is consistent with the package's scope distinction.

## Additional direct catalogue checks

To supplement indexed web searches, these current catalogues were fetched in full and searched for the author, source identifiers, transformed family and root-bound terminology:

| Catalogue | Inspected blob | Outcome |
| --- | --- | --- |
| `KnowledgeSense/math`, `README.md` | `3a4e8c444623a042b581d60fd65b5a1470b03f88` | No matching target entry |
| `pudim-project/pudim-ai-demo-zetalaw`, `APPLICATIONS.md` | `4f5f4a47f4ad858198fc790f78bfebf073636e9e` | No matching target; the Vishnyakova occurrence concerns a different q-gamma kernel |
| `PrincipiaMathOrg/math-solutions`, `site-backup/MANIFEST.json` | `e258a2e1f173e03f393d701950a72327ef389f72` | No matching target among 493 listed resources; nearby root/basis titles were inspected further |
| `qqliu/CoPEER`, `README.md` | `79bff2fccde07affe48ccb059fa701017daa7f3c` | No matching target entry |

The potentially nearby Principia statements were checked directly: MathDB330132 is a dimension-six/seven strip bound for palindromic Ehrhart-type polynomials; MathDB351518 is a counterexample to a shifted Laguerre–Pólya preservation assertion; MathDB398865 constructs a symmetric cubic curve in a bidisk. None is the present root-radius theorem or its unrestricted complex-parameter lemma.

Both web engines were used for exact source IDs, author plus radius, proof/resolution variants, and related Meixner, falling-factorial and Ehrhart root-localization language. They supplied no earlier full resolution. These are bounded search results, not proof of global absence. The package's disclosed inaccessible classical sources remain a limitation; this review does not convert them into fully inspected negative evidence.

The theorem and surrounding polynomial-interpolator formulation in [Brändén–Ottergren, arXiv:1210.7151v2](https://arxiv.org/pdf/1210.7151) were also read directly. They classify the relevant generalized-Laguerre multiplier sequences but do not state the root-radius conclusion in those passages. A supplementary search found an older Laguerre-sector manuscript, but its attempted primary URL returned 404; it is not counted as inspected. Global GitHub code search was in a shared rate-limit cooldown during this supplementary review, so no additional negative indexed result is claimed beyond those already documented by the package's authoring team.
