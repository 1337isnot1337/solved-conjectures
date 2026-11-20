# Coffey–Smith conjecture

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Exact named statement

Warren D. Smith's *A “good” problem equivalent to the Riemann hypothesis*, revised February 2005, [page 5](https://rangevoting.org/WarrenSmithPages/homepage/riemann2.pdf), explicitly names the **Coffey–Smith conjecture**.

Its coefficients are defined near zero by
\[
F(z)=\log\!\left(\frac{z}{1-z}
 \zeta\!\left(\frac1{1-z}\right)\right)
 =\sum_{n\ge1}c_nz^n,\qquad F(0)=0.
\]
The zero at \(z=0\) cancels the zeta pole, so the logarithm is well-defined as a germ.

For every \(\epsilon>0\), the conjecture asserts an upper bound
\[
|c_n|=O_\epsilon(n^{-1/2+\epsilon}),
\]
and also asserts that a positive fraction of positive integers satisfy
\[
c_n>n^{-1/2-\epsilon},
\]
with another positive fraction satisfying
\[
c_n<-n^{-1/2-\epsilon}.
\]

The last two clauses are part of Smith's displayed named conjecture, not an inference from the accompanying numerical plots. A screenshot of the original page was inspected to check this wording.

The weaker upper-bound conjecture in Coffey's separate paper is proved from accepted RH in [coffey.md](coffey.md). It must not be confused with this stronger statement.

## Result

The full Coffey–Smith conjecture is false.

The proof establishes the following conditional estimate, then handles the complementary case without RH.

**Theorem.** If RH holds, then
\[
\sum_{N\le n\le2N}|c_n|^2
 \ll N^{-1/2}\log^3(N+2)\qquad(N\ge2). \tag{1}
\]
Consequently, for every fixed \(0<\epsilon<1/4\),
\[
\#\{n\le X:|c_n|>n^{-1/2-\epsilon}\}
 \ll_\epsilon X^{1/2+2\epsilon}\log^3(X+2)
 =o(X). \tag{2}
\]
Thus even the union of the two proposed positive-fraction sets has natural density zero.

If RH fails, the conjecture's polynomial upper bound fails. These cases exhaust the possibilities, giving an unconditional refutation of the full named statement.

This does not assert that either sign occurs only finitely often above that scale. Infinite sets of density zero are compatible with (2). No claim about the exact pointwise order of \(c_n\), zero simplicity, independence of ordinates, or a numerical cutoff is used.

The written proof is complete; independent review and the prior-art audit are recorded below. Priority for the specific corollary remains unclaimed pending that audit.

## 1. The analytic branch and Fourier coefficients

Assume RH for sections 1–5. Put
\[
s(z)=\frac1{1-z},\qquad g(s)=(s-1)\zeta(s).
\]
The map \(s(z)\) sends the open unit disk onto \(\operatorname{Re}s>1/2\). The pole of \(\zeta\) at \(s=1\) is removed in \(g\), with \(g(1)=1\). RH implies that \(g\) is nonvanishing on this half-plane. It therefore has a unique analytic logarithm normalized to zero at \(s=1\). This is exactly the germ \(F\) continued to the disk.

All \(c_n\) are real, since \(F\) is real on a real interval about zero.

Arias de Reyna's **Theorem 6** proves that RH is equivalent to
\[
\sum_{n\ge1}|c_n|^2<\infty. \tag{3}
\]
His notation is \(A_n=c_n\); both are coefficients of
\(\log((s-1)\zeta(s))\) in powers of \(1-1/s\). Thus \(F\) belongs to the Hardy space \(H^2\) of the disk. Its radial boundary value exists in \(L^2\), and its imaginary part
\[
f(\theta)=\operatorname{Im}F(e^{i\theta}),
\qquad -\pi<\theta<\pi,
\]
has the \(L^2\) sine expansion
\[
f(\theta)=\sum_{n\ge1}c_n\sin(n\theta). \tag{4}
\]

This step is essential: merely knowing that some boundary expression is integrable does not by itself identify the Taylor coefficients of an arbitrary analytic function. The established \(H^2\) theorem supplies the identification.

