# Buys–van den Heuvel–Kang’s average-degree occupancy conjecture

Let $`G`$ be a finite nonempty triangle-free graph of average degree $`d`$. Choose an independent set $`I`$ with probability proportional to $`t^{|I|}`$, where $`0\lt t\le1`$. Write $`W`$ for the nonnegative inverse of $`x\mapsto xe^x`$. The expected fraction of vertices in the set satisfies

```math
\frac{\mathbb E_t|I|}{|V(G)|}\ge\frac{W(td)-W(2t)}{d-2}.
```

At $`d=2`$ the right side has the continuous value $`t e^{-W(2t)}/(1+W(2t))`$. This proves Conjecture 12 redux. At $`t=1`$, a uniformly random independent set therefore contains at least $`(1-o(1))\,|V(G)|\log(d)/d`$ vertices in expectation as $`d\to\infty`$, proving Conjecture 12. More generally, the leading lower bound for the expected fraction is $`(1-o(1))\log(td)/d`$ uniformly as $`td\to\infty`$. [Original questions, p. 10](https://arxiv.org/pdf/2503.10002v2#page=10) · [Pointwise proof](POINTWISE.md)

Cinna Davis recorded the asymptotic result and its variance-and-entropy approach in the research issue. WadeDavis and Codex reconstructed that argument using the authors’ partition-function theorem. The separate pointwise proof developed during this review applies the variance bound directly. The review records the authorship and checks of both arguments. The exact finite calculations supplement it. No Lean formalization or external refereeing is recorded. [Original research record](https://github.com/1337isnot1337/solved-conjectures/issues/497) · [Proof](PROOF.md) · [Source and priority audit](AUDIT.md) · [Independent review](REVIEW.md) · [Score checks](verify.py) · [Pointwise certificate](verify_pointwise.py)
