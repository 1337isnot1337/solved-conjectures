# Stability for approximate local hypothesis catalogues

Let $`H`$ be a class of VC dimension $`d\ge1`$ on standard Borel spaces, with jointly Borel evaluation. Fix countably many universally measurable maps producing proper hypotheses from at most $`k`$ observed features. The catalogue $`G(T)`$ on a sample $`T`$ consists of all their outputs on eligible subtuples. Include one fixed proper candidate so that the catalogue is always nonempty. There is a learner with whole-output selector information

```math
O\bigl(d(1+\log^*(n/d))+k\bigr)
```

on each fixed paired pool, and hence with the same actual iid CMI bound. Its expected empirical loss on every $`T`$ is at most

```math
\min_{h\in G(T)}\widehat L_T(h)+O(\sqrt{d/n}).
```

Here $`n\ge d`$ and $`\log^*`$ counts iterations of the natural logarithm until the argument is at most one. No trace-coverage condition is needed for the information bound. If the catalogue loses at most $`O(\sqrt{d/n})`$ in empirical optimum, the learner therefore has the conjectured empirical rate. The information bound still has an iterated logarithm. The gain over exact local reconstruction is that a deletion can remove an entire trace from the catalogue.

## Pruning a nested entropy objective

Consider a finite set of leaves with real costs and a sequence of nested partitions, starting at the trivial partition and ending at singletons. Minimize expected cost minus a weighted sum of conditional entropies of the successive partition splits. The split temperatures $`\beta_v>0`$ are nonincreasing along each root-to-leaf path. At an internal vertex $`v`$ let $`F_v`$ be the optimal value conditional on entering $`v`$, and at a leaf let it be its cost. The recursion and conditional optimizer are

```math
F_v=-\beta_v\log\sum_{w\text{ child of }v} e^{-F_w/\beta_v},
\qquad q(w\mid v)=e^{(F_v-F_w)/\beta_v}.
```

This follows by optimizing the conditional distribution on children after optimizing the distributions inside each child. A leaf excluded from the allowable support has value $`+\infty`$ in the restricted problem. Let $`F'_v`$ denote the values after restricting to a nonempty set of leaves. Then $`F'_v\ge F_v`$. For internal vertices put $`r_v=\exp(-(F'_v-F_v)/\beta_v)`$. The conditional probability ratio at an internal child $`w`$ is $`r_w^{\beta_w/\beta_v}/r_v`$, and at a surviving leaf it is $`1/r_v`$. Multiplying along a surviving path, all nonroot internal factors combine to powers $`r_w^{\beta_w/\beta_v-1}\ge1`$. Consequently, if $`p`$ is the restricted optimizer,

```math
p(z)\ \ge\ \frac{q(z)}{r_{\rm root}}\ \ge\ q(z)
\quad\text{for every surviving leaf }z.
```

In particular $`r_{\rm root}\ge q(\text{surviving leaves})`$. Equivalently the total variation distance between the two laws equals the original mass of the deleted leaves. The squared Hellinger distance $`H_2^2`$, with convention $`\sum_z(\sqrt{p(z)}-\sqrt{q(z)})^2`$, is at most twice that mass.

## Removing a bit from the restrictions

At each stage the partitions come from successively revealed coordinates. Keep the leaf set and all costs fixed. Compare the original optimizer $`q`$ to $`p`$, which omits coordinate $`i`$ from all the nonterminal restrictions. If $`i`$ first appears at level $`\ell`$, refine the description of the split at that level by first revealing all its other tests, then revealing $`i`$, both at the original temperature $`\beta_\ell`$. This leaves the objective unchanged by the entropy chain rule. Write $`C`$ for a prefix cell immediately before revealing $`i`$, given by the other tests through level $`\ell`$.

Within $`C`$ the old optimizer is a mixture of the new nested optimizer restricted to each slice $`i=b`$. Write $`F_C`$ for the unrestricted new value within $`C`$, and $`F_{C,b}`$ for its restricted values. The component weights of the old mixture are $`c_b=r_b/(r_0+r_1)`$, where $`r_b=\exp(-(F_{C,b}-F_C)/\beta_\ell)`$. The pruning comparison applies with a trivial split at temperature $`\beta_\ell`$ if necessary, so the restricted optimizer dominates the unrestricted law on its slice by a factor $`1/r_b`$. Empty slices are given zero weight. Thus the old conditional law in $`C`$ dominates the new conditional law times $`r_C=1/(r_0+r_1)`$. Each $`r_b\le1`$ and their sum is at least one, since each is at least the new mass of its slice. It follows that

