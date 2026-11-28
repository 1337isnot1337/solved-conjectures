# Erdős’s logarithmic density conjecture for delayed congruences

**Effective denominators of the divisors actually available.** In the [multiprime theorem](MULTIPRIME-RESAMPLING.md), the least common multiple of *all* reduced residue denominators can be replaced by a bound in probability on a much smaller, integer-dependent least common multiple. This still does not give an unconditional solution of the unrestricted problem.

For the prefix with moduli $n_i\le X$, write $n_i=d_iw_i$ and $a_i=d_i r_i$, with $r_i$ coprime to $w_i$ (allow the trivial class at $w_i=1$). Write $L=\log\log X$. For a positive integer $m$, define
```math
 W_{\rm eff}(m)=\mathop{\mathrm{lcm}}
 \{w_i:n_i\le X,\ d_i\mid m,\ \gcd(m/d_i,w_i)=1\}.
```
Empty least common multiples equal one. Let the valuations of all primes up to $X$ be independent geometric variables with $\Pr(V_p\ge j)=p^{-j}$. It suffices that in this product law there be a deterministic bound $R=R(X)\ge1$ with
```math
 \log R=o(\sqrt L\log L),\qquad
 \Pr(W_{\rm eff}>R)=o(1).
```
The probability involves only primes up to $X$ and is well-defined independently of any size cutoff on the product. Under these conditions, the delayed survivors have logarithmic density equal to the finite-prefix limit. In particular the full least common multiple is not required to be small.

## First truncate invisible denominators

Any hit of an undelayed class with $w_i>R$ implies $W_{\rm eff}(m)>R$, because its quotient is congruent to the unit $r_i$ modulo $w_i$. Under harmonic sampling on $[1,X]$, this exceptional event has probability $o(1)$: the geometric law on primes up to $X$ conditioned on product at most $X$ is the harmonic law, and the conditioning event has probability bounded below by Mertens. Thus one may discard all classes with $w_i>R$ in the prefix at a cost of $o(1)$ in the normalized upper harmonic bound. The replacement union only decreases the finite periodic density.

In the rest of the argument use only the retained prefix, and write $S_X$ for the primes dividing one of its denominators. Then every prime in $S_X$ is at most $R$, so the resampling window is automatically disjoint from $S_X$. Neither a bound on the original prime support nor a bound on the original least common multiple is needed.

## Uniform resampling across small moduli

Let $P$ be a product of $k$ distinct window primes selected with reciprocal product weights as in the [multiprime proof](MULTIPRIME-RESAMPLING.md). Choose
```math
 k=\left\lceil\frac{8\log R}{\log L}\right\rceil+\lfloor L^{1/4}\rfloor,
 \qquad \exp(\exp(L^{3/4}))\lt p\le \exp(\sqrt{\log X}/k).
```
Every window prime is outside $S_X$ and exceeds $R$ for large $X$. Put $Z=\exp(\sqrt{\log X})$ and $Y=XZ$. For every modulus $M\le R$, denote by $V_{m,M}$ the vector that counts the $k$-subsets of the window prime divisors of $m$ by product modulo $M$, divided by their reciprocal-weight normalization $\Lambda_k$. Write $U_M$ for the uniform unit vector. Then
```math
 \mathbb E_{H_Y}\sup_{M\le R}\|V_{m,M}-U_M\|_1=o(1).
```

To see this, use the Poisson comparison and the conditional pairwise independence of uniform subset products from the multiprime proof. The total normalized number of subsets is the same for all moduli, and its expected absolute difference from one is $o(1)$, since $k=o(\sqrt\lambda)$, where $\lambda\sim L/2$ is the reciprocal sum of the prime window. Therefore charge this mass error once. For the deviations of each individual vector from its own total mass times $U_M$, sum the expected errors over $M\le R$ to bound the supremum. The uniform-label centered bound sums to $O(R^{3/2}/\sqrt{\lambda^k/k!})$. The Poisson coupling and the mismatch of prime-residue labels each incur errors whose bounds are exponentially smaller than $R^{-1}$, by the very large lower prime cutoff and uniform Siegel–Walfisz followed by partial summation. The centered bound tends to zero since $\log(\lambda^k/k!)\ge0.4k\log L\ge3.2\log R+0.4\lfloor L^{1/4}\rfloor\log L$ eventually. Conditioning to the harmonic law costs an absolute factor by Mertens, as before.

## Apply the adaptive effective modulus

