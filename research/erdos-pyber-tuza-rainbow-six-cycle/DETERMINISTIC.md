# Deterministic reduction for the rainbow-cycle graphon criterion

**Reduction.** To prove the [parity classification for balanced six-color graphons](GRAPHON-CRITERION.md), it suffices to prove it when each pair has exactly one color (all color kernels are indicators). An arbitrary fractional counterexample would give an indicator-valued counterexample which moreover is invariant under a simultaneous circle translation in its extra coordinate. This is not an equivalence with the existence of finite counterexamples.

## Color refinement without creating a forbidden pattern

Let \(W_1,\ldots,W_6\) be symmetric \([0,1]\)-valued balanced kernels on a standard atomless probability space \(X\), with row degree \(1/6\) and sum one. For each base pair \((x,y)\), partition the circle \(\mathbb T\) into six measurable symmetric sets \(I_i(x,y)\) of Haar masses \(W_i(x,y)\), assigning boundary ties deterministically. For example, the function \(2\,\operatorname{dist}(z,0)\) is uniformly distributed on \([0,1]\); partition its range at the partial sums of the \(W_i(x,y)\). Let
\[
U_i((x,a),(y,b))=\mathbf1_{\{a-b\in I_i(x,y)\}}.
\]
Then \(U_i\) are symmetric indicator kernels on \(X\times\mathbb T\), and \(\sum_i U_i=1\) almost everywhere. For fixed \(a\), the integral in \(b\) of each \(U_i\) is \(W_i(x,y)\), so each row remains balanced. Simultaneous translations \(a\mapsto a+h,b\mapsto b+h\) preserve every color.

For any finite colored simple graph, a positive product of the \(U\)-colors almost everywhere implies that the projected base pair weight of every prescribed \(W\)-color is positive. Equivalently, if its density in \(W\) is zero, then its density in \(U\) is zero: the base tuples allowing all positive edge weights form a null set, and their pullback remains null. This applies to each rainbow order on a six-cycle, and also to rooted densities for almost every base root. It does not claim equality of the densities.

## Parity descends from the refinement

Suppose \(U\) has an exact parity cut. Let \(\sigma(x,a)\in\{-1,1\}\) be its sign function and choose the palette of three crossing colors. For almost all \(x,y\), its crossing indicator is a function of \(a-b\) alone. Consequently
\[
\sigma(x,a)\sigma(y,b)=G_{x,y}(a-b)
\quad\text{for almost all }(a,b)
\]
for a measurable real sign function \(G_{x,y}\). The two-variable Fourier transform of the right side is supported on pairs \((m,n)\) with \(m+n=0\). The transform of the left side is the product of the one-variable Fourier coefficients of \(\sigma(x,\cdot)\) and \(\sigma(y,\cdot)\). Both rows have norm one. Thus each has Fourier support at exactly one frequency: pick a nonzero coefficient from one row and all coefficients of the other must lie at its negative, and then repeat in the other direction. The rows are real, so the only possible single frequency is zero. By Fubini almost every row \(\sigma(x,\cdot)\) is constant. The refined cut therefore comes from a measurable cut in \(X\). Integrating in \(a,b\) shows the same palettes give an exact parity cut for \(W\).

So if a fractional graphon has zero rainbow six-cycle density and no parity cut, its ordinary indicator refinement has both those properties. The unproved part of the criterion is now purely about complete deterministic color partitions.

## Consequence for a globally missing triangle color

The [exceptional-color classification](MISSING-TRIANGLE-COLOR.md) shows that an indicator-valued balanced six-coloring in which one color is absent from all positive-density rainbow triangles must contain a positive-density rainbow six-cycle. The refinement preserves both putative zero-density statements. Therefore the same conclusion holds for **every fractional balanced graphon**, with no purity or connectedness assumption. In particular, any zero-rainbow-six-cycle graphon has a positive-density rainbow triangle using each of its six colors. This does not require each color to occur at every root and does not resolve the complementary-palette obstruction.

The construction only uses conditional Haar measure and the elementary Fourier structure of the circle. Checked against the [original problem source](https://doi.org/10.1016/S0167-5060(08)70377-7), [decorated graphon limits](https://arxiv.org/abs/1010.5155), the [modern balanced-coloring paper](https://arxiv.org/abs/2209.13867), and [the public working report](https://www.erdosproblemaday.com/report/811). The claim is the reduction with descent of the specific parity obstruction, not priority for randomization or Fourier disintegration. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
