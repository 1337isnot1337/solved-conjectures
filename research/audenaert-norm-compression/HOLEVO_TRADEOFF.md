# The exact row and column entropy tradeoff

Research toward [Audenaert’s conjecture, issue 213](https://github.com/1337isnot1337/solved-conjectures/issues/213). The identities here restate the unresolved derivative inequality from `ENTROPY_DERIVATIVE.md`; they do not prove it. The row-and-column decomposition was supplied by the independent root review.

## 1. Two contributions to the entropy loss

Keep the normalization and notation of the derivative note. Let `T_i` be row `i`, let

```math
a_i=\|T_i\|_2^2=\sum_jw_{ij},\qquad
\tau_i=\frac{T_i^*T_i}{a_i},\qquad
p_{ij}=\frac{w_{ij}}{a_i}.
```

Omit zero rows and zero weights. For an ensemble of density matrices define its Holevo quantity by

```math
\chi(\{p_k,R_k\})
=S\left(\sum_kp_kR_k\right)-\sum_kp_kS(R_k).
```

The nonzero spectra of `T_i*T_i` and `T_iT_i*` agree, and

```math
T^*T=\sum_i a_i\tau_i,
\qquad
\frac{T_iT_i^*}{a_i}=\sum_jp_{ij}\rho_{ij}.
```

It follows exactly that

```math
S(TT^*)-\sum_{i,j}w_{ij}S(\rho_{ij})
=\chi(\{a_i,\tau_i\})
 +\sum_i a_i\chi(\{p_{ij},\rho_{ij}\}_j).
\tag{1}
```

Both terms are nonnegative by ordinary entropy concavity. The first measures distinguishability of the two row states on the common column space. The second is the average distinguishability of the column-conditioned states within each row. The states in the second ensembles need not act on the same space for different rows; each Holevo quantity is evaluated on its own row space.

If both row masses are positive, put

```math
c=\sum_j\sqrt{p_{0j}p_{1j}}.
```

Then

```math
BB^*=\begin{pmatrix}
a_0&\sqrt{a_0a_1}\,c
\\ \sqrt{a_0a_1}\,c&a_1
\end{pmatrix},\qquad a_0+a_1=1.
```

Equivalently, this is the Gram matrix of a binary ensemble of pure states with probabilities `a_0,a_1` and overlap `c`. Its entropy is

```math
h\left(\frac{1+\sqrt{1-4a_0a_1(1-c^2)}}2\right),
\qquad h(x)=-x\log x-(1-x)\log(1-x).
\tag{2}
```

The exact missing inequality is that (1) is at least (2). When a row mass vanishes, the scalar entropy is zero and ordinary concavity already suffices.

## 2. Neither Holevo contribution suffices separately

For the first contribution, take `a_0=a_1=1/2` and, on a two-dimensional column space,

```math
\tau_0=\mathop{\mathrm{diag}}((1+t)/2,(1-t)/2),\qquad
\tau_1=\mathop{\mathrm{diag}}((1-t)/2,(1+t)/2),
\qquad 0\lt t<1.
```

Use the two coordinate column blocks. These states are realized by taking `T_i=sqrt(a_i tau_i)`. Their row Holevo quantity is

```math
\log2-h((1+t)/2)=\frac{t^2}{2}+O(t^4).
```

Here `c=sqrt(1-t^2)`, so the scalar entropy is

```math
h\left(\frac{1+\sqrt{1-t^2}}2\right)
=\frac{t^2}{4}\log\frac{4e}{t^2}
 +O(t^4\log(1/t)).
```

The scalar entropy is therefore strictly larger than the row Holevo quantity for every sufficiently small positive `t`. The omitted internal column quantities are essential. In this example the conditional states are pure coordinate states, so the full left side of (1) is `log 2` and the desired inequality is satisfied.

Conversely, make each `T_i` a scalar row vector and choose their normalized squared entries to have distinct distributions. Every conditional state within a row is the same one-dimensional density matrix, so the internal column Holevo quantities vanish. The scalar Gram has positive entropy if the two distributions are distinct. The row contribution is then essential. This is inside the already-known rank-one-block case.

## 3. A second elementary lower bound is still insufficient

Besides the weighted-block-entropy bound, one always has

```math
S(TT^*)\ge S(BB^*).
\tag{3}
```

For a vector partitioned by the column spaces, apply the triangle inequality in each row and bound each block’s operator norm by its Frobenius norm. This proves

```math
\|T\|_{\mathrm{op}}\le\|B\|_{\mathrm{op}}.
```

Both Grams have trace one, and `BB*` has at most two nonzero eigenvalues. Thus its eigenvalue vector majorizes that of `TT*`: the first partial-sum inequality is the operator-norm bound, and every partial sum of length at least two is bounded by the common trace one. Entropy Schur concavity gives (3).

This rank-two majorization is also the mechanism behind the binary classical-quantum one-copy result in Negari–Baghali Khanian, [arXiv:2608.28897v1, Appendix B](https://arxiv.org/html/2608.28897v1). That result does not add the average conditional block entropy to (3). The two separately valid lower bounds cannot be added without another argument.

The same authors’ later [Werner-state nonadditivity paper, arXiv:2610.03630v1, Section V](https://arxiv.org/html/2610.03630v1), explicitly distinguishes its nonclassical two-qubit family from classical two-qubit states and leaves the latter von Neumann additivity question open. Its result does not resolve this tradeoff.

## 4. What a column-aware method must control

Write `A=[A_1 ... A_N]`, `D=[B_1 ... B_N]`, `Q=A*A`, and `R=D*D`. For `q=p/2`, the full norm is determined by `Tr(Q+R)^q`, whereas the compressed two-by-two Gram is determined by the three numbers

```math
\alpha=\sum_j\|Q_{jj}\|_q,\qquad
\beta=\sum_j\|R_{jj}\|_q,\qquad
\gamma=\sum_j\sqrt{\|Q_{jj}\|_q\|R_{jj}\|_q}.
```

A joint tracial measure for the pair `(Q,R)` controls traces of functions of their linear combinations. It does not retain the designated column projections or determine these projected block norms. The exact row-pencil example in `HANNER_ROUTE.md` already proves this data loss. Separate measures for the individual columns do not supply a common coupling that preserves the off-diagonal coherence of `Q+R`.

A method based on this representation must therefore establish an additional comparison involving the column projections, or prove the entropy tradeoff (1)–(2) directly. No such comparison is proved here. No numerical search or bounded family is being substituted for it.
