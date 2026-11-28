# Recurrent binary phases and the large-division bridge obstruction

Date: 21 November 2026. Research continuation for
[issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220).

This note proves weighted summability for the inverse operator retaining
only division exponents 1 and 2, including arbitrarily many recurrent
phases. It also gives an exact obstruction to extending the same uniform
boundary contraction to the full operator. The missing integer-mass estimate
for the full fair-sign chain is not proved. No prize target is completed.

## Operators and boundary

Use the state space
$`\mathcal S=\{n>1:n\text{ odd},\ 3\nmid n\}`$, and write
$`\epsilon(m)\in\{-1,1\}`$ for the sign congruent to $`m`$ modulo 3.
For $`1<s<2`$, let


```math
a_k=\frac12(3/2^k)^s,\qquad
n_k(m)=\frac{2^km-\sigma_k(m)}3,
```


where $`\sigma_k(m)\equiv2^km\pmod3`$ is a sign. The full homogeneous
inverse operator is $`L_s f(m)=\sum_{k:n_k(m)\in\mathcal S}a_kf(n_k(m))`$.
Let $`A_s`$ retain only $`k=1,2`$. This restriction is essential.

Set


```math
B=\{m\in\mathcal S:v_2(m-\epsilon(m))=1\}
=\{m\in\mathcal S:m\equiv5,7\pmod{12}\},
\qquad \nu_s(m)=m^{-s}.
```


Every $`m\in\mathcal S`$ has a unique representation
$`m=\epsilon+3^hc`$, where $`\epsilon=\epsilon(m)`$, $`h\ge1`$,
$`c`$ is a positive even integer, and $`3\nmid c`$.

## Exact binary-phase law

While the current distance valuation from $`\epsilon`$ is at least 2,
both binary inverse branches are allowed. They send


```math
\epsilon+3^dc'
\longmapsto
\epsilon+2\cdot3^{d-1}c'
\quad\text{or}\quad
\epsilon+4\cdot3^{d-1}c'.
```


Each lowers that valuation by one. When it reaches 1, exactly one of the
two branches remains a unit, and that branch changes the residue sign to
$`-\epsilon`$. Starting from $`m=\epsilon+3^hc`$, every complete valid
binary phase therefore has exactly $`h`$ steps and ends at


```math
n=\epsilon+2^Kc,\qquad h\le K\le2h.
\tag{1}
```


The endpoint is in $`B`$: its residue sign is $`-\epsilon`$, and
$`n+\epsilon=2\epsilon+2^Kc`$ has two-adic valuation 1. Every nonempty
proper prefix has unchanged residue sign and distance from that sign
divisible by 4, so it is outside $`B`$. Hence a complete phase is the
first hit of $`B`$, or the first return when its initial state is in $`B`$.

For fixed $`h,K,c`$ giving an allowed endpoint, the number of binary words
is $`\binom h{K-h}`$, and each has weight
$`2^{-h}3^{sh}2^{-sK}`$. Their first $`h-1`$ steps are always allowed;
the endpoint's unit condition gives exactly the required last branch.

Let $`C_s`$ be this first-return kernel on $`B`$. For a fixed endpoint
$`n\in B`$, put


```math
\epsilon=-\epsilon(n),\qquad
H=v_2(n-\epsilon),\qquad K=H-1,\qquad
c=\frac{n-\epsilon}{2^K}.
\tag{2}
```


Here $`H\ge2`$ and $`v_2(c)=1`$. Recurrent initial states lie in $`B`$,
so their coefficient must have valuation exactly 1; this forces the single
value $`K=H-1`$. Their complete list is


```math
m_h=\epsilon+3^hc,
\qquad \lceil K/2\rceil\le h\le K.
```


Consequently


```math
\frac{(\nu_sC_s)(n)}{\nu_s(n)}
=\sum_{h=\lceil K/2\rceil}^{K}
2^{-h}\binom h{K-h}
\left[\frac{n(m_h-\epsilon)}{m_h(n-\epsilon)}\right]^s.
\tag{3}
```


This keeps the exact affine correction.

## Uniform contraction of recurrent binary phases

The bracket in (3) is at most $`15/14`$. For $`\epsilon=1`$, the
endpoint is 5 modulo 12. If it equals 5, (2) forces $`K=1,c=2,m=7`$,
and the bracket equals $`15/14`$. Otherwise $`n\ge17`$, and the bracket
is at most $`n/(n-1)\le17/16<15/14`$.

For $`\epsilon=-1`$, the recurrent initial state is 5 modulo 12. If it
equals 5, then $`h=1,c=2`$, the only allowed endpoint is 7, and the
bracket is $`21/20`$. Otherwise $`m\ge17`$, and the bracket is at most
$`(m+1)/m\le18/17<15/14`$. These two explicitly derived endpoint cases
are part of a uniform argument, not a finite-range experiment.

