# Chowla's conjecture

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Target and status

Here “Chowla's conjecture” means the least-prime conjecture. For coprime integers \(a,q\), let \(P(a,q)\) be the smallest prime congruent to \(a\) modulo \(q\). The target is

~~~math
\forall\delta>0\quad
P(a,q)\ll_\delta q^{1+\delta},
\qquad\text{uniformly in }q\ge2,\ (a,q)=1.
\tag{C}
~~~

Révész's 1980 paper explicitly attributes this formulation to Chowla. It is distinct from Chowla's conjectures on multiplicative correlations and central Dirichlet L-values. [1]

No proof of (C) is obtained here. The accepted Dirichlet-GRH input supplies the classical quadratic conductor bound. The missing step is cancellation between zeros belonging to different characters. This note quantifies that gap and gives a complete conditional passage from the corrected Montgomery estimate to (C), including the necessary treatment of prime powers.

## What the accepted input already gives

Lamzouri–Li–Soundararajan, Corollary 1.2, proves under Dirichlet GRH that

~~~math
P(a,q)\le(\varphi(q)\log q)^2\qquad(q>3,\ (a,q)=1).
\tag{1}
~~~

This applies directly to the accepted nonvanishing theorem in the RH archive. The corrected arXiv version is v3, dated December 2016; the stated correction concerns other asymptotic bounds, not Corollary 1.2. [2]

The quadratic exponent is explained by the smoothed explicit formula. For

~~~math
U_\chi(x)=\sum_{n\le x}\Lambda(n)\chi(n)\log(x/n),
~~~

the Mellin kernel is \(x^s/s^2\). Its nontrivial-zero contribution is

~~~math
-\sum_{\rho_\chi}\frac{x^{\rho_\chi}}{\rho_\chi^2}.
~~~

Under GRH, its absolute value is at most

~~~math
\sqrt{x}\sum_{\rho_\chi}|\rho_\chi|^{-2}
\ll\sqrt{x}\log(2q).
~~~

The last estimate follows by summing the standard zero-counting bound over unit-height intervals. Orthogonality then gives the progression main term \(x/\varphi(q)\), with an error of square-root size. The remaining elementary factors and residues contribute only powers of \(\log(qx)\). This is the mechanism in the explicit-formula lemmas and least-coset argument of [2].

To dominate that error uniformly, one needs \(\sqrt{x}\) of size at least \(\varphi(q)\log q\). Hence \(x\) has quadratic conductor size. Merely improving a logarithmic factor does not reach (C).

For a sharper comparison, consider prime moduli and \(x=q^{1+\delta}\), where \(0<\delta<1\). The available unsmoothed GRH estimate is

~~~math
\psi(x;q,a)=\frac{x}{\varphi(q)}
+O\!\left(\sqrt{x}\log^2(qx)\right).
\tag{2}
~~~

The main term has size \(q^\delta\), while the allowed error has size
\(q^{(1+\delta)/2}\log^2 q\). Their ratio is

~~~math
q^{(1-\delta)/2}\log^2q,
~~~

which grows. This estimate cannot even guarantee a positive weighted count at the scale required by (C).

## A complete sufficient bridge

Suppose the corrected Montgomery estimate holds: for every \(\eta>0\),

~~~math
\psi(x;q,a)=\frac{x}{\varphi(q)}
+O_\eta\!\left(\sqrt{x/q}\,x^\eta\right)
\tag{M}
~~~

uniformly in the relevant range \(q\le x^{1-\eta}\), for sufficiently large \(x\).

Then (C) follows. The proof below is included to make the exact remaining input reviewable. It is a conditional deduction, not a claim to have proved (M).

### Lemma: higher prime powers are negligible at the target scale

Fix \(0<\delta<1\), and put \(x=q^{1+\delta}\). Uniformly for \((a,q)=1\),

~~~math
\sum_{\substack{p^k\le x\\ k\ge2\\p^k\equiv a\pmod q}}\log p
=o_\delta(q^\delta).
\tag{3}
~~~

