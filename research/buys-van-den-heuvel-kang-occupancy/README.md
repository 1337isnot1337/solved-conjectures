# Buys–van den Heuvel–Kang’s average-degree occupancy conjecture

For a triangle-free graph on $`n`$ vertices of average degree $`d`$, a uniformly chosen independent set has expected size at least $`(1-o(1))\,n\log(d)/d`$ as $`d\to\infty`$. The maximum degree is unrestricted. This proves Conjecture 12 from the authors’ paper. [Original question, p. 10](https://arxiv.org/pdf/2503.10002v2#page=10)

More generally, give each independent set probability proportional to $`\lambda^{|I|}`$. The expected fraction of vertices it contains is at least $`(1-o(1))\log(\lambda d)/d`$, uniformly for $`0<\lambda\le1`$ with $`\lambda d\to\infty`$. The separate pointwise Lambert-function conjecture remains open.

Cinna Davis recorded the result and the variance-and-entropy approach in the research issue. The proof here reconstructs the argument and uses the authors’ partition-function bound. An independent internal reviewer checked the written proof. The exact finite calculations supplement it. No Lean formalization or external refereeing is recorded. [Original research record](https://github.com/1337isnot1337/solved-conjectures/issues/497) · [Proof](PROOF.md) · [Source and priority audit](AUDIT.md) · [Independent review](REVIEW.md) · [Computational checks](verify.py)
