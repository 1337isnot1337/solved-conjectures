# Steinke–Zakynthinou’s agnostic VC learning conjecture

**Proposed written proof. Full Lean verification is pending.** Thomas Steinke and Lydia Zakynthinou asked whether, for every binary class of VC dimension $`d\ge1`$ and sample size $`n\ge d`$, a learner can choose a classifier from the given class while meeting both of the following guarantees.

- On every labeled sample, its expected fraction of mistakes is within $`O(\sqrt{d/n})`$ of the best classifier in the class.
- For every iid data distribution, the information its entire output reveals about which examples from a paired supersample were chosen is $`O(d)`$.

The proposed learner weights training mistakes randomly and regularizes the entropy of predictions on several sizes of feature subsets. A bound comparing two averaged conditional-expectation operators controls how much the output law changes when one example is removed. The proof states the measurable-selection convention explicitly and gives an unconditional finite-pool permutation formulation. [Written proof](PROOF.md)

The authors’ published offer is **US$500** for a proof of Conjecture 6. The result awaits independent review. No bounty submission, award, or payment is recorded. The real-threshold case has its own result and Lean theorem. [Original problem and prize, §§2–3](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Earlier-literature audit](../../research/bounty-continuation-2026-11-21/learning-information/vc-information-complexity-target.md) · [Threshold result](../steinke-zakynthinou-thresholds/) · [Discovery record](https://github.com/1337isnot1337/solved-conjectures/issues/240#issuecomment-7072623071)

## Verification

The [finite diagnostic](verify.py) checks the overlap, inverse and residual-variance bounds on a weighted, noncommuting example and checks the geometric-series constant exactly. The all-class argument is in the written proof. Full Lean verification of the stated learner, both guarantees and the population interpretation is the next goal. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/240)
