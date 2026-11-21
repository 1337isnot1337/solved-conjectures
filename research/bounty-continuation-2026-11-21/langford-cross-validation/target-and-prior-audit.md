# Langford cross-validation: target, payment terms, and prior scope

21 November 2026. This audit accompanies the [weighted unanimity certificate](weighted-unanimity-certificate.md). The certificate has a complete mathematical proof and two independent reviews. **It is not counted as a newly resolved historical bounty:** the [prior-coverage correction](prior-coverage-correction.md) proves that an existing theorem already supplies the zero-error improvement used to connect this work to the sponsor's broad criterion. This document records exact source scope, without reporting sponsor acceptance, an award, or a payment.

## 1. The actual funded question

John Langford's [COLT 2005 problem](https://hunch.net/~jl/projects/prediction_bounds/cv_open/cv_open.ps) asks for a classifier derived from the supplied cross-validation classifiers and a computable upper confidence bound on its true error, valid for every learning algorithm, every fold count, and every iid binary-labelled distribution. Its stated baseline is the risk of the uniform Gibbs combination, controlled at the scale of one held-out fold. The proposed bound is allowed to depend on the observed sample and the supplied classifiers. The statement does not require a certificate for a separately retrained full-sample classifier.

The [original prize slides](https://hunch.net/~jl/projects/prediction_bounds/cv_open/cv_open_presentation.ps), final slide, offer "$100 for any improvement (no extra assumptions allowed)." They offer up to $500 for an improvement judged sufficiently substantial by the sponsor. The slide was rendered locally and its actual prize text inspected; this is not a third-party catalogue interpretation.

The sponsor's [28 June 2005 announcement](https://hunch.net/?p=91) links these two documents. His [15 March 2008 post](https://hunch.net/?p=320) says that the problem remained unsolved and refers to the $500 bounty. His [19 May 2012 STOC workshop slides](https://people.cs.umass.edu/~mcgregor/stocworkshop/langford.pdf), slide 26, still list a $500 cross-validation reward. These are dated primary evidence of a direct cash offer. The inspected pages do not establish a 2026 award decision, guarantee that a historical offer remains payable, or specify an escrow balance. No sponsor has been contacted.

The [earlier informal statement](https://hunch.net/?p=29) explicitly contrasts complete agreement of the fold classifiers with a parity learner whose leave-one-out errors can all move together. This makes an observed-agreement certificate relevant to the stated question. It does not prove that agreement makes the observed errors independent.

## 2. Exact claim under review

Write $`m=Kn`$ for $`K`$ consecutive iid blocks of size $`n`$. The supplied learner is used without symmetrizing it: deleting blocks preserves the order of the other observations. The calls may use independent random seeds. Let $`E`$ be equality of all the stored classifier descriptions. On $`E`$, let $`h`$ be the common classifier and $`r`$ its total observed error count. Define

```math
F_{n,r}(p)=\mathbb E_{X\sim\mathop{\mathrm{Bin}}(n,p)}\frac{X}{r+X},
\qquad 0/0=0.
```

The candidate proves

```math
\mathbb E\bigl[\mathbf1_E F_{n,r}(R(h))\bigr]\le\frac1{K+1}. \tag{1}
```

Inverting this increasing finite polynomial and applying Markov gives an unconditional confidence certificate that can use the observed $`r`$ without a union bound over possible error counts. Off $`E`$, a prior Gibbs-risk certificate remains available. Combining the two uses an explicit split of the failure-probability budget. The candidate does not claim pointwise improvement over the prior bound evaluated with the entire budget on every sample.

For leave-one-out, (1) becomes

```math
\mathbb E\left[\mathbf1_E\frac{R(h)}{r+1}\right]\le\frac1{m+1}.
```

For zero observed errors, the resulting upper endpoint has order $`1/(m\delta)`$, instead of depending on the size of a single held-out fold. Its confidence dependence is not the $`\log(1/\delta)/m`$ of an independent zero-error test set. The [finite counterexample](agreement-is-not-a-binomial-test.md) explains why that stronger substitution is invalid.

The following distinctions are part of the claim, not optional qualifications.

- The event is observed agreement. There is no assumption that the algorithm is stable on other datasets.
- The probability guarantee is unconditional over the training sample and training-call randomness. It is not conditional coverage given $`E`$.
- Equal stored descriptions are a computable sufficient test for equal functions. Semantic equality of arbitrary programs is not assumed decidable. An interface without a sound accessible equality test can use the prior fallback certificate; merely failing to recognize equality cannot cause undercoverage.
- The partition is fixed independently of the observations, with a coherent training order. An arbitrary data-dependent or stratified partition is not covered by the iid block argument.
- For randomized training, unordered-pair seeds are shared only inside the proof coupling. Within every actual deletion view the seeds remain independent, matching the supplied learning calls.
- The method uses the models already trained for cross-validation. Auxiliary leave-two-block-out fits are a proof device and are not extra required training calls.

The theorem covers the stated algorithm and fold-count range, but that alone does not establish a newly solved open prize. Prior work already covers the zero-error improvement regime, and no distinct still-open payment criterion for the further weighted theorem has been established. It is not a solution of every estimation problem commonly called cross-validation.

## 3. Closest prior results inspected

The table separates the mathematical estimand and assumptions. A shared keyword, a generic framework, or an abstract alone does not establish that (1) was already proved.

| Primary source and inspection | What it supplies | Relation to (1) |
| --- | --- | --- |
| [Blum, Kalai, Langford, COLT 1999](https://www.cs.cmu.edu/~jcl/papers/progressive_validation/coltfinal.pdf). Main theorems and proof text read. | A Gibbs combination with holdout-scale control; under the paper's order-insensitivity and nondegeneracy conditions, strict moment improvement for intermediate fold counts. | Explicitly prior in the 2005 problem. The candidate uses its baseline and does not count that improvement as new. The inspected result does not state the observed-agreement, random-error-count normalization in (1). |
| [Kohavi, IJCAI 1995](https://ijcai.org/proceedings/1995/0147.pdf), Section 2.2, Proposition 1 and following discussion. | A binomial argument when the fold classifiers make the same predictions. | If interpreted as relying only on agreement realized on the observed dataset, the inference is invalid; the companion finite counterexample gives failure at every fixed confidence level for suitable finite problems. This is not a claim about a stronger uniform assumption on the learner. |
| [Kearns and Ron](https://www.cis.upenn.edu/~mkearns/papers/multi.pdf), main setup and stability results. | Bounds tied to additional stability/complexity conditions and the full-sample learned classifier. | Different assumptions and target. The necessity claim in its Theorem 5.3 is specifically disputed in the 2026 primary source below; this audit does not certify that claim. |
| [Kale, Kumar, Vassilvitskii, 2011](https://theory.stanford.edu/~sergei/papers/ics11-cv.pdf), statement and mean-square stability setup. | A proposed stability-based CV analysis. | Additional stability is not the observed event in (1). The 2026 paper identifies a proof error in its Theorem 2, so it is not used as a verified theorem here. |
| [Kumar, Lokshtanov, Vassilvitskii, Vattani, 2013](https://proceedings.mlr.press/v28/kumar13a.pdf), main result and stability definitions. | Near-optimal CV bounds expressed through loss stability. | The inspected result does not supply a distribution-free certificate based solely on observed identical model descriptions. |
| [Herbrich and Williamson, Algorithmic Luckiness, 2002](https://www.jmlr.org/papers/volume3/herbrich02a/herbrich02a.pdf), general definitions and Section 6.3. | A broad algorithm-dependent luckiness framework; its stability examples use uniform or probabilistic stability conditions and permutation-invariant learners. | The general framework deserves credit. Its inspected specializations do not provide the shared-classifier counting identity. It would be inaccurate to describe the entire luckiness framework as requiring only a single fixed stability assumption. |
| [Oneto, Ghio, Ridella, Anguita, 2015](https://pubmed.ncbi.nlm.nih.gov/25347893/). Original abstract only; full paper not obtained. | Fully empirical stability-based bounds under an additional property of the learning algorithm. | The abstract does not establish coverage of the present no-stability-assumption identity. The unavailable full proof is a specific remaining limitation of this search, not evidence that it cannot contain related arguments. |
| [Barber, Candès, Ramdas, Tibshirani, jackknife+](https://arxiv.org/pdf/1905.02928v3), jackknife-minmax Theorem 3 and Appendix B.1. | A marginal coverage theorem using symmetric learning procedures and fixed prediction-set levels. | It gives a close prior route in the symmetric, fixed-level setting. A consequence for an agreement event must be checked through the prediction-set construction, then converted from marginal coverage to a risk statement. It does not immediately give the observed-$`r`$ normalization or the supplied order-sensitive learner interface. |
| [Bian and Barber, 2023](https://arxiv.org/pdf/2205.03647), Theorems 3–4 and their setup. | Limitations of training-conditional jackknife+ coverage and a training-conditional CV+ guarantee. | This is not merely marginal coverage. The inspected CV+ guarantee retains held-out-fold concentration and concerns prediction intervals, rather than the weighted same-classifier identity. |
| [Cohen, Park, Simeone, Shamai, CV-CRC, 2024](https://arxiv.org/pdf/2401.11974), Theorem 1 and Appendices C–D. | Fixed-level mean-risk control for a union set predictor, assuming permutation-invariant nonconformity scores. | A block-level specialization and the [common-random-key reduction](prior-coverage-correction.md) cover the zero-error unanimity improvement even for the original order-sensitive protocol. They do not establish the complete random-error-count or modal certificate. |
| [Vovk, Conformal e-prediction](https://alrw.cs.rhul.ac.uk/articles/26.pdf), definitions, Propositions 2, 10, 11, Sections 5–6. | Equivariant nonnegative transductive scores with mean at most one; valid split and cross-conformal e-predictors. | The general expectation/Markov framework is prior. Standard averaging of binary-loss split scores has fold-size normalization, not the normalization in (1). The separate detailed comparison below records this distinction. |
| [Vovk, Aggregation in conformal e-classification, 2026](https://proceedings.mlr.press/v329/vovk26a.html), normalization definitions and Section 6. | Foldwise aggregation of conformal e-classification predictors and predictive-efficiency comparisons. | The inspected construction does not state (1) or an equivalent unanimity certificate; its generic validity machinery remains prior. |
| [Bayle et al., 2020](https://arxiv.org/abs/2007.12671), abstract and theorem scope. | Asymptotic confidence intervals and variance estimation under stability conditions. | Different assumptions and asymptotic goal. No finite-sample, all-learner version of (1) is stated in the inspected material. |
| [Bates, Hastie, Tibshirani](https://pmc.ncbi.nlm.nih.gov/articles/PMC11412612/), introductory estimands and principal results. | Analysis of what CV estimates, including linear-model results and nested-CV uncertainty estimates. | Important distinction between risk of a particular fitted model and average risk over training samples. It does not supply the current observed certificate. |
| [Luo and Barber, 2026](https://arxiv.org/pdf/2402.07388), definitions and main impossibility scope. | Limits of assumption-free black-box testing of an algorithm's expected performance over training samples. | The estimand and information interface differ from a certificate for a classifier derived from the given fold models, with access to their stored descriptions. It is not a contradiction to (1). |
| [Nachum, Urbanke, Weinberger, COLT 2026](https://proceedings.mlr.press/v336/nachum26a.html), introductory scope, Sections 3–4 and 5.3–5.4. | Minimax limits for estimating a separately trained full-sample model's risk using CV, including a majority-rule lower bound and corrections to earlier stability arguments. | The inspected theorems do not concern the Gibbs classifier or the observed unanimous-model certificate. Neither their lower bounds nor the identified prior proof errors settle the current target. |

## 4. Why the closest frameworks do not by themselves settle the candidate

The generic e-value step is elementary and prior: a nonnegative score of expectation at most one gives a Markov certificate. The work needed here is the specific deterministic normalization across deletion views. All unanimous views share a classifier because their training-model sets overlap in the same leave-two-block-out fit. Their error fractions therefore sum to at most one. Describing the resulting score as an e-value does not remove the need to prove that identity.

The coordinator's [primary conformal comparison](conformal-e-prior-review.md) checks the relevant definitions and aggregation formulas. For a zero-error held-out fold of size $`n`$, the standard binary-loss split e-value contributes $`(n+1)\mathbf1\{\text{test error}\}`$. Averaging the foldwise scores keeps that scale. On the zero-error agreement event, (1) instead uses the consistency of the classifiers across the whole augmented fold system. For order-sensitive learners the deletion views have equal iid marginals, although their joint vector need not be permutation equivariant.

The jackknife-minmax theorem is closer than an unrelated stability bound: it also uses leave-two-out structure. It must therefore be cited. However, a fixed-level marginal prediction-set guarantee is not automatically an observed-error-dependent confidence bound. Selecting a different level after inspecting $`r`$ requires an additional argument. Independently permuting each fit would change the supplied model law; a single common random-key ordering instead preserves the entire relevant iid joint law. Thus order sensitivity cannot serve as a novelty distinction for the zero-error subcase.

The zero-error improvement is already implied by CV-CRC after grouping observations into vector-valued examples and applying that common-order reduction. It should not be advertised as a new result. The complete weighted observed-error identity and independently reviewed modal extension remain further research statements, without a verified separate paid target.

There is also a genuine upper limit on the desired inference. The companion example has finite input space, a deterministic order-invariant learner, and identical zero-error fold models on a sufficiently likely event, yet the full-sample independent-test binomial endpoint fails. Agreement can justify the weaker weighted moment without making the aggregate CV count binomial.

## 5. Search scope and status

The search used both available engines, exact title and author queries, the original sponsor's posts and linked files, and combinations of cross-validation with unanimity, identical classifiers, observed stability, leave-one-out confidence, luckiness, e-values, modal classifiers, tournaments, and prize or solution status. It followed primary-source leads through the 2026 papers above. The repository issue search did not reveal a separate existing Langford CV investigation before the reservation in [issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069803782).

No inspected primary theorem directly provides (1) with all the stated interface and random-observed-error features. No inspected sponsor page records a resolution, withdrawal, acceptance of this work, or payment. These are bounded search conclusions. They are not a proof of universal absence of prior art, and the abstract-only inspection listed above remains a limitation.

The defensible current description is **proved further cross-validation research, with no new completed-bounty count**. Its publication should credit the existing leave-two-out, conformal, luckiness, and baseline arguments, state the computable equality test, and retain the prior-coverage correction. No distinct still-open funded criterion for the weighted/modal refinements has been established. Neither theorem is counted as another bounty, and sponsor acceptance and payment remain unclaimed.

## 6. Primary-file receipts

| Downloaded primary file | Bytes | SHA-256 |
| --- | ---: | --- |
| Original COLT 2005 problem, `cv_open.ps` | 61,856 | `094a0c00f2c470b602b2cbc84dadee0aef21ba776150fa926799f0c057217cf3` |
| Original prize slides, `cv_open_presentation.ps` | 74,783 | `258cc338e24f62dfd8b54f74825cf716cc1dc1d6ebcba04049b2f712ae817931` |
| BKL 1999 paper, `bkl1999.pdf` | 89,330 | `14963b17aac8ffab3013431659d0dbbe773093aa333b4cb0ec9416d1e4905baf` |
| Nachum–Urbanke–Weinberger 2026 paper, `nachum26a.pdf` | 490,190 | `f93c4438e80e856c29d4df041fea14b6f6d9a552f71ec410d412462909b3e6d1` |
| Cohen et al. CV-CRC 2024 paper, `cohen2024.pdf` | 603,491 | `8f3d64c9b70e80b67df229cf880962f17cde5003fea3ac3d3cf23a78651c0f1d` |

The PostScript originals were converted locally for inspection; the hashes above identify the downloaded source bytes. PDFs and extracted text are research intermediates. The mathematical certificate and the scope counterexample are authored separately.
