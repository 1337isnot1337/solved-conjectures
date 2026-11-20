# Wagner's conjecture

## Exact target and status

The target is Conjecture 4.3 of Ian Wagner, *On a new class of Laguerre–Pólya type functions with applications in number theory*, arXiv:2108.01827v2, 27 June 2022, §4.2, p. 11. It asserts
\[
 \phi\in SL\!-\!P^+
 \quad\Longrightarrow\quad
 L_j(\phi)\in SL\!-\!P^+
 \qquad(j\in\mathbb N).
 \tag{W}
\]
Here the Laguerre operators are defined by
\[
 |\phi(x+iy)|^2=\sum_{j\ge0}L_j(\phi)(x)y^{2j}.
 \tag{1}
\]

**Mathematical result:** (W) is false. The real entire function
\[
 \phi(z)=e^z+1
 \tag{2}
\]
belongs to the stated positive shifted class, whereas
\[
 L_1(\phi)(z)=-e^z
 \tag{3}
\]
does not.

**Review status, 20 November 2026:** complete elementary counterexample, with independent mathematical and original-preprint checks passed by the root and transfer reviewers. No prior exact refutation was found in the bounded audit below. The final typeset text and a later full article remain explicit access limits.

This is the full universal function-operator conjecture. Wagner's separate Conjectures 4.1 and 4.2 concern Turán transforms of sequences and contain an eventual-increase condition. That condition is absent from Conjecture 4.3. The present note does not assert a resolution of those separate statements or of the partition thresholds in Table 2.

## Definitions and their quantifiers

Write a real entire function as
\[
 f(z)=\sum_{k\ge0}\gamma_k\frac{z^k}{k!}.
\]
In the definition on p. 3 of the cited v2, membership in \(SL\!-\!P\) requires real polynomial approximants \(f_N\), of degrees \(d_N\), converging uniformly on every compact subset of \(\mathbb C\), such that for every fixed positive integer \(d\), there is an index \(N(d)\) for which
\[
 f_N^{(d_N-d)}
\]
has only real zeros whenever \(N\ge N(d)\). For type I, those zeros have the same sign. The positive shifted class \(SL\!-\!P^+\) additionally requires \(\gamma_k\ge0\) for all sufficiently large \(k\).

Thus positivity is a condition on the Taylor coefficients of the function itself, including their eventual sign. It does not identify a function with its negative. In particular, \(-e^z\) fails the positivity condition at every coefficient index.

The proof below verifies the approximation definition directly, with one common approximating sequence for all fixed degrees \(d\).

## Proof

For each integer \(N\ge1\), set
\[
 f_N(z)=\left(1+\frac zN\right)^N+1.
 \tag{4}
\]
This is a real polynomial of degree exactly \(N\). For every fixed compact subset of \(\mathbb C\),
\[
 \left(1+\frac zN\right)^N\longrightarrow e^z
\]
uniformly. For example, on \(|z|\le R\), the expansion
\(N\log(1+z/N)=z+O_R(N^{-1})\) is uniform once \(N>2R\). Hence \(f_N\to\phi\) locally uniformly.

Fix any positive integer \(d\). For every \(N\ge d+1\), the derivative order \(N-d\) is positive, so it kills the added constant in (4), giving
\[
 f_N^{(N-d)}(z)
 =\frac{N!}{d!\,N^{N-d}}
   \left(1+\frac zN\right)^d.
 \tag{5}
\]
Its \(d\) zeros, counted with multiplicity, are all equal to \(-N\). Therefore the definition of the shifted type-I class holds with \(d_N=N\) and \(N(d)=d+1\). Moreover,
\[
 \gamma_0=2,\qquad \gamma_k=1\quad(k\ge1),
\]
so all Taylor coefficients are positive. Consequently \(\phi\in SL\!-\!P^+\).

