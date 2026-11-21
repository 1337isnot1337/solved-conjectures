# Algebra scope review of the additional archives

Reviewer: algebra lane. Date: 21 November 2026 UTC.

**Status:** native-source and PDF semantic review complete for the three targets assigned to this lane. No matching prior theorem was found in the inspected material. The explicit binary limitations below remain; no blanket binary-archive clearance or exhaustive global priority guarantee is claimed.

## Archive and method

The OpenAI snapshot is [`openai/math` at `4eaee87548250b2682affda7d05d947c05554bae`](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae). The downloaded archive is 896,084,751 bytes, SHA256 `4fee0780fe7cfa1bf7bdd9043e947b70e91ed9727bbecf08adc664d868d22f55`.

The root lane's complete native scan decoded 173,622 UTF-8 files and retained 1,349 matching files. This review covers the Chen–Khare–Sahi, Vishnyakova, and withdrawn Fang–Zhang–Zhao targets. I inspected the matching contexts, read the plausible neighboring symmetric-function theorem statements, and rescanned every retained file body for these three targets after Unicode NFKC normalization and case folding. The rescan used complete bodies, not the shortened line excerpts in the initial match report. Its machine-readable classification is `algebra-native-classification.json`.

The numeric MathDB identifiers were also checked with non-digit boundaries. This removes occurrences inside unrelated large integer certificates without treating any actual standalone identifier as a negative result. No code from the source archives was executed or verified as part of this literature check.

## Native-source findings

| Target | Matched native files | Full-body findings | Scope disposition |
|---|---:|---|---|
| Chen–Khare–Sahi, Conjecture 5's normalized Macdonald Muirhead-semiring assertion | 103 | 66 files contain `370539` only within longer numeric data; no standalone identifier. The remaining matches comprise 16 Macdonald references or homonyms, 10 Khare references, and 11 `sahi` substrings. No source ID, full author combination, or Muirhead-semiring phrase occurs. | No matching semiring theorem or refutation was found. The plausible symmetric-function sources are compared below. |
| Vishnyakova, outer root-radius assertions for Pochhammer transforms | 63 | 58 files use ordinary ascending or descending Pochhammer polynomials; five use the phrase root radius in unrelated geometric estimates. Neither primary source ID nor the author's name occurs. | The matching formulas concern finite-difference bases, ordinary Pochhammer factors, derivative estimates, interpolation, or geometric localization. No theorem about the conjectured transformed-polynomial class or its outer disk was found. |
| Fang–Zhang–Zhao, the withdrawn infinite-log-convexity assertion | 81 | All matches are the digit string `368345` inside longer integer data. No standalone identifier, primary source ID, Hoggatt terminology, or full author name occurs. | No additional source for the target was found here. The already established prior resolution and withdrawal remain unchanged. |

### Closest symmetric-function statements

The relevant native files were read as mathematical source statements, not inferred from their filenames alone:

- `preprints/Elementary-Positivity-of-Chromatic-Quasisymmetric-Functions-September-24-2026/build/sections/01-introduction.tex` defines the graph coloring symmetric function and states a nonnegative elementary expansion for natural unit interval graphs. Its Macdonald mention credits an earlier route to chromatic symmetric-function positivity. It contains no inequality between normalized Macdonald polynomials indexed by majorization and no Muirhead-semiring assertion.
- `preprints/Foulkes-Conjecture-for-the-Sixth-Symmetric-Power-September-25-2026/build/sections/introduction.tex` states the representation inclusion for the sixth symmetric power, equivalently Schur positivity of a plethysm difference. Its Macdonald citations supply standard symmetric-function identities. This is a different polynomial family and positivity cone.
- `preprints/Quadratic-Stabilization-of-the-Canonical-Foulkes-Howe-Map-September-25-2026/build/paper.tex` states surjectivity of the canonical map when the second parameter is at least the first parameter times one less than itself. Its symmetric-function background does not address the Macdonald majorization difference or the semiring generators.
- `preprints/Universal-Tensor-Squares-for-Symmetric-Groups-September-24-2026/build/sections/preliminaries.tex` and its other matched sections use Specht modules, Littlewood–Richardson support, and the standard Macdonald reference. The matched dominance comparisons concern representation support, not semiring membership of normalized Macdonald polynomial differences.

The remaining `MacDonald` occurrences concern quantum many-body references. The Khare references are to Chandrashekhar Khare's modularity results, rather than Apoorva Khare's symmetric-polynomial work. The `sahi` substrings occur in names such as Sahil, Sahinalp, and Masahiro, and in a vendor glyph name. Their full contexts were distinguished from Siddhartha Sahi's work.