```math
\operatorname{TV}(q(\cdot\mid C),p(\cdot\mid C))\le 1-r_C\le\min(c_0,c_1).
```

Replacing the old conditional value in $`C`$ by the new value increases it by $`-\beta_\ell\log r_C`$. The same path-ratio calculation on the prefix tree shows $`p(C)\ge q(C)r_C`$. Indeed the ratio at the terminal prefix is a power of $`r_C`$ with exponent at most one, and all other path factors are at least one. Thus the variation of the prefix law is at most $`\sum_C q(C)(1-r_C)`$. Comparing the two joint laws via the old prefix law and new slice conditionals gives

```math
H_2^2(q,p)\le 4\sum_C\min\{q(C,i=0),q(C,i=1)\}.
```

The omission here affects only nonterminal restrictions. In particular the terminal singleton partition on the same full traces remains in both objectives.

## Schedule and empirical error

Fix the learner size $`n`$ and write $`t=n/d`$ and $`N=n+1`$. Analyze it by deleting one row of an auxiliary $`N`$-row block, with the same schedule at both sizes. Independently on each row draw a mark uniform on $`[0,1]`$ and a loss weight uniform on $`[0,2]`$. Set $`u_0=1`$, $`u_1=2^{128}`$ and $`u_{j+1}=\exp(u_j^{1/8})`$ for $`j\ge1`$. Let $`J`$ be the largest $`j`$ with $`u_j\le t`$. Use nested restrictions $`M_j`$ containing all rows whose marks are at most $`d u_j/N`$, for $`0\le j\le J`$. Deleting a row intersects each restriction with the surviving positions. The split temperatures are

```math
b_0=\sqrt t,\qquad b_j=\sqrt t\,u_{j-1}^{-1/4}\quad(1\le j\le J+1).
```

Optimize on the finite set of traces of $`G(T)`$, with linear weighted mistake count and entropy bonus

```math
\sum_{j=0}^J(b_j-b_{j+1}) H(q_{M_j})+b_{J+1}H(q).
```

