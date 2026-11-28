# Distance from perfect difference sets

Let $B$ be the standard representatives in $[0,L)$ of any cyclic perfect difference set of size $s$, where $L=s(s-1)+1$. Let $b$ be a nonnegative integer outside $B$ with $b=o(L)$. If $D$ is an integer Sidon set containing $b$, then, as $s$ tends to infinity,
```math
 |B\setminus D|\ge (1/16-o(1))s.
```
The error is uniform across perfect difference sets and their cyclic affine images when $b/L$ tends uniformly to zero. In particular take `{1, 2, 4, 8, 13}` as the prefix $A$. By [Alexeev and Mixon](https://arxiv.org/abs/2510.19804), every perfect difference set omits some point of $A$. **Every integer Sidon extension of this fixed prefix has to discard a positive proportion of every perfect block in these coordinates.** This restricts a construction for [Erdős #44](https://www.erdosproblems.com/44). It leaves unrestricted integer Sidon sets as possible extensions.

## Counting triples as integers

The empirical measures of $x/L$ for $x\in B$ converge uniformly over the choice of $B$ to Lebesgue measure on $[0,1]$. Indeed, for every fixed nonzero integer frequency, the squared modulus of the unnormalized Fourier sum is exactly $s-1$ for all sufficiently large $L$, by counting the nonzero differences. The Fourier criterion gives the assertion, including interval counts and means.

For each $x\in B$ there is a unique ordered pair $(y,z)\in B^2$ with $y-z\equiv b-x\pmod L$. The right side never vanishes. In the resulting $s$ triples, $y$ also runs through $B$ exactly once by symmetry. Each $z$ occurs at most twice since the cyclic Sidon property determines the unordered summands of $b+z$. In particular,
```math
 \frac{1}{s}\sum_{\rm triples}\frac zL\ge \frac14-o(1).
```
Indeed the proportion with $z/L\le t$ is at most $2t+o(1)$ for each fixed $t$. Integrate the complementary bound over $0\le t\le1/2$.

Write $j=(x+y-z-b)/L$, one of $-1,0,1$. Negative $j$ requires $x+y<b$, so by the distribution of $x$ it occurs $o(s)$ times. The average of $j$ is at most $1-1/4+o(1)$, using the means of $x/L$ and $y/L$. Thus at least $(1/4-o(1))s$ triples have $j=0$. Each is a genuine integer collision $x+y=z+b$, with distinct unordered pairs because $b$ is outside $B$. Deleting a point of $B$ destroys at most four ordered triples, one in each summand position and at most two in the $z$ position. This proves the distance bound.

## A criterion for other cyclic constructions

The same estimate holds for a cyclic Sidon set $B$ of size $s=(1+o(1))\sqrt L$ whenever $b-x$ belongs to $B-B$ for all but $o(s)$ choices of $x\in B$. The missing differences number $o(L)$, so every nonzero Fourier sum has squared modulus at most $s+o(L)=o(s^2)$. Among the surviving triples, each summand ranges once over all but $o(s)$ points of $B$. The bound on the number of uses of $z$ still holds.

For a Bose–Chowla block, the omitted nonzero differences form the nonidentity elements of the subgroup of order $q-1$ in the cyclic group of order $q^2-1$. Every coset contains at most one point of the block. Thus at most one $x$ is exceptional for a fixed $b$. For a Ruzsa block in the product of cyclic groups of orders $p$ and $p-1$, the omitted differences are on the coordinate axes and each coordinate is injective on the block. At most two $x$ are exceptional. These assertions persist under cyclic affine transformations. The [separate Ruzsa estimate](ruzsa-blocks.md) gives a stronger constant for that family.
