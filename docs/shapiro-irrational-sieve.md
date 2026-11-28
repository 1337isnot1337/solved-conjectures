# Irrational generators in Shapiro’s conjecture

This supplies the irrational case of [the ordinary-prime omission theorem](shapiro-research.md). It also gives a count for pairs of integers on the two sides of an irrational dilation.

**Theorem.** Suppose $`E`$ is a set of relative density zero among the primes. Let $`S_E`$ be the positive integers whose prime factors lie outside $`E`$, and put $`W(Y)=\prod_{p\in E,\ p\le Y}(1-1/p)`$. For a fixed irrational $`\lambda\gt1`$ and the denominators $`Q`$ of its continued-fraction convergents, along $`X=Q^2`$ we have

```math
\#\{1\le n\le X:n\in S_E,\ \lfloor\lambda n\rfloor\in S_E\}
\sim XW(X)^2.
```

In particular, the pair $`(n,m)`$ with $`m=\lfloor\lambda n\rfloor`$ violates unit separation if a multiplicative semigroup contains $`S_E`$ and $`\lambda`$.

## Lattice counts with congruences

At $`X=Q^2`$ use the area-preserving map

```math
T(n,m)=(n/Q,\ Q(\lambda n-m)).
```

The region $`0\lt n\le X`$, $`0\lt\lambda n-m\lt1`$ maps to a square of side $`Q`$, with the indicated half-open boundary. For convergents $`a/Q`$ and $`a'/Q'`$ of consecutive indices, the vectors $`T(Q,a)`$ and $`T(Q',a')`$ give a basis of $`\Lambda=T\mathbb Z^2`$. Both vectors have coordinates bounded by 1 in absolute value. The bound on the second coordinate uses $`|\lambda Q-a|\lt 1/Q_{\rm next}`$ and $`|\lambda Q'-a'|\lt1/Q`$. Their determinant has absolute value 1. Thus the shortest length in $`\Lambda`$ is bounded below by an absolute constant. In particular the number of nonzero lattice vectors in a ball of radius $`R`$ is $`O(R^2)`$ whenever the ball contains a nonzero vector.

We will also use $`\Lambda_h`$ for the sublattice with $`h\mid n`$, and $`\Lambda'_h`$ for the one with $`h\mid m`$. Either has covolume $`h`$. For any one of these lattices $`L`$, write $`\ell(L)`$ for the shortest length of a nonzero vector. A translate of $`dL`$ meets the square in

```math
\frac{X}{d^2\det L}+O\left(1+\frac{Q}{d\ell(L)}\right)
```

points, by the two-dimensional lattice-counting estimate in terms of the first successive minimum. The estimate applies to the translated region as well. Adding or dropping a side of length $`Q`$ changes the bound by $`O(1+Q/(d\ell(L)))`$.

