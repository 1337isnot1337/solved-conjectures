# Hou–Zeng conjecture

Hou and Zeng ask whether every integer greater than four is a sum of an odd prime, a positive Fibonacci number and a Catalan number. They offer $200 for the first explicit counterexample they can recheck and $1,000 for the first positive solution published in a well-known mathematical journal. McNeil’s verification reported in OEIS reaches 50 trillion. [Conjecture 1.13 and Remark 1.14](https://arxiv.org/abs/0901.3075) · [OEIS A154404](https://oeis.org/A154404) · [Issue 221](https://github.com/1337isnot1337/solved-conjectures/issues/221)

## Mean number of representations on two progressions

Let $R(n)$ count triples of numerical values $(p,F,C)$ in the conjecture, counting the repeated initial value 1 in each sequence once. Set $M=312018=2\cdot3\cdot7\cdot17\cdot19\cdot23$. For either $r=208641$ or $r=218331$,

```math
\frac{1}{\#\{X\lt n\le 2X:n\equiv r\pmod M\}}
\sum_{\substack{X\lt n\le 2X\\ n\equiv r\pmod M}}R(n)
\asymp (\log X)^{\log_{23}12}.
```

Over the entire interval the mean has order $\log X$. Thus the two progressions have asymptotically fewer representations on average, and their mean still tends to infinity. The minimum of $R(n)$ on either progression is undetermined. The residues come from Yuda Chen’s theorem on sums of a prime and one Fibonacci number. [Chen’s paper](https://doi.org/10.1080/00150517.2025.2475883)

**Catalan digit count.** For each odd prime $q$ set $h=(q+1)/2$ and $\alpha_q=\log_q h$. Exactly $h^b+h^{b-1}$ integers $0\le j<q^b$ satisfy $q\nmid C_j$, for $b\ge1$. Indeed, Kummer’s carry formula for the central binomial coefficient, followed by division by $j+1$, permits exactly the carries forced by the trailing digits $q-1$ of $j$. If there are no trailing digits $q-1$, all $b$ digits are at most $h-1$, giving $h^b$ choices. With $1\le l<b$ trailing digits $q-1$, the next digit has $h-1$ choices and the remaining digits have $h$ choices each. The one case $l=b$ completes the sum to $h^{b-1}$ additional choices. For $q=2$, $C_j$ is odd exactly when $j+1$ is a power of two. In particular, the number of $j\le T$ with $q\nmid C_j$ has order $T^{\alpha_q}$ for odd $q$ and order $\log T$ for $q=2$. These divisibility criteria are classical. [Alter and Kubota](https://www.sciencedirect.com/science/article/pii/0097316573900721) · [Deutsch and Sagan](https://users.math.msu.edu/users/bsagan/papers/old/ccm.pdf)

**Upper bound.** If $M\mid C_j$ and $n\equiv r\pmod M$, then $n-C_j$ belongs to one of Chen’s progressions, in which no positive number is a prime plus a Fibonacci number. Thus only indices with $M\nmid C_j$ contribute. For $C_j\le2X$ one has $j=O(\log X)$ from Catalan growth. The union bound over the six prime divisors of $M$ gives $O((\log X)^{\alpha_{23}})$ possible Catalan indices. Here $\alpha_q<\alpha_{23}$ for $q=3,7,17,19$, directly by evaluating the four fixed ratios. There are $O(\log X)$ possible Fibonacci numbers, and the prime number theorem bounds the number of possible primes by $O(X/\log X)$. The denominator of the average has order $X$.

**Lower bound.** With $T$ a small constant multiple of $\log X$, all $j\le T$ give $C_j\le X/4$. There are $\gg T^{\alpha_{23}}$ indices with $23\nmid C_j$. Among them, removing indices for which any of $2,3,7,17,19$ fails to divide $C_j$ removes only $o(T^{\alpha_{23}})$ indices, by the preceding digit count. Discarding the repeated initial value changes this by at most one.

The Fibonacci sequence modulo $M$ has period 144. For the first progression use $i\equiv6\pmod{144}$, and for the second use $i\equiv30\pmod{144}$. In each case $\gcd(r-F_i,M)=23$, as one can check from $F_6=8$ and $F_{30}=832040$. There are $\gg\log X$ distinct such $F_i\le X/4$. For each selected pair, $r-F_i-C_j$ is coprime to $M$ at every prime divisor. The prime number theorem for the fixed modulus $M$ gives $\gg X/\log X$ primes in $(X,3X/2]$ in that residue class, uniformly over the finitely many reduced classes. Each prime gives $X<n\le2X$ in the required progression. Each triple contributes once to the sum of $R(n)$, even when two triples give the same integer. Multiplication and division by the size of the progression prove the lower bound. Without a residue constraint, the same count uses all $\asymp\log X$ Catalan values up to $X/4$ and all $\asymp\log X$ Fibonacci values up to $X/4$, proving the all-integer mean asserted above.

## Exact search

The progression sieve checked one million successive members of each class starting above 50 trillion. Every tested integer has a representation. Its first terms were 50,000,000,137,611 and 50,000,000,147,301. For each eligible sum $s=F+C$ it sieves $n-s$ by all possible prime divisors through its square root. A marked witness therefore certifies an actual odd prime. If a search leaves a value unmarked, it prints it for a full check because the first pass uses only a subset of shifts. The digit and period checker uses the literal Fibonacci and Catalan definitions. [Sieve](progression.cpp) · [Checks](verify.py)

```sh
python3 verify.py
c++ -O3 -std=c++17 -Wall -Wextra -Werror progression.cpp -o /tmp/hou-zeng-sieve
/tmp/hou-zeng-sieve 49999999999999 1000000
```

## A progression with a smaller exact exponent

There is a subprogression of the first class on which the mean number of representations has order $(\log X)^{\log_{19}10}$, with $\log_{19}10=0.782011\ldots$ in place of $\log_{23}12=0.792509\ldots$. Its modulus and residue are

```math
M'=312018\cdot47\cdot107\cdot1103=1730759789766,
\qquad r'=182449613961.
```

The argument uses digit restrictions in two multiplicatively independent bases. Write $`A_q=\{j:q\nmid C_j\}`$ for an odd prime $q$ and $D_q$ for the integers with every base-$`q`$ digit at most $(q-1)/2$. The carry criterion above shows that for $j\in A_q$, every digit of $j+1$ above the units position has this bound. Indeed, if $j$ has no trailing digit $q-1$, adding one can change only the units digit. If it has trailing digits $q-1$, the first preceding digit is at most $(q-3)/2$, interpreting a leading zero if needed. Thus $A_q$ lies in the finite union of $qD_q+a-1$ for $0\le a<q$. For distinct odd primes $p,q$, Theorem B of Glasscock, Moreira and Richter applied to each pair of affine images gives

```math
\#(A_p\cap A_q\cap[0,T])\ll_{p,q,\varepsilon}
T^{\max(0,\alpha_p+\alpha_q-1)+\varepsilon},
\qquad \alpha_q=\log_q((q+1)/2).
```

The deleted-digit sets are invariant under truncation at either end, and their dimensions $\alpha_q$ follow by counting words of length $b$. Distinct prime bases are multiplicatively independent. For $p=2$ we use the earlier $O(\log T)$ count. [Glasscock, Moreira and Richter, Theorem B](https://doi.org/10.1112/jlms.12902)

The CRT conditions added to $r\equiv208641\pmod{312018}$ are $r'\equiv1,8,378$ modulo $47,107,1103$, respectively. In the old modulus the only Fibonacci indices for which $\gcd(r-F_i,M)=23$ are $6,66,102,114$ modulo 144. In the new modulus the Fibonacci period is 288. Every lift of indices 6 and 102 also satisfies $F_i\equiv8\pmod{107}$. Of the four lifts of indices 66 and 114, indices 66 and 258 satisfy $F_i\equiv1\pmod{47}$ and indices 114 and 210 satisfy $F_i\equiv378\pmod{1103}$. All assertions follow by iterating $(a,b)\mapsto(b,a+b)$ modulo $M'$. The checker below verifies the full period and all residue claims.

For the upper bound, first discard triples whose prime divides $M'$. There are $O((\log X)^2)$ such triples in total, which contribute $o(1)$ to the mean. Any remaining triple either has $C_j$ indivisible by one of $2,3,7,17,19$, or its Fibonacci index is covered by both 23 and one of $47,107,1103$. In this last case $C_j$ must be indivisible by both primes. For all three pairs $\alpha_{23}+\alpha_q-1<0.70<\alpha_{19}$. The preceding intersection bound gives $O(T^{\alpha_{19}})$ candidate Catalan indices up to $T$ in total. Taking $T=O(\log X)$ and applying the same prime count as above gives the upper bound.

For the lower bound take $i\equiv3\pmod{288}$, so $\gcd(r'-F_i,M')=19$. Start with the $\gg T^{\alpha_{19}}$ indices in $A_{19}$ up to $T$. For every other odd prime $q\mid M'$, $\alpha_{19}+\alpha_q-1<\alpha_{19}$ since $\alpha_q<1$. Removing the finitely many intersections with $A_q$, and the indices in $A_2$, leaves $\gg T^{\alpha_{19}}$ choices. For each such $j$, $r'-F_i-C_j$ is coprime to $M'$. Take $T$ a sufficiently small constant times $\log X$ and apply the prime number theorem in reduced classes modulo $M'$ as in the first lower bound. This proves the asserted order. It leaves the least number of representations in the progression open. [Exact checks](verify.py)

The [small-prime obstruction and residue-class search](finite-modulus-search.md) gives uniform lower bounds on coprime candidate shifts and tests selected progressions beyond the consecutive verification range.
