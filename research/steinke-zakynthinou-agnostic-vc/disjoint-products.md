# Closure under independent choices on disjoint instance sets

Let $`X=X_1\sqcup\cdots\sqcup X_k`$ be a known partition. Let $`H`$ consist of all functions obtained by choosing any $`h_j\in H_j`$ on each $`X_j`$. If each class satisfies Steinke and Zakynthinou's agnostic Conjecture 6 with a common constant, then so does $`H`$, with a universal change of constant independent of the number of parts. In particular, the [two-endpoint reduction](endpoint-reduction.md) gives the conjectured rate for every such product of countable-domain VC-one classes, with unbounded total VC dimension. This includes independent real-threshold subproblems directly wherever the [real-threshold theorem](../../results/steinke-zakynthinou-thresholds/PROOF.md) applies. This theorem concerns classes whose parameters can be chosen independently on a known partition. [Original conjecture and Theorem 2](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

Drop constant classes of dimension zero, predicting their unique function directly. For the remaining components write $`d_j=\operatorname{VC}(H_j)\ge1`$. Then $`d=\operatorname{VC}(H)=\sum_jd_j`$: shattered subsets project to shattered subsets in each part, and shattered sets in disjoint parts can be united. Extend the component algorithms to positive sample sizes $`r\lt d_j`$ by returning a fixed hypothesis. This has zero CMI and empirical excess at most $`1\le\sqrt{d_j/r}`$.

## Smoothing a learner by subsampling

Write $`B_r`$ for a learner's bound on original CMI at sample size $`r`$ for every iid distribution. On $`2r`$ iid observations, randomly permute and pair them, choose one of each pair by independent fair bits, and apply the learner in the randomized order of pairs. The resulting kernel on the $`2r`$ observations has **expected Jensen–Shannon divergence at most $`B_r/(2r)`$** upon replacing one distinguished observation by an independent copy. Here JS uses an equal mixture. The two output laws being compared average all internal randomness, including pairing and selection.

To prove it, use the same random arrangement under both alternatives and reveal that arrangement for an upper bound by joint convexity of JS. The changed observation is at a uniform pair position $`i`$. With probability one half its unchanged mate is selected, giving an identical law on the two inputs. Otherwise the output laws are $`P_a,P_{a'}`$ with alternative fresh entries $`a,a'`$ at position $`i`$; all other selectors are still hidden. By joint convexity the JS is at most half of $`\operatorname{JS}(P_a,P_{a'})`$. After averaging over the data, the latter quantity for fixed $`i`$ is exactly $`I(A;S_i\mid T)`$ in the base learner's native $`r`$-pair CMI experiment: place $`a,a'`$ together at row $`i`$, and use the other $`r-1`$ pairs. The unused mate is independent of these data. Since the selector bits are conditionally independent given $`T`$,
```math
 \sum_{i=1}^r I(A;S_i\mid T)\le I(A;S\mid T)\le B_r.
```
Averaging over $`i`$ proves the assertion. Hidden selectors in the other pairs are essential for this direction of the inequality.

On a component sample of size $`m\ge2`$, draw $`r`$ uniformly from the integers in $`[\lceil m/4\rceil,\lfloor m/2\rfloor]`$. Choose $`2r`$ different candidate rows uniformly, then use the preceding paired procedure. Equivalently the base learner receives an ordered uniform sample of $`r`$ rows without replacement. For $`m=0,1`$ return a fixed component hypothesis. For $`B=\sup_r B_r`$, the expected JS of this output kernel between $`m`$ iid observations and the same observations plus one fresh iid observation is
```math
 O((1+B)/(m+1)).
```

Indeed, couple the two uniform choices of $`r`$ maximally. Both interval endpoints move by at most one and each interval has at least $`m/8`$ members for $`m\ge8`$. The probability of disagreement is $`O(1/m)`$, on which JS costs at most $`\log2`$. When $`r`$ agrees, keep the same uniform $`2r`$-subset except that, with probability $`2r/(m+1)`$, replace one uniform candidate by the extra observation. This produces a uniform subset of the larger sample. Conditional on a replacement, the unchanged candidates and the deleted and inserted observations are iid. Apply the $`2r`$-row bound and use $`r\ge m/4`$. The shared random choices used in this comparison are independent of the data and joint convexity justifies averaging their costs. Bounded $`m`$ fits the same claim by enlarging the universal constant.

## Original CMI of the product

Run these component procedures independently on the input rows of each part, and output their combined function. In the original supersample, the selector tensorization
```math
 I(A;S\mid T)\le\sum_i I(A;S_i\mid T,S_{-i})