For $m=NP$, membership of $N$ in an undelayed prefix class implies $d_i\mid m$ and
```math
 (m/d_i)P^{-1}\equiv r_i\pmod{w_i}.
```
This uses that $P$ is a unit modulo each $w_i$, and relaxes the necessary test $d_i\mid N$ to $d_i\mid m$. The congruence is impossible when $\gcd(m/d_i,w_i)>1$. For fixed $m$, the relaxed union therefore depends on the residue of $P$ only modulo $W_{\rm eff}(m)$. The change of variables and its harmonic weight bound are the same as in the multiprime proof. On $W_{\rm eff}\le R$, replace the actual product vector by the uniform vector, using the supremum bound. On the complement, the cost is bounded by its probability plus the expected absolute subset-mass error, hence $o(1)$. The probability hypothesis transfers to $H_Y$: the Bernoulli/geometric law on primes up to $Y$ extends the one up to $X$, and conditioning on product at most $Y$ has probability bounded below. Uniformity modulo the effective modulus is the same as using a uniform multiplier modulo the whole prefix least common multiple and then projecting.

## Comparing the decorrelated model to Haar

Split $m=vz$ with $v$ supported on $S_X$ and $z$ coprime to its primes. After averaging over the multiplier, for each fixed $v$ the relaxed union is increasing in the outside valuations: write $d_i=v_i e_i$ with $v_i$ supported on $S_X$. For a fixed uniform unit phase $c$ replacing $z$ times the inverse multiplier, the eligibility conditions are $v_i\mid v$, $e_i\mid z$, and
```math
 (v/v_i)c e_i^{-1}\equiv r_i\pmod{w_i}.
```
Only $e_i\mid z$ depends on the outside valuations. Product association therefore permits removing the size cutoff conditional on $v$, as in the one-prime proof.

It remains to show the distribution of the potentially large $S_X$-part $v$ is asymptotically unchanged by the harmonic cutoff. In the independent product law on primes up to $Y$, write the random integer as $VT$ with $V$ its $S_X$-part and $T$ independent of $V$. Using the prime number theorem,
```math
 \mathbb E\log V=\sum_{p\in S_X}\frac{\log p}{p-1}
      \ll\log\bigl(\max(S_X\cup\{2\})\bigr)=o(\log Y).
```
Choose $\delta\to0$ slowly so that $V\le Y^\delta$ with probability $1-o(1)$. In the full product law, each $Y$-smooth integer $n$ has probability $n^{-1}\prod_{p\le Y}(1-1/p)$. Hence $\Pr(VT\in[Y^{1-\delta},Y^{1+\delta}])=O(\delta+1/\log Y)$ by the ordinary harmonic bound and Mertens. Independence of $V,T$ then gives $\Pr(T\in[Y^{1-\delta},Y])=o(1)$: when $V\le Y^\delta$, such a $T$ forces $VT$ into that full window. Therefore $`\{T\le Y\}`$ and $`\{VT\le Y\}`$ differ on probability $o(1)$. Both have probability bounded below since the latter does. The first event is independent of $V$, so conditioning on the second changes the law of $V$ by $o(1)$ in total variation.

After discarding the cutoff, the averaged union is exactly the finite periodic Haar density. This follows from uniformity of unit phases given the valuations, and independence of the remaining prime coordinates. Thus the delayed prefix up to $X$ has normalized upper harmonic mass bounded by its finite periodic density plus $o(1)$. Fixed prefixes supply the lower bound, proving the theorem.

## A sufficient condition using just the classes

In the independent valuation model, the probability that a given index is eligible is exactly
```math
 \Pr(d_i\mid m,\ \gcd(m/d_i,w_i)=1)=\frac{\varphi(w_i)}{n_i}.
```
Indeed the divisibility probability is $1/d_i$, and after imposing it the valuations of $m/d_i$ are again independent geometric variables, by memorylessness. Its probability of being coprime to $w_i$ is $\varphi(w_i)/w_i$. Therefore a wholly deterministic sufficient condition for the theorem is
```math
 \sum_{n_i\le X}\frac{\varphi(w_i)\log w_i}{n_i}
 =o\!\left(\sqrt{\log\log X}\,\log\log\log X\right).
```
The expected logarithm of the effective least common multiple is bounded by this sum. Choose a logarithmic threshold tending faster than the sum but still little-oh of the displayed scale, and apply Markov. This sufficient condition can be weaker than control of the global least common multiple; it is not a condition that all systems are known to satisfy.
