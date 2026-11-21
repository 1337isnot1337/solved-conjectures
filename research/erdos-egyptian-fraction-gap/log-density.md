# Logarithmic density of possible counterexamples

Let $`E`$ be the set of integers that occur as largest denominator of a representation of one by distinct unit fractions with denominators greater than one and all successive gaps at most two. Then

```math
 \lim_{Z\to\infty}\frac{1}{\log Z}
      \sum_{\substack{M\le Z\\M\in E}}\frac{1}{M}=0.
```

In particular, Erdős’s gap conclusion holds for a set of largest denominators of logarithmic density one. The proof allows isolated counterexamples at arbitrarily large scales. [Erdős problem 287](https://www.erdosproblems.com/287)

**Shape lemma.** Given $`k`$ increasing real points $`z_i`$ and $`0<\eta<1`$, there are increasing positive integers $`s_i`$ and a scale $`A>0`$ such that $`s_j-s_i`$ divides $`s_i,s_j`$ and

```math
 (1-\eta)(z_j-z_i)<(s_j-s_i)/A<(1+\eta)(z_j-z_i)
 \qquad(i\lt j).
```

Use the [Chinese-remainder construction](spacing.md) with the neighborhood of $`(1,\dots,k)`$ replaced by a neighborhood of the prescribed points. First translate them all to positive numbers. Choose the neighborhood small enough to approximate every positive difference with relative error below $`\eta/2`$, and take a rational vector there avoiding all the same proper hyperplanes. If $`B`$ clears its denominators, the construction gives $`s_i=\text{constant}+Tb_i+e_i`$, where $`b_i/B`$ are the chosen rational coordinates. Taking $`A=TB`$ and sufficiently large $`T`$ proves the bounds. Neither $`A`$ nor the $`s_i`$ depend on any subsequent prime-search interval.

Call a dyadic bin $`j`$ occupied if $`[2^j,2^{j+1})`$ contains an element of $`E`$. Let $`k`$ be a fixed number of forms guaranteed by Maynard’s Theorem 3.4 for two primes, as in the [interval proof](README.md). Write $`r=k-1`$. **For every fixed list of nonnegative integer offsets $`a_1<\cdots\lt a_r`$ with $`a_{i+1}-a_i\ge6`$, there are only finitely many integers $`n\ge0`$ for which all the bins $`n+a_i`$ are occupied.**

To prove this, take $`z_1=0`$ and $`z_{i+1}=z_i+2^{-a_i}`$. For any $`i\lt j`$ the first term of the difference dominates:

```math
 2^{-a_i}\le z_j-z_i\le (64/63)\,2^{-a_i}.
```

Apply the shape lemma with $`\eta=1/100`$, and let $`D=\mathop{\mathrm{lcm}}_i s_i`$. At each sufficiently large $`n`$, put $`T=\lceil(4/5)A2^n/D\rceil`$. Apply Maynard to the fixed forms $`(D/s_i)t+1`$ on $`[T,T+T^{3/4}]`$. For some $`i\lt j`$, the two corresponding values are prime. As in the interval proof they yield adjacent bounded multiples of primes starting at $`y=(Dt+s_i)/(s_j-s_i)`$. Uniformly across this fixed finite family,

```math
 \frac{4/5}{(101/100)(64/63)}+o(1)
 \ \le\ \frac{y}{2^{n+a_i}}\
 \le\ \frac{4/5}{99/100}+o(1).
```

The lower constant exceeds $`3/4`$, and the upper constant is less than $`7/8`$. Once $`n`$ is large, $`y+1\le 2^{n+a_i}`$ and $`ey>2^{n+a_i+1}`$, since $`3e/4>2`$. The bounded cofactors are fixed, so the [large-prime obstruction](README.md) excludes every possible maximum in bin $`n+a_i`$. At least one of the specified bins is therefore empty. [Maynard, Theorem 3.4](https://arxiv.org/abs/1405.2593)

Now fix a length $`L`$. There are only finitely many possible lists of offsets in $`[0,L-1]`$. Beyond the largest of their thresholds, each block of $`L`$ dyadic bins has at most $`J=6(r-1)`$ occupied bins. Indeed, greedily selecting the leftmost remaining occupied bin and discarding it and the next five bins would otherwise produce $`r`$ occupied bins separated by at least six. If the block is shorter than the required pattern, the same count follows directly.

For this fixed $`L`$, partition the bins up to $`\log_2 Z`$ into blocks of length $`L`$. The upper limiting fraction of occupied bins is at most $`J/L`$, since the exceptional initial segment and final incomplete block have bounded size. An occupied bin contributes at most $`\log 2+O(2^{-j})`$ to the harmonic sum, by integral comparison. An empty bin contributes zero. Hence the upper logarithmic density of $`E`$ is at most $`J/L`$. Let $`L`$ tend to infinity.