Define the renewal sums


```math
u_K=\sum_h2^{-h}\binom h{K-h},\qquad
v_K=\sum_hh\,2^{-h}\binom h{K-h}.
```


They obey


```math
u_K=\frac12u_{K-1}+\frac12u_{K-2}
=\frac23+\frac13(-1/2)^K,
\qquad u_K\le\frac34\quad(K\ge1),
\tag{4}
```


with $`u_0=1,u_1=1/2`$. Also $`v_0=0,v_1=1/2,v_2=1`$, and
$`v_K=(v_{K-1}+u_{K-1}+v_{K-2}+u_{K-2})/2`$. Induction using
$`u_K\le3/4`$ gives $`v_K\le K/2`$.

Equation (3) proves


```math
\nu_sC_s\le\frac34(15/14)^s\nu_s
\le\frac{675}{784}\nu_s.
\tag{5}
```


To include the initial entrance and phase holding time, a logarithmic factor
is convenient. Set
$`\mu_s(n)=\nu_s(n)(10+\log n)`$ on $`B`$. Since $`c\ge2`$,


```math
\log m_h\le\log c+h\log3+\log(7/6),
\qquad
\log n\ge\log c+K\log2-\log(4/3).
```


Let $`D=10+\log n`$. Applying (4) to the logarithmic factor in (3)
gives an upper bound


```math
(15/14)^s\left[
\frac{\log3}{2\log2}D+
\frac{\log3}{2\log2}\log(4/3)+\frac34\log(7/6)
\right].
```


Use $`\log3/(2\log2)<4/5`$, which follows from $`3^5<2^8`$,
and $`\log(4/3)<1/3`$, $`\log(7/6)<1/6`$, $`D\ge10`$. Then


```math
\mu_s C_s\le\rho\mu_s,
\qquad
\rho=\frac{225}{196}\left(\frac45+\frac{47}{1200}\right)
=\frac{3021}{3136}<1.
\tag{6}
```


## Holding time and initial entrance: the restricted Green sum is finite

Let $`\kappa_s=a_1+a_2>1`$ and $`\beta_s=\log_3\kappa_s`$.
The total weight of prefixes before a complete phase at $`m`$ is


```math
g_s(m)=\sum_{t=0}^{h(m)-1}\kappa_s^t
\le\frac{(m+1)^{\beta_s}}{\kappa_s-1}.
\tag{7}
```


Choose $`s`$ with $`\beta_s<s-1`$; for example $`s=3/2`$ works since
$`\kappa_{3/2}/\sqrt3=3/(4\sqrt2)+3/16<81/112<1`$, using
$`1/\sqrt2<5/7`$. Thus both $`\nu_s(g_s)`$ and
$`\mu_s(g_s)`$ are finite over their respective state spaces.

For an initial state outside $`B`$, the complete phase still first hits
$`B`$. Let $`E_s`$ be this complete-phase kernel from all of $`\mathcal S`$
to $`B`$, also agreeing with $`C_s`$ on $`B`$, and let
$`\alpha_s=\nu_sE_s`$. In the incoming enumeration (2), the initial
coefficient need only be even, so $`K`$ ranges from 1 to $`H-1`$.
The same calculation gives


```math
\frac{\alpha_s(n)}{\nu_s(n)}
\le(5/4)^s\sum_{K=1}^{H-1}u_K
\le\frac34(5/4)^s(H-1).
\tag{8}
```


The looser affine bound $`5/4`$ is valid without a recurrent-start
restriction: for $`\epsilon=1`$ it follows from $`n\ge5`$, and for
$`\epsilon=-1`$ from $`m\ge5`$. Also
$`H\le\log_2(n+1)`$, so (8) bounds $`\alpha_s`$ by a constant multiple
of $`\mu_s`$.

Every finite binary path has a unique decomposition into complete phases
and a final proper prefix. All weights are nonnegative, so this decomposition
and Tonelli's theorem imply


```math
\begin{aligned}
\sum_{m\in\mathcal S}m^{-s}\sum_{t\ge0}A_s^t1(m)
&=\nu_s(g_s)+\alpha_s\sum_{j\ge0}C_s^j(g_s|_B)
\\ &\le\nu_s(g_s)+C\frac{\mu_s(g_s)}{1-\rho}<\infty.
\end{aligned}
\tag{9}
```


Thus repeated binary phases themselves do not obstruct the required
integer sum in this parameter range. This theorem concerns $`A_s`$,
which omits every inverse branch with $`k\ge3`$. It is not a theorem
about the full $`L_s`$ potential.

## The exact full first-return decomposition

