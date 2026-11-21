# A quantitative bound for exceptional maxima

Let $`E`$ be the set of largest denominators of counterexamples to Erdős’s Egyptian fraction gap conjecture. For sufficiently large $`Z`$,

```math
 \sum_{\substack{M\le Z\\M\in E}}\frac1M
 \ll \frac{\log Z}{\log\log Z}.
```

More locally, there are constants $`c>0`$ and $`J`$ such that every block of $`\lfloor c\log_2 n\rfloor`$ consecutive dyadic bins beginning at bin $`n`$ contains at most $`J`$ occupied bins when $`n`$ is sufficiently large. Bin $`j`$ is $`[2^j,2^{j+1})`$ and is occupied when it contains a member of $`E`$. The status of an individual largest denominator remains open. [Qualitative proof and definitions](log-density.md)

## Size of the constructed forms

Fix the number $`k`$ of forms in Maynard’s Theorem 3.4 for $`m=2`$, $`\epsilon=1/12`$. Use the shape $`z_1=0`$, $`z_{i+1}-z_i=2^{-a_i}`$ of the qualitative proof, with all offsets in $`[0,L]`$. All constants below can depend on $`k`$. [Maynard, Theorem 3.4](https://arxiv.org/abs/1405.2593)

Let $`F`$ be the number of unordered pairs of disjoint index pairs. Take the fixed integers $`e_i`$ from the [spacing construction](spacing.md), choose an integer $`C_0>2000(F+1+\max_i e_i)`$, and put $`B=C_0\,2^L`$. Take

```math
 b_i=Bz_i+1+v_i,\qquad v_i\in\{0,\ldots,F\}.
```

These are positive integers. Each of the $`F`$ forbidden determinants in the spacing construction is a nonconstant affine function of the $`v_i`$. It vanishes on at most $`(F+1)^{k-1}`$ grid points, by fixing all but one coordinate with nonzero coefficient. Their union misses a grid point. Each determinant at the chosen point has absolute value $`O_k(B)`$. Let $`P`$ be the product of their absolute values, taking the empty product as one. Then $`1\le P\ll_k B^F`$.

Put $`h_i=Pb_i+e_i`$ and $`A=PB`$. The error between $`(h_j-h_i)/A`$ and $`z_j-z_i`$ is at most $`(F+\max e_i)/B`$, less than $`2^{-L}/100`$. Thus every difference meets the one-percent relative error in the shape lemma. All $`h_i`$ are $`O_k(B^{F+1})`$. The divisibility argument uses only that the determinants divide $`P`$, so it applies unchanged. The common translation may be chosen nonnegative and smaller than the product of all the positive differences. Consequently the translated entries $`s_i`$ and their least common multiple $`D`$ are bounded by fixed powers of $`B`$. There is a constant $`C_1`$ satisfying

```math
 \max(A,D,s_1,\ldots,s_k)\le 2^{C_1(L+1)}.
```

## Uniformity of the prime and modular arguments

Take $`L=\lfloor c\log_2 n\rfloor`$ with $`c`$ small enough that the last display is at most $`n^{1/4}`$ for large $`n`$. Set $`X=2^n`$ and $`T=\lceil(4/5)AX/D\rceil`$. Then $`T\gg X/n^{1/4}`$ and $`T\ll Xn^{1/4}`$, so $`\log T\asymp n`$. Every slope $`D/s_i`$ is at most $`n^{1/4}`$, and every constant term is one. Theorem 3.4 permits any admissible tuple in these coefficient bounds, uniformly after its threshold depending on $`m,\epsilon`$. Apply it on $`[T,T+T^{3/4}]`$. Uniformly for the resulting $`t`$,

```math
 \frac{Dt+s_i}{AX}=\frac45+o(1).
```

The ceiling contributes at most $`D/(AX)`$, the additive entry contributes at most $`s_i/(AX)`$, and the relative interval length is $`T^{-1/4}`$. Thus the strict margins $`3/4`$ and $`7/8`$ in the qualitative proof still hold.

The two prime values exceed $`T`$. The cofactor cutoff $`H=\lceil e\max_i s_i\rceil`$ is $`O(n^{1/4})`$. Since $`\log(H\cdot H!)=O(H\log(H+1))=o(n)`$, both primes exceed $`H\mathop{\mathrm{lcm}}(1,\ldots,H)`$. The modular obstruction holds uniformly as well.

The greedy count now applies throughout the stated block with $`J=6(k-2)`$. For large $`U`$, the bins before $`\sqrt U`$ number at most $`O(\sqrt U)`$. Partition the remaining bins up to $`U`$ into blocks of length $`\lfloor c\log_2\sqrt U\rfloor`$ and at most one final incomplete block. Each full block has at most $`J`$ occupied bins, since its length fits within the local bound at its starting bin. The number of occupied bins through $`U`$ is $`O(U/\log U)`$. Use $`U=\lfloor\log_2 Z\rfloor`$ and the bounded harmonic weight of a dyadic bin to conclude.
