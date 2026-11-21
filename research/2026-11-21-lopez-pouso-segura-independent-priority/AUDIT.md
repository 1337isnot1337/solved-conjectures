# López Pouso–Segura's conjectures

Additional independent corpus and issue priority audit, 21 November 2026. This note supplements the existing source audits for [the Bessel-weight proofs](../../results/lopez-pouso-segura-bessel/SOURCES.md) and [the quadrature upper-bound disproof](../../results/lopez-pouso-segura-quadrature/SOURCES.md). Coordination: [issue 177](https://github.com/1337isnot1337/solved-conjectures/issues/177) and [issue 184](https://github.com/1337isnot1337/solved-conjectures/issues/184).

## Finding and scope

No earlier resolution of either target was found in this additional search. The closest archived manuscripts were read beyond their titles and concern different mathematical assertions. This is a bounded negative finding; it does not establish the absence of unindexed, inaccessible, or unpublished work.

The first target comprises the three complete sign, monotonicity, and limit assertions for the sequences formed from zeros of $J_0$ and the reciprocal squared derivative weights. These are Conjectures 2, 5, and 8 in the [published source](https://doi.org/10.1186/s13660-025-03283-w). The second target is the pair of strict uniform upper inequalities in Conjectures 3 and 7 of the same source. The two packages address different assertions. The Bessel target groups its three linked assertions together, and the quadrature target groups its two linked inequalities together.

The original paper, later numerical-analysis articles, and the independent mathematical reviews are documented in the linked source audits. This added pass concentrates on public solution archives, issue histories, and possible stronger prior statements.

## Direct archive inventories

The following resources were retrieved directly through the GitHub connector. No code-search endpoint was used in this pass.

| Archive | Material examined | Retrieved version and coverage |
|---|---|---|
| PrincipiaMathOrg/math-solutions | Complete `site-backup/MANIFEST.json`; the closest Bessel manuscripts below | Manifest blob `e258a2e1f173e03f393d701950a72327ef389f72`, 493 file records representing 247 projects |
| KnowledgeSense/math | `README.md`, `CONTENTS.md`, and the complete recursive `preprints` tree | Contents blob `f7263642a710dffbecf6f800f3c53f99e2b22aa5`; tree `673774407014e8648b9d7b65ca6e1c9e3eb0865d`, 5,367 entries, `truncated=false`, 56 top-level project directories |
| pudim-project/pudim-ai-demo-zetalaw | Complete `APPLICATIONS.md` catalogue, including every returned Bessel-related entry | Blob `4f5f4a47f4ad858198fc790f78bfebf073636e9e` |
| qqliu/CoPEER | `README.md`, `ARTIFACTS.md`, mathematical index, discovery index, and extension index | `ARTIFACTS.md` blob `e9375e6bd43483198bc034b62da99a32461888c1`; index blobs listed below |
| the-omega-institute/trureturing | Complete recursive `Problems` tree on `dev`; relevant problem dossiers and issues below | Tree `8b1276a2e967fdc41c6784a04ecb79e3890741a5`, 2,190 entries, `truncated=false` |

Names, titles, and available index contents were screened for Pouso, López/Lopez, Segura, the source identifier `2305.19128`, DOI suffix `03283-w`, Bessel, Legendre, quadrature, phase, and related zero/weight terminology. No exact target appeared. The KnowledgeSense top-level project titles and all matching paths were inspected; the matches involved unrelated quadrature estimates or unrelated uses of “phase.” The Pudim Bessel entries concern modified-Bessel ratios, Bernstein properties, order monotonicity, total positivity, or distributional questions, not these zero-weight sums or the node-ratio upper bounds.

CoPEER index blobs were `4b2e9db9d8c9c01d3dd8e50515fe49bbf5fe7043` (`mathematics/index.json`), `c9ce7fc914e7ae9d5b1a46ab68261fa8bf9e32e0` (`mathematics/discoveries/index.json`), and `5450da5e395440a5484ed59f6a2f56ded6977ec1` (`mathematics/extensions/index.json`). Its discovery index explicitly reports twelve exported deposits out of a 673-entry source database, with 661 earlier retrieval entries not exported. Those unavailable entries are not claimed to have been searched.

The initial contents-API listing of the TT Problems directory stopped at 1,000 entries. I replaced it with the full subtree retrieval above before drawing a filename-search conclusion. A complete tree is a complete filename inventory, not a full-text reading of every proof or every branch.

## Closest Principia manuscripts

Five complete ordinary mathematical manuscripts were read. Their theorem statements and proofs were compared with the actual López Pouso–Segura quantities, rather than assuming that a shared Bessel keyword implies an overlap.

| Manuscript | Actual result and why it does not settle these targets | Read blob |
|---|---|---|
| [MathDB 321003](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-321003/mathdb-321003-solution.tex) | Orders the minimum values of the normalized Turán expression $1-J_{\nu-1}J_{\nu+1}/J_\nu^2$ on consecutive zero gaps, for $\nu>0$. The proof uses a stationary-point scalar relation. It does not establish the reciprocal derivative-weight sums at zeros of $J_0$, their constants, or the Legendre counterexample. | `074317e9bb80c8e1d25e6f9725d12bcac083227f` |
| [MathDB 326635](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-326635/mathdb-326635-solution.tex) | Proves decreasing ratios of consecutive gaps between squared zeros of $J_1$, including an adjoined zero at the origin. Its affine Sturm comparison contains no derivative-weight sum and gives no inverse squared-phase third-derivative result for $J_0$. Its later LGL-grid question is explicitly a proposed follow-up. | `5311300e8849aeac83744f67d3ebed9e7fcdaeec` |
| [MathDB 339406](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-339406/mathdb-339406-solution.tex) | Proves Gaunt's modified-$K$ integral lower bound by convexity in squared order. The varying variable is the order of $K_\nu$, not the inverse phase or the zeros of $J_0$. | `cb2ced52aad7b0f292ebb3f8bbccc4d1d9a26fa1` |
| [MathDB 365454](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-365454/mathdb-365454-solution.tex) | Refutes Acosta Babb's truncated kernel positivity via a two-term weighted sum of $j_m^\alpha J_0(j_mx)$. These weights are powers of the zeros with Cesàro factors, not reciprocal squared derivative weights; the asserted signs and limits are different. | `2ed36bca69ec52322ac3b7143a0306f120024251` |
| [MathDB 365832](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-365832/mathdb-365832-solution.tex) | Establishes a growing-order modified-$I$ integral asymptotic associated with the Euclidean ball. It does not concern quadrature weights or the fixed-order $J_0$ sums. | `f29cdba3770df76bb22ba830cca8cb78a372ee96` |

The sixth Bessel-labelled manifest entry, [MathDB 355408](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/mathdb-355408/mathdb-355408-solution.tex), was checked through its definitions and main theorem: it is Maier's generalized Eulerian identity involving combinatorial Bessel numbers, not Bessel functions. The read blob was `361741d56e4eea101b2627bae0fc742940df8e6c`.

These are scope exclusions. I do not claim that every unrelated archived proof has been independently validated.

## TT issues and ordinary proof statements

The following issues and dossiers were inspected for their ordinary mathematical statements. Their Lean status is irrelevant to whether they contain prior mathematics, and no Lean work was performed.

- [Issue 22175](https://github.com/the-omega-institute/trureturing/issues/22175) contains an ordinary analytic refutation of Acosta Babb's weighted Bessel-kernel assertion, including its two-mode mechanism. Its exact kernel is the same distinct kind just described for Principia 365454. It contains no López Pouso–Segura zero-weight sum or Gauss–Legendre node-ratio claim.
- [Issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199) addresses Karp–Vishnyakova–Zhang's real-order modified-Bessel ratio unimodality. Its source is `2408.01755`, and its Wronskian concerns $I_{\nu_1}(a_1x)/I_{\nu_2}(a_2x)$. Segura appears in its surrounding literature discussion, not as a López Pouso–Segura resolution.
- [Issue 23075](https://github.com/the-omega-institute/trureturing/issues/23075) refutes Karp's fractional-degree Legendre Turán conjecture from 2011 slides. Its functions are Ferrers functions at a fixed argument and varying noninteger degree; it does not concern Gaussian nodes or weights.
- The [Baricz–Ponnusamy dossier](https://github.com/the-omega-institute/trureturing/blob/dev/Problems/baricz-ponnusamy-2013-bessel-product-order-log-convexity.md), blob `9f5c8cee40fca148355aa18edd6646a21db262a9`, refutes order log-convexity of $I_\nu(u)K_\nu(u)$ with a half-integer triple. The [Baricz–Mehrez dossier](https://github.com/the-omega-institute/trureturing/blob/dev/Problems/baricz-mehrez-2018-bessel-redheffer-lower-bound.md), blob `d33b0b9213558b5e86afd2f6b1b13750c6a1e4df`, concerns a normalized adjacent-order Bessel ratio below the first zero. Both scope statements and their indicated mechanisms were read; neither gives either present target.

## Additional global issue queries

The following eight queries were run without a repository selector or a state restriction, with a limit of 100 returned issues each. The counts are the returned counts, not a claim about every possible unindexed occurrence. Titles and relevant body excerpts were inspected; exact or plausible mathematical leads were opened as described above.

| Query | Returned issues | Relevant finding |
|---|---:|---|
| `"Bessel" "zeros" "conjecture" "weight"` | 39 | Closest relevant result was the different modified-Bessel ratio issue 25199 |
| `"Gauss-Legendre" "monotonicity"` | 44 | Our issue 177; other matches were unrelated mathematical or software discussions |
| `"J_1" "conjecture" "Bessel"` | 4 | Acosta Babb issue 22175, opened and excluded by exact kernel |
| `"Legendre" "uniform relations"` | 5 | Our issues 177 and 184; no earlier exact result identified |
| `"Bessel" "trapezoidal"` | 22 | Our issue 177; other matches concern integration implementations or other problems |
| `"Bessel" "inverse phase"` | 19 | Our issue 177; a reverse-Bessel-polynomial Padé issue has a different object and target |
| `"Legendre" "secondary nodes"` | 0 | No returned issue |
| `"pi^2/12" "Bessel"` | 25 | Our issue 184; remaining matches did not identify the target |

Additional strong-engine public-web searches for the source identifier and authors restricted to GitHub, and for Bessel-weight conjectures in Principia/MathDB, did not produce an earlier matching resolution. Those web results were sparse and sometimes irrelevant, so they are weaker evidence than the directly retrieved records above.

The current repository `HISTORY.md`, blob `c661fcc181cef827a85d337d2af3bf4461f511cf`, was also checked. Its matching entry is this campaign's Bessel-weight publication. No earlier removed result resolving these targets was identified. Unrelated prior-resolution corrections in that history were retained as exclusions, not counted again.

## Remaining limits

The shared GitHub code-search endpoint was rate-limited or malfunctioning during the parent review. It was deliberately not retried here, and no failed code query is represented as a negative result. The inventories above cover the stated snapshots and index files, not arbitrary content in every branch, deleted commit, or external repository.

The later *On Morel's Fokker–Planck Angular Differencing Scheme*, DOI [10.1080/23324309.2025.2492685](https://doi.org/10.1080/23324309.2025.2492685), remains an explicit full-text access gap from the existing audits. Its abstract does not suffice to exclude an unadvertised result in its body. This additional corpus pass does not remove that limitation.

Known Bessel identities and high-order Legendre asymptotic formulas remain prior ingredients. In particular, the quadrature manuscript must continue to credit the existing node/weight expansions; this search finds no earlier stated refutation, not a newly discovered asymptotic machinery. Both packages remain unrefereed externally, with priority claimed only to the extent supported by the recorded searches.
