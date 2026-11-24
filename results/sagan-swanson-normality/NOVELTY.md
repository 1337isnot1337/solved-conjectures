# Literature and scope record

Checked on 20 November 2026. No earlier resolution of the full four-family proportional-regime statement was located in the sources below. This is a bounded literature screen; it does not establish exclusive priority.

## Exact target

- Bruce E. Sagan and Joshua P. Swanson, *q-Stirling numbers in type B*, European Journal of Combinatorics **118** (2024), 103899, DOI [10.1016/j.ejc.2023.103899](https://doi.org/10.1016/j.ejc.2023.103899). [Published full text](https://users.math.msu.edu/users/bsagan/Papers/Old/qStB-pub.pdf), [NSF copy](https://par.nsf.gov/servlets/purl/10626831), [arXiv:2205.14078](https://arxiv.org/abs/2205.14078).
- The exact conjecture is 7.8, printed page 32. The coefficient distributions of the four fixed-$`(n,k)`$ polynomials are the objects being standardized. Theorem 7.7 immediately before it treats fixed $`k`$ for the second-kind families, a different regime. The paper's ordinary Stirling row-normality references also concern a different distribution.
- The type-B symmetric-function formulas occur in Theorem 2.1. The four defining recurrences and their indexing were checked directly by two agents against the published text.

## Subsequent work inspected

1. Sagan and Swanson, *Stirling numbers for complex reflection groups*, [author manuscript](https://users.math.msu.edu/users/bsagan/Papers/Old/StG.pdf), [arXiv:2408.13874](https://arxiv.org/abs/2408.13874), [published record](https://doi.org/10.1007/s00026-025-00751-4). This followup extends the algebraic and combinatorial constructions. The complete 26-page author manuscript was searched for asymptotic results; it does not contain a normal-limit theorem resolving Conjecture 7.8.

2. [Swanson's current publication and project page](https://www.jpswanson.org/), including its 2026 entries. No subsequent resolution of this conjecture was listed there when checked.

3. Shi-Mei Ma, *Log-concavity and log-convexity of Stirling columns, and bottom-heaviness of q-Stirling numbers*, September 2026. [ChinaRxiv record](https://chinarxiv.org/items/chinaxiv-202609.00184), [author-uploaded full text](https://www.researchgate.net/publication/414355049_Log-concavity_and_log-convexity_of_Stirling_columns_and_bottom-heaviness_of_q-Stirling_numbers). Its second result settles Sagan–Swanson Conjecture 7.6 on bottom-heaviness. The full text contains no claim resolving asymptotic normality. Its other result concerns the log-concavity-to-log-convexity transition in columns of ordinary Stirling numbers.

4. [Trure Turing's bottom-heaviness release](https://www.trureturing.org/research/ss2205-bottomheavy/). This public result record explicitly distinguishes its bottom-heaviness theorem from asymptotic normality, which it lists among the remaining questions. It was used as a current status cross-check, not as a mathematical premise. Its reported independent bottom-heaviness settlement is also a different conjecture.

## Older probability literature and scope checks

- Svante Janson, *Moment convergence in conditional limit theorems*, Journal of Applied Probability **38** (2001), 421–437. [Publisher record and abstract](https://www.cambridge.org/core/journals/journal-of-applied-probability/article/abs/moment-convergence-in-conditional-limit-theorems/F7FF2075AD4AE33AEF365ED706313036), [author PDF](https://www2.math.uu.se/~svantejs/papers/sj132.pdf). The abstract describes conditional sums and moment convergence for independent identically distributed pairs. Conditional-limit methods are established tools; the present proof does not claim to invent them. Our pairs depend on the index and form a triangular array, and the needed estimates are proved directly. Full-text retrieval of this older paper failed during this screen, so no claim is made to have audited every theorem in it.

- Davide Crippa, Klaus Simon and Paul Trunz, *Markov Processes Involving q-Stirling Numbers*, Combinatorics, Probability and Computing **6** (1997), 165–178. [Publisher record](https://doi.org/10.1017/S0963548397002964), [ETH report manuscript](https://www.research-collection.ethz.ch/bitstreams/f9ee6dd4-4427-4457-a1b9-f00fe5a648f7/download). The full report was accessed. Its process uses $`q`$ as a numerical transition-probability parameter; its distribution varies the state index. This does not identify the fixed-$`(n,k)`$ coefficient distribution required here. The scanned extraction is imperfect, and the scope distinction was checked in its introduction rather than inferred from the title alone.

- Searches also returned normality for ordinary Stirling rows, record statistics with numerical $`q`$, descents on Stirling permutations, and cyclotomic generating functions. These statements concern different distributions. A general central limit theorem by itself does not discharge the conditioning, indexing, variance, and moment checks in the proof.

## Search record

Both available search engines were used, including current-year and exact-statement searches. Independent agents repeated the target-specific screen. Queries included:

- `"Sagan" "Swanson" "asymptotically normal"`
- `"Conjecture 7.8" "Stirling"`
- `"Sagan" "Swanson" "7.8" proof`
- `"Sagan–Swanson" "normality"`
- `"q-Stirling" "asymptotic normality" 2025 2026`
- `"q-Stirling" "coefficients" "central limit theorem"`
- `"q-Stirling" "coefficient distributions" normal`
- `"Stirling" "k/n" "normal" q coefficients`
- `"Stirling" "conditional central limit" q`
- `"Carlitz" "Stirling" "central limit" inversion fixed blocks`
- `"inversions" "set partitions" "asymptotic normality"`
- `"set partitions" "k blocks" "inversions" normal distribution`
- `"Stirling numbers for complex reflection groups" asymptotic`
- `"Sagan" "Swanson" "normality" proof counterexample`
- `"2205.14078" "normal" proof conjecture`

No exact prior proof or disproof appeared in these searches. The proof is an unrefereed result and remains subject to correction if an earlier resolution or a mathematical error is identified.

## Independent audit record

The analysis reviewer checked the whole argument, with particular attention to the geometric characteristic-function denominator, a uniform gap below the geometric singularity, the full Fourier-domain bound, conditioning probability, exponential tilting, and actual-moment standardization. The combinatorics reviewer checked the exact published statement, all four symmetric-function identities, count/mark generating functions, and the parameter table. Both audits passed. The root reviewer then independently checked the complete corrected proof, including all analytic steps, and also found no gap. The [combinatorics audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/sagan-swanson/AUDIT-COMBINATORICS.md) records its source and model checks. These are internal reviews, not external peer review.

A formatting edit briefly duplicated Section 1 in the initial research commit. Commit `9e532ccded16775b44f6f5f489e259c36a46f3b2` removed those repetitions; the analytic argument was unchanged.
