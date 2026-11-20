# Root review: Simon's Le Roy complete-monotonicity conjecture

Reviewed on 2026-11-20.

## Scope and verdict

I read the complete 354-line candidate at commit
[151879adb34feaad7b7ffa6e3d9859c2e3d3abc1](https://github.com/1337isnot1337/solved-conjectures/commit/151879adb34feaad7b7ffa6e3d9859c2e3d3abc1).
Its analytic argument is mathematically complete. This review does not, by itself, establish priority. The prior-resolution search is recorded separately.

The original primary statement is the unnumbered conjecture in Section 3 of Thomas Simon, *Remark on a Mittag-Leffler function of Le Roy type*, [arXiv:2012.11018v2](https://arxiv.org/pdf/2012.11018), printed pages 5–6; *Integral Transforms and Special Functions* 33(2) (2022), 108–114, [DOI 10.1080/10652469.2021.1913138](https://doi.org/10.1080/10652469.2021.1913138). I checked that primary statement directly. A family for which complete monotonicity holds while the scalar condition fails refutes the whole equivalence. It does not merely prove a positive parameter subcase.

## Checks of the analytic proof

1. **Threshold.** With $a=1/3$, $b=2/3$, $\alpha=a$, and $\gamma=2$, the substitution $z=w^3$ gives the claimed scalar condition $2w^{3\beta-1}\le 1+w+w^2$. Its failure at $\beta=a,w=1/4$ persists for nearby $\beta$. At $\beta=1/2$, the difference is $(1-\sqrt w)^2+w^2$, with a positive minimum on $[0,1]$. Uniform continuity in the exponent gives admissible $\beta<1/2$. The admissible set is upward closed and closed inside $(a,\infty)$, so its least point $\beta_0$ exists and belongs to $(a,1/2)$.

2. **Mellin transform.** The signed double integral is absolutely integrable against $y^r$ for every $r>-a$. The substitution $y=uvz$ gives two ordinary beta integrals and the exact identity
   $\int_0^\infty z^s e^{-z}P_\beta(z)\,dz=\Gamma(1+s)(s+\beta)^2$.
   All three integrals converge in the asserted half-plane. Their product is exactly
   $G_\beta(s)=\Gamma(s+a)\Gamma(s+b)\Gamma(s+1)/\Gamma(s+\beta)^2$.
   No formal integration by parts is needed.

3. **Uniform endpoint estimates.** For $y\ge4$, the polynomial in the integral is positive because
   $P_\beta(z)=z(z-3)+2\beta z+(\beta-1)^2>0$ for $z\ge4$.
   At zero, the substitution $u=y/(vz)$ is correct, including the powers of $v$ and $z$. On any compact $\beta$ interval inside $(a,1/2)$, the factor
   $(1-y/(vz))_+^{\beta-a}$ lies between zero and one. The stated product majorant is integrable. Taking a supremum over the compact parameter interval in the dominated-convergence estimate proves uniform convergence, not only pointwise convergence. The limit is exactly
   $\Gamma(b-a)\Gamma(1-a)/\Gamma(\beta-a)^2>0$.

4. **Probability law at the threshold.** The gamma integral has the correct drift and Lévy density
   $R_\beta(t)/[t(1-e^{-t})]$, where
   $R_\beta(t)=e^{-at}+e^{-bt}+e^{-t}-2e^{-\beta t}$.
   The scalar condition makes this density nonnegative at $\beta_0$. The compensation term gives convergence at zero, and the exponential factors give convergence at infinity.

5. **Strict positivity, rather than mere nonnegativity.** Stirling's estimate gives
   $|G_{\beta_0}(i\xi)/G_{\beta_0}(0)|
   =O((1+|\xi|)^{3/2-2\beta_0}e^{-\pi|\xi|/2})$.
   Fourier inversion therefore gives a real-analytic density. Since $R_{\beta_0}(0)=1$, a finite positive part of the Lévy measure can be split off on an interval away from zero. After the drift adjustment, the remaining probability law still has an exponentially integrable characteristic function: removing a finite compound-Poisson factor changes its modulus by a bounded factor. Its nonnegative analytic density cannot vanish on a nonempty interval. The one-jump part of the convolution is consequently positive at every point. Fourier uniqueness then identifies this strictly positive density with $e^x f_{\beta_0}(e^x)/G_{\beta_0}(0)$.

6. **Parameter continuation.** Strict positivity on a middle compact interval persists by joint continuity. The two uniform endpoint estimates cover the remaining positive axis. This proves positivity for a genuine interval of $\beta$ values below $\beta_0$.

7. **Identification of the Le Roy function.** For $X_\beta=3Y_\beta^{1/3}$, Gauss triplication yields
   $\mathbb E X_\beta^s=\Gamma(1+s)\Gamma(\beta)^2/\Gamma(\beta+s/3)^2$ for $s\ge0$.
   Monotone convergence of the positive exponential series proves that all exponential moments exist, since the resulting Le Roy series is entire. Absolute integration of the series at negative arguments is then justified. The resulting positive Laplace representation proves complete monotonicity at every positive argument and in every derivative order.

No numerical density sampling is used in these checks.

## Independent explicit construction using Dufresne

During the prior audit, the combinatorics reviewer found a shorter construction using a classical theorem. I read the final primary paper:

Daniel Dufresne, *G distributions and the beta-gamma algebra*, *Electronic Journal of Probability* 15 (2010), paper 71, 2163–2199, [DOI 10.1214/EJP.v15-845](https://doi.org/10.1214/EJP.v15-845), [full text](https://emis.de/ft/42731).

The converse of Theorem 6.3, printed pages 2187–2188, constructs a gamma-ratio Mellin law from independent exponential tilts of a positive measure with the appropriate rational Laplace transform. It is not only a criterion for infinite divisibility.

For $\beta_*=13/30$, I independently checked
\[
R(s)=\frac{(s+\beta_*)^2(s+2)}
{(s+1/3)(s+2/3)(s+1)}
=1+\frac{3/40}{s+1/3}
-\frac{49/75}{s+2/3}
+\frac{289/200}{s+1}.
\]
The non-atomic inverse Laplace density is
\[
e^{-x/3}\left(\frac3{40}-\frac{49}{75}e^{-x/3}
+\frac{289}{200}e^{-2x/3}\right).
\]
The quadratic has positive leading coefficient and discriminant $-599/90000$, so the density is positive. The total mass, including the unit atom at zero, is $R(0)=169/100$.

If $T_j$ has Laplace transform $R(j+s)/R(j)$, the positive density above makes each $T_j$ a valid nonnegative random variable. Moreover,
$\mathbb E T_j=-R'(j)/R(j)=O(j^{-2})$.
Thus $\sum_jT_j$ is finite almost surely. The gamma product formula identifies the Mellin transform of $U=\exp(-\sum_jT_j)$ as
\[
\mathbb E U^s
=\frac{(1/3)_s(2/3)_s(1)_s}{(\beta_*)_s^2(2)_s}.
\]
Multiplication by an independent gamma variable of shape 2 removes $(2)_s$ and gives $G_{\beta_*}(s)/G_{\beta_*}(0)$ exactly. The same triplication and exponential-series argument as above proves the required complete monotonicity.

The source's scalar condition fails at $w=1/4$. Raising the positive sides to the tenth power reduces the strict violation to
\[
16^{11}-21^{10}=912305066215>0.
\]
This is an exact rational certificate, not a floating-point test. Independent beta factors also extend the Mellin law from $\beta_*$ to every $\beta>\beta_*$, so this route gives an explicit interval of counterexamples.

Dufresne's infinite-product construction is prior work and must be credited. His Example 2, printed page 2195, has different, distinct denominator parameters and does not itself state this repeated-denominator Le Roy specialization. A separate search is still needed before calling the specialization a new resolution.

## A necessary-condition qualification in an earlier source

Kadankova, Simon, and Wang, *On some new moments of Gamma type*, [arXiv:1908.03428v2](https://arxiv.org/pdf/1908.03428), Section 1.2, equation (3), prints a partial-sum necessary condition without restricting the number of numerator and denominator factors to be equal.

For the present unbalanced ratio, the printed condition would require $2\beta\ge1$. It cannot be used in that form: even the direct nonnegative Lévy construction supplies parameters $\beta<1/2$. The referenced Dufresne Theorem 6.1(c), printed page 2184, explicitly imposes its total-sum condition only when $K=N$. Its other clauses do not supply the printed unbalanced partial-sum condition. The proofs here establish their Mellin laws directly and do not rely on that overextended condition.

## Limits of this review

This is an internal mathematical review, not external peer review. The analytic proof is complete; the explicit classical-construction route is independently reconstructed and checked. The final shorter written proof and the prior-resolution record should also be read before integration. No assertion here establishes that an earlier unlocated publication cannot exist.
