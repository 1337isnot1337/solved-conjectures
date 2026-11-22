# The typical range of smooth components, uniformly in the small-prime residues

Let $`s_t(m)`$ be the product of all prime powers in $`m`$ with prime base strictly below $`t`$, and let $`f(n,t)`$ count its distinct values over $`n<m\le n+t`$. [Erdős problem 461](https://www.erdosproblems.com/461) asks for a linear lower bound for **every** $`n`$. The [platform](https://conjectures.io/problems/erdos461-erdos-461) showed a solver estimate of $1,749 and zero attempts at this check. Its estimate is variable. The [forum](https://www.erdosproblems.com/forum/thread/461) gives the upper bound $`1-e^{-\gamma}`$ on the possible uniform coefficient by averaging.

**Theorem.** Given $`0<\varepsilon<1`$, there exist $`\delta,c>0`$ such that, for all sufficiently large $`t`$, one may prescribe **arbitrarily** the starting residues at every prime $`p\le t^\delta`$. Choose the remaining prime residues independently and uniformly modulo the prime powers in the [finite period](README.md). Then
```math
\Pr\left(\left|f(n,t)/t-(1-e^{-\gamma})\right|>\varepsilon\right)
\le 2\exp(-c t^\delta).
```
In particular $`1-e^{-\gamma}`$ is the limiting mean and the limit in probability for the range divided by $`t`$. The concentration estimate is uniform over the prescribed residues. It leaves open the possibility of exceptional starts.

## Model

Write $`y=t^\delta`$. It is convenient to lift each uniformly sampled residue to an independent uniform $`p`$-adic integer. For any fixed site, a uniform coordinate has $`\Pr(v_p\ge k)=p^{-k}`$. All comparisons defining $`f`$ are the same for every lift outside a null set: for distinct sites, equality of two valuations capped at $`e_p=\lceil\log_p t\rceil`$ cannot involve two capped top values, because $`p^{e_p}\ge t`$. Thus one obtains exactly the finite-period law by projecting. The small coordinates may be any fixed ordinary lifts. If a coordinate equals the negative of a site exactly, one can use an ordinary representative avoiding these finitely many equalities. The argument is uniform in the representatives.

For an auxiliary model with all coordinates uniform at one site, denote the smooth component by $`S`$ and put $`C_t=\prod_{p<t}(1-1/p)`$. For each $`t`$-smooth $`d`$ the probability $`\Pr(S=d)=C_t/d`$ by prime independence. Hence with $`H_m=\sum_{j=1}^m1/j`$,
```math
\Pr(S\le x)\le C_t H_{\lfloor x\rfloor},
```
with equality for $`1\le x<t`$. By Mertens' theorem $`C_t\log t\to e^{-\gamma}`$ and $`\sum_{p\le y}\log p/(p-1)=O(1+\log y)`$.

## Deterministic cost of the prescribed coordinates

At site $`i`$ let $`A_i`$ be its component for $`p\le y`$ and $`B_i`$ its component for $`y<p<t`$. At most $`\pi(y)`$ sites attain a capped top value at some small prime. For the capped logarithms, the interval count of multiples of $`p^k`$ is at most $`t/p^k+1`$, whence
```math
\frac1t\sum_{i=1}^t\sum_{p\le y}\min(v_p(n+i),e_p)\log p
\le \sum_{p\le y}\frac{\log p}{p-1}+\frac{2\pi(y)\log t}{t}.
```
For fixed $`0<\eta<1`$, the proportion of sites with $`A_i>t^{\eta/2}`$ is therefore $`O(\delta/\eta)+o(1)`$, uniformly. Call their count $`E`$.

Set $`G_x=\#\{i:B_i>x\}`$. Any full component greater than $`t`$ is unique, since equal components divide the difference of their sites. Each site outside $`E`$ with $`B_i\le t^{1-\eta}`$ has full component at most $`t^{1-\eta/2}`$. Therefore
```math
G_t \le f(n,t)\le G_{t^{1-\eta}}+E+t^{1-\eta/2}.
```

## First moments and concentration

For one site, adjoin an independent small-prime component $`A`$ from the auxiliary model, so $`A B_i`$ has the law of $`S`$. Since $`\mathbb E\log A=O(1+\log y)`$, one gets
```math
\Pr(B_i\le t)
\le \Pr(S\le t^{1+\eta})+\Pr(A>t^\eta)
\le (1+\eta)e^{-\gamma}+O(\delta/\eta)+o(1).
```
Also $`\Pr(B_i\le t^{1-\eta})\ge \Pr(S\le t^{1-\eta})=(1-\eta)e^{-\gamma}+o(1)`$. These estimates bound $`\mathbb E G_t`$ from below and $`\mathbb E G_{t^{1-\eta}}`$ from above.

Replacing one large-prime coordinate can affect only sites in two residue classes modulo $`p`$. For either cutoff it changes $`G_x/t`$ by at most $`2(1/p+1/t)\le4/p`$. The sum of the squares of these bounds is $`O(1/y)`$. The bounded-differences inequality gives a one-sided fluctuation of size $`u`$ probability at most $`\exp(-c_0 u^2 y)`$, for an absolute $`c_0>0`$. Apply its lower tail at the first cutoff and upper tail at the second. Choose $`\eta`$ sufficiently small in terms of $`\varepsilon`$, then $`\delta`$ sufficiently small in terms of both, and take $`u=\varepsilon/4`$. The deterministic bounds finish the proof. Boundedness $`0\le f/t\le1`$ gives the unconditional mean assertion as well.

The exact one-site density is also used in the [previous entropy analysis](entropy-obstruction.md). The new quantifier concerns almost all completions of every prescribed small-prime pattern. A proof excluding the remaining completions would be needed for the bounty.
