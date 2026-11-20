# Erdős–Granville–Pomerance–Spiro conjecture

This note extends the [divisor-sum collision argument](erdos-granville-pomerance-spiro.md)
towards inputs whose two largest primes are near the square root.
The full conjecture remains open. Work is tracked in
[issue #47](https://github.com/1337isnot1337/solved-conjectures/issues/47).

## Counting a bilinear congruence in a box

For positive integers $A,B,M$ with $\gcd(A,B)=1$, and any integer
$K$, write

```math
 F(u,w)=Auw+B(u+w+1),\qquad D=AK+B(B-A).
```

Let $\nu(M)$ be the number of residue pairs satisfying
$F(u,w)\equiv K\pmod M$. Take two intervals containing $P$ and $Q$
consecutive integers, respectively. For any $k$ coprime to $M$,
restrict $u,w$ to one residue class each modulo $k$.
Let $N_1,N_2$ be the resulting numbers of choices in the two
intervals. The number of pairs in the restricted box with
$F(u,w)\equiv K\pmod M$ is

```math
 \frac{\nu(M)N_1N_2}{M^2}+
 O_\epsilon\left((AM)^\epsilon A\sqrt M\,\gcd(D,M)
                  \left(1+\frac{P+Q}{M}\right)\right)
```

for every $\epsilon>0$. This follows from completion and the
Weil bound for Kloosterman sums, as used for modular hyperbolas
by [Shparlinski, §3.1](https://arxiv.org/abs/1103.2879).
The factor $\gcd(D,M)$ allows a nonunit right-hand side.

To see this, write $e_m(t)=\exp(2\pi i t/m)$ and define

```math
 S_M(h,j)=\sum_{\substack{u,w\bmod M\\F(u,w)\equiv K\ (\mathrm{mod}\ M)}}
              e_M(hu+jw).
```

The changes of variable $x=Au+B$ and $y=Aw+B$ identify the
condition with $xy\equiv D\pmod {AM}$ and
$x\equiv y\equiv B\pmod A$. Write $L=AM$ and put
$T_L(H,J)=\sum_{xy\equiv D\ (\mathrm{mod}\ L)}e_L(Hx+Jy)$,
where $x,y$ range modulo $L$. The additive characters enforcing
the two restrictions modulo $A$ express $S_M(h,j)$ as an average
of the sums $T_L(h+rM,j+sM)$ with factors of modulus one.

Partition the $x$-sum for $T_L(H,J)$ by $g=\gcd(x,L)$.
For each such $g\mid\gcd(D,L)$ write $x=gz$ with $z$ a unit
modulo $L/g$. The congruence fixes $y$ modulo $L/g$ and the
sum over its $g$ lifts vanishes unless $g\mid J$. If $g\mid J$,
this part of the sum is $g$ times the Kloosterman sum modulo
$L/g$ with frequencies $H,(J/g)(D/g)$. Weil's bound gives

```math
 |T_L(H,J)|\ll_\epsilon L^{1/2+\epsilon}
                      \gcd(D,L)\gcd(H,J,L)^{1/2}.
```

Here we used
$\gcd(H,(J/g)(D/g),L/g)\le\gcd(D,L)\gcd(H,J,L)$
and summed over at most $\tau(L)$ values of $g$.
Since $D\equiv B^2\pmod A$, we have
$\gcd(D,L)=\gcd(D,M)$. Also
$\gcd(h+rM,j+sM,L)\le A\gcd(h,j,M)$. Thus

```math
 |S_M(h,j)|\ll_\epsilon (AM)^\epsilon A\sqrt M\,
                      \gcd(D,M)\gcd(h,j,M)^{1/2}.
```

Let $W_i(h)$ be the sum of $e_M(-h v)$ over the respective
restricted interval. For each $d\mid M$, the geometric-series
bound gives

```math
 \sum_{\substack{h\bmod M\\h\ne0,\ d\mid h}} |W_i(h)|
       \ll (M/d)\log(2M).
```

Indeed the chosen integers run through a progression of
step $k$, and multiplying the frequencies by $k$ permutes
the nonzero multiples of $d$ modulo $M$.
In the Fourier expansion the zero pair contributes
$\nu(M)N_1N_2/M^2$. For the other pairs, bound
$\gcd(h,j,M)^{1/2}$ by the sum of $\sqrt d$ over the divisors
$d\mid M$ dividing both frequencies. The terms with both
frequencies nonzero are bounded by the displayed estimate
in both coordinates. When exactly one frequency is zero,
use $|W_i(0)|=N_i$ there. After division by $M^2$, the
frequency sums cost at most
$M^{o(1)}(1+(P+Q)/M)$. This proves the stated estimate.

We also use the bound

```math
 \nu(M)\le M\sum_{h\mid\gcd(D,M)}1.
```

For each prime power $r^e\parallel M$ with $r\mid A$,
the coefficient $Au+B$ is a unit, so every $u$ has a unique
$w$. If $r\nmid A$, the congruence is equivalent to
$xy\equiv D\pmod{r^e}$. For each $g=\gcd(x,r^e)\mid D$,
the count is $g\varphi(r^e/g)\le r^e$, which gives the bound
by the Chinese remainder theorem.
