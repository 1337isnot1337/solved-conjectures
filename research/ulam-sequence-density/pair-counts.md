# Recovering the density from counts of pairs

Write $`r(n)`$ for the number of unordered pairs of distinct Ulam terms summing to $`n`$, and put $`B(N)=\sum_{n\le N}r(n)`$. Counting every representation gives a criterion for the existence of the limit as well as its positivity.

**Proposition.** For any set of positive integers with counting function $`A`$ and the same convention for $`r`$,

```math
\lim_{N\to\infty}\frac{B(N)}{N^2}=b
\quad\Longleftrightarrow\quad
\lim_{N\to\infty}\frac{A(N)}N=2\sqrt b
\qquad (b\ge0).
```

One may discard all targets with $`r(n)\le h(n)`$ for any nonnegative $`h(n)=o(n)`$. Their cumulative contribution is at most $`\sum_{n\le N}h(n)=o(N^2)`$.

**Proof.** Suppose first that $`A(N)/N\to\delta`$. The identity

```math
2B(N)=\sum_{u\in U,\,u\le N} A(N-u)-A(\lfloor N/2\rfloor)
```

removes the diagonals from the ordered count. Uniformly for integers $`0\le t\le N`$ we have $`A(t)=\delta t+o(N)`$. Also $`\sum_{u\le N}(N-u)=\int_0^N A(t)\,dt`$, where the sum runs over members. Substitution gives $`B(N)=\delta^2N^2/4+o(N^2)`$.

Conversely suppose $`B(N)/N^2\to b`$. Let $`F(s)=\sum_{u\in U}e^{-su}`$ and $`G(s)=\sum_{n\ge1} r(n)e^{-sn}`$. For $`s>0`$ summation of nonnegative terms gives $`G(s)=s\int_0^\infty B(\lfloor x\rfloor)e^{-sx}\,dx`$. After setting $`t=sx`$, dominated convergence gives $`s^2G(s)\to 2b`$ as $`s\downarrow0`$, since $`s^2B(\lfloor t/s\rfloor)\le t^2/2`$. Use the ordered-pair identity and the bound for its diagonal,

```math
F(s)^2=2G(s)+F(2s),\qquad F(2s)\le (e^{2s}-1)^{-1}.
```

Taking the nonnegative square root gives $`sF(s)\to\delta=2\sqrt b`$. To pass back to ordinary counts, place mass $`e^{-u/N}/N`$ at each point $`e^{-u/N}`$ in $`[0,1]`$. The moment of order $`j\ge0`$ of this measure is $`F((j+1)/N)/N\to\delta/(j+1)`$. These are the moments of $`\delta\,dt`$. Polynomial approximation of continuous functions and bounded total mass give weak convergence to that measure. The bounded test function $`\mathbf1_{[e^{-1},1]}(t)/t`$, defined as zero below $`e^{-1}`$, has only one discontinuity and the limit measure gives it no mass. Its integral is $`A(N)/N`$ and its limiting integral is $`\delta`$. This proves the reverse implication.

## Adjacent targets

If $`r(n)+r(n+1)\ge cn`$ for all sufficiently large $`n`$ with fixed $`c>0`$, summing through $`N-1`$ gives $`cN^2/2+O(N)\le2B(N)\le A(N)(A(N)-1)`$. Thus the lower density is at least $`\sqrt{c/2}`$.

Even a bound on how often **both** neighbors lack a representation would improve the unconditional growth estimate. For $`N\ge3`$ let $`Z(N)`$ count the indices $`3\le n<N`$ with $`r(n)=r(n+1)=0`$. If $`T(N)`$ counts the represented integers through $`N`$, then $`2T(N)\ge N-3-Z(N)`$, by counting neighbors of represented sites. Exactly $`A(N)-2`$ sites have a single representation. All others counted by $`T`$ contribute at least two pairs. Hence

```math
\binom{A(N)}2\ge B(N)\ge N-1-Z(N)-A(N).
```

An estimate $`Z(N)=o(N)`$ would already imply $`A(N)\ge(\sqrt{2}-o(1))\sqrt N`$. There is also an elementary joint bound with the [number of multiply represented targets](record-lows.md). Since $`T(N)=A(N)-2+H(N)`$,

```math
\frac{A(N)}{N} \ge \frac{1+(1-Z(N))/N}{2(1+H(N)/A(N))}.
```

For example, $`Z(N)=o(N)`$ and $`H(N)\le11A(N)`$ along infinitely many integer density records would give lower natural density at least $`1/24`$.

| $`N`$ | $`B(N)`$ | Unrepresented integers from 3 through $`N`$ |
|---:|---:|---:|
| 65,536 | 6,528,918 | 11,944 |
| 262,144 | 97,190,325 | 48,483 |
| 1,048,576 | 1,511,448,512 | 195,099 |
| 4,194,304 | 24,109,330,932 | 780,316 |
| 16,777,216 | 385,780,017,641 | 3,123,359 |

