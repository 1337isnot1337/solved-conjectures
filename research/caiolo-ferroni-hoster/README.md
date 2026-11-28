# Caiolo–Ferroni–Hoster conjecture

Status: unresolved. This checkpoint contains exact reductions and diagnostics,
not a proof or a counterexample. Issue: [#111](https://github.com/1337isnot1337/solved-conjectures/issues/111).

## Statement and sources

For every matroid $`M`$, the dual Chow polynomial $`H_M^*(x)`$ has only
nonpositive real zeros. Caiolo–Ferroni–Hoster state this as Conjecture 7.3
in [arXiv:2605.28474v1](https://arxiv.org/html/2605.28474v1).
The following paragraph also conjectures real-rootedness of the dual right
augmented polynomial $`F_M^*(x)`$, with roots interlaced by those of $`H_M^*`$.

The dual invariant uses the sign-twisted reverse characteristic kernel.
It differs from the ordinary Chow invariant. The source proves gamma
positivity for matroids and real-rootedness for uniform matroids. Its
EL-shellable-poset counterexample in Remark 7.4 is not a matroid example.

The ordinary Chow counterexamples of Bérczi–Coron–Eur–Li, abbreviated BCEL,
are in [arXiv:2610.17135v1](https://arxiv.org/html/2610.17135v1).
The full HTML was checked for a dual-Chow claim; none occurs. Per Alexandersson's
[October 29 literature comment](https://github.com/PerAlexandersson/RealRooted/issues/1394#issuecomment-6506049597)
explicitly retains the dual conjecture after BCEL and Eberhardt's
Z-polynomial counterexample. The current
[author's open-problem page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm)
also distinguishes these invariants. Both web engines and global GitHub issue
searches, checked November 20, found no explicit full dual-matroid resolution.
These are bounded searches, not a claim of exhaustive priority certification.

## Exact flag-vector reduction

Let $`P`$ have rank $`r`$, let $`\alpha_P(S)`$ count chains with internal rank set
$`S\subseteq[r-1]`$, and put

```math
\beta_P(S)=\sum_{T\subseteq S}(-1)^{|S|-|T|}\alpha_P(T).
```

CFH Theorem 4.9 gives

```math
H_P^*(x)=\sum_{\substack{S\subseteq[r-2]\text{ has no consecutive elements}}}
\beta_P([r-1]\setminus S)x^{|S|}(1+x)^{r-1-2|S|},
```

and the corresponding formula for $`F_P^*`$ uses stable subsets of $`[r-1]`$
and exponent $`r-2|S|`$. Thus one can work with gamma polynomials of about
half the degree. Real-rootedness of a palindromic polynomial with nonnegative
gamma coefficients is equivalent to real-rootedness of its gamma polynomial:
each negative gamma root $`z`$ produces the two negative roots of
$`x/(1+x)^2=z`$, with the remaining degree represented by factors $`1+x`$.

The script uses BCEL Proposition 4.16 for their projective family
$`\mathcal C(q,N)`$, and Corollary 4.11 for their affine family $`M_q`$.
For the truncated direct sum of two affine examples and a coloop, a separate
flag-product routine enumerates weak component rank sequences and multiplies
the corresponding factor flag counts. Truncation preserves all flats below
its new top rank, so the required proper flag counts remain unchanged.

## A conditional amplification route

The following incidence-algebra identity identifies what would be needed to
transfer a failure from one matroid to arbitrarily many direct summands.
It does not establish that the required failure occurs.

Write $`\kappa=(\chi^{\mathrm{rev}})^{\mathrm{sgn}}`$ for the dual kernel,
$`\nu=\mu^{\mathrm{sgn}}`$, and $`\delta`$ for the identity of the incidence
algebra. CFH Definition 2.4 implies

```math
H^*(x)=(1-x)(\kappa(x)-x\delta)^{-1}
       =(1-x)\sum_{m\geq0}x^m\kappa(x)^{-(m+1)}.
```

The identity holds as a formal power series, including diagonal intervals.
Since $`\chi=\mu\zeta^{\mathrm{rev}}`$, we have
$`\kappa^{-1}=\nu(\zeta^{\mathrm{rev}})^{\mathrm{sgn}}`$, whose value at
$`x=0`$ is $`\nu`$. For a nontrivial geometric lattice $`P`$ of rank $`r`$, define

```math
u_m=(\nu^m)_{\widehat0,\widehat1}
   =(-1)^r(\zeta^{-m})_{\widehat0,\widehat1}
   =(-1)^r Z_P(-m),\qquad m\geq1.
```

Here $`Z_P(m)=(\zeta^m)_{\widehat0,\widehat1}`$ is the zeta polynomial.
The sign-twisted Möbius function is nonnegative on geometric-lattice
intervals and is strictly positive on the full interval. Writing
$`\nu=\delta+A`$ shows $`u_{m+1}>u_m>0`$: the term $`A`$ alone contributes
$`mA_{\widehat0,\widehat1}`$ to $`u_m`$.

The dual kernel of a Cartesian product is the tensor product of the factor
kernels. Consequently, if $`P^k`$ denotes a Cartesian power and
$`K_m(x)=(\kappa(x)^{-m})_{\widehat0,\widehat1}`$, then

```math
H_{P^k}^*(x)=(1-x)\sum_{m\geq0}x^m K_{m+1}(x)^k.
```

For each fixed $`j\geq0`$, coefficient extraction gives

```math
[x^j]H_{P^k}^*(x)=u_{j+1}^k(1+o(1))\qquad(k\longrightarrow\infty).
```

Indeed, the term $`m=j`$ contributes exactly $`u_{j+1}^k`$. Every other
contribution is bounded by a fixed polynomial in $`k`$ times $`u_j^k`$,
because only finitely many coefficients of finitely many $`K_m`$ occur and
$`u_m\leq u_j<u_{j+1}`$ for $`m\leq j`$. The case $`j=0`$ is exact.
It follows that any strict inequality

```math
u_{j+1}^2\lt u_j u_{j+2}\qquad(j\geq1)
```

would force non-log-concavity of the dual Chow polynomial of every sufficiently
large direct sum of copies of $`M`$. Such a failure would refute the whole
conjecture. BCEL use positive zeta arguments in their ordinary-Chow
amplification. Their result does not automatically provide the negative-argument
inequality needed here. No example satisfying this condition has been found.

### Exact obstruction for the BCEL affine family

For the entire affine family $`M_q`$, the required negative-zeta failure is
impossible. This is a statement about the failed approach, not a claimed
resolution of the dual Chow conjecture.

Put $`c_i=\sum_{|S|=i}\alpha_{M_q}(S)`$. Direct chain counting gives
$`Z_{M_q}(t)=\sum_{i=0}^3c_i\binom{t}{i+1}`$, with $`c_0=1`$. Hence

```math
u_m=-m+c_1\binom{m+1}{2}-c_2\binom{m+2}{3}
          +c_3\binom{m+3}{4}.
```

Substitute the exact flag formulas from BCEL Corollary 4.11, with auxiliary
parameter $`(q^2+1)/2`$. Expand the polynomial
$`D(q,m)=u_{m+1}^2-u_m u_{m+2}`$. The function
`affine_negative_zeta_certificate()` in the accompanying script calculates
$`D(Q+3,M+1)`$ over the rational numbers. It has 133 nonzero coefficients;
every coefficient, including the constant coefficient, is strictly positive.
This is a finite exact coefficient certificate for
$`D(q,m)>0`$ for all real $`q\geq3,m\geq1`$, in particular for every admissible
odd prime power and every positive integer $`m`$. It is not a parameter-grid
test. Thus this family cannot supply the amplification obstruction at any
negative integer argument. The attempted transfer from BCEL is parked.

## Diagnostic scope

Exact rational Sturm root counts were run for the gamma polynomials of
$`\mathcal C(q,N)`$ with $`q\in\{2,3,5,7,11,23,101\}`$ and
$`N\in\{4,q^3\}`$. All 28 polynomials (ordinary dual and augmented dual)
had three real roots. Their coefficients were positive, so those roots
were negative. This finite check proves no uniform case of the conjecture.

The rank-seven truncation of $`M_q\oplus M_q\oplus U_{1,1}`$ was checked
at $`q\in\{3,47,97,1009\}`$. Both gamma polynomials again had three negative
real roots. Rational root-isolation diagnostics also gave the expected
alternating gamma-root order for these four examples and for the projective
examples with $`q\in\{2,3,5,23,101\}`$. No counterexample was found.

The existing ordinary-Chow constructions therefore do not immediately settle
the dual conjecture. Further enumeration of these same positive instances is
not the present goal. A structural negative-zeta inequality or a different
matroid construction is needed.
