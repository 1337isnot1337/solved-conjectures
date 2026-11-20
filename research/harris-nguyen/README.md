# Harris–Nguyen conjecture

Status: active research; no solution claimed. Coordination: [issue #75](https://github.com/1337isnot1337/solved-conjectures/issues/75). Checked 2026-11-20.

## Target

For a primitive binary necklace P of length p >= 3, let P* be obtained by reversing P and complementing every bit. The limiting Bulgarian-solitaire depth generating functions H_P and H_P* are rational. Harris and Nguyen's Conjecture 1.1 asks whether they have a common denominator of degree p.

This is not the exact reduced-denominator conjecture refuted in `results/pham-denominator-degree/`. If H_P=A/B and H_P*=C/D are reduced with B(0)=D(0)=1, the target is exactly deg(lcm(B,D)) <= p. A denominator of smaller degree can be multiplied by a polynomial with nonzero constant term to reach degree p. The lengths one and two are exceptional in the rationality theorem and are not being used as wording counterexamples.

## Structural observation

Write P as a cyclic binary word b_i, with 1 denoting black. The periodic difference sequence in Harris and Nguyen is

```math
\mu_i=1+b_i-b_{i+1}.
```

Choose the indexing of the dual as b_i^*=1-b_{-i}. Then

```math
\mu_i^*=1+b_i^*-b_{i+1}^*=1+b_{-i-1}-b_{-i}=\mu_{-i-1}.
```

Thus reverse-complement of the binary word becomes reversal, up to cyclic indexing, of its difference sequence. The 0 and 2 entries alternate, and the sum of one period is p. This suggests seeking a cyclic transfer operator whose denominator is invariant under reversal.

The inverse-move rule is asymmetric: deleting the jth entry merges its value into the preceding entry, and playability is reset by a forward partial-sum threshold of three. Reversal of the underlying unmarked word alone therefore does not establish a graph isomorphism or a transposed transfer operator. That missing step is the present obstruction.

The fuse factorization in Harris–Nguyen, Corollary 3.8, gives a concrete reduction: a playable prefix of length k ending in an entry at least three, with preceding entries 1 or 2 and no consecutive ones, contributes a polynomial u_k independent of the tail. The remaining task is an all-necklace finite transfer description with a proved reversal invariant. No such description has been established here.

## Literature checks

- N. Pham, *Limiting behavior in growth of Bulgarian Solitaire orbits*, arXiv:2208.14496; INTEGERS 23 (2023), A58. [Primary preprint](https://arxiv.org/abs/2208.14496). Rationality and numerator/denominator degree bounds.
- A. J. Harris and S. Nguyen, *Bulgarian Solitaire: A new representation for depth generating functions*, Australasian Journal of Combinatorics 93 (2025), 224–273. [Published paper](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf), [preprint](https://arxiv.org/abs/2308.05321). Conjecture 1.1, inverse-move rules, fuse factorization, and special families.
- [Son Nguyen's research list](https://sites.google.com/view/sonnguyenvt/research) and [Vic Reiner's supervised research list](https://www-users.cse.umn.edu/~reiner/HonorsTheses/honors_theses.html), checked for follow-up work.
- [Recent survey](https://arxiv.org/abs/2607.17194), identified during the search; its existence is not evidence that every later work has been excluded.
- Exact-name, paper-title, common-denominator, duality, proof/counterexample, and recent Bulgarian-solitaire searches were run. No general resolution was located. This is a bounded literature search, not a priority guarantee.

## Checkpoint

The primary PDF was inspected through the web retrieval tool after direct HTML retrieval and the Pyroam download service failed. The existing repository inverse-move enumerator was read and run locally on its known sample necklaces. Those runs were used to understand the state representation, not as evidence for the universal conjecture. No Lean work was done.
