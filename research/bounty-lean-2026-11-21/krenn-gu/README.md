# Krenn–Gu: excluded after finding a prior full proof

Status checked 21 November 2026. This is an eligibility correction, not a
solution by this campaign. The reservation in
[issue 227](https://github.com/1337isnot1337/solved-conjectures/issues/227)
was closed after the deeper source audit.

## The apparently open offer

[Mario Krenn's maintained reward page](https://mariokrenn.wordpress.com/graph-theory-question/)
offers EUR 3,000, jointly with Dominik Leitner, for the first proof or
counterexample published in a respected peer-reviewed journal. No deadline is
stated. A separate EUR 1,000 best-paper award has an old August 2024 nomination
deadline and was not treated as current.

The mathematical target is the full complex-weighted, endpoint-bi-colored
multigraph statement. For even $N\ge6$ and $D\ge3$, let $W_{ij}$ be an
arbitrary complex $D\times D$ matrix for each $i<j$, and define

```math
T_W(a_1,\ldots,a_N)
=\sum_{M\text{ perfect matching}}\prod_{\{i,j\}\in M,\ i<j}W_{ij}[a_i,a_j].
```

The conjecture forbids $T_W$ from being one on every constant color word and
zero on every nonconstant color word. The
[original paper](https://arxiv.org/abs/1902.06023) and
[author's MathOverflow question](https://mathoverflow.net/questions/311325/vertex-coloring-inherited-from-perfect-matchings-motivated-by-quantum-physics)
give the definitions. Parallel edges of the same endpoint-color type aggregate
by addition, so the matrix formulation preserves the unrestricted model.

## The later evidence that changes eligibility

The primary paper
[Krenn et al., 19 November 2026](https://arxiv.org/html/2611.26300v1)
initially discusses the older open status, but its Table 1 and Conclusion and
Outlook explicitly record a full unrestricted proof by Rishi Rajasekaran,
submitted in September 2026 and formally verified in Lean. Reference 36 links
the registration:

[formal-conjectures PR 6627](https://github.com/google-deepmind/formal-conjectures/pull/6627),
submitted 26 September 2026. Its full theorem is exactly

```lean
∀ N D : ℕ, N ≥ 6 → Even N → D ≥ 3 →
  ¬ ∃ W : MonochromaticQuantumGraph.WeightsN N D ℂ,
    MonochromaticQuantumGraph.EqSystemN N D W
```

We inspected the pinned
[FullProof.lean](https://github.com/rrajasek95/krenn-conjecture/blob/7f78a17ecedd245bd1c17b0dce3f6a9ea2afd66f/formal/upstream-adapter/FullProof.lean).
It transports the full ternary result to the exact upstream definitions and
then applies palette restriction for all $D\ge3$. This is the unrestricted
all-orders statement, not an integer-weight or fixed-order theorem.

[Chris Dzoba's independent replay report](https://github.com/google-deepmind/formal-conjectures/pull/6627#issuecomment-5857751279)
records a 27 September replay with Lean 4.33.1 and the pinned Mathlib revision,
919 core declarations and 21 adapter/corollary declarations. It reports that
the final theorem depends only on `propext`, `Classical.choice`, and
`Quot.sound`, and that the model bridge is proved rather than assumed. The
[public replay log](https://gist.github.com/dzoba/836b0897d65b2d57901fb82c871205a2)
includes the axiom output and source hashes. We read the source and report;
we did not independently rebuild the entire package in this campaign.

The registration PR remains open. The inspected maintainer comments request
a category-count update and a rebase following removal of `answer(...)`.
A later commenter asks for an additional dependency build from source or
fresh-kernel replay. The inspected discussion does not identify a theorem
mismatch or mathematical flaw. Pending registration is not evidence that
the previously submitted theorem is available as a novel solve.

## Why a shallow search was misleading

The sponsor page, October MathDB summary, and a separate research repository
still presented the general conjecture as open. The November primary paper
itself retains an older sentence saying the intermediate range is open;
its later table and conclusion supersede that sentence by identifying the
full proof. The authors' new $D\ge N$ theorem is also not the full result;
the full result is attributed to the separate September proof.

Earlier restricted results are distinct: Bogdanov's positive-weight theorem,
the MFCS 2024 sparse-graph theorem, the external six-vertex Lean proof, and
integer-weight/all-orders bounds would not alone close this target. The
full complex theorem does.

No payment or journal-publication status was established for the prior solver.
That uncertainty does not restore novelty. This campaign makes no prize
claim and counts no new solution for this problem.
