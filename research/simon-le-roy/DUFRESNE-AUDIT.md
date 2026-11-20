# Dufresne source and prior-resolution audit

Date: 2026-11-20. Research issue: [#104](https://github.com/1337isnot1337/solved-conjectures/issues/104).

## Conclusion and attribution

The exact interval in [EXPLICIT_PROOF.md](EXPLICIT_PROOF.md) is an application of Dufresne's published gamma-ratio construction. The construction, the infinite product, and the existence of gamma-ratio laws with logarithms that are not infinitely divisible are not new.

This audit found no earlier explicit instance with numerator parameters $(1/3,2/3,1)$ and repeated denominator parameter $\beta$ that gives the counterexample interval
```math
\frac{13}{30}\leq\beta<
\beta_1:=\frac{1+\log(32/21)/\log4}{3}.
```
It also found no earlier disproof of Simon's complete-monotonicity equivalence. This is a bounded literature finding, not a proof of worldwide priority. The inaccessible 1999 paper is a stated limitation below. The possible contribution is the exact specialization and its application to Simon's later conjecture.

## 1. The classical construction

Daniel Dufresne, *G distributions and the beta-gamma algebra*, Electronic Journal of Probability 15 (2010), paper 71, 2163–2199.

- [Full publisher-mirror PDF](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/845/845-2871-1-PB.pdf)
- [Alternate EMIS copy](https://emis.de/ft/42731)
- [Article landing page](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/view/845/1065.html)

Theorem 6.3, printed pages 2187–2188, has an explicit converse. For equal-length parameter lists, independent nonnegative variables with Laplace transforms
```math
\mathbb E e^{-sY_j}
 =\prod_{\ell=1}^{N}
 \frac{(a_\ell+j)(b_\ell+j+s)}
 {(b_\ell+j)(a_\ell+j+s)}
```
give $U=\exp(-\sum_{j\geq0}Y_j)$ with
```math
\mathbb E U^s=\frac{\prod_\ell(a_\ell)_s}{\prod_\ell(b_\ell)_s}.
```
The forward statement additionally assumes the gamma-ratio law exists and that the normalized rational quotient is a probability Laplace transform. The converse supplies the needed existence theorem; there is no circular existence assumption in the present application.

Theorem 6.1(c), printed page 2184, imposes its total parameter-sum condition only when the numerator and denominator lists have equal lengths.

Example 2, printed page 2195, constructs a different balanced law with numerator parameters $(1,2,3)$ and three distinct denominator parameters, approximately $(1.0120,1.8659,3.8871)$. Its logarithm is not infinitely divisible. That example already disproves the unrestricted equivalence between gamma-ratio existence and logarithmic infinite divisibility. It does not state the Le Roy specialization used here.

## 2. Exact specialization found during this audit

Write $c=13/30$ and
```math
R(s)=\frac{(s+c)^2(s+2)}
{(s+1/3)(s+2/3)(s+1)}.
```
Direct rational arithmetic gives
```math
R(s)=1+\frac{3/40}{s+1/3}
       -\frac{49/75}{s+2/3}
       +\frac{289/200}{s+1},\qquad
R(0)=\frac{169}{100}.
```
Thus $R(s)/R(0)$ is the Laplace transform of
```math
\mu(dx)=\frac{100}{169}
\left[\delta_0(dx)+
e^{-x/3}\left(\frac3{40}-\frac{49}{75}e^{-x/3}
+\frac{289}{200}e^{-2x/3}\right)\mathbf 1_{x>0}\,dx\right].
```
The quadratic in $e^{-x/3}$ has positive leading coefficient and discriminant
```math
\left(\frac{49}{75}\right)^2
-4\frac3{40}\frac{289}{200}
=-\frac{599}{90000}<0.
```
This certifies positivity exactly.

Exponential tilting supplies probability laws with transforms $R(s+j)/R(j)$. Dufresne's converse gives
```math
\mathbb E U^s=
\frac{(1/3)_s(2/3)_s(1)_s}{(c)_s^2(2)_s}.
```
Multiplying $U$ by an independent unit-scale gamma variable of shape $2$ cancels $(2)_s$. No limiting argument for removal of denominator parameters is needed.

For completeness, convergence can be checked directly. If $Y_j$ has the tilted law, then
$\mathbb E Y_j=-R'(j)/R(j)=O(j^{-2})$.
Consequently $\sum Y_j<\infty$ almost surely. Multiplying the finite transforms and applying the elementary gamma-ratio asymptotic gives the displayed Mellin transform. The full result file spells out the remaining change of variable, Gauss triplication, and Laplace-transform identification.

For every $\beta>c$, two independent beta variables with parameters $(c,\beta-c)$ replace $(c)_s^2$ by $(\beta)_s^2$. Hence the construction proves complete monotonicity for every $\beta\geq c$, not only the initial rational value.

At $w=1/4$, Simon's asserted necessary condition becomes
$2\,4^{1-3\beta}\leq21/16$. It fails for $\beta<\beta_1$. The interval is nonempty because
```math
2^{10}(1/4)^3-(21/16)^{10}
=\frac{912305066215}{1099511627776}>0.
```
This is an exact disproof of the whole proposed equivalence by a parameter interval. No numerical approximation is used in the certificate.

## 3. Related papers checked

### Wang 2024

Min Wang, *Moments of Gamma type and three-parametric Mittag-Leffler function*, [arXiv:2410.19330v1](https://arxiv.org/html/2410.19330v1), 25 October 2024.

Section 2.2, equations (2.9)–(2.13), explicitly distinguishes existence from logarithmic infinite divisibility. It repeats Dufresne's balanced three-numerator, three-denominator example with distinct denominator parameters. The main new Theorem 1.2 treats
```math
\frac{\Gamma(a+s)\Gamma(b-s)}{\Gamma(c+ds)},
```
which has a numerator gamma factor with negative slope. It does not state the present all-positive-slope, repeated-denominator specialization.

Its Proposition 3.1 uses weak majorization to obtain balanced Hausdorff moment sequences. That sufficient condition does not certify the auxiliary law above: its first two numerator parameters sum to $1$, while its first two denominator parameters sum to $13/15$.

### Kadankova–Simon–Wang

T. Kadankova, T. Simon and M. Wang, *On some new moments of Gamma type*, [arXiv:1908.03428v2](https://arxiv.org/pdf/1908.03428), 7 June 2023.

Section 1.2, equation (3), prints a purported necessary inequality
```math
a_1+\cdots+a_p\leq c_1+\cdots+c_p
```
when there are $n$ numerator parameters and $p\leq n$ denominator parameters. As written, this extends beyond the balanced parameter-sum condition.

The law constructed above has $n=3$, $p=2$, $(a_1,a_2,a_3)=(1/3,2/3,1)$ and $(c_1,c_2)=(13/30,13/30)$. It has a positive probability construction although $a_1+a_2=1>13/15=c_1+c_2$. The displayed inequality therefore cannot be used as a necessary condition in this unbalanced setting. Dufresne's Theorem 6.1(c) explicitly retains the equality-of-lengths hypothesis. This audit does not assert what the inaccessible 1999 source originally says.

### Górska–Horzela–Garrappa

K. Górska, A. Horzela and R. Garrappa, *Some results on the complete monotonicity of the Mittag-Leffler functions of Le Roy type*, [arXiv:1912.07100v2](https://arxiv.org/pdf/1912.07100), revised 5 May 2020; published in Fractional Calculus and Applied Analysis 22(5) (2019), 1284–1306, [DOI](https://doi.org/10.1515/fca-2019-0068).

Section IV treats the boundary $\alpha=1/n$ analytically, and also treats $\beta=1$, $n=2$. Section IV, part III, and Figure 4 study the remaining subcritical density range numerically. This includes evidence about thresholds, not an analytic proof of the present interval. The exact Le Roy definition agrees with Simon's convention.

### Chamayou–Letac 1999: access limitation

J.-F. Chamayou and G. Letac, *Additive Properties of the Dufresne Laws and Their Multivariate Extension*, Journal of Theoretical Probability 12(4) (1999), 1045–1066, [DOI and publisher page](https://link.springer.com/article/10.1023/A:1021649305082).

The publisher abstract was retrieved. The full article was not accessible through the publisher PDF endpoint, author-page attempts, or the two search engines in this audit. Dufresne 2010 discusses its gamma-ratio setting and cites Proposition 7 concerning addition with a gamma variable. This does not constitute a full-text audit of the 1999 paper. A hidden specialization there has not been ruled out by direct inspection.

## 4. Public solution records and query scope

The [MathDB threshold-convexity record](https://mathdb.com/p/414157/convexity-of-the-le-roy-parameter-threshold) reports an October 2026 proof of Simon's separate final-paragraph convexity question. Its displayed solution explicitly leaves the complete-monotonicity equivalence unclaimed. The linked full preprint was inaccessible here, so the scope assessment uses the displayed statement and solution, not an assumed complete-paper review. No Lean was run.

Both web engines were used for author/title searches and combinations of “Le Roy”, “Dufresne”, “complete monotonicity”, “counterexample”, “conjecture”, repeated gamma parameters, $(1/3,2/3)$, and $13/30$. Broad exact-parameter searches frequently returned unrelated results; these are not positive novelty evidence.

A public GitHub issue search for “Simon” and “Le Roy” found the present issue, the separate Tricomi-Wronskian investigation, and an unrelated Pascal-matrix audit that mentions classical Le Roy zeros. The latter record was read at the matching passage and contains no complete-monotonicity resolution.

The 2023 paper by Kiryakova, Paneva-Konovska, Rogosin and Dubatovskaya, [*Erdélyi–Kober fractional integrals (Part 2) of the multi-index Mittag-Leffler-Prabhakar functions of Le Roy type*](https://www.diogenes.bg/ijam/contents/2023-36-5/2/2.pdf), was also checked at its definitions and complete-monotonicity references. It cites earlier sufficient conditions and develops integral identities; no exact counterexample specialization was found in those passages. This was a targeted inspection, not a complete audit of all its references.

The companion novelty review records the separate searches of more recent Fox-H and Le Roy papers. The finding here is limited: no earlier explicit resolution or matching repeated-denominator counterexample was located in the inspected sources.
