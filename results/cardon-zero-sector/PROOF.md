# Cardon–Forgács–Piotrowski–Sorensen–White conjecture

Research date: 20 November 2026. [Issue #136](https://github.com/1337isnot1337/solved-conjectures/issues/136). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Result and exact scope

Question 6.1 of D. A. Cardon, T. Forgács, A. Piotrowski, E. Sorensen, and J. C. White, [*On zero-sector reducing operators*](https://arxiv.org/pdf/1802.02641), *Journal of Mathematical Analysis and Applications* **468** (2018), 480–490, DOI [10.1016/j.jmaa.2018.08.025](https://doi.org/10.1016/j.jmaa.2018.08.025), asks whether, for a positive parameter \(\alpha\), the diagonal operator
\[
T_{\alpha,p}[z^k]=e^{-\alpha k^p}z^k \qquad(k=0,1,2,\ldots)
\tag{1}
\]
is zero-sector reducing precisely when \(p\ge2\). The question is on page 10 of the author's preprint, printed page 489 of the journal article.

**The proposed sufficiency is false.** For every fixed real \(p>2\), the operator in (1) fails even to preserve real-rootedness for all sufficiently small positive \(\alpha\). One cubic proves the failure for every such exponent. An explicit witness uses
\[
p=3,\qquad \alpha=\frac16\log\frac{16}{15},
\qquad f(z)=(z-1)^3.
\tag{2}
\]
The transformed cubic has a strictly negative discriminant, calculated below using rational arithmetic.

This is an unconditional refutation of the full universal assertion in Question 6.1. It is not a result only for a finite numerical range or a collection of separately counted exponent cases.

The candidate arose while studying the entire-function and zero-location methods adjacent to the accepted RH source. The proof does not use RH, Dirichlet GRH, or any hypothesis from the source repository.

**Status:** the full written proof and original scope passed three independent internal reviews. The bounded prior-art audit found no earlier exact disproof; conflicting earlier assertions and nearby resolved problems are recorded below. No claim of exhaustive priority verification is made.

## 1. Why failure on this cubic contradicts sector reduction

The original paper uses sectors about the nonnegative real axis:
\[
S(\theta)=\{0\}\cup\{z\ne0:|\arg z|\le\theta\},
\qquad 0\le\theta<\frac{\pi}{2}.
\tag{3}
\]
A zero-sector reducing operator must map real polynomials with their zeros in a prescribed positive-width sector \(S(\theta)\) into a strictly narrower such sector.

Every zero of \(f(z)=(z-1)^3\) is \(1\). Thus its zeros lie in \(S(\theta)\) for every \(\theta>0\), however small.

Suppose \(T_{\alpha,p}f\) has a nonreal zero \(\zeta\). Its constant coefficient is \(-1\), so \(\zeta\ne0\). Put
\[
\theta=\min\left\{\frac{|\arg\zeta|}{2},\frac{\pi}{4}\right\}>0.
\tag{4}
\]
Then \(\theta<\pi/2\), the input zeros lie in \(S(\theta)\), and \(\zeta\notin S(\theta)\). Consequently the output cannot lie in any sector \(S(\gamma)\) with \(\gamma<\theta\).

This argument uses a strictly positive initial width. It does not rely on a convention for the degenerate sector \(S(0)\).

## 2. A cubic obstruction for every \(p>2\)

Fix a real number \(p>2\). Applying (1) gives
\[
P_{\alpha,p}(z)
=e^{-\alpha3^p}z^3
 -3e^{-\alpha2^p}z^2
 +3e^{-\alpha}z-1.
\tag{5}
\]
Define
\[
A_p=3^p-3\cdot2^p+3.
\tag{6}
\]

### 2.1. The third finite difference is positive

Let \(g(x)=x^p\) for \(x\ge0\). The function
\[
g''(x)=p(p-1)x^{p-2}
\]
is continuous and strictly increasing on \([0,\infty)\). Twice applying the fundamental theorem of calculus gives
\[
g(x+2)-2g(x+1)+g(x)
=\int_0^1\int_0^1 g''(x+u+v)\,du\,dv.
\tag{7}
\]
Subtract the instance \(x=0\) from the instance \(x=1\). The integrand is strictly larger at \(x=1\), so
\[
\begin{aligned}
A_p
&=g(3)-3g(2)+3g(1)-g(0)\\
&=\int_0^1\int_0^1
 \bigl(g''(1+u+v)-g''(u+v)\bigr)\,du\,dv
>0.
\end{aligned}
\tag{8}
\]
This proof also covers \(2<p<3\) without differentiating three times at the endpoint \(0\).

### 2.2. Translate the triple root and expand the discriminant

Write
\[
P_{\alpha,p}(1+u)=a u^3+b u^2+c u+d.
\]
Its coefficients are
\[
\begin{aligned}
a&=e^{-\alpha3^p},\\
b&=3\bigl(e^{-\alpha3^p}-e^{-\alpha2^p}\bigr),\\
c&=3\bigl(e^{-\alpha3^p}-2e^{-\alpha2^p}+e^{-\alpha}\bigr),\\
d&=e^{-\alpha3^p}-3e^{-\alpha2^p}+3e^{-\alpha}-1.
\end{aligned}
\tag{9}
\]
As \(\alpha\downarrow0\), with \(p\) fixed,
\[
a=1+O_p(\alpha),\qquad
b=O_p(\alpha),\qquad
c=O_p(\alpha),\qquad
d=-A_p\alpha+O_p(\alpha^2).
\tag{10}
\]
For a real cubic \(a u^3+b u^2+c u+d\), its discriminant is
\[
\Delta=b^2c^2-4ac^3-4b^3d-27a^2d^2+18abcd.
\tag{11}
\]
Substituting (10) gives
\[
\Delta(P_{\alpha,p})
=-27A_p^2\alpha^2+O_p(\alpha^3).
\tag{12}
\]
Indeed, the five terms in (11), in their displayed order, have orders
\(\alpha^4,\alpha^3,\alpha^4,\alpha^2,\alpha^3\).
The leading term of the fourth is exactly \(-27A_p^2\alpha^2\).

By (8), the leading coefficient in (12) is strictly negative. Therefore for each \(p>2\) there is an \(\alpha_0(p)>0\) such that
\[
0<\alpha<\alpha_0(p)
\quad\Longrightarrow\quad
\Delta(P_{\alpha,p})<0.
\tag{13}
\]
The leading coefficient \(a\) is positive. A real cubic with negative discriminant has one real zero and a nonreal conjugate pair. Thus (5) fails to be real-rooted for every parameter in (13), and Section 1 proves that \(T_{\alpha,p}\) is not zero-sector reducing.

No root approximation, numerical root search, or unproved assumption enters this argument.

## 3. A fully explicit rational certificate

The asymptotic argument already settles the question. The following exact instance removes the unspecified sufficiently-small threshold.

Choose (2), and set
\[
q=e^{-\alpha}=\left(\frac{15}{16}\right)^{1/6},
\qquad r=q^6=\frac{15}{16}.
\tag{14}
\]
For \(p=3\), equation (5) becomes
\[
P(z)=q^{27}z^3-3q^8z^2+3qz-1.
\]
The positive rescaling \(w=qz\) preserves reality of roots and their arguments. It gives
\[
Q(w)=P(w/q)=r^4w^3-3rw^2+3w-1.
\tag{15}
\]
Using (11), direct expansion yields
\[
\begin{aligned}
\Delta(Q)
&=27r^2\bigl(3-4r-4r^2+6r^3-r^6\bigr)\\
&=-27r^2(r-1)^2
  \bigl(r^4+2r^3+3r^2-2r-3\bigr).
\end{aligned}
\tag{16}
\]
All factors can now be evaluated rationally:
\[
r^4+2r^3+3r^2-2r-3
=\frac{11937}{65536}>0,
\qquad r=\frac{15}{16}.
\]
Consequently
\[
\boxed{\quad
\Delta(Q)
=-\frac{72517275}{4294967296}<0.
\quad}
\tag{17}
\]
For an entirely integral version, multiply (15) by \(16^4\):
\[
16^4 Q(w)
=50625w^3-184320w^2+196608w-65536.
\tag{18}
\]
Its discriminant is
\[
-311459324520038400<0.
\tag{19}
\]
Equations (16)–(17) are a short exact certificate. A local symbolic expansion independently reproduced (16)–(19); those computations are checks of the displayed algebra, not a substitute for a proof or a numerical search over cases.

## 4. What this refutes and what it leaves open

The original question universally allows every positive \(\alpha\). The witness (2) disproves the implication
\[
p\ge2\quad\Longrightarrow\quad
T_{\alpha,p}\text{ is zero-sector reducing}
\]
under that quantifier. Section 2 gives a failure interval at every \(p>2\).

This note does not claim that all parameter pairs with \(p>2\) fail. It does not classify the pairs \((\alpha,p)\) for which the operator preserves real zeros or reduces sectors.

The established \(p=2\) case in the original paper remains outside the refutation. Likewise, the older problem about the fixed sequence \(\{e^{-k^3}\}_{k\ge0}\), corresponding to \(\alpha=1\), is not settled here.

The method is elementary: apply a diagonal operator to a polynomial with a triple real root and inspect the discriminant after a small parameter change. The general methodology is classical and carries no new-priority claim.

## 5. Primary-source and prior-art audit

### Original question and current author records

The [full original preprint](https://arxiv.org/pdf/1802.02641) was checked for the sector orientation, the polynomial class, and the quantifiers in Question 6.1. The [arXiv record](https://arxiv.org/abs/1802.02641) currently lists only its original 7 February 2018 version.

The current [Cardon publication list](https://mathdept.byu.edu/cardon/publications.html) and [Forgács publication list](https://csm.fresnostate.edu/math/faculty-staff/tforgacs/grants-publications.html) were also checked. No correction to Question 6.1 was located there. Absence from these lists is not a proof of priority.

### An earlier assertion that conflicts with the exact cubic

T. Craven and G. Csordas, [*Complex zero decreasing sequences*](https://www.math.hawaii.edu/~tom/mathfiles/zds.pdf), *Methods and Applications of Analysis* **2** (1995), 420–441, DOI [10.4310/MAA.1995.v2.n4.a4](https://doi.org/10.4310/MAA.1995.v2.n4.a4), state immediately after their rapid-decrease definition that the sequences
\[
\{e^{-a k^p}\}_{k\ge0},\qquad a>0,\quad p\ge3\text{ an integer},
\]
are multiplier sequences. The passage is on page 23 of the author-hosted preprint, corresponding to printed page 438.

The same unrestricted-\(a\) assertion appears on page 27 of their [2004 survey, *Composition theorems, multiplier sequences and complex zero decreasing sequences*](https://math.hawaii.edu/~tom/mathfiles/czdssurvey.pdf).

Read literally, that assertion is false: the exact cubic (15)–(17) is also a counterexample to real-root preservation for the associated sequence. This conflict is recorded explicitly; the assertion is not used as a theorem in this note. It is not a prior disproof of Question 6.1.

The nearby rapid-decrease criterion has a quantitative condition that does not hold at arbitrarily small \(a\). In particular, at \(k=1\),
\[
\frac{\gamma_1^2}{\gamma_0\gamma_2}
=\exp\bigl(a(2^p-2)\bigr)
\longrightarrow1\qquad(a\downarrow0),
\]
whereas the cited sufficient criterion requires this ratio to be at least \(4\). Thus that criterion does not justify the unrestricted-\(a\) sentence. No assertion is made here about the intended wording of the authors.

### Distinct problems and preservation classes

- The same 2004 survey, page 26, Problem 4.8(a), asks whether the fixed sequence \(\{e^{-k^3}\}\) is complex-zero decreasing. That question has \(\alpha=1\) and concerns the count of nonreal zeros for arbitrary inputs. The present small-\(\alpha\) counterexample does not resolve it.
- The survey's Schoenberg theorem concerns reciprocal Laguerre–Pólya functions and integral kernels. It is not a stated classification of the diagonal family (1).
- Craven–Csordas, [*Problems and theorems in the theory of multiplier sequences*](https://math.hawaii.edu/~tom/mathfiles/serdica1.pdf), *Serdica Mathematical Journal* **22** (1996), 515–524, was checked, including its rapid-decrease discussion. It supplies different interpolation and preservation questions, not the present explicit counterexample.
- Cardon's [2026 revision of *Complex zero strip decreasing operators*](https://arxiv.org/pdf/1401.0237) corrects different strip-decreasing conjectures from his 2015 paper. That revision is not treated as a resolution of the 2018 sector question.

- Katkova–Shapiro–Vishnyakova, [*Multiplier sequences and logarithmic mesh*](https://www.numdam.org/item/10.1016/j.crma.2010.11.031.pdf), *Comptes Rendus Mathématique* **349** (2011), 35–38, was read in full. It states the classical finite multiplier criterion and proves logarithmic-mesh preservation. It does not state the exclusion (13) or resolve Question 6.1.
- Borcea–Shapiro, [*Finite Hermite–Poulain semigroups and finite free additive convolution*](https://staff.math.su.se/shapiro/Articles/Semigroups.pdf), manuscript dated 25 May 2026, studies constant-coefficient differential operators in \(\mathbb R[D]/(D^{n+1})\). Its Theorem 6.3 gives a cubic obstruction for that additive convolution semigroup. The paper explicitly distinguishes its product from Schur–Szegő composition. The family (1) is diagonal in monomials and is not the family treated there.
- Białas–Białas-Cież, [*Comments on “On Hadamard powers of polynomials”*](https://link.springer.com/article/10.1007/s00498-017-0202-0), *Mathematics of Control, Signals, and Systems* **29** (2017), article 16, studies ordinary coefficient powers \(\sum a_k^t z^k\) and Hurwitz stability. Its Counterexample 1 also discusses Wang–Zhang's [2013 ordinary coefficient-power result](https://doi.org/10.1016/j.laa.2013.08.012). These operations and quantifiers differ from (1); neither is a prior resolution of Question 6.1. The 2017 full text was read directly. The 2013 manuscript was available only as indexed primary text to the independent reviewer, so no full-text inspection is claimed for it.

### Additional continuous-semigroup audit

A final search specifically tested whether an existing classification of positive infinitely Hadamard-divisible multiplier sequences already implies the counterexample. Here the relevant property is that a single real sequence \(b_k\) has \(\{e^{t b_k}\}_{k\ge0}\) as a multiplier sequence for **every** \(t>0\). It is stronger than closure under positive integer powers, which follows immediately from composition.

The shifted cubic test \(x^j(x-1)^3\) suggests a classification by quadratic sequences \(b_k\). This observation does not by itself identify a prior theorem: applying the usual finite multiplier criterion and making an additional discriminant argument is different from finding a source that has already carried out that argument. The audit therefore looked for explicit infinitesimal or infinite-divisibility classifications, not merely the classical multiplier criterion.

The following nearby primary sources were inspected:

- V. Kostov and B. Shapiro, [*On the Schur–Szegö composition of polynomials*](https://www.researchgate.net/publication/228589445_On_the_Schur-Szego_composition_of_polynomials), *Comptes Rendus Mathématique* **343** (2006), 81–86, DOI [10.1016/j.crma.2006.06.007](https://doi.org/10.1016/j.crma.2006.06.007). The author-uploaded full text states the finite multiplier criterion in Theorem 1.3 and studies multiplicity strata in Theorem 1.6. Its semigroup is the collection of all finite multipliers under composition. The statements inspected do not classify one-parameter semigroups or all positive fractional powers.
- The 2011 Katkova–Shapiro–Vishnyakova note cited above also identifies the finite-multiplier semigroup with same-sign real-rooted polynomials under Schur–Szegö composition. Its new result concerns logarithmic mesh. It does not give the infinitesimal classification at issue.
- A. Campbell and J. Jalowy, [*Pólya–Schur problems and free probability*](https://arxiv.org/html/2605.31356v1), arXiv:2605.31356v1, 29 May 2026. Section 2.2 studies limits of empirical root distributions as polynomial degree tends to infinity; Proposition 2.8 recalls the classical multiplier criterion. Free multiplicative infinite divisibility of limiting measures is not a theorem that every member of a fixed-degree diagonal semigroup preserves real roots.
- P. J. di Dio and L.-L. Langer, [*The Hadamard product of moment sequences, diagonal positivity preservers, and their generators*](https://link.springer.com/article/10.1007/s00020-025-02815-9), *Integral Equations and Operator Theory* **97** (2025), article 32. The paper defines positivity preservation as taking polynomials nonnegative on \(\mathbb R^n\) to polynomials nonnegative on \(\mathbb R^n\). Its diagonal-generator classification concerns that cone, not the cone of real-rooted polynomials. No implication from that classification to Question 6.1 was established.
- V. Kostov, [*On multiplier sequences*](https://doi.org/10.1016/j.tcs.2007.10.006), *Theoretical Computer Science* **392** (2008), 101–112. The retrieved abstract concerns geometric stratification and the Whitney property of the finite-multiplier domain. The complete article was not available in this audit, so its full contents are not certified absent of a relevant result.

Additional searches included “infinitely divisible multiplier sequence,” “all positive powers,” “fractional powers,” “continuous diagonal hyperbolicity-preserving semigroup,” “Schur–Szegö” with “divisible,” and “Faktorenfolgen” with “Halbgruppen.” Exact-title and zero-sector searches were also directed at public problem databases.

No prior explicit classification or prior exact disproof was retrieved. This conclusion is limited by the searches and access described here; it is not a claim that a classification has never appeared. In contrast, the neighboring Borcea–Shapiro additive-convolution questions were excluded after locating an explicit earlier classification; see the separate [screening note](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/rh-transfer/borcea-shapiro-screening.md).

### Search coverage and limitation

Searches on 20 November 2026 used both available search engines. Query groups included the exact 2018 title and authors, “Question 6.1,” “zero-sector reducing” with “counterexample,” “false,” “correction,” “disproved,” and “solved,” the sequences \(e^{-\alpha k^p}\) and \(q^{k^p}\), multiplier-sequence semigroups, infinitely divisible multiplier sequences, and Hadamard powers. The current author records and the original arXiv version history were included.

No prior exact disproof was retrieved in those searches. The earlier contrary multiplier assertion was retrieved and is documented above. The nearby semigroup and coefficient-power results examined above do not state an exact resolution of Question 6.1.

This is a bounded literature audit. It does not establish that no unpublished or unindexed argument exists.

## Review status

The [independent analytic review](https://github.com/1337isnot1337/solved-conjectures/issues/136#issuecomment-7050394975) passed the complete note. It checked the exact original quantifiers, positive-width sector argument, all-real-\(p>2\) finite-difference proof, discriminant expansion, rational and integral certificates, and the distinction from neighboring coefficient-power results. No mathematical repair was requested.

Two further independent reviews also passed:

- [Arithmetic review](https://github.com/1337isnot1337/solved-conjectures/issues/136#issuecomment-7050415504) checked the exact original question, positive-width sector reduction, finite-difference argument, and both exact discriminant certificates.
- [Root review](https://github.com/1337isnot1337/solved-conjectures/issues/136#issuecomment-7050423888) checked the full written proof and original source scope independently.

No reviewer requested a mathematical repair. All three reviews retain the unconditional nature of the counterexample and the bounded scope of the priority search. This is internal mathematical review, not formal verification or external peer review.

No Lean verification was performed.
