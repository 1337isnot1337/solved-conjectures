# A sharp asymptotic for the number of plane line-size sets

For a set of $n$ distinct real plane points, record the set of sizes of its determined lines, counting each size just once. Let $F(n)$ count the possible records. Write

```math
 A=\frac{\pi^2}{12}+\frac{(\log 2)^2}{2}.
```

**Theorem.** As $n\to\infty$,

```math
 F(n)\sim \frac{3}{16\sqrt{6\pi}\,A^{1/4}}\,
            n^{-1/4}\exp(2\sqrt{An}).
```

In particular the base $d=\exp(2\sqrt A)$ equals the exact value conjectured by Václav Kotesovec on November 13, 2026. The prefactor evaluates to $0.0425352216599549197\ldots$, matching his numerical estimate. The original Erdős question asked for an upper bound of the form $\exp(O(\sqrt n))$, which Szemerédi and Trotter had proved. [OEIS A401948](https://oeis.org/A401948) · [OEIS revision history](https://oeis.org/history?seq=A401948) · [Erdős Problem 607](https://www.erdosproblems.com/607)

## 1. An exact generating function

Write the sizes at least three in decreasing order $`d_1>\cdots>d_k\ge3`$. Their point cost is

```math
 w=\sum_{i=1}^k(d_i-i+1)_+,\qquad x_+=\max(x,0).
```

The tuple criterion $w\le n$ is recorded in A401948. Here is also a geometric proof. Choose one line for each size and expose them in this order. The $i$-th line meets the preceding lines in at most $i-1$ points, so at least $w$ points are needed.

For sufficiency let $r$ be the last index with $d_i-i+1>0$. Draw the $k$ carrier lines in generic position. Mark all pair intersections among the first $r$ lines. For each remaining line of size $s$, mark its intersections with the first $s$ carriers. This is possible because $s\le r$. Core carrier $i$ receives $r-1$ marks from the core and at most $r-i+1$ from the remaining lines, since their sizes are distinct and at most $r$. It has room for these marks because $`d_i\ge d_r+r-i\ge2r-i`$. Fill each core carrier to its required size with generic points. Every marked point belongs to a core carrier, and just the $\binom r2$ core-core intersections were counted twice on those carriers. The total is $`\sum_{i\le r}d_i-\binom r2=w`$.

Generic position here precludes an unintended three-point line. To see this for the intersection points, represent three distinct pair intersections by three edges on the carrier indices. Three edges sharing a vertex describe points on that carrier. A triangle gives three noncollinear vertices. In every other case there is a leaf carrier. Moving that carrier moves just its own intersection along its partner, and the line through the other two points cannot coincide generically with that partner unless all three edges share the partner. Thus every undesired collinearity is a proper algebraic condition, and there are only finitely many. Extra points can be placed successively off the finitely many forbidden lines, both when filling the core and when bringing the total up to $n$.

For a noncollinear configuration the Sylvester–Gallai theorem supplies size two. For $n\ge3$ the tuple $`\{n\}`$ forces the collinear configuration, and the empty tuple is realized by points in general position. Thus each feasible tuple gives exactly one record for fixed $n$, including the empty tuple and the small cases $n=1,2$.

Let $G(q)$ count the tuples by their exact cost, including the empty tuple. Put $`y_i=d_i-i+1`$ for $i\le r$. These $r$ positive integers decrease with gaps at least two. Conversely they recover the first $r$ sizes. When $r\ge3$, if $y_r=1$ then $d_r=r$, and the tail is any subset of $`\{3,\ldots,r-1\}`$. If $y_r\ge2$ it is any subset of $`\{3,\ldots,r\}`$. Hence the weight is $2^{r-3}$ for every positive core, plus another $2^{r-3}$ when its smallest part is at least two.

Write $`(q;q)_r=\prod_{j=1}^r(1-q^j)`$. Subtracting the staircase $(2r-1,2r-3,\ldots,1)$ leaves a partition with at most $r$ parts. Raising every staircase entry by one handles the second contribution. The cases $r=1,2$ have no tails and minimum cores $(3)$ and $(4,2)$. Consequently

```math
 G(q)=1+\frac{q^3}{1-q}+\frac{q^6}{(1-q)(1-q^2)}
       +\frac18\sum_{r\ge3}
        \frac{2^r q^{r^2}(1+q^r)}{(q;q)_r},
 \qquad F(n)=[q^n]\frac{G(q)}{1-q}\quad(n\ge1).
```

The first three summands contribute $O(n^2)$ to the cumulative count.

## 2. The dominant core length

For $b=0,1$, let $C_b(n)$ be the coefficient of $q^n$ in

```math
 \frac{1}{1-q}\sum_{r\ge3}\frac{2^r q^{r^2+br}}{(q;q)_r}.
```

Set $q=e^{-t}$, $u=rt$, $f(x)=-\log(1-e^{-x})$, and

```math
 \Phi(u)=u\log2-u^2+\int_0^u f(x)\,dx,\qquad
 W_{r,b}=\frac{2^r e^{-t(r^2+br)}}{\prod_{j=1}^r(1-e^{-tj})}.
```

The unique maximum of $\Phi$ occurs at $u_0=\log 2$, since $`2e^{-2u_0}=1-e^{-u_0}`$, and $h=-\Phi''(u_0)=3$. Its value is $A$. Indeed the integral equals $`\pi^2/6-\mathop{\mathrm{Li}}_2(e^{-u})`$, and $`\mathop{\mathrm{Li}}_2(1/2)=\pi^2/12-(\log 2)^2/2`$. The latter follows by differentiating $`\mathop{\mathrm{Li}}_2(x)+\mathop{\mathrm{Li}}_2(1-x)+\log x\log(1-x)`$ and evaluating its constant at $x=0$.

Uniformly for $u$ in a compact subinterval of $(0,\infty)$,

```math
 W_{r,b}= e^{\Phi(u)/t-bu}
          \sqrt{\frac{t}{2\pi(1-e^{-u})}}\,(1+O(t)). \tag{1}
```

To obtain (1), split $f(x)=-\log x+g(x)$, where $g(x)=\log(x/(1-e^{-x}))$ is smooth at zero with $g(0)=0$. Use Stirling’s formula for the logarithmic sum and the trapezoidal rule with endpoint correction $(g(u)-g(0))/2$ for the smooth sum. For all $r$ the decreasing property of $f$ gives $W_{r,b}\le e^{\Phi(u)/t}$. Since $\Phi''(u)\le-2$, we have $\Phi(u)\le A-(u-u_0)^2$.

## 3. Extraction of the coefficient

Choose $t=\sqrt{A/n}$. For fixed $r,t$ take independent geometric random variables $G_j$ with $`\Pr(G_j=k)=(1-e^{-tj})e^{-tjk}`$ for $k\ge0$, and an extra independent $`G_*`$ distributed as $G_1$. The generating functions give the exact identity

```math
 C_b(n)=\frac{e^{nt}}{1-e^{-t}}\sum_{r\ge3}W_{r,b}\Pr(T=n),
 \qquad T=r^2+br+G_*+\sum_{j=1}^r jG_j .
```

With $u=rt$ in a compact positive interval, the mean and variance satisfy

```math
 \mathbb ET=t^{-2}M(u)+O(t^{-1}),\quad
 \mathop{\mathrm{Var}}T=t^{-3}V(u)+O(t^{-2}),
```

where

```math
 M(u)=u^2+\int_0^u\frac{x}{e^x-1}\,dx,\qquad
 V(u)=\int_0^u\frac{x^2 e^x}{(e^x-1)^2}\,dx .
```

These are Riemann sums of functions smooth at zero. Integration by parts gives $M=\Phi-u\Phi'$, and at the maximum, with $`V_0=V(u_0)`$,

```math
 M(u_0)=A,\qquad M'(u_0)=u_0 h,\qquad V_0=2A-u_0^2h.
```

We give the local probability estimate because its normalization determines the prefactor. Uniformly for bounded $v=(rt-u_0)/\sqrt t$,

```math
 \Pr(T=n)=\frac{t^{3/2}}{\sqrt{2\pi V_0}}
   \left(\exp\!\left[-\frac{M'(u_0)^2v^2}{2V_0}\right]+o(1)\right). \tag{2}
```

Also $\sup_m\Pr(T=m)=O(t^{3/2})$ throughout any fixed compact positive $u$-interval. Here are details. Choose constants $`0\lt a\lt a'<\min u`$ on that interval. For $a/t\le j\le a'/t$, the modulus of the characteristic function of $jG_j$ is

```math
 \left(1+\frac{4e^{-tj}}{(1-e^{-tj})^2}\sin^2(j\theta/2)\right)^{-1/2}.
```

Hence the product is bounded by $\exp(-c\sum_j\sin^2(j\theta/2))$ over this band. For $`|\theta|\le\delta t`$ with small fixed $\delta>0$, the sum is at least $`c'\theta^2/t^3`$ by the linear lower bound on sine near zero. For $`\delta t\le|\theta|\le Kt`$ it is $\gg1/t$ by uniform Riemann summation of $\sin^2(sx/2)$ over $`[a,a']`$ for $`\delta\le|s|\le K`$. For $`Kt\le|\theta|\le\pi`$, the geometric-sum bound $`|\sum_j e^{ij\theta}|\le1/|\sin(\theta/2)|\le\pi/|\theta|`$ gives the same lower bound on taking $K$ sufficiently large.

At $\theta=t^{3/2}\xi$, the characteristic function centered at $\mathbb ET$ tends to $`e^{-V_0\xi^2/2}`$ for bounded $\xi,v$. Indeed the sum of third absolute central moments is $O(t^{-4})$, since each $jG_j$ contributes $`O(j^3/(1-e^{-tj})^3)=O(t^{-3})`$, including the same bound for $`G_*`$. Each summand has variance $O(t^{-2})$, so the quadratic terms in taking the log of the product also have total error $O(t)$ on that scale. Fourier inversion on $`[-\pi,\pi]`$ with the band bounds now gives the stated supremum estimate and Gaussian inversion. In (2) the rescaled displacement is $(n-\mathbb ET)t^{3/2}=-M'(u_0)v+O(\sqrt t)$ for bounded $v$.

For bounded $v$, (1) has Gaussian factor $`e^{-hv^2/2}`$ after removing $e^{A/t}$. The $v$-mesh has spacing $\sqrt t$. Summing (1) times (2) thus adds the Gaussian integral $`\sqrt{2\pi/(h+M'(u_0)^2/V_0)}`$ with mesh factor $1/\sqrt t$. This passage extends to the whole sum: outside a compact neighborhood of $u_0$, the global bound $`e^{(A-(u-u_0)^2)/t}`$ gives exponential savings even with probabilities bounded by one. Inside that neighborhood (1) and the probability supremum bound dominate the normalized sum by a Gaussian Riemann sum, whose tails tend uniformly to zero as the cutoff in $`|v|`$ grows.

Writing $z=e^{-u_0}=1/2$, the resulting coefficient is

```math
 C_b(n)\sim
 \frac{z^b\sqrt{t}\,e^{nt+A/t}}
      {\sqrt{2\pi(1-z)(hV_0+M'(u_0)^2)}}
 =\frac{z^b\sqrt{t}\,e^{2\sqrt{An}}}{\sqrt{6\pi A}},
```

since $`hV_0+M'(u_0)^2=2Ah`$. Taking $`(C_0+C_1)/8`$, adding the polynomial contribution, and substituting $\sqrt t=(A/n)^{1/4}$ proves the theorem.

## Verification and provenance

The accompanying Python script expands the rational summands with exact integer arithmetic and compares the coefficients through 20 with direct enumeration of every subset of $`\{3,\dots,20\}`$. Running it with the published table verified all 10,000 index-value pairs. The proof of the asymptotic is independent of these checks. [Verifier](verify.py) · [Manyama’s table](https://oeis.org/A401948/b401948.txt)

The conjecture and numerical constants are Kotesovec’s, and the tuple criterion is from Manyama’s sequence. The publicly visible revision history records the numerical estimates before the conjectured closed form. Searches on November 18, 2026 by sequence, constants, and geometric formulation located no prior derivation of this sharp asymptotic for line-size sets. Priority remains unconfirmed. This is an unrefereed proof.
