# Shapiro’s conjecture in a fixed contracting number field

The [ordinary-prime omission theorem](shapiro-research.md) concerns systems that retain most of the ordinary primes. Here is an upper bound in a different class. It explains the limitation of using a fixed number field and requiring the conjugates in every other embedding to have absolute value at most one.

**Theorem.** Let $K\subset\mathbb R$ be a fixed number field of degree greater than one. Let $A$ be a multiplicatively independent set of algebraic integers in $K$ greater than one, with $|\sigma(a)|\le1$ for every $a\in A$ and every embedding $\sigma\colon K\to\mathbb C$ other than the given real embedding. There is a constant $c_K\gt0$, independent of $A$, such that for all sufficiently large $x$,

```math
\#(A\cap[1,x])\le (1-c_K)\pi(x).
```

Multiplicative independence follows from the separation hypothesis in Shapiro's question. The theorem itself does not require any quantitative separation.

## Allowed prime ideals

Write the archimedean places as $v_1,\ldots,v_s$, with $v_1$ the given real place. Write $d_j=1$ at a real place and $d_j=2$ at a complex place. An allowed $a$ satisfies

```math
|N_{K/\mathbb Q}(a)|=a\prod_{j>1}|v_j(a)|^{d_j}\le a.
```

Every prime ideal dividing $(a)$ for $a\le x$ has norm at most $x$. Fix $0\lt\epsilon\lt\log 2$. If a prime ideal $\mathfrak p$ of norm greater than $e^{-\epsilon}x$ divides $(a)$, then $(a)=\mathfrak p$. Indeed, any other integral ideal factor with norm greater than one multiplies its norm by at least two.

Define the logarithmic vector

```math
\mathcal L(a)=\big(d_j\log|v_j(a)|\big)_{j=1}^s
 -\mathbf e_1\log|N_{K/\mathbb Q}(a)|,
```

in the hyperplane $H=\{z:\sum_jz_j=0\}$. By the Dirichlet unit theorem, the vectors $\mathcal L(u)$ for units $u$ form a full lattice $\Lambda$ in $H$. The class of $\mathcal L(a)$ modulo $\Lambda$ depends only on the principal ideal $(a)$. For $a\le x$ with $(a)=\mathfrak p$ in the indicated norm range, this class belongs to the image $B_\epsilon$ in $H/\Lambda$ of

```math
\{z\in H:z_j\le0\ (j>1),\ 0\le z_1\le\epsilon\}.
```

The condition on the other places gives $z_j\le0$. Also $z_1=\log(a/N\mathfrak p)\le\epsilon$. Since $K$ has a real place and degree greater than one, $s-1\ge1$. Choose $\epsilon\gt0$ sufficiently small that this simplex projects injectively to the torus and its normalised Haar measure $\mu(B_\epsilon)$ is less than $1/2$.

## Counting prime ideals in the allowed region

The logarithmic classes of principal prime ideals equidistribute in $H/\Lambda$ as their norms increase. Here is the Hecke-character argument in these coordinates. Each character of $H/\Lambda$ gives a unitary character of principal ideals via $\mathcal L$. It extends to a Hecke character of fractional ideals, with finite conductor one. To extend it, choose ideal representatives for a cyclic decomposition of the finite ideal class group and choose roots of the values on their principal powers. On principal ideals the character is still the prescribed archimedean monomial of the absolute values.

For a nontrivial torus character, this extension and any twist by a class-group character are inequivalent to finite-order characters under twisting by $\mathfrak a\mapsto(N\mathfrak a)^{it}$. A finite-order character has zero logarithmic archimedean coefficients. On principal ideals the coefficient of $\log|v_1(a)|$ in the logarithmic character is zero. A norm twist with the same property must have $t=0$. To compare these coefficients, the archimedean images of elements of $K$ are dense in the product of the real and complex completions by rational approximation of the coordinates on a field basis. The remaining coefficients can all be zero only for the trivial torus character. The Hecke prime ideal theorem therefore gives cancellation for each nontrivial torus character, also after restriction to principal primes by class-group orthogonality. For the trivial character the principal prime count is asymptotic to $\operatorname{Li}(x)/h_K$, where $h_K$ is the class number. Weyl's criterion gives the asserted equidistribution. The boundary of $B_\epsilon$ has Haar measure zero.

- [Maynard, *Primes represented by incomplete norm forms*, Lemma 4.5](https://doi.org/10.1017/fmp.2019.8)
- [Rajan, *Distribution of values of Hecke characters of infinite order*](https://matwbn.icm.edu.pl/ksiazki/aa/aa85/aa8537.pdf)

Subtracting the count at $e^{-\epsilon}x$ from the count at $x$, the number of possibly usable prime ideals with norm in this interval is at most

```math
\left((1-e^{-\epsilon})\frac{\mu(B_\epsilon)}{h_K}+o(1)\right)\pi(x).
```

The number at norm at most $e^{-\epsilon}x$ is $(e^{-\epsilon}+o(1))\pi(x)$ by the prime ideal theorem. If an independent set of elements is supported on $r$ prime ideals, its size is at most $r+s-1$. Indeed, the ideal valuation map takes values in $\mathbb Z^r$ and its kernel is contained in the unit group of rank $s-1$. This proves the theorem with, for example, $c_K=(1-e^{-\epsilon})/4$.
