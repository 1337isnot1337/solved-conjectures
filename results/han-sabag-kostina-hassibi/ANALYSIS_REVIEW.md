# Independent analysis review

Reviewed on 2026-11-21 by the analysis research agent. This review checks the proposed matrix counterexample, including the open family, and the exact source scope. It does not certify priority.

## Primary statement

I independently read Conjecture 1, equations (23) and (24), in both the [arXiv v2 HTML](https://arxiv.org/html/2406.17196v2) and the [v2 PDF](https://arxiv.org/pdf/2406.17196). The conjecture optimizes over diagonal positive semidefinite $`\Pi`$, unrestricted real $`\Gamma`$, and positive definite $`J`$ satisfying the displayed Lyapunov equation. It contains no additional equation tying $`\Pi`$ to $`\Gamma`$. Its conclusion demands one nonzero entry in each column of an optimal $`\Gamma`$.

The proposed example lies in the strictly positive, distinct, contractive diagonal range for $`B`$, so it satisfies even the natural stronger stability assumptions behind the source. The conclusion here is confined to this matrix optimization statement. No separate converse theorem about communication or control follows merely from disproving it.

## Dense feasible point

Solving the diagonal Lyapunov equation entry by entry gives

```math
J_{ij}=\sum_{\ell}\gamma_{\ell i}\gamma_{\ell j}
\frac{b_i b_j-d_\ell}{1-b_i b_j},
\qquad d_\ell=(1+h_\ell^2\pi_\ell)^{-1}.
```

I independently evaluated the stated rational matrices using Python's exact `Fraction` arithmetic. The result is

```math
D=\mathop{\mathrm{diag}}(27/100,17/20),
\qquad J=\mathop{\mathrm{diag}}(211/57600,35289/246113344).
```

Both diagonal entries of $`J`$ are strictly positive, the off-diagonal entry vanishes exactly, and the total power is $`23825/22491`$.

## All sparse alternatives

Exactly one nonzero per column allows four assignments in the two-channel, two-mode case. If both columns use one channel, diagonal congruence removes their nonzero magnitudes. I independently factored the determinant of the remaining matrix:

```math
\frac{(b_1-b_2)^2(1-d)(b_1^2b_2^2-d)}
{(1-b_1^2)(1-b_2^2)(1-b_1b_2)^2}.
```

For $`0<b_2<b_1<1`$ and $`0<d\le1`$, positive definiteness is equivalent to $`d<b_1^2b_2^2`$: this condition also makes the two diagonal entries positive. If the columns use different channels, the two scalar diagonal inequalities suffice and are necessary. An unused channel can only increase the objective and may be assigned zero power.

These four cases give precisely the four infima stated in the proposal. The smallest is $`481/441`$, and its difference from the dense feasible power equals $`706/22491>0`$. This is a strict gap between an unrestricted feasible point and the infimum over every sparse point. Consequently the argument survives any concern that the source's strict positive-definiteness constraints may prevent an optimum from being attained.

## Open family

Write $`q=h^2`$ and keep $`D,\Gamma,B`$ fixed. The dense cost is

```math
\frac{73}{27q}+\frac3{17}.
```

The four sparse infima are

```math
\frac{481}{144q},\quad \frac{481}{144},\quad
\frac9{16q}+\frac{16}{9},\quad
\frac{16}{9q}+\frac9{16}.
```

Comparison with the first and fourth gives respectively $`q<4675/1296`$ and $`q>1360/567`$. The other two comparisons are weaker throughout that interval. Thus the proposed nonempty open interval gives counterexamples throughout, with the same strictly positive $`J`$.

## Decision

The mathematical counterexample and its generalization pass. The strict objective gap refutes the full printed matrix conjecture without reliance on an isolated optimizer computation or on an attainment defect. No mathematical correction is required; the independent prior-art audit remains necessary.
