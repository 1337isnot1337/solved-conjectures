# Independent review: recurrent binary phases and the large-division bridge

Date: 21 November 2026.

Reviewed note: [recurrent binary phases](recurrent-binary-phases.md).

The restricted summability theorem and the full-operator bridge obstruction pass this independent review. I checked the phase equations, incoming enumeration, constants, path decomposition, and reversed-path identity directly. No trajectory search or numerical approximation was used.

This review does not establish the missing estimate for the full fair-sign chain or complete Althöfer's prize problem.

## 1. State and branch definitions

The original branches are


```math
T_\sigma(n)=\frac{3n+\sigma}{2^{v_2(3n+\sigma)}},
\qquad \sigma\in\{-1,1\},
```


with fair sign choices and absorption at one. On


```math
\mathcal S=\{n>1:n\text{ odd},\ 3\nmid n\},
```


let $`\epsilon(n)`$ be the sign congruent to $`n`$ modulo three. The inverse branch from $`m`$ at exponent $`k`$ is


```math
n_k(m)=\frac{2^km-\sigma_k(m)}3,
\qquad
\sigma_k(m)\equiv2^km\pmod3.
```


The homogeneous inverse weight is $`a_k=\frac12(3/2^k)^s`$. The operator $`A_s`$ retains only $`k=1,2`$. All conclusions about its Green sum are explicitly restricted to this operator.

Every state has a unique expression


```math
m=\epsilon+3^hc,\qquad
h=v_3(m-\epsilon)\geq1,\quad
c>0\text{ even},\quad3\nmid c.
```


## 2. The complete phase and its first-return property

For $`k=1`$, $`\sigma_k=-\epsilon`$, while for $`k=2`$, $`\sigma_k=\epsilon`$. Thus the two inverse formulas are


```math
\epsilon+3^dc'
\longmapsto
\epsilon+2\cdot3^{d-1}c',
\qquad
\epsilon+4\cdot3^{d-1}c'.
```


When $`d\geq2`$, both are allowed, keep residue sign $`\epsilon`$, and reduce $`d`$ by one. At $`d=1`$, exactly one result is a unit modulo three; the allowed result has residue sign $`-\epsilon`$.

A complete phase therefore has precisely $`h`$ steps and endpoint


```math
n=\epsilon+2^Kc,\qquad h\leq K\leq2h.
```


For an allowed endpoint, every word with $`h`$ letters from $`\{1,2\}`$ and total $`K`$ is valid. All proper initial steps are valid automatically, and the last step's validity depends only on the endpoint. This gives exactly $`\binom h{K-h}`$ words, each of weight $`2^{-h}3^{sh}2^{-sK}`$.

The boundary set is


```math
B=\{m:v_2(m-\epsilon(m))=1\}
=\{m\in\mathcal S:m\equiv5,7\pmod{12}\}.
```


At a nonempty proper prefix, the distance from the unchanged sign is divisible by four, so that state is outside $`B`$. At the endpoint,


```math
n-\epsilon(n)=n+\epsilon
=2\epsilon+2^Kc
```


has two-adic valuation one. This proves the asserted first entrance or first return, rather than merely an eventual visit.

## 3. Exact incoming enumeration

Fix $`n\in B`$, put $`\epsilon=-\epsilon(n)`$, and let $`H=v_2(n-\epsilon)`$. Then $`H\geq2`$.

For a recurrent start in $`B`$, its coefficient $`c`$ must satisfy $`v_2(c)=1`$. Therefore $`K=H-1`$ is forced and $`c=(n-\epsilon)/2^K`$. The incoming starts are exactly


```math
m_h=\epsilon+3^hc,
\qquad \lceil K/2\rceil\leq h\leq K.
```


For $`\nu_s(m)=m^{-s}`$, dividing the incoming weight by $`\nu_s(n)`$ gives the exact factor


```math
2^{-h}\binom h{K-h}
\left(\frac{n(m_h-\epsilon)}
{m_h(n-\epsilon)}\right)^s.
```


This verifies the note's equation (3), including the affine correction.

The uniform bracket bound $`15/14`$ is valid. If $`\epsilon=1`$, the endpoint is $`5`$ modulo twelve. At $`n=5`$, the forced start is $`m=7`$, giving $`15/14`$; otherwise $`n\geq17`$, giving at most $`17/16`$. If $`\epsilon=-1`$, the start is $`5`$ modulo twelve. At $`m=5`$, the only allowed endpoint is $`7`$, giving $`21/20`$; otherwise the bracket is at most $`18/17`$. All these latter bounds are smaller than $`15/14`$.

## 4. Renewal sums and both contraction constants

The renewal sums are


```math
u_K=\sum_h2^{-h}\binom h{K-h},
\qquad
v_K=\sum_hh\,2^{-h}\binom h{K-h}.
```


The recurrence and solution


```math
u_K=\frac12u_{K-1}+\frac12u_{K-2}
=\frac23+\frac13(-1/2)^K
```


give $`u_K\leq3/4`$ for $`K\geq1`$.

For the second sum, $`v_0=0`$, $`v_1=1/2`$, and $`v_2=1`$. The displayed recurrence then gives $`v_K\leq K/2`$ inductively for $`K\geq3`$. These bases matter because $`u_0=1`$ is outside the $`3/4`$ bound. The author has now made them explicit.

It follows that


```math
\nu_sC_s\leq
\frac34(15/14)^s\nu_s
\leq\frac{675}{784}\nu_s
\qquad(1<s<2).
```