```
bounds its CMI by $`n`$ times the expected JS between neighboring kernels with $`n-1`$ common observations and two fresh alternatives. For comparison take $`Q`$, the kernel of the componentwise procedure on just the $`n-1`$ common observations (for $`n=1`$ this is defined as well). Adding either fresh observation changes only its own component. Conditional on the observed data the others have exactly identical independent laws.

Use the Hellinger distance $`h(P,Q)=\|\sqrt p-\sqrt q\|_2/\sqrt2`$, with densities against any common dominating measure. Then $`h^2/2\le\operatorname{JS}\le2h^2`$. The lower bound follows from $`D(P\Vert M)\ge2h^2(P,M)`$, for $`M=(P+Q)/2`$, and the triangle inequality. The upper bound follows from $`\log u\le u-1`$ and $`(p-q)^2/(p+q)\le2(\sqrt p-\sqrt q)^2`$. Thus the JS between the two alternatives is at most eight times the sum of their individual JS distances to $`Q`$. Common independent component outputs preserve these divergences, and mapping the tuple to its combined function cannot increase them.

Let $`\pi_j`$ be the mass of $`X_j`$. Conditional on the fresh observation being in part $`j`$, the number $`M_j`$ of common observations there has law $`\operatorname{Bin}(n-1,\pi_j)`$; conditional on the component counts its observations are iid from the corresponding conditional distributions. The preceding add-one estimate applies with $`B=O(d_j)`$. For $`\pi_j>0`$,
```math
 n\pi_j\,\mathbb E[(M_j+1)^{-1}]=1-(1-\pi_j)^n\le1.
```
Summing the tensorization bound gives $`O(\sum_j(1+d_j))=O(d)`$.

## Empirical accuracy on an arbitrary fixed input

For a size-$`m`$ component and $`r\ge1`$ as above, let $`R_I(h)`$ be mean loss on its uniform $`r`$-subset, and $`R(h)`$ the mean on all $`m`$ fixed observations. A uniform bound is
```math
 \mathbb E\sup_{h\in H_j}|R_I(h)-R(h)|=O(\sqrt{d_j/r}).
```
To see this, sample a second uniform $`r`$-subset $`J`$ from the complement. Conditional on $`I`$, its expected mean loss is that of the complement. Since $`2r\le m`$, Jensen bounds the discrepancy by $`\mathbb E\sup_h|R_I(h)-R_J(h)|`$. Generate the two subsets by choosing $`2r`$ rows, pairing them, and randomly orienting each pair. The triangle inequality reduces the difference to two fixed-design Rademacher suprema divided by $`r`$.

For completeness, the needed fixed-design estimate follows from the iid VC inequality in the sponsor's Theorem 2. For fixed labeled observations $`z_i`$, draw $`r`$ independent indices uniformly with replacement and independent fair signs. Group the signed coefficients by index, calling the resulting sums $`G_i`$. Their joint law is that of independent fair signs times the magnitudes $`|G_i|`$, where the sign vector is independent of all magnitudes (zeros may be given fresh signs). Each expected magnitude is the same and at least the probability of a singleton hit, $`(1-1/r)^{r-1}\ge1/e`$, with value one at $`r=1`$. Jensen applied conditional on the signs gives
```math
 \mathbb E_\epsilon\sup_h|\sum_i\epsilon_i\ell(h,z_i)|
 \le e\,\mathbb E\sup_h|\sum_iG_i\ell(h,z_i)|.
```
A signed binary loss is the loss with a fair random label flip minus the indicator of that flip. For the iid draws, every hypothesis has expected flipped loss one half. Theorem 2 and the expected deviation of the flip count from $`r/2`$ bound the last expected supremum by $`O(\sqrt{r d_j})`$; for $`r<2d_j`$ use the trivial bound $`r`$. This proves the finite-population estimate.

Apply it to the base learner's output and to a best component comparator. Its expected excess on the full component is $`O(\sqrt{d_j/r})=O(\sqrt{d_j/m})`$. For $`m=1`$ the same bound covers the default output. Thus for any fixed ordered sample with component counts $`m_j`$, total excess in counts is at most a universal multiple of
```math
 \sum_j\sqrt{m_jd_j}\le\sqrt{nd}.
```
The empirical optimum decomposes exactly over the partition, completing both sponsor bounds. Neither the training algorithm nor its choice of local sample sizes uses the component probabilities $`\pi_j`$.
