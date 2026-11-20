# Banks–Friedlander–Luca–Pappalardi–Shparlinski conjecture

Research date: 20 November 2026. This is an application of the accepted Dirichlet-GRH theorem at [archive commit 9d5316e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). No Lean work is involved.

## Full statement and outcome

Let \(\lambda(n)\) be the exponent of the finite group \((\mathbb Z/n\mathbb Z)^\times\), with \(\lambda(1)=1\). Then
\[
\boxed{\forall n\ge1\ \exists m\ge1:\quad m\ne n,\quad\lambda(m)=\lambda(n).}
\tag{1}
\]

This is the full conjecture proposed by Banks, Friedlander, Luca, Pappalardi and Shparlinski [1]. Under the owner's accepted source theorem, it follows completely from Ford–Luca [2]. Their ERH means the Riemann hypothesis for Dirichlet \(L\)-functions; no Dedekind or nonabelian Artin family is required.

The conditional proof is Ford and Luca's. This note documents its use and checks the exact hypotheses. It does not claim a new conditional theorem or exclusive priority for this application.

Statement (1) concerns Carmichael's **lambda function**. It does not settle Carmichael's conjecture about Euler's **phi function**. The names of the five original conjecture authors above correct the provisional author list in the coordination comment.

## Imported analytic theorem and version map

For a prime \(q\), form its Pratt tree by replacing a prime node \(r\) with the maximal prime powers dividing \(r-1\), and continuing downwards. Let \(f(q)\) be the largest proper prime power appearing anywhere in this tree; put \(f(q)=1\) if there is none. Equivalently,
\[
f(2)=1,\qquad
f(q)=\max\left(
 \{f(r):r\parallel q-1\}
 \cup\{r^b:r^b\parallel q-1,\ b\ge2\}
 \right).
\tag{2}
\]
An empty maximum has value 1.

Ford–Luca's full conditional theorem supplies
\[
\forall p\text{ prime},\ \forall a\ge1,\quad
\exists q\text{ prime}:\quad p^a\mid q-1,\quad f(q)<p^{a+1}.
\tag{3}
\]
Their proof also gives \(p^a\parallel q-1\). This exact multiplicity follows from (3): if \(p^{a+1}\mid q-1\), the tree would contain a proper prime power at least \(p^{a+1}\).

The April 3, 2011 corrected author version [2a] numbers (3) as Conjecture2, proves ERH implies it in Theorem2, and proves (3) implies (1) in Theorem1. The journal-hosted layout [2b] numbers the corresponding assertions Conjecture3, Theorem5 and Theorem4. The differing numbers are layout/version differences, not different mathematical hypotheses.

The accepted source gives GRH for every primitive Dirichlet character and hence for every Dirichlet \(L\)-function: omitted Euler factors of an imprimitive character have zeros on \(\Re s=0\). It therefore supplies the ERH in [2a, Theorem2] for all the moduli used there. Applying that theorem gives (3) for every prime power. The remaining arithmetic implication is recorded below.

## Arithmetic deduction for every integer

Assume a counterexample to (1) exists and choose the smallest, \(n_0\). Write \(L=\lambda(n_0)\). We use
\[
\lambda(n)=\operatorname{lcm}_{p^e\parallel n}\lambda(p^e),
\quad
\lambda(p^e)=p^{e-1}(p-1)\quad(p\text{ odd}),
\]
and \(\lambda(2)=1,\lambda(4)=2,\lambda(2^e)=2^{e-2}\) for \(e\ge3\).

First, \(16\mid n_0\). An odd input can be doubled, an input with exactly one factor of 2 can be halved, and inputs with 2-adic valuation 2 or 3 can have that valuation exchanged between 2 and 3 without changing lambda.

Second, whenever a prime \(r\) satisfies \(r-1\mid L\), we have \(r^2\mid n_0\). If \(r\nmid n_0\), multiplication by \(r\) gives an immediate collision. If \(r\parallel n_0\), minimality supplies an integer \(m\ne n_0/r\) with
\(\lambda(m)=\lambda(n_0/r)\).
If \(r\mid m\), then \(r-1\mid\lambda(n_0/r)\), making \(n_0/r\) a collision. If \(r\nmid m\), then
\[
\lambda(rm)=\operatorname{lcm}(r-1,\lambda(m))=L,\qquad rm\ne n_0,
\]
again a collision.

Let \(p^{a+1}\) be the smallest prime power not dividing \(L\). Each prime power in \(p-1\) is smaller, so \(p-1\mid L\) and the preceding fact gives \(p^2\mid n_0\). Thus \(a\ge1\); when \(p=2\), the stronger \(16\mid n_0\) gives \(a\ge2\).

Set \(b=a+1\) for odd \(p\), and \(b=a+2\) for \(p=2\). Then
\[
p^b\parallel n_0.
\tag{4}
\]
A larger valuation would force \(p^{a+1}\mid L\). A smaller valuation would allow multiplication of \(n_0\) by \(p\) without changing lambda, since the new prime-power contribution still divides \(L\).

For every prime \(r\) with \(f(r)<p^{a+1}\), we claim \(r^2\mid n_0\). Induct on \(r\). The case \(r=2\) is covered already. For each prime-power factor \(s^c\parallel r-1\), either \(c\ge2\), in which case
\(s^c\le f(r)<p^{a+1}\) and therefore \(s^c\mid L\), or \(c=1\), in which case \(f(s)<p^{a+1}\). The inductive hypothesis then gives \(s^2\mid n_0\). For odd \(s\), this implies \(s\mid L\); for \(s=2\), the earlier fact \(16\mid n_0\) supplies \(2\mid L\). It follows that \(r-1\mid L\), and the previous paragraph gives \(r^2\mid n_0\).