Away from \(\theta=0\) and the countable set of mapped zero ordinates,
\[
s(e^{i\theta})=\frac12+\frac{i}{2}\cot(\theta/2).
\]
For \(0<\theta<\pi\), write
\[
t=t(\theta)=\frac12\cot(\theta/2)>0.
\]
On this part of the boundary,
\[
f(\theta)=\arg(-\tfrac12+it)+\pi S(t), \tag{5}
\]
where \(S(t)\) is the classical argument of \(\zeta(\tfrac12+it)\), divided by \(\pi\), obtained by continuation from \(2\) to \(2+it\) and then horizontally to \(\tfrac12+it\). The argument of \(-\tfrac12+it\) in (5) lies in \((\pi/2,\pi)\).

To check the branch, first work in \(\operatorname{Re}s>1\), where
\(\log g(s)=\log(s-1)+\log\zeta(s)\) with the usual Euler-product logarithm. Continue horizontally with \(t>0\); RH prevents zeros on the open path. This gives (5) with no undetermined multiple of \(2\pi\). As \(t\downarrow0\), the limiting \(-\pi\) in the continued \(\log\zeta\) cancels the \(+\pi\) argument of \(s-1\), consistently with the real value of \(F(-1)\).

Conjugation gives \(f(-\theta)=-f(\theta)\), and the endpoints \(-\pi,\pi\) fit periodically.

## 2. Size, derivative, and zero-count estimates

Let
\[
\vartheta(t)=
 \operatorname{Im}\log\Gamma(\tfrac14+\tfrac{it}{2})
 -\frac t2\log\pi
\]
be the continuously normalized Riemann–Siegel theta function. For \(t>0\) away from zero ordinates, the exact argument principle gives
\[
N(t)=1+\frac{\vartheta(t)}{\pi}+S(t). \tag{6}
\]
Here \(N(t)\) counts nontrivial zeros with \(0<\operatorname{Im}\rho\le t\), including multiplicity. The classical estimates are
\[
N(t)=\frac{t}{2\pi}\log\frac{t}{2\pi}
 -\frac{t}{2\pi}+O(\log(t+2)),
\qquad
S(t)=O(\log(t+2)), \tag{7}
\]
and
\[
\vartheta'(t)=O(\log(t+2)). \tag{8}
\]
The bounded-height portions can be included by enlarging constants. Equation (8) also follows directly from the digamma function and Stirling's formula.

By (5) and (7),
\[
|f(\theta)|\ll \log\frac{2}{|\theta|}
 \qquad(0<|\theta|\le\pi), \tag{9}
\]
where the expression on the right may harmlessly be replaced by
\(1+\log^+(1/|\theta|)\) to keep it positive over the entire circle.

Between consecutive mapped zero ordinates, \(N(t)\) is constant. Differentiating (6) there gives
\[
S'(t)=-\frac{\vartheta'(t)}{\pi}.
\]
Also
\[
|t'(\theta)|=\frac14\csc^2(\theta/2)\ll|\theta|^{-2},
\qquad
\left|\frac{d}{dt}\arg(-\tfrac12+it)\right|
 =\frac{1/2}{t^2+1/4}.
\]
Hence, on every interval avoiding mapped zeros,
\[
|f'(\theta)|\ll
 |\theta|^{-2}\left(1+\log^+\frac1{|\theta|}\right). \tag{10}
\]

The jumps of \(f\) at zeros are allowed. Formula (10) is applied only to intervals crossing no zero; no simplicity or lower bound on zero spacing is assumed.

For \(0<\delta<1/10\), every mapped zero angle with circular distance at least \(\delta\) from \(0\) has
\[
|\gamma|=\frac12|\cot(\theta_\gamma/2)|\ll\delta^{-1}.
\]
Therefore, with multiplicities included, there are at most
\[
O\!\left(\delta^{-1}\log\frac2\delta\right) \tag{11}
\]
such angles. Repeated zeros can only reduce the number of distinct neighborhoods required.

## 3. Translation modulus

For \(0<h<10^{-4}\), set
\[
\delta=\sqrt h,\qquad L=1+\log(1/\delta).
\]
All angles below are interpreted on the circle.

We estimate
\[
M(h)=\int_{-\pi}^{\pi}|f(\theta+h)-f(\theta)|^2\,d\theta. \tag{12}
\]

Split starting angles into three sets.

### The interval near the accumulation point

