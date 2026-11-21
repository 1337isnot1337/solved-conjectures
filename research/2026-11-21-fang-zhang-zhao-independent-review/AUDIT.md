# Fang–Zhang–Zhao conjecture

Independent mathematical review, 21 November 2026. Coordination: [issue #160](https://github.com/1337isnot1337/solved-conjectures/issues/160).

**Verdict: the proposed disproof of Conjecture 4.3 passes this review.** The argument establishes failure for every integer $m\ge4$, with an exact polynomial argument covering the infinite family $m\ge6$. This review does not certify novelty; a separate reviewer is checking prior resolutions. No assertion is made about Conjecture 4.2 for Baxter numbers.

## Material reviewed

The proof reviewed is [results/fang-zhang-zhao/PROOF.md](../../results/fang-zhang-zhao/PROOF.md), Git blob `f99ae49459963fa08434a6af4043236e05e2e44e`. The accompanying earlier review and independent symbolic checker were also read. The original definitions and exact conjecture were checked directly in Hanqian Fang, Candice X. T. Zhang and James J. Y. Zhao, [Analytic properties arising from the Baxter numbers, arXiv:2505.05873v1](https://arxiv.org/html/2505.05873v1), Sections 1 and 4. The full journal text was not used in this mathematical review.

## Original scope and conventions

Conjecture 4.3 asserts infinite log-convexity of $\{H_n^{[m]}(1,1)\}_{n\ge1}$ for every fixed integer $m\ge2$. The source separately defines asymptotic log-convexity. Its Conjecture 4.3 concerns every entry of every iterate, so a negative early entry is a valid disproof.

The source's operator is exactly

```math
(\mathcal L a)_n=a_na_{n+2}-a_{n+1}^{\,2}.
```

Each application discards the final two entries of a finite input list and preserves the first index. Hence inputs $h_2,\ldots,h_8$ determine $(\mathcal L^3h)_2$, and $h_2,\ldots,h_{10}$ determine $(\mathcal L^4h)_2$. There is no centered-versus-forward indexing mismatch.

In the source definition, the extra power $q^{m\binom{k+1}{2}}$ and the plane-partition volume weight are both one at $q=1$. At $t=1$ the row sum is therefore the ordinary, unweighted count over all boxes with side lengths $k$ and $n-1-k$, exactly as used in the proof. The source's explicit binomial expression agrees term for term.

## Polynomial conversion

The conversion to the fixed-degree polynomial formula is valid. Write $N=n-1=k+l$. Factorial cancellation in one summand of the source formula gives

```math
\frac{\prod_{j=0}^{m-1}\binom{N+m-1}{k+j}}
{\prod_{j=1}^{m-1}\binom{N+m-1}{j}}
=\prod_{r=0}^{m-1}\frac{(N+r)!\,r!}{(k+r)!(l+r)!}
=\prod_{i=1}^{k}\prod_{j=1}^{l}
\frac{m+i+j-1}{i+j-1}.
```

The last equality can be obtained by writing the factorial ratio as the product of $(i+j+r-1)/(i+j+r-2)$ over the box and telescoping in $r=1,\ldots,m$. Empty dimensions contribute one. Thus the polynomial expression is identical to the source row sum for every positive integer $m$; it is not an interpolation from finitely many samples.

## Infinite-family certificate

I reconstructed $h_2,\ldots,h_8$ from the box products and applied the operator three times using a new standard-library implementation of rational coefficient lists. This code does not import or call either of the result package's checkers. It confirms exactly the degree-36 identity

```math
(\mathcal L^3h(m))_2
=-\frac{m^4(m-1)^4(m+1)^5(m+2)^2A(m)Q(m)}{1547934105600},
```

with precisely the $A$ and all eighteen coefficients of $Q$ printed in the reviewed proof. It also confirms

```math
Q(6)=264264378826752.
```

The sign argument requires no unverified root isolation. The coefficients of $Q$ in degrees 13 through 17 are positive; its coefficients in degrees 0 through 12 are negative. Consequently $Q(m)/m^{12}$ is strictly increasing on $(0,\infty)$: positive powers have positive coefficients, negative powers have negative coefficients, and the degree-12 term is constant. The positive value at six therefore proves $Q(m)>0$ for every real $m\ge6$. All remaining factors in the certificate are strictly positive there. The negative leading sign proves the stated infinite family.

## The parameters four and five

For these parameters I independently evaluated the source's binomial formula, without using the box polynomial or the printed row sums as inputs, and applied the forward operator using integers. The row sums, the three displayed third-iterate entries, and the final fourth-iterate values all agree with the proof:

```math
(\mathcal L^4h(4))_2
=-111509459048444462640611465400686603136,
```

```math
(\mathcal L^4h(5))_2
=-44045680773437284570849713497906508911110782976.
```

Both signs are strict. These computations complete the asserted theorem for all integer $m\ge4$. They are exact end cases of a general disproof, not numerical evidence for an extrapolation.

## Reproducibility and limits

Run `python3 fraction_check.py` in this directory. The script uses only Python's standard library and checks the polynomial identity, the sign pattern, $Q(6)$, and the two exact remaining witnesses. It completed successfully in this review.

The proposed theorem refutes one universal conjecture, Conjecture 4.3. It does not prove failure for the Catalan case $m=2$, and it does not settle the separate Baxter case $m=3$ or the separate Sturm-sequence Conjecture 4.1. Different values of $m$ are not separate conjecture resolutions. No mathematical gap was found. Priority and publication status remain governed by the separately documented literature audit; this is an independent internal review, not external peer review.