- [Barroero and Widmer, *Counting lattice points and o-minimal structures*, equation (1.2)](https://www.ma.rhul.ac.uk/mwidmer/Publications/Omincount_final.pdf)

For $`L=\Lambda_h`$ use integer coordinates $`(n/h,m)`$ on the lattice, and for $`L=\Lambda'_h`$ use $`(n,m/h)`$. At each sifting prime $`r`$, erase one coordinate’s zero residue or both coordinates’ zero residues. For a squarefree product $`d`$ of these primes, the simultaneous erased set occupies $`\rho(d)\le 2^{\omega(d)}d`$ residue pairs modulo $`d`$, by the Chinese remainder theorem. Each residue pair corresponds to one translate of $`dL`$. The count for these congruences is

```math
\frac{X}{\det L}\frac{\rho(d)}{d^2}
+O\left(2^{\omega(d)}\left(d+\frac Q{\ell(L)}\right)\right).
```

The local retained densities are $`1-1/r`$ or $`(1-1/r)^2`$, so Mertens’ theorem gives the uniform dimension-two product bound. With sieve level $`D`$ and range $`z=D^{1/s}`$, the fundamental lemma bounds the sifted total above and below by

```math
(1+O(e^{-s}))\frac{X}{\det L}U(z)
 +O\left(D\log(2D)\frac Q{\ell(L)}+D^2\log(2D)\right),
```

where $`U(z)`$ is the product of the local retained densities. We will use the displayed error as a two-sided bound on the difference from the main term.

- [Tao, *Some sieve theory*, Corollary 19](https://terrytao.wordpress.com/2015/01/21/254a-notes-4-some-sieve-theory/)

## Small and medium omitted primes

The prime number theorem and partial summation give $`W(X)=(\log X)^{-o(1)}`$ and $`W(X^c)/W(X)\to1`$ for each fixed $`c\gt0`$. Fix an error tolerance $`\varepsilon\gt0`$. On $`\Lambda`$ use level $`D=X^{1/8}`$ and range $`X^c`$ with $`c\gt0`$ sufficiently small depending on $`\varepsilon`$. Both coordinates are sifted by $`E`$. The count passing this first sieve is $`(1+O(\varepsilon)+o(1))XW(X)^2`$ along $`X=Q^2`$.

Fix $`0\lt\delta\lt\min(c,1/10)`$. A failure at an omitted prime $`p`$ in the range $`X^c\lt p\le X^{1-\delta}`$ lies on $`\Lambda_p`$ or $`\Lambda'_p`$. In either case we may use upper sieve level $`D_0=X^{\delta/10}`$ and a range $`z_0=X^{c_0}`$ with a sufficiently small fixed $`0\lt c_0\lt c`$. Both original coordinates can be sifted by the primes in $`E`$ up to $`z_0`$, because $`p`$ is invertible at each of those primes. The main terms summed over $`p`$ are at most a constant times

```math
XW(z_0)^2\sum_{X^c\lt p\le X^{1-\delta},\ p\in E}\frac1p=o(XW(X)^2).
```

For the remainders, consider the primes in $`[P,2P)`$ from this range. For $`R\le\sqrt P`$, each prime satisfying $`\ell(\Lambda_p)\le R`$ divides the nonzero $`n`$ coordinate of some lattice vector in the radius-$`R`$ ball. The $`n`$ coordinate is nonzero because every nonzero vector with $`n=0`$ has length at least $`Q`$, while $`R\le X^{(1-\delta)/2}\lt Q`$. Moreover $`|n|\le QR\le X`$. Each such $`n`$ has at most $`1/c`$ prime divisors above $`X^c`$. There are $`O(R^2)`$ vectors, so there are $`O_c(R^2)`$ primes satisfying this short-vector condition. The same bound holds for $`\Lambda'_p`$, since $`m=0`$ implies length at least $`\lambda Q`$ for a nonzero vector and $`|m|\le\lambda QR+R/Q=O_\lambda(X)`$ otherwise.

Dyadically summing the inverse lengths up to $`\sqrt P`$, then using $`O(P)`$ primes for the lengths above $`\sqrt P`$, gives

```math
\sum_{p\in[P,2P)}\left(\ell(\Lambda_p)^{-1}+\ell(\Lambda'_p)^{-1}\right)
\ll_{c,\lambda}\sqrt P
```

with the sum restricted to the medium range. Thus the total sieve remainder for medium primes is bounded by a constant times

```math
D_0\log(2D_0)Q X^{(1-\delta)/2}
 +D_0^2\log(2D_0)X^{1-\delta}=o(XW(X)^2).
```

## Large omitted primes

Suppose $`n=hp`$ for a prime $`p\gt X^{1-\delta}`$. Then $`h\le X^\delta`$, and every survivor of the first sieve has $`h\in S_E`$. On $`\Lambda_h`$, sieve the coordinate $`n/h`$ by all primes up to $`z_1=X^{c_1}`$, using $`0\lt c_1\le c`$ sufficiently small for level $`D_1=X^{1/8}`$. This upper bounds the requirement that $`n/h=p`$ is prime. Sift $`m`$ by $`E`$ up to the same range. The retained product is

```math
\prod_{r\le z_1}(1-1/r)\, W(z_1)\ll_{c_1}\frac{W(X)}{\log X}.
```

The lattice count gives the upper bound $`O_{c_1}(XW(X)/(h\log X))`$ plus the remainder. If it is $`m`$ that has a large prime factor, use $`\Lambda'_h`$ with $`h\le\lambda X^\delta`$ and exchange the two coordinates. Both lattice minima are bounded below by that of $`\Lambda`$. The sum of the sieve remainders for $`h`$ in this range is $`O_\lambda(X^\delta(D_1 Q+D_1^2)\log X)`$, which is $`o(XW(X)^2)`$.

For $`Y=\lambda X^\delta`$, Euler’s product gives $`\sum_{h\le Y,\ h\in S_E}h^{-1}\ll W(Y)\log Y`$. Since $`W(Y)\sim W(X)`$ for each fixed $`\delta`$, the large primes altogether remove at most $`O_{c_1,\lambda}(\delta XW(X)^2)+o(XW(X)^2)`$. Choose $`\delta`$ small enough after fixing $`c`$ and $`c_1`$ that this contribution is $`O(\varepsilon XW(X)^2)`$. The upper and lower estimates then differ from the claimed main term by $`O(\varepsilon XW(X)^2)+o(XW(X)^2)`$. Taking $`\varepsilon`$ arbitrarily small proves the theorem.
