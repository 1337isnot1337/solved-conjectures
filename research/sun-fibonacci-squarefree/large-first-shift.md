# A lower bound on the first possible Fibonacci term

Let $\varphi=(1+\sqrt5)/2$ and $c=4934003/5160960$. Fix $0<\theta<3\log\varphi/(2c)=0.755\ldots$. In every sufficiently large interval $(X,2X]$ at least
$X^{1-c\theta/(3\log\varphi)-o(1)}$ odd integers $n$ have **no** representation by a positive odd squarefree number and a Fibonacci number $F_i\le n^\theta$. In particular with $\theta=3/4$ there are more than $X^{1/2}$ such integers. This leaves open representations with a larger Fibonacci term. Throughout, logarithms are natural.

## Sieve on the Fibonacci indices

We first construct an odd residue class of modulus $M_0=\exp(o(T))$ with at most $(c+o(1))T/\log T$ indices $0\le j\le T$ for which the specified prime squares have yet to exclude $F_{3j}$. These are all the parity-eligible indices. Use the [Lucas-square identity, its Lean proof, and the primitive divisor theorem](sparse-progressions.md). A prime of Fibonacci rank $2m$ divides $L_m$, where the rank is the first positive index divisible by that prime.

* To remove each odd prime factor $5\le\ell\le\sqrt T$ from indices with $v_2(j)=0$ or $1$, use the three conditions in the sparse-progressions construction, with one change. For $\ell=5,7$ use rank $6\ell$ for the first condition instead of $2\ell$. This still supplies a prime of $L_{3\ell}$ and frees primes 11 and 29 for the fixed sieve below.
* Put $S=\lfloor2\log_2\log T\rfloor$. For every $2\le s<S$, take primes of ranks $2^{s+1}$ and $3\cdot2^{s+1}$. Both divide $L_d$ for $d=3\cdot2^s$. Prescribe the two residues $F_d,-F_d$ at their squares to remove every $j$ with $v_2(j)=s$. The $O(T/2^S)=O(T/\log^2 T)$ positive multiples of $2^S$ can be counted as exceptions to the sieve. Independently take $n\equiv0\pmod{89^2}$ to remove $F_0$.
* Prescribe $n\equiv F_9\pmod{19^2}$ to remove every odd $j$ divisible by 3, since $19\mid L_9=76$. Take $n\equiv F_{18}\pmod{107^2}$, using $107\mid L_{18}=5778$. For $j=6u$ with $u$ odd this removes $u\equiv1\pmod4$. Take a primitive prime of rank 108 and prescribe $F_{54}$ modulo its square. For $j=18w$ with $w$ odd this removes $w\equiv1\pmod4$, while $w\equiv3\pmod4$ was already removed by 107 because $3w\equiv1\pmod4$.
* Prescribe the following additional values of $n\bmod q^2$,
  $2,14,67,79,60,552$ for $q=3,5,11,13,17,29$ respectively. All CRT conditions are compatible. The ranks of these six primes are $4,5,10,7,9,14$. The ranks of $19,107,89$ are $18,36,11$. The other ranks in the construction are pairwise distinct and avoid this list. The varying primes have total logarithm $O(\sum_{\ell\le\sqrt T}\ell+\sum_{s<S}2^s)=o(T)$ since every prime of rank $r$ is at most $F_r$.

Apart from the $O(T/\log^2 T)$ indices set aside and $O(1)$ indices without a large prime factor, the candidates are $j=dp$ with $d=1,2,6$ and $p>\sqrt T$ prime. For $d=6$ only $p\equiv3\pmod4$ remains. For each family use the prime number theorem in fixed arithmetic progressions. A reduced residue of $p$ modulo 840 is uniform asymptotically. The periods of $F_{3p}$ as a function of $p$ modulo the six prime squares divide $8,100,110,364,204,406$, respectively. After fixing $p\bmod840$, their remaining lift factors are $1,5,11,13,17,29$, pairwise coprime. Thus the conditional proportions of unit lifts multiply, including when $3p$ is replaced by $3dp$. Counting the unit lifts and weighting each family by $1/d$ gives

| $d$ | Contribution to the coefficient of $T/\log T$ |
|---:|---:|
| 1 | $23711/53760$ |
| 2 | $755873/1720320$ |
| 6 | $24383/322560$ |

Their sum is $c$. The [exact rational calculation](prefix_coefficient.py) generates each period directly from the Fibonacci recurrence.

## Covering the surviving shifts

Write $K\le(c+o(1))T/\log T$ for the number still to cover. By the prime number theorem take $K$ fresh primes in $[3T,6T]$. The first sieve used $o(T/\log T)$ primes, so sufficiently many remain. As long as some unused prime has two or more remaining shifts equal modulo its square, use that residue to cover all shifts with that value and remove the prime. Suppose $a$ primes were used this way and $k$ shifts remain. Then $2a+k\le K$. At each unused prime the $k$ remaining residues are distinct. Choose $k$ unused primes and assign them to the remaining shifts in all $k!$ orders. Two assignments differing at a prime give different residues at its square. This yields at least $k!$ distinct odd residue classes, each covering the entire prefix, with common modulus
$M=M_0\prod_{q\ \mathrm{used}}q^2$ satisfying $\log M\le(2c+o(1))T$.

Their total proportion $k!/M$ is at least $\exp(-(c+o(1))T)$. Indeed $\log(k!)\ge k\log T-o(T)$ uniformly for $0\le k\le O(T/\log T)$, by Stirling and $k\log(T/k)=o(T)$ in this range. Hence
$\log(M/k!)\le (2a+k)\log T+o(T)\le(c+o(1))T$. This counting step holds even if many shifts coincide at some prime, because each such prime saved at least one assignment.

Choose $T=\lceil\theta\log(2X)/(3\log\varphi)\rceil+2$, so all Fibonacci numbers $F_{3j}\le(2X)^\theta$ occur in this prefix by Binet’s formula. The restriction on $\theta$ gives $M=o(X)$. Each of the $k!$ classes occurs at least $\lfloor X/M\rfloor$ times in $(X,2X]$, which proves the stated bound. The exponent for $\theta=3/4$ is approximately $0.5033$. Using the total proportion by itself beyond $M=o(X)$ would require a new estimate for where these classes occur.