This is the nested objective above by the entropy chain rule. Choose one name per catalogue trace by first witness in the [local reconstruction order](measurable-local-reconstruction.md#learner). The candidate set, the order and its preservation under deletion refer to the feature subtuples and the maps. The restriction marks and loss weights are fresh independent randomness.

By Sauer's lemma and Jensen's inequality, the expected maximum entropy at level $`j`$ is at most $`d(1+\log(1+u_j))`$. The terminal maximum entropy is at most $`d\log(et)`$ at size $`n`$. The total bonus in expectation is $`O(d\sqrt t)`$. For $`j\ge2`$ use $`\log u_j=u_{j-1}^{1/8}`$ and sum the resulting $`O(u_{j-1}^{-1/8})`$ factors, since the $`u_j`$ at least double. The levels $`0,1`$ cost an absolute constant times $`d\sqrt t`$. At the terminal level, either $`J=0`$ and $`t<u_1`$, or $`\log t<u_J^{1/8}`$ by maximality of $`J`$. Comparing the objective to a point mass on a catalogue minimizer now gives the claimed empirical bound. The replacement of random weighted mistakes by unweighted mistakes costs $`O(\sqrt{nd})`$ in expectation in total count, by the [binary VC chaining estimate in the fixed-pool proof](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#1-the-learner-and-its-empirical-error). That argument applies to every finite subset of the full trace class. The choice of scales gives $`J=O(1+\log^*t)`$, since $`u_{j+2}\ge\exp(u_j)`$ for $`j\ge1`$.

## Removing a loss weight

For a fixed restriction $`M`$ let $`\Delta(M)`$ be the largest fraction of full block positions on which two catalogue traces disagree while agreeing on $`M`$. For a restriction with expected size $`du`$ obtained by the independent marks,

```math
\mathbb E\Delta(M)\le C(1+\log u)/u\qquad(u\ge1).
```

Here is a finite double-sampling proof. For $`m\ge d`$ independent uniform positions, the possible disagreement sets on a joint sample of size $`2m`$ number at most $`(2em/d)^{2d}`$, by the product of two Sauer bounds. If the first sample misses a disagreement set of relative size at least $`\epsilon`$ and $`m\epsilon\ge8`$, an independent sample of $`m`$ positions hits it at least $`m\epsilon/2`$ times with probability at least $`1/2`$ by Chebyshev. Conditional on the pooled positions, splitting into two uniformly chosen halves puts all these hits in the second half with probability at most $`2^{-m\epsilon/2}`$ for any fixed trace of the disagreement set. Thus the tail bound is $`2(2em/d)^{2d}2^{-m\epsilon/2}`$. Integrating the minimum of this bound and one, with the initial region $`m\epsilon<8`$ treated by one, gives $`O(d(1+\log(m/d))/m)`$. The same bound holds for a uniform subset of size $`m`$, by coupling it to contain the distinct positions of the with-replacement sample. Conditional on cardinality the marked subset is uniform. A binomial lower-tail bound puts its cardinality below half its mean with probability at most $`e^{-du/8}`$. If $`u<2`$ use $`\Delta(M)\le1`$, and otherwise apply the preceding bound for cardinalities at least half the mean. [The double-sampling method for VC epsilon nets, Haussler and Welzl](https://doi.org/10.1007/BF02187876)

Let $`q`$ be the full optimizer, and $`r_i`$ the optimizer with weight $`i`$ zeroed on the same support and restrictions. For any interior law $`p`$ on full traces, let $`P_j`$ denote conditional expectation onto $`M_j`$ in mean-zero $`L^2(p)`$, with $`P_{-1}=0`$ and $`P_{J+1}=I`$. The Hessian on score vectors is diagonal along the orthogonal projections $`P_j-P_{j-1}`$, with coefficient $`b_j`$. If $`f_i(v)=v_i-\mathbb E_p v_i`$, the squared speed of the square-root optimizer under variation of a single loss weight is a quarter of

```math
\sum_{j=0}^{J+1} b_j^{-2}\|(P_j-P_{j-1})f_i\|_p^2.
```

This is the differentiated first-order equation from the [fixed-pool proof](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#3-removing-one-example), specialized to nested projections. Summing over $`i`$, the first term is at most $`N/(4 b_0^2)`$. For each $`j\ge1`$, the squared residuals after $`M_{j-1}`$ sum to at most $`N\Delta(M_{j-1})`$. In fact within every conditional trace cell, two independent draws disagree on at most that fraction of positions. This bounds the sum of conditional binary variances and holds uniformly in the law $`p`$. Integrate each squared speed from zero to the random weight by Cauchy–Schwarz, extend to $`[0,2]`$ and average the other uniform weights. The resulting sum can be evaluated at the same full random law $`q`$ for all $`i`$, since each replaced weight is again uniform and independent of the other weights and marks. The expected squared Hellinger cost is bounded by

```math
C\left(N/b_0^2+\sum_{j=1}^{J+1}N b_j^{-2}\mathbb E\Delta(M_{j-1})\right)=O(d).
```

Indeed the summands for $`j\ge1`$ are $`O(d(1+\log u_{j-1})u_{j-1}^{-1/2})`$, which sum to $`O(d)`$.

## Deletion, lost support and names

From $`r_i`$ remove $`i`$ from the nonterminal restrictions, keeping the full trace support and zero loss weight at $`i`$. Call the resulting optimizer $`s_i`$. If $`i`$ is assigned to level $`\ell`$ for the first time, the bit-omission estimate costs four times the sum of the smaller masses in the binary fibers over $`M_\ell\setminus\{i\}`$. Compute the sets of smaller endpoints instead at the full law $`q`$. The mass at $`r_i`$ of that choice is at most twice its $`q`$-mass plus $`2H_2^2(q,r_i)`$. For one level, the sum of the $`q`$-masses over positions first appearing there is at most $`d`$, by the [weighted unit-distance graph bound](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#2-averaged-prediction-projections) on the law projected to $`M_\ell`$. Positions that never appear in the nonterminal restrictions have no bit-omission cost. Thus the expected sum of the squared distances $`q\to s_i`$ is $`O(d(J+1))`$.

Project $`s_i`$ to the surviving positions and call the projected law $`p_i`$. A short trace has one or two full extensions. All nonterminal restrictions and remaining loss weights depend only on the short trace. The full-entropy term splits each two-element fiber equally, and the projected objective for $`p_i`$ is the true short objective plus an entropy bonus of $`b_{J+1}\log 2`$ times the mass of those double fibers. Let $`\mu_i`$ be this mass under $`p_i`$. Mark the smaller $`q`$-endpoint in each double fiber. Over all rows the sum of their $`q`$-masses is at most $`d`$ by the weighted unit-distance bound on full traces. By the equal splitting at $`s_i`$ and the square-root triangle bound for masses, $`\sum_i\mu_i\le4d+4\sum_i H_2^2(q,s_i)`$. Removing the bonus costs squared Hellinger distance at most $`(\log 2)\mu_i`$ by optimality and the full-entropy Bregman remainder, as in the fixed-pool proof. Denote the law after removing the bonus by $`t_i`$.

The short catalogue trace set is a subset of the projection of the full catalogue trace set. Every trace lost from this projection had all its full witnesses reading the deleted row. Let $`E_i`$ be the set of full traces whose first witness reads that row. Then $`\sum_i q(E_i)\le k`$. The lost mass under $`p_i`$ is at most $`s_i(E_i)`$, and its mass under $`t_i`$ is at most twice that plus $`2H_2^2(p_i,t_i)`$. The sum in expectation is $`O(d(J+1)+k)`$. The nested pruning lemma bounds the squared distance from $`t_i`$ to the optimizer on the actual short catalogue by twice the lost mass under $`t_i`$. This step needs no replacement trace near a lost trace.

For the named-output comparisons, lift each short trace present in the short catalogue to its true first short witness. Give the absent short traces arbitrary representatives from their full extensions. Outside the full traces in $`E_i`$ and the double fibers, the full and short witnesses coincide. Indeed the surviving first witness is still available and every competing short witness with that trace extends to the same unique full trace. The squared distance from the full-name lift of $`s_i`$ to the short-name lift of $`p_i`$ is therefore at most $`2(\mu_i+s_i(E_i))`$, by their common subprobability mass. Use the same short lift for $`t_i`$ and the pruned optimizer, so lifting those comparisons cannot increase distance. The square-root triangle inequality through this finite sequence of comparisons gives an expected named deletion bound $`O(d(J+1)+k)`$. The [selector transfer](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#4-information-in-the-returned-hypothesis) gives the asserted CMI bound.

Catalogue trace feasibility and the first-witness index are universally measurable by countable witness tests. The finite optimizer is measurable in its loss weights and restriction marks for each possible finite trace set, by continuity in the weights and the finite number of possible restrictions. The output is a proper completed-measurable random variable for every iid law, and integrating the fixed-pool bound gives the actual iid CMI assertion. If a specified catalogue approximation holds almost surely under every iid law, a universally measurable exact-ERM fallback on samples failing that approximation gives the samplewise empirical assertion. For each iid law the fallback is null for every fixed selector, hence for almost every pool it leaves the entire channel unchanged.

## An obstruction for arbitrary projection entropies

There is no general pruning bound proportional to the deleted mass for arbitrary projection entropy penalties and arbitrary linear costs, even on a binary class of VC dimension at most two. Use a bipartite cycle with $`m\ge2`$ row and column vertices, and identify its edges with hypotheses. The edge $`a_i`$ joins row $`i`$ to column $`i`$, and $`b_i`$ joins row $`i`$ to column $`i+1`$ modulo $`m`$. Its binary tests are the indicators of the incident row and column, so a hypothesis is positive on only two tests. Set $`q(a_1)=e=1/(4m)`$ and every other edge mass to $`w=(1-e)/(2m-1)`$.

Let $`R,C`$ denote the two endpoint partitions. For arbitrary $`L>0`$ choose the objective with full negative entropy coefficient one, endpoint negative entropy coefficients both $`L`$, and linear costs $`-\log q(z)-L\log q_R(Rz)-L\log q_C(Cz)`$. Relative to its minimum at $`q`$, the objective on a law $`p`$ is exactly

```math
\mathrm{KL}(p\Vert q)+L\mathrm{KL}(p_R\Vert q_R)+L\mathrm{KL}(p_C\Vert q_C).
```

Remove $`a_1`$. The unique law with its mass zero and with the original two marginals subtracts $`e`$ from every $`a_i`$ and adds $`e`$ to every $`b_i`$. Indeed the row constraint forces opposite changes within each pair $`(a_i,b_i)`$, and the column constraint makes the changes equal along each of the two alternating edge sets. The law is feasible since $`w\ge e`$. Comparing the restricted minimizer to it shows that the sum of the two marginal divergences tends to zero as $`L\to\infty`$. Compactness and uniqueness then force convergence to the specified law. The limiting squared Hellinger distance from $`q`$ is at least the contribution of the $`b_i`$,

```math
m(\sqrt{w+e}-\sqrt w)^2\ \ge\ \frac{m e^2}{4(w+e)}\ \ge\ \frac1{64},
```

where $`w+e\le1/m`$. This stays bounded away from zero while the deleted mass $`e`$ tends to zero. One can use the sum of the negative entropies of all single binary endpoint tests instead of the two categorical endpoint entropies. Choose the linear costs by the same first-order cancellation. The corresponding sum of binary marginal divergences vanishes exactly when the two endpoint marginals agree, and the limiting argument is unchanged. This obstruction leaves open whether the specific averaged multiscale schedule with its bounded losses has a stronger pruning estimate.