In this entire range $`Z(N)=0`$. The first unrepresented integers after the seeds are 23 and 25. All 11,944 unrepresented positions through 65,536 agree term for term with Ruud H. G. van Tol's table for Jud McCranie's sequence. Ross also measured the concentration of unrepresented targets at the empirical phase. [OEIS A033629 data](https://oeis.org/A033629/b033629.txt) · [Ross, Section 6.2.2](https://asset.library.wisc.edu/1711.dl/6DJJQWLMRTYIH8U/R/file-fb00e.pdf)

Over all $`3\le n<16{,}777{,}216`$ the minimum of $`(r(n)+r(n+1))/n`$ is exactly $`802/4790771`$, with the two counts 802 and 0. This exceeds $`1/6000`$. The stronger bound $`1/5900`$ first fails at 4,021,409. The [exact replay](record_lows.cpp) compares integer products after verifying every representation count with a second polynomial calculation. Proving the $`1/6000`$ estimate at all large indices would give lower density at least $`1/\sqrt{12000}`$. Establishing a positive quadratic limit for $`B`$ would settle the full density question. Both estimates remain open.

## A positive lower density without convergence

For **any finite genuine prefix** there is an infinite extension $`V`$ in which every selected nonseed has exactly one representation. This extension has bounded gaps. Every represented integer has a representation using a member of a fixed finite prefix. In every interval of a fixed length there is a target with linearly many representations, once the interval starts sufficiently far out. Nevertheless the lower and upper natural densities of $`V`$ are different.

**Construction.** Let $`p<q`$ be the final two terms of the prescribed prefix. Append

```math
a=p+q,\qquad d=p+2q,\qquad a+d,\qquad 2d .
```

The first number is the largest distinct-pair sum in the old prefix, so it also exceeds any cutoff through which that prefix was prescribed. The second has the unique pair $`a,q`$, as two old terms cannot reach it. The third is again the sum of the largest two terms. The fourth has the unique pair $`a+d,q`$, since $`d-a=q`$ and all pairs omitting $`a+d`$ sum to at most $`a+d`$. The only multiples of $`d`$ present are $`d,2d`$.

Take an infinite binary word $`y_0y_1\cdots`$ starting with the block $`110`$ and continuing with any concatenation of $`110`$ and $`11010`$. For indices $`j\ge3`$, add $`a+jd`$ precisely when $`y_j=1`$. The first two ones already give $`a,a+d`$, and $`a+2d`$ is absent. At $`j=3`$ the chosen term is the largest previous pair sum $`(a+d)+2d`$. For $`j\ge4`$ two terms from the fixed prefix cannot reach the target. Two terms from the progression have residue $`2a`$ modulo $`d`$, different from $`a`$. A progression term needs partner $`d`$ or $`2d`$ to reach the target, and the only possible pairs are indexed by $`j-1,j-2`$. The word has no $`00`$ and no $`111`$. Hence every selected term has exactly one of these predecessors, giving the required uniqueness.

Every sum of two progression terms is $`2a+hd`$. If its original pair uses two terms beyond $`2d`$, then $`h\ge7`$. At least one of $`y_h,y_{h-1}`$ equals one. Thus the sum also has a representation using $`a`$ or $`a+d`$, respectively. All other represented targets already have a summand at most $`2d`$. In particular the [large-summand residual count](large-summands.md) with this cutoff vanishes everywhere.

Let $`Y=\{j:y_j=1\}`$. Each complete block has at least a $`3/5`$ fraction of ones, and a partial block costs only a constant. The sets $`Y\cap[0,h]`$ and $`h-(Y\cap[0,h])`$ therefore intersect in at least $`(h+1)/5-O(1)`$ indices. Removing the possible diagonal and dividing by two gives at least $`h/10-O(1)`$ distinct unordered pairs at $`2a+hd`$. Every interval of $`d`$ consecutive integers contains a target in this residue class.

Finally alternate stages of the two block types, repeating the chosen block $`2^{2^i}`$ times in stage $`i`$. Each new stage eventually dominates the total length of the preceding stages. Complete blocks have one-fractions between $`3/5`$ and $`2/3`$, and the stage endpoints attain both as subsequential limits. It follows that

```math
\underline d(V)=\frac{3}{5d},\qquad \overline d(V)=\frac{2}{3d}.
```

The maximum eventual gap is $`2d`$. The omitted-site condition of the original problem is essential here. For example, at the fourth bit of each $`11010`$ block the chosen bit is one, and the following zero has exactly one of its preceding two bits equal to one. At all sufficiently large occurrences its progression target is consequently an omitted singleton.

For a window of exactly **two** consecutive targets there is a simpler example starting with the genuine terms $`1,2,3,4`$. Keep only the even terms 2 and 4 and choose the odd terms $`2j+1`$ for $`j\in Y`$. Every selected odd term beyond the seed again has exactly one of the two even shifts. The even term 4 has only the pair $`1+3`$. At $`2h`$ the odd-odd pairs are indexed by $`i+j=h-1`$ and the intersection estimate gives $`r(2h)\ge h/10-O(1)`$. Thus the sum of the representation counts at adjacent targets is at least $`n/20-O(1)`$ for every large $`n`$. All sufficiently large even decisions are correct because they have many pairs. The lower and upper densities are $`3/10`$ and $`1/3`$. The first missed compulsory term is 6. This shows explicitly why an all-scale adjacent lower bound by itself supplies only the lower-density part of the desired conclusion. [Direct checks of the arbitrary-prefix construction](sparse_completion.py)
