# Fang–Zhang–Zhao conjecture

Status: complete proposed disproof, under independent review. Research date: 21 November 2026. Coordination: [issue #160](https://github.com/1337isnot1337/solved-conjectures/issues/160).

## Original conjecture

Hanqian Fang, Candice X. T. Zhang and James J. Y. Zhao, *Analytic properties arising from the Baxter numbers*, [arXiv:2505.05873v1](https://arxiv.org/html/2505.05873v1#S4), Conjecture 4.3, propose that for every fixed integer m at least two the sequence of Hoggatt sums is infinitely log-convex. The published article is *Journal of Mathematical Analysis and Applications* **561** (2026), 130615, [DOI 10.1016/j.jmaa.2026.130615](https://doi.org/10.1016/j.jmaa.2026.130615).

Write these sums as

```math
h_n(m)=H_n^{[m]}(1,1)
=\sum_{k=0}^{n-1}
\frac{\prod_{j=0}^{m-1}\binom{n+m-2}{k+j}}
{\prod_{j=1}^{m-1}\binom{n+m-2}{j}},
\qquad n\ge1.
```

The operator in the paper is

```math
(\mathcal L a)_n=a_na_{n+2}-a_{n+1}^{\,2}.
```

Infinite log-convexity requires every entry of every iterate to be nonnegative.

## Result

**Theorem.** For every integer m at least four, the sequence h(m) is not infinitely log-convex. More precisely,

```math
(\mathcal L^3 h(m))_2<0 \quad(m\ge6),
```

and

```math
(\mathcal L^4 h(4))_2
=-111509459048444462640611465400686603136<0,
```

```math
(\mathcal L^4 h(5))_2
=-44045680773437284570849713497906508911110782976<0.
```

This refutes the entire universal conjecture. It does not resolve the separate Baxter-number conjecture, which concerns m equal to three, or the separate interlacing conjecture for q-Hoggatt polynomials. Different values of m are not counted as separate resolutions.

## Polynomial reduction

For fixed n, the same row sum has the polynomial expression

```math
h_n(m)=\sum_{k=0}^{n-1}
\prod_{i=1}^{k}\prod_{j=1}^{n-1-k}
\frac{m+i+j-1}{i+j-1}.
\tag{1}
```

For positive integral m, this is the usual product formula for plane partitions in a k by (n-1-k) by m box. It also follows directly from the displayed binomial formula by factorial cancellation. Empty products are one. Thus (1) can be used as a polynomial identity in a real variable m; only its positive integral values are needed for the conjecture.

Put

```math
\begin{aligned}
A(m)&=m^4+9m^3+26m^2+36m+72,\\
Q(m)&=m^{17}+42m^{16}+723m^{15}+6462m^{14}+27742m^{13}\\
&\quad-16148m^{12}-934842m^{11}-5962420m^{10}\\
&\quad-21758691m^9-53818158m^8-97778329m^7\\
&\quad-138523978m^6-159475276m^5-154920392m^4\\
&\quad-129902448m^3-88784352m^2-37081152m-2892672.
\end{aligned}
```

Substitution of (1) for n from two through eight, followed by three applications of the defining operation, gives the exact identity

```math
(\mathcal L^3h(m))_2
=
-\frac{
m^4(m-1)^4(m+1)^5(m+2)^2 A(m)Q(m)
}{1547934105600}.
\tag{2}
```

The calculation is polynomial arithmetic. To make (2) directly reproducible, the seven initial polynomials are:

```math
\begin{aligned}
h_2(m)&=2,\\
h_3(m)&=m+3,\\
h_4(m)&=m^2+3m+4,\\
h_5(m)&=\frac{(m+5)(m^3+7m^2+12m+12)}{12},\\
h_6(m)&=\frac{m^6+15m^5+97m^4+345m^3+694m^2+720m+432}{72},\\
h_7(m)&=\frac{m+7}{8640}\bigl(m^8+26m^7+280m^6+1658m^5
+6043m^4\\
&\hspace{38mm}+14156m^3+21036m^2+17280m+8640\bigr),\\
h_8(m)&=\frac{1}{518400}\bigl(m^{12}+42m^{11}+809m^{10}
+9450m^9+74463m^8\\
&\hspace{10mm}+415926m^7+1684067m^6+4975950m^5
+10682836m^4\\
&\hspace{10mm}+16371432m^3+17106624m^2+10886400m+4147200\bigr).
\end{aligned}
```

The supplied script verifies (2) by exact rational polynomial arithmetic and checks the row sums independently from their binomial definition.

## Sign for every m at least six

Every factor in (2), apart from the leading minus sign and Q, is strictly positive for m at least six.

The coefficients of Q of degrees thirteen through seventeen are positive; every coefficient of degrees zero through twelve is negative. Therefore Q(m)/m^12 is strictly increasing on the positive real axis: its positive-power terms are strictly increasing, its negative-power terms have negative coefficients and are increasing, and its remaining term is constant.

Exact substitution gives

```math
Q(6)=264264378826752>0.
```

It follows that Q(m) is positive for every real m at least six. Identity (2) proves the asserted strict negative sign for all those m.

For an alternative algebraic check, every coefficient of Q(m+6) is positive. The script checks this directly, but this second check is not needed for the monotonicity argument.

## The remaining parameters four and five

For m equal to four, h_n for n from two through ten is

```text
2, 7, 32, 177, 1122, 7898, 60398, 494078, 4274228.
```

Three applications of the definition give, at indices two, three and four,

```text
38581511487375,
28565867977326238944,
18260024739573021120028544.
```

Consequently, the fourth iterate at index two is the product of the first and third integers minus the square of the second, which is the negative integer in the theorem.

For m equal to five, the corresponding nine initial values are

```text
2, 8, 44, 310, 2606, 25202, 272582, 3233738, 41454272,
```

and the third-iterate values are

```text
8273362306809600,
232755962172544320333824,
1224370065975731244300061900800.
```

The same final multiplication and subtraction gives the second negative integer in the theorem. This completes the proof.

## Small witness

Even without the polynomial family, m equal to six gives a short exact disproof. The seven terms at indices two through eight are

```text
2, 9, 58, 506, 5462, 70226, 1038578.
```

Their second iterate at indices two through four is

```text
710500, 3092307680, 12524096657856.
```

Thus

```math
710500\cdot12524096657856-3092307680^2
=-663996112380294400<0.
```

All numbers here are integers obtained from a finite explicit formula. No floating-point root calculation, optimization output, or asymptotic estimate is used in the proof.

## Verification and priority

Run `python3 verify.py` from this directory. Python and SymPy are used for the symbolic cross-check; the numerical witnesses are checked with integers and fractions.

The original statement and source formula have been checked in the full primary arXiv text. Current prior-resolution screening and independent review are recorded separately in NOVELTY.md and REVIEW.md when complete. A negative literature search cannot establish the absence of unpublished or inaccessible work. This note remains unrefereed.
