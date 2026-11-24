# Borcea's mean-deviation conjecture near a geometric median

**Status:** a sharp-constant result for a restricted, degree-dependent regime, not a resolution of the full conjecture. The result is invariant under translations and rescalings, holds without restrictions on multiplicities or angles, and improves the elementary product test's near-median scale from \((\log n)/n\) to \(\sqrt{(\log n)/n}\).

Let \(P\) have degree \(n\ge3\) and roots \(z_i\) counted with multiplicity. Write
\[
\sigma_1=\min_{c\in\mathbb C}\frac1n\sum_i |z_i-c|.
\]
For a chosen root \(a_0\) and any geometric median \(c\), if \(\sigma_1>0\) put \(a=|a_0-c|/\sigma_1\). If
\[
 a\le\frac14,\qquad
 1+(4-2\sqrt3)(n-1)a^2\le\log n,
 \tag{1}
\]
then \(P'\) has a zero within distance \(\sigma_1\) of \(a_0\). A stronger angle-sensitive condition is derived below.

The case \(\sigma_1=0\), or a multiple \(a_0\), is immediate. If \(a=0\), the result follows from the product estimate below by direct \(\log r\le r-1\); for \(n=2\) it follows exactly from the midpoint formula. For the rest, rotate, translate and scale so that \(c=0,\sigma_1=1,z_1=a>0\). Thus \(\sum_i |z_i|=n\). The subgradient condition for a geometric median gives vectors \(v_i=z_i/|z_i|\) at nonzero roots, with choices \(|v_i|\le1\) at zero roots, satisfying \(\sum_i v_i=0\). Put \(u_i=\Re v_i\); then \(u_i\in[-1,1]\), \(u_1=1\), and \(\sum_{i\ne1}u_i=-1\).

## Scalar estimate

For \(r\ge0\), \(u\in[-1,1]\), \(0<a\le1/4\), set \(b^2=a^2(1-u^2)\) and \(s=r-au\). Then
\[
 \tfrac12\log(r^2-2aur+a^2)
 \le r-1-au+\frac{2b^2}{2+\sqrt{4-16b^2}}
 \le r-1-au+(4-2\sqrt3)b^2.
 \tag{2}
\]
Indeed, the excess over \(r-1-au=s-1\) equals
\[
F(s)=\tfrac12\log(s^2+b^2)-s+1,\qquad s\ge -au .
\]
At the left endpoint its value is \(\log a+1+au\le\log(1/4)+5/4<0\). For example, \(\log 2\ge 2/3\) by the tangent-line bound for the integral of \(1/x\) on \([1,2]\). The only possible interior finite local maximum occurs at \(s_+=(1+\sqrt{1-4b^2})/2\): for \(b>0\), this follows from the signs of \(F'(s)=s/(s^2+b^2)-1\); for \(b=0\), check on either side of the logarithmic singularity at zero. That maximum is nonnegative because \(F(1)\ge0\). With \(t=1-s_+\), the identity \(s_+^2+b^2=s_+\) gives
\[
 F(s_+)=t+\tfrac12\log(1-t)\le \tfrac12t
       =\frac{b^2}{2s_+}.
\]
This is the first error term in (2) in its equivalent form \(b^2/(1+\sqrt{1-4b^2})\). Finally \(s_+\ge(2+\sqrt3)/4\), giving the second error term.

## Product and sharp conclusion

Apply (2) to \(r_i=|z_i|\) and \(u_i\) for each \(i\ne1\). The identity \(|z_i-a|^2=r_i^2-2au_i r_i+a^2\) also holds for the subgradient choices at the zero roots. Since \(\sum_{i\ne1}r_i=n-a\) and \(\sum_{i\ne1}u_i=-1\), the linear terms total exactly \(1\), and
\[
 \log\prod_{i\ne1}|z_i-a|
 \le 1+(4-2\sqrt3)a^2\sum_{i\ne1}(1-u_i^2).
 \tag{3}
\]
In particular, either (1) or the sharper condition with \(\sum_{i\ne1}(1-u_i^2)\) replacing \(n-1\) gives \(\prod_{i\ne1}|z_i-a|\le n\). For \(a=0\) the same bound follows from \(\sum_{i\ne1}\log|z_i|\le \sum_{i\ne1}(|z_i|-1)=1\). As \(P(a)=0\) is simple, the well-known identity
\[
 \prod_{i\ne1}|z_i-a|=n\prod_{P'(\zeta)=0}|\zeta-a|
\]
then forces at least one derivative zero at distance at most one, as claimed.

## Provenance and limitations

The primary formulation is Conjecture 1 (\(p=1\)) in
[Khavinson, Pereira, Putinar, Saff and Shimorin, *Borcea's variance conjectures on the critical points of polynomials*, arXiv:1010.5167](https://arxiv.org/abs/1010.5167).
The same source §2 discusses and uses the derivative-product identity. An arithmetical-geometric mean estimate from that identity, without using the geometric-median subgradient, gives the weaker range
\[
 (n-1)\log\!\left(1+\frac{1+(n-2)a}{n-1}\right)\le\log n .
\]
The first-order angular cancellation in (3) is the additional input. The recent [quadratic proof of Bouthat and Fallat](https://arxiv.org/abs/2610.12499) has a similar-looking \(\sqrt{(\log n)/n}\) threshold, but uses squared moment normalization and the arithmetic centroid, not the mean absolute moment and a geometric median. Neither result implies the other statement about hypothetical counterexamples at these normalized distances. Focused title, phrase, and recent citation searches did not locate (3) or the same near-median result; priority is not guaranteed.
