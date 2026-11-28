# Han–Sabag–Kostina–Hassibi: independent counterexample audit

Status: the counterexample and sparse lower bound pass independent mathematical and source-scope review. Prior-art review remains with the root agent; this note alone does not establish novelty.

## Exact source

Barron Han, Oron Sabag, Victoria Kostina, and Babak Hassibi, *Coded Kalman Filtering over MIMO Gaussian Channels with Feedback*, arXiv:2406.17196v2 (5 August 2025), Conjecture 1, equations (23)–(24), printed page 6.

Primary full text: https://arxiv.org/pdf/2406.17196

The stated optimization problem fixes diagonal $B$ and $H$, requires diagonal $\Pi\succeq0$, and asks for $J\succ0$ satisfying

```math
J=BJB-\Gamma^T(I+H\Pi H)^{-1}\Gamma+B\Gamma^T\Gamma B.
```

It minimizes $\mathop{\mathrm{tr}}\Pi$ over these variables and conjectures that an optimum has exactly one nonzero entry in each column of $\Gamma$. There is no further constraint relating $\Gamma$ to $\Pi$ in the stated problem. The source discusses related constraints from the underlying communication model later, but those must not silently be inserted into equations (23)–(24).

The example below uses positive distinct diagonal entries of $B$ strictly below one, so there is no issue with the source's abbreviated condition $b_i<1$ or with uniqueness of the Lyapunov solution. It disproves equality of the dense and sparse infima, which is stronger than exploiting the source's possibly unattained-optimum wording.

## Exact feasible point

Take

```math
B=\mathop{\mathrm{diag}}\left(\frac45,\frac35\right),\quad
H=\mathop{\mathrm{diag}}\left(\frac74,1\right),\quad
\Pi=\mathop{\mathrm{diag}}\left(\frac{1168}{1323},\frac3{17}\right),
\quad
\Gamma=\begin{pmatrix}1&1\\[2pt]\frac{53}{40}&\frac{840}{1961}\end{pmatrix}.
```

Then

```math
D=(I+H\Pi H)^{-1}
 =\mathop{\mathrm{diag}}\left(\frac{27}{100},\frac{17}{20}\right).
```

Because $B$ is diagonal and $|b_i b_j|<1$, the unique solution has entries

```math
J_{ij}=\frac{\sum_{\ell=1}^2
 \gamma_{\ell i}\gamma_{\ell j}(b_i b_j-d_\ell)}{1-b_i b_j}.
```

Direct rational arithmetic gives

```math
J=\mathop{\mathrm{diag}}\left(\frac{211}{57600},
                         \frac{35289}{246113344}\right)\succ0,
\qquad
\mathop{\mathrm{tr}}\Pi=\frac{23825}{22491}.
```

The off-diagonal cancellation is exact:

```math
\frac{53}{40}\frac{840}{1961}=\frac{21}{37}
 =\frac{12/25-27/100}{17/20-12/25}.
```

Both diagonal entries are strictly positive. Thus this is an exact feasible point, not a numerical optimizer output.

## Complete sparse classification

Every column must be nonzero because a zero column forces the corresponding diagonal entry of $J$ to vanish. With exactly one nonzero entry per column and two channels, there are precisely four assignment patterns.

If both columns use the same channel with diagonal value $d=(1+h^2\pi)^{-1}$, nonzero column scaling is a diagonal congruence and does not change positive definiteness. The relevant matrix is

```math
K(d)_{ij}=\frac{b_i b_j-d}{1-b_i b_j}.
```

For distinct $0<b_1,b_2<1$,

```math
\det K(d)=\frac{(b_1-b_2)^2(1-d)(b_1^2b_2^2-d)}
 {(1-b_1^2)(1-b_2^2)(1-b_1b_2)^2}.
```

Since $0<d\leq1$, $K(d)\succ0$ holds exactly when $d<b_1^2b_2^2$. Necessity follows from the determinant and the diagonal sign at $d=1$; sufficiency follows from the positive diagonal entries and determinant. Here $b_1^2b_2^2=144/625$, so the power infimum for a common channel is $(481/144)/h^2$.

If the columns use different channels, $J$ is diagonal. A mode $b_i$ assigned to channel $h$ needs $d<b_i^2$, equivalently $\pi>(b_i^{-2}-1)/h^2$. This condition is also sufficient. The two mode costs before division by the channel squared gain are $9/16$ and $16/9$.

For $h_1=7/4$, $h_2=1$, the four exact sparse power infima are therefore:

| Assignment | Infimum |
|---|---:|
| Both modes to channel 1 | $481/441$ |
| Both modes to channel 2 | $481/144$ |
| Mode $4/5$ to channel 1, mode $3/5$ to channel 2 | $865/441$ |
| Mode $4/5$ to channel 2, mode $3/5$ to channel 1 | $8065/7056$ |

The minimum is $481/441$. Thus

```math
\inf_{\text{all feasible }\Gamma}\mathop{\mathrm{tr}}\Pi
\leq\frac{23825}{22491}
<\frac{481}{441}
=\inf_{\text{one nonzero per column}}\mathop{\mathrm{tr}}\Pi,
```

with exact positive gap

```math
\frac{481}{441}-\frac{23825}{22491}=\frac{706}{22491}.
```

The strict inequalities required by $J\succ0$ only mean that the sparse thresholds are infima. The dense feasible point is strictly below all of them, so allowing limits does not restore the conjecture.

## A continuous family of counterexamples

Keep $B,D,\Gamma$ as above. For $s=h^2>0$ put

```math
H=\mathop{\mathrm{diag}}(h,1),\qquad
\Pi=\mathop{\mathrm{diag}}\left(\frac{73}{27s},\frac3{17}\right).
```

This retains the same positive definite $J$ and has dense feasible power $73/(27s)+3/17$. The four sparse thresholds are

```math
\frac{481}{144s},\qquad \frac{481}{144},\qquad
\frac9{16s}+\frac{16}{9},\qquad
\frac{16}{9s}+\frac9{16}.
```

The dense point lies strictly below all four whenever

```math
\frac{1360}{567}\lt s<\frac{4675}{1296}.
```

For the first and fourth comparisons these are exactly the upper and lower bounds. The two other comparisons give weaker lower bounds, as direct rational cross multiplication confirms. In particular the example lies in a nonempty open interval of channel gains; the contradiction is not tied to a floating-point special case.

## Limits of this review

This review checks the conjecture as actually stated. It does not assert a separate counterexample to every engineering interpretation in the paper, nor does it need a reconstruction of the full coded Kalman filter. The source's conditional Theorem 2 cannot be invoked after its conjectural hypothesis fails; further consequences require their own derivation.

Independent review: algebra agent, 21 November 2026.
