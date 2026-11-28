# Erdős’s logarithmic density conjecture for delayed congruences

**A larger unbounded-denominator regime.** Let $w_i=n_i/\gcd(a_i,n_i)$ and $`W(X)=\mathop{\mathrm{lcm}}\{w_i:n_i\le X\}`$, as in the [one-prime theorem](PRIME-RESAMPLING.md). Write $L=\log\log X$. The delayed survivor set has logarithmic density, equal to its finite-periodic limit, under the weaker assumption
```math
 \log W(X)=o(\sqrt L\,\log L).
```
In particular $W(X)$ can exceed every fixed power of $\log\log X$. No restriction is placed on the unshifted factors of the moduli. This remains a partial result on the full [Erdős problem](https://www.erdosproblems.com/25).

## A weighted subset comparison

Keep the notation $F(m,c)$, $c_m$, $\mathcal G$ and $S$ of the one-prime theorem. Let $\mathcal P$ be a prime window disjoint from $S$, with $u_p=1/p$ and $\lambda=\sum_p u_p$. Fix an integer $k\ge1$. Sample an unordered $k$-element subset $A$ of $\mathcal P$ with probability
```math
 \frac{\prod_{p\in A}u_p}{\Lambda_k},\qquad
 \Lambda_k=\sum_{|A|=k}\prod_{p\in A}u_p.
```
Write $D_A=\prod_{p\in A}p$ and let $Z$ bound all possible $D_A$. Multiplying the harmonic integer $N\le X$ by $D_A$ increases $F$ with its residue argument held fixed. At a product $m=ND_A$, every such representation has the same weight $1/(m H_X\Lambda_k)$. Dropping the condition $m/D_A\le X$ gives the upper bound
```math
 \frac{H_{XZ}}{H_X}
 \mathbb E_{H_{XZ}}\left[
 \sum_{g\in\mathcal G}\frac{K_{k,g}(m)}{\Lambda_k}F(m,c_mg^{-1})\right],
```
where $K_{k,g}(m)$ counts the $k$-subsets of window primes dividing $m$ whose product is $g\bmod W$. Thus it suffices to approximate the entire random vector $(K_{k,g}/\Lambda_k)_g$ in expected $\ell^1$ distance by the uniform vector; the chosen sieve $F$ may vary arbitrarily with $m$ and its residue argument.

## Uniform subset products

As in the one-prime theorem, the harmonic law is the independent geometric law on all primes up to $XZ$ conditioned on an event of probability bounded below. We can bound the expected absolute error before conditioning. The indicators that window primes divide the random integer are then independent Bernoulli variables of parameters $u_p$.

Couple these indicators to independent Poisson variables of means $u_p$. Their joint mismatch probability is $O(\sum_p u_p^2)$, by the elementary single-coordinate Poisson approximation. Regard the Poisson variables as a marked point process. The total point count $K$ is Poisson of mean $\lambda$. Conditional on $K$, its ordered residue labels are independent with distribution $\rho_g=\sum_{p\equiv g}u_p/\lambda$. Independently couple each mark to a uniform label. The probability that any label changes is at most $`\lambda\|\rho-\mathop{\mathrm{Unif}}\|_1/2`$.

For the resulting uniform labels, let $J_{k,g}$ count the $k$-subsets of the $K$ points with product $g$. Conditional on $K$, each subset has uniform product, and distinct subsets have independent products: each has a coordinate absent from the other, and conditioning on all other labels leaves those two coordinates independent uniform. Therefore, with $`\Lambda_k^*=\lambda^k/k!`$,
```math
 \mathbb E\sum_g\left|\frac{J_{k,g}}{\Lambda_k^*}
          -\frac{\binom K k}{|\mathcal G|\Lambda_k^*}\right|
 \le \sqrt{\frac{|\mathcal G|}{\Lambda_k^*}}.
```
Here the conditional variance bound is $\binom Kk/|\mathcal G|$ per class, and $`\mathbb E\binom Kk=\Lambda_k^*`$. The total count itself has small relative fluctuation:
```math
 \frac{\mathbb E\left[\binom{K}{k}^{\!2}\right]}{(\Lambda_k^*)^2}
 =\sum_{j=0}^k\binom kj^2j!\lambda^{-j}
 \le \exp(k^2/\lambda).
```
This is the factorial-moment expansion by the number $j$ of common points. The same unnormalized second moment is an upper bound for the Bernoulli total subset count, because its factorial moments are no larger than those for the Poisson variable.

The normalization ratio $`\Lambda_k/\Lambda_k^*`$ is the probability of drawing distinct primes in $k$ independent trials weighted by $u_p/\lambda$, and differs from one by at most $\binom{k}{2}\sum_p u_p^2/\lambda^2$. On the event that the two couplings make no changes, the two product-count vectors agree before this normalization. On the complementary event, each vector has nonnegative entries and its total mass has bounded second moment whenever $k=o(\sqrt\lambda)$, by the estimates above. Cauchy–Schwarz makes the expected error on that event $O(\sqrt{\Pr(\text{some change})})$. It follows, also after conditioning for the harmonic law, that the required error tends to zero if
```math
 k=o(\sqrt\lambda),\quad |\mathcal G|=o(\lambda^k/k!),\quad
 \sum_p u_p^2+\lambda\|\rho-\mathop{\mathrm{Unif}}\|_1=o(1).
```

## Choose the window and return to the sieve

Take
```math
 k=\left\lceil\frac{4\log W}{\log L}\right\rceil+\lfloor L^{1/4}\rfloor,\qquad
 \exp(\exp(L^{3/4}))\lt p\le\exp\bigl(\sqrt{\log X}/k\bigr).
```
These endpoints are in increasing order for large $X$. Then $Z\le\exp(\sqrt{\log X})$ for subset products, so $H_{XZ}/H_X=1+o(1)$. The prime window has reciprocal sum $\lambda\sim L/2$. The modulus $W$ is smaller than the logarithm of its lower endpoint. Partial summation of the [Siegel–Walfisz estimate](https://annals.math.princeton.edu/wp-content/uploads/annals-v161-n3-p11.pdf) therefore gives the reciprocal-prime mass in each unit class as a common main term plus an error bounded by $\exp(-c\exp(L^{3/4}/2)/2)$, for some $c>0$ and sufficiently large $X$. The summed error remains $o(1)$, and $\sum_p u_p^2=o(1)$ from the lower prime cutoff. The hypothesis on $W$ gives $k=o(\sqrt\lambda)$. Also $\log(\lambda^k/k!)\ge k\log(\lambda/k)\ge 0.4k\log L$ for sufficiently large $X$, giving $`|\mathcal G|\le W=o(\Lambda_k^*)`$.

Replace the count vector in the upper bound by uniform weights. The resulting decorrelated expectation is at most the finite periodic union density plus $o(1)$ by the same geometric-cutoff association and $S$-part estimate as in the one-prime proof. That error is uniform here too, since $W=\exp(o(L))$. The lower bound is supplied by every fixed delayed prefix. This proves the theorem and, by taking logarithmic differences with finite prefixes, also the finite-prefix approximation property.
