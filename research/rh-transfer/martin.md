# Martin's conjecture

Research checkpoint, 20 November 2026. Status: unresolved by the accepted RH/Dirichlet-GRH input and the inspected conditional theorems. No solved-target count.

## 1. The full named statement

Let omega(n) count the distinct prime divisors of n and let chi_4 be the nonprincipal character modulo 4. Define

~~~math
W(x)=\sum_{n\le x}\chi_4(n)\omega(n)
=\sum_{\substack{n\le x\\n\equiv1\bmod4}}\omega(n)
 -\sum_{\substack{n\le x\\n\equiv3\bmod4}}\omega(n).
\tag{1}
~~~

Greg Martin's conjecture is that W(x)<0 for every sufficiently large x. It is an eventual pointwise sign conjecture.

The statement is explicitly recorded in Xianchang Meng's [Number of prime factors over arithmetic progressions, Q. J. Math. 71 (2020), 97–121](https://doi.org/10.1093/qmathj/haz040), and in Ofir Gorodetsky's [Sums of two squares are strongly biased towards quadratic residues, Algebra Number Theory 17 (2023), 775–804](https://arxiv.org/pdf/2111.12662), Section 2E.

A density-one version must not be substituted for this statement. A set of density zero can still contain infinitely many arbitrarily large exceptions.

## 2. The complete inherited density consequence

Gorodetsky's Theorem 2.1 assumes only Dirichlet GRH. It removes the linear-independence hypothesis from Meng's earlier result and strengthens logarithmic density one to natural density one.

For q=4, a=1, b=3, the theorem's coefficient is

~~~math
D_{4,1,3}
=\sum_{\substack{\chi\bmod4\\\chi^2=\chi_0}}
 (\chi(1)-\chi(3))L(1/2,\chi)
=2\beta(1/2)>0.
\tag{2}
~~~

Positivity is elementary: the absolutely convergent paired series

~~~math
\beta(1/2)=
\sum_{j\ge0}
 \big((4j+1)^{-1/2}-(4j+3)^{-1/2}\big)
~~~

has positive terms. Hence the accepted Dirichlet GRH input and Theorem 2.1 give

~~~math
\#\{m\le X:W(m)<0\}=X(1+o(1)).
\tag{3}
~~~

The corresponding sum with Omega(n), counting prime factors with multiplicity, is positive on a natural-density-one set. This is an additional conclusion of the same old conditional theorem, not a proof of Martin's eventual-sign conjecture.

Gorodetsky explicitly describes Theorem 2.1 as progress towards the full conjecture. This scope distinction is present in the primary source, rather than inferred from a summary.

## 3. Why GRH does not close the inspected proof

There is an exact generating-function identity, initially for Re(s)>1:

~~~math
\sum_{n\ge1}\frac{\chi_4(n)\omega(n)}{n^s}
=\beta(s)P_\chi(s),
\qquad
P_\chi(s)=\sum_p\frac{\chi_4(p)}{p^s}.
\tag{4}
~~~

It follows from omega=1*1_Primes and complete multiplicativity of chi_4. Expanding the Euler product further gives

~~~math
\beta(s)P_\chi(s)
=\beta(s)\left[
 \log\beta(s)
 -\frac12\log\big((1-2^{-2s})\zeta(2s)\big)
 +G_\omega(s)\right],
\tag{5}
~~~

where G_omega continues holomorphically to Re(s)>1/3 and is bounded on Re(s)>=1/3+epsilon. This is Gorodetsky's equation (6.2), specialized to chi_4.

The real singularity at s=1/2 contributes

~~~math
-\beta(1/2)\frac{\sqrt x}{\log x}
+O\left(\frac{\sqrt x}{(\log x)^2}\right),
\tag{6}
~~~

as proved in Lemma 6.4(2), equation (6.4). The remaining nonreal zero contributions are smaller in an averaged L^2 sense. The proof of Theorem 2.1, Section 6B, yields an error E(x) in

~~~math
W(x)=-\beta(1/2)\frac{\sqrt x}{\log x}+E(x)
\tag{7}
~~~

satisfying

~~~math
\frac1X\int_X^{2X}|E(x)|^2\,dx
\ll
\frac{X(\log\log X)^2}{(\log X)^4}.
\tag{8}
~~~

Consequently the exceptional set where the error can exceed the main term has relative measure

~~~math
O\left(\frac{(\log\log X)^2}{(\log X)^2}\right)=o(1),
\tag{9}
~~~

by Chebyshev's inequality. This proves (3), but leaves open the possibility of a sparse infinite exceptional set.

The exact missing statement is a suitable pointwise upper bound on the positive part of E(x). For example,

~~~math
E(x)=o\left(\frac{\sqrt x}{\log x}\right)
\quad\hbox{for all sufficiently large }x
\tag{10}
~~~

would imply Martin's conjecture. Equation (8) does not imply (10).

GRH places the nonreal singularities on the line Re(s)=1/2. It does not by itself supply the cancellation in their full pointwise sum that this argument would need. The inspected Selmer-count and height bounds in the accepted proof have not been linked to that missing cancellation.

## 4. Attempted routes and their exact limitation

The Fujii boundary method does not transfer directly. There, after a fixed smoothing, a nonzero zero contribution is of the same normalized size as the prime-square term, and recurrence produces opposite signs. Here the factor beta(s) in (5) vanishes at each nonreal zero. Local zero contributions are therefore suppressed by an additional logarithmic factor relative to the central bias. Recurrence of a fixed finite set of zeros does not overcome a main term whose normalized dominance grows with log x.

Landau's positivity theorem also gives no contradiction to eventual negativity. Unlike the Fujii converse with an off-line zero, (5) has a real singularity at the same abscissa as the nonreal singularities. Such a real singularity is consistent with the Mellin transform of an eventually nonnegative function.

These observations do not prove that the full conjecture is inaccessible from GRH. They identify why the inspected arguments do not currently establish it.

## 5. Prior-art screen

Both search engines were used with Martin, constant sign, prime factors, omega, GRH, solved, disproved, and 2025/2026. The principal exact-target sources found were Meng 2020 and Gorodetsky 2023. No later full pointwise resolution was located in this bounded search.

The following similarly named material was excluded:

- The Banks–Martin conjecture concerns Erdős sums of primitive sets or almost primes, a different problem. Several forms already have proofs or counterexamples.
- Vinogradov's least primitive-root conjecture has a conditional route through a different result of Martin and was already separately screened.
- Density-one assertions for sums of two squares are not Martin's eventual omega-sign assertion.

The useful committed conclusion is (3), together with the exact pointwise obstacle (10). The original named conjecture remains open in this research record.
