# The pointwise average-degree occupancy bound

With the notation of the [variance proof](PROOF.md), let $`0\lt t\le1`$ and let $`G`$ be any finite nonempty triangle-free graph of average degree $`d`$. Put $`a=\alpha(t)`$. Then

```math
a\ge \frac{W(td)-W(2t)}{d-2}.
```

At $`d=2`$ the quotient has its continuous value $`t e^{-W(2t)}/(1+W(2t))`$. This proves Conjecture 12 redux of Buys, van den Heuvel and Kang. A single catalogue entry covers both this statement and its asymptotic consequence at fugacity one. [Primary question](https://arxiv.org/pdf/2503.10002v2#page=10)

## A differential lower bound for occupancy

Write $`V=\mathop{\mathrm{Var}}_t(|I|)/n`$, $`B=t/\log(1+t)`$, $`f=\log(t/a)`$ and $`z=\log(t(1-a)/a)`$. The proved score bound is $`V\ge a/D`$ for $`D=1+t+Bz`$, and differentiation with respect to $`\log t`$ gives $`\dot a=V`$ and $`\dot F=a`$ for $`F=n^{-1}\log Z_G`$. Single-site conditioning gives $`a\le t/(1+t)`$, so $`z\ge0`$ and $`f\ge-\log(1-a)\ge a`$. We use $`1\le B\le1+t/2`$. The upper bound follows from $`\log(1+t)\ge2t/(2+t)`$ by differentiation.

**Occupancy bound.** For $`d>0`$ at least one vertex has a neighbor of positive occupation probability. Hence $`a\lt t/(1+t)`$ and $`z>0`$ for every positive $`t`$. Since $`1/(1-a)=1+t e^{-z}`$, the variance bound gives

```math
\dot z=1-\frac{V}{a(1-a)}
\le\frac{t(1-e^{-z})+Bz}{1+t+Bz}.
```

Substitution into the ordinary derivative of $`\log(ze^z/t)`$ yields

```math
\frac{d}{dt}\log(ze^z/t)
\le \frac{H(z)+(B-1)/t}{1+t+Bz},\qquad
H(z)=\frac{1-(1+z)e^{-z}}{z}.
```

In the integral representation $`H(z)=z^{-1}\int_0^z u e^{-u}\,du`$, bounding the integrand by $`u`$ and separately by $`1/e`$ gives $`2H(z)\le z`$ and $`H(z)\le1/2`$. Thus $`(2+t)[H(z)+(B-1)/t]\le z+t/2+1+t/2\le1+t+Bz`$.

There are $`\binom n2-nd/2`$ independent vertex pairs. The first three coefficients of $`Z_G(t)`$ therefore give $`a=t-(d+1)t^2+O_G(t^3)`$ and $`z/t\to d`$ at zero. Integrating the derivative bound $`1/(2+t)`$ from zero gives $`ze^z\le dt(1+t/2)`$. Consequently

```math
a\ge\frac{t}{t+\exp(W(td(1+t/2)))} .
```

For $`d=0`$, $`a=t/(1+t)`$ gives this inequality directly.

## Comparing with the proposed bound

Let $`x=W(td)`$ and $`y=W(2t)`$, so $`t=ye^y/2`$. Introduce the divided differences

```math
 Q=\frac{x e^x-y e^y}{x-y},\qquad
 J=\frac{e^{-y}-e^{-x}}{x-y}
   =\int_0^1e^{-(1-s)y-sx}\,ds .
```

Use their continuous values at $`x=y`$. In particular $`Q=(1+y)e^y`$ there. The proposed bound is $`a_0=t/Q`$. The formulas give $`Q/e^x=1+2tJ`$. We split at $`X=9/4`$ and use $`Y=853/1000`$ as a rational upper bound on $`y`$.

### When $`x\le X`$

It suffices to show

```math
 I(x,y)=2J-e^{-x}-\frac{x}{2(1+x)}\ge0.
```

Indeed, $`u\mapsto \exp(W(u))`$ has derivative $`1/(1+W(u))`$, which decreases on the nonnegative half-line. Its tangent at $`xe^x`$ therefore gives $`\exp(W(xe^x(1+t/2)))\le e^x(1+tx/[2(1+x)])`$. If the displayed test holds, $`Q/e^x=1+2tJ\ge t e^{-x}+1+t x/[2(1+x)]`$. The occupancy lower bound above now gives $`a\ge t/Q`$, including at $`x=0`$.

The integral formula shows that $`I`$ decreases in $`y`$. Its derivative in $`x`$ is nonpositive if

```math
2\int_0^1 s e^{(1-s)(x-y)}\,ds+\frac{e^x}{2(1+x)^2}\ge1 .
```

For $`x\ge y`$ the integral term alone is at least one. For $`0\le x\le y\le1`$ the exponential tangent bounds that term below by $`1-(y-x)/3`$. The remaining term is at least $`1/[2(1+x)]\ge(1-x)/3\ge(y-x)/3`$. Hence $`I(x,y)\ge I(X,Y)`$ for $`x\le X`$ and $`y\le Y`$.

For completeness, $`Y e^Y>2`$, $`e^Y<47/20`$ and $`e^{-X}<53/500`$. These three rational bounds imply $`y\le W(2)\lt Y`$ and

```math
 I(X,Y)>
 \frac{2(20/47-53/500)}{9/4-853/1000}
 -\frac{53}{500}-\frac{9}{26}
 =\frac{2262199}{426783500}>0.
```

To verify the exponential bounds, let $`S_7(v)=\sum_{i=0}^7 v^i/i!`$. Rational arithmetic gives $`Y S_7(Y)>2`$, $`S_7(X)>500/53`$, and $`S_7(Y)+Y^8/[8!(1-Y/9)]<47/20`$. The final expression bounds $`e^Y`$ from above by summing a geometric majorant for the Taylor tail. [Exact arithmetic check](verify_pointwise.py)

### When $`x\ge X`$

Fix the graph and allow $`t`$ to increase through $`(0,1]`$. If $`x=W(td)`$ reaches $`X`$, the preceding argument gives $`a\ge a_0`$ at that first fugacity. In this range $`x>y`$, $`Q\ge e^x`$, and $`Q-t>1`$. Put $`g=\log(Q-t)`$, so $`a_0=t/(t+e^g)`$. The identity $`\dot x=x/(1+x)`$, and its analogue for $`y`$, yield

```math
\frac{\dot a_0}{a_0}=\frac{1}{(1+x)(1+y)},\qquad
\dot g=1-\frac{1+t e^{-g}}{(1+x)(1+y)}.
```

Indeed $`a_0=(x-y)/(d-2)`$ and $`x/(1+x)-y/(1+y)=(x-y)/[(1+x)(1+y)]`$. The high range has $`d>2`$. At lower degrees the preceding low-range argument already includes the derivative interpretation of the divided difference at $`d=2`$.

At a possible contact $`z=g`$, the variance bound from the first section gives

```math
\dot z\le 1-\frac{1+t e^{-g}}{1+t+Bg}.
```

We claim $`1+t+Bg<(1+x)(1+y)`$. To bound $`g`$, write $`Q/e^x=1+yh`$ with $`h=\int_0^1 e^{-(x-y)s}\,ds`$. Convexity bounds $`h`$ by the mean of its endpoint values. Since $`t=ye^y/2`$, this gives $`Q-t\le e^x(1+y/2)`$, hence $`g\le x+y/2`$. We have $`B-1\le t/2=ye^y/4`$ and $`B\le3/2`$. Consequently

```math
(1+x)(1+y)-1-t-Bg
 \ge y\left[x(1-e^y/4)+1-e^y/2-3/4\right].
```

Because $`e^y<47/20`$ and $`x\ge9/4`$, the bracket is at least $`(9/4)(33/80)-37/40=1/320`$. Thus $`\dot z<\dot g`$ at any contact. At entry $`z\le g`$; a strictly negative derivative of $`z-g`$ at every zero prevents it from crossing upward. It follows that $`a=t/(t+e^z)\ge t/(t+e^g)=a_0`$ throughout the high range. This proves the complete pointwise inequality.

The proof in this file uses the score variance bound and the initial graph coefficients. The partition-function theorem is used in the [separate entropy proof](PROOF.md) of the originally tracked asymptotic statement.
