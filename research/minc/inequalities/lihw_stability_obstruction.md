# Lih–Wang convexity inequality

Research note, 2026-11-20. No full resolution is established.

## Stable-polynomial reformulation

For a doubly stochastic matrix `A`, let `sigma_k(A)` denote its total order-k subpermanent sum and put

```math
q_k=\frac{\sigma_k(A)}{\binom nk^2 k!/n^k}.
```
Expanding each selected entry of `tA+(1-t)J_n` gives the exact identity

```math
\frac{\mathop{\mathrm{per}}(tA+(1-t)J_n)}{d_n}
=\sum_{k=0}^n\binom nk t^k(1-t)^{n-k}q_k,
\qquad d_n=n!/n^n.
```
Thus Lih–Wang asks whether

```math
\mathbb E[q_K]\le 1+t(q_n-1),\qquad K\sim\mathop{\mathrm{Bin}}(n,t),\quad0\le t\le\tfrac12.
```
The multivariate matching polynomial associated with `A` is real stable, and the ordinary rook polynomial `R_A(z)=sum_k sigma_k(A)z^k` has negative real roots. However, the factorial weights in the displayed permanent expansion do not preserve that real-rootedness.

## An exact obstruction to a direct real-rooted interpolation argument

Take `A=(11^T-I)/2` in order three. Direct permanent expansion gives

```math
\mathop{\mathrm{per}}(A+sJ_3)
=\frac29\left((1+s)^3+\frac38(1+s)-\frac14\right).
```
The derivative of the cubic inside the parentheses is `3(1+s)^2+3/8`, strictly positive for real `s`. Consequently this polynomial has exactly one real zero and two nonreal zeros. In particular, the one-parameter permanent interpolation is not itself a real-stable polynomial, even for a symmetric doubly stochastic matrix. Applying Newton inequalities to that interpolation would therefore be invalid.

This does not contradict stability of the multivariate operator symbol or the rook polynomial. Coefficient extraction there and the factorial transform here are different operations. Nor does it disprove Lih–Wang: in this example the desired inequality is an equality at `t=1/2`.

## Remaining gap in the capacity route

The capacity mechanism used in the proposed compound-root FPRAS supplies a lower bound on a central coefficient from the capacity of a stable polynomial. Lih–Wang requires an upper bound on the central coefficient after mixing `A` with `J_n`, in terms of two other central coefficients. No capacity comparison giving that direction has been established here.

A sufficient coefficientwise chord bound would be

```math
q_k\le 1+(k/n)(q_n-1),
```
but it already fails for the same order-three matrix: `q_2=q_3=9/8`, whereas its proposed right side at `k=2` is `13/12`. The weaker assertion that the whole sequence `q_k` increases is also unavailable in general: Holens–Djokovic monotonicity has known counterexamples.

The stable multivariate symbol therefore remains a possible source of additional inequalities, but ordinary real-rootedness, Gurvits's coefficient lower bound, and a coefficientwise chord estimate do not prove the required binomial average. A useful next lemma must control that average while retaining the row and column balance of `A`.

Source for the exact target and current status: https://yair-lavi.com/mincs-list/conjecture-34/index.html . The algebraic counterexamples to the intermediate claims above are independent calculations, not new counterexamples to the named conjecture.
