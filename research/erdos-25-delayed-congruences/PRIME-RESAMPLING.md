# Erdős’s logarithmic density conjecture for delayed congruences

**An unbounded-denominator regime.** Choose $0\le a_i<n_i$ and put $w_i=n_i/\gcd(a_i,n_i)$, with $w_i=1$ for $a_i=0$. Define $`W(X)=\mathop{\mathrm{lcm}}\{w_i:n_i\le X\}`$. If $W(X)=o(\log\log X)$, then the delayed exclusions in [Erdős Problem 25](https://www.erdosproblems.com/25) have logarithmic density equal to the limit of the undelayed finite-prefix densities. This condition allows genuinely unbounded denominators. For example, it suffices that all $w_i$ are powers of one fixed prime and $w_i=O((\log\log(n_i+10))^{1-\epsilon})$ for some $\epsilon>0$. The moduli and any prime powers in $n_i/w_i$ remain unrestricted. This does not establish density when the reduced denominators grow arbitrarily.

The proof is different from the [finite-template argument](AFFINE-RESIDUES.md): it gives a uniform finite-family harmonic upper bound by multiplying by a random prime, and uses monotonicity only after freezing a residue coordinate.

## Separate divisibility from the residue coordinate

Fix $X$ and consider the finite family with $n_i\le X$, ignoring the activation delay temporarily. Write $W=W(X)$, $`S=\{p:p\mid W\}`$, and let $\mathcal G=(\mathbb Z/W\mathbb Z)^\times$ (the trivial group if $W=1$). For a positive integer $m$, split $m=v z$ with $v$ supported on $S$ and $(z,W)=1$. Write $c_m=z\bmod W$.

Set $d_i=n_i/w_i$, $a_i=d_i r_i$, and factor $d_i=v_i e_i$ with $v_i$ supported on $S$ and $(e_i,W)=1$. Then $m\equiv a_i\pmod{n_i}$ is equivalent to
```math
 v_i\mid v,\qquad e_i\mid z,\qquad
 (v/v_i)c_m e_i^{-1}\equiv r_i\pmod{w_i}.
```
Indeed $d_i\mid m$ is necessary and the remaining test is $m/d_i\equiv r_i\bmod w_i$. The inverse is defined because $w_i\mid W$ and $(e_i,W)=1$. For an arbitrary group element $c$, let $F(m,c)$ indicate that these conditions hold for some $i$ with $c$ in place of $c_m$. For fixed $v,c$, this is an increasing function of the valuations of $z$ outside $S$: only the tests $e_i\mid z$ depend on those valuations. The desired indicator is $F(m,c_m)$.

## One-prime comparison

Let $H_X=\sum_{n\le X}1/n$ and choose $N$ on $[1,X]$ with mass $1/(nH_X)$. Let $\mathcal P$ be a finite set of primes above $W$, with maximum at most $Z$, and put
```math
 \lambda=\sum_{p\in\mathcal P}p^{-1},\qquad
 \lambda_g=\sum_{\substack{p\in\mathcal P\\p\equiv g\bmod W}}p^{-1}.
```
Independently choose $P$ in this set with mass $1/(p\lambda)$. Multiplication by $P$ leaves the $S$-part fixed, so $F(N,c_N)\le F(NP,c_N)$. Let $Y=XZ$, and for each $g$ let $K_g(m)$ count the primes in $\mathcal P$ dividing $m$ and lying in class $g$. For a given product $m=np$, the joint weight is $1/(mH_X\lambda)$, independent of its prime factor $p$. Dropping the restriction $m/p\le X$ and using $c_N=c_m g^{-1}$ proves
```math
 \mathbb E_{H_X}F(N,c_N)
 \le \frac{H_Y}{H_X}\,
   \mathbb E_{H_Y}\left[\frac1\lambda
       \sum_{g\in\mathcal G}K_g(m)F(m,c_mg^{-1})\right].
```

Under independent geometric prime valuations with tails $\Pr(V_p\ge e)=p^{-e}$ for $p\le Y$, condition on their product being at most $Y$ to obtain the harmonic measure on $[1,Y]$. This conditioning event has probability $H_Y\prod_{p\le Y}(1-1/p)$, bounded below by an absolute positive constant by [Mertens's product theorem](https://arxiv.org/abs/2002.03361). Before conditioning, the mean of $K_g$ is $\lambda_g$ and the variance is at most $\lambda_g$. Therefore
```math
 \frac1\lambda\sum_g\mathbb E_{H_Y}|K_g-\lambda_g|
 \ll\frac1\lambda\sum_g\sqrt{\lambda_g}
 \le \sqrt{\frac{\varphi(W)}{\lambda}}.
```
It follows that replacing $K_g/\lambda$ by $1/\varphi(W)$ in the expectation costs at most a constant times this square root plus $\sum_g|\lambda_g/\lambda-1/\varphi(W)|$. After the replacement $c_m g^{-1}$ is uniform on $\mathcal G$ for every fixed $m$. Write $\bar F(m)$ for the resulting average of $F(m,c)$ over $c$.

## The decorrelated expectation and the prime window

For a fixed $S$-part $v$, each $F(m,c)$ is increasing in the remaining prime valuations. The product cutoff in the harmonic law is decreasing in these valuations. Product-measure association therefore bounds the conditional paired expectation by the same average without the cutoff, with the $S$-part still fixed. This is just the inequality $\mathbb E[f\mid A]\le\mathbb E f$ for increasing $f$ and a decreasing event $A$ under independent coordinates. It follows from the one-coordinate covariance identity and induction over the coordinates.

Write $R=\prod_{p\mid W}p$. The harmonic probability of a given $S$-part $v\le Y$ is
```math
 \frac{1}{vH_Y}\sum_{\substack{z\le Y/v\\(z,R)=1}}\frac1z
 \le\frac{\varphi(R)}{Rv}
 + O\left(\frac{\tau(R)(1+\log R)}{v\log Y}\right).
```
For the bound use inclusion-exclusion over $R$ and $H_{\lfloor t\rfloor}=\log t+O(1)$ for $t\ge1$; arguments $t<1$ contribute no more than the same recorded error because their missing logarithm has size at most $\log R$. Summing errors over $S$-supported $v$ costs $O(\tau(R)(1+\log R)R/(\varphi(R)\log Y))$.

Under Haar measure on the profinite integers, the $S$-valuations are independent with these geometric laws. Given them, the residue of the unit part after division by $v$ is uniform on $\mathcal G$ and independent of the valuations outside $S$. This follows in each $p$-adic coordinate by uniformity on the units after conditioning on the exact valuation; dividing out the other primes in $v$ only permutes its units. Outside $S$ only the finite primes dividing the generators $e_i$ matter. The corresponding expectation is exactly the natural density $\beta_X$ of the finite undelayed union. This proves
```math
 \mathbb E_{H_Y}\bar F
 \le \beta_X+
 O\left(\frac{\tau(R)(1+\log R)R}{\varphi(R)\log Y}\right).
```

Finally put $L=\log\log X$ and use all primes in $`(\exp(L^2),\,Z]`$, with $Z=\exp(\sqrt{\log X})$. For $W=o(L)$, the [Siegel–Walfisz prime number theorem](https://annals.math.princeton.edu/wp-content/uploads/annals-v161-n3-p11.pdf), by partial summation, gives $\lambda\sim L/2$ and $\sum_g|\lambda_g/\lambda-1/\varphi(W)|=o(1)$. In detail the reciprocal sum in each class is the common logarithmic-integral main term divided by $\varphi(W)$ plus $O(e^{-cL/2})$, uniformly: all prime cutoffs are at least $\exp(L^2)$ and $W$ is less than their logarithm. All remaining errors tend to zero and $H_Y/H_X=1+o(1)$. The harmonic mass of the delayed exclusions up to $X$ is bounded by that of the undelayed prefix, and hence by $\beta_X+o(1)$ after normalization. Every fixed delayed prefix gives the matching lower limit, since it differs from its periodic union on only finitely many integers.

Finite unions of families covered by this criterion retain the finite-prefix approximation, as do finitely many fixed integer translations of such families. For translations one uses the same undelayed-prefix upper bound after translating the summation variable; the weight changes by a summable error and the cutoff by a fixed amount. Finite unions are then handled by summing the upper logarithmic masses of the errors after finite truncation.