**Proof.** Fix an integer \(K\ge2\), to be chosen in terms of \(\delta\).

For each fixed \(2\le k\le K\), the congruence \(u^k\equiv a\pmod q\) has at most \(2k^{\omega(q)}\) solutions among the units modulo \(q\). This follows from the cyclic unit group at odd prime powers and the at-most-two-cyclic-factor structure at powers of two. Because \(x^{1/k}<q\), each root class contains at most one possible positive base \(p\le x^{1/k}\).

For fixed \(K\) and every \(\epsilon>0\),

~~~math
K^{\omega(q)}\ll_{K,\epsilon}q^\epsilon.
~~~

One elementary proof is to choose a fixed prime cutoff beyond which \(K\le p^\epsilon\), and absorb the finitely many smaller prime factors into the implied constant. Thus the contribution from \(2\le k\le K\) is

~~~math
O_{K,\epsilon}(q^\epsilon\log x).
~~~

For \(k>K\), discard the congruence and primality requirements. There are at most \(\log x/\log2\) possible exponents, and every base is at most \(x^{1/(K+1)}\). Their total weighted contribution is

~~~math
O\!\left(x^{1/(K+1)}\log^2x\right).
~~~

Choose \(K\) so that \((1+\delta)/(K+1)<\delta/4\), and take \(\epsilon=\delta/4\). Both bounds are \(o(q^\delta)\). This proves (3). ∎

### Proposition: (M) implies the full least-prime conjecture

Fix \(0<\delta<1\), set \(x=q^{1+\delta}\), and apply (M) with

~~~math
\eta=\frac{\delta}{8(1+\delta)}.
~~~

The required range holds, since

~~~math
(1+\delta)(1-\eta)=1+\frac{7\delta}{8}>1.
~~~

The main term is at least \(x/q=q^\delta\), and the error is

~~~math
O_\delta\!\left(
q^{\delta/2+(1+\delta)\eta}
\right)
=O_\delta(q^{5\delta/8})
=o(q^\delta).
~~~

Subtracting the higher-prime-power contribution (3) gives

~~~math
\theta(x;q,a)
=\sum_{\substack{p\le x\\p\equiv a\pmod q}}\log p
\ge(1-o(1))q^\delta>0.
~~~

There is therefore a prime \(p\le q^{1+\delta}\) in the class for all sufficiently large \(q\), uniformly in \(a\). The finitely many smaller moduli are absorbed into a constant, using Dirichlet's theorem. Exponents \(\delta\ge1\) follow from any smaller positive exponent. This proves (C) from (M). ∎

This argument avoids an invalid shortcut: positivity of \(\psi(x;q,a)\) alone establishes only the presence of a prime power, whose prime base need not belong to the desired residue class.

## The missing pair-correlation estimate

Kandhil–Languasco–Moree's 2026 paper defines

~~~math
F_q(x,T;a)=
\sum_{\chi_1,\chi_2\bmod q}
\overline{\chi_1(a)}\chi_2(a)
\sum_{\substack{|\gamma_1|\le T\\|\gamma_2|\le T}}
x^{i(\gamma_1-\gamma_2)}
\frac{4}{4+(\gamma_1-\gamma_2)^2}.
~~~

Zeros are counted with multiplicity, including possible central zeros. Their Conjecture 2 requires

~~~math
F_q(x,T;a),\,F_q^+(x,T;a)
\ll_\eta\varphi(q)T x^\eta,
\quad
q\le x^{1-\eta},\quad x^\eta\le T<x,
\tag{PC}
~~~

where \(F_q^+\) uses nonnegative ordinates. Their Theorem 4 derives (M) from GRH **and** (PC). GRH alone gives the estimate

~~~math
F_q(x,T;a)\ll\varphi(q)^2T\log^2(qT).
\tag{4}
~~~

Thus the outstanding conductor saving is essentially one factor of \(\varphi(q)\) in this quadratic expression. [3]

This is not supplied by the reality of the zero ordinates. That fact changes \(x^{\rho}\) into \(\sqrt{x}\,x^{i\gamma}\); it does not estimate the cancellation among the phases weighted by different characters.

