# A uniform word diameter with exponent $`\log_\varphi 2`$

Let $`K_i`$ be the level-$`i`$ principal congruence subgroup of $`\mathrm{SL}_2(\mathbb Z_p)`$, with $`p`$ odd. Fix an open subgroup $`J\le K_1`$ and $`a\ge1`$ with $`K_a\subseteq J`$. Write $`D_n(S)`$ for the diameter of $`J/K_n`$ in a finite symmetric topological generating set $`S`$ of $`J`$, for $`n\ge a`$. Put $`\varphi=(1+\sqrt 5)/2`$ and $`\gamma=\log 2/\log\varphi`$. There are constants $`C,r_0`$ depending only on $`p,J,a`$ such that

```math
D_n(S)\le C(n/r)^\gamma D_r(S)\qquad(n\ge r\ge r_0).
```

In particular, the diameter for **every** generating triple of $`K_1`$ is $`O_p(n^\gamma)`$, where $`\gamma=1.44042\ldots`$. This also improves the $`O_{p,h}(n^{3/2})`$ diameter bound for the opposite-unipotent pair on the fixed open subgroup of its parameter shell. The construction adapts Kuperberg's use of short steps and approximate conjugators to congruence quotients. The argument below uses exact congruences. [Previous diameter estimate, entry 181](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539) · [Kuperberg, Sections 4.2–4.3](https://arxiv.org/html/2306.13158) · [Elkasapy's words and their leading digits in this group](DEPTH-WORDS.md)

## Two conjugators fill a congruence subgroup

Suppose $`t_1,t_2\in K_d`$ have linearly independent leading digits $`T_1,T_2\in\mathfrak{sl}_2(\mathbb F_p)`$. For $`[u,t]=utu^{-1}t^{-1}`$ the map

```math
(u,v)\longmapsto [u,t_1][v,t_2],\qquad u,v\in K_a,
```

takes independent normalized Haar measures onto normalized Haar measure on $`K_{d+a}`$. Its value modulo $`K_n`$ depends only on $`u,v`$ modulo $`K_{n-d}`$ when $`n\ge d+a`$.

Indeed, perturb $`u,v`$ on the left by elements of $`K_i`$ with leading digits $`X,Y`$, for any $`i\ge a`$. The output changes first by $`[X,T_1]+[Y,T_2]`$ modulo $`K_{d+i+1}`$ in units of $`p^{d+i}`$. This follows from $`[hu,t]=h[u,t]h^{-1}[h,t]`$. The conjugation of $`[u,t]\in K_{a+d}`$ contributes only at depth at least $`i+d+a`$. Conjugating any depth-$`d+i`$ correction by another factor in $`K_1`$ preserves its digit. For each nonzero $`T`$ the image of $`X\mapsto[X,T]`$ is the trace-orthogonal plane to $`T`$. The trace pairing is nondegenerate at odd $`p`$, and the traceless centralizer of $`T`$ is its line. The two distinct planes therefore sum to all of $`\mathfrak{sl}_2(\mathbb F_p)`$. Every desired next digit has exactly $`p^3`$ preimages among the $`p^6`$ possible pairs. Starting with the identity residue modulo $`K_{d+a}`$ and lifting gives the stated map at every finite depth, hence the Haar assertion.

Approximate a target first modulo $`K_{d+a}`$, then write its residual as the displayed product. To realize this product modulo $`K_n`$ we need only approximate its two conjugators modulo $`K_{n-d}`$. If the latter precision exceeds $`a`$, a word representing such a conjugator at that precision itself belongs to $`K_a`$. At equality the residual already vanishes. We obtain

```math
D_n(S)\le D_{d+a}(S)+4D_{n-d}(S)+2|t_1|_S+2|t_2|_S .
```

## The choice of scale

For $`k\ge a`$ with $`k+1\le r`$, a word of length at most $`D_r(S)`$ produces any first digit at depth $`k`$. Choose digits on the axes $`H=\mathrm{diag}(1,-1)`$, $`E_{12}+E_{21}`$ and $`E_{12}-E_{21}`$. Starting the [word recursion](DEPTH-WORDS.md) with both seed depths equal to $`k`$ produces two independent axes at each depth $`d=k F_{j+2}`$. Each resulting word has length at most $`3\cdot 2^j D_r(S)\ll F_{j+2}^{\gamma}D_r(S)`$, uniformly in $`j,k,S`$.

Fix $`0<\beta<1/4`$ with $`4\beta^{\gamma-1}\le1/4`$. Take $`r_0`$ sufficiently large in terms of $`a,\beta`$. For $`n\ge 2r/\beta`$, let $`F`$ be the largest Fibonacci number at most $`4n/r`$, so $`2n/r\le F\le4n/r`$. The interval $`[(1-\beta)n,(1-\beta/2)n]`$ has length at least $`F`$ when $`r\ge8/\beta`$. It contains a multiple $`d=kF`$ with $`a\le k\le r-1`$, since $`k\ge(1-\beta)r/4`$ and $`k\le r/2`$. We have thus produced the two needed words for a total length $`O((n/r)^\gamma D_r(S))`$.

With $`x=(n-d)/n\in[\beta/2,\beta]`$, increase $`r_0`$ if needed so that $`a/n\le\beta/8`$. Both $`d+a`$ and $`n-d`$ are smaller than $`n`$ and at least $`r`$. Since $`\gamma>1`$,

```math
\left(\frac{d+a}{n}\right)^\gamma+
4\left(\frac{n-d}{n}\right)^\gamma
\le 1-x+a/n+4x^\gamma\le1-\beta/4 .
```

For the initial range $`r\le n\le2r/\beta`$, the preceding two-conjugator bound gives $`D_{2s-a}(S)\le9D_s(S)`$ for every $`s\ge r`$. Take $`d=s-a`$ and produce $`t_1,t_2`$ directly modulo $`K_s`$. A bounded number of iterations suffices because $`2s-a\ge3s/2`$ for $`s\ge2a`$. Thus $`D_n(S)\ll_{a,\beta} D_r(S)`$ throughout the initial range. For larger $`n`$, induction and the strict contraction above absorb the cost of the two words by increasing $`C`$ once. This proves the relative bound. At a fixed $`r=r_0`$ the finite group bounds $`D_r(S)`$ for all markings, giving the absolute bound. Taking $`n=d+1`$ also gives a word of length $`O_p(d^\gamma)`$ for any prescribed digit at **every** depth in $`K_1`$.

The integer check evaluates the two commutators in congruence quotients and counts the multiplicity of every target in two successive output digits. It also verifies digit lifting for higher precisions with nontrivial seed perturbations. A diameter bound controls the length of a path to each target. The six-move random walk still needs a positive level-independent spectral gap. [Verification script](check_diameter.py) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/592)