Choose \(q\) from (3). Then \(q>p\), \(q^2\mid n_0\), and
\[
p^a\mid q-1\mid \lambda(n_0/p^b).
\]
Consequently, removing one factor \(p\) from the \(p^b\) component of \(n_0\) loses no factor in the least common multiple defining lambda:
\[
\lambda(n_0/p)
=\operatorname{lcm}\bigl(\lambda(p^{b-1}),\lambda(n_0/p^b)\bigr)
=\lambda(n_0).
\]
For odd \(p\), the factor \(p-1\) remains in \(\lambda(p^{b-1})\); for \(p=2\), it is 1. This contradicts the definition of \(n_0\), proving (1).

This is the minimal-counterexample argument behind [2a, Theorem1], included to make the endpoint and the prime-2 convention inspectable.

## Scope and finite dependencies

The imported theorem proves (3) for **all** prime powers. Its published proof combines the ERH progression estimate, prime-chain bounds, and a finite PARI/GP verification. The finite part covers \(a=1,\ p\le18{,}000{,}000\), and \(a\ge2,\ p^a\le10^{10}\). It also uses an explicitly bounded matrix in the prime-chain estimate. We rely on those as parts of the published theorem; they were not independently rerun here.

This campaign is not claiming a larger checked numerical range. Its conclusion is the original universal conjecture (1). It also does not infer (1) merely from the unconditional “all sufficiently large prime powers” theorem: that would leave precisely the finite gap the conditional result closes.

The separate Pratt-tree statement (3) is useful stronger content, but is not automatically counted as another newly named solved conjecture.

## Prior-resolution audit

The following checks were made on 20 November 2026.

- The original 2006 paper [1], especially its introduction and section7, identifies the lambda analogue and its counterexample structure. The authors and the lambda/phi distinction were checked in the publisher's copy.
- The corrected author manuscript, arXiv version history, journal-hosted PDF, and publisher record of [2] all state the conditional nature of the complete result.
- Ford's [annotated publication list](https://www.ford126.web.illinois.edu/papers-ann.html), Shparlinski's [publication list](https://web.maths.unsw.edu.au/~igorshparlinski/Publ.html), and Pomerance's [publication list](https://math.dartmouth.edu/~carlp/) were checked for later relevant results.
- Ford–Luca–Pomerance's 2014 paper on the **image** of lambda concerns the number of distinct values; it does not assert the absence of singleton fibers. Results on runs of equal values or on Carmichael numbers in progressions likewise have different statements.
- Both search systems were used with the exact title, all author names, “multiplicity,” “singleton,” “unique preimage,” “proved,” “resolved,” “GRH,” and 2025–2026 filters. No later full unconditional resolution of (1) was located in the returned primary records.
- The [164-page October QRH inventory](https://hexagonmath.org/pdf/2610.00178v1) was checked for Carmichael, multiplicity and lambda. Its Carmichael references concern deterministic factoring reductions and Carmichael numbers, not this fiber conjecture.
- Scoped current searches of OpenAI/math, Hexagon and qqliu/CoPEER returned no prior application to this exact target. Direct retrieval of one additional follow-up repository returned 404, and a recursive tree request for CoPEER failed; neither failure is counted as a successful archive audit.

These are bounded searches. They support treating (1) as a candidate full consequence of the accepted source, but do not establish exclusive historical priority. The old conditional implication is explicitly credited.

## Sources

1. W. D. Banks, J. B. Friedlander, F. Luca, F. Pappalardi and I. E. Shparlinski, *Coincidences in the values of the Euler and Carmichael functions*, Acta Arithmetica **122** (2006), 207–234. [DOI](https://doi.org/10.4064/aa122-3-1), [publisher PDF](https://www.impan.pl/shop/en/publication/transaction/download/product/83870).
2. K. Ford and F. Luca, *The number of solutions of lambda(x)=n*, Integers **11A** (2011), Article9. [Corrected author PDF, April3,2011 (2a)](https://www.ford126.web.illinois.edu/wwwpapers/lambda.pdf), [journal-hosted PDF (2b)](https://math.colgate.edu/~integers/a7int2009/a7int2009.pdf), [arXiv:1010.5442v2](https://arxiv.org/abs/1010.5442v2), [publisher DOI](https://doi.org/10.1515/integ.2011.029).
3. K. Ford, S. V. Konyagin and F. Luca, *Prime chains and Pratt trees*, [author PDF](https://www.ford126.web.illinois.edu/wwwpapers/chains.pdf), [arXiv:0906.3380](https://arxiv.org/abs/0906.3380). The counting input in [2].
4. K. Ford, F. Luca and C. Pomerance, *The image of Carmichael's lambda-function*, Algebra & Number Theory **8** (2014), 2009–2026. [DOI](https://doi.org/10.2140/ant.2014.8.2009).

## Review status

Complete inherited deduction, with the original theorem and the arithmetic implication inspected by root. Independent review is requested. No Lean verification or external peer review is claimed.

## Independent review

On 20 November 2026, a separate analytic worker checked the entire implication against both Ford–Luca PDF versions. The review confirmed the exact Dirichlet-ERH hypothesis, the theorem-number mapping, the minimal-counterexample argument, and all valuations at the prime 2. Its one requested clarification, explicitly using \(16\mid n_0\) in the prime-2 induction step, is included above. The review receipt is [issue #120, comment 7049648213](https://github.com/1337isnot1337/solved-conjectures/issues/120#issuecomment-7049648213). Internal review is not external peer review.
