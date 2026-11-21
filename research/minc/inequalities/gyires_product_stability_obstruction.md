# The two-step permanent polynomial need not be stable

Research note, 20 November 2026 (America/Chicago). This is an exact obstruction to a proposed proof of the stronger Gram form of Gyires's inequality. It is not a counterexample to that inequality or another resolved Minc entry.

## The proposed route

For two doubly stochastic matrices `A,B` of order `n`, the normalized product inequality is

\[
\frac{n!}{n^n}\operatorname{per}(AB)
\le \operatorname{per}(A)\operatorname{per}(B).
\]

For a fixed order, validity for every `A,B` is equivalent to validity of the stronger Gram inequality for every doubly stochastic matrix. One implication sets `B=A^T`. The other uses the Fischer-space identity

\[
\operatorname{per}(AB)=\langle q_A,q_{B^T}\rangle_F
\le\sqrt{\operatorname{per}(AA^T)\operatorname{per}(B^TB)},
\]

where `q_A` is the product of the row linear forms. This is the usual permanent Cauchy--Schwarz identity, not a new inequality.

The polynomial

\[
F(x)=\operatorname{per}(A\operatorname{diag}(x)B)
\]

has nonnegative coefficients and satisfies

\[
F(\mathbf1)=\operatorname{per}(AB),\qquad
[x_1\cdots x_n]F=\operatorname{per}(A)\operatorname{per}(B).
\]

The coefficient identity selects exactly the terms whose intermediate labels are all distinct. It therefore expresses the desired inequality as a lower bound on a conditional distinct-label probability. Applying a stable-polynomial coefficient theorem to `F` would require establishing its stability and an appropriate capacity bound. Stability already fails.

## Exact obstruction

Take

\[
A=\frac12\begin{pmatrix}
1&1&0&0\\1&1&0&0\\0&0&1&1\\0&0&1&1
\end{pmatrix},\qquad
B=\frac12\begin{pmatrix}
1&0&1&0\\0&1&0&1\\1&0&1&0\\0&1&0&1
\end{pmatrix}.
\]

Both matrices are doubly stochastic and `AB=J_4/4`, with `J_4` the all-ones matrix. Direct expansion gives

\[
F(x)=\frac{x_1^2x_4^2+4x_1x_2x_3x_4+x_2^2x_3^2}{64}.
\]

Equivalently, writing `c=2+sqrt(3)` and `c^{-1}=2-sqrt(3)`,

\[
64F(x)=(x_1x_4+c x_2x_3)(x_1x_4+c^{-1}x_2x_3).
\]

Set

\[
x_1=c(-1+i),\quad x_2=x_3=1+i,\quad x_4=-1+i.
\]

Every variable has strictly positive imaginary part. But `x_1x_4=-2ci` and `x_2x_3=2i`, so the first factor vanishes. Thus `F` is not real stable.

This example satisfies the desired scalar inequality strictly:

\[
\operatorname{per}(A)=\operatorname{per}(B)=\frac14,
\qquad \operatorname{per}(AB)=\frac3{32},
\qquad
\frac{3}{32}\operatorname{per}(AB)=\frac9{1024}<\frac1{16}.
\]

It only excludes the asserted automatic stability of the two-step polynomial. Ordinary products of nonnegative linear forms are stable; the intermediate-label coefficient contraction used to form `F` is an additional operation and cannot be presumed to preserve stability.

The matrix product, full polynomial expansion, and displayed upper-half-plane zero were independently checked by exact symbolic arithmetic. The calculation itself supplies an exact finite counterexample to the auxiliary stability claim. No historical-priority claim is made for this obstruction.

## Capacity need not equal the value at one

The doubly stochastic conditions on `A,B` also do not force the intermediate occupation vector to have mean `(1,...,1)`. This fails even when `B=A^T`.

Take

\[
A=\begin{pmatrix}
1/2&1/2&0\\
1/4&0&3/4\\
1/4&1/2&1/4
\end{pmatrix},\qquad B=A^T.
\]

Both are doubly stochastic. Exact expansion gives

\[
512F(x)=3x_1^3+9x_1^2x_2+16x_1^2x_3
+4x_1x_2^2+50x_1x_2x_3+9x_1x_3^2
+36x_2^2x_3+9x_2x_3^2.
\]

Consequently,

\[
F(\mathbf1)=\frac{17}{64}=\frac{68}{256},\qquad
\nabla F(\mathbf1)=\frac1{256}(61,74,69).
\]

For the usual capacity

\[
\operatorname{cap}(F)=\inf_{x>0}\frac{F(x)}{x_1x_2x_3},
\]

consider `x=(e^t,e^{-t},1)`. Its coordinate product is one, and

\[
\left.\frac{d}{dt}F(e^t,e^{-t},1)\right|_{t=0}
=-\frac{13}{256}<0.
\]

Thus `cap(F)<F(1)`. Normalizing `F` by its value at one does not make it a doubly stochastic polynomial. Here `per(A)=5/16`, so the desired scalar product inequality still holds; this is an obstruction to the capacity identification only. The full expansion, permanent, and gradient were checked by exact symbolic arithmetic.

The original target and current status are recorded at https://yair-lavi.com/mincs-list/conjecture-20/index.html . The interior reduction and the remaining boundary gap are in [gyires_interior_reduction.md](gyires_interior_reduction.md).
