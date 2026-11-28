# Full extensions for finite prefixes of affine powers of a prime

Let $p$ be a fixed prime and let $b,d$ be fixed integers with $d\ne0$. Every finite subset $A$ of the positive integers of the form
```math
 b+d p^j,\qquad j\ge0,
```
admits extensions with coefficient tending to one. More precisely, for every cutoff $N\ge\max A$, and all sufficiently large powers $q$ of $p$, there is an integer Sidon set in $[1,q^2-1]$ of size at least $q-N$ whose intersection with $[1,N]$ equals $A$. This gives the full extension for this family of prescribed prefixes in [Erdős #44](https://www.erdosproblems.com/44). For example it applies to $1,2,4,8$ and every longer finite prefix of the powers of two.

Write $G=\mathbb F_{q^2}^{\times}$, $m=q^2-1$, and let $V$ be the affine line of elements with trace one down to $\mathbb F_q$. This has $q$ elements and excludes zero. Every $w\in G\setminus\mathbb F_q^{\times}$ occurs exactly once as $x/y$ with $x,y\in V$. Indeed $\mathrm{Tr}(y)=\mathrm{Tr}(wy)=1$ imposes independent linear equations by nondegeneracy of the trace pairing. A scalar $w\in\mathbb F_q^{\times}$ other than one cannot occur. Hence discrete logarithms of $V$ form a modular Sidon set. This is the affine-line construction of [Bose and Chowla](https://www.theoryofnumbers.com/melnathanson/pdfs/nath2022-198.pdf).

For a nontrivial multiplicative character $\chi$ the same ratio count gives
```math
 \left|\sum_{x\in V}\chi(x)\right|^2
  =q+\sum_{w\in G\setminus\mathbb F_q^{\times}}\chi(w)
  =q-\sum_{w\in\mathbb F_q^{\times}}\chi(w)\le q .
```
For each subgroup $H\le G$, averaging its annihilating characters gives $|V\cap H|=q|H|/m+O(\sqrt q)$ uniformly. Let $g=\gcd(|d|,m)$ and $s=m/g$. Apply Möbius inversion to the unique subgroups of orders $s/e$ for divisors $e\mid s$. The number of points in $V$ of exact order $s$ is
```math
 q\,\varphi(s)/m+O(2^{\omega(s)}\sqrt q).
```
It is positive for large $q$. Here $g\le|d|$ is bounded, $2^{\omega(s)}=s^{o(1)}$ by the factorial lower bound on the product of distinct primes, and $\varphi(s)/s\ge2^{-\omega(s)}$.

Choose such a point $x$. It equals $\alpha^d$ for a generator $\alpha$ of $G$. In a fixed generator's coordinates the exponent of $x$ is $g v$ with $v$ coprime to $s$. Solve $(d/g)u=v\bmod s$ for $u$ prime to $s$, and choose a lift avoiding each prime divisor of $m$ not dividing $s$ by the Chinese remainder theorem. The generator with exponent $u$ has the required power. Because trace commutes with Frobenius and fixes one, every $x^{p^j}$ is in $V$. Thus $b+\log_\alpha V$ contains all the desired residues and is modular Sidon. Using representatives in $[1,m]$ gives an integer Sidon set; remove the points up to $N$ outside $A$. For $m>N$ all prescribed points survive. This proves the assertion.

The [Alexeev–Mixon obstruction](https://arxiv.org/abs/2510.19804) rules out perfect difference sets of prime order parameter for $1,2,4,8$. The Bose sets used here have modulus $q^2-1$, and their missing differences are precisely the nonidentity subfield scalars in multiplicative coordinates.
