# Erdős–Ruzsa conjecture

Erdős Problem 1200 asks whether there is a constant $`K`$ such that for every sufficiently large $`N`$, residue classes $`a_p\bmod p`$, one for each selected prime $`p\le N`$, cover $`[1,N]`$ with $`\sum_p1/p\le K`$. Question 2 in the joint paper asks whether every fixed budget leaves a uniformly positive proportion of survivors. An affirmative answer to that question would disprove the covering conjecture.

The argument below establishes a survivor theorem when there is a common shift on the larger selected primes. The arbitrary-residue conjecture remains open in the sources checked.

## Sources

- [Erdős’s 1980 survey, §6, equation (1″)](https://www.renyi.hu/~p_erdos/1980-03.pdf) gives the covering conjecture. [Erdős–Ruzsa, *On the small sieve. I. Sifting by primes*, p. 386](https://combinatorica.hu/~p_erdos/1980-29.pdf) states the positive-proportion question. Theorem 1 there supplies the survivor bound for zero residues used below.
- [Hildebrand, *Quantitative mean value theorems for nonnegative multiplicative functions II*](https://doi.org/10.4064/aa-48-3-209-260) identifies the sharp asymptotic minimum for the zero-residue problem. Ben Green discusses the arbitrary-residue conjecture after Problem 46 in [*100 Open Problems*](https://people.maths.ox.ac.uk/greenbj/papers/open-problems.pdf). The [2022 Oberwolfach report, open problem 12](https://publications.mfo.de/bitstream/handle/mfo/4000/OWR_2022_50.pdf?sequence=-1) also records it.
- The [Erdős Problems wiki](https://erdosproblems.ai/wiki/research/leads/bounded_cost_prime_covers) gives restrictions on the prime ranges of possible covers and an overlap obstruction. The [working report](https://www.erdosproblemaday.com/report/1200) treats zero residues and small examples. The common-shift theorem below allows the small classes to vary at primes up to a fixed power of the interval length.
- [Granville–Shao, *Bombieri–Vinogradov for multiplicative functions, and beyond the $`x^{1/2}`$-barrier*](https://arxiv.org/abs/1703.06865), Theorem 1.6, supplies distribution in reduced residue classes after removing exceptional primitive characters. [Iwaniec, *Rosser's sieve*](https://doi.org/10.4064/aa-36-2-171-202), Theorem 1, supplies the lower bound with sieve parameter greater than 2.

## Common shift on the larger primes

**Theorem.** Fix $`K,A>0`$ and $`0\lt\theta\lt1/4`$. Let $`P`$ be any set of primes up to $`N`$ with $`\sum_{p\in P}1/p\le K`$ and choose a residue $`a_p\bmod p`$ for each. If there is an integer $`a`$ with $`|a|\le AN`$ such that $`a_p\equiv a\bmod p`$ for every $`p\in P`$ above $`N^\theta`$, then at least $`c(K,A,\theta)N`$ integers of $`[1,N]`$ avoid all the classes for sufficiently large $`N`$.

The lower-prime classes can vary independently, including at primes comparable to $`N^\theta`$. The choice of shift can vary with $`N`$.

### Counting integers with excluded prime factors

Let $`f`$ be completely multiplicative with $`f(p)\in\{0,1\}`$, and suppose that $`\sum_{p\le X:f(p)=0}1/p\le L`$. Put $`F(x)=\sum_{n\le x}f(n)`$, $`g=\mu*f`$ and $`h=|g|`$, where $`*`$ is Dirichlet convolution. Thus $`h`$ is the indicator of squarefree integers supported on the primes excluded by $`f`$. For $`2\le t\le X`$,

```math
\sum_{d\le X}\frac{h(d)}d\le e^L,\qquad
\sum_{d\le t}h(d)\ll_L\frac{t}{\log(2t)}.
```

Indeed, the first bound is an Euler product. Since $`h`$ is supported on squarefree integers,
$`\sum_{d\le t}h(d)\log d\le\sum_{m\le t}h(m)\sum_{p\le t/m}\log p\ll t e^L`$.
The terms $`d\le\sqrt t`$ can be counted trivially. From $`f=1*g`$ one gets $`F(t)/t=\sum_{d\le t}g(d)/d+O_L(1/\log(2t))`$. Partial summation gives

```math
\left|\frac{F(t)}t-\frac{F(s)}s\right|
 \ll_L\frac{1+\log(t/s)}{\log(2s)}
 \qquad(2\le s\le t\le X).
\tag{1}
```

We also need a mean square over small primitive characters. For every fixed $`C>0`$, uniformly as $`x\to\infty`$ with $`x\le X`$,

```math
\sum_{1\lt r\le(\log x)^C}\ \sum_{\psi\bmod r}^{*}
 \left|\sum_{n\le x}f(n)\psi(n)\right|^2=o_{L,C}(x^2).
\tag{2}
```

The star indicates primitive characters. Write $`f=f_0+f_1`$ on $`[1,x]`$, with $`f_0(n)=\sum_{d\mid n,\ d\le x/T}g(d)`$ and $`T=(\log x)^H`$, where $`H>2C+2`$. For each nonprincipal primitive character of conductor $`r`$, the sum against $`f_0`$ is bounded by $`rx/T`$ by completing periods in the inner sum over $`n/d`$. There are $`O((\log x)^{2C})`$ characters to consider. For $`f_1`$,

```math
\sum_{n\le x}|f_1(n)|^2
 \le \sum_{m,m'\le T}\ \sum_{v\le x/[m,m']} h(v)
 \ll_L \frac{x}{\log x}\sum_{m,m'\le T}\frac1{[m,m']}
 \ll_{L,H}\frac{x(\log\log x)^3}{\log x}.
```

Here the cofactor $`m=n/d`$ in a tail term is at most $`T`$. In the product of two tail terms write $`n=[m,m']v`$, where brackets denote the least common multiple. The support condition for $`h(n/m)`$ implies $`h(v)=1`$, and all the inner cutoffs satisfy $`x/[m,m']\ge x/T^2`$. To bound the last double sum, group by $`b=\gcd(m,m')`$, giving the bound $`\sum_{b\le T}b^{-1}(1+\log(T/b))^2`$. The multiplicative large sieve applied to $`f_1`$ now proves (2).

### Distribution over the sieve moduli

Let $`Q`$ be a set of primes with $`\sum_{p\in Q}1/p\le K`$ and let $`\mathcal D`$ contain the squarefree products of primes of $`Q`$, including 1. We have $`\sum_{d\in\mathcal D}1/\varphi(d)\le e^{2K}`$. Fix $`0\lt\delta\lt1/2`$, and choose $`0\lt\epsilon\lt\min(\delta,1/10)`$. In addition to the hypotheses above on $`f`$, assume it is supported on $`x^\epsilon`$-smooth integers and $`f(p)=1`$ for all $`p\in Q`$ up to $`w=(\log x)^{1/2}`$. Then

```math
\sum_{\substack{d\in\mathcal D\\ d\le x^{1/2-\delta}}}
 \max_{(b,d)=1}
 \left|\sum_{\substack{n\le x\\n\equiv b\bmod d}} f(n)
                  -\frac{F(x)}d\right|
 =o_{L,K,\delta,\epsilon}(x).
\tag{3}
```

Apply Granville–Shao, Theorem 1.6, with $`B=3`$. Its class $`\mathcal C`$ includes 1-bounded completely multiplicative functions. The theorem gives a set of $`O((\log x)^{26})`$ primitive characters and an error $`O(x/(\log x)^3)`$ summed over each dyadic range of $`d\le x^{1/2-\delta}`$ after these characters are subtracted. Enlarge the set to include the principal primitive character if needed. We bound the total contribution of the remaining exceptional characters, including the characters they induce, on $`\mathcal D`$.

A character of conductor $`r`$ can contribute only when $`r\mid d`$, so $`r\in\mathcal D`$. Its total possible weight is at most $`e^{2K}/\varphi(r)`$. Thus all exceptional characters with $`r>(\log x)^{60}`$ contribute $`o(x)`$, even with the trivial bound $`x`$ on each character sum, using $`\varphi(r)\ge\sqrt{r/2}`$.

For the smaller conductors, let $`\psi`$ be primitive modulo $`r>1`$, and let $`\psi_d`$ be the character modulo $`d`$ induced from $`\psi`$. For squarefree $`d`$ divisible by $`r`$, complete multiplicativity gives

```math
\sum_{n\le x}f(n)\psi_d(n)
=\sum_{e\mid d/r}\mu(e)f(e)\psi(e)\sum_{n\le x/e}f(n)\psi(n).
```

Summing the absolute values with weight $`1/\varphi(d)`$ and then over the exceptional characters with $`r\le(\log x)^{60}`$, the total is at most

```math
e^{2K}\sum_{e\in\mathcal D}\frac1{\varphi(e)}
 \sum_{\substack{\psi\ \mathrm{exceptional}\\1\lt r\le(\log x)^{60}\\r\in\mathcal D}}
 \frac1{\varphi(r)}
 \left|\sum_{n\le x/e}f(n)\psi(n)\right|.
\tag{4}
```

Indeed, with $`r,e`$ fixed and coprime, write $`d=rec`$ and sum $`1/\varphi(c)`$. If $`e>x^{1/4}`$, the trivial bound $`x/e`$ for each of the $`O((\log x)^{26})`$ character sums contributes $`o(x)`$, using $`\sum_{e>V}1/(e\varphi(e))\ll V^{-1/2}`$. For $`e\le x^{1/4}`$, apply Cauchy–Schwarz to the inner sum in (4). The sum of squares of the weights is at most $`\sum_{r\in\mathcal D}1/\varphi(r)`$, since there are at most $`\varphi(r)`$ characters modulo $`r`$. Equation (2) with $`x/e\ge x^{3/4}`$ bounds the other factor by $`o(x/e)`$, uniformly in $`e`$. Summation using $`\sum_e 1/(e\varphi(e))\lt \infty`$ completes the estimate of (4).

It follows that the residue counts in (3) can be replaced, with total error $`o(x)`$, by $`\varphi(d)^{-1}\sum_{n\le x,(n,d)=1} f(n)`$. To replace this principal term by $`F(x)/d`$, write $`d=d_0d_1`$ where $`d_0`$ contains the primes up to $`w`$. Dropping the coprimality condition at $`p\mid d_1`$ changes the unnormalized count by at most $`x\sum_{p\mid d_1}1/p`$, and the corresponding change in $`F(x)\varphi(d)/d`$ is bounded by the same expression. Their total weighted cost is

```math
\ll x e^{2K}\sum_{p>w}\frac1{p(p-1)}=o(x).
```

For $`d_0`$, since $`f(e)=1`$ for $`e\mid d_0`$, Möbius inversion gives $`\sum_{e\mid d_0}\mu(e)F(x/e)`$. By (1), each term differs from $`\mu(e)F(x)/e`$ by $`O_L(x(1+\log e)/(e\log x))`$. Here $`\log e\le\sum_{p\le w}\log p\ll w`$. The sum over $`d\in\mathcal D`$ of $`\varphi(d)^{-1}\sum_{e\mid d_0}1/e`$ is bounded by the Euler product $`\prod_{p\in Q}(1+(1+1/p)/(p-1))=O_K(1)`$. This gives (3).

### Applying the lower sieve

Choose the longer of the portions $`n\lt a`$ and $`n>a`$ of $`[1,N]`$. On it let $`m=|n-a|`$. The numbers $`m`$ form an interval $`(M,X]`$ of at least $`(N-1)/2`$ integers, with $`X\le(A+1)N`$. After translation and possibly reflection the zero classes are those primes with $`a_p\equiv a\bmod p`$. Put the rest in $`Q`$, so all primes of $`Q`$ are at most $`N^\theta`$, and their forbidden residues modulo $`p`$ are nonzero.

Choose $`\delta>0`$ with $`2\theta\lt 1/2-\delta`$, then choose $`\epsilon`$ as in (3). Define $`f(n)`$ to be the indicator that $`n`$ is $`N^{\epsilon/2}`$-smooth and divisible by none of the selected zero-class primes. The reciprocal cost of excluding the zero-class primes and all the primes in $`(N^{\epsilon/2},X]`$ is $`O_{K,A,\epsilon}(1)`$ by Mertens' theorem. Theorem 1 of Erdős–Ruzsa gives $`F(X)\gg_{K,A,\epsilon}X`$. Equation (1) gives

```math
F(X)-F(M)=\frac{X-M}{X}F(X)+o(X)\gg_{K,A,\epsilon}N.
```

For $`M\lt X/(\log X)^2`$ use $`F(M)\le M`$, and otherwise use (1). Fix $`d_*`$ with $`2\theta\lt d_*\lt 1/2-\delta`$ and set $`D=N^{d_*}`$. To apply (3) to the interval $`(M,X]`$, first apply it at $`x=X`$. If $`M\ge X/(\log X)^2`$, apply it also at $`x=M`$, since $`N^{\epsilon/2}\le x^\epsilon`$, $`D\le x^{1/2-\delta}`$ and $`f(p)=1`$ for $`p\in Q`$ up to $`(\log x)^{1/2}`$. For smaller $`M`$, the total error at that endpoint for the indicated moduli is bounded by $`2M\sum_{d\in\mathcal D}1/d+D=o(N)`$ from the interval count without the weight $`f`$.

For each $`d\in\mathcal D`$, the simultaneous forbidden conditions for the primes dividing $`d`$ specify one reduced residue class modulo $`d`$, by the Chinese remainder theorem. The weight of this class in $`(M,X]`$ has the form $`(F(X)-F(M))/d+r_d`$, where the sum of $`|r_d|`$ for $`d\le D`$ is $`o(N)`$ by (3). Apply the dimension-one lower sieve with density $`1/p`$ on $`Q`$, cutoff $`z=N^\theta`$, and level $`D`$. Its dimension bound follows from Mertens' product over all primes. The lower sieve function is positive at the fixed parameter $`\log D/\log z=d_*/\theta>2`$, and $`\prod_{p\in Q}(1-1/p)\ge e^{-2K}`$. Hence the number of survivors with $`f(m)=1`$ is $`\gg_{K,A,\theta}N`$.

## Consequence for deviations from a common shift

Fix $`K,A,\theta`$ as in the theorem. In any bounded-cost full cover, every integer $`a`$ with $`|a|\le AN`$ must have

```math
\sum_{\substack{p\in P,\ p>N^\theta\\a_p\not\equiv a\bmod p}}\frac1p \ge c'(K,A,\theta)>0
```

for large $`N`$. Delete the indicated classes, apply the theorem, and use that the deleted classes cover at most $`N`$ times their reciprocal sum plus $`\pi(N)=o(N)`$ points. In particular, the common-shift theorem also allows independent deviations for all primes above $`N^{1-\eta}`$, for sufficiently small fixed $`\eta`$ depending on $`K,A,\theta`$, by Mertens' theorem. The proof uses a single shift to make the larger forbidden conditions multiplicative. Independently chosen classes in the middle range lack this feature.
