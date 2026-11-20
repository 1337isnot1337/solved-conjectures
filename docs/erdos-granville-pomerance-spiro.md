# Erdős–Granville–Pomerance–Spiro conjecture

Research log for [issue #47](https://github.com/1337isnot1337/solved-conjectures/issues/47). The full conjecture remains open.

Let $s(n)=\sigma(n)-n$ be the sum of the proper divisors of $n$.
If $A$ is a set of positive integers of natural density zero, the
conjecture says that $\{n\ge2:s(n)\in A\}$ also has natural density
zero.

## Literature

- [Erdős, Granville, Pomerance, and Spiro, Conjecture 4](https://math.dartmouth.edu/~carlp/iterate.pdf)
  pose the statement in their 1990 paper on iterations of arithmetic
  functions.
- [Pollack, Pomerance, and Thompson, Theorems 1.2 and 1.4](https://arxiv.org/abs/1706.03120)
  prove the conjecture for arbitrary sets with counting function
  $X^{1/2+o(1)}$. They refute a separate proposed uniform bound on
  individual fibers. A sparse family of large fibers can coexist
  with the density-zero conjecture.
- [Luca and Pomerance, §3](https://math.dartmouth.edu/~carlp/LucaPomeranceAA2.pdf)
  bound the second moment of the fibers on a chosen positive-density
  set of even deficient inputs with three large prime factors in
  prescribed windows. This proves positive lower density of their
  even outputs. The same moment bound gives the density-zero
  preimage implication on those inputs by Cauchy–Schwarz.
- [Pollack and Troupe](https://arxiv.org/abs/2106.10756) prove the
  Erdős–Kac law for $s(n)$. [Lebowitz-Lockard, Pollack, and Singha Roy](https://arxiv.org/abs/2105.12850)
  establish equidistribution modulo individual primes up to fixed
  powers of $\log X$. These distribution statements address
  specific kinds of sparse sets.
- [Pollack and Singha Roy](https://arxiv.org/abs/2106.14953) prove
  agreement of $k$-free status almost everywhere for $k\ge4$.
  [Benli et al.](https://arxiv.org/abs/2307.12859) prove the EGPS
  conclusion for missing-digit sets. [A 2026 follow-up](https://arxiv.org/abs/2607.18981)
  develops further digit-distribution results.
- [Erdős Problem 955](https://www.erdosproblems.com/955) and
  [the fiber-tightness audit](https://www.erdosproblemaday.com/report/955)
  record the same full statement and the equivalent question of
  uniform control of the mass of large finite fibers.

The November 2026 search covered the original papers, later
preprints and their references, and the problem discussion.
No proof or counterexample for arbitrary density-zero sets was found.

The proof route uses Luca and Pomerance's second moment after
separating inputs by their small-prime parts. The new calculation
retains quadratic congruences modulo prime powers, so it avoids
the use of squarefreeness in the original collision count.

## A preimage theorem for a family with three large prime factors

**Theorem.** Fix any $\eta>0$. Let $\mathcal B_\eta$ consist of the integers
$n=pqrw$, where $p>q>r$ are the three largest distinct prime divisors,
none divides $w$, and

```math
p\ge n^{1/2+\eta},\qquad r\ge n^\eta,\qquad q\ge n^\eta rw.
```

For every set $A$ of natural density zero,

```math
\#\{n\le X:n\in\mathcal B_\eta,\ s(n)\in A\}=o(X).
```

There is no parity or deficiency restriction. The proof adapts
[Luca and Pomerance, §3](https://math.dartmouth.edu/~carlp/LucaPomeranceAA2.pdf).
It replaces their squarefree-modulus step with two bounds for a quadratic
congruence modulo an arbitrary odd modulus.

### Reduction to a second moment

Work on $X/2<n\le X$, and put $m=qrw$, $\ell=rw$. Enlarge the
allowed ranges slightly to use powers of $X$ in the hypotheses.
Split the possible values of $\log\ell/\log X$ into finitely many
intervals of length at most $\eta/16$. On each interval there are
fixed exponents $\alpha,\beta,\kappa,\gamma,\epsilon>0$ such that

```math
m\le X^{1/2-\epsilon},\quad
r\ge X^\beta,\quad
\ell\le X^\kappa,\quad
q\ge X^\alpha,\quad
\kappa\lt\alpha,\quad \beta/2\lt\gamma\lt\alpha .
```

Here $\beta\le\kappa$. It suffices to show the conclusion on each interval.

Write $y(t)=\log\log t/\log\log\log t$, set $Y=y(X^\beta)$,
and write $t_Y$ for the largest $Y$-smooth divisor of $t$.
The following conditions can be imposed after discarding an arbitrarily
small upper proportion of inputs. Put $d=n_Y$. For $t=n,m,\ell$ require

```math
t_Y=(s(t))_Y=\gcd(t,\sigma(t))=d,\qquad
\pi\mid \sigma(t)/d\quad\text{for every prime }\pi\le Y.
```

For $m$ also require $s(m)\asymp m$, $s(m)/\varphi(s(m))\ll1$, and
$\sum_{j\mid\sigma(m),\, j>(\log\log X)^2}1/j\le1$.
The implied constants may depend on the permitted exceptional proportion.
We also take $d\le\log X$.

Here is the justification for the discards. The small-prime conditions
come from Luca and Pomerance's Lemma 2.1, with $y(t)$ in place of $Y$.
For $X^\beta\le t\le X$ the interval between these thresholds is
contained in a common interval of width $o(1)$. Removing inputs
divisible by the possible prime in that interval costs $o(X)$.
The three prime factors $p,q,r$ all exceed $Y$, so the remaining
smooth parts coincide. The reciprocal-divisor condition follows from
their Lemma 2.5. Davenport's distribution theorem lets us restrict
$s(m)/m$ to a compact subinterval of the positive reals with arbitrarily
small exceptional density. The
[original paper's Theorem 5.1](https://math.dartmouth.edu/~carlp/iterate.pdf)
gives $s(s(m))/s(m)=s(m)/m+o(1)$ on a set of density one.
This bounds $s(m)/\varphi(s(m))$ on the same retained range because
$t/\varphi(t)\le\zeta(2)\sigma(t)/t$.
To transfer an exceptional set of cofactors $m$ to inputs $pm$,
use $\#\{p\le X/m\}\ll X/(m\log X)$.
For an exceptional set of $\ell$ the extra sum over $q$ costs
$O_\alpha(1)$ since $\sum_{X^\alpha\le q\le X}1/q=O_\alpha(1)$
over primes. An exceptional set of upper density $\delta$ has
reciprocal sum at most $(\delta+o(1))\log X$ in the upper-limit
sense. Finally $\sum_{n\le X}\log(n_Y)\ll X\log Y$ follows by
summing prime-power divisibility, so $n_Y>\log X$ costs $o(X)$.

For these inputs $s(n)=p s(m)+\sigma(m)\ll X$. Write $R(v)$ for
the number of retained inputs giving output $v$. We prove
$\sum_v R(v)^2\ll X$. Cauchy–Schwarz bounds the preimages of $A$
by $O(X^{1/2}|A\cap[1,CX]|^{1/2})=o(X)$. The exceptional proportion
can then be arbitrarily small. The dyadic estimates sum to the
stated bound up to $X$.

### Counting collisions

A collision has the same $d$ on both inputs, since $d=(s(n))_Y$.
The diagonal contributes at most $X$ after summing all strata.
For distinct cofactors $m,m'$ put $a=s(m), a'=s(m')$,
$b=\sigma(m), b'=\sigma(m')$, and $dh=\gcd(a,a')$.
All prime divisors of $h$ exceed $Y$. If there is a collision,
$dh\mid b-b'$. Also $b\ne b'$: otherwise $ap=a'p'$ and $p,p'$
exceed both coefficients, forcing $p=p'$, $a=a'$ and $m=m'$.
The two prime variables in the collision equation run along linear
forms in one integer variable. The upper-bound sieve used in
[Luca and Pomerance, (3.7)](https://math.dartmouth.edu/~carlp/LucaPomeranceAA2.pdf)
bounds their count by

```math
\ll \frac{Xdh}{m m'(\log X)^2}\frac{D}{\varphi(D)},
\qquad D=\frac{a}{dh}\frac{a'}{dh}\frac{|b-b'|}{dh}.
```

The progression parameter has range of scale $Xdh/(m m')$,
which exceeds $X^{2\epsilon}$, and both affine forms have
nonzero determinant. As in the cited estimate, the local
factors are bounded by a constant times $D/\varphi(D)$.

For $h>X^\gamma$, the collision gives
$m\equiv m'\pmod h$. Writing $m=q\ell$ and $m'=q'\ell'$,
the congruences $h\mid s(m),s(m')$ then give

```math
h\mid \Delta,\qquad
\Delta=\ell\sigma(\ell)s(\ell')-\ell'\sigma(\ell')s(\ell).
```

Indeed $\gcd(h,\ell\sigma(\ell)s(\ell))=1$. A prime of $h$ in
$\ell$ is excluded by $\gcd(m,s(m))=d$. If a prime of $h$
divides $\sigma(\ell)$, then it divides $q s(\ell)$.
It cannot equal $q$, because that would make it a common prime of
$m$ and $\sigma(m)$ outside $d$. It cannot divide $s(\ell)$
either, by the corresponding gcd condition on $\ell$. The claimed
congruence follows by solving for $q$ and $q'$.
For $\Delta\ne0$, fix $\ell,\ell'$ and one of the
$\tau(|\Delta|)=X^{o(1)}$ possible divisors $h$. The
congruences put $q,q'$ in fixed residue classes modulo $h$.
In dyadic ranges $q\asymp Q$, $q'\asymp Q'$, their
reciprocal sums are $O(1/h+1/Q)$ and $O(1/h+1/Q')$.
If the ranges contain a collision, then
$h\ll\min(\ell Q,\ell'Q')$ by $h\mid s(m),s(m')$.
Consequently the product of the two sums, multiplied by $h$,
is at most a constant times

```math
\frac1h+\frac1Q+\frac1{Q'}+\frac{h}{QQ'}
 \ll X^{-\gamma}+X^{-\alpha}+X^{\kappa-\alpha}.
```

This has a power saving in every dyadic range. Summing over
$h$, the dyadic ranges, and $\ell,\ell'$ with weights
$1/(\ell\ell')$ leaves that saving, up to $X^{o(1)}$.
The factor $D/\varphi(D)\ll\log\log X$ is harmless here.

For $\Delta=0$ we have
$\ell+\ell^2/s(\ell)=\ell'+(\ell')^2/s(\ell')$.
The reduced denominators on the two sides are $s(\ell)/d$
and $s(\ell')/d$, since $\gcd(\ell^2,s(\ell))=d$.
So $s(\ell)=s(\ell')$, and strict monotonicity with that
denominator gives $\ell=\ell'$.

Thus $q\ne q'$ and $q\equiv q'\pmod h$. Choose the
order $q>q'$. The reciprocal sum of such $q$ is at most
$O(\log X/h)$, even without primality. Using
$D/\varphi(D)\ll\log\log X$, the bound
$\tau(s(m'))=X^{o(1)}$, $\sum_{q'\ge X^\alpha}1/q'=O(1)$
over primes, and $\sum_{\ell\ge X^\beta}1/\ell^2\ll X^{-\beta}$,
the $\Delta=0$ contribution is $X^{1-\beta+o(1)}$ per stratum.
This is negligible in total since $d\le\log X$.

### Small and intermediate moduli

Suppose $h\le X^\gamma$. Fix $m'$, a divisor
$h\mid s(m')/d$, and the tail $w$. For a collision we must have

```math
qrw\equiv \sigma(w)(q+1)(r+1)\equiv m'\pmod h.
```

The residue $m'$ is a unit modulo $h$. Thus $w,\sigma(w)$ are
units, the congruences determine $qr$ and $q+r$ modulo $h$,
and $r$ satisfies a monic quadratic modulo $h$. For a fixed $r$,
$q$ is in a single residue class modulo $h$.

We first average over $q$, retaining the factor $D/\varphi(D)$.
Factors from $a/(dh),a'/(dh)$ are bounded by the retained totient
ratios. Put $Z=(\log\log X)^2$ and $W=\log X$. In the factor
arising from $b-b'$, the primes at most $Z$ contribute $O(\log Y)$
by Mertens' theorem. Those above $W$ contribute $O(1)$,
since $|b-b'|\le X^{O(1)}$. In the middle range, primes
dividing $h$ contribute $O(1)$ by the totient ratio of $a'$.
Those dividing $b$ contribute $O(1)$ by the retained bound on
the sum of reciprocals of divisors of $b$. Define

```math
F=\sum_{\substack{Z<\pi\le W,\ \pi\mid b-b'\\
                 \pi\nmid hb}}\frac{1}{\pi}
\quad(\pi\text{ prime}).
```

If $F\le1$, the remaining product is bounded. If $F>1$,
use the overall bound $D/\varphi(D)\ll\log\log X$. Together,

```math
D/\varphi(D)\ll \log Y
 \left(1+\frac{\log\log X}{\log Y}F\right).
```

For each summand in $F$, the equation
$b=\sigma(rw)(q+1)\equiv b'\pmod\pi$ fixes a single residue
class of $q$ modulo $\pi$. Its modulus combines with $h$
by the Chinese remainder theorem. Brun–Titchmarsh and partial
summation bound the harmonic sum of $q\ge X^\alpha$ in this
class by $O(1/\varphi(\pi h))$: the modulus is at most
$X^\gamma\log X$, with $\gamma<\alpha$.
A noncoprime residue cannot contain any of the eligible primes.
As $\sum_{\pi>Z}1/(\pi\varphi(\pi))\ll1/Z$, this proves,
for each fixed $r$ in its admissible classes,

```math
\sum_q \frac{1}{q}\frac{D}{\varphi(D)}
 \ll \frac{\log Y}{\varphi(h)}.
```

For an odd prime power $\pi^e$, a monic quadratic has at most
$2\pi^{\lfloor e/2\rfloor}$ roots modulo $\pi^e$. Its roots
lie in at most two classes modulo $\pi^{\lceil e/2\rceil}$.
Both statements follow by completing the square. For a nonzero
square with valuation $2j<e$ the two unit roots lift to two
classes modulo $\pi^{e-j}$. For the zero square the roots
are multiples of $\pi^{\lceil e/2\rceil}$.

For $h\le X^{\beta/2}$, apply Brun–Titchmarsh to the
$r$-sum in all root classes modulo $h$. Their number is at most
$B(h)=\prod_{\pi^e\parallel h}2\pi^{\lfloor e/2\rfloor}$.
The resulting contribution for each $d$ is at most

```math
\ll \frac{Xd\log Y}{(\log X)^2}
 \sum_{m'}\frac{1}{m'}\sum_w\frac{1}{w}
 \sum_{h\mid a'/d}\frac{h B(h)}{\varphi(h)^2}.
```

The final divisor sum is bounded uniformly. At a prime
$\pi$ the sum over all positive exponents is
$4/((\pi-1)(1-1/\pi)^2)=O(1/\pi)$, so the product
is bounded by a fixed power of $a'/\varphi(a')$.
The reciprocal sums over $m'$ and $w$ are
$O(\log X/(d\log Y))$ each, by the Euler product on
$Y$-rough integers. Thus this range contributes
$O(X/(d\log Y))$.

For $X^{\beta/2}<h\le X^\gamma$, the quadratic-root
cover gives at most $2^{\omega(h)}$ classes modulo
$\prod_{\pi^e\parallel h}\pi^{\lceil e/2\rceil}\ge\sqrt h$.
Over those classes, the harmonic sum of integers
$r\ge X^\beta$ is
$O(2^{\omega(h)}((\log X)/\sqrt h+X^{-\beta}))$.
Multiplying by $h/\varphi(h)\ll1$ and summing all
$h\mid a'/d$ still yields a power saving, since
$2^{\omega(h)}\tau(a')=X^{o(1)}$.
The intermediate contribution is negligible in total.

Finally $\sum_{d\ \,Y\text{-smooth}}1/d=O(\log Y)$ by
Mertens' theorem. Summing the main contributions, the
negligible terms and the diagonal gives $\sum_v R(v)^2\ll X$,
as required.

### Remaining gap

This treats arbitrary zero-density target sets on the stated
large-prime family. The proof uses $p$ large for the final
two-prime sieve and $q$ larger than its remaining cofactor to
bound the largest collision moduli. These inequalities
do not hold on all but $o(X)$ inputs. A proof or disproof
of the full conjecture must control inputs outside this family.

## The margins can be removed on a set of density $({\log 2})^2$

Let $\mathcal B$ be the integers admitting $n=pq\ell$ with $p,q$ prime,
$p>q\ell$ and $q>\ell$. These inequalities determine the primes
uniquely as the two largest prime factors. For every set $A$ of
natural density zero,

```math
\#\{n\le X:n\in\mathcal B,\ s(n)\in A\}=o(X),
\qquad
\#(\mathcal B\cap[1,X])\sim (\log 2)^2 X.
```

To remove the margins, work on $X/2<n\le X$. For fixed $q,\ell$,
the number of choices of $p$ is $O(X/(q\ell\log X))$ by the
prime number theorem, since $q\ell\le\sqrt X$.
Fix $0<\eta<\delta<1/4$. The inputs with $\ell\le X^\delta$
have total count

```math
\ll \frac{X}{\log X}
   \sum_{\ell\le X^\delta}\frac1\ell
        \sum_{\ell<q\le X}\frac1q
 \ll X\delta(1+\log(1/\delta))+o(X).
```

Here the inner sum is over primes. For $\ell\ge2$ it is
$O(1+\log(\log X/\log\ell))$ by Mertens' theorem. Summing
against $1/\ell$ gives the displayed bound. The term $\ell=1$
contributes $O(X\log\log X/\log X)$.

Among the remaining inputs, failure of $p\ge n^{1/2+\eta}$
puts $q\ell$ between constant multiples of $X^{1/2-\eta}$
and $\sqrt X$. The reciprocal sum over these cofactors
is $O(1+\eta\log X)$, giving $O(\eta X)+o(X)$ inputs.
Failure of $q\ge n^\eta\ell$ puts $q$ in $(\ell,X^\eta\ell)$.
As $\ell\ge X^\delta$, the prime reciprocal sum there is
$O(\eta/\delta)+o(1)$ uniformly in $\ell$, again by Mertens.
This gives $O((\eta/\delta)X)+o(X)$ inputs.

If the largest prime of $\ell$ is below $n^\eta$, the
$X^\eta$-smooth part of $n$ contains $\ell$ and hence exceeds
$X^\delta$. The average logarithm of this smooth part is
$O(\eta\log X)$, by summing prime-power divisibility. This
excludes a further $O((\eta/\delta)X)$ inputs. Finally,
the inputs divisible by a square of a prime at least
$(X/2)^\eta$ are $o(X)$. Outside these exceptions we are
in $\mathcal B_\eta$. Taking $\delta=\sqrt{\eta}$ and
then $\eta$ arbitrarily small gives the preimage assertion.

For the density, first let $C(T)$ count $m\le T$
of the form $q\ell$ with $q>\ell$ prime. Such representations
are unique. The prime number theorem gives

```math
C(T)=\sum_{\ell\le\sqrt T}\big(\pi(T/\ell)-\pi(\ell)\big)
 \sim T\sum_{\ell\le\sqrt T}\frac{1}{\ell\log(T/\ell)}
 \sim T\log 2.
```

The subtracted sum is $O(T/\log T)$, and the last sum
is computed by integrating $1/(t\log(T/t))$.
For $n\in\mathcal B$, count the possible prime $p>m$
over these $m=q\ell\le\sqrt X$. Another use of the
prime number theorem gives

```math
\#(\mathcal B\cap[1,X])
=(1+o(1)) X\!
    \sum_{\substack{m\le\sqrt X\\ m=q\ell,\ q>\ell}}
       \frac1{m\log(X/m)}
  +O(X/\log X).
```

Partial summation using $C(T)\sim T\log 2$ multiplies
the unrestricted reciprocal sum by $\log 2$. The latter
sum tends to $\log 2$ by the same integral. This yields
the stated density.
