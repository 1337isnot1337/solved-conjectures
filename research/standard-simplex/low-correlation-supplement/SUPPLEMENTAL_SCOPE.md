# Standard Simplex: supplemental archive comparison

Status: AIM and OpenAI supplemental scans and scope comparisons complete, 21 November 2026. No earlier instance of the precise all-cell low-positive-correlation theorem was found in the inspected matched bodies. The limitations below remain part of that conclusion.

This is a bounded prior-work audit for the proposed statement that, for every fixed number of cells $`q\geq3`$, there is $`\rho_q>0`$ such that the regular simplex partition uniquely maximizes Gaussian noise stability among balanced $`q`$-partitions for $`0<\rho\leq\rho_q`$, uniformly over ambient dimensions $`d\geq q-1`$. It does not establish priority against all public or unpublished work. It does not treat the full Standard Simplex Conjecture as resolved.

## Acquisition and scope

The audit uses the previously downloaded complete public archives at these commits:

| Repository | Commit | Archive SHA-256 |
| --- | --- | --- |
| MColbrook/AIM | `b2ec0fac559f532fc0ed04fce81deea0ce07c68b` | `ce1e24640f6996977e868b03c865c565a077d919406a2b5561d2f3febb643f4d` |
| openai/math | `4eaee87548250b2682affda7d05d947c05554bae` | `4fee0780fe7cfa1bf7bdd9043e947b70e91ed9727bbecf08adc664d868d22f55` |

The scanner is a task-specific copy of the earlier campaign's `scan_supplement.py`. Its source tars and original native-text skip manifests remain in `root-additional-priority/`; its outputs are separate, under `agent-combinatorics/ssc-supplement-priority/`. No previous audit output was overwritten. The scan visits non-UTF-8 entries from the original native manifests, converts PDF text with `pdftotext -layout`, and recursively decodes ZIP, gzip and tar bodies. A separate pass checks supported split-archive naming patterns.

The bounds are 256 MiB per entry or gzip expansion and recursion depth eight. The scanner never runs archived programs. It uses Unicode NFKC, case folding, and collapsed whitespace. Search groups include standard/Gaussian simplex, plurality, noise stability, balanced/ Gaussian first moment and first-moment stability, Heilman, Isaksson, small/low positive correlation, and the exact source identifiers `0903.3362`, `1211.7138`, `1901.03934`, `2608.00333`, and `1805.10961`. `targets.json` records the literal list.

The independent analysis lane separately scans six archives' native and embedded bodies and handles web/primary-literature comparisons. The present report does not relabel that work as its own. Its larger gzip cap also completes one AIM Freudenthal-certificate JSON expansion omitted by that lane's 16 MiB cap; the additional body has no relevant match.

## AIM result

The supplemental scan has 2,173 text records: 144 converted PDFs and 2,029 embedded UTF-8 bodies, including five empty embedded files. There are 36 matched records. All 36 have a comparison and explicit reading scope in `AIM_CLASSIFICATION.json`.

There are 124 unconverted binary records: 122 NumPy `.npy` arrays and two `.png` figures. There were no PDF conversion failures, empty PDF texts, size/depth failures, or archive-decompression failures. The separate supported split-file pass found zero groups. The residual binary files are a limit, not bodies that were semantically searched.

The relevant nearby claims are:

* Archived AIM294 records state the balanced positive-correlation problem for at least four cells and retain an open status. These are problem/status records, not evidence proving that no later result exists.
* The complete archived AIM637 statement concerns negative correlations and permits unrestricted competitor cell masses. Its source discussion credits the three-cell result and distinguishes conditional hyperstability. It does not give the positive balanced theorem under review.
* The archived literature-search records point to Heilman's three-cell interval results and hyperstability papers. Those are leads for the separate primary-source audit; this report does not adopt search snippets as theorem evidence.
* A symmetric Gaussian perimeter statement concerns cylinders and complements of cylinders. It does not optimize a balanced multi-cell finite-noise objective.
* The other mathematical matches concern propagation of chaos, a scalar Gaussian variance mixture used in a quantum-graph problem, and singular values of random tensor matrices. Their actual mathematical statements were inspected at the scopes recorded in the classification file. In particular, the variance-mixture calculation concerns the scalar mean and fourth moment, not a partition's first-moment functional.
* Several matches are literal substring false positives: `near independence` occurs inside `linear independence`. They concern prime square roots, hyperbolic volumes, or linear algebra. No formalization was run or verified.

