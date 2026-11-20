# Brent's conjecture

Research date: 20 November 2026. [Issue #127](https://github.com/1337isnot1337/solved-conjectures/issues/127). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Statement, provenance, and conclusion

In *Irregularities in the distribution of primes and twin primes*, Mathematics of Computation **29** (1975), 43–56, Richard P. Brent proposed on printed page 51, equation (7.3), the logarithmic-mean assertion
\[
\boxed{\quad
\frac1{\log X}\int_1^X
\frac{(L(t)-\pi(t))\log t}{t^{3/2}}\,dt\longrightarrow1.
\quad} \tag{B}
\]
Here \(L\) is his logarithmic-integral approximation. The paper uses an integer-part convention in its computational definitions. Replacing it by the usual principal-value \(\operatorname{li}\), or changing the lower integration endpoint to \(2\), changes the numerator in (B) by \(O(1)\). Thus these conventions give exactly the same limit.

Primary sources: [Brent's complete original paper](https://maths-people.anu.edu.au/~brent/pd/rpb024.pdf), especially printed pages 43 and 51, and [his updated author page](https://maths-people.anu.edu.au/~brent/pub/pub024.html). The original page was inspected as a scan, not inferred from a search snippet.

**Conclusion under the accepted RH input.** The full original conjecture holds. More precisely,
\[
\int_2^X
\frac{(\operatorname{li}(t)-\pi(t))\log t}{t^{3/2}}\,dt
=\log X+2\log\log X+O(1). \tag{1}
\]
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
See [Robin's original paper](https://www.numdam.org/item/AFST_1986-1987_5_8_2_159_0.pdf), printed page 161, display (B), and printed pages 163–164, the theorem and Remark 1. Robin already proved the conditional GRH result. The accepted rational Dirichlet-GRH input supplies that hypothesis.

The two statements are recorded separately because the modulus-four formula is not the literal formula in Brent's 1975 equation (7.3). They are counted as one historical target in this campaign, not two new resolutions. We give the full reduction for both, including the signed denominator in (B4).

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
which proves (1).

Replacing \(\operatorname{li}(t)\) by its integer part changes the integral by at most
\(\int_2^\infty\log t\,t^{-3/2}\,dt\). The omitted interval from \(1\) to \(2\) also has a finite integral: the logarithmic singularity of \(\operatorname{li}\) at \(1\) is integrable after multiplication by \(\log t\). Thus
\[
\frac1{\log X}\int_1^X
\frac{(L(t)-\pi(t))\log t}{t^{3/2}}\,dt
=1+\frac{2\log\log X}{\log X}
+O\!\left(\frac1{\log X}\right)\longrightarrow1.
\]

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

The following sources were inspected on 20 November 2026.

1. **Brent (1975), original paper.** Equation (7.3) on printed page 51 states the logarithmic conjecture. Equation (7.1) is the different ordinary-mean assertion associated with Shanks. The original definitions and integer-part convention were checked. The [updated author page](https://maths-people.anu.edu.au/~brent/pub/pub024.html) also records RH-conditional logarithmic-mean information and later references.

2. **Robin (1986–1987), original paper.** The display (B) on printed page 161 is the modulus-four sum used above. The theorem on printed page 163 assumes no real zeros on \((0,1)\); its part (d) gives the logarithmic asymptotic when the relevant zero supremum is \(1/2\). Remark 1 on printed page 164 explicitly identifies the Brent case. This conditional theorem predates the present work and receives full credit.

3. **Martin et al., comparative-prime-number bibliography.** The [author preprint](https://arxiv.org/pdf/2309.08729v3) and the 2025 published bibliography separately describe Brent's original logarithmic conjecture and Robin's conditional modulus-four result. This is a cross-check on scope and subsequent literature, not a substitute for the original statements.

4. **Brent–Platt–Trudgian (2020).** [The mean square of the error term in the prime number theorem](https://maths-people.anu.edu.au/~brent/pd/rpb274-arXiv-v1.pdf) studies a different second-moment quantity and proves nonexistence of an ordinary-scale limit. It is not an earlier unconditional proof of either statement above. Its mean-square refinements are not counted as additional targets.

5. **Current indexed searches.** Both search engines were used for Brent's conjecture together with Robin, logarithmic mean/average, equation (7.3), prime distribution, proof, and recent resolution. The source archive's existing applications were also screened. No earlier unconditional resolution of these exact statements was found in the retrieved sources. This bounded audit does not prove exclusive priority.

Shanks's conjecture was already disproved and is excluded. The numerical size of a prime-counting verification is irrelevant here. The full asymptotic statements, not a bounded range, have been deduced.

This note's result category is **inherited RH/Dirichlet-GRH application with a complete written deduction**. It is not a claim to have newly discovered the conditional implication.

## Review status

The proof is committed for independent review. The main checks are the integrated-zero-series convergence, the prime-square signs, the \(2\log\log X\) term, the real nonvanishing of \(\beta\), and the signed denominator transition in (12)–(13). No Lean verification is used.
