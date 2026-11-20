# Erdős–Granville–Pomerance–Spiro conjecture

This note extends the [divisor-sum collision argument](PROOF.md)
to inputs whose two largest primes leave a small cofactor.
The full conjecture remains open. Work is tracked in
[issue #47](https://github.com/1337isnot1337/solved-conjectures/issues/47).

## Counting a bilinear congruence in a box

For positive integers $A,B,M$ with $\gcd(A,B)=1$, and any integer
$K$, write

```math
 F(u,w)=Auw+B(u+w+1),\qquad D=AK+B(B-A).
```

Let $\nu(M)$ be the number of residue pairs satisfying
$F(u,w)\equiv K\pmod M$. Take two intervals containing $P$ and $Q$
consecutive integers, respectively. For any $k$ coprime to $M$,
restrict $u,w$ to one residue class each modulo $k$.
Let $N_1,N_2$ be the resulting numbers of choices in the two
intervals. The number of pairs in the restricted box with
$F(u,w)\equiv K\pmod M$ is

```math
 \frac{\nu(M)N_1N_2}{M^2}+
 O_\epsilon\left(M^\epsilon
       \left[\sqrt{M\gcd(A,M)\gcd(D,M)}
              +\gcd(D,M)\frac{P+Q}{M}\right]\right).
```

This follows from completion and the Weil bound for Kloosterman
sums, as used for modular hyperbolas by
[Shparlinski, §3.1](https://arxiv.org/abs/1103.2879).
The factors involving gcds handle nonunit coefficients and
nonunit right-hand sides.

Write $e_m(t)=\exp(2\pi i t/m)$ and define

```math
 S_M(h,j)=\sum_{\substack{u,w\bmod M\\F(u,w)\equiv K\ (\mathrm{mod}\ M)}}
              e_M(hu+jw).
```

We first bound these sums for prime power moduli. The Chinese
remainder theorem multiplies the bounds, with unit rescalings
of the two frequencies that preserve the gcds.

For the elementary product congruence $xy\equiv D\pmod L$ put
$T_L(H,J)=\sum_{xy\equiv D\ (\mathrm{mod}\ L)}e_L(Hx+Jy)$.
Partition this sum by $g=\gcd(x,L)$. Then $g\mid G$, where
$G=\gcd(D,L)$, and $x=gz$ with $z$ a unit modulo $L/g$.
The congruence fixes $y$ modulo $L/g$ and summing over its
$g$ lifts gives zero unless $g\mid J$. If $g\mid J$, this
part of the sum is $g$ times the Kloosterman sum modulo
$L/g$ with frequencies $H,(J/g)(D/g)$. Because
$\gcd(D/g,L/g)=G/g$, we have

```math
 \gcd\big(H,(J/g)(D/g),L/g\big)
       \le (G/g)\gcd(H,J,L).
```

The Weil bound applied separately to these parts gives
$|T_L(H,J)|\ll_\epsilon L^{1/2+\epsilon}
\sqrt{G\gcd(H,J,L)}$. For $J=0$, the Kloosterman sums
become Ramanujan sums, each of absolute value at most
$\gcd(H,L/g)$. This gives
$|T_L(H,0)|\ll_\epsilon L^\epsilon G\gcd(H,L)$.

Now take a prime power $m=\pi^e\parallel M$. If $\pi\nmid A$,
the affine change $x=Au+B$, $y=Aw+B$ transforms $S_m(h,j)$
into a product-congruence sum modulo $m$ with unit frequency
rescalings. If $a=v_\pi(A)>0$, then $D$ is a unit at $\pi$
because $D\equiv B^2\pmod\pi$. For $a\ge e$, a trivial bound
$|S_m(h,j)|\le m$ suffices, since each $u$ gives a unique $w$.
For $0<a<e$, use the same change of variables modulo
$L=\pi^{a+e}$. The variables $x,y$ range over $B\pmod{\pi^a}$,
and the condition becomes $xy\equiv D\pmod L$.
The additive projections for the two restrictions express
$S_m(h,j)$ as an average of $T_L(H,J)$ over lifts of the
frequencies modulo $m$, up to factors of modulus one and
a unit rescaling by the inverse of $A/\pi^a$.
If the two frequencies are divisible by $\pi^e$, the
probability that both lifts are divisible by $\pi^{e+i}$
is $\pi^{-2i}$. Otherwise the gcd valuation is fixed.
Thus the average of $\gcd(H,J,L)^{1/2}$ is at most
$\gcd(h,j,m)^{1/2}(1+\sum_{i\ge1}\pi^{-3i/2})$.
In this case $G=1$ and $L=m\gcd(A,m)$.
When one frequency is zero and $\pi\mid A$, the other
coordinate is uniform since every coordinate determines
the other one uniquely. Combining all prime powers gives

```math
 \begin{aligned}
 |S_M(h,j)| &\ll_\epsilon M^\epsilon
    \sqrt{M\gcd(A,M)\gcd(D,M)\gcd(h,j,M)},\\
 |S_M(h,0)| &\ll_\epsilon M^\epsilon\gcd(D,M)\gcd(h,M).
 \end{aligned}
```

The second estimate also holds with the coordinates exchanged.

Let $W_i(h)$ be the sum of $e_M(-h v)$ over the respective
restricted interval. For each $d\mid M$, the geometric-series
bound gives

```math
 \sum_{\substack{h\bmod M\\h\ne0,\ d\mid h}} |W_i(h)|
       \ll (M/d)\log(2M).
```

Indeed the chosen integers run through a progression of
step $k$, and multiplying the frequencies by $k$ permutes
the nonzero multiples of $d$ modulo $M$.
In the Fourier expansion the zero pair contributes
$\nu(M)N_1N_2/M^2$. For the other pairs, bound
$\gcd(h,j,M)^{1/2}$ by the sum of $\sqrt d$ over the divisors
$d\mid M$ dividing both frequencies when both are nonzero.
The two geometric-series bounds give a total frequency weight
at most $M^2(\log(2M))^2\sum_{d\mid M}d^{-3/2}$.
When exactly one frequency is zero, use $|W_i(0)|=N_i$ there
and bound $\gcd(h,M)$ in the other coordinate by the sum of
$d$ over $d\mid\gcd(h,M)$. This gives a weight at most
$N_i M\tau(M)\log(2M)$. Dividing by $M^2$ and applying the
respective complete-sum bounds gives the stated box estimate.

We also use the bound

```math
 \nu(M)\le M\sum_{h\mid\gcd(D,M)}1.
```

For each prime power $r^e\parallel M$ with $r\mid A$,
the coefficient $Au+B$ is a unit, so every $u$ has a unique
$w$. If $r\nmid A$, the congruence is equivalent to
$xy\equiv D\pmod{r^e}$. For each $g=\gcd(x,r^e)\mid D$,
the count is $g\varphi(r^e/g)\le r^e$, which gives the bound
by the Chinese remainder theorem.

## A preimage theorem below the square root

**Theorem.** Let $\mathcal C$ consist of composite integers
with largest prime factor at most $\sqrt n$ whose two largest
prime factors, counted with multiplicity, have product at least
$n^{6/7}$. For every set
$\mathcal A$ of natural density zero,

```math
 \#\{n\le X:n\in\mathcal C,\ s(n)\in\mathcal A\}=o(X).
```

The family $\mathcal C$ has positive natural density.

### Reduction and the collision equation

First fix $0<\lambda<1/7$ and apply the argument to the
subfamily whose two largest prime factors have product
at least $n^{1-\lambda}$. Work in $X/2<n\le X$.
A repeated prime factor of size at least
$(X/2)^{1/2-\lambda}$ occurs on $o(X)$ inputs. Write the remaining
inputs as $n=pq\ell$, where $p>q$ are the two largest primes,
coprime to $\ell$. We have

```math
 q\gg X^{1/2-\lambda},\quad q\le\sqrt{X/\ell},\quad
 p\le\sqrt X,\quad \ell\le X^\lambda.
```

We may discard an arbitrarily small upper proportion of inputs
to require that $\ell=rw$ with $r\ge X^\beta$ a prime coprime
to $w$, for some fixed $\beta>0$. In fact, the inputs with
$\ell\le X^\delta$ cost $O(\delta X)+o(X)$, by bounding the number
of choices of $p$ by $O(X/(q\ell\log X))$ and summing
prime reciprocals over $q\gg X^{1/2-\lambda}$. If the largest prime
of $\ell$ is below $X^\beta$ and $\ell>X^\delta$, the $X^\beta$-smooth
part of $n$ exceeds $X^\delta$. This costs $O((\beta/\delta)X)$
by the mean of the logarithm of that smooth part. First choose
$\delta$ small and then $\beta/\delta$ small.

Use the small-prime conditions in the
[main research note](PROOF.md#reduction-to-a-second-moment)
for each of $n,m=q\ell,\ell$, with $Y=y(X^\beta)$ and
$d=n_Y\le\log X$. Require $s(\ell)\asymp\ell$,
$s(m)/\varphi(s(m))\ll1$, and the reciprocal-divisor
condition for $\sigma(\ell)$ with threshold $(\log\log X)^2$.
The same transfer of exceptional sets by prime reciprocal sums
works here, since both primes have a fixed power lower bound.
In particular, $s(n)\ll X$. It suffices to bound the second
moment on the retained set by $O(X)$. Dependence on the allowed
exceptional proportion is harmless.

For a collision with $n'=p'q'\ell'$, the small-prime parts are
equal since $d=(s(n))_Y=(s(n'))_Y$. Put

```math
 a=s(\ell)/d,\quad b=\sigma(\ell)/d,\quad t=\ell/d=b-a,
 \qquad A=s(\ell')/d,\quad B=\sigma(\ell')/d,\quad t'=\ell'/d=B-A.
```

Both coefficient pairs are coprime. Put $M=aq+b=s(m)/d$
and $K=b(q+1)$. For fixed $\ell,\ell',q$, the collision condition
is $Mp+K=F(p',q')$, with $F$ as above. Define the normalized
determinant $\Delta=Atb-a t'B$. The zero-determinant proposition
in the main note bounds the off-diagonal collisions with $\Delta=0$
by $X^{1-\beta+o(1)}$. We now take $\Delta\ne0$. Two facts are

```math
 D=AK+Bt',\qquad aD\equiv-\Delta\pmod M .
```

Since $\gcd(a,M)=1$, every common divisor of $D,M$ divides
$\Delta$. Also $|\Delta|\ll X^{3\lambda}$.

### Sieving three prime variables with the fourth fixed

Split the choices of $q$ into ranges $[Q,2Q)$ with $Q$ a power
of two. For a fixed pair of tails and a fixed $q$, split
$p',q'$ into intervals $I,J$ of the same kind. For each interval
for $q'$ there are $O(1)$ possible intervals for $p'$ since
$X/2<p'q'\ell'\le X$. In particular
$|I||J|\ll X/\ell'$ and $|I|+|J|\ll X^{1/2}$.
Over the entire box consider pairs $(u,w)$ with
$F(u,w)\equiv K\pmod M$. These determine the integer
$v=(F(u,w)-K)/M$. The retained collisions require
$u,w,v$ all prime and all above $z=X^\theta$, where
$\theta>0$ is a sufficiently small fixed constant depending
on $\lambda$.

For any squarefree $k$ coprime to $M$, let $\rho(k)$ be the number
of residue pairs $(u,w)\bmod k$ for which $k\mid uwv$, where
$v\equiv M^{-1}(F(u,w)-K)\pmod k$. It is multiplicative by
the Chinese remainder theorem. By the box estimate, the number
of pairs with $k\mid uwv$ is

```math
 \frac{\nu(M)|I||J|}{M^2}\frac{\rho(k)}{k^2}
 + O\left(k^2 X^{o(1)}\left[
       \sqrt{M\gcd(A,M)\gcd(D,M)}
           +\gcd(D,M)\frac{|I|+|J|}{M}\right]\right).
```

In each residue pair the numbers of terms in the two intervals
are $|I|/k+O(1)$ and $|J|/k+O(1)$. Rounding these factors
is absorbed by the error using $\nu(M)/M\le\tau(\gcd(D,M))$.

Use [Selberg's upper-bound sieve, Theorem 21.1](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf)
with the primes $7\le\pi\le z$ not dividing $M$, and
$g(\pi)=\rho(\pi)/\pi^2$. We have $0<g(\pi)\le4/\pi$
and

```math
 g(\pi)\ge
 \begin{cases}
   3/\pi-O(1/\pi^2),&\pi\nmid B,\\
   2/\pi-O(1/\pi^2),&\pi\mid B .
 \end{cases}
```

The two axes already give $2\pi-1$ points. When $\pi\nmid B$,
the curve $F=K$ contributes at least $\pi-1$ points and intersects
the axes in at most two. This follows by completing the product
if $A$ is a unit and by counting a line otherwise.
The upper bound follows from at most two lines or a hyperbola
plus the axes.

The reciprocal of the Selberg denominator is at most a constant
times $\prod(1-g(\pi))$ over the permitted primes up to
$z^{1/20}$. Indeed, the Euler product with local weights
$g(\pi)/(1-g(\pi))$ defines a distribution on products of
these primes in which each prime is present with probability
$g(\pi)$. The expected logarithm of the product is at most
$(4+o(1))\log(z^{1/20})$, so at least half the weight is on
products at most $z$, which are included in the denominator.
By Mertens' theorem the reciprocal is therefore

```math
 \ll \frac{1}{(\log X)^3}
        \left(\frac{M}{\varphi(M)}\right)^3
        \prod_{\pi\mid B}(1-1/\pi)^{-1}
 \ll \frac{\log Y}{(\log X)^3}.
```

The retained totient bound on $s(m)$ bounds the factor for $M$.
For $B$, primes up to $Y$ contribute $O(\log Y)$, primes
between $Y$ and $(\log\log X)^2$ cost $O(1)$ by Mertens,
and the reciprocal-divisor condition for $\sigma(\ell')$
bounds the product over the remaining primes.

Thus the main contribution per box is at most a constant times

```math
 \frac{Xd\log Y}{\ell\ell' Q(\log X)^3}
               \sum_{h\mid\gcd(D,M)}1.
```

The sieve error costs the displayed box error without $k^2$
times $z^{6+o(1)}$, since the sieve weights the errors for
$k\le z^2$ by at most $3^{\omega(k)}$.

### Summing the errors

Fix the tails and $Q$ and write $G_q=\gcd(D,M)$ and
$J_q=\gcd(A,M)$. Then $G_q\mid\Delta$ and $G_q,J_q$ are
coprime since $\gcd(D,A)=1$. For $g\mid A$ and $h\mid\Delta$
with $\gcd(g,h)=1$, the condition $gh\mid aq+b$ puts $q$
in at most one residue class modulo $gh$ because $a,b$
are coprime. Even over all integers $q$ in the dyadic interval,

```math
 \begin{aligned}
 \sum_q \sqrt{J_q G_q}
  &\le \sum_{\substack{g\mid A,\ h\mid\Delta\\\gcd(g,h)=1}}
        \sqrt{gh}\,\#\{q:gh\mid M\}
   \ll (Q+\sqrt{A|\Delta|})X^{o(1)},\\
 \sum_q G_q
  &\le \sum_{h\mid\Delta}h\,\#\{q:h\mid M\}
   \ll (Q+|\Delta|)X^{o(1)}.
 \end{aligned}
```

Here $\sqrt{A|\Delta|}\ll X^{2\lambda}\ll Q$ since
$Q\gg X^{1/2-\lambda}$ and $\lambda<1/7$.
With $M\ll\ell Q$, the sum of the first error term is
$O(z^{6+o(1)}\sqrt{\ell}Q^{3/2}X^{o(1)})$, at most
$z^{6+o(1)}X^{3/4+o(1)}\ell^{-1/4}$ since
$Q\le\sqrt{X/\ell}$. For the second term use
$M\gg\ell Q/d$ and $|I|+|J|\ll\sqrt X$, so its sum is
at most $z^{6+o(1)}X^{1/2+o(1)}(1+|\Delta|/Q)/\ell$.
We have $|\Delta|/Q\ll X^{4\lambda-1/2}$.

Summing these bounds over $\ell,\ell'\le X^\lambda$
and the $O((\log X)^2)$ pairs of boxes gives exponents
at most

```math
 3/4+7\lambda/4+6\theta+o(1),\qquad
 \max(1/2+\lambda,5\lambda)+6\theta+o(1),
```

respectively. Both are less than $1$ for sufficiently small
fixed $\theta$, so the total error is $o(X)$.

### Summing the main term

All prime factors of $h\mid\gcd(D,M)$ exceed $Y$.
If $\pi$ is such a factor, it divides none of
$\ell,\ell',a,A,b,B$. Indeed $\pi\nmid q\ell$ by the
condition $\gcd(m,s(m))=d$. Together with $\pi\mid aq+b$
and $\gcd(a,b)=1$ this gives $\pi\nmid ab$. Then
$Atb\equiv a t'B\pmod\pi$ and the gcd conditions on $\ell'$
give $\pi\nmid A t'B$.
Also $\pi\nmid\sigma(w)$ when $\ell=rw$.

For $h>X^{1/10}$, the sum of $1/Q$ over the eligible $q$
is at most $O(1/h+1/Q)$ even over integers. There are
$X^{o(1)}$ eligible divisors of $\Delta$, so this range saves
a power of $X$ and contributes $o(X)$ in total.
For $h\le X^{1/10}$, Brun–Titchmarsh bounds the sum of $1/Q$
over the primes $q\in[Q,2Q)$ in the required class
by $O(1/(\varphi(h)\log X))$. A class sharing a prime
with $h$ contains no eligible $q$. Thus summing the main term
over $q$ costs at most

```math
 \frac{Xd\log Y}{\ell\ell'(\log X)^4}\,
 H(\ell,\ell'),\qquad
 H(\ell,\ell')=
 \prod_{\substack{\pi\mid\Delta,\ \pi>Y\\
                   \pi\nmid A t'B\sigma(w)}}
        \left(1-\frac1{\pi}\right)^{-1}.
```

Here the sum of $1/\varphi(h)$ over eligible divisors of
$\Delta$ is bounded by a constant times $H$: at each prime
the sum over all exponents is $1+\pi/(\pi-1)^2$ and the
ratio to $(1-1/\pi)^{-1}$ is $1+O(1/\pi^2)$.

For each fixed $\ell'$ with small-prime part $d$, we claim
that the weighted sum of $H$ over the retained tails is

```math
 \sum_{\substack{\ell:\ \ell_Y=d,\ \Delta\ne0}}
     \frac{H(\ell,\ell')}{\ell}
       \ll \frac{\log X}{d\log Y}.
```

To prove this, set $Z=(\log\log X)^2$ and $W=\log X$.
Primes in $(Y,Z]$ cost a bounded factor by Mertens.
Primes above $W$ cost a bounded factor because
$0<|\Delta|\ll X^{3\lambda}$. Let $T$ sum $1/\pi$ over
the primes of $H$ in $(Z,W]$. For $T\le1$, $H$ is bounded.
For $T>1$, the bound $H\ll\log\log X$ gives
$H\ll 1+(\log\log X)T$ in all cases.
For fixed $w,\ell'$ and an eligible $\pi$ in this interval,
the determinant is a polynomial of degree at most two in $r$,
since

```math
 t=rw/d,\qquad b=(r+1)\sigma(w)/d,\qquad
 a=(r s(w)+\sigma(w))/d.
```

Modulo $\pi$ the constant term is
$-t'B\sigma(w)/d\ne0$. The polynomial has at most two
roots, and each residue class has prime reciprocal sum
$O_\beta(1/\varphi(\pi))$ over $r\ge X^\beta$ up to $X$
by Brun–Titchmarsh. The unrestricted reciprocal sum over
those $r$ is $O_\beta(1)$. Since $w_Y=d$,
$\sum_w 1/w\ll\log X/(d\log Y)$ by the Euler product over
the $Y$-rough factors of $w/d$. Consequently the term from
$T$ costs at most this bound times
$(\log\log X)\sum_{\pi>Z}1/(\pi\varphi(\pi))=O(1)$.
This proves the claim.

Now sum over the $O((\log X)^2)$ pairs of dyadic intervals
for $q,q'$. The reciprocal sum over $\ell'$ with $\ell'_Y=d$
is also $O(\log X/(d\log Y))$. The two tail sums therefore
give $O(X/(d\log Y))$ for each $d$. The sum of $1/d$ over
$Y$-smooth integers is $O(\log Y)$ by Mertens' theorem.
The main terms, errors and diagonal together give $O(X)$,
as required. Cauchy–Schwarz now proves the assertion on the
retained inputs, and the discarded upper proportion can
be taken arbitrarily small.

### Density beyond the dominant-prime family

The family $\mathcal C$ is disjoint from the family $\mathcal B$
in the main note, which has $p>\sqrt n$. For the subfamily
$\mathcal C_\lambda$ with $\ell\le n^\lambda$, we obtain

```math
 \lim_{X\to\infty}\frac{\#(\mathcal C_\lambda\cap[1,X])}{X}
    =\int_0^\lambda\frac{-\log(1-2u)}{1-u}\,du.
```

For a count in $(X/2,X]$, put $u=\log\ell/\log X$ and
$v=\log q/\log X$. The exponent of $p$ is
$1-u-v+O(1/\log X)$. Away from the boundaries the region
is $0\le u\le\lambda$ and $1/2-u\le v\le(1-u)/2$.
For each $q,\ell$ there the prime number theorem counts
$(1+o(1))X/(2q\ell(1-u-v)\log X)$ choices of $p$.
The integer reciprocal sum in $\ell$ and prime reciprocal
sum in $q$ converge to the integral

```math
 \int_0^\lambda\!\int_{1/2-u}^{(1-u)/2}
              \frac{dv\,du}{v(1-u-v)}
   =\int_0^\lambda\frac{-\log(1-2u)}{1-u}\,du
```

by partial summation and the prime number theorem.
Boundary strips of width tending to zero cost a vanishing
proportion by the same upper estimates. Summing the dyadic
counts proves the density formula, also at $\lambda=1/7$.
By continuity, the density of the inputs lost by using
$\lambda<1/7$ tends to zero as $\lambda\to1/7$.
The preimage assertion thus holds on all of $\mathcal C$.
The union $\mathcal B\cup\mathcal C$ has density

```math
 (\log 2)^2+\int_0^{1/7}\frac{-\log(1-2u)}{1-u}\,du,
```

approximately $50.56\%$.

## Refinement using the cofactor and prime exponents

Use the same largest two prime factors $p,q$ in decreasing
order, counted with multiplicity, and put $\ell=n/(pq)$.
Let $\mathcal D$ consist of composite inputs with $p\le\sqrt n$
and logarithmic coordinates $u=\log\ell/\log n$,
$v=\log q/\log n$ in the region

```math
 0\le u,\qquad 1/2-u\le v\le (1-u)/2,\qquad
 5u+3v\le 2,\qquad 9u+v\le 2 .
```

**Corollary.** For every natural density-zero set $\mathcal A$,
the inputs in $\mathcal D$ with $s(n)\in\mathcal A$ have
density zero. The union $\mathcal B\cup\mathcal D$ has
natural density approximately $51.96\%$.

It suffices to prove the corollary on closed rectangles
strictly inside the region. The boundaries have density zero
by the logarithmic prime-and-integer reciprocal count above.
More precisely, omit strips of an arbitrarily small fixed width
along the boundary, cover the remaining compact subset by finitely
many sufficiently small rectangles, and sum the preimage bounds for
these rectangles. The preimage assertion persists under such a finite
union, so each second moment needs only to count within one rectangle.

Suppose a rectangle is centered at $(u_0,v_0)$ with side lengths
at most $2\xi$. On $X/2<n\le X$, the tails of both inputs have size
$X^{u_0+O(\xi)}$, and $q,q'$ have size $X^{v_0+O(\xi)}$.
The discarded inputs and small-prime conditions are treated
as before. The main-term bound also goes through: the region
has $u\le 3/16$ and $v\ge 5/16$, so the prime intervals in $q$
have a power margin above the moduli $h\le X^{1/10}$.
The only change is to keep the sizes in the error terms,
using

```math
 M=X^{u_0+v_0+O(\xi)+o(1)},\qquad
 |I|+|J|\ll X^{1-u_0-v_0+O(\xi)},\qquad
 |\Delta|\ll X^{3u_0+O(\xi)} .
```

The first term in the box error, after summing over $q$ and
the two tails, uses $Q+\sqrt{A|\Delta|}$ and therefore has
two exponents $(5u_0+3v_0)/2$ and $(9u_0+v_0)/2$,
up to $6\theta+O(\xi)+o(1)$. The second term uses
$Q+|\Delta|$ and gives the exponents $1-v_0$ and
$1+3u_0-2v_0$, up to the same error. The first two exponents
are strictly below one in the interior. For the last two
we have $v\ge5/16$ and $3u-2v\le-1/16$ throughout the
region. Taking $\xi$ and the sieve exponent $\theta$ small
enough proves the power saving on the rectangle.

To compute the density, the upper boundary for $v$ is
$U(u)=\min((1-u)/2,(2-5u)/3,2-9u)$, with respective
intervals $[0,1/7]$, $[1/7,2/11]$, and $[2/11,3/16]$.
The lower boundary is $1/2-u$. The integral giving the
density of $\mathcal B\cup\mathcal D$ is

```math
 (\log 2)^2+
 \int_0^{3/16}\frac{1}{1-u}
     \log\left(\frac{U(u)}{(1-u-U(u))(1-2u)}\right)\,du.
```

This uses the same prime number theorem count on
$(X/2,X]$ and the integral of $1/(v(1-u-v))$ with
respect to $v$. Since $p\le\sqrt n$ on $\mathcal D$,
its density adds to that of $\mathcal B$.
