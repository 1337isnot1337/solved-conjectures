# Unbounded information in the pilot localization learner

The [double-logarithmic learner](distribution-free-localization.md) itself does not have uniformly bounded original CMI in dimension one. This remains true when the random split and the anchor are kept hidden and the observer sees only the returned classifier. Thus deleting the anchor from the upper-bound transcript cannot by itself establish the sponsor's linear bound for this algorithm.

Take $`H_M=\{h_j(x)=1[x=j]:1\le j\le M\}`$ on $`M\ge2`$ features, with uniform feature and independent fair binary label. The VC dimension is one. First let $`n`$ tend to infinity with $`M`$ fixed, then let $`M`$ increase. Write $`T`$ for the paired iid supersample, $`S`$ for its selector, and $`J`$ for the index of the pilot ERM after the internal uniform split. We prove
```math
 \liminf_{M\to\infty}\liminf_{n\to\infty}
 \frac{I(W;S\mid T)}{\log M}\ge 0.04 ,
```
where $`W`$ is the final output index. This is a lower bound in two ordered limits and does not assert a matching rate as a function of $`n`$.

## The output agrees with the pilot winner

For fixed $`M`$, all features occur among the marked pilot observations with probability tending to one, so the anchor then equals $`h_J`$. On this event the fallback never triggers. With probability tending to one every feature occurs at least $`s/(2M)`$ times on the main block. Any different prediction trace therefore disagrees with $`h_J`$ on at least $`s/M`$ positions. Equation (1) in the [localization proof](distribution-free-localization.md) bounds the expected main disagreement by $`O(s/\log^2(en)+\sqrt s)=o(s)`$. Hence $`\Pr(W\ne J)\to0`$. Fano's inequality, or encoding a mismatch bit and its index, shows that replacing $`W`$ by $`J`$ changes its conditional information by $`o(1)`$ for each fixed $`M`$.

## Lower bound on the winner's entropy given the pool

An observation with feature $`j`$ and label $`y`$ contributes $`2y-1`$ to arm $`j`$ and zero to all other arms. Minimizing the pilot loss is exactly maximizing these signed sums. The observation vectors have mean zero and covariance $`I/M`$. Independently repeat both selector and internal split given the same full pool $`T`$, giving pilot winners $`J,J'`$. Their pilot sets of $`p=\lfloor n/2\rfloor`$ observations overlap in a fraction tending to $`1/4`$ in probability. Indeed, the two uniform size-$`p`$ row sets have overlap $`p^2/n+o_{\Pr}(p)`$ by the hypergeometric variance, and each common row selects the same entry independently with probability $`1/2`$.

Conditional on the index sets, the observations in the intersection and the two exclusive parts are three independent iid blocks. Their sizes divided by $`p`$ converge to $`1/4,3/4,3/4`$. By the ordinary multivariate central limit theorem their two score vectors, scaled by $`\sqrt{M/p}`$, converge jointly to independent-across-arms standard normal pairs $`(U_j,U'_j)`$ of correlation $`1/4`$. Equivalently one can apply the CLT along every deterministic sequence of index sets with these limiting sizes. Ties in these Gaussian scores have probability zero, so probabilities of equality of the two maxima's indices converge.

For $`u=\sqrt{1.99\log M}`$ the chance of a common winner is at most
```math
 2\Phi(u)^M + M\Pr(U_1>u,\ U'_1>u)
 \le 2\Phi(u)^M+M\exp[-u^2/(1+1/4)] .
```
For the second term use the normal tail of the sum. The first decays faster than any power of $`M`$ by the elementary lower normal tail estimate. The second is $`M^{-0.592}`$. Since the two discrete winners are independent conditional on $`T`$, the conditional collision probability is $`\sum_j\Pr(J=j\mid T)^2`$. Shannon entropy dominates collision entropy, and Jensen gives $`H(J\mid T)\ge-\log\Pr(J=J')`$. Thus its lower bound in the ordered limits is $`(0.592-o(1))\log M`$.

## Upper bound given the selected data as well

The observer with $`T,S`$ knows the signed scores of all $`n`$ selected observations. Make a list of the $`\lceil M^{0.55}\rceil`$ indices with the highest full selected scores. Its chance of containing $`J`$ tends to one in the ordered limits. In fact the pilot and full selected score vectors, each standardized by its own standard deviation, converge for fixed $`M`$ to $`(U_j,V_j)`$ with
```math
 V_j=U_j/\sqrt2+Z_j/\sqrt2 ,
```
where the $`Z_j`$ are iid standard normals independent of all $`U_j`$. This follows by splitting the selected sample into the independent pilot and remaining blocks. For the maximizing index $`I`$ of $`U`$, the variable $`Z_I`$ is still standard normal. Since $`\max U_j/\sqrt{2\log M}\to1`$ in probability, $`V_I/\sqrt{2\log M}\to1/\sqrt2`$. In particular $`V_I>0.69\sqrt{2\log M}`$ with probability tending to one. The expected number of $`V_j`$ above that threshold is at most $`M^{1-0.69^2}`$, so by Markov fewer than $`M^{0.55}`$ exceed it with probability tending to one. The limiting Gaussian scores have no ties, justifying the transfer of the list event.

Encode a list-membership bit and, on success, the rank in this known list. This gives $`H(J\mid T,S)\le (0.55+o(1))\log M`$ in the ordered limits. Subtraction gives a limiting lower coefficient of at least $`0.042`$, which implies the displayed bound.

This example has an easy alternative behavior under the specified distribution: all singleton population losses are equal. The construction proves a limitation of the pilot-selection rule for [Steinke–Zakynthinou Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf). It gives no lower bound on arbitrary learners satisfying the sponsor's samplewise accuracy requirement.
