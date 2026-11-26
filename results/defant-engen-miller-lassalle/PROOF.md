# Defant–Engen–Miller's Lassalle refinement conjecture

**Result.** For every $k\ge0$, let $A_{k+1}(\ell)$ count the uniquely sorted permutations of length $2k+1$ whose first value is $\ell$. The row $A_{k+1}(1),\ldots,A_{k+1}(2k+1)$ is log-concave. Its inequalities at every internal index are strict for $k\ge1$.

This is [Defant–Engen–Miller, Conjecture 7.1](https://arxiv.org/pdf/1809.01340#page=18), in their 2020 JCTA paper *Stack-Sorting, Set Partitions, and Lassalle's Sequence*. [Singhal, Theorem 1.1 and Conjecture 4.1](https://arxiv.org/pdf/2008.08222) proves unimodality and verifies log-concavity for $k\le53$. The argument below proves all orders using the exact arithmetic certificate [interval_check.py](interval_check.py). The interval step uniformly handles an infinite range of $k$; it does not test successive orders. Searches by author, exact conjecture name, and the generating function found no prior proof of the stated log-concavity. That is not a priority certification.

## 1. Rooted matchings and the Catalan quotient

Write $n=2k$, $a=\ell-1$, $b=n-a$. By the crossing-graph interpretation of Defant–Engen–Miller (see also Singhal, Proposition 2.1), $A_{k+1}(\ell)$ counts matchings of $2k+2$ cyclically ordered points together with an acyclic orientation of the crossing graph having a prescribed unique source, the distinguished chord $`\{0,\ell\}`$. The remaining points split between the two arcs of sizes $a,b$. Write $L(a,b)$ for this count, and set it to zero for odd $a+b$.

Let $C_m$ be the $`m`$th Catalan number. Set
```math
 F(z)=\sum_{m\ge0}(-1)^m C_m\frac{z^{2m}}{(2m)!}
     =\sum_{m\ge0}\frac{(-1)^m z^{2m}}{m!(m+1)!},
 \qquad f(w)=F(\sqrt w).
```
The bivariate exponential generating function is
```math
 \sum_{a,b\ge0} L(a,b)\frac{x^a y^b}{a!b!}
 =\frac{F(x)F(y)}{F(x+y)}.                                      \tag{1}
```

For a direct proof, let $U_{a+b}$ count all acyclic orientations of crossing graphs of matchings of the $a+b$ ordinary points, without a distinguished chord or unique-source constraint. Put $U_0=1$, and set odd counts to zero. In the product of $F(x+y)$ and the EGF of these counts, label subsets are chosen by the EGF binomial factors. A signed Catalan factor counts a noncrossing matching on the selected subset with sign $`(-1)^{\#\text{chords}}`$. Attach its chords to the acyclic orientation of the complement, with all crossing edges between selected and unselected chords directed out of the selected side. This counts a matching with an acyclic orientation and an arbitrary marked subset of its sources, with the same sign. Conversely, any subset of sources is noncrossing, and deleting it recovers the orientation of the complement. The sum over marked subsets is zero unless the matching is empty. Thus the unrestricted EGF is $1/F(x+y)$.

Repeating this cancellation with $F(x)F(y)$ instead of $F(x+y)$ only permits marking sources whose endpoints both lie in the same arc. Those are precisely the sources not crossing the distinguished chord. Chords in different arcs cannot cross each other, so the two separate Catalan factors count all permitted selections. The sign sum retains exactly the ordinary orientations in which every source crosses the distinguished chord. Add that chord and direct all its edges outward. This gives the desired unique-source orientation, and deleting it reverses the operation. This proves (1). Every Catalan count uses the inherited cyclic order on the selected vertices and thus depends only on their number.

## 2. Principal Bessel pole

Write $h_m=[w^m]1/f(w)$. By the classical [Bessel product, DLMF 10.21.15](https://dlmf.nist.gov/10.21.E15),
```math
 f(w)=\frac{J_1(2\sqrt w)}{\sqrt w}
     =\prod_{s\ge1}(1-w/R_s),\qquad R_s=j_{1,s}^2/4.
```
The positive zeros $R_s$ are strictly increasing. The linear and quadratic coefficients give $\sum_s R_s^{-1}=1/2$ and $\sum_s R_s^{-2}=1/12$. Put $R=R_1$, and let
```math
 R_-=367049266052/10^{11},\qquad R_+=367049266055/10^{11}.
```
The odd order-21 alternating sum at $R_-$ is positive, and the even order-20 sum at $R_+$ is negative, as checked exactly by the certificate. The terms decrease from order 1 onward, so the two sums give the correct lower and upper bounds. Since $R_+/2<2$, the first power sum rules out two zeros at or below $R_+$. The zero between the endpoints is therefore $R$.

Set $\alpha_s=R/R_s$ for $s\ge2$, and put
```math
 G(z)=\prod_{s\ge2}(1-\alpha_s z)^{-1}=\sum_{j\ge0}g_j z^j,
 \qquad M=G(1).
```
The $g_j$ are nonnegative. The two power sums give $\sum_{s\ge2}\alpha_s<0.84$ and $\max_{s\ge2}\alpha_s<0.36$, since $\sum_{s\ge2}\alpha_s^2=R^2/12-1<0.36^2$. The products converge at $z=1,2$, and
```math
 \frac{G(2)}{M}
 =\prod_{s\ge2}\left(1+\frac{\alpha_s}{1-2\alpha_s}\right)
 \le \exp\left(\frac{0.84}{1-0.72}\right)<32.
```
Factoring the smallest pole out of $1/f(Rz)$, and bounding the positive tail by $2^{-m}G(2)$, give
```math
 \theta_m:=\frac{h_mR^m}{M}
 =\frac{\sum_{j=0}^m g_j}{M},\qquad
 0\le 1-\theta_m\le 32\,2^{-m}.                                \tag{2}
```

## 3. Bernstein coefficients and log-concavity

For $n=2k$, scale the row by a common positive scalar to get $q_a=L(a,n-a)R^k/(M n!)$. Define
```math
 P_n(t)=\sum_{\substack{i,j\ge0\\i+j\le k}}
   \frac{(-R)^{i+j}\theta_{k-i-j}}{i!(i+1)!\,j!(j+1)!}
               t^{2i}(1-t)^{2j}.                              \tag{3}
```
Then $q_a$ is the degree-$`n`$ Bernstein coefficient of $P_n$ at $a$. Indeed, the normalized Bernstein coefficient of $t^u(1-t)^v$ at $a$ in degree $`n`$ is $`(a)_u(n-a)_v/(n)_{u+v}`$, with falling factorials. This follows by multiplying by $(t+(1-t))^{n-u-v}$. The same terms arise from (1) after extracting $x^a y^{n-a}$.

Let $D_L=n(q_a-q_{a-1})$, $D_R=n(q_{a+1}-q_a)$, and $E=n(n-1)(q_{a-1}-2q_a+q_{a+1})$. For $1\le a<n$, these are respectively degree-$`n-1`$ Bernstein coefficients of $P_n'$ at $a-1,a$ and the degree-$`n-2`$ coefficient of $P_n''$ at $a-1$, by differentiating the Bernstein basis. Expansion gives
```math
 n^2(q_a^2-q_{a-1}q_{a+1})=D_LD_R-\frac{q_aE}{1-1/n}.           \tag{4}
```

For $n\ge108$, truncate (3) to $i+j\le14$ and replace every $\theta$ by 1 to get $\widehat P$. Every relevant coefficient of derivative order $d=0,1,2$ changes by less than $10^{-6}$. In fact, the Bernstein coefficients of any $t^u(1-t)^v$ with $u+v\le n-d$ lie in $[0,1]$: they are probabilities of specified colors in draws without replacement. The sum of scalar absolute values from differentiating $t^{2i}(1-t)^{2j}$ is at most $\max(1,(2i+2j)^2)$ for each $d=0,1,2$. Define
```math
 B_i=\frac{R_+^i}{i!(i+1)!},\qquad W_m=\max(1,4m^2)\sum_{i+j=m}B_iB_j .
```
For $m\ge15$,
```math
 \frac{W_{m+1}}{W_m}\le
 \left(\frac{m+1}{m}\right)^2\frac{2R_+}{8\cdot9}<\frac18 .
```
For the first inequality, decrement a maximal index in each ordered pair of total $m+1$, using a deterministic tie rule. The index was at least 8, so use $B_i/B_{i-1}=R_+/[i(i+1)]$, and each pair of total $`m`$ has at most two preimages. Thus the omitted terms are at most $(8/7)W_{15}$. On retained terms (2) gives $`|1-\theta_{k-i-j}|\le32\,2^{-40}`$. The rational bound checked in the certificate is
```math
 \frac87 W_{15}+\frac{32}{2^{40}}\sum_{m=0}^{14}W_m<10^{-6}.      \tag{5}
```

## 4. Uniform exact interval verification

Write $t=a/n$ and $z=1/n$, and restrict to $t\le1/2$ by symmetry. In degree $n-d$ at index $a-b$, the Bernstein coefficient of the monomial $t^u(1-t)^v$ is
```math
 T_{d,b}(u,v;t,z)=
 \frac{\prod_{r=0}^{u-1}(t-(b+r)z)
       \prod_{r=0}^{v-1}(1-t-(d-b+r)z)}
      {\prod_{r=0}^{u+v-1}(1-(d+r)z)}.                          \tag{6}
```
The pairs $(d,b)$ for $q_a,D_L,D_R,E$ are $(0,0),(1,1),(1,0),(2,1)$, respectively. When evaluating (6) on a real interval box, clip each numerator factor below by zero. This leaves (6) unchanged at admissible integer indices because both $a-b$ and $n-a-d+b$ are nonnegative integers. If a falling factorial encounters any negative factor, it already has a zero factor. This clipping is only an interval convenience.

The certificate brackets $R$ by $[R_-,R_+]$, computes intervals for (6) and the derivatives of $\widehat P$, and inflates the four intervals by $10^{-6}$ using (5). It uses integer fixed-point endpoints with denominator $2^{50}$ and directed rounding, without floating point. Every accepted box has a strictly positive lower bound for $(1-z)D_LD_R-q_a E$. Bisection covers the rectangle $[0,1/2]\times[0,1/108]$ (the upper endpoint for $z$ is rounded outward), so verifies every $n\ge108$ simultaneously. There are 205 accepted boxes of maximum depth 9; the certificate checks their intervals directly, without assuming these counts.

Finally for $1\le k\le53$, the code computes the integer coefficients of (1) by inverse-series convolution
```math
 U_{2k}=-\sum_{i=1}^k\binom{2k}{2i}(-1)^i C_i U_{2k-2i}
```
and checks the strict inequalities in integer arithmetic. The case $k=0$ is vacuous. These ranges exhaust the conjecture.
