# Integer shifts of the Ruzsa Sidon construction

Let $p$ be prime, $M=p(p-1)$, and $g$ any generator of the multiplicative group of $\mathbb F_p$. For $x\ne0$ let $a(x)$ be the representative in $[0,M)$ satisfying
```math
 a(x)\equiv\log_g x\pmod{p-1},\qquad a(x)\equiv x\pmod p.
```
The set $B$ of these representatives is the classical Ruzsa modular Sidon set. Indeed, a fixed pair sum fixes both the sum and product of the two field elements. See the [Sidon bibliography, Section 4](https://www.combinatorics.org/ojs/index.php/eljc/article/download/DS11/pdf/).

**Theorem.** For each fixed $\delta>0$, uniformly for integers $(-1+\delta)M\le k\le(3-\delta)M$, there are $\gg_\delta p^2$ ordered representations of the **integer** $k$ in $3B-B$, as $p\to\infty$. Every such integer still has a representation after removing $o(p)$ arbitrary elements of $B$.

In particular if $2M\le k\le(3-\delta)M$, the union of the surviving set with its reflection about $k/2$ fails the one-exception condition. The usual two copies fit at $k=3M$ and achieve the Erdős–Freud lower constant. Moving the two complete Ruzsa copies closer by a positive proportion in this range cannot improve it. The theorem concerns this specific family in [Erdős #864](https://www.erdosproblems.com/864).

## Modular solutions and the three free real coordinates

Write $s=k\bmod p$ and $t=g^k\in\mathbb F_p^*$. The equation modulo $M$ is equivalent to
```math
 x+y+z-w=s,\qquad xyz/w=t.
```
For nonzero $x,y$ with $xy\ne t$ and $s-x-y\ne0$ there is precisely one completion,
```math
 z=\frac{t(s-x-y)}{t-xy},\qquad w=xyz/t.
```
These solutions number $p^2+O(p)$. The omitted solutions with $xy=t$ require $x+y=s$, which gives at most two ordered pairs, each with fewer than $p$ choices of $z$. Thus retaining or dropping the exceptions affects any sum of weights of modulus at most one by $O(p)$.

Over all modular solutions the triples $(a(x)/M,a(y)/M,a(z)/M)$ tend to uniform measure on the three-dimensional torus, with normalization $p^{-2}$ and uniformly in the target and generator. Here are the character estimates. For a fixed nonzero integer triple $(i,j,l)$ permute the three positive variables so that $l\ne0$. Put $e_m(u)=\exp(2\pi i u/m)$ and define $\chi(x)=e_{p-1}(\log_g x)$. The Chinese remainder identity $a(x)\equiv p\log_g x-(p-1)x\pmod M$ gives $e_M(a(x))=\chi(x)e_p(-x)$. For a fixed $x$, up to a factor of modulus one the inner sum over $y$ has summands
```math
 \chi(y^j z^l)e_p(-jy-lz).
```
The rational function $z$ of $y$ has a genuine simple pole at $t/x$ unless $x(s-x)=t$. There are at most two exceptional $x$. For large $p$ the additive phase thus has a simple pole and cannot have the form $h^p-h+c$ over the algebraic closure. The rational functions have degrees bounded in terms of the fixed frequencies. The mixed Weil bound gives $O_{i,j,l}(\sqrt p)$ for each ordinary inner sum, including when the multiplicative factor is trivial. Deleting the excluded arguments costs $O(1)$. The remaining rows cost $O(p)$ in total. The nonconstant Fourier coefficient of the normalized measure is consequently $O_{i,j,l}(p^{-1/2})$, independently of $s,t,g$. This proves the stated uniform weak convergence by trigonometric approximation. [Mixed character sum estimate](https://www.math.ksu.edu/~cochrane/research/stepmix.pdf).

## Removing the wraparound

Write $\kappa=k/M$. The ordinary representative of the fourth coordinate is the fractional part of $u+v+w'-\kappa$ when the first three normalized representatives are $u,v,w'$. The integer equation holds as soon as $0<u+v+w'-\kappa<1$. For $\kappa$ in the compact interval $[-1+\delta,3-\delta]$ this open region in $(0,1)^3$ contains a box of positive volume. The same box works in a neighborhood of each chosen $\kappa$. Compactness gives finitely many boxes whose minimum volume is positive. Uniform weak convergence gives at least a fixed positive multiple of $p^2$ solutions for every $k$ in the interval.

Fixing any one of the three positive elements allows $O(p)$ completions by the row count, including a possible degenerate row: even there at most one $y$ has $xy=t$, with at most $p-1$ choices of $z$. Fixing the negative element $w$ and then $x$ fixes the sum and product of $y,z$, giving at most two completions per $x$. Removing $o(p)$ elements therefore destroys $o(p^2)$ solutions.

Finally $a+b+c-d=k$ gives $a+b=(k-c)+d$. For $k\ge2M$ the first pair is in the lower copy and the second is mixed, so they are different; their sum is below $k$. The sum $k$ already has as many representations as there are surviving elements. This yields two distinct repeated sums.
