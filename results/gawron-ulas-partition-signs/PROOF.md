# Gawron–Ulas partition-sign nonperiodicity conjecture

**Result.** Let $a_n$ be the number of even-length partitions of $n$
into parts $1\bmod3$ minus the number of odd-length ones. Their signs
are not eventually periodic. More strongly, every infinite arithmetic
progression of indices contains infinitely many positive $a_n$ and
infinitely many negative $a_n$. This proves
[Gawron–Ulas, Conjecture 4.3](https://arxiv.org/pdf/2202.05221#page=11).
We give the argument for any coprime progression of parts $b\bmod a$,
with $a\ge3$ odd and $b\ge1$ the specified first part.

## 1. Growth at a root of unity

Set
$$
 F(q)=\prod_{j\ge0}(1+q^{aj+b})^{-1}=\sum_{n\ge0}f_nq^n.
$$
At $(a,b)=(3,1)$ the coefficient is the partition polynomial of the
source evaluated at $-1$. The product and the following choice of
analytic logarithm converge locally uniformly on $|q|<1$:
$$
 \log F(q)=\sum_{\ell\ge1}
 \frac{(-1)^\ell q^{b\ell}}{\ell(1-q^{a\ell})}.
$$
Fix any root of unity $\eta$ and write $L=\operatorname{ord}(\eta^a)$.
Take a fixed complex $\lambda$ with $\Re\lambda=1$ and a positive real
$t\to0$. Then
$$
 \lim_{t\downarrow0}t\log F(\eta e^{-\lambda t})
 =\frac{\operatorname{Li}_2((-1)^L\eta^{bL})}{aL^2\lambda}.
 \tag{1}
$$
To justify passage to the limit, the absolute value of the
$\ell$th term of $t\log F$ is at most
$$
 \frac{t e^{-b\ell t}}{\ell(1-e^{-a\ell t})}
 =\frac1{\ell^2}\frac{(\ell t)e^{-b\ell t}}{1-e^{-a\ell t}}
 \le\frac{C_{a,b}}{\ell^2}.
$$
The bracketed expression is bounded on the positive half-line.
Only terms with $L\mid \ell$ survive in the limit, with value
$(-1)^\ell\eta^{b\ell}/(a\lambda\ell^2)$. This proves (1), using the
absolutely convergent series $\operatorname{Li}_2(z)=\sum_{\ell\ge1}z^\ell/\ell^2$
on $|z|\le1$. Its real part in (1) is the limit of
$t\log|F(\eta e^{-\lambda t})|$.

For $L\ge2$ and any such $\lambda$, the modulus of the rate (1)
is at most $\pi^2/(24a|\lambda|)$. For $L=1$, coprimality makes
$-\eta^b$ run through all negatives of the $a$th roots, as $\eta$
runs through the $a$th roots. The formula
$$
 \Re\operatorname{Li}_2(e^{i\theta})
 =\frac{\pi^2}{6}-\frac{\pi\theta}{2}+\frac{\theta^2}{4},
 \qquad 0\le\theta\le2\pi,
 \tag{2}
$$
is the usual cosine Fourier sum (integrate the sine series
$\sum_{\ell\ge1}\sin(\ell\theta)/\ell=(\pi-\theta)/2$).
The largest real part for $L=1$ is attained at the two arguments
$\theta=\pm\pi/a$, because $a$ is odd. Put
$$
 u=\Re\operatorname{Li}_2(e^{i\pi/a}),\qquad
 v=\Im\operatorname{Li}_2(e^{i\pi/a}).
$$
Thus every radial rate ($\lambda=1$) is at most
$M_a=\max(u/a,\pi^2/(24a))$.

## 2. A strictly faster and uniquely dominant oblique approach

Choose the unique $a$th root $\zeta$ with $-\zeta^b=e^{i\pi/a}$.
For $a=3$, take $\lambda=1+i$. From (2), $u=\pi^2/36$.
Grouping the sine series for $v$ by residues modulo 6 gives
$$
 v=\frac{\sqrt3}{2}\sum_{j\ge0}
 \left(\frac{1}{(6j+1)^2}+\frac{1}{(6j+2)^2}
       -\frac{1}{(6j+4)^2}-\frac{1}{(6j+5)^2}\right)
 >\frac{\pi^2}{18}.
$$
Each summand in parentheses is positive, and the first exceeds 1,
so even $v>\sqrt3/2>\pi^2/18$. The selected oblique rate is
$(u+v)/6>\pi^2/72=M_3$. It is strictly larger than the rate at every
other root for this same $\lambda$: the conjugate root has rate
$(u-v)/6$, the remaining cube root $1$ has a negative rate, and
$L\ge2$ gives the bound $\pi^2/(72|\lambda|)$.

For odd $a\ge5$, formula (2) gives $u>\pi^2/24$, so $M_a=u/a$.
Also $v>0$. For a brief proof, the function
$V(\theta)=\sum_{\ell\ge1}\sin(\ell\theta)/\ell^2$ is zero at
$0$ and $\pi$, and has derivative
$-\log(2\sin(\theta/2))$ on $(0,\pi)$, by the cosine series obtained
from $-\log(1-z)$. This derivative is positive before $\pi/3$
and negative after it, so $V>0$ on the interior.
Take $\lambda=1+i\beta$ for sufficiently small fixed $\beta>0$.
The selected oblique rate is
$$
 \frac{u+\beta v}{a(1+\beta^2)}>\frac{u}{a}=M_a.
$$
It is strictly larger than the conjugate rate, which has
$-\beta v$ in the numerator. The other $L=1$ rates start below $M_a$
and there are finitely many, so they remain below the selected
rate for sufficiently small $\beta$. Roots with $L\ge2$ are below
$M_a$ by the uniform bound from (1). In both cases there is a rate
$R>M_a$ at $\zeta$ strictly exceeding every other root's rate for
the chosen $\lambda$.

## 3. Both signs occur infinitely often in every progression

Fix $Q\ge1$ and $0\le r<Q$. The residue-class series is
$$
 F_r(q)=\sum_{n\equiv r\pmod Q} f_n q^n
       =\frac1Q\sum_{\omega^Q=1}\omega^{-r}F(\omega q).
$$
At the real point $q=e^{-t}$, the bound for each root in the finite
sum gives
$$
 \limsup_{t\downarrow0} t\log |F_r(e^{-t})|\ \le\ M_a,
$$
with $\log 0=-\infty$. At $q=\zeta e^{-\lambda t}$, the term
$\omega=1$ has rate $R$, while the finitely many other terms have
strictly smaller rates. Their moduli divided by that of the first
therefore tend to zero exponentially in $1/t$, so
$$
 \lim_{t\downarrow0} t\log |F_r(\zeta e^{-\lambda t})|=R.
$$
There is no cancellation at that exponential scale.

Suppose the coefficients along this progression are eventually
of one weak sign. From the triangle inequality, for $|q|=e^{-t}$,
$$
 |F_r(q)| \le \sum_{n\equiv r\pmod Q}|f_n|e^{-tn}
 \le |F_r(e^{-t})|+C,
$$
where $C$ accounts for the finitely many coefficients with the
other sign. The right side has exponential rate at most $M_a$
(since $M_a>0$), contradicting the rate $R$ above. Thus each residue
class has both positive and negative coefficients arbitrarily
far out. If the signs on any arithmetic progression were eventually
periodic, a refinement to a subprogression would give an eventually
constant sign, in contradiction to this result.

## Source and scope

- [Filip Gawron and Maciej Ulas, arXiv:2202.05221, §4, Conjecture 4.3](https://arxiv.org/pdf/2202.05221#page=11),
  published as [*Sign behaviour of sums of weighted numbers of partitions*, Ramanujan J. 60 (2023), 571–584](https://doi.org/10.1007/s11139-022-00602-3).
  The original asks nonperiodicity at $(a,b)=(3,1)$; every
  arithmetic progression and every coprime odd $a\ge3$ are
  strengthenings, not separate resolution counts.
- The authors' separate
  [*Signs behaviour of sums of weighted numbers of compositions* (2025)](https://doi.org/10.1007/s11139-024-01006-1)
  defines ordered compositions and proves nonperiodicity for
  those different objects. It does not settle the partition
  Euler product here.
- Exact-name, conjecture-number, title, progression, and Euler
  product searches found no earlier proof of this partition
  statement. Related work on twisted eta products and oscillatory
  partition signs concerns different products. Priority remains
  provisional.
