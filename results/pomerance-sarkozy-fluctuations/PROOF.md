# Pomerance–Sárközy fluctuation conjecture

Let $`\omega(m)`$ be the number of distinct prime divisors of $`m`$, and write
```math
g(n)=\#\{m\le n:m+\omega(m)>n\}.
```
This is the function of [Erdős, Pomerance and Sárközy, *On locally repeated values of certain arithmetic functions. III*, Proc. Amer. Math. Soc. 101 (1987), 1–7](https://combinatorica.hu/~p_erdos/1987-15.pdf), §3, pp. 5–6. Their Theorem 3.2 gives the normal order $`\log\log n`$. Immediately afterwards, Pomerance and Sárközy propose the smaller-scale statement
```math
g(n)=\log\log n+o(\sqrt{\log\log n})
```
on a set of density one, contrasting it with Erdős’s proposed normal fluctuations at the square-root scale.

**Theorem.** For a uniform integer $`n\in[1,X]`$, as $`X\to\infty`$,
```math
\frac{g(n)-\log\log n}{(\log\log n)^{1/4}}
\ \Longrightarrow\ \mathcal N(0,\pi^{-1/2}).
\tag{1}
```
The finitely many small integers for which the normalization is not defined may be ignored. The second parameter denotes variance. Thus Pomerance and Sárközy’s refinement holds on a set of density one, and the square-root normalization instead converges to the point mass at zero.

## 1. Two elementary tail bounds

Put $`L=\log\log X`$ and let $`n`$ be uniform on the integers $`[\lceil\sqrt X\rceil,\lfloor X\rfloor]`$; removing the smaller integers costs only $`o(1)`$ in probability. For $`n`$ in this range $`\log\log n=L+O(1)`$, which does not affect the normalization in (1).

For any set of primes $`\mathcal P\subseteq[2,X]`$ write $`\omega_{\mathcal P}(m)=\sum_{p\in\mathcal P}\mathbf 1_{p\mid m}`$ and $`\mu_{\mathcal P}=\sum_{p\in\mathcal P}1/p`$. For every integer $`a\ge1`$ and every shift $`h\ge0`$,
```math
\Pr\bigl(n-h\ge1,\ \omega_{\mathcal P}(n-h)\ge a\bigr)
\le 2\frac{\mu_{\mathcal P}^a}{a!}
\le 2\left(\frac{e\mu_{\mathcal P}}a\right)^a.
\tag{2}
```
Indeed, count all multiples up to $`X`$ of the products of $`a`$ distinct primes in $`\mathcal P`$, bound each count by $`X`$ divided by the product, and divide by the sample size, which is at least $`X/2`$ for large $`X`$.

For $`n>1`$, the term $`m=n`$ in $`g(n)`$ always contributes one. The other terms have $`h=n-m\ge1`$ and count exactly when $`\omega(n-h)>h`$. Take $`H=\lfloor10L\rfloor`$. By (2) for all primes and $`\mu=L+O(1)`$, the probability that *any* $`h>H`$ contributes is bounded by
```math
\sum_{h>H}2\bigl(e(L+O(1))/h\bigr)^h=o(1).
\tag{3}
```
We can therefore truncate to $`1\le h\le H`$.

Let $`y=L^6`$, $`z=X^{1/L^6}`$, and $`w(m)=\omega_{\{y<p\le z\}}(m)`$. By Mertens’ theorem the primes outside this range up to $`X`$ have reciprocal sum $`O(\log L)`$. Choose a sufficiently large absolute $`C`$ and let $`B=\lceil C\log L\rceil`$. By (2) and the union bound over $`h\le H`$,
```math
\Pr\bigl(\exists,1\le h\le H:\omega(n-h)-w(n-h)>B\bigr)=o(1).
\tag{4}
```

## 2. Independent Poisson approximation on the growing window

With $`\lambda=\sum_{y<p\le z}1/p=L+O(\log L)`$, we prove that the law of $`(w(n-h))_{1\le h\le H}`$ has total-variation distance $`o(1)`$ from $`H`$ independent Poisson random variables of mean $`\lambda`$.

Consider the finite incidence set $`I=\{(h,p):1\le h\le H,\ y<p\le z\}`$ of size $`M`$. The arithmetic random subset $`U`$ consists of the indexed divisibilities $`p\mid n-h`$. In the independent-prime model $`V`$, for each $`p`$ choose a uniform residue modulo $`p`$, independently across primes, and include $`(h,p)`$ when the residue is $`h`$. Since $`p>y>H`$, two different incident shifts for the same prime are incompatible in either model. For any $`S\subseteq I`$ with no incompatible incidences, the Chinese remainder theorem gives
```math
\left|\Pr(S\subseteq U)-\Pr(S\subseteq V)\right|\le \frac{2}{X}
\tag{5}
```
for large $`X`$: the arithmetic event is one residue class modulo the product of the primes, which differs from its uniform proportion by at most one count divided by the sample size. The inclusion probabilities for incompatible subsets both vanish.

To pass from (5) to total variation, take $`R=\lfloor L^3\rfloor`$. For any $`|S|\le R`$, Bonferroni approximates the atom $`\Pr(U=S)`$ by
```math
\sum_{\substack{S\subseteq T\subseteq I\\|T|\le R}}
(-1)^{|T|-|S|}\Pr(T\subseteq U),
```
with absolute error at most $`\sum_{T\supseteq S,\ |T|=R+1}\Pr(T\subseteq U)`$. The same is true for $`V`$. In the sum over all $`S`$ of atom differences, each term for a fixed $`T`$ occurs at most $`2^{|T|}`$ times. The probabilities of the ignored atoms $`|S|>R`$ are at most $`\sum_{|T|=R+1}\Pr(T\subseteq U)`$ and the analogous expression for $`V`$. The total contribution from the CRT errors, including comparison of these remainders, is
```math
O\bigl((2M+1)^{R+1}/X\bigr)=o(1);
```
indeed, $`M\le Hz`$ and $`(R+1)\log(2M+1)=o(\log X)`$. The remaining model remainders are at most
```math
(2^{R+2}+2)\sum_{|T|=R+1}\Pr(T\subseteq V)
\le (2^{R+2}+2)\frac{(H\lambda)^{R+1}}{(R+1)!}=o(1).
```
In the inequality count compatible $`T`$ by products of their individual weights $`1/p`$, then bound by the power sum over every incidence, allowing repetition and dividing by $`(R+1)!`$. Since $`H\lambda=O(L^2)`$, the last limit follows. This proves $`d_{\rm TV}(U,V)=o(1)`$.

For one prime $`p`$, the law of the $`H`$ model indicators has no simultaneous ones and has singletons with probability $`1/p`$ each. Its total-variation distance from $`H`$ independent Bernoulli$`(1/p)`$ indicators is $`O(H^2/p^2)`$: the latter's multi-one mass is at most $`\binom H2p^{-2}`$, and its singleton probabilities differ by at most $`(H-1)/p^2`$ apiece; the empty-event difference is bounded by the sum of these discrepancies. Summing over primes gives $`O(H^2/y)=o(1)`$. Replacing each independent Bernoulli$`(1/p)`$ by an independent Poisson$`(1/p)`$ variable changes the law by total variation at most $`O(H\sum_{p>y}p^{-2})=o(1)`$, since these one-dimensional laws differ by $`O(p^{-2})`$. Summation in each of the $`H`$ coordinates produces the claimed independent Poisson law.

This is a truncated, growing-window use of the Kubilius-model principle. The direct Bonferroni argument above supplies the needed uniform dimension rather than relying on a fixed-shift joint Erdős–Kac theorem.

## 3. The error in the exceptional-offset count is smaller than the claimed scale

Consider
```math
g_0(n)=1+\sum_{h=1}^H\mathbf 1_{w(n-h)>h}.
```
Outside the event of probability $`o(1)`$ in (3)–(4), the difference $`g(n)-g_0(n)`$ is bounded above by the number of $`h\le H`$ for which $`|w(n-h)-h|\le B`$. For independent Poisson variables $`Z_h`$ of the same mean $`\lambda`$, the expected value of their analogous count is
```math
\sum_{h=1}^H \Pr(|Z_h-h|\le B)
\le \sum_{h\in\mathbb Z}\Pr(|Z_1-h|\le B)=2B+1.
```
Thus the model count is $`o_{\mathbb P}(L^{1/4})`$ by Markov’s inequality. Total variation from §2 transfers the probability statement to the arithmetic count. Consequently
```math
g(n)=g_0(n)+o_{\mathbb P}(L^{1/4}).
\tag{6}
```

## 4. Gaussian law and variance

By §2, $`g_0(n)`$ has vanishing total-variation distance from
```math
G=1+\sum_{h=1}^H\mathbf 1_{Z_h>h}
```
for independent $`Z_h\sim\operatorname{Poisson}(\lambda)`$. Let $`p_h=\Pr(Z_1>h)`$. Since $`\sum_{h\ge0}p_h=\lambda`$, $`p_0=1-e^{-\lambda}`$, and $`\sum_{h>H}p_h=o(1)`$ by the factorial moments of a Poisson variable and $`H\sim10\lambda`$, we obtain $`\mathbb E G=\lambda+o(1)=L+O(\log L)`$.

Write $`t_h=(h-\lambda)/\sqrt\lambda`$. On every compact interval in $`t_h`$, the Poisson central limit theorem gives $`p_h=1-\Phi(t_h)+o(1)`$ uniformly, where $`\Phi`$ is the standard Gaussian distribution function. Chebyshev’s inequality gives $`p_h(1-p_h)\le\lambda/(h-\lambda)^2`$ for $`h\ne\lambda`$, by using $`p_h`$ on the upper side and $`1-p_h`$ on the lower side. The contribution of $`|t_h|>A`$ to $`\sum_{h=1}^H p_h(1-p_h)/\sqrt\lambda`$ is $`O(1/A)`$ for fixed $`A\ge1`$ and large $`\lambda`$. It follows from the Riemann sum that
```math
\frac{\operatorname{Var}(G)}{\sqrt\lambda}
\longrightarrow\int_{\mathbb R}\Phi(t)(1-\Phi(t))\,dt
=\mathbb E[(N_2-N_1)_+]=\frac1{\sqrt\pi},
```
where $`N_1,N_2`$ are independent standard normals. The integral identity is the expected length of $`\{t:N_1\le t<N_2\}`$, whose expectation is the positive-part mean of a centered normal of variance two.

The independent bounded centered Bernoulli summands satisfy the Lindeberg condition because $`\operatorname{Var}(G)\to\infty`$. Their central limit theorem, with $`\mathbb E G-L=O(\log L)=o(L^{1/4})`$, gives $`(G-L)/L^{1/4}\Rightarrow\mathcal N(0,\pi^{-1/2})`$. Equations (6), §2 and $`\log\log n=L+O(1)`$ prove (1). In particular the square-root normalization tends to zero in probability. A standard diagonal choice of cutoffs at successively decreasing error tolerances supplies a single set of natural density one with the stated little-$`o`$ error.

## 5. The second moment

The approximation also yields the second moment suggested by the original authors:
```math
\frac1X\sum_{3\le n\le X}\bigl(g(n)-\log\log n\bigr)^2
\sim \frac{\sqrt{\log\log X}}{\sqrt\pi}.
\tag{7}
```
To justify the transfer, the CRT and Bonferroni errors in §2 are smaller than any negative power of $`L`$, while the categorical-to-Bernoulli and Bernoulli-to-Poisson errors together are $`O(H^2/y)=O(L^{-4})`$. The near-threshold count in §3 has second moment $`O(B^2+1)`$ in the independent model, since its mean is at most $`2B+1`$ and its variance is at most its mean. Its square is bounded by $`H^2`$, so the total-variation error contributes $`O(H^2L^{-4})`$. Choose the constant in $`B`$ so that (4) has probability $`O(L^{-10})`$; the discrepancy in counts over $`h\le H`$ is always at most $`H`$. Lastly by Minkowski's inequality and (2), the $`L^2`$-norm of the count of contributing shifts $`h>H`$ is at most
```math
\sum_{h>H}\Pr(n-h\ge1,\omega(n-h)>h)^{1/2}\ll e^{-cL}
```
for an absolute $`c>0`$. Therefore $`\|g-g_0\|_2=O(\log L)=o(L^{1/4})`$.

The centered truncated counts $`g_0-L`$ and $`G-L`$ have squares bounded by $`O(L^2)`$, so their second moments differ by $`o(1)`$ by total variation. Since $`(\mathbb E G-L)^2=O((\log L)^2)=o(\sqrt L)`$, §4 gives $`\mathbb E (G-L)^2\sim\sqrt L/\sqrt\pi`$. The $`L^2`$-error from comparing $`g`$ and $`g_0`$, and the bounded centering change from $`L`$ to $`\log\log n`$ on $`[\sqrt X,X]`$, preserve this asymptotic. Restoring the omitted integers $`3\le n<\sqrt X`$ has negligible contribution: the truncated count on these integers is bounded by $`1+H`$, the center is $`O(L)`$, and the same Minkowski tail bound holds for a uniform $`n\in[1,X]`$, by the same proof of (2). This proves (7).

## Literature and scope

- The exact primary statement is in [Erdős–Pomerance–Sárközy (1987), §3, p. 6](https://combinatorica.hu/~p_erdos/1987-15.pdf). The exact function is defined on p. 5 immediately after §3 opens. This note resolves the Pomerance–Sárközy fluctuation hypothesis and identifies the smaller limiting scale; it does not address their separate conjectures on the minimum $`g(n)=1`$ infinitely often, the maximal order, or an asymptotic for the exact collision count of $`m+\omega(m)`$.
- [Mangerel, *On the bivariate Erdős–Kac theorem and correlations of the Möbius function*](https://doi.org/10.1017/S0305004119000288) develops a bivariate Kubilius model for additive prime-factor counts; fixed two-shift convergence is not the all-$`H`$-shift assertion used here. The proof provides its own direct truncated incidence argument. [Ford, *A Kubilius model for sieve-theoretic sequences*](https://doi.org/10.1007/s10476-026-00178-w) is related total-variation technology.
- Searches for the exact function, the fluctuation dispute, and later references to §3 revealed the authors’ initial normal-order theorem and neighboring results on exact collisions, not an earlier proof of this quarter-power limit or the density-one refinement. That is a bounded priority check, not an absolute claim.
