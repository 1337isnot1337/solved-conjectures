# Quantitative first-moment stability: bounded prior comparison

Checked 21 November 2026. The estimate in [FIRST_MOMENT_STABILITY.md](FIRST_MOMENT_STABILITY.md) is a proposed quantitative deduction from an explicitly credited existing extremum. The mathematical reviews found no gap in the deduction. This note does not certify first discovery, and the Standard Simplex conjecture remains unresolved here.

Subsequent checkpoint: the separate [low-correlation proof](SMALL_CORRELATION.md) closes the additional comparison estimates described below on a positive interval depending only on the cell count. Its [completed source audit](LOW_CORRELATION_PRIOR_AUDIT.md) also supplies the later six-archive PDF/compressed and broader native-text coverage. The present note preserves the earlier exact first-moment comparisons; neither checkpoint claims worldwide priority.

## Exact quantitative claim being screened

For every fixed cell count $`q\ge3`$, a constant depending only on $`q`$ bounds the Gaussian symmetric-difference distance of an arbitrary balanced partition from some regular-simplex partition by the square root of its first-moment energy deficit. The bound is uniform in ambient dimension $`d\ge q-1`$. The exponent is sharp. The corresponding product $`L^2`$ exponent is one quarter.

The exact first-moment maximum, its regular-simplex equality case, and the covariance-deficit integral are **prior work**, not claims of this checkpoint. The new calculation under consideration is the uniform quadratic covariance gap followed by an assignment-margin estimate. A small-positive-correlation localization estimate follows, but exact noise optimality does not.

## Closest sources read

### The public all-cell first-moment proof

The entire [mxym/math manuscript](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md) was read, including its smooth balancing-price lemma, covariance derivative, perimeter comparison, radial ODE and return to measurable partitions. Equations (13)–(14) already give the exact nonnegative path-deficit formula. The source expressly does not claim an explicit metric stability constant or full covariance concavity. Its proof is the starting point for the present deduction.

The same pinned archive's neighbouring manuscripts were checked for potentially overlapping statements:

- `research/gaussian-balanced-four-rigidity/paper.md` gives four-cell rank rigidity, central classification and local stationary uniqueness. Its local uniqueness discussion does not claim a quantitative partition stability estimate.
- `research/gaussian-balanced-four-global/paper.md` proves the four-cell extremum using its earlier covariance argument. Its local Hessian and strict maximum are inputs to that proof; it does not state the all-cell partition estimate above.
- `research/gaussian-centroid-symmetry-rigidity/paper.md` gives asymptotic dimension, centroid-variance and symmetry-breaking restrictions as the number of cells grows. Those quantities and quantifiers differ from fixed-cell deficit control of the partition's symmetric difference.
- The mass-envelope, dimension-rate and planar-fan papers compared in [PRIOR_AUDIT.md](PRIOR_AUDIT.md) concern other first-moment restrictions or approximation objectives.

These comparisons are of the actual mathematical statements and relevant argument sections, not merely catalogue labels.

### Heilman's earlier stability estimate

[Euclidean Partitions Optimizing Noise Stability](https://arxiv.org/pdf/1211.7138v2), Definition 2.3, Lemma 2.8 and Section 8, were read in the primary PDF. Lemma 2.8 is an unrestricted three-cell estimate with product $`L^2`$ exponent one eighth. Section 8 identifies a balanced higher-cell stability estimate as a missing ingredient. The present deduction is not a relabelling of that three-cell theorem.

The extension to finite positive correlation cannot be read off from this comparison alone. The old proof maximizes a correlation derivative over unrestricted three-cell partitions. The all-cell balanced problem has volume multipliers, and the higher-Hermite remainder and linear noise-potential difference need separate control. Those additional estimates are now given in the later [small-correlation assembly](SMALL_CORRELATION.md), not inferred from the first-moment stability lemma by itself.

The PDF used has 540,040 bytes and SHA-256 `5e5fe4c3cca5db6c46293bebf70e27e4958cff853ff6c4390e7892848424fcf3`.

### Differently formulated Gaussian simplex comparisons

Two recent primary sources surfaced in the quantitative search and were retrieved as full PDFs:

1. Abhijeet Mulgund, [Stochastic Domination of Gaussian Maxima by the Regular Simplex](https://arxiv.org/pdf/2609.28452v2). Theorem 1.1 compares the distribution of the maximum over unit-variance Gaussian vectors, and characterizes equality. Its applications and open-problem section concern Gaussian maxima, signal configurations and unions of spherical caps. It does not state a balanced assignment-value deficit for arbitrary trace-one covariance or a symmetric-difference estimate for arbitrary balanced measurable partitions. The retrieved PDF has 626,300 bytes and SHA-256 `11d8cceb8cb56084149a0f0145877dad74d2531e88dbab54719755da92122640`.
2. O. Friedland, O. Guédon and F. Souli, [On partition functions of Gaussian random variables](https://arxiv.org/pdf/2609.38904v1), Theorems 1.1–1.4. Its quantitative Theorem 1.3 controls covariance distance by the excess of a positive power greater than one of a Gaussian exponential sum. Every score has variance one. This is a different objective and covariance domain from the balanced maximum in the current proof; no conversion to the current partition-distance theorem was stated in the relevant source passages. The retrieved PDF has 334,402 bytes and SHA-256 `2440ee8de2e12db45b49d2a56d204efe539f9c90e419b25b401b999e3800ebc5`.

Direct arXiv abstract-page requests for these identifiers failed through the web reader. Retrieval and text extraction of the versioned PDFs succeeded locally, so the mathematical comparison uses their actual contents rather than secondary summaries. Neither source is being audited here for correctness of all its claims.

The imported geometric theorem is the published [Milman–Neeman Gaussian multi-bubble theorem](https://annals.math.princeton.edu/2022/195-1/p02). Its allowed range and normalization match the auxiliary $`q`$-cell cluster in $`q-1`$ dimensions. Its uniqueness and perimeter conclusion do not themselves state the current first-moment stability bound.

## Searches and limits

Both web engines were queried using Gaussian first-moment stability, balanced Gaussian simplex, quantitative stability, covariance deficit and related combinations. The closest returned primary statements are compared above. The six pinned native archives and their exact initial Standard Simplex search coverage are recorded separately in [PRIOR_SCAN.json](PRIOR_SCAN.json). A subsequent `mxym/math` path inventory was used to locate the neighbouring covariance and rigidity manuscripts even when the initial Standard Simplex terms were absent.

An exact global GitHub issue query for `gaussian-balanced-simplex-all-k` returned zero matches. A repository-restricted Trure query returned twelve unrelated or only broadly Gaussian topics, not an exact stability claim. A broader `first-moment`/`balanced` query returned hundreds of mostly irrelevant matches; only its first page was inspected, so it supplies no absence evidence. Several global Gaussian/simplex/stability issue queries failed with `Transport closed`. Those failures are not negative search results.

The later [expanded audit](LOW_CORRELATION_PRIOR_AUDIT.md) rescans the pinned archives' native, PDF, and bounded compressed text with first-moment stability among its explicit terms and reads the relevant neighbouring statements. Its remaining binary, size, naming, and indexing limits are recorded there. Differently named or unindexed equivalent results may remain. Accordingly this checkpoint uses the wording **proposed quantitative deduction**, credits the existing exact extremum and deficit identity, and makes no worldwide-priority claim.
