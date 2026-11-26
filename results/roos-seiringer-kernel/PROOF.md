# Roos–Seiringer’s conjecture

## Statement and scope

Barbara Roos and Robert Seiringer, *BCS Critical Temperature on Half-Spaces*, Archive for Rational Mechanics and Analysis **249** (2025), article 20, [DOI 10.1007/s00205-025-02088-x](https://link.springer.com/article/10.1007/s00205-025-02088-x), define a radial Dirichlet kernel in §5. Immediately after Lemma 5.1 and the figures they state that its nonnegativity appears true but is beyond their proof.

This is the complete scalar assertion stated there. The paper considers the physical dimensions one, two, and three, but does not propose a corresponding kernel-positivity conjecture over arbitrary dimensions. No partial dimensional case is substituted for a broader conjecture here.

For positive real $`x`$, write

```math
J(x)=\int_1^\infty \frac{\sin^2(xk)}{k}\mathop{\mathrm{arccoth}}k\,dk,
\qquad
\mathop{\mathrm{arccoth}}k=\frac12\log\frac{k+1}{k-1}.
```

The function from the source is

```math
m(x)=\frac{4J(x)}{\pi x}
-\frac{2\sin^2x}{\pi x}
-\frac{2\sin^2x}{x^2}
+\frac{4\sin x}{\pi x^2}
\left(\sin x\mathop{\mathrm{Si}}(2x)
-\cos x\mathop{\mathrm{Cin}}(2x)\right),
```

where

```math
\mathop{\mathrm{Si}}y=\int_0^y\frac{\sin t}{t}\,dt,
\qquad
\mathop{\mathrm{Cin}}y=\int_0^y\frac{1-\cos t}{t}\,dt.
```

**Theorem.** For every positive real $`x`$, $`m(x)>0`$. Its continuous value at zero is zero.

The source's scaling identity (5.2) is

```math
m_3^D(r;\mu)=\mu^{-1/2}m(\sqrt\mu\,r).
```

Consequently the theorem gives $`m_3^D(r;\mu)>0`$ for every $`r>0`$ and $`\mu>0`$, with value zero at $`r=0`$. This is the radial average defined in (5.1), and is not the unaveraged kernel denoted by a tilde in Remark 1.5.

The proof is computer assisted. Two analytic arguments treat the unbounded ends of the domain. An exact integer interval computation certifies all points in the remaining compact interval. The executable certificate is [verify.py](verify.py); it uses only the Python standard library. Its role is essential and is specified in §5.

Set

```math
F(x)=\frac{\pi x^2}{4}m(x)
=xJ(x)-\frac{x+\pi}{2}\sin^2x
+\sin^2x\mathop{\mathrm{Si}}(2x)
-\sin x\cos x\mathop{\mathrm{Cin}}(2x).
```

It suffices to prove $`F(x)>0`$.

## 1. An exact entire series

Put

```math
H_k=\sum_{j=1}^k\frac1j,
\qquad O_k=\sum_{j=1}^k\frac1{2j-1},
\qquad
B_k=1-\frac{(2k-1)O_k}{k(2k+1)}-\frac{2H_k}{2k+1}.
```

We claim the identity

```math
F(x)=\frac\pi4\sum_{k=2}^\infty
\frac{(-1)^k(2x)^{2k}}{(2k)!}\frac{k-1}{2k-1}
+\frac x4\sum_{k=3}^\infty
\frac{(-1)^k(2x)^{2k}}{(2k)!}B_k. \tag{1}
```

Both series converge locally uniformly in the complex plane. The identity is needed only for positive real $`x`$.

### Derivation

For $`x>0`$, differentiation of the integral for $`J`$ gives

```math
J'(x)=\int_1^\infty\sin(2xk)\mathop{\mathrm{arccoth}}k\,dk.
```

The logarithmic singularity at one is integrable. The tails of the derivative integral converge uniformly on compact positive $`x`$-intervals by the Dirichlet test, since arccoth decreases to zero. The original integral converges uniformly there by absolute domination. These facts justify differentiation.

For $`y>0`$, integration by parts, with the endpoint cancellation displayed, gives

```math
\int_1^\infty\sin(yk)\mathop{\mathrm{arccoth}}k\,dk
=\frac1y\int_1^\infty\frac{\cos y-\cos(yk)}{k^2-1}\,dk. \tag{2}
```

Indeed, $`\cos y-\cos(yk)`$ vanishes at one; its product with arccoth also vanishes there. The boundary term at infinity vanishes because arccoth tends to zero.

Use $`1/(k^2-1)=\tfrac12((k-1)^{-1}-(k+1)^{-1})`$ in (2). Shift the first resulting integral by $`k-1`$ and the second by $`k+1`$, first with finite cutoffs and then take their common limit. The segment from zero to two contributes

```math
\frac12\int_0^2
\frac{\cos y(1-\cos(yu))+\sin y\sin(yu)}u\,du.
```

The remaining common tail contributes

```math
\sin y\int_2^\infty\frac{\sin(yu)}u\,du.
```

The discrepancy of the shifted upper cutoffs tends to zero. Thus

```math
J'(x)=\frac{
\cos(2x)\mathop{\mathrm{Cin}}(4x)
+\sin(2x)(\pi-\mathop{\mathrm{Si}}(4x))}{4x}. \tag{3}
```

The combination in this formula also has the useful identity

```math
\cos y\mathop{\mathrm{Cin}}(2y)-\sin y\mathop{\mathrm{Si}}(2y)
=2\int_0^1\frac{\cos y-\cos(yu)}{1-u^2}\,du. \tag{4}
```

To check (4), combine the defining integrals into
$`\int_0^2[\cos y-\cos(y(1-v))]\,dv/v`$, substitute $`u=1-v`$, and pair $`u`$ and $`-u`$. In the power-series expansion,

```math
\int_0^1\frac{1-u^{2k}}{1-u^2}\,du=O_k.
```

Equations (3)–(4), followed by integration from zero, therefore imply

```math
J(x)=\frac\pi4\mathop{\mathrm{Si}}(2x)
+\frac14\sum_{k=1}^\infty
\frac{(-1)^k(2x)^{2k}}{k(2k)!}O_k. \tag{5}
```

Here $`J(0)=0`$ follows by dominated convergence: arccoth divided by $`k`$ is integrable on $`[1,\infty)`$. The factorial denominators and $`O_k\le 1+\log k`$ justify the power-series integrations on compact sets.

For the other special-function combination, put $`y=2x`$. Trigonometric addition gives

```math
\begin{aligned}
&\sin^2x\mathop{\mathrm{Si}}(2x)
-\sin x\cos x\mathop{\mathrm{Cin}}(2x)
\\ &\quad=\frac12\int_0^1
\frac{\sin(yt)-\sin y+\sin(y(1-t))}{t}\,dt
\\ &\quad=-\frac12\sum_{k=1}^\infty
\frac{(-1)^k y^{2k+1}}{(2k+1)!}H_{2k}.
\end{aligned} \tag{6}
```

The last step uses

```math
\int_0^1\frac{t^{2k+1}-1+(1-t)^{2k+1}}t\,dt=-H_{2k}.
```

Substitute (5)–(6) into $`F`$, expand the remaining sine square, and use $`H_{2k}=O_k+H_k/2`$. The coefficient of the odd series is

```math
1+\frac{O_k}{k}-\frac{4H_{2k}}{2k+1}=B_k,
```

and the even series is the expansion of
$`\tfrac\pi4[x\mathop{\mathrm{Si}}(2x)-(1-\cos(2x))]`$.
This proves (1), including the zero coefficients for $`k=1,2`$ in its odd part.

## 2. Coefficient bounds and the interval from zero to one

Direct calculation gives

```math
B_1=B_2=0,\qquad B_3=\frac19.
```

The displayed definition shows $`B_k<1`$. Moreover,

```math
B_{k+1}-B_k
=\frac{(4k^2+4k)H_k+(4k^2-3)O_k-6k^2-3k}
{k(k+1)(2k+1)(2k+3)}. \tag{7}
```

Since $`H_k,O_k\ge1`$, the numerator is at least
$`2k^2+k-3=(k-1)(2k+3)`$. Thus $`B_k`$ is nondecreasing, and

```math
\frac19\le B_k<1\qquad(k\ge3). \tag{8}
```

For $`0<x\le1`$, both series in (1) are alternating series with decreasing absolute terms. For the even series the ratio of successive absolute terms is at most $`8/30<1`$; for the odd series (8) bounds it by $`36/56<1`$.

Keep the first two terms of the even series and the first term of the odd series. Their alternating remainders have the required sign, giving

```math
\begin{aligned}
F(x)&\ge\pi\left(\frac{x^4}{18}-\frac{2x^6}{225}\right)-\frac{x^7}{405}
\\ &\ge\left(\frac{7\pi}{150}-\frac1{405}\right)x^4
>\frac{557}{4050}x^4>0.
\end{aligned} \tag{9}
```

Only $`\pi>3`$ is used in the final strict inequality. Formula (1) also gives $`m(x)=2x^2/9+O(x^4)`$, so the continuous extension has $`m(0)=0`$.

## 3. The entire interval from forty to infinity

For $`k>1`$ the positive series

```math
\frac{\mathop{\mathrm{arccoth}}k}{k}
=\sum_{j=0}^\infty\frac1{(2j+1)k^{2j+2}}
```

can be truncated from below. Define

```math
q(k)=\sum_{j=0}^7\frac1{(2j+1)k^{2j+2}},
\quad H=\sum_{j=0}^7\frac1{2j+1},
\quad S=\sum_{j=0}^7\frac1{(2j+1)^2}.
```

The positive function $`q`$ decreases from $`H`$ to zero. Integration by parts gives

```math
\left|\int_1^\infty q(k)\cos(2xk)\,dk\right|
\le\frac{q(1)+\int_1^\infty|q'(k)|\,dk}{2x}
=\frac Hx.
```

Consequently

```math
J(x)\ge\frac S2-\frac H{2x}. \tag{10}
```

Write $`R(x)=\pi/2-\mathop{\mathrm{Si}}(2x)`$. The defining expression for $`F`$ becomes

```math
F(x)=xJ(x)-\frac x2\sin^2x-R(x)\sin^2x
-\sin x\cos x\mathop{\mathrm{Cin}}(2x). \tag{11}
```

Elementary integration by parts in the sine and cosine tails yields

```math
|R(x)|\le\frac1x,
\qquad
|\mathop{\mathrm{Ci}}(y)|\le\frac2y\quad(y>0).
```

Using $`\mathop{\mathrm{Cin}}y=\gamma+\log y-\mathop{\mathrm{Ci}}y`$ and $`\gamma<1`$, we obtain

```math
0\le\mathop{\mathrm{Cin}}(2x)\le1+\log(2x)+\frac1x.
```

Combining these estimates with (10)–(11) gives

```math
F(x)\ge c x-\frac H2-\frac{1+\log(2x)}2-\frac3{2x}
=:G(x),
\qquad c=\frac{S-1}{2}=\frac{82172963}{811620810}. \tag{12}
```

For $`x\ge40`$,

```math
G'(x)=c-\frac1{2x}+\frac3{2x^2}>c-\frac1{80}>0.
```

The elementary inequality $`\log80<9/2`$ gives

```math
G(40)>40c-\frac H2-\frac{11}4-\frac3{80}
=\frac{1632462913}{6492966480}>0. \tag{13}
```

The verifier checks every rational comparison in this paragraph. It proves the logarithmic bound by summing sixteen positive terms of the exponential series for $`e^{9/2}`$ and checking that their sum exceeds eighty. Hence (12)–(13) prove positivity for every $`x\ge40`$.

## 4. A derivative bound on the compact interval

We will use the following deliberately coarse bound. If $`1\le a\le x\le b\le40`$, then

```math
|F'(x)|\le14+\frac b2. \tag{14}
```

First, $`0\le J(x)<2`$. In fact, termwise integration of the positive arccoth series gives

```math
J(x)\le\sum_{j=0}^\infty\frac1{(2j+1)^2}\le\frac32<2,
```

where the tail after $`j=0`$ is bounded by the integral of the decreasing function $`1/(2t+1)^2`$ over $`[0,\infty)`$.

The bounds from §3, $`\pi<4`$, $`\log80<9/2`$, and $`\log160<6`$ give throughout $`[1,40]`$

```math
\mathop{\mathrm{Cin}}(2x)\le\frac{13}2,
\quad\mathop{\mathrm{Cin}}(4x)\le\frac{15}2,
\quad|\mathop{\mathrm{Si}}(4x)|\le\frac52,
\quad|R(x)|\le1.
```

Equation (3) therefore implies $`|xJ'(x)|\le7/2`$.
Differentiate the definition of $`F`$; the derivatives of the Si and Cin factors cancel in pairs. The result is

```math
F'(x)=J(x)+xJ'(x)-\frac12\sin^2x
-\frac x2\sin(2x)-R(x)\sin(2x)
-\mathop{\mathrm{Cin}}(2x)\cos(2x).
```

Its absolute value is at most
$`2+7/2+1/2+b/2+1+13/2=27/2+b/2<14+b/2`$, proving (14). The verifier checks $`e^6>160`$ using a positive finite exponential sum.

## 5. Exact certificate covering every point of the compact interval

All numerical quantities in this section are rational enclosures, computed with integers. There are no floating-point evaluations of the kernel, special functions, or transcendental constants.

### Truncation error

Truncate both series in (1) after $`k=160`$. The coefficient bounds in §2, $`\pi<4`$, and $`x\le40`$ show that the absolute remainder is less than

```math
22\frac{80^{322}}{322!}<2^{-128}. \tag{15}
```

For the first inequality, the first omitted term is $`80^{322}/322!`$ and every subsequent absolute-term ratio is less than one half. Multiplication by the combined prefactor $`(\pi+x)/4<11`$ gives twenty-two times that term. The second inequality is an exact integer comparison in the verifier.

### Rational interval evaluation

An interval is represented by an integer pair $`(l,u)`$ and denotes $`[l/2^{384},u/2^{384}]`$. Every arithmetic operation rounds its lower endpoint down and its upper endpoint up by integer division. The partial-series terms are generated recursively from

```math
T_0=1,\qquad
T_k=T_{k-1}\frac{4x^2}{(2k-1)(2k)}.
```

The coefficients in (1) are exact rational numbers. Alternating terms are added or subtracted by interval arithmetic. Pi is enclosed by Machin’s identity

```math
\pi=16\arctan(1/5)-4\arctan(1/239),
```

using respectively 128 and 40 terms of their alternating series, with the first omitted term bounding each remainder. Finally the interval is enlarged at each endpoint by $`2^{-128}`$ as required by (15).

### Coverage and the analytic consumer

Start with the closed interval $`[1,40]`$. For any current closed interval $`[a,b]`$, evaluate the enclosed value of $`F`$ at its rational midpoint $`z=(a+b)/2`$. Let $`L`$ be its rational lower endpoint. Certify the entire interval when

```math
L-\left(14+\frac b2\right)\frac{b-a}2>0. \tag{16}
```

By (14) and the fundamental theorem of calculus, (16) implies $`F(x)>0`$ for every point of $`[a,b]`$. If (16) is not certified, replace the parent by both closed halves and repeat. Each replacement preserves the union, including shared endpoints.

The provided verifier terminates with 184 successful leaf intervals, after 367 evaluations. It independently sorts the leaves and verifies that adjacent endpoints agree and that their total length is exactly 39. The deepest leaf has subdivision depth 11. The smallest certified margin in (16) is the positive rational number

```math
\frac{
365186695209755384433999097693844992174778519256756502804133870791058694966647730001149491548825898709152336070655
}{
39402006196394479212279040100143613805079739270465446667948293404245721771497210611414266254884915640806627990306816
}.
```

The SHA256 of the sorted exact leaf records is
`7bf6b5aa90b010e4f66872bdbb4c4110ada7a0e2f55528f86dcfa86c5a107166`.

These finite exact comparisons establish (16) on a complete cover. They prove the continuous statement on $`[1,40]`$; they are not merely sign tests at selected points.

## 6. Conclusion

Equation (9) treats every $`x\in(0,1]`$, the certificate treats every $`x\in[1,40]`$, and (12)–(13) treat every $`x\in[40,\infty)`$. Thus $`F(x)>0`$ for every positive real $`x`$, and the defining positive factor gives $`m(x)>0`$ there. The expansion at zero already gives $`m(0)=0`$.

This resolves the whole kernel-nonnegativity assertion from §5 of the source. It does not separately claim or count a result about another dimension, the unaveraged kernel, or Neumann boundary conditions.