The Vishnyakova matches include ordinary Pochhammer nonvanishing for a nonreal argument or for a positive real part. These elementary factor-product facts are not the claimed root localization for a linear transformation of a polynomial with an arbitrary admissible coefficient vector. The five geometric root-radius occurrences concern coordinate balls and uniform estimates, not zeros of polynomials.

## Fresh Sra comparison from the AIM lead

The AIM status record points to Sra's *On majorization inequalities for normalized Jack and Macdonald polynomials*, [Hexagon 2610.00725v1](https://hexagonmath.org/pdf/2610.00725v1). This is the October 2026 manuscript, not the older 2016 Schur note. It was already included in the campaign's original Chen–Khare–Sahi `SOURCE_AUDIT.md`.

I retrieved the [current author PDF](https://suvrit.github.io/papers/jackratio/jackratio-v1.pdf), 607,845 bytes, SHA256 `1c1c128f84ce4c0f7f769988c74f25d8da87d486601aef7c66bec9043c4f92c6`, and compared its actual statements with the Hexagon extraction. Printed page 2 explicitly distinguishes ordinary evaluation positivity from the stronger positivity assertions in Chen–Khare–Sahi Conjecture 5.

Exact Certificate 4.1 on printed page 8 proves ordinary evaluation positivity for the **same partitions `(4,2,0)` and `(4,1,1)`**, for all parameter pairs in the open unit square. It substitutes `x=((1+u)(1+v),1+v,1)` and proves nonnegative coefficients in these chamber coordinates, using exact tensor-Bernstein certificates in the parameters. Such an expansion after a nonsymmetric substitution does not provide a sum of products of the normalized symmetric monomial polynomials and their majorization differences that generate the Muirhead semiring. It is compatible with the campaign's exact semiring separator.

The fresh page-level comparison, retrieval limits, and source hash are committed at [research/2026-11-21-cks-priority-refresh/AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/3ed6184e895b46943abe880f70705bc849698e5e/research/2026-11-21-cks-priority-refresh/AUDIT.md). No semiring priority exclusion follows from this source. The campaign must continue to distinguish its disproof of the semiring equivalence from Sra's already established evaluation theorem for this pair.

## Existing Fang–Zhang–Zhao withdrawal

The absence of a new OpenAI native-source match has no effect on the confirmed earlier disproof. The binding prior remains [PrincipiaMathOrg/math-solutions commit `c18609e47b635722206b9a2e9dcd402d0edcfb0a`](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex), dated 26 October 2026 at 14:00:38 UTC. That proof covers the same full parameter family and small exceptional parameter values. The campaign package remains withdrawn and excluded from the tally.

## Completed PDF supplement and binary limits

The root lane's `openai-supplement-manifest.json` records successful text conversion of all **789 PDFs** in the snapshot. Its match report has 120 records across all campaign targets. Of those, **15** carry the Chen–Khare–Sahi tag; **zero** carry the Vishnyakova tag and **zero** carry the Fang–Zhang–Zhao tag.

I inspected all 15 Chen–Khare–Sahi match records and searched their complete saved PDF text after NFKC normalization and case folding. None contains the primary source ID, a Muirhead assertion, the full author combination, or a normalized Macdonald majorization theorem. The matches repeat the bibliography references and homonyms identified in the native source pass. In addition, I read the actual PDF main statements for the four nearest symmetric-function papers: chromatic elementary positivity, sixth-power Foulkes comparison, quadratic Foulkes–Howe stabilization, and universal tensor squares. Their PDF statements agree with the distinct scopes described above. In particular, the universal-tensor-square theorem concerns an irreducible symmetric-group representation whose tensor square contains every irreducible; it is not a polynomial majorization or semiring theorem.

The manifest retains **113 explicit unconverted binary entries**: 110 `.bin` numerical data files in the dimension-six mutually-unbiased-bases package and three PNG figures. Their associated source material and paths identify unrelated topics; this review does not claim to have interpreted their binary payloads or visually inspected the figures. The supplement's entry-size cap is 268,435,456 bytes and its archive nesting cap is eight; no stronger binary coverage claim is made here.

The root lane completed the separate all-target Unicode NFKC residual check over all 4,624 AIM and 173,622 OpenAI native text files: it found zero additional target/file matches. The root lane also read the three short nonfigure PDF withdrawal notices, which concern Kuga–Satake, Weil eightfolds, and K3 Hodge theory, respectively; the remaining 27 short PDFs are figures. This scoped semantic report uses the complete native and PDF match records available at completion. No new exclusion follows for Chen–Khare–Sahi or Vishnyakova, and the independently confirmed Fang–Zhang–Zhao withdrawal remains in force.
