# Circulant maxima when the line sum does not divide the order

Fix an integer $`t\ge2`$. Suppose $`k/n\to1/t`$ from above, and put $`a=tk-n\ge0`$, so $`a=o(n)`$. Let $`M`$ and $`C`$ denote respectively the maximum of $`\mathop{\mathrm{per}}(G/k)/d_n`$ over all binary $`k`$-regular matrices of order $`n`$ and over the circulants. Here $`d_n=n!/n^n`$. Put $`d=\max\{j<t:j\mid n\}`$. Then

```math
 M\asymp_t \frac{n^{(t-1)/2}}{\sqrt{1+a}},\qquad
 C\asymp_t\begin{cases}
 n^{(d-1)/2},&t\nmid n,\\[2pt]
 \displaystyle\max\left(n^{(d-1)/2},\frac{n^{(t-1)/2}}{(1+a)^{(t-t/p)/2}}\right),&t\mid n,
 \end{cases}                                                    \tag{1}
```

where $`p`$ is the smallest prime divisor of $`t`$. In particular for every $`t\ge3`$ and every such sequence with $`a\to\infty`$, unrestricted matrices eventually beat every circulant, even on multiples of $`t`$. The possible loss is governed by the smallest prime divisor of the *limiting reciprocal density*, distinct from a prime-order hypothesis on $`n`$. This concerns the full maxima on the indicated moving bands. The unrestricted [Minc Problem 12](https://yair-lavi.com/mincs-list/problem-12/index.html) and [Problem 4](https://yair-lavi.com/mincs-list/problem-4/index.html) remain open. The [fixed-band theorem](dense_maxima.md) covers reciprocal densities bounded away from the next integer. We use the [two-sided dense determinant comparison](../real-radius/dense_spectral_comparison.md) throughout.

## Arbitrary regular supports

Let $`h`$ be the number of classes in the near-disconnection partition in the proof of the dense determinant comparison. All upper and lower bounds in that proof hold along subsequences. For a normalized binary matrix $`G/k`$ the internal rectangle estimate $`x_{gg}\le r_gc_g/k`$ and the $`o(n)`$ cross mass give $`r_g,c_g\ge k-o(n)`$, so $`h\le t`$. For $`h<t`$ the upper bound is $`O(n^{(t-2)/2})`$. This fits (1) since $`a=o(n)`$. For $`h=t`$, each $`c_g/k\to1`$. Every class with $`r_g<k`$ sends at least $`c_g(1-r_g/k)`$ units of column mass to rows outside it. Since $`\sum_g (k-r_g)_+\ge tk-n=a`$, the total off-diagonal mass is at least a fixed multiple of $`a`$. Some edge has weight at least $`c_t a`$. A maximum-weight tree contains an edge at least that heavy. Formula (3) and its upper bound in the dense comparison give $`M=O(n^{(t-1)/2}/\sqrt{1+a})`$ by the subsequence criterion.

For a lower bound take $`t-2`$ complete $`k`$-blocks, leaving $`m=2k-a`$ vertices on each side. Split these into two groups of sizes $`u=\lfloor m/2\rfloor`$ and $`v=\lceil m/2\rceil`$. A simple explicit $`k`$-regular matrix is the **complement within this last block** of a direct sum of two $`(m-k)`$-regular matrices, one on each group; these exist because $`m-k\le u`$. Thus it contains both full off-diagonal rectangles and each diagonal rectangle has normalized total $`u(u-m+k)/k`$ or $`v(v-m+k)/k`$. These two totals are $`O(1+a)`$. Relabel its two column groups in the opposite order. The matched rectangles now have macroscopic total, and only the two cross edges between these last groups can have positive leakage. Applying the entropy tree bound (2) of the dense comparison with all $`t`$ groups gives the claimed lower bound. Zero leakage and unequal row and column group sizes are allowed. This construction also works at $`a=0`$.

## Circulants

For a step set $`S\subset\mathbb Z/n`$ of size $`k`$, its singular values are $`|b_\chi|`$, $`b_\chi=k^{-1}\sum_{s\in S}\chi(s)`$. Parseval gives $`\sum|b_\chi|^2=n/k\to t`$. On a subsequence the characters with magnitudes tending to one comprise a subgroup $`H`$ of fixed order $`h\le t`$, with all other magnitudes bounded away from one: sort the top $`t+1`$ and take limits, then use closure under quotients. Indeed each near-maximal character is $`o(1)`$ in mean square from a unit constant on the uniform measure of $`S`$, as is the quotient of two such characters. Necessarily $`h\mid n`$. The singular values outside $`H`$ contribute only a bounded factor to the regularized determinant since their squared sum is bounded. If $`h<t`$, the bound is $`O(n^{(d-1)/2})`$. A matching lower option is always attained by choosing $`k`$ steps within the subgroup of order $`n/d`$, which has room eventually. The normalized matrix splits into $`d`$ identical stochastic blocks and van der Waerden supplies the lower bound.

It remains to analyze $`h=t`$ when $`t\mid n`$. In the quotient by the annihilator of $`H`$, of order $`t`$, all but $`o(k)`$ of the steps occupy a single coset. For example the generator of $`H`$ takes values at the vertices of a regular $`t`$-gon and has mean of modulus tending to one. Translate the main coset to zero, which does not change any Fourier modulus. It holds at most $`n/t`$ steps. Some other coset $`j`$ therefore holds at least $`(k-n/t)/(t-1)`$ steps when the surplus is positive. From

```math
 1-|b_\chi|^2=k^{-2}\sum_{u,v\in S}(1-\Re(\chi(u-v)))
```

it follows that every character of $`H`$ nontrivial on $`j`$ has $`1-|b_\chi|^2\ge c_t a/n`$. At least $`t-t/p`$ characters are nontrivial there because $`j`$ has order at least $`p`$. In (1) of the dense comparison every such character costs a factor $`O((1+a)^{-1/2})`$ relative to a unit eigenvalue. This proves the second upper option, including $`a=0`$ by the trivial bound.

For its lower option choose the whole zero coset of size $`n/t`$ and all $`k-n/t`$ remaining steps in one coset of order $`p`$ in the quotient. There is room since $`a=o(n)`$. Exactly $`t/p`$ characters of $`H`$ are trivial there and have magnitude one. The others have $`1-|b_\chi|^2=O_t(a/n)`$. All outside factors in the regularized inverse determinant are at least one. Its lower bound for the permanent gives the required estimate. When the surplus is zero all characters of $`H`$ have unit magnitude and the same estimate applies.

The comparison with $`n^{(d-1)/2}`$ is strict in order of growth since $`d\le t-1`$ and $`a=o(n)`$. For $`t\ge3`$ the integer $`t-t/p\ge2`$, so the second circulant option is also lower in order when $`a\to\infty`$. The constants denoted by $`\asymp_t`$ can be chosen independently of the sequence in the limiting band: a contrary sequence with ratios escaping those bounds admits exactly the subsequence reductions used above. No conclusion about strict comparison at every fixed surplus on composite orders follows from the constants.

## Fixed surplus and strict comparison

In fact for **every fixed $`t\ge3`$**, every sequence with $`n/k\to t`$ from strictly below eventually admits a matrix beating all circulants. It remains to prove this when $`t\mid n`$ and $`s=k-n/t\ge1`$ is fixed. The comparison then requires the leading constant. Write $`m=n/t`$ and $`H(x)=e^{-x}I_0(x)=\mathbb E\exp[-x(1-\cos\Theta)]`$ for uniform $`\Theta`$ on the circle. We show

```math
 \limsup \frac{\max_{G\text{ circulant}}\mathop{\mathrm{per}}(G/k)}{d_m^t}
 \le H(2s)^{t/2}< H(2\lceil ts/2\rceil)
 \le\liminf \frac{\max_G\mathop{\mathrm{per}}(G/k)}{d_m^t}.        \tag{2}
```

### A Poisson limit for bounded leakage

Split both index sets into a fixed number of corresponding classes of the same sizes $`m_g=k+O(1)\to\infty`$. Suppose a binary $`k`$-regular matrix has bounded positive cross degree and bounded forbidden degree within diagonal rectangles, uniformly per row and column (zero is permitted). Let $`E_{gh}`$ be the number of edges from class $`g`$ to a distinct class $`h`$, and assume $`E_{gh}/m_g\to b_{gh}`$. Then

```math
 \frac{\mathop{\mathrm{per}}(G/k)}{\prod_g d_{m_g}}
 \longrightarrow\Pr\left\{\sum_{h\ne g}N_{gh}=\sum_{h\ne g}N_{hg}\text{ for every }g\right\},
 \qquad N_{gh}\ \text{independent Poisson}(b_{gh}).             \tag{3}
```

To prove this, condition on the cross edges of a permutation. For fixed counts $`j_{gh}`$ their incoming and outgoing totals must agree at each class, say with common value $`q_g`$. The number of disjoint choices, divided by $`\prod_g m_g^{q_g}`$, tends to $`\prod b_{gh}^{j_{gh}}/j_{gh}!`$. Without disjointness this follows by sampling the prescribed edges from their rectangles. When all used rectangles have positive limiting density in this normalization, any collision of a fixed pair has probability $`O(1/k)`$ by bounded degrees. A used rectangle with zero limit has a vanishing upper bound anyway.

Inside class $`g`$ let $`F_g`$ be the number of forbidden edges and pass to a subsequence with $`F_g/m_g\to f_g`$. After deleting the finitely many selected sites from each side, the fraction of the $`(m_g-q_g)!`$ permutations avoiding forbidden edges tends to $`e^{-f_g}`$ uniformly in the deletions. For each fixed $`j`$ the factorial moment of the forbidden-hit count is the number of ordered disjoint forbidden $`j`$-tuples divided by $`(m_g-q_g)_j`$, which tends to $`f_g^j`$ by the same bounded-degrees count. Bonferroni bounds followed by increasing the cutoff prove the zero-count limit, including $`f_g=0`$. The factor $`\prod(m_g/k)^{m_g}`$ left by the stochastic normalization cancels the internal avoidance factors up to $`\exp(-\sum b_{gh})`$, since $`m_g-k=F_g/m_g-\sum_{h\ne g}E_{gh}/m_g`$ and $`m_g\log(m_g/k)=m_g-k+o(1)`$.

Finally the normalized summands are bounded by a constant times $`\prod_{g\ne h} C^{j_{gh}}/j_{gh}!`$ independent of order. Indeed the inside count is at most $`(m_g-q_g)!`$, and $`(m_g)_{q_g}\ge (m_g/e)^{q_g}`$ by the geometric mean of the largest factors and Stirling's elementary lower bound. This permits summation over all counts, proving (3). The final expression is independent of any subsequence chosen for the forbidden densities.

### Bounds on the two constants

For a circulant competitive on the $`d_m^t`$ scale, the preceding Fourier bound forces $`h=t`$ and a bounded number $`b`$ of steps outside the main coset: its proof in fact loses a factor $`(1+b)^{(t-t/p)/2}`$ when $`b\to\infty`$. Translate and take a subsequence with fixed counts $`b_l`$ in each nonzero coset $`l`$ of $`\mathbb Z/t`$. Their sum $`b\ge s`$ since the main coset has room for $`m`$ steps. Only $`b-s`$ steps are absent there. Formula (3) applies with constant flow means $`b_l`$ from $`g`$ to $`g+l`$. Fourier inversion and the modulus of the Poisson characteristic function bound its return probability by

```math
 \int\prod_{g,l\ne0}\exp[-b_l(1-\cos(\theta_g-\theta_{g+l}))]\,d\theta.
```

All circle measures have mass one. Hölder with weights $`b_l/b`$ bounds this by the largest of the integrals with all mass $`b`$ on one nonzero offset. For that offset the directed edges form cycles of length at least two. Each circle variable occurs in exactly two factors. The product integral is at most the product of the $`L^2`$ norms of those factors, by the product-space Hölder inequality (integrate one independent variable at a time using Hölder with exponents two on its two incident factors). This includes two parallel factors for a two-cycle. Each norm is $`H(2b)^{1/2}`$. Since $`H`$ is decreasing, this proves the upper bound in (2).

For the lower bound again use $`t-2`$ complete blocks of order $`k`$, with two residual groups of orders $`u=\lfloor(2k-ts)/2\rfloor`$, $`v=\lceil(2k-ts)/2\rceil`$. Put $`D=k-u=\lceil ts/2\rceil`$. If $`u=v`$, fill both diagonal blocks and use any $`D`$-regular cross block and its transpose. For $`v=u+1`$, take a $`v`$-square circulant of degree $`D`$ with one row removed as the $`u`$ by $`v`$ cross block; use its transpose for the reverse block. Fill the smaller diagonal block. In the larger full diagonal block delete one diagonal position at each index whose cross degree is $`D`$, leaving the others full. Directly every degree is $`k`$, and all forbidden and cross degrees are bounded. Both directed flow means tend to $`D`$ since the numbers of cross edges equal $`uD`$. The return probability is $`\Pr\{\mathrm{Pois}(D)=\mathrm{Pois}'(D)\}=H(2D)`$. Stirling and the fixed additive changes in group sizes give $`\prod_g d_{m_g}/d_m^t\to1`$.

Strict log convexity of $`H`$ (Hölder for the nonconstant variable $`1-\cos\Theta`$) and $`H(0)=1`$ give $`H(ts)>H(2s)^{t/2}`$ for even $`ts`$. For odd $`ts`$ it suffices to show $`H(4s)>H(2s)^{3/2}`$: then

```math
 H(ts+1)\ge H((t+1)s)\ge H(4s)^{(t+1)/4}>H(2s)^{3(t+1)/8}\ge H(2s)^{t/2}.
```

For $`s=1`$, $`H(2)<1/3`$ and $`H(4)>1/5>3^{-3/2}`$ follow from the exponential series and $`I_0(x)=\sum_{j\ge0}(x/2)^{2j}/(j!)^2`$ (for example $`I_0(2)<2.3`$, $`e^2>7`$, $`I_0(4)>11`$, $`e^4<55`$). For $`x=2s\ge4`$, splitting the defining integral at $`\pi/2`$ as in the [complete-block bound](../weighted-matching/regular-chord.md) gives $`H(x)\le\sqrt\pi/(4\sqrt x)+e^{-x}/2<0.47/\sqrt x`$. Also $`1-\cos\theta\le\theta^2/2`$ gives $`H(2x)\ge (\pi\sqrt x)^{-1}\int_0^{\pi\sqrt x}e^{-v^2}dv>0.27/\sqrt x`$ by the Gaussian integral and its tail bound. Since $`0.27\,4^{1/4}>0.47^{3/2}`$, the claim follows. This proves (2), completing the strict comparison across the whole indicated one-sided band.

The [standard-library replay](verify_integer_transition.py) checks all row and column degrees and both leakage regimes on 70 residual graphs, compares 17 exact two-class permanent expansions against subset dynamic programming, and verifies the rational series estimates in the small Bessel comparison. The limit and the uniform quantifiers follow from the proof.
