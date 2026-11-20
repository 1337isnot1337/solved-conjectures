# Ferreira–Simon's Wright log-concavity conjecture

Status: complete candidate structural disproof; independent written-proof review and the prior-resolution audit are in progress.

Tracking: [issue 100](https://github.com/1337isnot1337/solved-conjectures/issues/100).

## Result

The conjecture's parameter threshold is not sufficient for log concavity of the Wright density. For every sufficiently small $t>0$, both families

```math
(\alpha,\beta)=(1-t,0)
\qquad\text{and}\qquad
(\alpha,\beta)=(1-3t,t)
```

satisfy $\alpha<\alpha_*(\beta)$, but their densities fail log concavity at $x=1/2$.

The argument proves a locally uniform limit, including the first two derivatives:

```math
\frac{\phi(-(1-at),bt,-x)}{t}
\longrightarrow
\frac{b+(a-b)x}{(1-x)^2},
\qquad |x|<1.
```

The gamma reflection formula and log convexity bound the $n$th coefficient in absolute value by $an+b$. The limiting curvature $f'^2-ff''$ at $x=1/2$ is $-16(a^2+6ab+b^2)$. For the interior family, its value at zero is positive, giving the source's exact threshold condition.

This disproves the complete universal equivalence in §6.4 of Ferreira and Simon's paper. It does not settle every remaining implication between density log concavity and reciprocal Mittag–Leffler convexity.

## Files

- [CANDIDATE_PROOF.md](CANDIDATE_PROOF.md): source statement and complete analytic disproof, including a general slope family.
- [verify.py](verify.py): exact rational-polynomial checks of the curvature identity and displayed derivative values. No special-function approximation is used.
- `NOVELTY.md`: source/version and prior-resolution audit, being prepared.

Run the optional algebra check with `python3 research/ferreira-simon-wright/verify.py` from the repository root. The proof establishes whole parameter intervals independently of this computation.
