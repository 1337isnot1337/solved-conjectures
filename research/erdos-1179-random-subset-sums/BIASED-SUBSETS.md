# A biased-coin variant of subset-sum equidistribution

The [exponential potential](UNIVERSAL-SECOND-ORDER.md) also handles unequal inclusion probabilities. Fix \(0<p<1\). Given independent uniform \(a_1,\ldots,a_k\) in a finite abelian group of order \(N\), let \(D_k(g)\) be the conditional probability of \(\sum_{j=1}^k B_j a_j=g\), where \(B_j\) are independent Bernoulli-\(p\) variables. Put \(u=\max(p,1-p)\in[1/2,1)\). Uniformly in the group, for every fixed \(0<\epsilon<1\),
\[
 \Pr[\max_g |N D_k(g)-1|>\epsilon]\longrightarrow0
 \qquad\text{if}\qquad \frac{u^{-k}}{N\log N}\longrightarrow\infty.
\]
The same upper bound holds for a uniform subset (distinct \(a_j\)). In the other direction, every realization has a point of probability at least \(u^k\), because a most likely Bernoulli pattern has that probability. The theorem therefore has the sharp first-order scale \(k=(\log N)/(-\log u)\). It does not assert that the logarithmic correction is sharp in the biased case.

For a sign \(s\) and \(0<\theta\le1\), use
\[
 Z_j^s=\frac1N\sum_g
   \exp\left(s\theta u^{-j}(D_j(g)-1/N)\right).
\]
The average exponent is zero, so each \(Z_j^s\ge1\). The next probability vector is a mixture of the current vector and one uniform random translate, with weights \(u,1-u\) in either order. Conditional on the existing vector, the next potential is averaged as the product of two current potentials, one with parameter \(\theta\), the other with parameter \(\theta(1-u)/u\). The latter is at most \((Z_j^s)^{(1-u)/u}\) by concavity of \(x\mapsto x^{(1-u)/u}\). Thus
\[
 \mathbb E[Z_{j+1}^s\mid\mathcal F_j]\le (Z_j^s)^{1/u},
 \qquad
 \mathbb E\log Z_k^s\le u^{-k}\log Z_0^s\le \theta^2 u^{-k}/N.
\]
The initial probability vector is a unit atom, so the last calculation is exactly the same as in the unbiased proof. A relative error above \(\epsilon\) in either sign forces \(\log Z_k^s>\theta\epsilon u^{-k}/N-\log N\). Set \(\theta=2N\log N/(\epsilon u^{-k})\) when this is at most one. Markov gives failure probability at most \(8N\log N/(\epsilon^2u^{-k})\). For distinct samples the direct certificate in the unbiased note still works: subtract 1 from every potential before averaging over unused translates, then use \(1+c(x-1)\le x^c\). This loses only a factor \(\prod_{j<k}N/(N-j)=1+o(1)\) when \(k=O(\log N)\). For larger \(k\) one can stop at \(k^{\prime}=\min\{k,\lceil(\log N+\log\log N+\log\log\log N)/(-\log u)\rceil\}\) and use monotonicity under further convex mixtures of translates.

This conditional probability model is not the fixed-cardinality subset-sum problem, for which the convolution recursion is different.