By (1), or by the explicitly stated first operator in Wagner's equation (1.2),
\[
 L_1(f)=(f')^2-ff''.
\]
For (2), both \(\phi'\) and \(\phi''\) equal \(e^z\), and therefore
\[
 L_1(\phi)
 =e^{2z}-(e^z+1)e^z=-e^z.
\]
Every exponential-generating Taylor coefficient of this function equals \(-1\). It is not eventually nonnegative, so \(L_1(\phi)\notin SL\!-\!P^+\). This contradicts (W). \(\square\)

As a separate check on membership, Wagner's shifted Jensen polynomials for this sequence satisfy
\[
 J_\gamma^{d,n}(z)
 =\sum_{k=0}^{d}\binom dk\gamma_{n+k}z^k
 =(1+z)^d
 \qquad(n\ge1).
\]
This agrees with the type-I condition, although no equivalence theorem is needed in the proof.

## Mechanism and scope

The example is not an isolated decimal or a finite numerical verification. For every \(A,B,a>0\), the same approximants show that
\[
 f(z)=Ae^{az}+B\in SL\!-\!P^+.
\]
Its exact expansion is
\[
 |f(x+iy)|^2=A^2e^{2ax}+B^2+2ABe^{ax}\cos(ay).
\]
Consequently,
\[
 L_j(f)(x)=\frac{2AB(-1)^ja^{2j}}{(2j)!}e^{ax}
 \qquad(j\ge1).
\]
Every odd \(j\) gives negative Taylor coefficients. These are counterexamples to one universal conjecture, not separate resolved targets.

The reason is visible in the proof: high derivatives of the approximating polynomials erase the added constant, while \(L_1\) multiplies the undifferentiated function by its second derivative. Positivity of the shifted class therefore does not survive this nonlinear operator.

The result is unconditional. It was found while studying the shifted Laguerre–Pólya and Jensen-polynomial framework motivated by the Riemann \(\Xi\)-function. It does not use the campaign's accepted RH or Dirichlet-GRH input, and it does not prove RH.

## Prior-art audit

Audit date: 20 November 2026.

1. **Original statement and definitions.** The full current arXiv v2 was read at pp. 3–4 and 10–12. The approximation derivative is precisely \(d_N-d\), the positivity condition is eventual nonnegativity, and Conjecture 4.3 has the quantifiers in (W). The first-operator normalization is explicit on p. 4. The arXiv record lists only v1 (2021) and v2 (2022); no later arXiv revision was found.
2. **Publication record.** The journal's author index and the arXiv record identify the publication as *Pacific Journal of Mathematics* **320** (2022), 177–192, DOI 10.2140/pjm.2022.320.177. Crossref identifies the final [article landing page](https://msp.org/pjm/2022/320-1/p07.xhtml) and [screen-PDF endpoint](https://msp.org/pjm/2022/320-1/pjm-v320-n1-p07-s.pdf). The root reviewer attempted public retrieval; the nominal PDF endpoint returned article HTML rather than the PDF. The final typeset text was therefore not inspected. The exact statement here is explicitly pinned to the full author preprint.
3. **Exact-target searches.** Both available search engines were queried for the exact title, Conjecture 4.3, shifted Laguerre–Pólya operator preservation, the witness \(e^x+1\), and correction/refutation/counterexample variants. No earlier resolution of (W) was located. Results concerning other mathematicians named Wagner, the discrete partition thresholds, and other numbered Conjectures 4.3 were excluded by checking their scope.
4. **Later discrete Laguerre results.** Wang–Yang's 2022 discrete-sequence paper, Dou–Wang's higher-order partition work, Wang–Yang's 2024 Xi/partition paper, and Gajdzica's 2024 quasi-polynomial paper concern coefficient-sequence inequalities or eventually valid finite-order inequalities. The retrieved statements do not assert preservation of the entire positive shifted class by \(L_j\).
5. **Specific 2026 unresolved access check.** Fan–Wang, *The operators preserving real-rootedness and inequalities for symmetric function*, *Advances in Applied Mathematics* **178** (2026), 103092, DOI 10.1016/j.aam.2026.103092, says in its public abstract and introduction that §2 partially settles a Wagner conjecture on shifted multiplier sequences. The full article has not yet been obtained. Its visible description is consistent with a sequence-transform result, but this note does not claim to have checked all of §2 or to have excluded an incidental remark containing the present counterexample.
6. **Institutional and current checks.** Nankai's public 2025 and 2026 publication lists, exact author/title searches for Fan–Wang, and recent GitHub/arXiv searches were checked for an accessible manuscript or exact refutation. No relevant full manuscript or prior refutation was found. The journal author index lists the 2022 paper without a separate correction entry. These checks do not prove that no unindexed or unpublished result exists.
7. **Secondary exact-statement catalog.** The current MathDB entry reproduces (W), reports no posted solution, and has no progress summary. This is a discovery aid only; it does not establish priority.

The negative-search conclusion is bounded: no prior exact refutation has been found in the inspected material. The proof is complete and internally reviewed independently of the priority audit. The publication and 2026 full-text access limitations remain material to priority confidence. An earlier exact refutation or changed final statement would require revising the campaign classification.

## Sources

- Ian Wagner, *On a new class of Laguerre–Pólya type functions with applications in number theory*, [arXiv:2108.01827v2](https://arxiv.org/abs/2108.01827v2), [full author PDF](https://arxiv.org/pdf/2108.01827v2); *Pacific J. Math.* **320** (2022), 177–192, [DOI](https://doi.org/10.2140/pjm.2022.320.177).
- [Pacific Journal of Mathematics author index, Wagner, Ian](https://msp.org/index/ail.php?jpath=pjm&l=W).
- Larry X. W. Wang and Eve Y. Y. Yang, *Laguerre inequalities for discrete sequences*, [publisher record](https://www.sciencedirect.com/science/article/abs/pii/S0196885822000410).
- Larry X. W. Wang and Neil N. Y. Yang, *Laguerre inequalities and complete monotonicity for the Riemann Xi-function and the partition function*, *Trans. Amer. Math. Soc.* **377** (2024), 4703–4725, [DOI](https://doi.org/10.1090/tran/9081).
- Krystian Gajdzica, *The Turán and Laguerre inequalities for quasi-polynomial-like functions*, *Research in Number Theory* **10** (2024), 46, [full publisher text](https://link.springer.com/article/10.1007/s40993-024-00532-7).
- Jia-Tao Fan and Larry X. W. Wang, *The operators preserving real-rootedness and inequalities for symmetric function*, *Adv. Appl. Math.* **178** (2026), 103092, [publisher abstract and preview](https://www.sciencedirect.com/science/article/pii/S0196885826000643), [DOI](https://doi.org/10.1016/j.aam.2026.103092).
- [Nankai 2025 publication list](https://cfc.nankai.edu.cn/2025nml/list.htm) and [2026 publication list](https://cfc.nankai.edu.cn/27435/list.htm).
- [MathDB exact target](https://mathdb.com/p/351518/laguerre-operators-preserve-the-positive-shifted-laguerre-po).

## Independent review

- **Transfer reviewer:** [issue #137, comment 7050586651](https://github.com/1337isnot1337/solved-conjectures/issues/137#issuecomment-7050586651). Independently read the original arXiv definitions, the exact Conjecture 4.3 paragraph, and equations (1.2)–(1.3); checked the common approximating sequence, derivative order and degree, eventual positivity, and the full \(Ae^{az}+B\) calculation. Mathematical review passed. The receipt keeps the outstanding publication/prior-art access limits separate.

- **Root reviewer:** [issue #137, comment 7050617860](https://github.com/1337isnot1337/solved-conjectures/issues/137#issuecomment-7050617860). Independently read the full note and original arXiv statement; checked the common approximants, derivative quantifiers, eventual coefficient positivity, and operator computation. Mathematical and exact-preprint scope review passed. The review also records the final publisher endpoints and the failure to retrieve the typeset PDF.
