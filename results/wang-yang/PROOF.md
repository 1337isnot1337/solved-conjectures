# Wang–Yang's conjecture

Status: complete unconditional disproof of the exact publicly stated author-manuscript Conjecture 1.10; root and independent arithmetic reviews passed. This note proves sign oscillation for every fixed coefficient index, rather than relying on a finite numerical counterexample. The final publisher PDF was inaccessible; the version boundary and prior-art limits are recorded below.

Issue: [#138](https://github.com/1337isnot1337/solved-conjectures/issues/138). Coordination: [#80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Date: 2026-11-20.

## 1. Exact target and normalization

Larry X. W. Wang and Neil N. Y. Yang's [Nankai author manuscript][WY], printed page 2, defines

```math
\frac18\Xi(z/2)=\sum_{n=0}^{\infty}\gamma(n)\frac{(-z^2)^n}{n!}.
\tag{1}
```

Here $\Xi(t)=\xi(1/2+it)$, with

```math
\xi(s)=\frac12s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s),
\qquad \xi(1-s)=\xi(s).
```

The opposite sign of $it$ used in the manuscript gives the same even function. Write $\Delta a(n)=a(n+1)-a(n)$. Conjecture 1.10 on printed page 6 asserts

```math
(-1)^r\Delta^r\gamma(n)>0
\qquad\text{for every pair of positive integers }r,n.
\tag{WY}
```

The universal quantifiers are essential. The manuscript's Theorem 1.8 concerns sufficiently large $n$ for each fixed $r$. It is compatible with the theorem below.

**Theorem.** For every fixed integer $n\ge0$, each of the sets

```math
\{r\ge0:(-1)^r\Delta^r\gamma(n)>0\},
\qquad
\{r\ge0:(-1)^r\Delta^r\gamma(n)<0\}
\tag{2}
```

is infinite.

Thus (WY) is false. Even allowing a finite exceptional set of orders for each fixed index cannot repair it. This statement resolves the full universal assertion; it is not a conjecture restricted to one numerical index or order.

## 2. Exact generating-function identity

Define the entire functions

```math
\Theta(w)=\sum_{m=0}^{\infty}
 \frac{\xi^{(2m)}(1/2)}{(2m)!}w^m,
\qquad
G(w)=\frac18\Theta(w/4).
\tag{3}
```

Evenness of $\xi$ about $1/2$ gives the useful notation
$\Theta(w)=\xi(1/2+\sqrt w)$. Formula (3), rather than a choice of square-root branch, defines the entire function. O'Sullivan [OS, section 1] records that $\Theta$ is real entire of order $1/2$ and that all its coefficients are strictly positive.

Comparing (1) and (3) gives

```math
G(w)=\sum_{m=0}^{\infty}\gamma(m)\frac{w^m}{m!},
\qquad
\gamma(m)=\frac{m!}{8\,4^m(2m)!}\xi^{(2m)}(1/2)>0,
\tag{4}
```

and, for real $t$,

```math
G(-4t^2)=\frac18\Xi(t).
\tag{5}
```

Fix $n\ge0$ and put

```math
E_n(z)=e^zG^{(n)}(-z).
\tag{6}
```

Both factors are entire. Their power series converge absolutely on compact sets, so their Cauchy product gives

```math
\begin{aligned}
E_n(z)
&=e^z\sum_{j=0}^{\infty}\gamma(n+j)\frac{(-z)^j}{j!}
\\ &=\sum_{r=0}^{\infty}
 \left(\sum_{j=0}^{r}(-1)^j\binom rj\gamma(n+j)\right)
 \frac{z^r}{r!}
\\ &=\sum_{r=0}^{\infty}
 (-1)^r\Delta^r\gamma(n)\frac{z^r}{r!}.
\end{aligned}
\tag{7}
```

The last equality uses the forward-difference convention in section 1. No asymptotic expansion or interchange of nonconvergent sums occurs.

## 3. Positive zeros force infinitely many coefficients of both signs

We use the following elementary fact.

**Lemma.** If a nonzero real entire function has infinitely many distinct positive real zeros, then its Taylor coefficients at zero are neither eventually nonnegative nor eventually nonpositive.

**Proof.** Let $H(z)=\sum_{k\ge0}a_kz^k$. Suppose $a_k\ge0$ for all sufficiently large $k$. If only finitely many $a_k$ are nonzero, then $H$ is a nonzero polynomial and cannot have infinitely many distinct zeros.

Otherwise there are arbitrarily large indices with positive coefficients. All negative coefficients lie in a finite set. Choose $K$ containing that set and choose $m>K$ with $a_m>0$. Absolute convergence on the positive axis and nonnegativity of all remaining terms give

```math
H(x)\ge a_mx^m-
 \sum_{\substack{0\le k\le K\\a_k<0}}|a_k|x^k>0
\qquad\text{for all sufficiently large }x>0.
\tag{8}
```

An infinite set of distinct positive zeros of a nonzero entire function is unbounded: otherwise it has a finite accumulation point and the identity theorem makes $H$ identically zero. Thus (8) is a contradiction. Apply the same argument to $-H$ to exclude eventual nonpositivity. $\square$

Hardy's 1914 theorem [H] says that $`\zeta(s)`$ has infinitely many zeros on $\mathop{\mathrm{Re}}s=1/2$. Equivalently, $\Xi(t)$ has infinitely many distinct real zeros. Reality, evenness, and discreteness give an unbounded sequence of positive zero ordinates. By (5), $G$ therefore has infinitely many distinct negative real zeros tending to $-\infty$.

Rolle's theorem between consecutive such zeros shows that $G'$ has infinitely many negative real zeros tending to $-\infty$. Repeating the argument proves the same statement for $G^{(n)}$, for every fixed $n\ge0$. Multiple zeros cause no problem; no simplicity hypothesis is used.

Consequently (6) has infinitely many distinct positive real zeros. Also $E_n(0)=\gamma(n)>0$, so $E_n$ is nonzero. The lemma and identity (7) show that its coefficients are not eventually nonnegative and not eventually nonpositive. Since $r!>0$, this is exactly (2). $\square$

## 4. An independent obstruction from growth and finite differences

This section gives a second proof that (WY) cannot hold, independent of Hardy's theorem. It is weaker than the fixed-index sign-oscillation theorem, but checks the conclusion through a different mechanism.

### 4.1. The coefficients decay faster than every geometric progression

Because $G$ has order $1/2$, there are constants $C,R_0>0$ such that its maximum modulus satisfies

```math
M_G(R)\le \exp(CR^{3/4})\qquad(R\ge R_0).
```

Cauchy's coefficient estimate applied to (4), with $R=n^{4/3}$, gives

```math
\frac{\gamma(n)}{n!}\le \frac{\exp(Cn)}{n^{4n/3}}.
```

Using $n!\le n^n$, we obtain

```math
0<\gamma(n)^{1/n}\le e^C n^{-1/3}\longrightarrow0.
\tag{9}
```

The exponent $3/4$ is only a convenient choice between the known order $1/2$ and $1$.

### 4.2. Nonnegative signed differences on a tail force log-convexity

Suppose, contrary to the desired conclusion, that for some $N$,

```math
(-1)^r\Delta^r\gamma(n)\ge0
\qquad(n\ge N,\ r\ge0).
\tag{10}
```

Set $b_k=\gamma(N+k)>0$. For $M\ge2$ and $0\le j\le M$, define

```math
w_{M,j}=\binom Mj(-1)^{M-j}\Delta^{M-j}b_j\ge0.
\tag{11}
```

To evaluate their moments, let $\mathcal L$ be the linear functional on real polynomials given by $\mathcal L(x^k)=b_k$. Then

```math
w_{M,j}=\mathcal L\!\left(\binom Mj x^j(1-x)^{M-j}\right).
```

The three elementary Bernstein-basis identities yield

```math
\sum_{j=0}^{M}w_{M,j}=b_0,
\qquad
\sum_{j=0}^{M}\frac jM w_{M,j}=b_1,
```

```math
\sum_{j=0}^{M}\left(\frac jM\right)^2w_{M,j}
 =\left(1-\frac1M\right)b_2+\frac{b_1}{M}.
\tag{12}
```

For completeness, the polynomial identities before applying $\mathcal L$ are respectively $1$, $x$, and $(1-1/M)x^2+x/M$, obtained from the binomial theorem and its first two derivatives.

Cauchy–Schwarz for the nonnegative weights in (11) gives

```math
b_1^2\le b_0\left[\left(1-\frac1M\right)b_2+\frac{b_1}{M}\right].
```

Letting $M\to\infty$ gives $b_1^2\le b_0b_2$. Apply the same argument to each shifted tail to obtain

```math
b_{k+1}^2\le b_kb_{k+2}\qquad(k\ge0).
\tag{13}
```

Thus the positive ratios $b_{k+1}/b_k$ are nondecreasing. In particular,

```math
b_k\ge b_0\left(\frac{b_1}{b_0}\right)^k.
\tag{14}
```

This contradicts (9). Therefore no tail can have all its signed differences nonnegative. The proof is an elementary version of the moment-sequence obstruction to simultaneous complete monotonicity and supergeometric decay; no moment-representation theorem is imported.

There is also a credited classical contradiction at (13): O'Sullivan [OS, equation (1.5)] records the strict Turán inequality proved by Csordas, Norfolk, and Varga in 1986. It gives the opposite strict inequality for these coefficients; the geometric rescaling in (4) preserves its sign. This is another existing input, not an additional target or a claim of new moment theory.

## 5. Relation to the accepted RH source and mathematical credit

This target arose from the campaign's study of the Riemann Xi function and the Laguerre–Pólya consequences of the accepted source pin
[9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e).

Under RH, $G$ has only negative real zeros, so the same zero argument is available. The proof above needs only Hardy's much older unconditional assertion that infinitely many such zeros exist. The second proof uses only classical entire-function growth and the coefficient definition.

Hardy's theorem, Rolle's theorem, Cauchy's estimate, the binomial identities, and the coefficient-sign lemma are classical ingredients. The claim developed here is their application to the exact Wang–Yang assertion, with the stronger fixed-index sign-oscillation conclusion. This is not represented as a new proof of RH or as a new general theory of complete monotonicity.

No computation of individual zeta zeros or finite differences enters either proof.

## 6. Original-source and current-status audit

### 6.1. Exact version checked

The Nankai PDF [WY] was downloaded and its printed pages 2 and 6 were rendered and visually inspected independently by the analytic agent and the root agent. They show exactly (1) and (WY). File receipt:

- Size: 373785 bytes.
- SHA256: 5bac1d44452a4a8fe19853163801d8d52787cbe785b05e50d0187ffa228c2322.
- PDF page indices: 1 for the coefficient normalization, 5 for Conjecture 1.10.

The published bibliographic record is *Transactions of the American Mathematical Society* **377** (2024), 4703–4725, DOI [10.1090/tran/9081][WYpub]. The [identified final publisher PDF][WYfinal] returned HTTP 403 in the public retrieval attempts. We therefore do not assert that its exact wording was checked. The result here addresses the fully specified public author-manuscript Conjecture 1.10. A later correction changing the quantifiers would be a different statement and must be recorded if found.

### 6.2. Distinct earlier work

| Source checked | Exact distinction |
| --- | --- |
| Wang–Yang's Theorem 1.8 in [WY] | Eventual positivity in the coefficient index for each fixed difference order. Theorem (2) instead fixes the index and varies the order, so there is no contradiction with that theorem. |
| pudim project's APP-0085, in the [application inventory][Pindex] and [full version-022 theory][Ptheory] | Gives a counterexample to the separate general Laguerre–Pólya question immediately following Conjectures 1.10–1.11. The example is $(1+4x/15)e^{2x/3}$, not the Riemann Xi coefficients. That prior result is not counted here. |
| Keita Kawano, [November 4, 2026 preprint][K] | Concerns linear finite differences of $\log\gamma(n)$, namely Conjecture 1.11 for orders at least two, and identifies the first-order sign problem in that separate conjecture. It does not settle the coefficient-difference assertion (WY). Its substantive proof is not needed or certified by this note. |
| O'Sullivan [OS] | Supplies classical normalization, positivity, growth, and strict Turán facts. These inputs are credited, rather than claimed as new. |
| bramble_trace, rStation paper 41, [version 1][R41v1] and [version 3][R41v3] | Concerns generalized quadratic Laguerre expressions at varying real heights and derivative orders. Its related-work section explicitly distinguishes Wang–Yang's coefficient inequalities. It does not address (WY). |
| bramble_trace, [rStation paper 36][R36] | Concerns signs of fourth-moment constants and filtered averages of generalized Laguerre forms. Those statements differ from linear finite differences of the Xi coefficient sequence. |

The full version-022 pudim TeX was inspected, including the APP-0085 section. At inspection its Git blob was 91b7ce1b71bf9a36aad5cf60c8c6bb8563d59f2a. The adjacent broad question is already answered negatively there; this note does not rename it as a new target. Its one-factor upstream lemmas, general definitions, and one-way Hausdorff finite-difference criterion were also inspected independently by the arithmetic reviewer. They do not state a Xi-specific result or a general zero obstruction that is applied to Xi there.

### 6.3. Search scope and limit

The audit, completed on 2026-11-20, used both web search engines and exact-title, author, formula, conjecture-number, correction, counterexample, and sign-change searches. Queries included combinations of:

- "Wang" "Yang" "Conjecture 1.10" "Xi";
- "Laguerre inequalities and complete monotonicity" with "counterexample", "false", "correction", and "erratum";
- "Riemann Xi" "finite differences" "sign changes";
- "Wang" "Yang" "complete monotonicity" "Hardy";
- "Xi coefficients" "Hausdorff";
- source-specific searches of GitHub application archives, MathDB, and Hexagon.

An additional audit checked the [trureturing source repository][T] underlying its mdBook site. Exact author/name, title, and DOI searches found no matching resolution. The complete inspected Problems tree (2175 entries, tree 339793f74acb8de74032f980ccc4da306e9d3077) and recursive Library tree (3290 entries, tree 1975b8ec489297e43338ba98bbdc7e26660af2c7) had no matching Wang–Yang coefficient-monotonicity dossier or source entry. This is a source and claim audit only; no Lean verification was performed.

The root agent conducted a separate current-status search and found no exact prior refutation of Conjecture 1.10. The accessible primary records above were read to distinguish nearby assertions. No earlier exact resolution or correction of (WY) was located.

This is a bounded literature audit, not a proof of priority or exhaustive access to all publications. The final AMS wording remains an explicit access limitation. If an earlier exact disproof or correction is found, the mathematical argument remains valid but the campaign's new-target classification must be revised.

## 7. Review record

Two independent reviews passed:

- [Root review, issue #138 comment 7050644736](https://github.com/1337isnot1337/solved-conjectures/issues/138#issuecomment-7050644736): checked both proofs, exact source normalization and quantifiers, the actual rendered manuscript pages, Hardy's original statement, and O'Sullivan's primary source. Confirmed the final AMS full-text access limitation.
- [Arithmetic review, issue #138 comment 7050690731](https://github.com/1337isnot1337/solved-conjectures/issues/138#issuecomment-7050690731): checked the factor $4$ in (5), the sign in (7), repeated Rolle, the polynomial exception and tail-domination lemma, the Bernstein-weight proof, and the original printed pages. Independently checked the pudim prior result and its upstream scope.

The reviews confirm the mathematical disproof of the specified manuscript statement. They do not remove the explicitly bounded priority audit or establish that the inaccessible final publisher wording is identical.

## References

[WY]: https://cfc.nankai.edu.cn/_upload/article/files/81/18/f83d37e449ebaf1b2f4141fa59be/9323c2fc-4d6a-4610-a747-1bd985a7be41.pdf
[WYpub]: https://doi.org/10.1090/tran/9081
[WYfinal]: https://www.ams.org/tran/2024-377-07/S0002-9947-2024-09081-5/S0002-9947-2024-09081-5.pdf
[OS]: https://fsw01.bcc.cuny.edu/cormac.osullivan/Research/xi-revised.pdf
[H]: https://fr.wikisource.org/wiki/Page:Comptes_rendus_hebdomadaires_des_s%C3%A9ances_de_l%E2%80%99Acad%C3%A9mie_des_sciences,_tome_158,_1914.djvu/1014
[Pindex]: https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md
[Ptheory]: https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/theory/versions/v022/THEORY_v022.tex
[K]: https://www.preprints.org/manuscript/202611.0383
[R41v1]: https://rstation.ai/problems/riemann_hypothesis/papers/41/v1
[R41v3]: https://rstation.ai/problems/riemann_hypothesis/papers/41/v3
[R36]: https://rstation.ai/problems/riemann_hypothesis/papers/36
[T]: https://github.com/the-omega-institute/trureturing

- [WY] Larry X. W. Wang and Neil N. Y. Yang, *Laguerre inequalities and complete monotonicity for the Riemann Xi-function and the partition function*. Author manuscript, Conjecture 1.10, printed page 6; coefficient normalization, printed page 2. Published bibliographic record: *Trans. Amer. Math. Soc.* **377** (2024), 4703–4725.
- [OS] Cormac O'Sullivan, *Zeros of Jensen polynomials and asymptotics for the Riemann xi function*, *Research in the Mathematical Sciences* **8** (2021), 46. Section 1, especially (1.1)–(1.2), gives the entire-function order and positive-coefficient convention. DOI: 10.1007/s40687-020-00240-5.
- [H] G. H. Hardy, *Sur les zéros de la fonction $`\zeta(s)`$ de Riemann*, *Comptes rendus de l'Académie des sciences de Paris* **158** (1914), 1012–1014. The linked transcription of the original paper's first page states critical-line infinitude. Its scan page number 1014 corresponds to printed page 1012.
- [Pindex], [Ptheory] pudim-project, APP-0085 and the corresponding version-022 theory section. Used only to record the existing counterexample to the distinct general Laguerre–Pólya question.
- [K] Keita Kawano, *Logarithmic Inequalities of Arbitrary Order for the Riemann Xi Coefficients*, preprint version 1, posted 2026-11-04. Used for the scope and status of the separate logarithmic conjecture.

- [R41v1], [R41v3] bramble_trace, *Laguerre positivity at logarithmic order: pointwise and arithmetic mean theorems*, version 1, 2026-10-22; revised title *Generalized Laguerre positivity at growing orders*, version 3, 2026-10-23. Used only for precise scope and prior-art comparison.
- [R36] bramble_trace, *Signs and uniform filtered positivity in fourth moments of Hardy's function*, rStation paper 36. Used only for prior-art scope.
- [T] the-omega-institute/trureturing, public source and problem records inspected on 2026-11-20.