No earlier all-cell low-positive-correlation theorem was found in the inspected AIM matched bodies.

## OpenAI result

The supplemental scan converted all 789 PDFs to nonempty text and has 55 matched PDF records. There were no additional embedded UTF-8 bodies in this archive's non-UTF-8 pass. Every matched record has an explicit comparison and reading scope in `OPENAI_CLASSIFICATION.json`.

There are 113 unconverted binary records: 110 `.bin` files, all in the dimension-six mutually-unbiased-bases verification package, and three `.png` figures in the Lieb–Thirring and randomized k-server packages. These path descriptions do not constitute semantic inspection of the binary contents. There were no empty PDF texts, conversion errors, archive failures, or size/depth failures. The separate supported split-file pass found zero groups.

The 55 records include 32 literal `near independence`/`linear independence` substring matches. Other unrelated matches use an ordinary convex or simplicial simplex, plurality as a finite-fiber decoding rule, or correlation decay for hard-sphere dynamics and Ising models. Their actual matched passages were inspected. Three summary PDFs refer to noise-stability tools in discussions of Max-CSP, arithmetic progressions or the Mahler problem; the stated objectives and matched discussions do not assert the theorem under review.

### The unrestricted propeller bound

The PDF [The Gaussian propeller bound in every dimension](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Gaussian-Propeller-Bound-in-Every-Dimension-September-24-2026/main.pdf) was read at its introduction, Theorem 1.1, Section 1.2, the stated application, and the remaining matched occurrences.

Theorem 1.1 states the unrestricted Gaussian first-moment bound $`\sum_i\|\int_{A_i}x\,d\gamma\|^2\leq9/(8\pi)`$. It explicitly allows empty cells and imposes no cell-mass constraint. Its attaining partition has three nonempty $`120^\circ`$ sectors, with any additional cells empty. Section 1.2 explicitly distinguishes equal-mass noise stability from this unrestricted first-moment objective. Section 6.2 invokes the Khot–Naor low-influence first-degree bound for a clustering application. These are different statements from exact balanced $`q`$-cell finite-noise optimality on a positive interval.

This scope comparison does not independently verify the propeller manuscript's proof and does not imply that the manuscript has settled any problem solely because it claims a theorem.

### Cut-hardness and Boolean-information manuscripts

The main statements and relevant Gaussian passages in *A Direct Proof of Optimal Max-Cut Hardness* and *Constant-factor hardness of Min-UnCut* concern binary graph cuts. Their noise-analysis inputs concern Boolean functions, Gaussian signs, and the halfspace/Majority Is Stablest comparison. They do not state an all-cell simplex optimizer theorem.

The matched *The Unique Games Theorem* manuscript cites Isaksson–Mossel's vector-valued invariance theorem in its Appendix A. The cited use was read: it controls influence and Fourier tails for a transfer between discrete and Gaussian ensembles. It does not identify a balanced Gaussian partition maximizing finite-noise stability.

The matched *Hellinger contraction with arbitrary Boolean output bias* and *Sharp binary-information contraction on the discrete cube* have binary outputs and discrete-cube information objectives. Their main statements were read; the phrase small positive correlation there is not the Gaussian multi-cell assertion under review.

No earlier all-cell low-positive-correlation theorem was found in the inspected OpenAI matched bodies.

## Reproducibility records

The published files are `scan_supplement.py`, `targets.json`, the four normal/split manifests, and `AIM_CLASSIFICATION.json` / `OPENAI_CLASSIFICATION.json`. The manifests identify every processed body by path, kind and content hash, and list all decoding limits. The classifications identify each matched body by path and text hash and state exactly which parts were read. The original match logs and full extracted matched text remain local for review; the published metadata does not redistribute the full manuscripts. The relocated script accepts `--source-root PATH` for the directory containing the pinned archive tars and original native-text manifests; its mathematical search terms and conversion bounds are unchanged.

## Limits of the conclusion

This is a search of the pinned archive contents, using explicit textual terms and finite decoding bounds. It does not include unlinked external attachments, later commits, unconverted binary data, or OCR of figures. Converted PDF text can lose mathematical layout. Metadata matches were checked as entries and surrounding passages, not by reading every unrelated record in a catalogue. Unrelated manuscripts were read to determine the scope of their stated result; their full proofs were not reverified.

This report is combined with the separate [primary-source and native-text audit](../LOW_CORRELATION_PRIOR_AUDIT.md). No global priority assertion follows from the absence of a matching theorem in these supplemental bodies.
