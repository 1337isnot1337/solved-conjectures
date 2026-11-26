# Additive doubling of Ulam prefixes

Let $`B_k=\{u_1,\ldots,u_k\}`$ be the first $`k`$ terms of the classical sequence, let $`P_k=B_k\cup\{0\}`$, and write $`A(x)`$ for its counting function. Define the doubling constant $`K_k=|P_k+P_k|/(k+1)`$. Here the ordinary sumset includes repeated summands.

## A criterion for positive upper density

**Proposition.** For $`k\ge 2`$,

```math
u_k+1\le (k+1)(32K_k)^{12K_k^2},
\qquad K_k\le\frac{2u_k+1}{k+1}.
```

Thus $`U`$ has positive upper natural density if and only if $`K_k`$ is bounded on an infinite subsequence. It has positive lower natural density if and only if the entire sequence of doubling constants is bounded. In particular, $`A(x)/x\to0`$ if and only if $`K_k\to\infty`$.

**Proof.** Theorem 1.4 of Green and Ruzsa embeds $`P_k`$ by a Freiman isomorphism of order two into the integer interval $`[1,(32K_k)^{12K_k^2}(k+1)]`$. Such a map $`f`$ preserves all equalities of two-term sums, including those with repeated summands. Set $`v=f(1)-f(0)`$. Injectivity makes $`v`$ a nonzero integer. From $`2+0=1+1`$ one gets $`f(2)=f(0)+2v`$. If $`u_i=a+b`$ for earlier terms, then $`u_i+0=a+b`$ gives $`f(u_i)=f(0)+u_i v`$ by induction. The image spans at least $`u_k`$ units, giving the first inequality. The second follows from $`P_k+P_k\subseteq[0,2u_k]`$. On each interval $`u_k\le N<u_{k+1}`$, the ratio $`A(N)/N`$ ranges from $`k/(u_{k+1}-1)`$ to $`k/u_k`$. The first endpoint ratio differs from $`(k+1)/u_{k+1}`$ by a quantity tending to zero. These bounds give the assertions about the upper and lower natural densities. [Green and Ruzsa, Theorem 1.4](https://arxiv.org/pdf/math/0403338)

Only the representation of each term as a sum of earlier terms enters the rigidity argument. A related general result of Šarka gives unbounded prefix doubling for sets with zero lower density and bounded ratios of successive elements. [Šarka, Theorem 4.1](https://epublications.vu.lt/object/elaba%3A2056828/2056828.pdf)

## What the greedy rule adds

Write $`S_k`$ for sums of two **distinct** members of $`B_k`$. When $`u_i`$ enters, let $`F_i`$ count new sums $`u_i+a`$ with $`a\in B_{i-1}`$, and let $`C_i`$ count those that previously had exactly one representation and now have two. Let $`H_k`$ count the sums above $`u_k`$ still uniquely represented by $`B_k`$. Then

```math
|S_k|=\sum_{i=1}^k F_i
=k-2+\sum_{i=1}^k C_i+H_k .
```

Each represented integer enters once and acquires a second representation at most once. The sums at most $`u_k`$ with exactly one representation are precisely the $`k-2`$ nonseed Ulam terms. All their possible summands are already in $`B_k`$. The extra elements of $`P_k+P_k`$ belong to $`\{0,1,2\}`$ or to the $`k`$ diagonals $`2u_i`$, since each nonseed in $`0+B_k`$ belongs to $`S_k`$. Consequently positive upper density is equivalent to boundedness of the **average** $`k^{-1}\sum_{i\le k} F_i`$ along an infinite subsequence.

There is also a test using only integers whose representations are already final. Put $`a_j=A(2^j)`$ and let $`h_j`$ count integers at most $`2^j`$ with at least two unordered distinct-summand representations in $`U`$. If the natural density is zero, then for every fixed $`M>0`$,

```math
\lim_{J\to\infty}\frac {1}{J}
\big|\{1\le j\le J:h_j\le M a_j\}\big|=0 .
```

Indeed, all pairs from $`B_{a_{j-1}}`$ have sum at most $`2^j`$. The represented integers through that cutoff total $`a_j-2+h_j`$. Accounting for the extra sums allowed in $`P_{a_{j-1}}`$ as above gives, for $`j\ge2`$,

```math
K_{a_{j-1}}\le 1+\frac{a_j+h_j}{a_{j-1}+1}.
```

Under zero density the left side tends to infinity. Thus along exponents with $`h_j\le Ma_j`$, the ratio $`a_j/a_{j-1}`$ must tend to infinity if the set of such exponents is infinite. For any fixed $`L>1`$, at most $`J\log 2/\log L`$ of the first $`J`$ exponents can have $`a_j/a_{j-1}\ge L`$, since the ratios are at least one and their product is $`a_J/a_0\le 2^J`$. Letting $`L`$ increase proves the claim. In particular, an eventual bound $`\sum_{i\le k}C_i\le Ck`$ would prove positive upper density, because $`h_j\le\sum_{i\le a_j}C_i`$.

## Testing a bound on new sums

The table counts all sums from the prefix $`B_{A(X)}`$, including those exceeding $`X`$. The last column counts only integers at most $`X`$. The replay adds each new shift to bitsets for represented and multiply represented sums. For the largest prefix it independently squares an integer polynomial and checks the ordinary sumset, the restricted support, cancellations and pending singletons. [Replay](sumset_doubling.py)

| $`X`$ | $`A(X)`$ | Ordinary sumset size | New sums, cumulative | Cancellations, cumulative | Pending singletons | Multiply represented through $`X`$ |
|---:|---:|---:|---:|---:|---:|---:|
| 1,024 | 128 | 1,492 | 1,469 | 1,188 | 155 | 761 |
| 4,096 | 382 | 5,940 | 5,912 | 5,270 | 262 | 3,052 |
| 16,384 | 1,326 | 24,003 | 23,967 | 22,118 | 525 | 12,178 |
| 65,536 | 5,021 | 96,103 | 96,048 | 89,830 | 1,199 | 48,571 |
| 262,144 | 19,530 | 385,828 | 385,754 | 364,050 | 2,176 | 194,131 |

Through the last cutoff the average number of new sums per term is about 19.75. The term 139,128 alone adds 276, and 177,104 gives 132 cancellations. A bound of 20 on every increment already fails. An all-scale bound on the required averages and convergence of the density both remain open.

```sh
python3 -B research/ulam-sequence-density/sumset_doubling.py
```
