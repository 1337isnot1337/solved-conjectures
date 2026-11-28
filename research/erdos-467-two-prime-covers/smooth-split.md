# Two disjoint prime covers on a shorter interval

For sufficiently large $x$, let $H(x)$ be the largest integer $y$ for which the primes up to $x$ admit a red–blue partition and one residue class per prime so that every integer in $[1,y]$ belongs to at least one red class and at least one blue class. Write $\log_j$ for the $j$-fold iterated natural logarithm.

**Theorem.** There is an absolute $c>0$ such that, for all sufficiently large $x$,
```math
 H(x)\ge c x\frac{\log_3 x}{\log_2 x}.
```
[Erdős problem 467](https://www.erdosproblems.com/467) asks for both covers throughout $1\le n<x$. The prime partition as well as the classes may depend on $x$.

## Construction

Put $u=3\log_2 x/\log_3 x$, $z=x^{1/u}$ and $y=\lfloor x/(10u)\rfloor$. Give the primes $p\le z$ the colour blue. Choose their classes independently and uniformly. The expected number of integers in $[1,y]$ missed by blue is
```math
 y\prod_{p\le z}(1-1/p)=(e^{-\gamma}+o(1))yu/\log x
```
by Mertens' theorem. Fix a choice with at most that many misses. Give the primes in $(z,x/2]$ the colour red and the zero class. Since $y<x/2$, any integer in $[1,y]$ missed by red has all its prime factors at most $z$.

The standard uniform smooth-number estimate gives
```math
 \Psi(x,x^{1/u})\le x\exp(-(1+o(1))u\log u)
 = x(\log x)^{-3+o(1)} .
```
Here $u\to\infty$ and $u$ is only of order $\log_2 x/\log_3 x$. For example, Theorem 1.1 of Hildebrand and Tenenbaum's survey gives the uniform Dickman approximation in this range. The standard estimate for the Dickman function is recorded in Section 2. This bounds the red misses even if the larger interval $[1,x]$ is used to count smooth numbers. [Hildebrand and Tenenbaum, *Integers without large prime factors*](https://jtnb.centre-mersenne.org/article/JTNB_1993__5_2_411_0.pdf)

The primes in $(x/2,x]$ have not been assigned. Their number is $(1/2+o(1))x/\log x$, more than the combined number of red and blue misses. Assign one distinct unused prime to each missing colour at each integer, give it that colour, and choose the residue of that integer. An integer missed by both colours receives two distinct primes. All remaining primes may be assigned arbitrarily. This completes the two simultaneous covers and proves the theorem.

## Source and scope

Erdős and Graham ask the split-prime sieve question on printed page 93 of their [1980 monograph](https://mathweb.ucsd.edu/~ronspubs/80_11_number_theory.pdf). Bloom's formulation makes the quantifiers explicit. The original problem permits arbitrary colour classes and residues. The distinction from [problem 689](https://www.erdosproblems.com/689) is that two hits at an integer need not have opposite colours. The construction above enforces the colours at every point, at the cost of an interval shorter than $x$ by the displayed factor.