Let $`I=\mathcal S\setminus B`$. For the full operator, the first-return
kernel on $`B`$, as a nonnegative extended-valued kernel, is


```math
R_s=L_{BB}+L_{BI}\left(\sum_{j\ge0}L_{II}^j\right)L_{IB}.
\tag{10}
```


Replacing every block by its binary restriction yields $`C_s`$. The
difference includes large-division jumps and their entrance, intermediate,
and exit weights. It cannot be bounded merely by the sum of the raw
coefficients $`a_k`$ for $`k\ge3`$.

For an exact description of the weight change, use the original fair-sign
chain and the stopped product
$`Z_t=\prod_{j<\min(t,\tau_1)}(1+\sigma_j/(3N_j))`$.
Let $`\tau_B^+`$ be its first strictly positive return to $`B`$. Reversing
each finite first-return path and using the previously proved conjugacy
gives


```math
\frac{(\nu_sR_s)(n)}{\nu_s(n)}
=\mathbb E_n[Z_{\tau_B^+}^{-s};\ \tau_B^+<\tau_1].
\tag{11}
```


For the logarithmic measure $`\mu_s`$, insert the additional ratio
$`(10+\log N_{\tau_B^+})/(10+\log n)`$ inside that expectation.
These are identities of nonnegative sums; no recurrence assumption is used.

## A bridge family defeats the proposed common strict contraction

For every integer $`t\ge0`$, let


```math
n=19+96t\in B.
```


Both original branches return to $`B`$ in one step, and neither absorbs:


```math
T_-(n)=7+36t\quad(k=3),\qquad
T_+(n)=29+144t\quad(k=1).
\tag{12}
```


Thus (11) becomes exactly


```math
\frac{(\nu_sR_s)(n)}{\nu_s(n)}
=\frac12\left[
\left(\frac{3n}{3n-1}\right)^s+
\left(\frac{3n}{3n+1}\right)^s\right]>1,
\tag{13}
```


by strict convexity. In particular $`\nu_s`$ is not even an excessive
measure for this full return operator.

The large-division edge alone contributes
$`\tfrac12(3n/(3n-1))^s\to1/2`$ to this incoming density. Its raw
inverse coefficient is only $`a_3=\tfrac12(3/8)^s`$; the ratio of the
spatial weights cancels that apparent smallness. At $`s\to2`$, even the
whole raw tail $`\sum_{k\ge3}a_k\to3/32`$ is therefore not a valid
upper bound for its contribution to the boundary-measure norm.

For $`\mu_s(n)=n^{-s}(10+\log n)`$, both logarithmic ratios in (11)
tend to 1 along (12), so


```math
\frac{(\mu_sR_s)(19+96t)}{\mu_s(19+96t)}\longrightarrow1.
\tag{14}
```


No uniform bound $`\mu_sR_s\le r\mu_s`$ with $`r<1`$ is possible,
even outside any fixed finite set. Equation (14) does not rule out a
nonuniform excessive correction or another global argument.

## What logarithmic corrections do on this family

The same lack of a uniform strict gap holds for every multiplier
$`W(n)=\log n+o(\log n)`$: both ratios $`W(T_\pm(n))/W(n)`$ tend to
1 along (12), so the full return density again tends to 1. This does not
determine its sign relative to 1.

For the regular correction $`W(n)=C+\log n+a\log\log n`$, with fixed
real C,a, the unnormalized return drift is more informative:


```math
\frac12\sum_{\sigma=\pm1}
\left(\frac{3n}{3n+\sigma}\right)^sW(T_\sigma(n))-W(n)
=\log(3/4)+o(1)<0
```


along (12). Indeed $`T_-(n)/n\to3/8`$, $`T_+(n)/n\to3/2`$, the
log-log increments tend to zero, and each affine weight is
$`1+O_s(1/n)`$. Thus a logarithmic multiplier already approaches the
nonuniform excessive inequality from the favorable side on this family.
This calculation gives no inequality for other boundary states or for
arbitrary long phases. The coordinator independently checked this asymptotic calculation from the displayed limits.

## Stopping point

The bounded attempt controls arbitrarily repeated binary phases through
(9), but the full first-return operator has the exact bridge obstruction
(12)–(14). Adding the raw large-division tail to the binary contraction
constant is invalid. No substitute boundary weight or global estimate
controlling all large-division bridges has been found.

The required full integer-mass decay remains unproved. No finite trajectory
search was used, no source or checkpoint was relabelled as a full solution,
and the paid-target completion count remains zero. The binary result and
bridge calculations passed independent review in
[the recurrent-phase review](RECURRENT_REVIEW.md).
The later logarithmic asymptotic clarification remains a narrowly scoped
calculation. No novelty claim is made from the lack of an earlier matching
note. This Althöfer route is stopped at the missing full integer-mass estimate.
