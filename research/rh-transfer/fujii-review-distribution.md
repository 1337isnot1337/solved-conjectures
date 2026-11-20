# Fujii's conjecture

Independent audit of the distributional limit, recurrence, and prior-art search, 20 November 2026. Main argument: [fujii.md](fujii.md). Independent normalization proof: [fujii-review.md](fujii-review.md). Coordination: [issue #87](https://github.com/1337isnot1337/solved-conjectures/issues/87).

## Audit result

The distributional limit and recurrence steps in the proposed proof are valid under beta GRH and the stated classical explicit formula and Littlewood oscillation theorem. They require neither independence nor simplicity of zeros. This note gives the estimates and the order of quantifiers explicitly.

The normalization from the zero series to the original sum over primes is a separate obligation. It is proved independently in fujii-review.md using beta GRH and the ordinary prime number theorem; zeta RH is unnecessary for the qualitative conclusion.

No prior disproof of Fujii's all-positive-exponent assertion was found in the searches recorded below. That is a search result, not a proof of novelty. The original 1988 article was not directly retrieved. Its exact all-positive-exponent statement is corroborated by Suzuki's 2012 paper, Suzuki's 2025 article, and the 2025 comparative prime number theory bibliography.

## 1. Definitions

Let chi be the real primitive character modulo four, and let beta(s)=L(s,chi). Assume its nontrivial zeros are rho=1/2+i gamma, counted with multiplicity. Put

~~~math
c_\alpha(\rho)=\frac{\Gamma(\rho/\alpha)}{\alpha},
\qquad
B_\alpha=\frac{\Gamma(1/(2\alpha))}{2\alpha},
\qquad
F_\alpha(y)=-B_\alpha-\sum_\rho c_\alpha(\rho)e^{i\gamma y}.
~~~

The zero count is N_beta(T)=O(T log(T+2)). For each fixed alpha>0, Stirling's bound makes the coefficient series absolutely summable. The displayed expression therefore converges uniformly on the entire real line. Conjugate zeros have conjugate coefficients, so F_alpha is real and continuous.

There is no zero with gamma=0. For every real s>0 the convergent paired series

~~~math
\beta(s)=\sum_{n\ge0}\big((4n+1)^{-s}-(4n+3)^{-s}\big)
~~~

is strictly positive.

## 2. A uniform coefficient bound

For alpha>=1, the gamma functional equation gives

~~~math
c_\alpha(\rho)=\frac{\Gamma(1+\rho/\alpha)}{\rho}.
~~~

The Euler integral for gamma, applied where the real part is positive, gives

~~~math
|\Gamma(1+\rho/\alpha)|
\le \Gamma(1+1/(2\alpha))
\le 1.
~~~

For the second inequality, log Gamma is convex and the interval in question is [1,3/2]; its endpoint values are log Gamma(1)=0 and log Gamma(3/2)=log(sqrt(pi)/2)<0. Consequently

~~~math
|c_\alpha(\rho)|\le\frac1{|\rho|}\qquad(\alpha\ge1).
\tag{A}
~~~

For each fixed rho, c_alpha(rho) tends to 1/rho as alpha tends to infinity. Also B_alpha=Gamma(1+1/(2alpha)) tends to 1.

For any smooth compactly supported test function phi, write

~~~math
\widehat\phi(\xi)=\int_{\mathbb R}\phi(y)e^{-i\xi y}\,dy.
~~~

Repeated integration by parts and the zero-counting estimate imply

~~~math
\sum_\rho\frac{|\widehat\phi(-\gamma)|}{|\rho|}<\infty.
~~~

Bound (A) therefore permits termwise dominated convergence in the test pairing:

~~~math
F_\alpha\longrightarrow
R:=-1-\sum_\rho\frac{e^{i\gamma y}}{\rho}
\quad\hbox{in }\mathcal D'(\mathbb R).
\tag{B}
~~~

The limiting zero series is a distribution. Its ordinary absolute convergence, uniform convergence, or pointwise convergence is not needed. The same argument works against Schwartz tests, so R is tempered.

## 3. Positivity of one limiting test pairing

The odd primitive-character explicit formula is

~~~math
\psi_\chi(x)
=-\sum_\rho\frac{x^\rho}{\rho}
-\frac{\beta'}{\beta}(0)
+\frac12\log\frac{x+1}{x-1},
\qquad x>1,
~~~

with half weights at jumps, or as a distribution. Its trivial-zero term has the indicated positive sign because beta has trivial zeros at the negative odd integers.

Hence on y>0 the distribution R is represented by the locally integrable function

~~~math
R(y)=-1+e^{-y/2}\left[
\psi_\chi(e^y)+\frac{\beta'}{\beta}(0)
-\frac12\log\frac{e^y+1}{e^y-1}
\right].
\tag{C}
~~~

Littlewood's positive oscillation theorem states that psi_chi(x)/sqrt(x) is unbounded above. The stronger classical bound is Omega_+(log log log x). The two elementary correction terms in (C), after multiplication by e^(-y/2), tend to zero.

Therefore R is positive on some open interval contained in y>0. If the chosen oscillation point is a prime power, move slightly to its right; the step value persists, and the other factors are continuous.

Choose a nonzero nonnegative smooth test phi supported inside that interval. Then

~~~math
\langle R,\phi\rangle>0.
~~~

By (B), there is A such that, for every real alpha>A,

~~~math
\int_{\mathbb R}F_\alpha(y)\phi(y)\,dy>0.
~~~

Thus each such fixed F_alpha has a positive value. The statement is for every alpha above A, not merely for a sequence of alpha values.

The proof only needs one fixed test function. Neither its support length nor the threshold A needs to be estimated.

## 4. Recurrence without independent zero ordinates

Here is a direct recurrence argument that avoids any additional hypothesis about the zeros.

For fixed alpha and epsilon>0, truncate the absolutely convergent series for F_alpha so that the discarded coefficient sum is less than epsilon/4. The retained finite sum has frequencies gamma_1,...,gamma_m.

Compactness of the torus implies there are arbitrarily large real tau for which all e^(i gamma_j tau) are arbitrarily close to 1. One way to see this is to take a convergent subsequence of the sequence

~~~math
(e^{i\gamma_1 n},\ldots,e^{i\gamma_m n})\in(S^1)^m,
\qquad n=1,2,\ldots,
~~~

and subtract two sufficiently distant indices sufficiently far out in that subsequence. Their difference can be made arbitrarily large while all coordinate ratios remain arbitrarily close to 1. This works whether or not the frequencies satisfy rational relations.

For such tau, the retained finite sum changes by less than epsilon/2 uniformly in y. The discarded tail changes by less than epsilon/2. Thus there are tau_n tending to positive infinity such that

~~~math
\sup_{y\in\mathbb R}|F_\alpha(y+\tau_n)-F_\alpha(y)|<\epsilon.
\tag{D}
~~~

This is the needed almost-periodic recurrence.

If F_alpha(y_0)>2delta>0, take epsilon=delta in (D). Then F_alpha(y_0+tau_n)>delta for arbitrarily large arguments.

A negative value always exists. Since no gamma is zero, averaging the uniformly convergent series gives

~~~math
\lim_{T\to\infty}\frac1{2T}\int_{-T}^T F_\alpha(y)\,dy=-B_\alpha<0.
~~~

A nonnegative function could not have this mean. The same recurrence argument therefore produces a negative subsequence for every fixed alpha>0.

## 5. Quantifier order and conclusion

The verified normalization in fujii-review.md is, for each fixed alpha>0,

~~~math
\frac{\log x}{\sqrt x}S_\alpha(x)
=F_\alpha(\log x)+o_\alpha(1),
\qquad
S_\alpha(x)=\sum_{p>2}\chi(p)e^{-(p/x)^\alpha}.
\tag{E}
~~~

The order of operations is:

1. Choose one positive test pairing for R.
2. Use alpha tending to infinity only in that fixed compact test pairing to obtain A.
3. Fix any one alpha>A.
4. Use recurrence for that fixed function F_alpha.
5. Send x to infinity along the resulting sequence in (E).

There is no exchange of an alpha-limit and an x-limit. In particular the proof does not infer oscillation of a fixed smoothed sum directly from sharp-cutoff Littlewood oscillation.

With x_n=exp(y_0+tau_n), (E) gives

~~~math
S_\alpha(x_n)\ge \frac{\delta}{2}\frac{\sqrt{x_n}}{\log x_n}
\longrightarrow+\infty.
~~~

The negative sequence is identical with signs reversed. This proves the proposed qualitative failure of the negative-limit assertion for every sufficiently large fixed alpha, conditional only on beta GRH.

The same reasoning gives a useful stronger statement about the normalized amplitudes. Since R is unbounded in both directions between its jumps, for every M>0 there is A_M such that every alpha>A_M satisfies

~~~math
\sup_y F_\alpha(y)>M,\qquad \inf_y F_\alpha(y)<-M.
~~~

This does not give a numerical threshold or uniform locations of the oscillation points. It follows by choosing positive and negative compact test pairings with averages respectively greater than M and less than -M.

## 6. Source and prior-art audit

### Exact conjecture

The following scholarly sources explicitly state that Fujii conjectured the equivalence for every positive exponent.

- M. Suzuki, *On monotonicity of certain weighted summatory functions associated with L-functions*, [arXiv:1204.1823](https://arxiv.org/pdf/1204.1823), page 2, introduction, after display (1.4). This paper is dedicated to Fujii and cites his 1988 article.
- M. Suzuki, *On variants of Chebyshev's conjecture*, Ramanujan Journal 68, 95 (2025), [section 1.2 after (16)–(17)](https://link.springer.com/article/10.1007/s11139-025-01238-9). The article has a December 2025 correction; the current article retains the all-positive-exponent statement.
- G. Martin and coauthors, *An annotated bibliography for comparative prime number theory*, [arXiv:2309.08729v3](https://arxiv.org/pdf/2309.08729v3), entry 192. Entry 323 describes the bounded-exponent Platt–Trudgian result.

The original reference is A. Fujii, *Some generalizations of Chebyshev's conjecture*, Proceedings of the Japan Academy, Series A 64(7) (1988), 260–263, [DOI 10.3792/pjaa.64.260](https://doi.org/10.3792/pjaa.64.260), MR974088.

Direct retrieval attempts included the legacy Euclid article and PDF identifiers, the modern Euclid article and PDF paths, the DOI, and the journal archive. The official Japan Academy website routes the Series A archive to Euclid. The original text was not obtained in this audit. An indexed zbMATH review reproduced by MaRDI confirms the bounded-range theorem, but does not replace examination of the original conjecture's wording.

### Earlier bounded-exponent result

D. Platt and T. Trudgian, *Fujii's development on Chebyshev's conjecture*, International Journal of Number Theory 15 (2019), 639–644, [arXiv:1802.00089](https://arxiv.org/pdf/1802.00089), prove the equivalence for 0<alpha<20.40442. Their stated obstruction at 20.40443 concerns their absolute-value estimate. It is not itself a counterexample or a proof of oscillation.

This audit does not use the prime-sum normalization printed in section 2 of that preprint. The missing logarithmic normalization there must not be propagated into a proof about the unweighted sum. Formula (E) has been derived independently.

### Littlewood input

The exact oscillation input is Hardy and Littlewood, *Contributions to the theory of the Riemann zeta-function and the theory of the distribution of primes*, Acta Mathematica 41, 119–196, section 5. The campaign's source inspection located the definition of the character-weighted prime-power function and the two-sided oscillation statement on printed page 127. [Scanned primary article](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/5282-11511_2006_Article_BF02422942.pdf).

### Search coverage and limits

Queries used both available search indexes and included the exact original title and DOI; Fujii with “disproof”, “disproved”, “false”, “counterexample”, “all alpha”, “large alpha”, “oscillation”, “almost periodic”, and “approximate identity”; and Chebyshev/prime-race smoothing with “exponential weight”, “sign changes”, “large exponent”, and “smoothing parameter”. Citation trails from the original article, Platt–Trudgian, Suzuki, and the comparative prime number theory bibliography were also inspected.

A superficially related preprint, Huan Xiao's *From Littlewood and Fujii to Riemann*, [version 2, 21 January 2026](https://www.preprints.org/manuscript/202501.0292/v2), concerns Fujii's 1991 Goldbach-related result. It is not a disproof of the 1988 all-exponent statement. Its displayed transfer from sharp Littlewood oscillation to a fixed exponential generating function is not justified; such a transfer is not used here.

Other searches led to the established prime-race literature and to different weighted inequalities. No retrieved source contained the distributional-limit obstruction above or an established disproof of the all-exponent conjecture. Some original and subscription texts were inaccessible. A blanket claim that no such argument exists in the literature would therefore exceed the search evidence.
