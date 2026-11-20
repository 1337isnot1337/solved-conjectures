# Brent's conjecture

Research date: 20 November 2026. [Issue #127](https://github.com/1337isnot1337/solved-conjectures/issues/127). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Statement, provenance, and conclusion

In *Irregularities in the distribution of primes and twin primes*, Mathematics of Computation **29** (1975), 43–56, Richard P. Brent proposed the logarithmic-mean assertion
\[
\boxed{\quad
\frac1{\log N}\sum_{n=2}^N\frac{s_1(n)}n\longrightarrow1,
\qquad
s_1(n)=\frac{(\langle\operatorname{li}(n)\rangle-\pi(n))\log n}{\sqrt n}.
\quad} \tag{B}
\]
This is equation **(1.22) on printed page 48**. The notation \(\langle y\rangle=\lfloor y+1/2\rfloor\) means nearest integer, as defined on printed page 43. Brent states the equivalent assertion for his Riemann-approximation error \(s_2\) in equation (1.21) on printed page 47.

Primary sources: [Brent's complete original paper](https://maths-people.anu.edu.au/~brent/pd/rpb024.pdf), printed pages 43–48, and [his updated author page](https://maths-people.anu.edu.au/~brent/pub/pub024.html). The PDF was downloaded, rendered locally, and the actual page images were inspected. The direct scan check corrected an earlier draft's wrong equation/page reference and its treatment of the discrete sum as a literal integral statement.

**Conclusion under the accepted RH input.** The full original conjecture holds. More precisely,
\[
\sum_{n=2}^N
\frac{(\langle\operatorname{li}(n)\rangle-\pi(n))\log n}{n^{3/2}}
=\log N+2\log\log N+O(1). \tag{1}
\]
We first prove the corresponding integral formula
\[
\int_2^X
\frac{(\operatorname{li}(t)-\pi(t))\log t}{t^{3/2}}\,dt
=\log X+2\log\log X+O(1), \tag{1a}
\]
then prove that the sum and integral differ by \(O(1)\). Thus the common continuous formulation of the conjecture is equivalent, but it is not misquoted as the literal original display.

This is a classical explicit-formula consequence of RH. No new independent prime-distribution estimate or historical priority is claimed.

A distinct arithmetic-progression statement is called Brent's conjecture by Guy Robin in *Irrégularités dans la distribution des nombres premiers dans les progressions arithmétiques*, Annales de la Faculté des Sciences de Toulouse, series 5, **8** (1986–1987), 159–173:
\[
\boxed{\quad
\sum_{2\le n\le X}
\frac{\pi(n;4,3)-\pi(n;4,1)}
{\sqrt n\,\pi(n)}
\sim\log X.
\quad} \tag{B4}
\]
See [Robin's original paper](https://www.numdam.org/item/AFST_1986-1987_5_8_2_159_0.pdf), printed pages 160–161, the abstract and display (B), and printed pages 163–164, the theorem and Remark 1. These formula images were also downloaded and inspected locally. Robin already proved the conditional GRH result. The accepted rational Dirichlet-GRH input supplies that hypothesis.

The two statements are recorded separately because the modulus-four formula is not the literal formula in Brent's 1975 equation (1.22). They are counted as one historical target in this campaign, not two new resolutions. We give the full reduction for both, including the signed denominator in (B4).

The accepted source is pinned to [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Statement (B) uses only its zeta RH conclusion. Statement (B4) uses zeta RH and GRH for the primitive real character modulo \(4\). No linear independence, simple-zero assertion, or general number-field GRH is used.

## 1. The integrated explicit formula

Write
\[
\theta(x)=\sum_{p\le x}\log p,\qquad
\psi(x)=\sum_{p^k\le x}\log p.
\]
Under RH, the classical explicit formula implies
\[
\int_2^X\frac{\psi(t)-t}{t^{3/2}}\,dt=O(1). \tag{2}
\]
Here is the relevant convergence justification. The once-integrated explicit formula has an absolutely and locally uniformly convergent zero series
\[
\int_2^x(\psi(t)-t)\,dt
=-\sum_\rho\frac{x^{\rho+1}}{\rho(\rho+1)}
+R(x),\qquad R(x)=O(x\log(x+2)), \tag{3}
\]
where the endpoint constants are included in \(R\). The nonzero terms other than the nontrivial zeros come from the pole, the trivial zeros, and the value at zero; after subtracting \(t\), the displayed remainder bound is sufficient.

Stieltjes integration by parts applied to (3) justifies integrating its zero series against \(t^{-3/2}\). A term then contributes
\[
-\frac{X^{\rho-1/2}-2^{\rho-1/2}}
{\rho(\rho-1/2)}.
\]
Under RH, write \(\rho=1/2+i\gamma\). There is no zero with \(\gamma=0\): for real \(0<s<1\), the alternating eta series is positive and
\(\zeta(s)=\eta(s)/(1-2^{1-s})<0\).

The zero count \(N(T)=O(T\log(T+2))\), with multiplicity, gives
\[
\sum_\rho\frac1{|\rho|\,|\rho-1/2|}<\infty.
\]
The zero contributions are therefore bounded uniformly in \(X\). Integration of \(R\) in (3) contributes \(O(1)\), since its boundary term is
\(O(X^{-1/2}\log X)\) and its remaining integral is dominated by
\(\int_2^\infty t^{-3/2}\log(t+2)\,dt\).
This proves (2) without a pointwise interchange of a conditionally convergent zero sum.

The same argument applies to the nonprincipal character
\[
\chi_4(n)=
\begin{cases}
0,&2\mid n,\\
1,&n\equiv1\pmod4,\\
-1,&n\equiv3\pmod4.
\end{cases}
\]
Its completed \(L\)-function has no pole. Its real Dirichlet \(L\)-function is
\[
\beta(s)=1-3^{-s}+5^{-s}-7^{-s}+\cdots>0
\qquad(s>0),
\]
by the alternating-series pairing. Thus there is no real zero, including at \(1/2\). Under its GRH,
\[
\int_2^X\frac{\psi(t,\chi_4)}{t^{3/2}}\,dt=O(1),\qquad
\psi(t,\chi_4)=\sum_{n\le t}\chi_4(n)\Lambda(n). \tag{4}
\]
This also checks explicitly the real-zero exclusion appearing in Robin's theorem.

## 2. Prime squares supply the mean

The prime-power decomposition gives
\[
\psi(t)-\theta(t)
=\theta(\sqrt t)+O(t^{1/3}\log^2(t+2)).
\]
The usual pointwise RH estimate for \(\theta\) gives
\[
\theta(\sqrt t)=\sqrt t+O(t^{1/4}\log^2(t+2)).
\]
The two errors, multiplied by \(t^{-3/2}\), are integrable at infinity. Consequently (2) yields
\[
A(X):=\int_2^X\frac{\theta(t)-t}{t^{3/2}}\,dt
=-\log X+O(1). \tag{5}
\]

For the character modulo \(4\), put
\[
E(t)=\theta(t;4,3)-\theta(t;4,1).
\]
All odd prime squares have character \(1\), so
\[
\psi(t,\chi_4)
=-E(t)+\theta(\sqrt t)-\log2
+O(t^{1/3}\log^2(t+2))
\]
for sufficiently large \(t\); changes on a bounded interval are harmless. By (4),
\[
A_4(X):=\int_2^X\frac{E(t)}{t^{3/2}}\,dt
=\log X+O(1). \tag{6}
\]
The opposite signs in (5) and (6) are essential.

## 3. A summation-by-parts lemma

Suppose a locally integrable function \(E\) satisfies
\[
A(X)=\int_2^X E(t)t^{-3/2}\,dt
=a\log X+O(1)
\]
for a fixed real \(a\). Set
\[
P(x)=\frac{E(x)}{\log x}
+\int_2^x\frac{E(t)}{t\log^2t}\,dt+C,
\]
where \(C\) is any constant. Then
\[
\int_2^X P(t)\frac{\log t}{t^{3/2}}\,dt
=a\log X+2a\log\log X+O(1). \tag{7}
\]

To prove this, Fubini's theorem on each finite interval gives
\[
\begin{aligned}
\int_2^X P(t)\frac{\log t}{t^{3/2}}\,dt
={}&A(X)
+2\int_2^X
\left(\frac1{\log t}+\frac2{\log^2t}\right)dA(t)\\
&-\frac{2(\log X+2)}{\sqrt X}
\int_2^X\frac{\sqrt t}{\log^2t}\,dA(t)+O(1).
\end{aligned} \tag{8}
\]
The constant term contributes \(O(1)\) because
\(\int_2^\infty\log t\,t^{-3/2}\,dt\) converges.

Write \(A(t)=a\log t+V(t)\), where \(V\) is bounded. Integration by parts against \(1/\log t\) and \(1/\log^2t\) gives
\[
2\int_2^X
\left(\frac1{\log t}+\frac2{\log^2t}\right)dA(t)
=2a\log\log X+O(1). \tag{9}
\]
The integrals involving \(dV\) are bounded because the two weights have finite total variation.

For \(g(t)=\sqrt t/\log^2t\), the function is eventually increasing and has total variation \(O(g(X)+1)\). Thus
\[
\begin{aligned}
\int_2^Xg(t)\,dA(t)
&=a\int_2^X\frac{dt}{\sqrt t\,\log^2t}
+\int_2^Xg(t)\,dV(t)\\
&=O\!\left(\frac{\sqrt X}{\log^2X}\right).
\end{aligned} \tag{10}
\]
The second line follows by ordinary integration by parts with bounded \(V\). The last term in (8) is \(O(1/\log X)\). Equations (8)–(10) prove (7).

## 4. Brent's original statement

Partial summation gives exactly
\[
\pi(x)-\operatorname{li}(x)
=\frac{\theta(x)-x}{\log x}
+\int_2^x\frac{\theta(t)-t}{t\log^2t}\,dt+C.
\]
Apply the lemma with (5) and \(a=-1\). This gives
\[
\int_2^X(\pi(t)-\operatorname{li}(t))
\frac{\log t}{t^{3/2}}\,dt
=-\log X-2\log\log X+O(1),
\]
which proves (1a).

We now justify the literal discrete statement. Put
\[
r(t)=\operatorname{li}(t)-\pi(t),\qquad
h(t)=\frac{\log t}{t^{3/2}}.
\]
For \(n\le t<n+1\), \(\pi(t)=\pi(n)\), so
\[
|r(t)-r(n)|\ll\frac1{\log n}.
\]
Also \(|r(n)|=O(n)\), and the mean-value theorem gives
\[
|h(t)-h(n)|\ll\frac{\log n}{n^{5/2}}.
\]
It follows that
\[
\left|r(n)h(n)-\int_n^{n+1}r(t)h(t)\,dt\right|
\ll\frac{\log n}{n^{3/2}}.
\]
This bound is summable. The final incomplete cell is bounded as well. Therefore the unrounded sum through \(N\) differs from the integral through \(N\) by \(O(1)\).

Rounding \(\operatorname{li}(n)\) to the nearest integer changes the sum by at most
\[
\frac12\sum_{n\ge2}\frac{\log n}{n^{3/2}}<\infty.
\]
This proves (1), hence the exact original conjecture (B).

The frequently used continuous formulation with lower endpoint \(1\) has the same limit. The logarithmic singularity of \(\operatorname{li}\) at \(1\) is integrable after multiplication by \(\log t\). Changing a logarithmic-integral convention by a bounded amount changes the weighted integral by \(O(1)\).

Brent's equation (1.14), on printed page 45, gives
\(s_1(x)=s_2(x)+1+O(1/\log x)\).
Weighted summation shows that his equivalent equation (1.21) follows too:
\[
\frac1{\log N}\sum_{n=2}^N\frac{s_2(n)}n\longrightarrow0.
\]
This equivalence is part of the same historical conjecture, not an additional count.

## 5. Robin's modulus-four statement, with its actual weight

Put
\[
D(t)=\pi(t;4,3)-\pi(t;4,1).
\]
Partial summation and (6), followed by the lemma with \(a=1\), give
\[
S(X):=\int_2^X D(t)\frac{\log t}{t^{3/2}}\,dt
=\log X+2\log\log X+O(1). \tag{11}
\]

It is not enough to replace the signed summand's weight by an asymptotic equivalent and appeal to the prime number theorem. We check the denominator change.

The pointwise RH estimates give
\[
D(t)=O(\sqrt t\log t),\qquad
\pi(t)-\operatorname{li}(t)=O(\sqrt t\log t).
\]
Since \(\pi(t)\asymp\operatorname{li}(t)\asymp t/\log t\),
\[
\left|
\frac{D(t)}{\sqrt t}
\left(\frac1{\pi(t)}-\frac1{\operatorname{li}(t)}\right)
\right|
\ll\frac{\log^4t}{t^{3/2}}.
\]
The right side is integrable at infinity. Hence
\[
\int_2^X\frac{D(t)}{\sqrt t\,\pi(t)}\,dt
=\int_2^X\frac{D(t)}{\sqrt t\,\operatorname{li}(t)}\,dt+O(1). \tag{12}
\]

Define
\[
w(t)=\frac{t}{\operatorname{li}(t)\log t}.
\]
The elementary expansion of \(\operatorname{li}\) and its derivative give
\[
w(t)=1+O(1/\log t),\qquad
w'(t)=O(1/(t\log^2t)).
\]
For example,
\[
\frac{w'(t)}{w(t)}
=\frac1t-\frac1{t\log t}
-\frac1{\operatorname{li}(t)\log t},
\]
and the first two terms cancel the first two terms of the last factor's expansion.

Using (11), Stieltjes integration by parts now gives
\[
\int_2^X\frac{D(t)}{\sqrt t\,\operatorname{li}(t)}\,dt
=\int_2^Xw(t)\,dS(t)
=\log X+O(\log\log X). \tag{13}
\]
Indeed, the boundary term is \(w(X)S(X)=\log X+O(\log\log X)\), while the integral against \(w'\) is \(O(\log\log X)\).

Finally \(D(t)\) and \(\pi(t)\) are constant on each half-open interval \([n,n+1)\). Also \(|D(n)/\pi(n)|\le1\). Thus the difference between the sum in (B4) and the integral in (12) is bounded by a constant times
\[
\sum_{n\ge2}n^{-3/2}<\infty,
\]
including the last incomplete interval. We conclude
\[
\sum_{2\le n\le X}
\frac{\pi(n;4,3)-\pi(n;4,1)}
{\sqrt n\,\pi(n)}
=\log X+O(\log\log X).
\]
This proves the full statement (B4).

## 6. Prior results and novelty check

The following sources and retrieved text were checked on 20 November 2026. Source-reading limits are stated explicitly.

1. **Brent (1975), original paper.** Actual local rasters of printed pages 43–48 were inspected. Equation (1.22) on page 48 is the discrete \(s_1\) logarithmic mean; equation (1.21) on page 47 is its equivalent \(s_2\) form. The nearest-integer convention is on page 43 and the normalization of \(s_i\) is on page 44. Shanks's different ordinary-mean assertion is equation (1.19) on page 46. The [updated author page](https://maths-people.anu.edu.au/~brent/pub/pub024.html) supplies further RH-conditional mean information and references.

2. **Robin (1986–1987), original paper.** Actual local rasters of printed pages 160, 161, 163, and 164 were inspected. The abstract and display (B) give exactly the modulus-four sum above. The theorem assumes no real zeros on \((0,1)\); part (d) gives the logarithmic asymptotic when the relevant zero supremum is \(1/2\). Remark 1 explicitly identifies the Brent case. This conditional theorem predates the present work and receives full credit.

3. **Martin et al., comparative-prime-number bibliography.** The [author preprint](https://arxiv.org/pdf/2309.08729v3) and the 2025 published bibliography separately describe Brent's original logarithmic conjecture and Robin's conditional modulus-four result. This is a cross-check on scope and subsequent literature, not a substitute for the original statements.

4. **Brent–Platt–Trudgian (2020).** [The mean square of the error term in the prime number theorem](https://maths-people.anu.edu.au/~brent/pd/rpb274-arXiv-v1.pdf) studies a different second-moment quantity and proves nonexistence of an ordinary-scale limit. It is not an earlier unconditional proof of either statement above. Its mean-square refinements are not counted as additional targets.

5. **Current indexed searches.** Both search engines were used for Brent's conjecture together with Robin, logarithmic mean/average, equations (1.21)–(1.22), prime distribution, proof, and recent resolution. The source archive's existing applications were also screened. No earlier unconditional resolution of these exact statements was found in the retrieved sources. This bounded audit does not prove exclusive priority.

Shanks's conjecture was already disproved and is excluded. The numerical size of a prime-counting verification is irrelevant here. The full asymptotic statements, not a bounded range, have been deduced.

This note's result category is **inherited RH/Dirichlet-GRH application with a complete written deduction**. It is not a claim to have newly discovered the conditional implication.

## Review status

The complete mathematical proof received independent internal review, including the integrated-zero-series convergence, prime-square signs, the \(2\log\log X\) term, real nonvanishing of \(\beta\), and the signed denominator transition. [First proof review](https://github.com/1337isnot1337/solved-conjectures/issues/127#issuecomment-7049933035).

A subsequent review directly inspected the downloaded Brent rasters and checked the added sum–integral bridge. [Exact-source and bridge review](https://github.com/1337isnot1337/solved-conjectures/issues/127#issuecomment-7049994370).

**Source correction.** The first draft wrongly cited equation (7.3) on page 51 and overstated visual inspection. The web screenshot response had contained a text placeholder, not image data. That claim was withdrawn before the actual PDFs were downloaded. The direct raster check established equations (1.21)–(1.22), pages 47–48, and the nearest-integer convention. The proof was completed for the original discrete statement by the bounded-error argument in Section 4.

The downloaded original PDFs have SHA-256 hashes:

- Brent: `65b85b241013a63a40a51515dacf671c2c79939d518ef13e37cd817d728061f1`.
- Robin: `c9338e2049a7d477594d564c2a7b4238f9145c84b73884edf85a1fba5c0d1b42`.

No copyrighted source PDF is committed. This is internal mathematical review, not external peer review or Lean verification.
