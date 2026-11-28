# Mean range of smooth components at polynomial heights

Pr_Huang obtained the upper bound $1-\log 2$ for the limiting upper ratio of the minimum in [Erdős Problem 461](https://www.erdosproblems.com/461) by averaging blocks just below quadratic height. The following calculation shows why changing the fixed exponent in that averaging method cannot improve the coefficient. [Pr_Huang's proof, September 10, 2026](https://www.erdosproblems.com/forum/thread/461#post-8948)

Fix $u>1$ and let $X=\lfloor t^u\rfloor$. Partition $(X,2X]$ into successive complete blocks of length $t$, omitting the last incomplete block. The average of $f(n,t)/t$ over these blocks converges to
```math
 C(u)=1-\int_{\max(1,u-1)}^u\omega(v)\,dv ,
```
where $\omega$ is Buchstab's function. The unique minimizer on $u>1$ is $u=2$, with $C(2)=1-\log 2$. These are averages. The theorem gives no lower bound for an individual block in that range.

## From the number of labels to a count of integers

In any block every smooth component greater than $t$ occurs once. Components at most $t/\log t$ contribute at most $t/\log t$ labels. It suffices to show that the intervening components occur at $o(X)$ sites across $(X,2X]$ and to count all sites with component at most $t$. The omitted tail has at most $t=o(X)$ sites.

Write $m=sr$, with $s$ its component for primes strictly below $t$. For every integer $s<t$, the allowed cofactors are precisely the positive integers $r$ with no prime factor below $t$. If $s=t$ the count of multiples is $O(X/t+1)$, which is negligible. Denote by $R(z)$ the number of these rough integers up to $z$. When $v=\log z/\log t$ stays in a compact subset of $(1,\infty)$, the classical rough-number estimate gives, uniformly,
```math
 R(z)=(\omega(v)+o(1))z/\log t .
```
Use cutoff $t-1$ in the convention that excludes primes up to and including the cutoff. Where $z$ is between $t/2$ and $t^{1+\eta}$ for fixed $0<\eta<1/2$, only one and primes at least $t$ can enter, so $R(z)\ll z/\log t$ there by the prime number theorem. [Kai Fan, *Numerically explicit estimates for the distribution of rough numbers*](https://arxiv.org/abs/2306.03347)

For $1\le s<t$ the count in question is $R(2X/s)-R(X/s)$. The cofactor one does not occur, since $s<t<X$. If $2X/s<t$, the difference vanishes. In all other cases it is $O_u(X/(s\log t))$ by the two estimates above. Summing over $t/\log t\le s<t$ gives $O_u(X\log\log t/\log t)=o(X)$, as required for the intervening band.

Put $v_s=\log(X/s)/\log t$. Where $v_s\ge1+\eta$, continuity of $\omega$ and the uniform estimate give
```math
 R(2X/s)-R(X/s)=(\omega(v_s)+o_{u,\eta}(1))X/(s\log t).
```
The transition range $1-\log 2/\log t\le v_s<1+\eta$ contributes $O(\eta X)+o(X)$ by the upper bound and the harmonic sum. On the remaining range the main term divided by $X$ is a Riemann sum in $\log s/\log t$, since the mass of integers with $t^a\le s\le t^b$ under the weight $1/(s\log t)$ tends to $b-a$ for $0\le a<b\le1$. Sending $\eta$ to zero yields the integral in the statement as the proportion of sites with component at most $t$. Subtracting this from one proves the mean formula.

## Optimization over the height exponent

On $1<u\le2$, the integral equals $\log u$. On $[2,3]$ one has $\omega(v)=(1+\log(v-1))/v$. Its maximum $M$ on that interval is strictly less than $\log 2$: the maximum over $x>0$ of $1+\log x-(1+x)\log 2$ occurs at $x=1/\log 2$ and equals $-\log(2\log 2)<0$. The same upper bound $M$ holds on $[2,\infty)$ by integrating $(v\omega(v))'=\omega(v-1)$ successively over intervals of length one from $v=3$ onward.

For $2<u\le3$, sliding the interval of integration from $[1,2]$ to $[u-1,u]$ loses $\log(u-1)$ and gains at most $M(u-2)$. Concavity gives $\log(u-1)\ge(u-2)\log 2$. For $u\ge3$ the entire integral is at most $M$. These strict inequalities prove the uniqueness claim.
