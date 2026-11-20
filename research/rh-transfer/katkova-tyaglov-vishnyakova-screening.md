# Katkova–Tyaglov–Vishnyakova screening

Status: excluded from the unresolved-conjecture count.

Audit date: 20 November 2026.

## Source and exact scope

Olga Katkova, Mikhail Tyaglov and Anna Vishnyakova, *Hermite-Poulain theorems for linear finite difference operators*, arXiv:1901.06398v1 (18 January 2019), later *Constructive Approximation* 52 (2020), 357–393, DOI [10.1007/s00365-020-09507-0](https://doi.org/10.1007/s00365-020-09507-0).

The [original arXiv HTML](https://arxiv.org/html/1901.06398v1) and the [author-uploaded manuscript](https://www.researchgate.net/publication/341327911_Hermite-Poulain_Theorems_for_Linear_Finite_Difference_Operators) were read at equation (1.5) and Section 7. The operator is

\[
\Delta_{\theta,h}p(z)
=\frac{e^{i\theta}p(z+ih)-e^{-i\theta}p(z-ih)}{2i},
\qquad 0\leq\theta<\pi.
\]

For the examples below \(h\) is positive real, so no complex-step interpretation is needed. Conjecture 1 asserts that a Hurwitz-stable input has no nonreal roots in the closed right half-plane after any iterate \(m=1,\ldots,\deg p-1\). Conjecture 4 proposes zero-strip decrease on complex polynomials.

The 2020 publisher landing page confirms the bibliographic details. The full version of record was not retrieved; no claim of a separate full publisher-PDF inspection is made.

## Conjecture 1: prior exact disproof

A [MathDB solution by Shivam Patel](https://mathdb.com/p/381441/the-finite-difference-stability-conjecture-for-stable-polyno), shown as posted about two months before this audit, already gives

\[
p(z)=z^2+2z+10=(z+1)^2+9,\qquad h=2,\qquad\theta=3\pi/4.
\]

The input roots are \(-1\pm3i\). Direct expansion yields

\[
\Delta_{3\pi/4,2}p(z)=\frac{z^2-2z+2}{\sqrt2},
\]

with roots \(1\pm i\). The permitted first iterate therefore refutes the full conjecture.

The site's progress label calls the calculation unverified. That label does not create an unresolved problem: the displayed identity and root locations can be checked exactly, and they are correct. This is an earlier public disproof, so the target fails the user's unresolved-status rule.

### Independent rediscovery during this screening

Before locating the prior post, we obtained

\[
p(z)=z^3+z^2+4z+3,\qquad
\Delta_{\pi/2,1}p(z)=z^3+z^2+z+2=:q(z).
\]

This can be checked without a numerical root calculation or the Routh–Hurwitz criterion. Both derivatives are positive on the real axis:

\[
p'(x)=3(x+1/3)^2+11/3,\qquad
q'(x)=3(x+1/3)^2+2/3.
\]

Thus each cubic has exactly one real root and one nonreal conjugate pair. Since \(p(-1)=-1<0<p(0)\), its real root \(r\) lies in \((-1,0)\). The other two roots have common real part \((-1-r)/2<0\), so \(p\) is strictly Hurwitz stable.

Since \(q(-2)=-4<0<q(-1)=1\), its real root \(s\) lies in \((-2,-1)\). The conjugate pair has common real part \((-1-s)/2>0\). This is another exact counterexample, but it does not constitute a new resolution.

## Conjecture 4: prior counterexample to uniform decrease

The same author has a [prior MathDB solution](https://mathdb.com/p/341608/the-zero-strip-decreasing-conjecture-for-complex-finite-diff), shown as posted about one month before this audit. It distinguishes the uniform definition used by Cardon from strict contraction for one input polynomial.

For a fixed \(r>0\), use \(\theta=\pi/2,\ h=1\), and

\[
f_R(z)=z^2-(R+ir)^2,\qquad R>0.
\]

The input roots attain both boundaries of \(|\operatorname{Im}z|\leq r\), and their barycenter is zero. The output is

\[
\Delta_{\pi/2,1}f_R(z)=z^2-(R+ir)^2-1.
\]

Write its roots as \(\pm(u_R+iv_R)\), with \(u_R,v_R>0\). Equating real and imaginary parts and eliminating \(u_R\) gives

\[
v_R^4+(R^2-r^2+1)v_R^2-R^2r^2=0
\]

and hence

\[
(r^2-v_R^2)(R^2+v_R^2+1)=r^2.
\]

Consequently \(0<v_R<r\) and \(v_R\to r\). No single smaller radius works for all these inputs. This verifies the posted obstruction to the uniform formulation.

This does not refute the different, nonuniform statement that every individual minimal strip of positive width becomes strictly narrower. The prior post also supplies its elementary factor-modulus proof. The distinction was already public before this screening; neither interpretation is counted as a new result here.

## Conjecture 3: prior generic argument and exceptional-set counterexample

A [third prior MathDB post](https://mathdb.com/p/341607/the-simple-roots-conjecture-for-finite-difference-operators) already explains generic simplicity via a nonzero discriminant polynomial and refutes the proposed exceptional-input description using

\[
p(z)=z^3+z,\qquad
\Delta_{0,1}p(z)=3z^2.
\]

The input has three distinct roots while the output has a repeated root. We do not reopen or count that statement.

## Audit conclusion

The search used the original title, arXiv identifier, all author names, exact conjecture phrases, Hurwitz stability, right-half-plane zeros, finite differences, counterexamples and corrections. Both search engines were used. Author publication records, the 2020 publisher record and recent public solution indexes were checked. The decisive sources were the actual previously posted arguments, not their database status labels.

These are exclusions. No new theorem, priority claim or additional completed-conjecture count is assigned. No accepted RH or GRH assumption is used.
