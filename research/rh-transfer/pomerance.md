# Pomerance's conjecture

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Exact statement and conclusion

This note proves the **nonexistence conjecture stated in the abstract of Pomerance's 1974 paper, *On Carmichael's conjecture***. The target is the assertion that no positive integer \(n\) satisfies
\[
\forall r\ {\rm prime},\qquad
r-1\mid\varphi(n)\ \Longrightarrow\ r^2\mid n.
\tag{P}
\]
It is not the prime-product assertion later also called Pomerance's conjecture. That separate assertion is described in §4 and remains unproved here.

Pomerance's abstract states:

> It is conjectured that no natural numbers satisfy this sufficient condition.

His sufficient condition is (P); it forces \(n\) to be a unique preimage of its totient. The original author scan's indexed text and the journal's abstract agree on the nonexistence statement. Ford [F13, §1] and Barthel–Müller [BM, Theorem 9] confirm the precise condition.

**Conclusion under the accepted input.** For every positive integer \(n\), there is a prime \(r\) with
\[
\boxed{\qquad r-1\mid\varphi(n),\qquad r^2\nmid n.\qquad}
\tag{1}
\]
The proof uses the Ford–Luca prime-tree theorem, whose stated hypothesis is ERH for Dirichlet \(L\)-functions. The accepted rational Dirichlet GRH package supplies this hypothesis. This settles the entire original nonexistence statement, with no restriction on \(n\).

