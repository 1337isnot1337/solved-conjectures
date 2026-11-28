# Lyon’s conjecture

Status: proposed complete proof, with an exact integer certificate on one compact interval. Two independent mathematical reviews and complete certificate replays passed. The completed prior-resolution audit is recorded in SOURCES.md. No Lean verification is used.

## Statement

Let $`m(a)`$ be the unique median of the unit-scale gamma distribution with shape $`a>0`$, so that

```math
P(a,m(a))=\frac12,
\qquad
P(a,x)=\frac1{\Gamma(a)}\int_0^x t^{a-1}e^{-t}\,dt.
```

Lyon’s conjecture states that

```math
A(a)=2^{1/a}m(a)-a
```

is strictly decreasing on the entire positive half-line. The [2023 paper](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0288601) retains this conjecture, and the introduction and Section 3 of [arXiv:2611.14429v1](https://arxiv.org/abs/2611.14429), dated 10 November 2026, explicitly say it remains open.

We prove $`A'(a)<0`$ everywhere. The ranges $`0<a\le1/10`$ and $`a\ge7`$ have analytic proofs. An exact integer certificate covers every real parameter in the intervening closed interval.

## Established ingredients

We use the following published theorems, with exactly the common unit-scale convention:

1. $`0<m'(a)<1`$ for all $`a>0`$: Berg and Pedersen, *The Chen–Rubin conjecture in a continuous setting*, Theorem 3.3; [primary preprint](https://arxiv.org/pdf/math/0411282).
2. $`m''(a)>0`$ for all $`a>0`$: Berg and Pedersen, *Convexity of the median in the gamma distribution*, Theorem 1.1; [primary preprint](https://arxiv.org/pdf/math/0609442).
3. $`m(a)>a-1/3`$: Chen and Rubin’s bound, also recorded and used in the first Berg–Pedersen paper.

Only the first derivative bound is needed on the large tail. Convexity is used exclusively to extend finitely many strict inequalities over whole real intervals.

Put $`L=\log2`$ and $`v(a)=e^{L/a}m(a)`$, so $`A=v-a`$. We use the elementary rational bounds

```math
\frac{693}{1000}\lt L<\frac7{10},
\qquad \pi^2<10,
\qquad \gamma>\frac{57}{100},
\qquad \log(3/2)<\frac{41}{100},
\tag{1}
```

Here $`\gamma`$ is Euler’s constant. The logarithm and $`\pi`$ bounds follow from the series certified below. For the Euler-constant bound, the elementary integral comparison gives $`\gamma>H_{100}-\log101`$, and the certificate verifies that this last expression exceeds $`57/100`$.

## The small-parameter range

Fix $`0<a\le1/10`$, and write $`m=m(a)`$. Define

```math
E(a,m)=a\int_0^1 t^{a-1}e^{-mt}\,dt,
\qquad
g(a)=\frac{\log\Gamma(1+a)}a.
```

The median equation is $`m^aE(a,m)=\Gamma(1+a)/2`$, and hence

```math
\log v=g(a)-\frac{\log E(a,m)}a.
```

The derivative of $`g`$ satisfies

```math
g'(a)=\int_0^1 t\psi'(1+at)\,dt
\le\frac{\psi'(1)}2=\frac{\pi^2}{12}<\frac56.
\tag{2}
```

Here $`\psi'(x)=\sum_{n\ge0}(x+n)^{-2}`$ is positive and decreasing.

At fixed $`a,m`$, put $`q=-E_m/E`$. Since this is a weighted mean of $`t\in(0,1)`$, we have $`0<q<1`$. Integration by parts gives

```math
E(a,m)=e^{-m}+m\int_0^1 e^{-mt}t^a\,dt,
```

so partial differentiation with respect to $`a`$ yields

```math
0\le-E_a(a,m)
=m\int_0^1 e^{-mt}t^a(-\log t)\,dt
\le\frac{m}{(a+1)^2}.
\tag{3}
```

Also $`e^{-m}\le E\le1`$. All differentiations are justified by integrable logarithmic majorants locally in $`a>0`$.

Differentiating the median equation, and then subtracting $`L/a^2`$ from $`m'/m`$, gives the exact identity

```math
\frac{v'}v=
\frac{a g'(a)+\log E/a-E_a/E+Lm q/a^2}{a-mq}.
\tag{4}
```

We first establish the small-parameter bound needed in (4), independently of Lyon’s published bounds. Put $`x_0=(2/3)e^{-L/a}`$. Since $`\psi'(1+t)<5/3`$,

```math
\log\Gamma(1+a)
=-\gamma a+\int_0^a(a-t)\psi'(1+t)\,dt
\le-\gamma a+\frac56a^2.
```

For $`j=1,3`$, the function $`e^{-L/a}a^{-j}`$ is increasing on $`(0,1/10]`$, because its logarithmic derivative is $`(L-ja)/a^2>0`$. Thus $`x_0/a\le5/768`$. From $`E(a,x_0)\ge e^{-x_0}`$ and (1),

```math
\begin{aligned}
\log(2P(a,x_0))
&\ge a\log(2/3)-x_0-\log\Gamma(1+a)
\\ &\ge a\left(\gamma-\log(3/2)-\frac56a-\frac{x_0}{a}\right)
\\ &>a\left(\frac4{25}-\frac1{12}-\frac5{768}\right)
=\frac{449a}{6400}>0.
\end{aligned}
```

Therefore $`P(a,x_0)>1/2`$, so $`m<x_0`$ and

```math
v<\frac23,
\qquad m<\frac23e^{-L/a}.
```

The same monotonicity calculation now gives

```math
m<\frac1{1536},\qquad
\frac ma<\frac5{768},\qquad
\frac m{a^3}<\frac{125}{192}.
\tag{5}
```

In particular $`a-mq>a-m>0`$ and $`e^m<2`$. Dropping the nonpositive term $`\log E/a`$ from (4), and applying (2), (3), and (5), gives

```math
\begin{aligned}
v'
&\le\frac{v}{1-m/a}
\left(g'(a)+\frac{m e^m}{a(a+1)^2}+\frac{Lm}{a^3}\right)
\\ &<\frac{2/3}{1-5/768}
\left(\frac56+\frac{10}{768}
+\frac7{10}\frac{125}{192}\right)
=\frac{2000}{2289}<1.
\end{aligned}
```

Thus $`A'=v'-1<0`$ throughout the small range.

## The large-parameter range

For $`a\ge7`$, the established bounds $`m'<1`$ and $`m>a-1/3`$ imply

```math
A'(a)
\lt e^{L/a}\left(1-\frac La+\frac{L}{3a^2}\right)-1.
\tag{6}
```

For every $`t>0`$, Taylor’s formula with its integral remainder gives
$`e^{-t}>1-t+t^2/2-t^3/6`$. Taking $`t=L/a`$ shows

```math
e^{-L/a}-\left(1-\frac La+\frac{L}{3a^2}\right)
>\frac{L}{6a^3}\left(a(3L-2)-L^2\right)>0.
```

For the final sign, (1) gives

```math
a(3L-2)-L^2
\ge7(3L-2)-L^2
>7\left(3\frac{693}{1000}-2\right)-\frac{49}{100}
=\frac{63}{1000}>0.
```

Equation (6) now yields $`A'(a)<0`$ on the entire large range.

## A finite criterion covering a real interval

Let $`0<a<b<c`$. Suppose strict enclosures

```math
\ell_t\lt m(t)\lt u_t\qquad(t=a,b,c)
```

have been certified. Convexity and monotonicity imply, for every real $`x\in[a,b]`$,

```math
m'(x)\le\frac{m(c)-m(b)}{c-b}
<\frac{u_c-\ell_b}{c-b},
```

and

```math
e^{-L/x}+\frac{Lm(x)}{x^2}
\ge e^{-L/a}+\frac{Lm(a)}{b^2}
>e^{-L/a}+\frac{L\ell_a}{b^2}.
```

It is therefore sufficient to check the strict inequality

```math
\frac{u_c-\ell_b}{c-b}
\lt e^{-L/a}+\frac{L\ell_a}{b^2}.
\tag{7}
```

Indeed, (7) gives $`m'(x)<e^{-L/x}+Lm(x)/x^2`$, which is exactly $`A'(x)<0`$ after multiplication by $`e^{L/x}`$.

This implication is the reason finite arithmetic verifies all real parameters in a cell, rather than only its endpoints.

## Exact certificate on the remaining compact interval

The file `medians.json` contains rational brackets at 4258 rational nodes. The nodes are specified independently of the file by the following integer recurrence:

```math
N_0=100000,\qquad
N_{i+1}=\min\{7000000,N_i+\lfloor N_i/1000\rfloor\}
```

until $`N_i=7000000`$, followed by the extra node $`7007000`$. Set $`a_i=N_i/10^6`$. The 4256 consecutive cells ending at $`7`$ cover exactly $`[1/10,7]`$; the one extra node supplies the final forward secant.

Each proposed median bracket has denominator $`10^{12}`$ and width at most $`4\cdot10^{-12}`$. The verifier treats all these brackets as untrusted input. At every node it proves

```math
P(a_i,\ell_i)<\frac12\lt P(a_i,u_i),
```

then checks (7) for every consecutive triple. Strict increase of $`P(a_i,x)`$ in $`x`$ turns the first pair of inequalities into a valid median bracket.

Run the certificate with a standard-library Python interpreter:

```text
python3 verify.py
```

### Arithmetic and truncation rules

Every interval endpoint is an integer divided by $`2^{128}`$. Every addition, multiplication, reciprocal, and division uses integer floor and ceiling operations, so rounding is always outward. No floating-point operation participates in any mathematical assertion. The displayed elapsed time is diagnostic only.

Logarithms use power-of-two reduction followed by 64 terms of

```math
\log y=2\sum_{j=0}^{63}\frac{r^{2j+1}}{2j+1}+R,
\qquad r=\frac{y-1}{y+1},\quad 1\le y\le2,
\quad 0\le R\le\frac{2r^{129}}{129(1-r^2)}.
```

The constant $`\pi`$ is enclosed using Machin’s identity and 64 terms of each alternating arctangent series, with the first omitted term bounding the error. Positive exponentials use the constant term and 40 nonconstant Taylor terms after dividing the argument by 16, a geometric majorant for the positive tail, and four squarings. Reciprocation supplies the required negative exponential.

For $`\log\Gamma(1+a)`$, the verifier uses recurrence from $`z=a+17`$ and Stirling’s expansion through the $`B_{16}`$ term. For real positive $`z`$, its remainder is positive and bounded above by

```math
\frac{B_{18}}{18\cdot17\,z^{17}}
=\frac{43867}{244188\,z^{17}}.
```

This is the standard signed remainder bound for real positive arguments, recorded in [DLMF 5.11(ii)](https://dlmf.nist.gov/5.11#ii). It also follows directly by integrating the finite alternating expansion of the arctangent in Binet’s formula.

Finally the absolutely convergent positive expansion [DLMF 8.11.4](https://dlmf.nist.gov/8.11.E4) gives

```math
P(a,x)=\frac{x^a e^{-x}}{\Gamma(1+a)}
\sum_{n\ge0}\frac{x^n}{(a+1)_n}.
```

The verifier retains terms through $`n=80`$. If $`t_n=x^n/(a+1)_n`$, the remaining tail is at most

```math
\frac{t_{81}}{1-x/(a+82)},
```

because the successive ratios decrease. The denominator is positive for every bracket used. The sign of the rigorously enclosed $`\log(2P)`$ certifies each CDF comparison.

Thus the certificate has finitely many explicit integer inequalities, each accompanied by a mathematical enclosure rule. The analytic tails and the interval criterion together prove the entire conjecture once these inequalities pass. The certificate is an essential part of this computer-assisted proof, rather than an optional numerical illustration.
