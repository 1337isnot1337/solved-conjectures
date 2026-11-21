# Selecting a row by deterministic priority

Let $`T`$ be a pool with two observations per row and $`S`$ its independent uniform selector. On the selected sample $`z=T_S`$, let $`p_z`$ be any probability vector on its $`n`$ rows, and let the random index $`J`$ have this conditional law. Write $`B=I(J;S\mid T)`$. Let $`R`$, independent of everything, assign the ranks $`1,\ldots,n`$ uniformly without replacement. Put $`U_i=R_i/n`$. Choose $`F`$ minimizing $`U_i/p_z(i)`$ over positive weights, breaking ties by smaller rank. Then, in nats,
```math
 H(F\mid T,R)\le \log 2+2\log5+4\log3+8e^2(B+1/e).
```
The priorities are used in this lemma for the analysis. The final learner uses the actual positions in its input.

## Two estimates for sampling ranks

Fix a probability vector $`p`$. If row $`j`$ must avoid an initial segment of $`f_j`$ ranks out of $`m`$ available, the probability that all rows avoid their segments is at most $`\exp(-\sum_j f_j/m)`$. Reveal the rows in decreasing order of segment size. Conditional on all preceding successes, the previously used ranks are outside the next segment. The conditional chance of success is therefore at most $`1-f_j/m`$. The same reasoning applies inside any fixed ordered subset of remaining ranks.

Let $`t_*=\min_{p_i>0}U_i/p_i`$. On $`t_*>t`$, row $`j`$ must avoid its first $`\lfloor ntp_j\rfloor`$ ranks. If $`tp_j>1`$ for any row the event is impossible. Otherwise the sum of these lengths is at least $`nt-n`$. Hence $`\Pr(t_*>t)\le\min(1,e^{1-t})`$ for $`t\ge0`$, and $`\mathbb E t_*\le2`$.

We also need a coordinatewise bound
```math
 \Pr(F=i)\le 2e^2p_i.
```
It holds immediately if $`p_i=0`$ or $`p_i>1/2`$. Otherwise condition on $`R_i=a`$ and set $`t=a/(np_i)`$. If $`tp_j>1`$ for some $`j\ne i`$, row $`i`$ cannot win. Each other row must avoid ranks strictly below $`ntp_j`$. In the remaining ordered rank set this excludes at least $`ntp_j-2`$ positions, allowing both an integer tie and the removed rank $`a`$. The sum of forbidden lengths divided by $`n-1`$ is at least $`t(1-p_i)-2`$. The conditional chance of winning is at most $`e^{2-t/2}`$. Summing over $`a`$ and bounding the decreasing exponential sum by its integral from zero to infinity gives $`2e^2p_i`$. The argument involving $`n-1`$ occurs only for $`n\ge2`$.

## Coding the selected index

Fix $`T`$, and put $`q_i=\mathbb E[p_{T_S}(i)\mid T]`$. A zero coordinate of $`q`$ can be dropped for every selector. Order the remaining rows by $`U_i/q_i`$, breaking ties by smaller rank. Let $`K`$ be the one-based position of $`F`$ in this list. Given $`T,R`$ this position identifies $`F`$. Comparing the law of $`K`$ to the discrete law proportional to $`k^{-2}`$, whose normalizer is at most 2, gives
```math
 H(F\mid T,R)\le\log2+2\mathbb E\log K.
```

Let $`N(t)=\#\{i:q_i>0,\ U_i\le tq_i\}`$. Since a single rank is uniform, $`\mathbb E_R N(t)\le t`$. The random variable
```math
 L=1+\sum_{j=0}^{\infty}4^{-j}N(2^{j+1})
```
satisfies $`\mathbb E_R L\le5`$. Also $`N(t)\le L\max(1,t)^2`$ for every $`t`$: for $`t\ge1`$ use the term with $`2^j\le t<2^{j+1}`$, and for $`t<1`$ use the first term. At our choice $`F`$, $`K\le N(t_*p_F/q_F)`$. Taking log, bounding $`\log^+t_*`$ by $`\log(1+t_*)`$, and using the coordinatewise bound gives, for fixed $`p=p_{T_S}`$ and $`q`$,
```math
 \mathbb E_R\log K
 \le \log5+2\log3+4e^2\sum_i p_i\log^+(p_i/q_i).
```
The sum is at most $`D(p\Vert q)+1/e`$, since $`u\log(1/u)\le1/e`$ on $`[0,1]`$ and the $`q_i`$ sum to one. The expectation of $`D(p_{T_S}\Vert q)`$ over $`T,S`$ is $`B`$. Substitution proves the bound.

## Using the actual input order

Suppose the pool rows are exchangeable and the vector computed from a sample permutes with its rows. Assigning the auxiliary priority $`R_i`$ to row $`i`$ is exactly running the fixed-priority rule on the sample after moving row $`i`$ to position $`R_i`$, then translating the selected index back. For any fixed permutation, the reordered pool has the same distribution, and its correspondingly reordered selector is still independent uniform. Therefore the conditional entropy of any row-equivariant decoded output given $`T,R`$, averaged over $`T,R`$, equals the conditional entropy of the actual fixed-order decoded output given its pool. This equality uses exchangeability only in the information calculation. A pointwise loss bound on the support applies on every ordered input.