Accepted source pin: [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Considered independently of that accepted source, the result below is conditional on rational Dirichlet GRH. No Hecke/Artin GRH, Lean verification, or new numerical verification is used.

This is an application extracted from a published theorem. No claim of exclusive priority is made for the deduction.

## 1. Prime trees and the imported theorem

A proper prime power means \(p^b\) with \(p\) prime and \(b\ge2\). For a prime \(q\), form its Pratt tree by factoring \(q-1\), then recursively factoring \(p-1\) for each prime \(p\) encountered. Let \(f(q)\) be the largest proper prime power in this tree, with \(f(q)=1\) when none occurs.

Equivalently, \(f(2)=1\), and for \(q>2\),
\[
f(q)=
\max\left(
\{f(s):s\parallel q-1\}
\cup
\{s^b:s^b\parallel q-1,\ b\ge2\}
\right).
\tag{2}
\]
For an edge carrying \(s^b\) with \(b\ge2\), all proper prime powers further down that branch are smaller than \(s^b\); this explains the recursive formula.

**Ford–Luca theorem.** Under Dirichlet ERH, for every prime \(p\) and every integer \(a\ge1\), some prime \(q\) satisfies
\[
p^a\mid q-1,\qquad f(q)<p^{a+1}.
\tag{3}
\]
This is [FL, Conjecture 2, proved in Theorem 2]. The introduction specifies the Dirichlet \(L\)-function hypothesis. Theorem 2 gives all prime powers; we do not substitute the paper's separate sufficiently-large-prime-power result.

The proof below needs exactly (3).

## 2. Proof of the nonexistence conjecture

Suppose, to obtain a contradiction, that a positive integer \(n\) satisfies (P). Put \(M=\varphi(n)\). Among all prime powers not dividing \(M\), choose the smallest in ordinary numerical order:
\[
K=p^{a+1},\qquad a\ge0.
\tag{4}
\]
This exists because \(M\) is finite.

Every exact prime-power factor of \(p-1\) is smaller than \(p\), and therefore smaller than \(K\). By minimality of \(K\), each divides \(M\). Since these factors are pairwise coprime,
\[
p-1\mid M.
\]
Condition (P) now gives \(p^2\mid n\), and hence \(p\mid M\). Thus \(a\ge1\). Also \(p^a<K\) divides \(M\), whereas \(p^{a+1}\) does not, so
\[
v_p(M)=a.
\tag{5}
\]

### Tree induction

We claim that every prime \(r\) satisfies
\[
f(r)<K\quad\Longrightarrow\quad r^2\mid n.
\tag{6}
\]

For \(r=2\), condition (P) applies because \(1\mid M\), giving \(4\mid n\).

Assume \(r>2\), \(f(r)<K\), and the claim holds for every smaller prime. Consider an exact prime-power factor \(s^b\parallel r-1\).

If \(b\ge2\), the definition of \(f\) gives \(s^b\le f(r)<K\). Minimality of \(K\) therefore yields \(s^b\mid M\).

If \(b=1\), the recursive definition gives \(f(s)\le f(r)<K\). Since \(s<r\), induction yields \(s^2\mid n\), which implies \(s\mid\varphi(n)=M\).

Thus every exact prime-power factor of \(r-1\) divides \(M\). It follows that \(r-1\mid M\). Applying (P) proves \(r^2\mid n\), completing the induction.

### The valuation contradiction

Apply (3) to \(p^a\), which is permitted because \(a\ge1\). It gives a prime \(q\) such that
\[
p^a\mid q-1,\qquad f(q)<K.
\]
We have \(q>p\), since \(q\ge p^a+1\). The tree induction gives \(q^2\mid n\), while the first step already gave \(p^2\mid n\).

In the product
\[
\varphi(n)=\prod_{\ell\mid n}\ell^{v_\ell(n)-1}(\ell-1),
\]
the distinct prime factors \(p\) and \(q\) make separate contributions to the \(p\)-adic valuation. Therefore
\[
v_p(M)
\ge v_p(n)-1+v_p(q-1)
\ge1+a.
\]
This contradicts (5). No integer satisfies (P), proving (1). \(\square\)

The argument includes \(p=2\). Euler's totient has no exceptional prime-power rule that would alter its contribution \(v_2(n)-1\).

## 3. Relation to Carmichael's conjecture

Pomerance proved that (P) is sufficient for a unique totient preimage. A short proof also clarifies why its nonexistence does not settle the full Carmichael conjecture.

Suppose (P) holds and \(\varphi(m)=\varphi(n)\). Every prime factor \(r\) of \(m\) satisfies \(r-1\mid\varphi(n)\); hence \(r^2\mid n\). Thus \(m\) has no prime divisor outside the prime support of \(n\). Moreover every prime factor of \(n\) occurs there with exponent at least two.

Compare the two totients at primes in decreasing order. Once all larger prime exponents agree, their contributions to the valuation at a prime \(r\) agree. The remaining contribution from \(r\) is \(v_r(n)-1\ge1\), forcing \(r\mid m\) with \(v_r(m)=v_r(n)\). Descending induction gives \(m=n\).

Consequently,
\[
\text{Carmichael's full conjecture}\quad\Longrightarrow\quad\text{nonexistence of (P)}.
\]
The converse is not established. Our theorem rules out Pomerance's sufficient construction, but does not show that every hypothetical unique preimage must satisfy (P).

The separate [Carmichael research note](carmichael.md) records the actual Carmichael–Klee closure condition and the missing multiplicative replacement. In particular, the completed noninjectivity result for the \(\lambda\)-function is not treated as a proof for \(\varphi\).

## 4. The other conjecture with the same author's name

In the second part of [P74], and explicitly as [BM, Conjecture 10], a sufficient route to the nonexistence conclusion is
\[
p_k-1\mid\prod_{i<k}p_i(p_i-1)
\qquad(k\ge2),
\tag{7}
\]
where \(p_i\) is the \(i\)-th prime.

This ordered prime-product assertion is **not proved in this note**. It imposes a size condition absent from (3). Indeed, for each prime \(\ell\mid P-1\), it requires
\[
v_\ell(P-1)\le
1+\sum_{\substack{q<P\\q\ {\rm prime}}}v_\ell(q-1).
\tag{8}
\]
The Ford–Luca theorem provides a prime with a controlled Pratt tree, but does not require that prime to be smaller than an arbitrary given \(P\). The proof in §2 avoids that ordering requirement.

The title of this note therefore names the author, while §0 identifies the exact original conjecture being proved. The ordered product assertion is not included in the claimed resolution. The \(P\)-integer conjecture about reduced residue systems, also associated with Pomerance, is another distinct problem.

## 5. Prior-art audit

Audit date: 20 November 2026. No unconditional proof or disproof of the exact no-(P) statement was located. This is a bounded literature audit, not a proof that no prior argument exists.

### Original statement and subsequent primary sources

- **Pomerance 1974 [P74].** The abstract expressly conjectures nonexistence of integers satisfying its sufficient condition. The theorem gives (P). This is the source of the target, not a weakened statement invented for this campaign. The stronger prime-product route appears separately.
- **Subbarao–Yip 1989 [SY].** Section 4 discusses the sufficient criterion and then the separate prime-product conjecture. No proof of nonexistence is presented there. Search-index OCR reverses divisibility signs in this scanned source, so exact signs are checked against [F13] and [BM].
- **Ford 1998, corrected 2012 [F98], and Ford 1999 [F99].** The former develops restrictions on unique totient preimages and the latter resolves multiplicities \(k\ge2\). Their inspected Carmichael discussions do not establish no-(P). Their density and multiplicity results are not promoted to a nonexistence result.
- **Ford–Luca 2011 [FL].** Its theorem (3) supplies the input. The stated application concerns the \(\lambda\)-function. No theorem about Pomerance's no-(P) condition was found in the inspected paper.
- **Ford 2013/2014 [F13].** The introduction repeats the exact criterion and describes its proposed nonexistence as heuristic. It gives thin-prime-set bounds, not a solution of this statement.
- **Barthel–Müller 2022 [BM].** Theorem 9 restates the criterion. Conjecture 10 is the ordered prime-product assertion; Proposition 11 deduces that assertion from a geometric-interval prime conjecture. Remark 13 explains that eliminating this construction would still not prove Carmichael's full conjecture.
- **Shannon–Shiue–He–Saito 2025 [S25].** This primary article studies selected totient cases and leaves the full Carmichael conjecture open. It supplies no resolution of (P).

### Additional searches and exclusions

Both web engines were used for combinations of “Pomerance”, “Carmichael”, “1974”, “sufficient condition”, “criterion”, “no such integer”, “nonexistence”, “Dirichlet”, “GRH”, “ERH”, “Pratt”, “proof”, and recent resolution through 2026. Exact-condition searches used both \(p^2\mid n\) and \(p-1\mid\varphi(n)\).

The audit also checked the current author bibliographies of Ford and Pomerance, and Pomerance's 2008 Euler-function and 2013/2017 arithmetic-function-range talks. No resolution was identified there. An extracted formula in the 2008 slides is ambiguous between \(n\) and \(\varphi(n)\); it is not used as an exact-statement source.

A 2022 preprint by A. Das claiming the full Carmichael conjecture was inspected. Its final argument treats existence of a real parameter \(\beta\) as sufficient for an integer solution \(m=\beta n\), without establishing the necessary integrality or fixed factor-index conditions. It does not supply a valid proof of the target.

Results on Carmichael numbers, the \(\lambda\)-function, Lehmer's problem, and Pomerance's \(P\)-integers were separated from this target. In particular, an RH-conditional theorem about \(P\)-integers is not the theorem proved here.

### Source-access limits

The original scan was opened and its primary indexed text was retrieved. The screenshot tool returned only a textual image placeholder in the reviewers' sessions; it did not supply a raster. No visual inspection is claimed. The original abstract is independently reproduced in the journal's primary record, and the exact mathematical criterion is also available in the readable texts [F13] and [BM].

## 6. Independent review

The proof first appeared as §4 of [carmichael.md](carmichael.md), commit [683aba45f2d11a2cc7ce356c8444d1594b0e69b1](https://github.com/1337isnot1337/solved-conjectures/commit/683aba45f2d11a2cc7ce356c8444d1594b0e69b1).

An independent internal reviewer checked the entire least-missing-prime-power argument, the case \(p=2\), the tree induction, and the final additive valuation contradiction. [Review receipt](https://github.com/1337isnot1337/solved-conjectures/issues/126#issuecomment-7049900536).

The reviewer corrected an overstatement about screenshot access and separately verified the original abstract using retrieved primary text. [Access correction](https://github.com/1337isnot1337/solved-conjectures/issues/126#issuecomment-7049939194); [primary-text verification](https://github.com/1337isnot1337/solved-conjectures/issues/126#issuecomment-7049949591).

This is internal mathematical review, not external peer review or formal verification.

## References

[P74] C. Pomerance, *On Carmichael's conjecture*, Proceedings of the American Mathematical Society **43** (1974), 297–298. [Author scan](https://math.dartmouth.edu/~carlp/PDF/carmichaelconjecture.pdf); [journal abstract](https://www.jstor.org/stable/2038881). DOI [10.2307/2038881](https://doi.org/10.2307/2038881).

[FL] K. Ford and F. Luca, *The number of solutions of \(\lambda(x)=n\)*, Integers **11A** (2011), Article 9; corrected author manuscript dated April 3, 2011. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/lambda.pdf). See Conjecture 2 and Theorem 2.

[F98] K. Ford, *The distribution of totients*, Ramanujan Journal **2** (1998), 67–151; corrected author version, 2012. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/totients.pdf).

[F99] K. Ford, *The number of solutions of \(\varphi(x)=m\)*, Annals of Mathematics **150** (1999), 283–311. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/sierp.pdf).

[F13] K. Ford, *Sieving very thin sets of primes, and Pratt trees with missing primes*, International Mathematics Research Notices **2014** (2014), 2955–2971; author manuscript dated February 21, 2013. [Author PDF](https://www.ford126.web.illinois.edu/wwwpapers/recurs.pdf).

[BM] J. Barthel and V. Müller, *A conjecture on primes in arithmetic progressions and geometric intervals*, American Mathematical Monthly **129** (2022), 979–983. DOI [10.1080/00029890.2022.2116250](https://doi.org/10.1080/00029890.2022.2116250). [Institutional record](https://orbilu.uni.lu/handle/10993/53879).

[SY] M. V. Subbarao and L. W. Yip, *Carmichael's conjecture and some analogues*, in *Number Theory*, J. M. De Koninck and C. Levesque, eds. (1989), 928–941. [Author scan](https://www.math.ualberta.ca/~subbarao/documents/Subbarao_Yip1989.pdf), §4.

[S25] A. G. Shannon, P. J.-S. Shiue, T.-X. He, and C. Saito, *On the special cases of Carmichael's totient conjecture*, Notes on Number Theory and Discrete Mathematics **31** (2025), no. 3, 504–534. [Journal page](https://nntdm.net/volume-31-2025/number-3/504-534/).

[D22] A. Das, *On Carmichael's totient function conjecture*, preprint, 2022, §3. [Author-uploaded full text](https://www.researchgate.net/publication/358903903_On_Carmichael%27s_totient_function_conjecture).

Author records and talks checked: [Ford bibliography](https://www.ford126.web.illinois.edu/papers-ann.html); [Pomerance bibliography](https://math.dartmouth.edu/~carlp/); [Euler-function talk](https://math.dartmouth.edu/~carlp/PDF/phitalk2.pdf); [2013 range talk](https://math.dartmouth.edu/~carlp/rangetalk.pdf); [2017 range talk](https://math.dartmouth.edu/~carlp/msritalk.pdf).
