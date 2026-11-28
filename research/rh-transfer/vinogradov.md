# Vinogradov's conjecture

Status: a complete inherited consequence of the accepted Dirichlet GRH input, with an earlier public 2026 application already identified. This note makes no original solution or priority claim. It does not add a new target count.

Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). The input convention is the same as in [dirichlet-applications.md](dirichlet-applications.md).

## 1. Exact target

For an odd prime p, let n(p) be the least positive quadratic nonresidue modulo p. The conjecture is

~~~math
\forall\varepsilon>0\ \exists C_\varepsilon>0
\ \forall\text{ odd primes }p,\qquad
n(p)\le C_\varepsilon p^\varepsilon.
\tag{1}
~~~

This is precisely Conjecture 1.1 in Terence Tao, [The Elliott–Halberstam conjecture implies the Vinogradov least quadratic nonresidue conjecture](https://msp.org/ant/2015/9-4/ant-v9-n4-p09-p.pdf), Algebra & Number Theory 9 (2015), 1005–1034, DOI [10.2140/ant.2015.9.1005](https://doi.org/10.2140/ant.2015.9.1005).

The target has no exceptional primes and no restriction on the factorization of p−1. It is distinct from conjectures predicting an optimal bound near log p log log p. We do not relabel a stronger logarithmic conjecture as (1).

Tao's introduction credits Linnik (1942) with the implication from GRH and Ankeny (1952) with the stronger conditional bound n(p) ≪ (log p)^2. Thus the implication needed here is classical.

## 2. A full primitive-root consequence from the same input

Let g(p) be the least positive primitive root modulo p, and let g*(p) be the least prime that is a primitive root modulo p. Every primitive root modulo an odd prime is a quadratic nonresidue: a square has order dividing (p−1)/2. Hence

~~~math
n(p)\le g(p)\le g^*(p).
\tag{2}
~~~

Greg Martin's [The Least Prime Primitive Root and the Shifted Sieve](https://arxiv.org/pdf/math/9807104), Acta Arithmetica 80 (1997), 277–288, Proposition 3 and Corollary 3.1, gives under GRH for the relevant Dirichlet characters modulo p

~~~math
g^*(p)\ll
\bigl(\omega(p-1)\log_1\omega(p-1)\bigr)^4(\log p)^2,
\qquad
\log_1 u=\max(1,\log u).
\tag{3}
~~~

The implied constant is absolute. Martin explicitly credits the prime-modulus result to Victor Shoup, [Searching for Primitive Roots in Finite Fields](https://shoup.net/papers/primroots.pdf), Mathematics of Computation 58 (1992), 369–380. Martin also explains that the argument bounds the least prime primitive root, although the earlier statements concerned primitive roots.

The accepted Dirichlet GRH input supplies every character hypothesis in (3). This application does not require GRH for Dedekind zeta functions of Kummer fields. Such fields arise in the distinct fixed-base Artin problem.

For completeness, the arithmetic simplification in (3) is uniform. Put r=ω(p−1). If the distinct prime divisors of p−1 are listed increasingly, the j-th is at least j+1. Therefore

~~~math
(r+1)!\le p-1.
~~~

For r≥4, at least r/2 of the integers from 1 to r are at least r/2, so

~~~math
\log((r+1)!)\ge \frac r2\log(r/2)\gg r\log r.
~~~

The cases r<4 are absorbed by an absolute constant. Consequently

~~~math
r\log_1 r\ll\log p,
~~~

and (3) becomes

~~~math
g^*(p)\ll(\log p)^6.
\tag{4}
~~~

For every fixed ε>0, the function t^6 e^(−εt) is bounded for t≥log 3. Substituting t=log p in (4), then using (2), proves the complete quantified statement

~~~math
n(p)\le g(p)\le g^*(p)\ll_\varepsilon p^\varepsilon.
\tag{5}
~~~

This derivation has no restriction to almost all primes, bounded ω(p−1), or a numerical range. It is a reproduction of a published conditional consequence, not a new argument for Vinogradov's conjecture.

The sharper n(p) ≪ (log p)^2 from Ankeny is available under the same accepted input. The exponent 6 in this note is used only to give a single explicit argument that also controls primitive roots. Optimizing that exponent would not create another named result.

## 3. Naming audit

Searches for the exact combinations “Chowla” and “least primitive root,” and for variants involving a subpower bound, did not locate a primary formulation attributing (5)'s primitive-root statement to Chowla.

The current public discussion calls it Vinogradov's least primitive-root conjecture. We therefore do not create a conjecture entry under the unsupported name “Chowla's least primitive-root conjecture.”

This is separate from Chowla's conjecture on the least prime in a prescribed reduced residue class, discussed in [chowla.md](chowla.md). A prime primitive root is allowed to lie in any primitive-root residue class. The union of those classes is much larger than one prescribed class, and the estimates above do not prove the least-prime-in-one-class conjecture.

## 4. Prior 2026 application

The exact weaker-input application was public before this campaign:

- On October 13, 2026, the question [Does OpenAI's Quasi-Riemann Hypothesis imply Vinogradov's least primitive root conjecture?](https://math.stackexchange.com/questions/5151787/does-openais-quasi-riemann-hypothesis-qrh-imply-vinogradovs-least-primitive) combined Martin's Proposition 3 with the proposed uniform zero-free half-plane Re s>7/8.
- Greg Martin commented on October 13 that the proposed derivation was correct, conditional on that analytic input.
- The answer, dated October 24 and edited October 26, gives g*(p) ≪ (log p)^24 and explicitly deduces the subpower conjecture.

That thread is a primary record of the earlier public application. The mathematical theorem used in this note is Martin's paper, not a forum assertion. A subsequent direct read of the [primary September 30 manuscript source](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex), blob 268c4e3206d460c617d3d2129742a72b831b3def, verified its corollary labelled cor:nonresidues-square-roots. It explicitly claims n(p) ≤ C(log p)^A for every odd prime, states the Vinogradov consequence, and takes A=32 in its proof. The [October 5 companion source](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex), blob 2000faddbbebac5de0ecfe0b962534ea61a852d5, also explicitly lists the full nonresidue consequence. These claims are recorded for prior attribution; neither is a proof input of this note.

The same mechanism explains the exponent 24. Martin's Proposition 3 allows any fixed σ with 1/2≤σ<1, provided its specified zero-free rectangle is available. A uniform zero-free half-plane with boundary σ supplies every such rectangle. The arithmetic factors above give

~~~math
g^*(p)\ll_\sigma(\log p)^{3/(1-\sigma)}.
~~~

Thus σ=7/8 gives exponent 24, while the accepted Dirichlet GRH gives exponent 6. The improvement from 24 to 6 is an inherited change in the analytic input, not a new full conjecture.

The existence of an announcement is not by itself independent verification of its proof. We neither certify nor refute the earlier QRH manuscript here. What is settled for this campaign is the attribution question: this is not a previously unreported application.

## 5. Search record and scope decision

The November 20, 2026 search checked the exact target, both naming variants, the earlier conditional proofs, and recent claims. Primary materials inspected included Tao's full paper, Martin's full paper, Shoup's paper, and the dated public discussion containing Martin's own comment. Current context was cross-checked against Kai (Steve) Fan and Paul Pollack, [Counting primes with a given primitive root, uniformly](https://londmathsoc.onlinelibrary.wiley.com/doi/full/10.1112/mtk.70055), Mathematika 71 (2025), whose introduction records the conditional logarithmic least-primitive-root bound.

Queries included “Vinogradov least quadratic nonresidue 2026 proof,” “Vinogradov least primitive root conjecture 2026,” and “Chowla least primitive root conjecture,” using both search engines across the screen.

Decision: retain the full classical consequence as documented infrastructure. Exclude it from any claim of new mathematical discovery or a newly identified transfer. No finite-case result, extra naming variant, or logarithmic-exponent improvement is counted separately.
