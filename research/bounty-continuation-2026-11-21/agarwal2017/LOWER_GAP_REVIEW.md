# Review of the rejected iid oracle lower bounds

21 November 2026. Reviewed [the Agarwal Question 2 lower-bound attempt](iid-oracle-lower-gap.md), corrected SHA-256 `68af52d9cfe9d52402c451c1862afb0b3281f2e15b84b7771b4fe13f9e1c904a`. The rejection arguments pass. They establish neither an unrestricted oracle lower bound nor a new paid-target solution.

## Binary classification

With two complementary zero-one classification losses, the chosen action and its observed loss determine the label. A policy minimizing empirical classification error therefore returns a consistent policy in the realizable setting, using the allowed optimization oracle.

For a fixed policy, consistency on $`n`$ independent examples has probability $`(1-r)^n\le e^{-nr}`$. The union bound over policies and prefix lengths controls all consistent choices at once, including choices made adaptively from the observed labels. Summing the resulting risk bounds yields the stated bound on $`A_T`$, the sum of conditional mistake probabilities.

The exponential process $`\exp(M_t-(e-1)A_t)`$ is a nonnegative supermartingale. Markov's inequality adds $`\log(2/\delta)`$ to the threshold; it does not multiply by that term. An earlier draft omitted the plus sign, which was corrected before this reviewed version was frozen. The two failure events sum to at most $`\delta`$. The conclusion has polylogarithmic dependence on $`T,N`$ and therefore prevents this specialization from proving the desired zero-loss impossibility.

## Sparse corruptions

If the seed policy differs from a safe policy at at most $`s`$ contexts, the dictionary repair only changes behavior after a positive observed loss. It never changes behavior outside those contexts. At any changed context, the safe action is never forbidden, while each other action can cause at most one positive-loss event before being removed. Thus there are at most $`(K-1)s`$ such events, and each contributes at most one loss. This remains true when an unsafe action sometimes happens to produce zero loss.

The repair is improper, which the original oracle interface permits. Consequently hardness of identifying a particular hidden policy does not establish hardness of attaining low loss. The construction's limitation to finitely supported disagreements is explicit; the review does not extend it to diffuse error sets.

## Scope

The note correctly separates a prescribed adversarial context sequence from sampling iid contexts from a fixed distribution. Its description of the located 2025 theorem is a source audit; this review does not independently re-prove that external lower bound. Arbitrary weighted oracle queries, proper versus improper choices, and a fixed class realizing every oracle response remain necessary obligations for any future negative theorem.
