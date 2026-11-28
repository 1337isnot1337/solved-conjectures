# Erdős–Granville–Pomerance–Spiro conjecture

The full conjecture remains open. This note extends the
[dominant-largest-prime argument](PROOF.md)
to a family where the second-largest prime can be smaller than
its cofactor. Work is tracked in
[issue #47](https://github.com/1337isnot1337/solved-conjectures/issues/47).

**Theorem.** Let $`\mathcal E`$ consist of $`n=pqrw`$ with
$`p>q>r`$ prime, $`p>\sqrt n`$, and $`r>w^3`$. For every set
$`\mathcal A`$ of natural density zero,

```math
 \#\{n\le X:n\in\mathcal E,\ s(n)\in\mathcal A\}=o(X).
```

In particular, $`r>w^3`$ implies $`r>w`$ when $`w\ge1`$, so
the displayed primes are the largest three and are coprime
to $`w`$. The result adds a family of density about $`1.50\%`$
to the previously covered inputs.

## Reductions

Work on $`X/2<n\le X`$. We can impose fixed positive margins
on the bounds for $`p,r`$ and $`w`$ after discarding an arbitrarily
small upper proportion of inputs. To see this, the number
of possible $`p`$ for each $`q,r,w`$ is $`O(X/(qrw\log X))`$.
If $`w\le X^\delta`$, sum the reciprocal condition $`q>r>w`$
over the two primes. For $`w\ge2`$ it costs at most
$`O((1+\log(\log X/\log w))^2)`$. The sum of these weights
against $`1/w`$ for $`2\le w\le X^\delta`$ is
$`O(\delta(1+\log(1/\delta))^2\log X)+o(\log X)`$ by
integration. The case $`w=1`$ costs $`o(X)`$.

Requiring $`p\ge n^{1/2+\eta}`$ removes only $`O(\eta X)+o(X)`$
inputs by the reciprocal sum over $`m=qrw`$ between constant
multiples of $`X^{1/2-\eta}`$ and $`\sqrt X`$. For $`w\ge X^\delta`$,
the interval $`w^3<r<X^\eta w^3`$ has prime reciprocal sum
$`O(\eta/\delta)+o(1)`$ uniformly in $`w`$, by Mertens' theorem.
The reciprocal sum over $`q>r`$ is now bounded in terms of
$`\delta`$. Thus we can require $`r\ge n^\eta w^3`$ as well.
Finally, for a sufficiently small fixed $`\zeta>0`$, we can
require that $`w`$ have a prime factor $`j\ge X^\zeta`$ of
exponent one. The inputs failing this because $`w`$ is
$`X^\zeta`$-smooth cost $`O((\zeta/\delta)X)`$ by the average
logarithm of the $`X^\zeta`$-smooth part. The inputs divisible
by the square of any prime at least $`X^\zeta`$ cost $`o(X)`$.

Apply the small-prime and normality reductions in the
[main note](PROOF.md#reduction-to-a-second-moment).
Take $`Y=y(X^\beta)`$ with fixed $`\beta>0`$ smaller than the
power lower bounds on $`w,r,q`$. For $`n,m=qrw,w`$ the common
$`Y`$-smooth part is $`d\le\log X`$, and we require
$`\gcd(t,s(t))=(s(t))_Y=d`$ and
$`\pi\mid \sigma(t)/d`$ for each prime $`\pi\le Y`$ and
$`t=n,m,w`$. Also require $`s(m)\asymp m`$, $`s(w)\asymp w`$,
$`\sigma(s(m))\ll m`$, and the reciprocal-divisor condition
for $`\sigma(m)`$. In particular $`s(m)/\varphi(s(m))\ll1`$.
Davenport's theorem and the iterate theorem from the
[original paper](https://math.dartmouth.edu/~carlp/iterate.pdf)
give the normality bounds. Exceptional sets in $`w`$ transfer
by summing over $`p`$ and the reciprocal prime sums over $`q,r`$,
which are bounded since $`q,r`$ have fixed power lower bounds.

Partition the allowed logarithmic exponents of $`q,r,w`$ into
finitely many boxes of width at most $`2\xi`$, centered at
$`(v,b,c)`$. The margins give $`b>3c`$ and $`c>0`$, uniformly
away from equality. We will take $`\xi`$ sufficiently small
in terms of the margins and $`\zeta`$. It suffices to prove
a second moment of size $`O(X)`$ within each box. No collisions
between different boxes are needed for the preimage bound.

## Small and intermediate collision moduli

For distinct cofactors $`m,m'`$ in a collision, put
$`d h=\gcd(s(m),s(m'))`$. The two-prime sieve for $`p,p'`$ in the
main note applies since $`m,m'\ll X^{1/2-\eta}`$ up to constants.
For each such pair of cofactors it gives at most

```math
 \ll \frac{X d h}{m m'(\log X)^2}\frac{D}{\varphi(D)},\qquad
 D=\frac{s(m)}{dh}\frac{s(m')}{dh}
             \frac{|\sigma(m)-\sigma(m')|}{dh}
```

prime pairs. In a collision $`m\equiv m'\pmod h`$ and
$`h\mid s(m),s(m')`$. We use the quadratic congruence in $`q,r`$
from the main note for $`h\le X^\gamma`$, with any fixed
$`\gamma`$ between half a power lower bound for $`r`$ and a
power lower bound for $`q`$. That argument only requires these
prime power bounds and the stated normality conditions.
It gives $`O(X)`$ after summing over $`d`$.

Split $`q,r`$ further into dyadic intervals with lower endpoints
$`Q,R`$, and use primes on these endpoints for $`m'`$. For
$`X^\gamma<h\le QR X^{-\mu}`$, where $`\mu>0`$ will be chosen
small, fix $`m',h,w`$. The congruences
$`qrw\equiv\sigma(w)(q+1)(r+1)\equiv m'\pmod h`$
determine $`qr`$ and $`q+r`$ modulo $`h`$ since the coefficients
and $`m'`$ are units. The permitted $`r`$ lie in at most
$`2^{\omega(h)}`$ residue classes modulo a modulus at least
$`\sqrt h`$, by the quadratic root cover in the main note.
For each $`r`$, the prime $`q`$ lies in a single class modulo $`h`$.
Even ignoring primality, the product of the reciprocal sums
over $`q,r`$, multiplied by $`h`$, is at most

```math
 O\left(2^{\omega(h)}
  \left(\frac1{\sqrt h}+\frac1R+\frac{\sqrt h}{Q}
                          +\frac h{QR}\right)\right).
```

This saves a power of $`X`$ since $`R\le 2Q`$,
$`h\le QR X^{-\mu}`$, and $`R`$ has a fixed power lower bound.
The number of divisors of $`s(m')`$ and $`2^{\omega(h)}`$ are
$`X^{o(1)}`$. All other sums, including the reciprocal sums
over $`w,m'`$ and the sieve singular factor, cost only
$`X^{o(1)}`$. This range gives $`o(X)`$.

## Exact relations for the largest collision moduli

It remains to bound $`h>QR X^{-\mu}`$. In this range replace
$`D/\varphi(D)`$ in the sieve by $`O(\log\log X)`$. The identity
$`s(qrw)=s(w)qr+\sigma(w)(q+r+1)`$ gives

```math
 w\sigma(w)(q+r+1)\equiv -s(w)m'\pmod h.
```

Comparing this congruence with the corresponding congruence
for $`m'`$ yields
$`w\sigma(w)s(w')(q+r+1)\equiv
 w'\sigma(w')s(w)(q'+r'+1)\pmod h`$.
Both sides are $`O(X^{v+3c+O(\xi)})`$, whereas
$`h\ge X^{v+b-\mu+O(\xi)}`$. Since $`b>3c`$, take $`\mu,\xi`$
small enough that the congruence is an equality. Define

```math
 t_w=w/d,\qquad a_w=s(w)/d,\qquad b_w=\sigma(w)/d,qquad
 N_w=t_w b_w=t_w(t_w+a_w).
```

The equality now says
$`(N_w/a_w)(q+r+1)=(N_{w'}/a_{w'})(q'+r'+1)`$.
For fixed $`w,w',q',r'`$, it determines $`q+r`$.
Together with $`qr\equiv m'/w\pmod h`$ this gives at most
$`O(1+QR/h)`$ choices of $`q,r`$: the product is strictly increasing
in the smaller prime when their sum is fixed, and lies in an
interval of length $`O(QR)`$. The inverse of $`w`$ modulo $`h`$
exists because $`\gcd(m,s(m))=d`$.

When $`w=w'`$, the sums are equal and $`qr\ne q'r'`$ for
distinct $`m,m'`$. Thus $`h\le |qr-q'r'|\ll QR+Q'R'`$.
After multiplying by $`h/m`$ and summing $`h\mid s(m')/d`$,
the resulting bound is $`O(X^{-c+O(\xi)+o(1)})`$ for each $`m'`$.
This gives $`o(X)`$ such collisions after the prime-pair sieve.

When $`w\ne w'`$, put

```math
 A_{w,w'}=\frac{N_w a_{w'}}
                 {\gcd(N_w a_{w'},N_{w'} a_w)}.
```

This integer divides $`q'+r'+1`$. For each $`w,q',r',w'`$, the
sum over choices of $`m,h`$ of the sieve weight $`h/m`$ is
at most a constant times

```math
 \frac{\sigma(s(m'))}{QRw}+\frac{\tau(s(m'))}{w}
   \ll X^{O(\xi)+o(1)}.
```

Here the first term follows by summing $`h`$ over the divisors
of $`s(m')/d`$, and the second follows from the $`QR/h`$ term
in the number of choices of $`q,r`$. The retained
$`\sigma(s(m'))\ll m'`$ bounds the first term.
Since $`A_{w,w'}\ll X^{3c+O(\xi)}`$ and $`q'\asymp Q'`$
has exponent $`v\ge b>3c`$, the sum of $`1/m'`$ over the
eligible $`q',r'`$ for each $`w,w'`$ in their dyadic boxes
is $`O(1/(w'A_{w,w'}))`$, by counting $`q'`$ in one residue class.
Including the outer prime-pair sieve and summing the dyadic
boxes costs at most

```math
 X^{1+O(\xi)+o(1)}
 \sum_{w'}\frac1{w'}\sum_{w\ne w'}\frac1{A_{w,w'}}.
```

We show that the displayed reciprocal sum saves a fixed power
of $`X`$.

### Rational ratios of two cofactors

Write $`g_N=\gcd(N_w,N_{w'})`$ and $`g_a=\gcd(a_w,a_{w'})`$.
The gcd in the definition of $`A_{w,w'}`$ is $`g_N g_a`$
because $`\gcd(N_w,a_w)=\gcd(N_{w'},a_{w'})=1`$.
Also $`\gcd(t_w,b_w)=1`$, by the retained gcd condition.
Take $`0<\varepsilon<\min(c/2,\zeta/10)`$ and later take
$`\xi`$ sufficiently small in terms of $`\varepsilon`$.

First suppose $`g_N g_a<X^{3c-\varepsilon}`$. For each
fixed $`w'`$, there are $`X^{o(1)}`$ possible choices of
the divisors $`g_a\mid a_{w'}`$ and $`u_1,u_2\mid N_{w'}`$
such that $`u_1u_2=g_N`$, $`u_1\mid t_w`$, and $`u_2\mid b_w`$.
They are pairwise coprime. The pair $`(t_w,b_w)`$ is a primitive
integer point in the lattice specified by these two divisibilities
and by $`b_w-t_w\equiv0\pmod{g_a}`$. The lattice has
determinant $`u_1u_2g_a`$, by the Chinese remainder theorem.
In a centered box of side length $`O(L)`$ a planar lattice
of determinant $`D_0`$ has $`O(1+L^2/D_0)`$ primitive integer
points. Indeed, if the points lie on one line through the
origin, there are at most two. Otherwise a shortest nonzero
lattice vector has length $`l\ll L`$ and belongs to a basis.
The lattice lies on parallel lines in that direction at spacing
$`D_0/l\ll L`$, since there is a point off the line through the
origin. Counting lines and then points on each gives $`O(L^2/D_0)`$.

Here $`L\ll X^{c+O(\xi)}`$, and
$`1/A_{w,w'}=g_N g_a/(N_w a_{w'})`$ with
$`N_w a_{w'}=X^{3c+O(\xi)+o(1)}`$. Consequently the inner
sum in this range is at most
$`X^{-c+O(\xi)+o(1)}+X^{-\varepsilon+O(\xi)+o(1)}`$,
uniformly in $`w'`$. The outer reciprocal sum over $`w'`$ costs
at most $`O(\log X)`$.

Now suppose $`g_N g_a\ge X^{3c-\varepsilon}`$. The numerator
and denominator of each reduced ratio
$`\alpha=a_w/a_{w'}`$ and $`\lambda=N_w/N_{w'}`$ are
$`O(X^{\varepsilon+O(\xi)+o(1)})`$. Write $`w'=jz`$ where
$`j\ge X^\zeta`$ is a prime coprime to $`z`$, and let $`S=\sigma(z)`$.
For each fixed $`z,\alpha,\lambda`$, the identity
$`(2t_w+a_w)^2=a_w^2+4N_w`$ gives

```math
 d^2(2t_w+a_w)^2
  =\alpha^2((S-z)j+S)^2+4\lambda zS\,j(j+1).
```

This polynomial in $`j`$ has discriminant
$`16\lambda z^2 S^2(\lambda-\alpha^2)`$.
If $`\lambda=\alpha^2`$, we have
$`t_w(t_w+a_w)/a_w^2=t_{w'}(t_{w'}+a_{w'})/a_{w'}^2`$,
so $`t_w/a_w=t_{w'}/a_{w'}`$ by monotonicity. Both fractions
are reduced, giving $`w=w'`$, which has already been treated.

Otherwise the square condition on the right gives at most
$`X^{o(1)}`$ choices of $`j`$ for fixed $`z,\alpha,\lambda`$.
For completeness, clear denominators by multiplying both sides
by a square, giving $`y^2=P j^2+Q_0 j+R_0`$ with integer
coefficients of polynomial size in $`X`$, $`P>0`$, and nonzero
discriminant $`N=Q_0^2-4P R_0`$. Completing the square
gives $`(2Pj+Q_0)^2-P(2y)^2=N`$. If $`P`$ is a square,
factor and use the divisor bound. Otherwise, remove the
square part of $`P`$ and work in the ring of integers of the
real quadratic field with the resulting squarefree radicand.
An algebraic integer of norm $`N`$ generates an ideal dividing
$`(N)`$, with only $`X^{o(1)}`$ possibilities by unique ideal
factorization. Within one ideal, generators differ by units.
Their absolute values at one real embedding lie between
$`X^{-O(1)}`$ and $`X^{O(1)}`$ because both embeddings are
polynomially bounded and the product is the nonzero norm.
A unit of absolute value greater than one has absolute value
at least the golden ratio, by its integral trace and norm
$`\pm1`$. Thus only $`O(\log X)`$ generators in the given
range occur per ideal. This is the usual quadratic norm
argument for [generalized Pell equations](https://math.stanford.edu/~conrad/154Page/handouts/genpell.pdf),
with the bound uniform since the radicand is of polynomial size.

There are $`O(X^{c-\zeta+O(\xi)})`$ choices of $`z`$ and at most
$`X^{4\varepsilon+O(\xi)+o(1)}`$ choices for the two ratios.
Each $`w'`$ and the ratios determine $`w`$ uniquely, since
$`t_w(t_w+a_w)=N_w`$ is increasing in positive $`t_w`$ with
$`a_w`$ fixed. Thus the sum over these pairs, using
$`1/w'\le X^{-c+O(\xi)}`$ and $`1/A_{w,w'}\le1`$, is at most
$`X^{-\zeta+4\varepsilon+O(\xi)+o(1)}`$.
This completes the required power saving in both ranges.

The diagonal and small-modulus terms give $`O(X)`$, and the
intermediate and large-modulus terms give $`o(X)`$, even after
summing over $`d\le\log X`$. The second moment in each box is
therefore $`O(X)`$. Cauchy–Schwarz proves the preimage statement
after the discarded upper proportion is taken arbitrarily small.

## Added density

The family $`\mathcal E`$ overlaps $`\mathcal B`$ whenever
$`q>rw`$. The added inputs satisfy $`p>\sqrt n`$ and $`q\le rw`$,
so they are also disjoint from the
[covered family below the square root](SMALL-COFACTOR.md#refinement-using-the-cofactor-and-prime-exponents).
For the density on $`X/2<n\le X`$ use $`u,v,t`$ for the logarithmic
exponents of $`w,r,q`$ with respect to $`X`$. The region is

```math
 0\le u\le 1/14,\quad
 3u\le v\le (1/2-u)/2,\quad
 v\le t\le \min(v+u,1/2-v-u).
```

Away from the boundary, the prime number theorem gives
$`(1+o(1))X/(2qrw(1-u-v-t)\log X)`$ possible $`p`$ for each
$`q,r,w`$. Partial summation in the integer $`w`$ and the two
primes gives the density

```math
 \int_0^{1/14}\int_{3u}^{(1/2-u)/2}
          \int_v^{\min(v+u,1/2-v-u)}
     \frac{dt\,dv\,du}{t v(1-u-v-t)}
      =0.01502759\ldots \,.
```

The bounds in the reduction control the strip near $`u=0`$;
away from that strip, the integrand is bounded and the
other boundary strips cost a vanishing proportion. Summing
the dyadic intervals gives the natural density. Taken
together, the proved families have natural density
approximately $`53.46\%`$.
