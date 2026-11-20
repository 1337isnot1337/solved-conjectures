# Carmichael's conjecture

## Status and scope

**Open in this research attempt.** The accepted rational Dirichlet GRH package does yield the complete theorem in §4: Pomerance's 1974 sufficient criterion for a counterexample can never hold. That theorem does not prove Carmichael's conjecture, because the sufficient criterion has not been shown necessary. It also does not prove the stronger prime-product assertion explicitly called Pomerance's conjecture in Barthel–Müller [BM, Conjecture 10].

This file records the exact transferable result and the multiplicative obstruction. It is not counted as a completed named-conjecture resolution.

Source dependency: \`1337isnot1337/riemann-hypothesis-solved\`, accepted pin \`9d5316ec73f5df89c4d95703ed106837b8a4060e\`, through rational Dirichlet GRH. No general Hecke/Artin GRH or Lean verification is used. The mathematical implication below remains conditional on the accepted package when considered independently of that repository.

Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). The related, distinct \(\lambda\)-function argument is in [banks-friedlander-luca-pappalardi-shparlinski.md](banks-friedlander-luca-pappalardi-shparlinski.md).

## 1. Exact target

Carmichael's conjecture says that for every positive integer \(n\), there is a positive integer \(m\ne n\) such that
\[
\varphi(m)=\varphi(n).
\]

Here \(\varphi\) is Euler's totient function. The conjecture about equal values of Carmichael's function \(\lambda\) is a different assertion.

Write
\[
\operatorname{rad}(n)=\prod_{p\mid n}p,\qquad
E(n)=\frac{n}{\operatorname{rad}(n)}.
\]
We use \(v_p\) for the usual prime valuation. An integer \(n\) is a hypothetical unique preimage when \(\varphi(m)=\varphi(n)\) implies \(m=n\).

## 2. What uniqueness actually forces

Any unique preimage satisfies \(4\mid n\): if \(n\) is odd then \(2n\) is a second preimage; if \(v_2(n)=1\), then \(n/2\) is a second preimage.

### Elementary closure lemma

If \(n\) is a unique preimage and a prime \(p\) satisfies
\[
p-1\mid E(n),
\tag{2.1}
\]
then \(p^2\mid n\).

**Proof.** If \(p\nmid n\), put \(m=np/(p-1)\). Division by \(p-1\) leaves every existing prime divisor present, by (2.1). Therefore
\[
\varphi\!\left(\frac{n}{p-1}\right)=\frac{\varphi(n)}{p-1},
\qquad
\varphi(m)=(p-1)\varphi\!\left(\frac{n}{p-1}\right)=\varphi(n).
\]
The new prime \(p\) makes \(m\ne n\).

If \(p\parallel n\), then every prime divisor of \(p-1\) already divides \(n/p\). Put \(m=n(p-1)/p\). Multiplication by \(p-1\) changes only exponents of primes already present, so
\[
\varphi(m)=(p-1)\varphi(n/p)=\varphi(n),
\]
and \(m<n\). Both cases contradict uniqueness. \(\square\)

This is the closure condition used in the original Carmichael argument, written as (1.2) in [F13]. It is stronger in its hypothesis than \(p-1\mid\varphi(n)\).

### Carmichael–Klee closure lemma

The following more flexible condition is [F98, Lemma 7.2]. Suppose \(n\) is a unique preimage and
\[
d\mid n,\quad (d,n/d)=1,\quad
\operatorname{rad}(\varphi(d))\mid n,\quad
e\mid E(n/d).
\]
If
\[
P=1+e\varphi(d)
\tag{2.2}
\]
is prime, then \(P^2\mid n\).

Here is a proof to make the resource condition explicit. Set \(w=n/d\). If \(P\nmid n\), then \(m=Pw/e\) is an integer and
\[
\varphi(m)=(P-1)\frac{\varphi(w)}e
=\varphi(d)\varphi(w)=\varphi(n).
\]
Also \(P\mid m\) and \(P\nmid n\), so \(m\ne n\).

If \(P\parallel n\), every prime divisor of \(P-1=e\varphi(d)\) divides \(n\). None is \(P\); hence every such divisor remains in \(n/P\). The integer \(m=n(P-1)/P<n\) then satisfies
\[
\varphi(m)=(P-1)\varphi(n/P)=\varphi(n).
\]
This again contradicts uniqueness. \(\square\)

Thus the permitted closure uses a coprime block \(d\), the full factor \(\varphi(d)\), and an excess-exponent divisor \(e\). Replacing these conditions by mere divisibility of \(P-1\) into \(\varphi(n)\) would require an additional argument.

## 3. Imported prime-tree theorem

For a prime \(q\), form its Pratt tree by factoring \(q-1\), and recursively factoring \(p-1\) for primes \(p\) encountered. Let \(f(q)\) be the largest proper prime power in this tree; “proper” means exponent at least two. Set \(f(2)=1\). An equivalent recursive definition is
\[
f(q)=
\max\left(
\{f(r):r\parallel q-1\}
\cup
\{r^b:r^b\parallel q-1,\ b\ge2\}
\right).
\tag{3.1}
\]
The maximum is \(1\) when the tree has no proper prime power.

Ford–Luca [FL, Conjecture 2 and Theorem 2] prove, under ERH for Dirichlet \(L\)-functions:

> For every prime \(p\) and every integer \(a\ge1\), there is a prime \(q\) such that
> \[
> p^a\mid q-1,\qquad f(q)<p^{a+1}.
> \tag{3.2}
> \]

Their introduction specifies the Dirichlet scope. The accepted rational Dirichlet GRH package supplies this hypothesis. In particular, (3.2) is available here for every prime power, not merely an unspecified sufficiently large range.

The bound concerns the proper prime powers throughout the tree. It does not assert \(q<p^{a+1}\), or \(q\) less than an arbitrary other prime having the same congruence.

## 4. Complete consequence: Pomerance's proposed criterion cannot hold

Pomerance [P74] gave the following sufficient condition for a unique totient preimage:
\[
\text{for every prime }r,\qquad
r-1\mid\varphi(n)\ \Longrightarrow\ r^2\mid n.
\tag{P}
\]
See also [F13, §1] and [BM, Theorem 9]. The abstract of [P74] conjectures that no positive integer satisfies this condition.

### Theorem

Assume (3.2). For every positive integer \(n\), there is a prime \(r\) such that
\[
r-1\mid\varphi(n)\qquad\text{and}\qquad r^2\nmid n.
\tag{4.1}
\]
Consequently no integer satisfies (P). The theorem follows from rational Dirichlet GRH through [FL].

**Proof.** Suppose that \(n\) satisfies (P), and put \(M=\varphi(n)\). Let
\[
K=p^{a+1}
\]
be the smallest prime power, in ordinary numerical order, not dividing \(M\). Initially \(a\ge0\). Every prime-power factor of \(p-1\) is smaller than \(p\), hence smaller than \(K\), and therefore divides \(M\). Thus \(p-1\mid M\). By (P), \(p^2\mid n\), which implies \(p\mid M\). Hence \(a\ge1\), and minimality of \(K\) gives
\[
v_p(M)=a.
\tag{4.2}
\]

We claim that
\[
f(r)<K\quad\Longrightarrow\quad r^2\mid n
\tag{4.3}
\]
for every prime \(r\). Prove this by induction over the primes. For \(r=2\), (P) applies because \(1\mid M\).

Suppose \(r>2\), \(f(r)<K\), and (4.3) holds at all smaller primes. For each exact prime-power factor \(s^b\parallel r-1\):

- If \(b\ge2\), then \(s^b\le f(r)<K\), so \(s^b\mid M\) by the definition of \(K\).
- If \(b=1\), then \(f(s)\le f(r)<K\). The induction hypothesis gives \(s^2\mid n\), and hence \(s\mid M\).

The distinct prime-power factors of \(r-1\) therefore all divide \(M\). Thus \(r-1\mid M\), and (P) gives \(r^2\mid n\). This proves (4.3).

Now apply (3.2) to \(p^a\). It supplies a prime \(q\) such that
\[
p^a\mid q-1,\qquad f(q)<K.
\]
Because \(a\ge1\), we have \(q>p\). By (4.3), \(q^2\mid n\). We already know \(p^2\mid n\). These are distinct prime factors, so the product formula for the totient gives
\[
v_p(M)
\ge (v_p(n)-1)+v_p(q-1)
\ge 1+a.
\]
This contradicts (4.2). \(\square\)

### Why this does not prove Carmichael's conjecture

Condition (P) is sufficient for uniqueness; its necessity is not established.

For completeness, its sufficiency is elementary. If (P) holds, every prime factor of \(n\) occurs with exponent at least two. If \(\varphi(m)=\varphi(n)\), then any prime \(r\mid m\) satisfies \(r-1\mid\varphi(n)\), so (P) gives \(r\mid n\). Thus \(m\) has no new prime divisors. Compare exponents in decreasing order among the primes dividing \(n\). At a prime \(r\), contributions to \(v_r(\varphi(\cdot))\) from larger primes are already equal. The contribution from \(r\) itself is \(v_r(n)-1\ge1\), which forces \(r\mid m\) with \(v_r(m)=v_r(n)\). Descending induction proves \(m=n\).

The theorem excludes this sufficient construction. A general hypothetical unique preimage could fail (P) and would not be covered.

## 5. The exact obstruction to transferring the lambda proof

For \(p^2\mid n\),
\[
\varphi(n/p)=\frac{\varphi(n)}p.
\tag{5.1}
\]
A different prime \(q\mid n\) with \(p^a\mid q-1\) does not alter (5.1). Totient valuations add:
\[
v_\ell(\varphi(n))
=
\sum_{r\mid n}
\left((v_r(n)-1)\mathbf1_{\ell=r}
+v_\ell(r-1)\right).
\tag{5.2}
\]
The \(\lambda\)-function instead takes a least common multiple of prime-power components. Repeated divisibility can be redundant in a least common multiple; the separate contributions in (5.2) remain additive.

The completed \(\lambda\) proof can therefore delete a redundant prime factor once a suitable second component is present. The corresponding deletion changes \(\varphi\). To finish Carmichael by this route, one must construct an actual compensating multiplicative replacement satisfying a condition such as (2.2), or prove a different implication from unique preimages to (P). Neither follows merely from the tree bound (3.2).

A second published route would prove that both recursively defined sets \(\mathcal P'\) and \(\mathcal P''\) in [F13, §1] are infinite. They arise from the two cases \(3^2\parallel n\) and \(3^3\mid n\), and their recursive rules control prime factors of \(p-1\). Ford's theorem there supplies upper bounds for these thin prime sets. It does not supply their infinitude. The Dirichlet progression theorem used in [FL] does not, by itself, give the missing lower bound for these recursive sets.

## 6. The stronger prime-product conjecture is separate

The assertion explicitly called Pomerance's conjecture in [BM, Conjecture 10] is
\[
p_k-1\mid\prod_{i<k}p_i(p_i-1)
\qquad(k\ge2),
\tag{6.1}
\]
where \(p_i\) is the \(i\)-th prime. It implies that no integer satisfies (P), but §4 does not establish (6.1).

For a prime \(P\), (6.1) requires, for each prime \(\ell\mid P-1\),
\[
v_\ell(P-1)
\le
1+\sum_{\substack{q<P\\q\ {\rm prime}}}v_\ell(q-1).
\tag{6.2}
\]
The initial \(1\) comes from the factor \(\ell\) among the smaller primes. When \(v_\ell(P-1)\ge2\), the remaining valuation must come from primes \(q<P\). Theorem (3.2) controls \(f(q)\), but imposes no comparison \(q<P\). This is a distinct size requirement.

Barthel–Müller derive (6.1) from their stronger geometric-interval prime conjecture [BM, Proposition 11]. Their numerical smoothness cases are not promoted here to resolutions. Neither (6.1) nor their full interval conjecture has been proved in this attempt.

## 7. Prior-art and scope audit

Audit date: 2026-11-20. The search checked both web engines, exact target names, combinations with Dirichlet GRH/ERH, prime trees, the Pomerance criterion, and recent work. The negative result is bounded: no full Dirichlet-GRH proof of Carmichael's conjecture was located.

Primary comparisons:

- [FL] proves the \(\lambda\) analogue under Dirichlet ERH and explicitly distinguishes the open \(\varphi\) conjecture. Its prime-tree theorem is the input to §4.
- [F98] states the Carmichael–Klee lemma and proves strong restrictions on a hypothetical unique preimage. Its result about positive proportions concerns **totient values**, not positive density among all integers.
- [F99] proves Sierpiński's conjecture for every multiplicity \(k\ge2\). It does not exclude multiplicity one.
- [P74], [F13], and [BM] distinguish the sufficient counterexample criterion from Carmichael's full assertion. [BM] separately identifies the stronger ordered prime-product conjecture.
- Saito's 2025 article [S25] studies special cases and explicitly retains the full conjecture as open. It is a current primary status check, not a theorem completing this target.

No claim of priority is made for the corollary in §4. It is recorded as a complete implication extracted here from the published Ford–Luca theorem. No independent review of this file has yet been recorded.

## References

[FL] K. Ford and F. Luca, *The number of solutions of \(\lambda(x)=n\)*, corrected author manuscript dated April 3, 2011, especially Conjecture 2 and Theorem 2. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/lambda.pdf).

[F98] K. Ford, *The distribution of totients*, Ramanujan Journal **2** (1998), 67–151; corrected author manuscript. Especially §1.3 and Lemma 7.2. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/totients.pdf).

[F99] K. Ford, *The number of solutions of \(\varphi(x)=m\)*, Annals of Mathematics **150** (1999), 283–311. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/sierp.pdf).

[F13] K. Ford, *Sieving very thin sets of primes, and Pratt trees with missing primes*, author manuscript dated February 21, 2013; published in International Mathematics Research Notices (2014). Especially §1 and Theorem 1. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/recurs.pdf).

[P74] C. Pomerance, *On Carmichael's conjecture*, Proceedings of the American Mathematical Society **43** (1974), 297–298. [Author scan](https://math.dartmouth.edu/~carlp/PDF/carmichaelconjecture.pdf); [journal record](https://www.jstor.org/stable/2038881). The scan's indexed text has a divisibility-sign OCR ambiguity in the stronger prime-product formula; (6.1) is confirmed from [BM].

[BM] J. Barthel and V. Müller, *A conjecture on primes in arithmetic progressions and geometric intervals*, American Mathematical Monthly **129** (2022), 979–983, DOI [10.1080/00029890.2022.2116250](https://doi.org/10.1080/00029890.2022.2116250). Especially Theorem 9, Conjecture 10, Proposition 11, and Remark 13. [Institutional record](https://orbilu.uni.lu/handle/10993/53879).

[S25] C. Saito, *On the special cases of Carmichael's totient conjecture*, Notes on Number Theory and Discrete Mathematics **31** (2025), no. 3, 504–534. DOI [10.7546/nntdm.2025.31.3.504-534](https://doi.org/10.7546/nntdm.2025.31.3.504-534). [Journal page](https://nntdm.net/volume-31-2025/number-3/504-534/).
