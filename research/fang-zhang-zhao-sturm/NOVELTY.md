# Fang–Zhang–Zhao's Sturm conjecture: source and priority audit

> Priority correction, 21 November 2026: this target was already proved in [TT issue 18758](https://github.com/the-omega-institute/trureturing/issues/18758). The following independent argument or earlier search record is retained for provenance, not counted as a new resolution. See [the scope audit](../2026-11-21-special-functions-fzz-priority/AUDIT.md).

Audit date: 21 November 2026. Repository discussion: [issue 162](https://github.com/1337isnot1337/solved-conjectures/issues/162).

## Exact target and result scope

The target is Conjecture 4.1 in Hanqian Fang, Candice X. T. Zhang and James J. Y. Zhao, *Analytic properties arising from the Baxter numbers*, [arXiv:2505.05873v1](https://arxiv.org/html/2505.05873v1), Section 4. It asserts that the whole sequence of `(q,t)`-Hoggatt sums is a Sturm sequence for every positive integer `q` and `m=2,3`.

The source's Theorem 1.2 already proves the `q=1` statement for every integer `m>=2`. Its discussion before Conjecture 4.1 records finite checks for `1<=q<=10` and `1<=n<=15`; those checks are not its theorem. The published version is [J. Math. Anal. Appl. 561 (2026), 130615](https://www.sciencedirect.com/science/article/pii/S0022247X26002271), DOI [10.1016/j.jmaa.2026.130615](https://doi.org/10.1016/j.jmaa.2026.130615).

The present candidate proves the full remaining parameter range, and more: every real `q>1` and every integer `m>=2`, at every row index. The proof uses strict geometric root separation and a Jackson derivative interlacing argument. It does not treat a finite set of indices or a higher numerical case as a resolution.

## Closest prior work checked

1. **Fang–Zhang–Zhao (2025/2026), full original HTML inspected.** Section 2 supplies the classical `q=1` Hadamard/derivative induction. Section 4 leaves the positive integral `q` statement as Conjecture 4.1. The new part is the geometric separation and Jackson derivative argument required to replace the ordinary derivative.

2. **Garloff–Wagner (1996), full original PDF inspected.** *Hadamard Products of Stable Polynomials Are Stable*, J. Math. Anal. Appl. 202, 797–809; [author-hosted PDF](https://www-home.htwg-konstanz.de/~garloff/Garloff_Wagner_Hadamard_Products.pdf). Theorem 4, printed page 800, gives the real-rootedness and interlacing facts used by the proof. Its part (c) excludes two *simultaneous* proportionality conditions. Thus one input pair may be identical if the other is not proportional. All constants in the application are positive, excluding common roots at zero and the exceptional multiplication-by-`t` case. This theorem is explicitly credited as prior mathematics.

3. **Jiang Zeng (13 November 2026 revision), full version 2 inspected.** *Two q-Deformations of Narayana Polynomials: Rogers Moments, Hankel Positivity, and q-Narayana Kernels*, [arXiv:2610.28691v2](https://arxiv.org/abs/2610.28691v2); accessible [full PDF mirror](https://arxiv.cnoctave.top/pdf/2610.28691). Theorem 9.3 gives strict interlacing after row-dependent palindromic normalization. Section 8, printed page 15, expressly separates the original unscaled adjacent-row question. Section 13, Question 1, printed page 37, again asks whether the original consecutive rows interlace without variable rescaling. Its `theta=1` endpoint is the two-factor Hoggatt case. The result therefore does not resolve the current conjecture. Our final change of variable is independent of the row index, which is the relevant distinction.

4. **Shane Chern and Wenle Shi, September 2026.** *Strong q-log-convexity of the d-Hoggatt polynomials*, [arXiv:2609.33732](https://arxiv.org/abs/2609.33732). The indexed arXiv abstract describes preservation of sequence log-convexity, strong q-log-concavity, and strong q-log-convexity of the Hoggatt polynomial sequence. Zeng's November full text, Section 8 and references [5], describes its results as coefficientwise row and column inequalities, while still retaining unscaled interlacing as open. **Full-text access limitation:** direct arXiv abstract/HTML/PDF requests and the cnoctave mirror were unavailable in this session; the entire Chern–Shi manuscript was not inspected. No claim of having read it in full is made.

5. **Shane Chern and Wenle Shi, June 2026.** *Proof of Cigler's conjecture on q-Hoggatt numbers*, [arXiv:2606.26950](https://arxiv.org/abs/2606.26950). Its abstract concerns nonnegativity and palindromicity of polynomials. Zeng's Section 8 explicitly distinguishes those claims from its root questions. The same full-text access limitation applies. A title containing "Proof" is not evidence of a resolution of the different Fang–Zhang–Zhao assertion.

6. **Dilks's earlier work and subsequent ordinary Hoggatt literature.** Fang–Zhang–Zhao attributes the real-rootedness at `q=1` to Kevin Dilks, *Involutions on Baxter Objects, and q-Gamma Nonnegativity*, University of Minnesota Ph.D. thesis (2015), Theorem 3.8. Zeng also distinguishes classical Hoggatt results of Mao–Shi from its fixed-`q` deformation. No prior interlacing theorem for the entire unscaled q-Hoggatt sequence was located in the searches below.

MathDB and SymCat were used only as discovery aids. MathDB's current entry still lists this Sturm claim as open, and SymCat's Hoggatt example records the established `q=1` theorem. These are not used as substitutes for the primary statements above.

## Search log

Both available search engines were used. Queries included the following, with recent-date filters added to final status searches where appropriate:

- `"Fang" "Zhang" "Zhao" "2505.05873" conjecture`
- `"Fang" "Zhang" "Zhao" "Conjecture 4.1" Hoggatt`
- `"Hoggatt" "Sturm" conjecture proof`
- `"q-Hoggatt" "Sturm"`
- `"q-Hoggatt" "interlacing" proof`
- `"q-Narayana" "interlacing"`
- `"Hoggatt" "q" "Sturm" proof 2026`
- `"Hoggatt" "Jackson" derivative interlacing`
- `"Fang" "Zhang" "Zhao" "Jackson" Hoggatt`
- `"Hoggatt" "interlacing" "2026" proof`
- `"Strong q-log-convexity" "Hoggatt"`
- `"Proof of Cigler's conjecture" "q-Hoggatt"`
- `"Shane Chern" "Hoggatt" interlacing`
- `"Wenle Shi" "Hoggatt" "Sturm"`
- `"2609.33732" pdf`
- `"2606.26950" pdf`
- `"2610.28691" interlacing proof conjecture`
- `"q-Hoggatt" "real" "2026" "zeros"`

The search did not locate a prior resolution. The November 13 primary paper's explicit remaining question is positive evidence that the close current literature still treats the relevant unscaled property as unresolved. The inaccessible full texts are recorded above; a negative search is not a proof of universal bibliographic absence.

## Mathematical review and exact checks

The parent reviewer and an independent analysis reviewer both checked the original Garloff–Wagner clauses, the separation orientation, the partial-fraction residues and endpoint signs, the induction's degrees, and the index-independent MacMahon scaling. Both reported no substantive gap. Their two wording corrections (endpoint signs and the Garloff–Wagner page range) have been applied.

`verify.py` uses rational arithmetic throughout. It separately computes Gaussian binomials recursively, expands the geometric product, and evaluates the original three-dimensional MacMahon product. The run passed 120 exact Jackson identities and Hoggatt transfers across five rational bases and four values of `m`. It also passed exact rational root isolation and strict adjacent interlacing checks for 54 small adjacent pairs. These are consistency checks on the written formulas; the proof of all indices is the analytic induction in `PROOF.md`.

