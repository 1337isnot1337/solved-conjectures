# Erdős–Hajnal’s ordinal-square chromatic problem

**Status: relative independence of the primary question.** Erdős and Hajnal asked whether there is a graph on the ordinal square $`\omega_2^2`$ of chromatic number $`\aleph_2`$ in which all subgraphs of strictly smaller order type are countably chromatic. The answer is relatively independent of ZFC, even with GCH in both models, using the consistency of a huge cardinal for the negative direction.

**Prior work.** The order-type transfer and the resulting independence statement were already public, with a Lean proof, in [mnn31/erdos-lean](https://github.com/mnn31/erdos-lean/commit/e7de340be9c1828da18538feb254ee9dfcf3af42) and [google-deepmind/formal-conjectures pull request 7250](https://github.com/google-deepmind/formal-conjectures/pull/7250), both of 13 October 2026. Cite that work for the result. This page records a later derivation first committed on 26 November 2026. It is unranked and is not counted as a new resolution. [Details](PROOF.md)

The order-type transfer preserves chromatic number at any regular uncountable cardinal. It connects the exact 1969 question with the cardinal-local forcing results of Baumgartner and Foreman–Laver. The separate $`\aleph_1`$ follow-up has conditional positive answers and is not settled here in ZFC.

A later theorem characterizes every possible vertex order for the two chromatic numbers at successive cardinals, conditional on the corresponding graph of that cardinality existing. The smaller-chromatic-number existence question remains open. The review distinguishes the classical ordinal decomposition from the new mixed-order construction. [Classification](MIXED-ORDER-SPECTRUM.md) · [Independent review](MIXED-ORDER-REVIEW.md)

**Lean status:** none.

[Proof](PROOF.md) · [Source audit](AUDIT.md) · [Review and extension](REVIEW.md) · [Erdős’s original problem](https://www.renyi.hu/~p_erdos/1969-13.pdf#page=3) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/971)
