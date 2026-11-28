# Sequences obtained by excluding multiples

Let $\mathcal B$ be any family of pairwise coprime integers greater than one, and let $B$ be the positive integers divisible by none of them. If $B$ has positive density, then a positive lower density of starting positions give a block of consecutive members of $B$ whose sum belongs to $B$. The block has fixed length at least three and lies in a window of fixed width. The conclusion of existence persists if $B$ is changed on a set of upper logarithmic density zero.

This excludes another class of possible counterexamples to [Erdős #839](https://www.erdosproblems.com/839), including the squarefree integers and sieves by arbitrary pairwise coprime moduli. An infinite sieve can have no full arithmetic progression. The proof prescribes divisibility on all the intermediate positions needed to certify consecutiveness.

If the family is finite, its complement of multiples is periodic, and the [compact-group argument](polynomial-codings.md) applies. In this case one can follow $k=1+2q s$ terms of a periodic sequence starting in it, where $q$ is a period and $s$ is the number of members per period. Every such sum is congruent to its first term modulo $q$.

Now suppose the family is infinite. Positivity forces $\sum_{b\in\mathcal B}1/b<\infty$, since avoiding any finite subfamily gives an upper density bounded by its product of factors $1-1/b$. Choose an odd prime $k$ outside $\mathcal B$, using divergence of the reciprocal sum of the primes. Thus no member of $\mathcal B$ divides $k$. Write $D$ for the product of all $b\in\mathcal B$ with $b\le2k$, with empty product one. We will enforce that the members of $B$ in the interval from $n$ through $n+(k-1)D$ are exactly
```math
 n, n+D,\ldots,n+(k-1)D.
```
Their sum is $kn+C$, with $C=Dk(k-1)/2$.

First require $n\equiv1\pmod D$. Every one of the $k$ displayed terms avoids the small moduli, and the sum is $k$ modulo every small modulus, so it avoids them too. For each undesired offset $j$ in the interval select a distinct fresh member $b_j$ of $\mathcal B$ larger than $2k^2D$. Require $n\equiv-j\pmod {b_j}$. This kills that position without killing any displayed term. It also preserves the sum because $C-kj$ is nonzero of absolute value below $b_j$: its unique possible zero is the central displayed offset $D(k-1)/2$, since $k$ is odd. Pairwise coprimality makes all these conditions one progression.

For each remaining $b$, avoiding divisibility at the $k$ displayed positions and at the sum removes at most $k+\gcd(k,b)\le2k$ classes modulo $b$. Since $b>2k$ and all these moduli are coprime to the progression modulus and to one another, the product of the surviving local proportions is strictly positive. To justify the infinite sieve, each of the fixed forms is positive and $O(X)$ for $1\le n\le X$. For moduli $b>Y$, the number of affected starts is at most
```math
 O_{k,D}\left(X\sum_{b>Y}\frac1b+\#\{b\in\mathcal B:b\le O_{k,D}(X)\}\right),
```
where the sum is over the sieve family. Its counting function is $o(X)$ by convergence of the reciprocal sum (split at a large fixed bound). Taking the cutoff $Y$ to infinity now proves a positive lower density of surviving starts. Their sums exceed the entire window for large $n$, giving genuine forbidden configurations.

Finally, under changes on a set of upper logarithmic density zero, discard any start whose fixed window or whose target $kn+C$ meets the change set. The discarded starts have logarithmic density zero by the finite affine-map estimate in the [polynomial-coding proof](polynomial-codings.md).
