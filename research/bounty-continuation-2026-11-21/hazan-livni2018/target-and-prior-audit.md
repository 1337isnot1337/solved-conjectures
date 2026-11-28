# Hazan–Livni 2018: reconstruction with short codes

Audit date: 2026-11-21. Reserved in [campaign issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069931859). No solution, sponsor contact, submission, payment, or award claim.

## 1. Exact cash target and model

Elad Hazan and Roi Livni's [COLT 2018 paper](https://proceedings.mlr.press/v75/hazan18a.html), [primary PDF](https://proceedings.mlr.press/v75/hazan18a/hazan18a.pdf), Section 4 on PDF page 3, offers **\$100 to the solver** of its first question. It asks for a simple, efficient improper learner competitive in reconstruction error with the best $`k`$-center model, with encoding length

```math
\mathop{\mathrm{poly}}(\log k,\log(1/\varepsilon)),
```

including the overcomplete regime $`k>d`$. The same paragraph explicitly allows an impossibility result. An additional $100 is offered for the general-covariance analogue; that second question is not treated as interchangeable with the first.

The reconstruction objective is squared Euclidean loss. The mathematical notation on the primary PDF's first page was visually inspected to confirm that the displayed 2 is an exponent. The criterion in Section 2 is population reconstruction loss at most the best comparator loss plus $`\varepsilon`$, with success probability at least $`2/3`$ over an i.i.d. training sample. This is not the ordinary problem of estimating a Gaussian-mixture density in total variation.

The short paper abbreviates several model details. The sponsor's [March 2018 explanation](https://minimizingregret.wordpress.com/2018/03/01/unsupervised-learning-iii-worst-case-compression-based-metrics-that-generalize/) explicitly assumes bounded-norm data. The linked foundational [Hazan–Ma 2016 manuscript](https://arxiv.org/abs/1610.01132), Definition 2.1 and its preceding setup, learns an **encoder-decoder pair**, and takes the training sample bound to be polynomial in inverse accuracy, confidence, and dimension. The present attack therefore works with arbitrary distributions on the Euclidean unit ball, learned decoders, and runtime polynomial in the input parameters, including inverse accuracy. The code-length bound concerns the representation of a new point, not a ban on storing a learned codebook.

A fixed-decoder covering argument would address a different model. An impossibility based only on unbounded tails would not settle the bounded-data problem. Neither is used here.

The prize paragraph gives no expiry. No withdrawal or prior payment was found in the inspected public records. Current sponsor acceptance and funding were not independently confirmed; the sponsor was not contacted.

## 2. Prior results and distinctions

| Primary source | Exact relevant result | Remaining distinction |
| --- | --- | --- |
| Hazan–Livni 2018, Section 3 | PCA gives a reconstruction relaxation using order $`k\log(R/\varepsilon)`$ bits. | This is linear in the number of centers instead of polynomial in its logarithm. |
| Hazan–Ma 2016, Definition 2.1 and Section 3.4 | General encoder-decoder framework and a polynomial-time spectral-autoencoder result under the stated regular spectral-decodability premise. | Its premise, encoding bound, and bias are not the all-distribution short-code result requested in 2018. |
| Makarychev–Makarychev–Sviridenko–Ward, [APPROX/RANDOM 2016](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.APPROX-RANDOM.2016.14), [primary PDF](https://drops.dagstuhl.de/storage/00lipics/lipics-vol060-approx-random2016/LIPIcs.APPROX-RANDOM.2016.14/LIPIcs.APPROX-RANDOM.2016.14.pdf), Theorem 7 | The finite-data reduction to an approximate centroid set has size and runtime $`n^{O(\log(1/\eta)/\eta^2)}`$. The following rounding gives a tradeoff between extra centers and approximation ratio. | Polynomial time for each fixed approximation parameter does not give runtime polynomial jointly in inverse accuracy. This paper was already cited by the prize source. |
| Hsu–Telgarsky, [*Greedy bi-criteria approximations for k-medians and k-means*](https://arxiv.org/abs/1607.06203), introduction and Theorem 3.3 | Using averages of subsets of size $`\lceil1/\eta\rceil`$ as candidate centers gives a near-one approximation with $`O(k\log(1/\eta))`$ output centers, in time $`O(dk\log(1/\eta)n^{1+\lceil1/\eta\rceil})`$. | The output codebook is already small enough. Candidate generation has the wrong uniform dependence on accuracy. Their raw-point candidate versions instead give a constant factor near 2. |

The existing approximation schemes therefore cannot be relabelled as a new solution. Short output codes alone are insufficient: computational and population guarantees must also hold with the required parameter dependence.

## 3. Current-status and duplication checks

The four-page sponsor PDF and the relevant sections of the two clustering papers and the 2016 framework were downloaded from public primary sources and read. The current [Roi Livni publication list](https://www.rlivni.sites.tau.ac.il/publications), the sponsor's explanation, exact-title searches, and later clustering results found by searches were inspected. No matching full resolution was found. This is a record of the inspected evidence, not a proof that no unindexed result exists.

An indexed [experimental mathematical-rollout dataset](https://huggingface.co/datasets/IFM/research-math-rollouts/blob/main/README.md?code=true) lists this target among attempted problems. The full records require access authorization. No authorization was sought and no restricted records were retrieved. Aggregate automated status labels in the indexed description do not establish a mathematical proof or the status of this exact target.

Live issue searches for the author pair and for the full Gaussian-mixture title found no separate reserved thread before the reservation; the author-pair search returned only this campaign's just-posted coordination note. Local research search found only the earlier cash ledger. The reservation's complete body was read back and matched.

## 4. Bounded attack

The separate [weak-gain note](weak-center-gain-route.md) gives the exact population gain condition that would make greedy construction a full learner. It also disproves raw observed points as a uniformly adequate candidate family, even when a zero center is included. The latter is a restriction on a proposed algorithm, not an impossibility theorem for arbitrary learned decoders.

No efficient general gain oracle has been proved. The first $100 target and its separate covariance analogue remain unresolved by this work. This lane adds zero completed bounty targets.