If the circular distance of \(\theta\) from \(0\) is at most \(2\delta\), then both endpoints lie within \(3\delta\) of \(0\), because \(h<\delta\). By (9),
\[
\int_{\operatorname{dist}(\theta,0)\le2\delta}
 |f(\theta+h)-f(\theta)|^2\,d\theta
 \ll \delta L^2. \tag{13}
\]
This follows from
\(\int_0^{3\delta}(1+\log(1/u))^2du\ll\delta L^2\), including the translated interval.

### Intervals crossing a zero

Now restrict to starting angles outside that central interval. Every path \([\theta,\theta+h]\) then remains at least \(\delta\) from \(0\).

The set of starting angles for which this path crosses a given zero angle has measure at most \(h\). Summing (11) over all zero angles that can occur gives total measure
\[
\ll h\delta^{-1}L. \tag{14}
\]
On this set, (9) bounds each endpoint by \(O(L)\), except at an irrelevant measure-zero set. Consequently its contribution to \(M(h)\) is
\[
\ll h\delta^{-1}L^3. \tag{15}
\]
This argument controls the whole connecting segment, not just its endpoints. It does not assume disjoint zero neighborhoods.

### Intervals crossing no zero

For all remaining starting angles, \(f\) is continuously differentiable on the path. Cauchy–Schwarz and then Fubini give
\[
\begin{aligned}
\int_{\rm good}|f(\theta+h)-f(\theta)|^2\,d\theta
&\le h\int_{\rm good}\int_\theta^{\theta+h}|f'(u)|^2\,du\,d\theta\\
&\le h^2\int_{\operatorname{dist}(u,0)\ge\delta}|f'(u)|^2\,du\\
&\ll h^2\delta^{-3}L^2.
\end{aligned} \tag{16}
\]
The last line uses (10) and
\[
\int_\delta^1 u^{-4}(1+\log(1/u))^2du\ll\delta^{-3}L^2.
\]
The possible derivative jumps form a null set. Since every retained path avoids them, the fundamental theorem of calculus used in the first line is valid.

Combining (13), (15), and (16), with \(\delta=\sqrt h\), gives
\[
\boxed{\quad M(h)\ll \sqrt h\,(1+\log(1/h))^3.\quad} \tag{17}
\]

## 4. Parseval and the dyadic estimate

From the \(L^2\) sine expansion (4), Parseval gives
\[
M(h)=\pi\sum_{n\ge1}|c_n|^2|e^{inh}-1|^2. \tag{18}
\]
For an integer \(N\ge2\), set \(h=1/N\). Whenever \(N\le n\le2N\), the number \(nh\) lies in \([1,2]\), so
\[
|e^{inh}-1|^2=4\sin^2(nh/2)\ge4\sin^2(1/2)>0.
\]
Thus (17)–(18) prove
\[
\sum_{N\le n\le2N}|c_n|^2
 \ll N^{-1/2}\log^3(N+2),
\]
after absorbing finitely many small \(N\) in the constant. This is (1).

An equivalent useful consequence is
\[
\sum_{n\ge1}n^{2\alpha}|c_n|^2<\infty
 \qquad\text{for every }0\le\alpha<1/4, \tag{19}
\]
obtained by summing over dyadic blocks. The proof does not claim the endpoint \(\alpha=1/4\).

## 5. Density-zero consequence

Fix \(0<\epsilon<1/4\). For \(N\le n\le2N\), the condition
\[
|c_n|>n^{-1/2-\epsilon}
\]
implies
\[
|c_n|^2>(2N)^{-1-2\epsilon}.
\]
Equation (1) therefore gives
\[
\#\{N\le n\le2N:|c_n|>n^{-1/2-\epsilon}\}
 \ll_\epsilon N^{1/2+2\epsilon}\log^3(N+2). \tag{20}
\]
Summing dyadically up to \(X\) gives (2). Because \(1/2+2\epsilon<1\), dividing by \(X\) makes the right side tend to zero.

Both signed sets in the conjecture are subsets of this density-zero set. Their upper natural densities are therefore zero. In particular, no interpretation as positive lower density, positive natural density, or positive upper density can rescue the conjecture's positive-fraction clauses.

## 6. Complementary case without RH

Suppose the polynomial upper bound in the conjecture holds. Even one fixed exponent bound
\[
|c_n|\ll n^A
\]
would imply that the Taylor series for \(F\) converges and is holomorphic throughout \(|z|<1\).