The quantity \(F_q\) is nonnegative, since it equals a weighted integral of the square of a sum over characters and zeros. Positivity supplies a lower bound of zero, not the upper bound (PC). Replacing the full square by the sum of the individual squares incurs a factor \(\varphi(q)\) by Cauchy–Schwarz. Removing that factor without additional information is exactly the unsupported step.

Theorem 4 and the proposition above are sufficient to derive (C) if (PC) is proved. Neither the accepted RH input nor this note proves (PC). The word “Chowla” in [3]'s title concerns a different central-nonvanishing conjecture; the title alone should not be cited as a proof of the least-prime conjecture.

A further 2026 paper by the same authors, *Beyond the Riemann Hypothesis bounds*, explicitly retains pair-correlation hypotheses for improved least-prime bounds. Its abstract and current author publication list were checked; it is not evidence that GRH alone closes the gap. [4]

## Check of the intermediate arithmetic output

The source declaration \(\mathrm{CorG}\) in

[Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean)

is a proposition defining an upper bound for weighted Selmer lengths. Its displayed right side contains
\(\varphi([G:H])|D_K|^5N^{18}e^7(\log p+\log p')\). A definition of such a proposition is not itself a theorem asserting it.

The arithmetic-extraction lane found that the active proof uses a field-dependent variant, \(\mathrm{CorGK}\). Neither statement estimates \(F_q\), moments of a sum over zero ordinates, or the progression error in (M). No theorem converting those arithmetic lengths into (PC) has been identified.

The distinction in quantifiers also matters: a constant depending on a number field cannot be treated as uniform in \(q\) when the field is allowed to vary with a cyclotomic conductor. This is a precise barrier to the proposed transfer, not a proof that no deeper relation could exist.

## Search record and next mathematical step

Fresh searches on 20 November 2026 used both search systems and combined “Chowla”, “least prime”, “arithmetic progression”, “proof”, “conjecture”, “2025”, “2026”, and the exponent \(1+\epsilon\). Primary papers, the 2026 pair-correlation article, the July 2026 follow-up, and the author's October 2026 publication list were inspected.

No complete established proof of (C) was located. Recent results concerning almost-primes, fixed residue classes, almost all moduli, or other conjectures bearing Chowla's name do not settle this uniform all-moduli assertion.

The actionable target is now (PC), or a weaker estimate strong enough to prove positivity at \(x=q^{1+\delta}\) for every fixed \(\delta>0\). Repeating the individual-character GRH bound, removing logarithms, or merely bounding algebraic counting functions does not accomplish that step.

## Sources

1. Sz. Gy. Révész, *On the least prime in an arithmetic progression*, Studia Scientiarum Mathematicarum Hungarica 15 (1980), 83–87, introduction:  
   https://www.renyi.hu/~revesz/leastprimeap.pdf

2. Youness Lamzouri, Xiannan Li, Kannan Soundararajan, *Conditional bounds for the least quadratic non-residue and related problems*, Mathematics of Computation 84 (2015), 2391–2412; corrected preprint v3, especially §1.2, Corollary 1.2, and §§2–4:  
   https://arxiv.org/abs/1309.3595  
   https://arxiv.org/pdf/1309.3595  
   https://doi.org/10.1090/S0025-5718-2015-02925-1

3. Neelam Kandhil, Alessandro Languasco, Pieter Moree, *Pair correlation of zeros of Dirichlet L-functions: a possible path towards the conjectures of Chowla, Elliott–Halberstam and Montgomery*, Mathematische Annalen 394, article 43 (2026), equations (5), (8), Conjecture 2 and Theorem 4:  
   https://doi.org/10.1007/s00208-026-03383-y

4. The same authors, *Beyond the Riemann Hypothesis bounds: A pair-correlation approach to the least prime in arithmetic progression and the smallest quadratic non-residue* (16 July 2026), abstract:  
   https://doi.org/10.48550/arXiv.2607.14515  
   Current author publication list: https://www.dei.unipd.it/~languasco/Research.html
