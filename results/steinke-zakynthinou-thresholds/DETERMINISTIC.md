# A deterministic polynomial-time learner for real thresholds

For every $`n\ge1`$, there is an explicit deterministic learner that returns a finite closed real threshold. Its original CMI is at most 7000 nats for every iid labeled distribution. On every ordered sample its empirical error exceeds the best threshold error by at most $`2048\lceil\sqrt n\rceil/n`$. The common constant 16384 suffices in nats or bits. The algorithm takes polynomial time on rational inputs and polynomially many real-feature comparisons on the real line. It uses the ordered sample specified by the authors. [Original definition and prize, pp. 3–4](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

## A symmetric law on empirically accurate thresholds

Use the [shifted tree](PROOF.md) with the [exact rational branch rule](EFFICIENCY.md). Keep the shift exactly uniform. For the distinct-feature analysis, give every observation an independent uniform tag $`u`$ and order by the lexicographic key $`(x,1-y,u)`$. The augmented observations are iid, and their keys are almost surely distinct. At equal features the positive labels come first. Tags distinguishing equal feature-label pairs do not change a single leaf loss or the feature at any position. Thus after projecting to the real coordinate (or infinity), the distribution can be computed without drawing tags.

For clarity, the distinct-feature information proof uses only the ordering, replacement of one labeled observation, and exchangeability of the observations. These hypotheses hold for the augmented keys even though they contain the label. Part I, Sections 2–6 of the shifted-tree proof, with the rational branch estimate, bounds the CMI of the auxiliary output by 9 nats. The original paired pool $`T`$ together with the independent tags for all its entries determines the augmented pool and conversely recovers its data and tags from the labeled keys. Forgetting the tags in the output and then in the conditioning preserves the upper bound, since the tags are independent of $`S`$ given $`T`$.

For a virtual cut at feature $`w`$, output whichever of the closed threshold at $`w`$ and the open threshold at $`w`$ has smaller training loss, breaking ties in favor of the closed one. Keep infinity as the constant-zero classifier. As the virtual cut passes the copies of $`w`$, loss first increases by one per positive and then decreases by one per negative. Each interior loss is at least the smaller endpoint loss. Both endpoint traces occur in the full virtual list. Consequently its global minimum equals the optimal real-threshold loss and the rounding can only decrease loss.

The flag specifying the chosen endpoint adds at most $`\log2`$ nats. The properization in Part II of the shifted-tree proof retains each closed endpoint, replaces an open endpoint by the next larger observed feature (or $`w+1`$ if last), and replaces infinity by one plus the observed maximum. It preserves the training predictions. Write $`P_z`$ for this symmetric law on proper parameters. Its CMI is at most $`2(9+\log2)+2\log(1+\sqrt2)<23`$. The auxiliary telescope, with the expected increase at depth $`j`$ at most $`128\sqrt n\,2^{-j/4}`$, bounds expected total excess by $`128\sqrt n/(1-2^{-1/4})<1024\sqrt n`$.

Condition $`P_z`$ on having total excess at most $`2048\lceil\sqrt n\rceil`$, giving $`P'_z`$. Markov's inequality gives this event probability at least one half for every $`z`$. Let $`Q_T=\mathbb E_S P_{T_S}`$. For any selected sample write $`P=P_z`$ and $`P'=P'_z`$. Since $`P'\le2P`$ and $`P\ll Q_T`$,
```math
 D(P'\Vert Q_T)\le \log2+2\int \log^+(dP/dQ_T)\,dP
 \le \log2+2D(P\Vert Q_T)+2/e.
```
Here $`u\log(1/u)\le1/e`$ bounds the negative part after changing measure to $`Q_T`$. Given a pool, its output mixture minimizes the average relative entropy over comparison laws, by the KL chain rule. Averaging gives $`I(V;S\mid T)<48`$ for $`V`$ drawn from $`P'_{T_S}`$.

## Assigning mass to input rows, including ties

Every $`V`$ is an observed feature or one plus the maximum. Replace the latter by the maximum and call the resulting observed feature $`W`$. Given $`V`$ and one bit specifying the latter case, $`W`$ is determined. Thus $`I(W;S\mid T)<49`$. Conditional on the sample and $`W`$, choose $`J`$ uniformly among selected rows at $`W`$. The resulting row law $`p_z`$ permutes with the input.

Fix $`T,W`$, let $`m\ge1`$ be the number of occurrences of $`W`$ in the entire pool, and let $`\hat m`$ be its selected count. As a comparison law on indices, give each row its pool multiplicity of $`W`$ divided by $`m`$. Each selected occurrence belongs to a row of positive multiplicity. Hence the relative entropy of the uniform selected-occurrence law against the comparison law is at most $`\log(m/\hat m)`$. Under the true law $`\hat m\ge1`$.

Keep the true law of $`T,W`$, but replace the selector by an independent uniform vector. The KL cost from the true joint law to this comparison law is $`I(W;S\mid T)`$. Under the comparison law, if $`d`$ rows contain two copies of $`W`$ and $`r`$ contain one, then $`m=2d+r`$ and $`\hat m`$ has law $`d+\mathop{\mathrm{Bin}}(r,1/2)`$. As $`t\le((1+t)/2)^2`$ for $`0\le t\le1`$,
```math
 \mathbb E[(1+\hat m)^{-1}\mid T,W]
 =\int_0^1t^d((1+t)/2)^r\,dt\le2/(m+1).
```
Consequently the comparison expectation of $`m/\max(1,\hat m)`$ is at most 4. The entropy inequality $`\mathbb E_P f\le D(P\Vert Q)+\log\mathbb E_Qe^f`$, applied to its logarithm, yields $`\mathbb E_{\rm true}\log(m/\hat m)\le I(W;S\mid T)+\log4`$. First comparing the conditional row laws and then using the information chain rule gives
```math
 I(J;S\mid T)\le I(W;S\mid T)+I(J;S\mid T,W)
 \le 2I(W;S\mid T)+\log4<100.
```

## The deterministic answer

Calculate $`p_z`$ and choose the row $`i\in\{1,\dots,n\}`$ maximizing $`p_z(i)/i`$, breaking ties by smaller $`i`$. Return its feature $`x_i`$. If $`x_i`$ is the sample maximum, choose the better of $`x_i`$ and $`x_i+1`$ by training loss, preferring $`x_i`$ on ties. Every positive-mass row has an associated accurate parameter, so this decoder achieves the specified samplewise loss on every ordering, including adversarial orderings.

For the CMI calculation introduce independent random priorities as in the [index-selection lemma](PRIORITY.md), and denote the chosen physical row by $`F`$. The lemma with $`B<100`$ gives $`H(F\mid T,R)<6000`$ nats. Given $`T,R,F`$, the final parameter has at most four possible values, the two feature values of the row and either of these plus one. Decoding costs at most $`\log4`$ nats. By row exchangeability the priority-averaged conditional entropy of the decoded answer equals the actual answer's conditional entropy given the pool. The learner is deterministic, so the latter is precisely its CMI. This gives the stated loose bound of 7000 nats.

## Exact computation

Sort by feature and then decreasing label. List the $`n+1`$ virtual losses and the proper parameter assigned to each cut by the endpoint rule above. Enumerate all $`M=2(n+1)`$ cyclic shifts of the folded tree. Each leaf in each shift has probability $`1/M`$ times the product of its rational child probabilities. Sum by output, discard outputs above the empirical cutoff, and apportion the surviving mass for each feature equally to its occurrences, allocating mass for the final sentinel to the maximum. The common normalization can be omitted when maximizing a score.

Each tree has $`M`$ leaves and depth $`O(\log(n+1))`$. Each branch numerator and denominator has $`O(\log(n+1))`$ bits, so each leaf mass has $`O(\log^2(n+1))`$ bits. Even multiplying together the denominators of all $`M^2`$ contributions gives polynomial bit length. Exact summation, division by row multiplicities and score comparisons therefore take polynomial bit time. The algorithm accesses real features by comparison and by adding one to the maximum. With rational features these operations are polynomial in the input encoding as well.
