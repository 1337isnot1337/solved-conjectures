# Source audit: Schubr's rank-four Chollet claim

Audit date: 20 November 2026, America/Chicago. This is a source audit, not a new Minc resolution.

## Accessible statement and remaining dependency

Scott Schubr's [archive edition 4](https://research.luminaryoddities.org/chollets-inequality-positive-semidefinite-matrices-rank-at-most-four/v/4), dated 2026-11-02, links an [eight-page primary manuscript](https://research.luminaryoddities.org/chollets-inequality-positive-semidefinite-matrices-rank-at-most-four/v/4/files/Rank_Four_Chollet_All_Orders.pdf). Its internal title page says “Archive edition 3.”

Corollary 1.2 claims Chollet's inequality for every order when **both** positive semidefinite factors have rank at most four. Theorem 1.1 supplies self-conjugate bounds through order ten, using the singular order-five bound with factor 3/5. Larger orders invoke Ma's Theorem 1.2; smaller orders invoke Rodtes.

The web reader returned the main argument and the beginning of Appendix A. Later PDF requests returned HTTP 410. The linked ZIP was unsupported by the reader, and a separate public-file download attempt failed at the Pyroam connector. The full singular-five certificate was **not inspected or executed**. The all-order result therefore remains an independently unverified prior claim in this audit. No evidence of a proof error was found in the inspected continuation.

## Independent check of the continuation

Write a correlation matrix as

```math
A=\begin{pmatrix}H+xx^*&x\\x^*&1\end{pmatrix},\qquad H\succeq0,
```

and put $`R_t=H+t xx^*`$, $`P(M)=\operatorname{per}M`$,
$`Q(M)=\operatorname{per}(M\circ\overline M)`$.
Direct border expansion gives

```math
P(A)=F(1)+F'(1),\qquad F(t)=P(R_t).
```

For $`z_i=|x_i|^2`$, set

```math
U=H\circ\overline H,\quad
V=H\circ\overline{xx^*}+\overline H\circ xx^*,\quad
W=zz^T.
```

All three matrices are positive semidefinite. With
$`\Gamma(a,b)=P(U+aV+bW)`$, the same expansion gives

```math
Q(A)=\Gamma(1,1)+\partial_b\Gamma(1,1),\qquad
Q(R_t)=\Gamma(t,t^2).
```

The coefficients of these permanent polynomials are nonnegative: expand the symmetric tensor of Gram vectors in mutually orthogonal spaces and group its squared norm by occupation counts. Consequently, for $`t\ge1`$, the comparisons use

```math
b_m(t)=\max_{0\le k\le m}\frac{t^k}{k+1},\qquad
d_m(t)=\max_{0\le s\le m}\frac{s+1}{t^{2s}}.
```

The sequence in the first maximum is log-convex, so
$`b_m(t)=\max\{1,t^m/(m+1)\}`$. Before
$`t_0=(m+1)^{1/m}`$, the product $`b_m^2d_m`$ is nonincreasing;
after $`t_0`$, it is a maximum of nondecreasing powers of $`t`$.
This independently verifies the stated minimizer. These steps preserve rank at
most four and positive diagonal.

Conditional on the 3/5 base, the resulting constants are approximately

| Order | Self-conjugate factor |
|---|---:|
| 5, 6 | 0.6 |
| 7 | 0.6273095502896523 |
| 8 | 0.6926058963022401 |
| 9 | 0.7997524013448407 |
| 10 | 0.9588779375219693 |

The final rational bound was also checked by exact integer arithmetic:

```math
48000^{126}<4795^{126}\,7^{42}\,8^{36}\,3^{63}\,10^{28}.
```

## Consequence for the current research scope

Even accepting this claim would not settle rank-five through rank-seventeen
inputs. It supplies no unrestricted-rank resolution of Chollet's conjecture.
It is prior work and must not be counted as a result of this continuation.
