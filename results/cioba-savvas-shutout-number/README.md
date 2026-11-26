# Cioba–Savvas shutout number conjecture

**Proved.** For every positive integer $s$, the maximum degree of a graph on which Maker can force a free $s$-star is at least $2^s/8$. In fact for $s\ge3$, Breaker prevents even an immediate $s$-shutout on every graph of maximum degree at most $2^{s-3}$.

This proves the intended exponential bound in [Conjecture 3.2 of Cioba–Savvas](https://michailsavvas.github.io/documents/Shutout.pdf), and therefore its weaker Conjecture 3.3. Breaker chooses which endpoint of Maker's edge to mark by maintaining one local linear test at the endpoints. The separate numerical Conjecture 3.4 is outside this result.

[Proof](PROOF.md) · [Audit and priority search](AUDIT.md) · [Exact regression](verify.py) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/905)

**Verification:** Complete written proof with a separate mathematical audit and exact finite regression. Not Lean formalized or externally refereed.
