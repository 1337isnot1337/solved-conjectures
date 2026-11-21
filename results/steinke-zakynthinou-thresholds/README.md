# Steinke–Zakynthinou's agnostic threshold problem

Complete proposed proof of the separately rewarded proper-threshold
problem in Section 3 of Steinke and Zakynthinou's COLT 2020 open-problem
paper. The proof passed two independent internal mathematical reviews;
the fresh primary-source audit found no earlier exact resolution. It is
not Lean-verified or externally refereed, and no prize has been submitted,
accepted, or paid.

## Result

For every positive sample size, the construction gives one measurable,
distribution-independent randomized learner returning a finite closed
real threshold. Its original conditional mutual information is less
than 21 nats for every iid distribution, including arbitrary atoms and
label noise. On every fixed labeled sample its expected empirical
excess is at most $`2056/\sqrt n`$. The single constant 4096 safely fits
both bounds in the exact sponsor statement, including conversion to bits.

A [finite-coin version](EFFICIENCY.md) gives a worst-case polynomial-time proper learner with CMI below 23 nats and expected samplewise empirical excess at most $`2057/\sqrt n`$. It uses $`O(n\log(n+1))`$ fair bits and feature comparisons. The [implementation](efficient.py) accepts exact rational inputs. The efficiency provision adds 20% if the sponsors accept it.

A [deterministic polynomial-time learner](DETERMINISTIC.md) achieves the same prize target using the order of the input rows. Its empirical excess is at most $`2048\lceil\sqrt n\rceil/n`$ on every ordered sample, and its original CMI is below 7000 nats. The [priority lemma](PRIORITY.md) bounds the information cost of selecting one row. The [implementation](deterministic.py) computes exact rational weights. The prize terms specify a further 20% for determinism, for a potential US$28 if the authors apply both increases to the base.

The proof combines a randomly shifted tree on a folded rank cycle,
an adjacent-sample information comparison, private tags with endpoint
rounding, and an adaptive rank code that converts the result to a proper
threshold without changing its training predictions.

This is one paid mathematical target. The proper and improper variants
are not counted separately. The general VC-dimension conjecture remains
open in this work.

## Evidence

- [Complete proof](PROOF.md).
- [Exact statement, current offer, and prior-art audit](PRIOR_AUDIT.md).
- [Independent shifted-tree and atom review](TREE_REVIEW.md).
- [Independent properization review](PROPERIZATION_REVIEW.md).
- [Coordinator's separate full-proof review](ROOT_REVIEW.md).
- [Consolidated proof composition check](COMPOSITION_REVIEW.md).
- [Exact finite diagnostic](verify.py) and [its recorded result](verification.json).
- [Original reviewed draft bytes and hashes](reviewed-sources.json).
- [Research coordination](https://github.com/1337isnot1337/solved-conjectures/issues/223).

## Reproduce the supplementary check

```sh
python3 results/steinke-zakynthinou-thresholds/verify.py --max-n 6
python3 results/steinke-zakynthinou-thresholds/verify_efficiency.py
python3 results/steinke-zakynthinou-thresholds/verify_deterministic.py
```

The standard-library script checks all small replacement pairs and label
assignments through sample size six, including cycle folds, paired leaf
costs, and exact inactive-node cancellation. The all-size information
and accuracy claims use the written proof, not an extrapolation from
these checks. The second checker replays 8,190 finite-coin runs against a separate implementation that counts each candidate’s empirical losses directly.

The third checker independently enumerates every shifted-tree leaf on 125 sample multisets, compares the decoder on 1,364 ordered samples, and measures the priority inequalities over every rank permutation for 203 weight vectors.

## Prize and verification status

The [primary offer](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)
states US$20 for the proper real-threshold problem and US$15 for an
improper learner, with optional bonuses. No expiry or withdrawal was
found in the checked sources. Current sponsor acceptance is not known;
no bonus, award, or payment is claimed.

The verification badge is unformalized. A future Lean proof would need
to formalize the actual randomized algorithm, its measurable output,
the original paired-sample CMI, the uniform information argument, and
the samplewise accuracy bound. Checking only the finite alignment lemma
would not formalize this theorem.