The function
\[
g(s(z))=(s(z)-1)\zeta(s(z))
\]
is holomorphic in the disk. Near zero it equals \(e^{F(z)}\), so the identity theorem gives
\[
g(s(z))=e^{F(z)}\qquad(|z|<1).
\]
The exponential never vanishes. Hence \(\zeta(s)\) has no zero with \(\operatorname{Re}s>1/2\). By the functional equation and zero symmetry, this implies RH.

Equivalently, if RH fails, a zero \(\rho\) with \(\operatorname{Re}\rho>1/2\) maps to
\[
z_\rho=1-\rho^{-1},\qquad |z_\rho|<1,
\]
contradicting the polynomial upper bound.

Thus the full Coffey–Smith statement is false if RH is false, while sections 1–5 prove it false if RH is true. The refutation is unconditional.

## 7. Sources and prior-art audit

### Exact primary sources used

- **W. D. Smith**, *A “good” problem equivalent to the Riemann hypothesis*, February 2005 revision, [author PDF](https://rangevoting.org/WarrenSmithPages/homepage/riemann2.pdf). The definition is on page 1; the named conjecture, including both positive-fraction clauses, is on page 5. The original page was inspected visually.
- **M. W. Coffey**, *Polygamma theory, the Li/Keiper constants, and validity of the Riemann Hypothesis*, [arXiv:math-ph/0507042](https://arxiv.org/pdf/math-ph/0507042), equation (37). Its upper-bound conjecture is weaker and remains consistent with the present result.
- **J. Arias de Reyna**, *Asymptotics of Keiper–Li coefficients*, *Functiones et Approximatio* **45** (2011), 7–21, [author PDF](https://personal.us.es/arias/56-2RHB.pdf), [DOI](https://doi.org/10.7169/facm/1317045228). Theorem 6 supplies the exact \(H^2\) coefficient statement. Its proof already uses Fourier coefficients of a zero-count discrepancy after a cotangent change of variable. The present argument builds on that classical representation.
- **J. C. Lagarias**, *Li coefficients for automorphic L-functions*, *Annales de l'Institut Fourier* **57** (2007), 1689–1740, [published record](https://www.numdam.org/articles/10.5802/aif.2311/), [arXiv](https://arxiv.org/pdf/math/0404394). Theorem 6.1 supplies the older pointwise \(O(\log n/\sqrt n)\) coefficient bound under RH. This alone does not disprove Smith's lower-density clauses.
- The argument-principle formula for \(N(t)\), its \(O(\log t)\) remainder, and the classical normalization of \(S(t)\) are the standard Riemann–von Mangoldt formulas also used in the above primary papers. The theta derivative estimate follows from its displayed gamma definition.

### Current search coverage

Searches through 20 November 2026 used the exact name with hyphen and en dash, the exact coefficient definition, and combinations with “proof,” “counterexample,” “disproof,” “positive fraction,” “mean square,” “Sobolev,” “Keiper,” “Li coefficients,” and “quasi-Riemann.”

The checked material includes the original Smith and Coffey papers, Lagarias's published theorem, Arias de Reyna's full 2011 paper, Voros's asymptotic work, Mazhouda's 2011 saddle-point theorem, current indexed 2026 RH research ledgers, and the [164-page October QRH application inventory](https://hexagonmath.org/pdf/2610.00178v1). The inventory contains no “Coffey,” “Keiper,” or “Li coefficient” match.

No retrieved primary source states the specific dyadic estimate (1), the density-zero conclusion (2), or a prior resolution of the full named Coffey–Smith conjecture. The representation, argument-principle bounds, Fourier analysis, and \(H^2\) theorem are established material; their authors retain credit. The potentially new contribution is the density-zero corollary and its application to Smith's explicit conjecture. Search silence does not prove priority.

Nearby conjectures excluded from this search include Farmer–Rhoades derivative asymptotics (Coffey 2008/2009), Csordas–Dimitrov kernel concavity (public 2026 proofs), and Zhu's xi-coefficient infinite log-concavity (public October 2026 proof).

## Review status

Detailed proof committed for independent scrutiny. Review must check the exact analytic branch in (5), the periodic endpoint at \(\pi\), the treatment of intervals crossing zeros, the Parseval normalization, the full original positive-fraction clause, and the complementary no-RH argument.

This note does not claim that internal review is external peer review or formal verification.