For $`\mu_s(n)=n^{-s}(10+\log n)`$, put $`D=10+\log n`$ and


```math
a=\frac{\log3}{2\log2}.
```


The proof's logarithmic estimates give


```math
\begin{split}
\sum_h2^{-h}\binom h{K-h}(10+\log m_h)
&\leq\frac34(10+\log c+\log(7/6))
  +\frac K2\log3\\
&\leq aD+a\log(4/3)+\frac34\log(7/6).
\end{split}
```


The second inequality uses $`a>3/4`$, which follows from $`9>8`$, and
$`D+\log(4/3)\geq10+\log c+K\log2`$.

Now $`a<4/5`$ follows from $`3^5<2^8`$; also
$`\log(4/3)<1/3`$, $`\log(7/6)<1/6`$, and $`D\geq10`$. Hence


```math
\mu_sC_s\leq
\frac{225}{196}
\left(\frac45+\frac{47}{1200}\right)\mu_s
=\frac{3021}{3136}\mu_s.
```


The direction of the weighted-measure inequality and the constant are correct.

## 5. Holding times, entrance, and the Green sum

Before phase completion, both binary branches are valid. Thus the total weight of proper prefixes from $`m`$ is exactly


```math
g_s(m)=\sum_{t=0}^{h(m)-1}\kappa_s^t,
\qquad
\kappa_s=a_1+a_2>1.
```


With $`\beta_s=\log_3\kappa_s`$,


```math
g_s(m)\leq\frac{(m+1)^{\beta_s}}{\kappa_s-1}.
```


Therefore both the ordinary and logarithmically weighted sums of $`g_s`$ converge if $`\beta_s<s-1`$.

At $`s=3/2`$,


```math
\frac{\kappa_{3/2}}{\sqrt3}
=\frac{3}{4\sqrt2}+\frac3{16}
<\frac{81}{112}<1.
```


The strict inequality follows from $`1/\sqrt2<5/7`$, itself equivalent to $`49<50`$. Hence this parameter satisfies the required condition.

For unrestricted initial states, the incoming value $`K`$ ranges over $`1,\ldots,H-1`$. The same enumeration, now with the valid affine bound $`5/4`$, gives


```math
\frac{\alpha_s(n)}{\nu_s(n)}
\leq \frac34(5/4)^s(H-1).
```


Since $`H\leq\log_2(n+1)`$, this implies $`\alpha_s\leq C\mu_s`$ for a finite constant.

Every finite binary path decomposes uniquely into complete phases and a final proper prefix. This remains true for starts outside $`B`$. Nonnegative weights permit Tonelli without a prior summability assumption. Thus the note's identity


```math
\sum_{m\in\mathcal S}m^{-s}\sum_{t\geq0}A_s^t1(m)
=
\nu_s(g_s)+
\alpha_s\sum_{j\geq0}C_s^j(g_s|_B)
```


is valid. Entrance domination and the $`\mu_s`$ contraction bound the second term by a convergent geometric series. This proves the restricted summability result.

## 6. Full return kernel and the exact bridge obstruction

The block expression


```math
R_s=L_{BB}
+L_{BI}\left(\sum_{j\geq0}L_{II}^j\right)L_{IB},
\qquad I=\mathcal S\setminus B,
```


is the full first-return kernel as a nonnegative extended-valued sum.

The reversed-path identity can be checked one edge at a time. If
$`m=T_\sigma(n)=(3n+\sigma)/2^k`$, then


```math
\frac{\nu_s(m)a_k}{\nu_s(n)}
=
\frac12\left(1+\frac{\sigma}{3n}\right)^{-s}.
```


Multiplying along a finite reversed first-return path gives its fair-sign path probability times $`Z^{-s}`$. Reversal preserves the property that all intermediate states are outside $`B`$. Excluding absorption at one gives exactly the event in equation (11). No recurrence assumption is needed. For $`\mu_s`$, the additional terminal-to-initial logarithmic ratio is also in the stated direction.

For $`n=19+96t`$, $`t\geq0`$,


```math
3n-1=8(7+36t),\qquad
3n+1=2(29+144t).
```


The factors in parentheses are odd, so the division exponents are exactly three and one. Both outputs lie in $`B`$ and exceed one. Consequently every fair-sign path returns to $`B`$ after one step, and


```math
\frac{(\nu_sR_s)(n)}{\nu_s(n)}
=
\frac12\left[
\left(1-\frac1{3n}\right)^{-s}
+
\left(1+\frac1{3n}\right)^{-s}
\right]>1
```


by strict convexity.

The large-division edge's incoming contribution tends to $`1/2`$, despite its much smaller raw inverse coefficient. The raw tail tends to $`3/32`$ as $`s\to2`$, so it cannot control this boundary-measure contribution.

For $`\mu_s`$, each logarithmic ratio tends to one because the two output/input ratios tend to the fixed positive constants $`3/8`$ and $`3/2`$. Therefore


```math
\frac{(\mu_sR_s)(19+96t)}{\mu_s(19+96t)}\to1.
```


This rules out any uniform contraction factor below one, including outside an arbitrary fixed finite set. It does not rule out a different nonuniform weight or another global argument.

## Review conclusion

The binary inverse-operator theorem is proved in its stated parameter range. The full first-return decomposition and bridge obstruction are also correct. The bridge prevents adding the raw large-division tail to the binary contraction as if it were an operator-norm bound.

No proof of full inverse-potential summability, full integer-mass decay, or the paid conjecture follows. The completed paid-target count remains zero.

