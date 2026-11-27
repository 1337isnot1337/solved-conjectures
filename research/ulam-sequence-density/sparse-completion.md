# Sparse completions that include every compulsory sum

The Ulam rule both admits every uniquely represented integer and rejects every multiply represented integer. The [earlier constructions](lower-bound-tests.md) keep uniqueness on accepted terms. The following construction tests the other direction and keeps the actual sequence through any specified finite cutoff.

**Proposition.** Given any finite genuine prefix through $`T`$, there exists an infinite set $`D`$ of positive integers agreeing with it through $`T`$ with all of the following properties.

- Every member after the seeds 1 and 2 is a sum of two distinct smaller members.
- Every positive integer with exactly one unordered distinct-summand representation belongs to $`D`$.
- Successive members have ratio at most two. The counting function is of order $`(\log x)^2`$ and the upper Banach density is zero.
- The number of representations at any target is bounded by a constant depending only on the chosen prefix. Nevertheless for every fixed $`L`$, the number of multiply represented targets through $`x`$ for which every representation uses two terms greater than $`L`$ is of order $`(\log x)^4`$.

Thus even with all of these constraints, the exclusion of multiply represented **selected** terms remains essential. The set of positions where the full Ulam decision is violated has size $`O((\log x)^2)`$ through $`x`$. Kravitz used the integers with at most two 1s in binary as the example showing sharpness of the logarithm-squared growth estimate for two one-sided hypotheses. We use that example as the set of block indices. [Kravitz, introduction](https://arxiv.org/pdf/2611.17584)

## Representations of the binary indices

Let $`B`$ consist of positive integers with one or two 1s in binary. The **only** integers having exactly one distinct-summand representation from $`B`$ are 3 and 4. No integer has more than six such representations.

For the first assertion, a sum has at most four 1s. Four distinct binary powers admit three partitions into two pairs. Three powers admit three partitions into a singleton and a pair. With two powers $`2^a+2^b`$, $`a>b`$, there is the direct representation. If $`a\ge b+2`$, there is also $`2^{a-1}+(2^{a-1}+2^b)`$. If $`a=b+1`$ and $`b\ge1`$, split $`2^b`$ to obtain $`2^{b-1}+(2^a+2^{b-1})`$. A pure power $`2^a`$ with $`a\ge3`$ has the two representations

```math
2^{a-2}+(2^{a-1}+2^{a-2}),\qquad
(2^{a-1}+2^{a-3})+(2^{a-2}+2^{a-3}).
```

Direct inspection through 4 finishes the assertion about singletons.

For the upper bound, expand the two summands as a multiset of at most four binary powers. Every such multiset is obtained from the canonical binary expansion of the target by splitting a power into two equal halves, reversing ordinary carries. Each summand can contain at most two different powers.

- With four canonical powers, only the three two-pair partitions are possible. With three powers there are three unsplit partitions. Splitting one of the three powers creates two equal halves that must go to different summands. The other two powers then give at most one unordered partition for this split, for a total of at most six.
- With two canonical powers there is one unsplit partition, at most one for each of the two single splits, and at most one for each nested double split of one original power. Splitting both originals once would give equal summands. There are at most five pairs.
- For one canonical power, a single split gives equal summands. Two splits give at most one pair. With three splits, splitting both halves once gives four equal tokens, and a nested split gives at most one pair. This gives at most two.

The upper bound six occurs at 42, with pairs $`2+40`$, $`8+34`$, $`10+32`$, $`9+33`$, $`6+36`$ and $`18+24`$.

The [finite replay](sparse_completion.py) checks the binary index counts through 32,768 and the construction below with $`K=47`$ and $`Q=64`$. In that range the completion selects 2,912 positions, of which 2,896 have multiple representations. Its largest restricted representation count is 384. Run `python3 -B research/ulam-sequence-density/sparse_completion.py`.

## Preserving the prefix

Choose a genuine Ulam term $`K\ge\max(T,2)`$ and an integer $`Q>K+1`$. Through $`K`$ keep the genuine sequence. Select every integer from $`K+1`$ to $`Q-1`$. For each $`b\in B`$, also select the complete block $`[Qb,Qb+Q-1]`$. All positions from $`K+1`$ through $`7Q-1`$ are selected since $`1,\ldots,6\in B`$. Each of those new positions has the distinct representation $`1+(n-1)`$.

Consider $`n\ge7Q`$ having any representation from these blocks and the initial interval. If the summands have block indices $`i,j`$, counting the initial interval as block zero, set $`h=i+j`$. The quotient and remainder rule gives $`h\in\{\lfloor n/Q\rfloor-1,\lfloor n/Q\rfloor\}`$, hence $`h\ge6`$. It has at most four 1s in binary. The preceding calculation supplies two pairs of distinct positive indices from $`B`$ summing to $`h`$. For each pair, distribute $`n-Qh`$ between the two offsets from 0 to $`Q-1`$. This is possible since the original pair had that same total offset. The complete blocks give two distinct representations of $`n`$. In particular no compulsory singleton is omitted beyond the bridge. Up to $`K`$ all decisions were genuine.

Every selected $`n\ge7Q`$ also has a representation. Its block index $`b\in B`$ is at least eight and has a distinct positive index pair summing to $`b`$. Put the remainder $`n-Qb`$ on either of the two summands. All selected nonseed positions are therefore generated. The singly represented targets in the initial interval remain admitted even if the bridge introduces additional selected targets. The ratio bound holds within the genuine prefix and the consecutive bridge. Across any later block boundary the next occupied index after $`b`$ is at most $`2b`$ because $`2b\in B`$.

There are $`\Theta((\log x)^2)`$ indices through $`x`$. For a uniform interval bound, an aligned interval of $`2^m`$ indices contains at most $`1+m+\binom m2`$ members of $`B`$, by inspecting the lowest $`m`$ bits. Every interval of length at most $`2^m`$ meets at most two such aligned intervals. Since each occupied block has fixed length $`Q`$, any interval of $`N`$ consecutive integers contains $`O_Q((1+\log(N+1))^2)`$ members of $`D`$. This proves zero upper Banach density.

For either possible index sum $`h`$ there are at most six unordered distinct positive index pairs, one equal-index pair, and one pair involving zero. Each gives at most $`Q`$ integer pairs with a prescribed total. The uniform multiplicity bound $`16Q`$ follows, including in the initial interval.

Finally choose $`m_0`$ with $`2^{m_0}>\lceil L/Q\rceil`$. For any four distinct exponents at least $`m_0`$, let $`h`$ be the sum of their binary powers. The target $`Qh`$ has three representations obtained by partitioning the four powers into pairs of indices from $`B`$. For $`1\le f\le L`$, the block index of $`Qh-f`$ is $`h-\lceil f/Q\rceil`$. Subtracting this amount leaves the three largest bits set, so that index is outside $`B`$ and is positive. Hence there is no representation using $`f`$. Four exponents below $`\lfloor\log_2(x/Q)\rfloor`$ give $`\Omega_{Q,L}((\log x)^4)`$ distinct such targets through $`x`$. The square of the counting function gives the matching upper bound. This completion violates the true rule at every selected position beyond $`7Q`$.
