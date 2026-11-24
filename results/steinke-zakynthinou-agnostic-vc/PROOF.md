# Steinke–Zakynthinou’s agnostic VC learning conjecture

The [manuscript](paper.pdf) gives the full argument, including the projection and deletion estimates. The [scope audit](SCOPE.md) specifies the additional hypothesis for the population theorem.

## Statement and conventions

Let $`\mathcal H\subseteq\{0,1\}^{\mathcal X}`$ have finite VC dimension $`d\ge1`$. Fix an integer $`n\ge d`$. For a labeled sample $`z`$ let $`\widehat L_z(h)`$ be its fraction of classification mistakes. The proposed learner $`A`$ returns an element of $`\mathcal H`$. Under the population measurability convention described below, one universal $`C`$ satisfies

```math
 \forall z,\quad \mathbb E_A\widehat L_z(A(z))\le
 \min_{h\in\mathcal H}\widehat L_z(h)+C\sqrt{d/n},
 \qquad I(A(\widetilde Z_S);S\mid\widetilde Z)\le Cd .
```

Here the $`2n`$ entries of the paired array $`\widetilde Z`$ are independent draws from any one distribution, and the $`n`$ independent fair bits $`S`$ choose one entry per row. The information is about the entire returned hypothesis. All logarithms are natural.

We use a single well-order of the hypothesis class for all sample sizes, as in the authors’ globally consistent learner. On any fixed pool the construction is finite, even for an arbitrary class. The information inequality holds on **each fixed paired pool**. The population conclusion follows by integrating the pointwise bound wherever the learner and information in the original problem are measurable. In particular it holds for every countable class of measurable classifiers with an enumeration, and for classes admitting measurable coherent trace representatives and measurable evaluation. The [Lean population statement](../../lean/Conjectures/AgnosticVC/Theorem.lean) makes the condition on the chosen representatives explicit. The separate [fixed-pairing theorem](../../lean/Conjectures/AgnosticVC/FixedPairing.lean) applies to arbitrary underlying sets. [Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Authors’ representative convention, Lemmas 4.15 and 4.17](https://arxiv.org/pdf/2001.09122)

## 1. The learner and its empirical error

Put $`t=n/d`$, $`\rho=21/20`$ and $`J=\lfloor\log_4\sqrt t\rfloor`$. Use

```math
 m_j=d4^j\ (0\le j\le J),\qquad
 b_j=\sqrt t\,\rho^{-j}\ (0\le j\le J+1),\qquad
 a_j=b_j-b_{j+1},\qquad \tau=b_{J+1}.
```

Given the features of the sample, take the first hypothesis for each distinct joint prediction vector. The resulting finite set is $`G_z`$. Draw independent weights $`U_i`$ uniformly on $`[0,2]`$ and write $`L_U(h)=\sum_i U_i\,1[h(x_i)\ne y_i]`$. For a probability vector $`q`$ on $`G_z`$ let $`q_M`$ be its pushforward to predictions on positions $`M`$. With $`H`$ denoting Shannon entropy, minimize

```math
 F(q)=\mathbb E_q L_U-\tau H(q)
      -\sum_{j=0}^J a_j\,\mathbb E_{|M|=m_j}H(q_M).
```

Each subset average is uniform without replacement. Return a random hypothesis with the minimizing law. Existence follows by compactness. The positive full-entropy coefficient gives strict convexity and an interior minimizer. Indeed a zero-mass hypothesis can be introduced with mass $`\epsilon`$, gaining order $`\epsilon\log(1/\epsilon)`$ in full entropy while the possible decrease of every other entropy is at most order $`\epsilon`$ by concavity. A one-element support needs no optimization. The same operation on $`N=n+1`$ examples below always uses the parameters chosen for $`n`$.

Let $`\Pi(s)`$ be the largest trace count on $`s`$ features. Comparing the objective with a point mass on an empirical minimizer bounds the excess unweighted count, conditional on the weights, by

```math
 \tau\log\Pi(n)+\sum_j a_j\log\Pi(m_j)
 +2\sup_h\left|\sum_i(U_i-1)\,1[h(x_i)\ne y_i]\right|.
```

By Sauer’s lemma $`\log\Pi(s)\le d\log(es/d)`$ for $`s\ge d`$. The second term is at most a universal multiple of $`d\sqrt t\sum_{j\ge0}\rho^{-j}(1+j)`$. For $`\delta=\log\rho/(2\log4)>0`$, we have $`\tau\le\sqrt t\,t^{-\delta}`$. Since $`t^{-\delta}\log(et)`$ is bounded on $`[1,\infty)`$, the first two terms are $`O(\sqrt{nd})`$.

Here are details for the random term. Loss vectors have the same pairwise Hamming distances as prediction vectors. In normalized empirical Euclidean distance a set of $`p\ge2`$ vectors separated at radius $`r\le1`$ differs pairwise on more than an $`r^2`$ fraction of positions. A sample of $`k=\max(d,\lceil3\log(2p)/r^2\rceil)`$ positions with replacement distinguishes all pairs with positive probability by a union bound. Thus $`p\le(ek/d)^d`$. For $`u=\log(p)/d`$ this implies $`u\le\log(C(1+u)/r^2)`$, hence $`u\le C'\log(C'/r)`$. A maximal packing is a net. Write each centered random weight as an independent random sign times an independent amplitude at most one. Conditional on all amplitudes, any fixed sign-sum increment between vectors at distance $`r`$ has moment generating function at most $`\exp(\lambda^2nr^2/2)`$. Take nets at radii $`2^{-s}`$ with one starting vector and attach each point to a parent in the preceding net. At depth $`s`$ there are at most $`\exp(Cd(s+1))`$ increments, each of length at most $`2^{1-s}`$. The expected maximum absolute increment is therefore $`O(\sqrt{nd}\,2^{-s}\sqrt{s+1})`$. The trace set is finite, so the nets eventually contain every vector. Summing the series and the starting-vector bound $`\sqrt n`$ proves the empirical assertion.

## 2. Averaged prediction projections

Fix a block $`T`$ of $`N=n`$ examples with $`d\lt n`$, and a positive law $`q`$ on its canonical hypotheses. The same estimates apply to $`N=n+1`$. In both cases $`m_J\lt N`$ since $`m_J^2\le nd`$. Work on the finite-dimensional space of mean-zero real functions in $`L^2(q)`$. Let $`P_M`$ be orthogonal projection by conditional expectation on the predictions on $`M`$. Put $`K_m=\mathbb E_{|M|=m}P_M`$. Coupling nested uniform subsets gives $`0\le K_m\le K_{m'}\le I`$ for $`m\le m'`$. Write $`f_i(h)=h(x_i)-\mathbb E_q h(x_i)`$.

**Overlap inequality.** If $`km\le M\le N`$ for a positive integer $`k`$, then

```math
 \big\|(I-K_M)^{1/2}K_m^{1/2}\big\|\le k^{-1/2}.
```

Take $`k`$ independent uniform $`m`$-subsets $`J_s`$ and pad their union uniformly to an $`M`$-subset $`V`$. Permutation symmetry makes $`V`$ uniform. Given $`v`$ let $`y=K_m^{\dagger/2}v`$, using zero on the kernel, and $`x=K_m^{1/2}v`$. The independent vectors $`P_{J_s}y`$ have mean $`x`$ and second moment $`\langle y,K_m y\rangle\le\|v\|^2`$. Their average lies in the range of $`P_V`$ for each realization. Orthogonal projection is a best approximation, so

```math
 \langle x,(I-K_M)x\rangle
 =\mathbb E\|(I-P_V)x\|^2
 \le\mathbb E\left\|x-k^{-1}\sum_s P_{J_s}y\right\|^2
 \le\|v\|^2/k .
```

**Inverse estimate.** Define $`B_0=K_{m_0}`$, $`B_j=K_{m_j}-K_{m_{j-1}}`$ for $`1\le j\le J`$, and $`B_{J+1}=I-K_{m_J}`$. These operators are positive and sum to the identity. For $`i<j`$, apply the overlap inequality to $`B_i\le K_{m_i}`$ and $`B_j\le I-K_{m_{j-1}}`$, with $`k=4^{j-i-1}`$. This gives $`\|B_i^{1/2}B_j^{1/2}\|\le2^{-(j-i-1)}`$. The order comparison follows by sandwiching the first inequality by $`B_j^{1/2}`$, interchanging the two factors via adjoints in the norm, and sandwiching the second inequality by $`K_{m_i}^{1/2}`$.

Define $`A=\tau I+\sum_j a_jK_{m_j}=\sum_{j=0}^{J+1}b_j B_j`$ and $`C_0=\sum_{j=0}^{J+1}b_j^{-1}B_j`$. The map $`Wv=(B_j^{1/2}v)_j`$ is an isometry. Direct multiplication shows $`C_0A-I=W^* E W`$ with blocks $`E_{ij}=(b_j/b_i-1)B_i^{1/2}B_j^{1/2}`$. Indeed compressing these blocks gives $`\sum_{ij}(b_j/b_i-1)B_iB_j`$. Each row and column of block norms sums to at most

```math
 2\sum_{h\ge1}(\rho^h-1)2^{-(h-1)}
 =\frac{2(\rho-1)}{(1-1/2)(1-\rho/2)}=\frac8{19}<\frac12.
```

The scalar row/column sum inequality applied to the norms of vector components gives $`\|C_0 A-I\|\le8/19`$. In particular, applying this to $`A^{-1}x`$ and using $`C_0=W^*{\rm diag}(b_j^{-1})W`$ gives

```math
 \|A^{-1}x\|^2\le4\|C_0x\|^2
 \le4\sum_{j=0}^{J+1} b_j^{-2}\langle B_jx,x\rangle .
```

**Residual variance.** For $`1\le m<N`$,

```math
 \frac1N\sum_{i=1}^N\langle (I-K_m)f_i,f_i\rangle\le\frac{d}{m+1}.
```

Choose a uniform position $`i`$ and an independent uniform $`m`$-subset. The residual variance is zero if it contains $`i`$. Otherwise, condition on their union of size $`m+1`$, from which $`i`$ is uniformly omitted. Project $`q`$ to the prediction vectors on this union. For any omitted coordinate, each pair with identical remaining predictions contributes $`p_up_v/(p_u+p_v)`$ to the expected conditional variance, where $`p`$ is the projected law. Summing over omissions counts each edge of the unit-distance graph once. The sum of the smaller endpoint masses of all edges is at most $`d`$. Indeed any binary trace set $`V`$ of VC dimension at most $`d`$ has at most $`d|V|`$ edges. Split at the last coordinate, with projected layers $`V_0,V_1`$. Their union and intersection have dimensions at most $`d,d-1`$, respectively. Their internal edge counts together dominate those of the two layers, and there are $`|V_0\cap V_1|`$ cross-layer edges. Induction, starting with zero-dimensional or empty families, gives the bound. Apply it on each upper level set of $`p`$ and integrate over the level to get the weighted bound, since the masses sum to one. Dividing by $`m+1`$ proves the residual inequality.

Now $`N^{-1}\sum_i\langle B_0f_i,f_i\rangle\le1/4`$ by binary variance. Every later term is at most $`d/(m_{j-1}+1)\le4^{1-j}`$ after averaging, including the last band. Hence for **every** positive $`q`$ and every $`T`$,

```math
 D_T(q):=\sum_i\|A^{-1}f_i\|^2
 \le \frac{4N}{t}\left(\frac14+\sum_{j\ge1}\rho^{2j}4^{1-j}\right)
 \le C d .
```

Here $`\rho^2<4`$ and $`N\le2n`$. No commutativity of the averaged projections was used.

## 3. Removing one example

Use $`H_2^2(p,r)=\sum_h(\sqrt{p(h)}-\sqrt{r(h)})^2`$ with all laws embedded by their actual hypothesis names. On the fixed $`N`$-block let $`q`$ now denote the optimizer for its random weights. Let $`q_{-i}`$ be the actual optimizer on the block with position $`i`$ removed, using the remaining weights. We show

```math
 \mathbb E_U\sum_i H_2^2(q,q_{-i})\le Cd .
```

**Removing the loss.** Keep the full support and the full restriction scheme. Replace weight $`U_i`$ by zero to obtain $`r_i`$. Along the path where this weight equals $`w`$, write $`s=\dot q/q`$. This score has mean zero. For two tangent scores $`s,v`$ at a positive law, the Hessian of the convex negative entropy of a projection onto $`M`$, along tangent vectors $`qs,qv`$, is $`\sum_c(qs)_M(c)(qv)_M(c)/q_M(c)=\langle P_Ms,P_Mv\rangle_q`$. The full entropy gives $`\langle s,v\rangle_q`$. Differentiating the first-order condition for all tangent directions thus gives $`As=-\big(\ell_i-\mathbb E_q\ell_i\big)=\pm f_i`$, where $`\ell_i`$ is the single binary mistake. The Hessian is positive definite on the simplex tangent space, so the interior optimizer depends smoothly on $`w`$ by the implicit function theorem. It follows that $`\|\partial_w\sqrt q\|_2^2=\|A^{-1}f_i\|_q^2/4`$. Cauchy–Schwarz bounds the squared endpoint distance by $`U_i`$ times the integral of this squared speed from zero to $`U_i`$. Bound $`U_i\le2`$ and extend the integral to $`[0,2]`$. With the other weights fixed, integration over this interval is exactly twice the expectation at a fresh uniform weight. Consequently

```math
 \sum_i\mathbb E_U H_2^2(q,r_i)\le \mathbb E_U D_T(q)\le Cd .
```

**Removing the coordinate from restrictions.** On the same full support and with zero weight at $`i`$, now take all feature restrictions from the other $`N-1`$ positions. Call the new minimizer $`r'_i`$. Couple a uniform $`m`$-subset to one avoiding $`i`$ by retaining it if possible and otherwise replacing $`i`$ with a uniformly chosen outside index. The result is uniform by symmetry and the chance of a change is $`m/N`$. In a changed pair the restrictions consist of a common partition refined by one of two binary observations. Modulo constants, the gradient of negative entropy for one such refinement minus that of the common partition is the random variable $`\log p(B\mid\mathrm{cell})`$. Its squared norm has a universal bound because $`u\log^2 u+(1-u)\log^2(1-u)`$ is bounded on $`[0,1]`$, with endpoint values taken by continuity. Thus the norm of the difference of gradients, after centering, is at most a universal constant times $`m/N`$ after averaging the coupling.

Interpolate the two objectives linearly. The full-entropy coefficient stays $`\tau`$ and the restriction terms stay convex. The tangent score of the optimizer solves the same differentiated first-order equation with Hessian at least $`\tau I`$ and right side of norm at most $`C\sum_j a_jm_j/N`$. Integrating the square-root speed along the unit interval therefore gives

```math
 H_2^2(r_i,r'_i)\le C\left(\sum_j a_jm_j/(N\tau)\right)^2 .
```

The sum over positions is $`O(d)`$, since

```math
 \sum_j a_jm_j/\tau
 =(\rho-1)\sum_{j=0}^J\rho^{J-j}d4^j
 \le\frac{\rho-1}{1-\rho/4}\,m_J,\qquad m_J^2\le nd .
```

**Removing redundant representatives.** Project full traces onto the surviving coordinates. A surviving trace has one or two full-trace representatives above it. The canonical representative after deletion is one of these full representatives, because any earlier hypothesis with the same full trace would also have the same surviving trace. Under $`r'_i`$ the masses of a two-element fiber are equal. Conditional on their sum, equal splitting maximizes the full entropy, while all other terms depend only on that sum.

Let $`\mu_i`$ be the total $`r'_i`$-mass of all two-element fibers. In each pair mark the endpoint of smaller mass under the original full law $`q`$, breaking ties once, to form a set $`E_i`$. Then $`r'_i(E_i)=\mu_i/2`$ and $`\sum_iq(E_i)\le d`$ by the weighted unit-distance bound in §2. The square-root triangle bound gives $`r(E)\le2p(E)+2H_2^2(p,r)`$. Hence

```math
 \sum_i\mu_i\le4d+4\sum_i H_2^2(q,r'_i).
```

Collapse each pair onto the actual surviving representative and call the resulting law $`p_i`$. For each pair of total mass $`u`$ the squared distance introduced is $`(2-\sqrt2)u`$. Write $`F_i`$ for the true deleted objective and $`C_i`$ for the set of surviving traces with two extensions. The entropy identity for splitting a pair shows that $`p_i`$ minimizes $`F_i(p)-\tau(\log 2)p(C_i)`$. The Bregman remainder of the full negative entropy is $`\mathrm{KL}(p_i\Vert q_{-i})`$; the other convex terms have nonnegative remainders. By optimality for both objectives,

```math
 \tau\,\mathrm{KL}(p_i\Vert q_{-i})
 \le F_i(p_i)-F_i(q_{-i})
 \le\tau(\log 2)\mu_i .
```

Finally $`H_2^2(p,r)\le\mathrm{KL}(p\Vert r)`$ by $`-\log x\ge1-x`$ applied to square-root density ratios. The triangle inequality for $`H_2`$, followed by Cauchy–Schwarz along the four successive comparisons, proves the claimed deletion bound. All estimates are uniform in the labeled block. Duplicate features and contradictory labels are allowed.

## 4. Information in the returned hypothesis

Fix a supersample and write $`Y=A(\widetilde Z_S)`$. Since its fair selector bits are independent before observing $`Y`$, the entropy chain rule and conditioning reducing entropy give

```math
 I(Y;S\mid\widetilde Z)
 \le\sum_{i=1}^n I(Y;S_i\mid\widetilde Z,S_{-i}).
```

For fixed values of the pool and the other bits, a summand is the Jensen–Shannon divergence of the two possible output laws. Both samples give **the same** ordered sample after deleting position $`i`$. Use the output law on this common sample with the schedule for $`n`$. For laws $`p,r`$, writing $`v=(p+r)/2`$ and using $`\log x\le x-1`$ gives

```math
 \mathrm{JS}(p,r)\le\frac12\sum_{h:p_h+r_h>0}
              \frac{(p_h-r_h)^2}{p_h+r_h}
 \le H_2^2(p,r).
```

Write $`c_i(T)`$ for the squared Hellinger distance between the learner on $`T`$ and the learner on $`T_{-i}`$ using this common schedule, with both laws already averaged over the weights. Convexity of squared Hellinger distance bounds $`c_i(T)`$ by the expected distance in §3 under the shared weight coupling. In the common finite alphabet of actual named hypotheses, the square-root triangle inequality bounds the row's Jensen–Shannon divergence by $`2(c_i(T_0)+c_i(T_1))`$. Conditional on the other bits, the fair bit selects $`T_0`$ or $`T_1`$ equally, so this is $`4\mathbb E[c_i(\widetilde z_S)\mid S_{-i}]`$. Summing and then applying §3 on each **selected** sample gives

```math
 I(A(\widetilde z_S);S)\le 4\mathbb E_S\sum_i c_i(\widetilde z_S)
 \le 4 \cdot 4928d.
```

For $`n=d`$ the selector entropy is at most $`n\log 2`$. The estimate holds for every deterministic pairing. Integrating the measurable pool statistic gives the original iid CMI bound. The empirical and information inequalities use the same proper learner and a common absolute constant of $`19{,}712`$. [Lean proof of this transfer](../../lean/Conjectures/AgnosticVC/FixedPairing.lean)

## A measurable globally consistent ERM suffices

Assume jointly measurable evaluation and a measurable diagonal in the hypothesis space. Suppose a single deterministic empirical risk minimizer $`E`$ on finite labeled samples has the global consistency property of Definition 4.13 in the companion paper. In particular, if $`E`$ returns $`h`$ on one sample, it also returns $`h`$ on every feature tuple containing those features when that tuple is labeled by $`h`$. Assume that for every feature law and sample size, $`E`$ is measurable on the completed iid experiment with independent fair labels. Then the two Conjecture 6 rates hold with the constants above. This condition permits any globally consistent measurable minimizer. [Framework paper, Definition 4.13 and Lemmas 4.14–4.15](https://arxiv.org/pdf/2001.09122v3)

For features $`x`$ and a feasible trace $`v`$, take $`g_x(v)=E(x,v)`$. Empirical minimization ensures $`g_x(v)|_x=v`$. Delete one row of $`x`$, leaving $`x'`$, and fix a trace $`u`$ on $`x'`$. Put $`h=g_{x'}(u)`$ and $`v=h|_x`$. By global consistency, $`g_x(v)=E(x,h|_x)=h`$. Therefore the shorter representative is one of the full representatives in its deletion fiber. This is the representative property used in the collapse step of §3. The optimizer, empirical estimate, and all other deletion steps depend on the prediction traces and the numerical weights. The four comparisons in §3 and the transfer in §4 therefore give the same information bound for the actual outputs named by $`g_x`$.

Fix an iid labeled law with feature marginal $`\mu`$. For each prescribed $`v`$, the map $`x\mapsto E(x,v)`$ is measurable under the completion of $`\mu^n`$. To see this, take any measurable output event and restrict its preimage in the fair-label experiment to the fixed label vector $`v`$. The label vector has positive probability, so sections of null sets at $`v`$ are null. Joint evaluation makes the feasibility event $`E(x,v)|_x=v`$ measurable on the same completion. These maps and events remain measurable when pulled back from features to the actual labeled samples. The latter have marginal $`\mu^n`$ on the features even if labels depend on those features. On each fixed feasible trace set and fixed training label vector, the objective has a unique minimizer, continuous in the weights. Indeed any limit point of minimizers along convergent weights minimizes the limit objective by continuity and compactness, and uniqueness gives convergence. The expected output probabilities are thus measurable by integrating a finite mixture over the independent weights.

On a fixed paired pool, there are finitely many pairs of a selector and a training trace. These pairs give a finite alphabet for the output before identifying equal hypothesis names. The equality matrix among their names is measurable on the completed pool because the diagonal is measurable. The finite information expression after merging names is measurable on each of the finitely many equality patterns and bounded by §4. Its integral equals the original iid CMI of the actual output. This proves the rates for the same learner under all iid laws, with measurability for each completed experiment.

The assumption on $`E`$ is stronger than existence of an ordinary measurable ERM. For the irrational circle-orbit class, restrict to samples of a single positive example from the orbit copy of the circle. If $`x,x'`$ lie in the same coset, the classifiers returned by $`E`$ at # Steinke–Zakynthinou’s agnostic VC learning conjecture

The [manuscript](paper.pdf) gives the full argument, including the projection and deletion estimates. The [scope audit](SCOPE.md) specifies the additional hypothesis for the population theorem.

## Statement and conventions

Let $`\mathcal H\subseteq\{0,1\}^{\mathcal X}`$ have finite VC dimension $`d\ge1`$. Fix an integer $`n\ge d`$. For a labeled sample $`z`$ let $`\widehat L_z(h)`$ be its fraction of classification mistakes. The proposed learner $`A`$ returns an element of $`\mathcal H`$. Under the population measurability convention described below, one universal $`C`$ satisfies

```math
 \forall z,\quad \mathbb E_A\widehat L_z(A(z))\le
 \min_{h\in\mathcal H}\widehat L_z(h)+C\sqrt{d/n},
 \qquad I(A(\widetilde Z_S);S\mid\widetilde Z)\le Cd .
```

Here the $`2n`$ entries of the paired array $`\widetilde Z`$ are independent draws from any one distribution, and the $`n`$ independent fair bits $`S`$ choose one entry per row. The information is about the entire returned hypothesis. All logarithms are natural.

We use a single well-order of the hypothesis class for all sample sizes, as in the authors’ globally consistent learner. On any fixed pool the construction is finite, even for an arbitrary class. The information inequality holds on **each fixed paired pool**. The population conclusion follows by integrating the pointwise bound wherever the learner and information in the original problem are measurable. In particular it holds for every countable class of measurable classifiers with an enumeration, and for classes admitting measurable coherent trace representatives and measurable evaluation. The [Lean population statement](../../lean/Conjectures/AgnosticVC/Theorem.lean) makes the condition on the chosen representatives explicit. The separate [fixed-pairing theorem](../../lean/Conjectures/AgnosticVC/FixedPairing.lean) applies to arbitrary underlying sets. [Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Authors’ representative convention, Lemmas 4.15 and 4.17](https://arxiv.org/pdf/2001.09122)

## 1. The learner and its empirical error

Put $`t=n/d`$, $`\rho=21/20`$ and $`J=\lfloor\log_4\sqrt t\rfloor`$. Use

```math
 m_j=d4^j\ (0\le j\le J),\qquad
 b_j=\sqrt t\,\rho^{-j}\ (0\le j\le J+1),\qquad
 a_j=b_j-b_{j+1},\qquad \tau=b_{J+1}.
```

Given the features of the sample, take the first hypothesis for each distinct joint prediction vector. The resulting finite set is $`G_z`$. Draw independent weights $`U_i`$ uniformly on $`[0,2]`$ and write $`L_U(h)=\sum_i U_i\,1[h(x_i)\ne y_i]`$. For a probability vector $`q`$ on $`G_z`$ let $`q_M`$ be its pushforward to predictions on positions $`M`$. With $`H`$ denoting Shannon entropy, minimize

```math
 F(q)=\mathbb E_q L_U-\tau H(q)
      -\sum_{j=0}^J a_j\,\mathbb E_{|M|=m_j}H(q_M).
```

Each subset average is uniform without replacement. Return a random hypothesis with the minimizing law. Existence follows by compactness. The positive full-entropy coefficient gives strict convexity and an interior minimizer. Indeed a zero-mass hypothesis can be introduced with mass $`\epsilon`$, gaining order $`\epsilon\log(1/\epsilon)`$ in full entropy while the possible decrease of every other entropy is at most order $`\epsilon`$ by concavity. A one-element support needs no optimization. The same operation on $`N=n+1`$ examples below always uses the parameters chosen for $`n`$.

Let $`\Pi(s)`$ be the largest trace count on $`s`$ features. Comparing the objective with a point mass on an empirical minimizer bounds the excess unweighted count, conditional on the weights, by

```math
 \tau\log\Pi(n)+\sum_j a_j\log\Pi(m_j)
 +2\sup_h\left|\sum_i(U_i-1)\,1[h(x_i)\ne y_i]\right|.
```

By Sauer’s lemma $`\log\Pi(s)\le d\log(es/d)`$ for $`s\ge d`$. The second term is at most a universal multiple of $`d\sqrt t\sum_{j\ge0}\rho^{-j}(1+j)`$. For $`\delta=\log\rho/(2\log4)>0`$, we have $`\tau\le\sqrt t\,t^{-\delta}`$. Since $`t^{-\delta}\log(et)`$ is bounded on $`[1,\infty)`$, the first two terms are $`O(\sqrt{nd})`$.

Here are details for the random term. Loss vectors have the same pairwise Hamming distances as prediction vectors. In normalized empirical Euclidean distance a set of $`p\ge2`$ vectors separated at radius $`r\le1`$ differs pairwise on more than an $`r^2`$ fraction of positions. A sample of $`k=\max(d,\lceil3\log(2p)/r^2\rceil)`$ positions with replacement distinguishes all pairs with positive probability by a union bound. Thus $`p\le(ek/d)^d`$. For $`u=\log(p)/d`$ this implies $`u\le\log(C(1+u)/r^2)`$, hence $`u\le C'\log(C'/r)`$. A maximal packing is a net. Write each centered random weight as an independent random sign times an independent amplitude at most one. Conditional on all amplitudes, any fixed sign-sum increment between vectors at distance $`r`$ has moment generating function at most $`\exp(\lambda^2nr^2/2)`$. Take nets at radii $`2^{-s}`$ with one starting vector and attach each point to a parent in the preceding net. At depth $`s`$ there are at most $`\exp(Cd(s+1))`$ increments, each of length at most $`2^{1-s}`$. The expected maximum absolute increment is therefore $`O(\sqrt{nd}\,2^{-s}\sqrt{s+1})`$. The trace set is finite, so the nets eventually contain every vector. Summing the series and the starting-vector bound $`\sqrt n`$ proves the empirical assertion.

## 2. Averaged prediction projections

Fix a block $`T`$ of $`N=n`$ examples with $`d\lt n`$, and a positive law $`q`$ on its canonical hypotheses. The same estimates apply to $`N=n+1`$. In both cases $`m_J\lt N`$ since $`m_J^2\le nd`$. Work on the finite-dimensional space of mean-zero real functions in $`L^2(q)`$. Let $`P_M`$ be orthogonal projection by conditional expectation on the predictions on $`M`$. Put $`K_m=\mathbb E_{|M|=m}P_M`$. Coupling nested uniform subsets gives $`0\le K_m\le K_{m'}\le I`$ for $`m\le m'`$. Write $`f_i(h)=h(x_i)-\mathbb E_q h(x_i)`$.

**Overlap inequality.** If $`km\le M\le N`$ for a positive integer $`k`$, then

```math
 \big\|(I-K_M)^{1/2}K_m^{1/2}\big\|\le k^{-1/2}.
```

Take $`k`$ independent uniform $`m`$-subsets $`J_s`$ and pad their union uniformly to an $`M`$-subset $`V`$. Permutation symmetry makes $`V`$ uniform. Given $`v`$ let $`y=K_m^{\dagger/2}v`$, using zero on the kernel, and $`x=K_m^{1/2}v`$. The independent vectors $`P_{J_s}y`$ have mean $`x`$ and second moment $`\langle y,K_m y\rangle\le\|v\|^2`$. Their average lies in the range of $`P_V`$ for each realization. Orthogonal projection is a best approximation, so

```math
 \langle x,(I-K_M)x\rangle
 =\mathbb E\|(I-P_V)x\|^2
 \le\mathbb E\left\|x-k^{-1}\sum_s P_{J_s}y\right\|^2
 \le\|v\|^2/k .
```

**Inverse estimate.** Define $`B_0=K_{m_0}`$, $`B_j=K_{m_j}-K_{m_{j-1}}`$ for $`1\le j\le J`$, and $`B_{J+1}=I-K_{m_J}`$. These operators are positive and sum to the identity. For $`i<j`$, apply the overlap inequality to $`B_i\le K_{m_i}`$ and $`B_j\le I-K_{m_{j-1}}`$, with $`k=4^{j-i-1}`$. This gives $`\|B_i^{1/2}B_j^{1/2}\|\le2^{-(j-i-1)}`$. The order comparison follows by sandwiching the first inequality by $`B_j^{1/2}`$, interchanging the two factors via adjoints in the norm, and sandwiching the second inequality by $`K_{m_i}^{1/2}`$.

Define $`A=\tau I+\sum_j a_jK_{m_j}=\sum_{j=0}^{J+1}b_j B_j`$ and $`C_0=\sum_{j=0}^{J+1}b_j^{-1}B_j`$. The map $`Wv=(B_j^{1/2}v)_j`$ is an isometry. Direct multiplication shows $`C_0A-I=W^* E W`$ with blocks $`E_{ij}=(b_j/b_i-1)B_i^{1/2}B_j^{1/2}`$. Indeed compressing these blocks gives $`\sum_{ij}(b_j/b_i-1)B_iB_j`$. Each row and column of block norms sums to at most

```math
 2\sum_{h\ge1}(\rho^h-1)2^{-(h-1)}
 =\frac{2(\rho-1)}{(1-1/2)(1-\rho/2)}=\frac8{19}<\frac12.
```

The scalar row/column sum inequality applied to the norms of vector components gives $`\|C_0 A-I\|\le8/19`$. In particular, applying this to $`A^{-1}x`$ and using $`C_0=W^*{\rm diag}(b_j^{-1})W`$ gives

```math
 \|A^{-1}x\|^2\le4\|C_0x\|^2
 \le4\sum_{j=0}^{J+1} b_j^{-2}\langle B_jx,x\rangle .
```

**Residual variance.** For $`1\le m<N`$,

```math
 \frac1N\sum_{i=1}^N\langle (I-K_m)f_i,f_i\rangle\le\frac{d}{m+1}.
```

Choose a uniform position $`i`$ and an independent uniform $`m`$-subset. The residual variance is zero if it contains $`i`$. Otherwise, condition on their union of size $`m+1`$, from which $`i`$ is uniformly omitted. Project $`q`$ to the prediction vectors on this union. For any omitted coordinate, each pair with identical remaining predictions contributes $`p_up_v/(p_u+p_v)`$ to the expected conditional variance, where $`p`$ is the projected law. Summing over omissions counts each edge of the unit-distance graph once. The sum of the smaller endpoint masses of all edges is at most $`d`$. Indeed any binary trace set $`V`$ of VC dimension at most $`d`$ has at most $`d|V|`$ edges. Split at the last coordinate, with projected layers $`V_0,V_1`$. Their union and intersection have dimensions at most $`d,d-1`$, respectively. Their internal edge counts together dominate those of the two layers, and there are $`|V_0\cap V_1|`$ cross-layer edges. Induction, starting with zero-dimensional or empty families, gives the bound. Apply it on each upper level set of $`p`$ and integrate over the level to get the weighted bound, since the masses sum to one. Dividing by $`m+1`$ proves the residual inequality.

Now $`N^{-1}\sum_i\langle B_0f_i,f_i\rangle\le1/4`$ by binary variance. Every later term is at most $`d/(m_{j-1}+1)\le4^{1-j}`$ after averaging, including the last band. Hence for **every** positive $`q`$ and every $`T`$,

```math
 D_T(q):=\sum_i\|A^{-1}f_i\|^2
 \le \frac{4N}{t}\left(\frac14+\sum_{j\ge1}\rho^{2j}4^{1-j}\right)
 \le C d .
```

Here $`\rho^2<4`$ and $`N\le2n`$. No commutativity of the averaged projections was used.

## 3. Removing one example

Use $`H_2^2(p,r)=\sum_h(\sqrt{p(h)}-\sqrt{r(h)})^2`$ with all laws embedded by their actual hypothesis names. On the fixed $`N`$-block let $`q`$ now denote the optimizer for its random weights. Let $`q_{-i}`$ be the actual optimizer on the block with position $`i`$ removed, using the remaining weights. We show

```math
 \mathbb E_U\sum_i H_2^2(q,q_{-i})\le Cd .
```

**Removing the loss.** Keep the full support and the full restriction scheme. Replace weight $`U_i`$ by zero to obtain $`r_i`$. Along the path where this weight equals $`w`$, write $`s=\dot q/q`$. This score has mean zero. For two tangent scores $`s,v`$ at a positive law, the Hessian of the convex negative entropy of a projection onto $`M`$, along tangent vectors $`qs,qv`$, is $`\sum_c(qs)_M(c)(qv)_M(c)/q_M(c)=\langle P_Ms,P_Mv\rangle_q`$. The full entropy gives $`\langle s,v\rangle_q`$. Differentiating the first-order condition for all tangent directions thus gives $`As=-\big(\ell_i-\mathbb E_q\ell_i\big)=\pm f_i`$, where $`\ell_i`$ is the single binary mistake. The Hessian is positive definite on the simplex tangent space, so the interior optimizer depends smoothly on $`w`$ by the implicit function theorem. It follows that $`\|\partial_w\sqrt q\|_2^2=\|A^{-1}f_i\|_q^2/4`$. Cauchy–Schwarz bounds the squared endpoint distance by $`U_i`$ times the integral of this squared speed from zero to $`U_i`$. Bound $`U_i\le2`$ and extend the integral to $`[0,2]`$. With the other weights fixed, integration over this interval is exactly twice the expectation at a fresh uniform weight. Consequently

```math
 \sum_i\mathbb E_U H_2^2(q,r_i)\le \mathbb E_U D_T(q)\le Cd .
```

**Removing the coordinate from restrictions.** On the same full support and with zero weight at $`i`$, now take all feature restrictions from the other $`N-1`$ positions. Call the new minimizer $`r'_i`$. Couple a uniform $`m`$-subset to one avoiding $`i`$ by retaining it if possible and otherwise replacing $`i`$ with a uniformly chosen outside index. The result is uniform by symmetry and the chance of a change is $`m/N`$. In a changed pair the restrictions consist of a common partition refined by one of two binary observations. Modulo constants, the gradient of negative entropy for one such refinement minus that of the common partition is the random variable $`\log p(B\mid\mathrm{cell})`$. Its squared norm has a universal bound because $`u\log^2 u+(1-u)\log^2(1-u)`$ is bounded on $`[0,1]`$, with endpoint values taken by continuity. Thus the norm of the difference of gradients, after centering, is at most a universal constant times $`m/N`$ after averaging the coupling.

Interpolate the two objectives linearly. The full-entropy coefficient stays $`\tau`$ and the restriction terms stay convex. The tangent score of the optimizer solves the same differentiated first-order equation with Hessian at least $`\tau I`$ and right side of norm at most $`C\sum_j a_jm_j/N`$. Integrating the square-root speed along the unit interval therefore gives

```math
 H_2^2(r_i,r'_i)\le C\left(\sum_j a_jm_j/(N\tau)\right)^2 .
```

The sum over positions is $`O(d)`$, since

```math
 \sum_j a_jm_j/\tau
 =(\rho-1)\sum_{j=0}^J\rho^{J-j}d4^j
 \le\frac{\rho-1}{1-\rho/4}\,m_J,\qquad m_J^2\le nd .
```

**Removing redundant representatives.** Project full traces onto the surviving coordinates. A surviving trace has one or two full-trace representatives above it. The canonical representative after deletion is one of these full representatives, because any earlier hypothesis with the same full trace would also have the same surviving trace. Under $`r'_i`$ the masses of a two-element fiber are equal. Conditional on their sum, equal splitting maximizes the full entropy, while all other terms depend only on that sum.

Let $`\mu_i`$ be the total $`r'_i`$-mass of all two-element fibers. In each pair mark the endpoint of smaller mass under the original full law $`q`$, breaking ties once, to form a set $`E_i`$. Then $`r'_i(E_i)=\mu_i/2`$ and $`\sum_iq(E_i)\le d`$ by the weighted unit-distance bound in §2. The square-root triangle bound gives $`r(E)\le2p(E)+2H_2^2(p,r)`$. Hence

```math
 \sum_i\mu_i\le4d+4\sum_i H_2^2(q,r'_i).
```

Collapse each pair onto the actual surviving representative and call the resulting law $`p_i`$. For each pair of total mass $`u`$ the squared distance introduced is $`(2-\sqrt2)u`$. Write $`F_i`$ for the true deleted objective and $`C_i`$ for the set of surviving traces with two extensions. The entropy identity for splitting a pair shows that $`p_i`$ minimizes $`F_i(p)-\tau(\log 2)p(C_i)`$. The Bregman remainder of the full negative entropy is $`\mathrm{KL}(p_i\Vert q_{-i})`$; the other convex terms have nonnegative remainders. By optimality for both objectives,

```math
 \tau\,\mathrm{KL}(p_i\Vert q_{-i})
 \le F_i(p_i)-F_i(q_{-i})
 \le\tau(\log 2)\mu_i .
```

Finally $`H_2^2(p,r)\le\mathrm{KL}(p\Vert r)`$ by $`-\log x\ge1-x`$ applied to square-root density ratios. The triangle inequality for $`H_2`$, followed by Cauchy–Schwarz along the four successive comparisons, proves the claimed deletion bound. All estimates are uniform in the labeled block. Duplicate features and contradictory labels are allowed.

## 4. Information in the returned hypothesis

Fix a supersample and write $`Y=A(\widetilde Z_S)`$. Since its fair selector bits are independent before observing $`Y`$, the entropy chain rule and conditioning reducing entropy give

```math
 I(Y;S\mid\widetilde Z)
 \le\sum_{i=1}^n I(Y;S_i\mid\widetilde Z,S_{-i}).
```

For fixed values of the pool and the other bits, a summand is the Jensen–Shannon divergence of the two possible output laws. Both samples give **the same** ordered sample after deleting position $`i`$. Use the output law on this common sample with the schedule for $`n`$. For laws $`p,r`$, writing $`v=(p+r)/2`$ and using $`\log x\le x-1`$ gives

```math
 \mathrm{JS}(p,r)\le\frac12\sum_{h:p_h+r_h>0}
              \frac{(p_h-r_h)^2}{p_h+r_h}
 \le H_2^2(p,r).
```

Write $`c_i(T)`$ for the squared Hellinger distance between the learner on $`T`$ and the learner on $`T_{-i}`$ using this common schedule, with both laws already averaged over the weights. Convexity of squared Hellinger distance bounds $`c_i(T)`$ by the expected distance in §3 under the shared weight coupling. In the common finite alphabet of actual named hypotheses, the square-root triangle inequality bounds the row's Jensen–Shannon divergence by $`2(c_i(T_0)+c_i(T_1))`$. Conditional on the other bits, the fair bit selects $`T_0`$ or $`T_1`$ equally, so this is $`4\mathbb E[c_i(\widetilde z_S)\mid S_{-i}]`$. Summing and then applying §3 on each **selected** sample gives

```math
 I(A(\widetilde z_S);S)\le 4\mathbb E_S\sum_i c_i(\widetilde z_S)
 \le 4 \cdot 4928d.
```

For $`n=d`$ the selector entropy is at most $`n\log 2`$. The estimate holds for every deterministic pairing. Integrating the measurable pool statistic gives the original iid CMI bound. The empirical and information inequalities use the same proper learner and a common absolute constant of $`19{,}712`$. [Lean proof of this transfer](../../lean/Conjectures/AgnosticVC/FixedPairing.lean)

## A measurable globally consistent ERM suffices

Assume jointly measurable evaluation and a measurable diagonal in the hypothesis space. Suppose a single deterministic empirical risk minimizer $`E`$ on finite labeled samples has the global consistency property of Definition 4.13 in the companion paper. In particular, if $`E`$ returns $`h`$ on one sample, it also returns $`h`$ on every feature tuple containing those features when that tuple is labeled by $`h`$. Assume that for every feature law and sample size, $`E`$ is measurable on the completed iid experiment with independent fair labels. Then the two Conjecture 6 rates hold with the constants above. This condition permits any globally consistent measurable minimizer. [Framework paper, Definition 4.13 and Lemmas 4.14–4.15](https://arxiv.org/pdf/2001.09122v3)

For features $`x`$ and a feasible trace $`v`$, take $`g_x(v)=E(x,v)`$. Empirical minimization ensures $`g_x(v)|_x=v`$. Delete one row of $`x`$, leaving $`x'`$, and fix a trace $`u`$ on $`x'`$. Put $`h=g_{x'}(u)`$ and $`v=h|_x`$. By global consistency, $`g_x(v)=E(x,h|_x)=h`$. Therefore the shorter representative is one of the full representatives in its deletion fiber. This is the representative property used in the collapse step of §3. The optimizer, empirical estimate, and all other deletion steps depend on the prediction traces and the numerical weights. The four comparisons in §3 and the transfer in §4 therefore give the same information bound for the actual outputs named by $`g_x`$.

Fix an iid labeled law with feature marginal $`\mu`$. For each prescribed $`v`$, the map $`x\mapsto E(x,v)`$ is measurable under the completion of $`\mu^n`$. To see this, take any measurable output event and restrict its preimage in the fair-label experiment to the fixed label vector $`v`$. The label vector has positive probability, so sections of null sets at $`v`$ are null. Joint evaluation makes the feasibility event $`E(x,v)|_x=v`$ measurable on the same completion. These maps and events remain measurable when pulled back from features to the actual labeled samples. The latter have marginal $`\mu^n`$ on the features even if labels depend on those features. On each fixed feasible trace set and fixed training label vector, the objective has a unique minimizer, continuous in the weights. Indeed any limit point of minimizers along convergent weights minimizes the limit objective by continuity and compactness, and uniqueness gives convergence. The expected output probabilities are thus measurable by integrating a finite mixture over the independent weights.

On a fixed paired pool, there are finitely many pairs of a selector and a training trace. These pairs give a finite alphabet for the output before identifying equal hypothesis names. The equality matrix among their names is measurable on the completed pool because the diagonal is measurable. The finite information expression after merging names is measurable on each of the finitely many equality patterns and bounded by §4. Its integral equals the original iid CMI of the actual output. This proves the rates for the same learner under all iid laws, with measurability for each completed experiment.

The assumption on $`E`$ is stronger than existence of an ordinary measurable ERM. For the irrational circle-orbit class, restrict to samples of a single positive example from the orbit copy of the circle. If $`x,x'`$ lie in the same coset, the classifiers returned by $`E`$ x`$ and # Steinke–Zakynthinou’s agnostic VC learning conjecture

The [manuscript](paper.pdf) gives the full argument, including the projection and deletion estimates. The [scope audit](SCOPE.md) specifies the additional hypothesis for the population theorem.

## Statement and conventions

Let $`\mathcal H\subseteq\{0,1\}^{\mathcal X}`$ have finite VC dimension $`d\ge1`$. Fix an integer $`n\ge d`$. For a labeled sample $`z`$ let $`\widehat L_z(h)`$ be its fraction of classification mistakes. The proposed learner $`A`$ returns an element of $`\mathcal H`$. Under the population measurability convention described below, one universal $`C`$ satisfies

```math
 \forall z,\quad \mathbb E_A\widehat L_z(A(z))\le
 \min_{h\in\mathcal H}\widehat L_z(h)+C\sqrt{d/n},
 \qquad I(A(\widetilde Z_S);S\mid\widetilde Z)\le Cd .
```

Here the $`2n`$ entries of the paired array $`\widetilde Z`$ are independent draws from any one distribution, and the $`n`$ independent fair bits $`S`$ choose one entry per row. The information is about the entire returned hypothesis. All logarithms are natural.

We use a single well-order of the hypothesis class for all sample sizes, as in the authors’ globally consistent learner. On any fixed pool the construction is finite, even for an arbitrary class. The information inequality holds on **each fixed paired pool**. The population conclusion follows by integrating the pointwise bound wherever the learner and information in the original problem are measurable. In particular it holds for every countable class of measurable classifiers with an enumeration, and for classes admitting measurable coherent trace representatives and measurable evaluation. The [Lean population statement](../../lean/Conjectures/AgnosticVC/Theorem.lean) makes the condition on the chosen representatives explicit. The separate [fixed-pairing theorem](../../lean/Conjectures/AgnosticVC/FixedPairing.lean) applies to arbitrary underlying sets. [Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Authors’ representative convention, Lemmas 4.15 and 4.17](https://arxiv.org/pdf/2001.09122)

## 1. The learner and its empirical error

Put $`t=n/d`$, $`\rho=21/20`$ and $`J=\lfloor\log_4\sqrt t\rfloor`$. Use

```math
 m_j=d4^j\ (0\le j\le J),\qquad
 b_j=\sqrt t\,\rho^{-j}\ (0\le j\le J+1),\qquad
 a_j=b_j-b_{j+1},\qquad \tau=b_{J+1}.
```

Given the features of the sample, take the first hypothesis for each distinct joint prediction vector. The resulting finite set is $`G_z`$. Draw independent weights $`U_i`$ uniformly on $`[0,2]`$ and write $`L_U(h)=\sum_i U_i\,1[h(x_i)\ne y_i]`$. For a probability vector $`q`$ on $`G_z`$ let $`q_M`$ be its pushforward to predictions on positions $`M`$. With $`H`$ denoting Shannon entropy, minimize

```math
 F(q)=\mathbb E_q L_U-\tau H(q)
      -\sum_{j=0}^J a_j\,\mathbb E_{|M|=m_j}H(q_M).
```

Each subset average is uniform without replacement. Return a random hypothesis with the minimizing law. Existence follows by compactness. The positive full-entropy coefficient gives strict convexity and an interior minimizer. Indeed a zero-mass hypothesis can be introduced with mass $`\epsilon`$, gaining order $`\epsilon\log(1/\epsilon)`$ in full entropy while the possible decrease of every other entropy is at most order $`\epsilon`$ by concavity. A one-element support needs no optimization. The same operation on $`N=n+1`$ examples below always uses the parameters chosen for $`n`$.

Let $`\Pi(s)`$ be the largest trace count on $`s`$ features. Comparing the objective with a point mass on an empirical minimizer bounds the excess unweighted count, conditional on the weights, by

```math
 \tau\log\Pi(n)+\sum_j a_j\log\Pi(m_j)
 +2\sup_h\left|\sum_i(U_i-1)\,1[h(x_i)\ne y_i]\right|.
```

By Sauer’s lemma $`\log\Pi(s)\le d\log(es/d)`$ for $`s\ge d`$. The second term is at most a universal multiple of $`d\sqrt t\sum_{j\ge0}\rho^{-j}(1+j)`$. For $`\delta=\log\rho/(2\log4)>0`$, we have $`\tau\le\sqrt t\,t^{-\delta}`$. Since $`t^{-\delta}\log(et)`$ is bounded on $`[1,\infty)`$, the first two terms are $`O(\sqrt{nd})`$.

Here are details for the random term. Loss vectors have the same pairwise Hamming distances as prediction vectors. In normalized empirical Euclidean distance a set of $`p\ge2`$ vectors separated at radius $`r\le1`$ differs pairwise on more than an $`r^2`$ fraction of positions. A sample of $`k=\max(d,\lceil3\log(2p)/r^2\rceil)`$ positions with replacement distinguishes all pairs with positive probability by a union bound. Thus $`p\le(ek/d)^d`$. For $`u=\log(p)/d`$ this implies $`u\le\log(C(1+u)/r^2)`$, hence $`u\le C'\log(C'/r)`$. A maximal packing is a net. Write each centered random weight as an independent random sign times an independent amplitude at most one. Conditional on all amplitudes, any fixed sign-sum increment between vectors at distance $`r`$ has moment generating function at most $`\exp(\lambda^2nr^2/2)`$. Take nets at radii $`2^{-s}`$ with one starting vector and attach each point to a parent in the preceding net. At depth $`s`$ there are at most $`\exp(Cd(s+1))`$ increments, each of length at most $`2^{1-s}`$. The expected maximum absolute increment is therefore $`O(\sqrt{nd}\,2^{-s}\sqrt{s+1})`$. The trace set is finite, so the nets eventually contain every vector. Summing the series and the starting-vector bound $`\sqrt n`$ proves the empirical assertion.

## 2. Averaged prediction projections

Fix a block $`T`$ of $`N=n`$ examples with $`d\lt n`$, and a positive law $`q`$ on its canonical hypotheses. The same estimates apply to $`N=n+1`$. In both cases $`m_J\lt N`$ since $`m_J^2\le nd`$. Work on the finite-dimensional space of mean-zero real functions in $`L^2(q)`$. Let $`P_M`$ be orthogonal projection by conditional expectation on the predictions on $`M`$. Put $`K_m=\mathbb E_{|M|=m}P_M`$. Coupling nested uniform subsets gives $`0\le K_m\le K_{m'}\le I`$ for $`m\le m'`$. Write $`f_i(h)=h(x_i)-\mathbb E_q h(x_i)`$.

**Overlap inequality.** If $`km\le M\le N`$ for a positive integer $`k`$, then

```math
 \big\|(I-K_M)^{1/2}K_m^{1/2}\big\|\le k^{-1/2}.
```

Take $`k`$ independent uniform $`m`$-subsets $`J_s`$ and pad their union uniformly to an $`M`$-subset $`V`$. Permutation symmetry makes $`V`$ uniform. Given $`v`$ let $`y=K_m^{\dagger/2}v`$, using zero on the kernel, and $`x=K_m^{1/2}v`$. The independent vectors $`P_{J_s}y`$ have mean $`x`$ and second moment $`\langle y,K_m y\rangle\le\|v\|^2`$. Their average lies in the range of $`P_V`$ for each realization. Orthogonal projection is a best approximation, so

```math
 \langle x,(I-K_M)x\rangle
 =\mathbb E\|(I-P_V)x\|^2
 \le\mathbb E\left\|x-k^{-1}\sum_s P_{J_s}y\right\|^2
 \le\|v\|^2/k .
```

**Inverse estimate.** Define $`B_0=K_{m_0}`$, $`B_j=K_{m_j}-K_{m_{j-1}}`$ for $`1\le j\le J`$, and $`B_{J+1}=I-K_{m_J}`$. These operators are positive and sum to the identity. For $`i<j`$, apply the overlap inequality to $`B_i\le K_{m_i}`$ and $`B_j\le I-K_{m_{j-1}}`$, with $`k=4^{j-i-1}`$. This gives $`\|B_i^{1/2}B_j^{1/2}\|\le2^{-(j-i-1)}`$. The order comparison follows by sandwiching the first inequality by $`B_j^{1/2}`$, interchanging the two factors via adjoints in the norm, and sandwiching the second inequality by $`K_{m_i}^{1/2}`$.

Define $`A=\tau I+\sum_j a_jK_{m_j}=\sum_{j=0}^{J+1}b_j B_j`$ and $`C_0=\sum_{j=0}^{J+1}b_j^{-1}B_j`$. The map $`Wv=(B_j^{1/2}v)_j`$ is an isometry. Direct multiplication shows $`C_0A-I=W^* E W`$ with blocks $`E_{ij}=(b_j/b_i-1)B_i^{1/2}B_j^{1/2}`$. Indeed compressing these blocks gives $`\sum_{ij}(b_j/b_i-1)B_iB_j`$. Each row and column of block norms sums to at most

```math
 2\sum_{h\ge1}(\rho^h-1)2^{-(h-1)}
 =\frac{2(\rho-1)}{(1-1/2)(1-\rho/2)}=\frac8{19}<\frac12.
```

The scalar row/column sum inequality applied to the norms of vector components gives $`\|C_0 A-I\|\le8/19`$. In particular, applying this to $`A^{-1}x`$ and using $`C_0=W^*{\rm diag}(b_j^{-1})W`$ gives

```math
 \|A^{-1}x\|^2\le4\|C_0x\|^2
 \le4\sum_{j=0}^{J+1} b_j^{-2}\langle B_jx,x\rangle .
```

**Residual variance.** For $`1\le m<N`$,

```math
 \frac1N\sum_{i=1}^N\langle (I-K_m)f_i,f_i\rangle\le\frac{d}{m+1}.
```

Choose a uniform position $`i`$ and an independent uniform $`m`$-subset. The residual variance is zero if it contains $`i`$. Otherwise, condition on their union of size $`m+1`$, from which $`i`$ is uniformly omitted. Project $`q`$ to the prediction vectors on this union. For any omitted coordinate, each pair with identical remaining predictions contributes $`p_up_v/(p_u+p_v)`$ to the expected conditional variance, where $`p`$ is the projected law. Summing over omissions counts each edge of the unit-distance graph once. The sum of the smaller endpoint masses of all edges is at most $`d`$. Indeed any binary trace set $`V`$ of VC dimension at most $`d`$ has at most $`d|V|`$ edges. Split at the last coordinate, with projected layers $`V_0,V_1`$. Their union and intersection have dimensions at most $`d,d-1`$, respectively. Their internal edge counts together dominate those of the two layers, and there are $`|V_0\cap V_1|`$ cross-layer edges. Induction, starting with zero-dimensional or empty families, gives the bound. Apply it on each upper level set of $`p`$ and integrate over the level to get the weighted bound, since the masses sum to one. Dividing by $`m+1`$ proves the residual inequality.

Now $`N^{-1}\sum_i\langle B_0f_i,f_i\rangle\le1/4`$ by binary variance. Every later term is at most $`d/(m_{j-1}+1)\le4^{1-j}`$ after averaging, including the last band. Hence for **every** positive $`q`$ and every $`T`$,

```math
 D_T(q):=\sum_i\|A^{-1}f_i\|^2
 \le \frac{4N}{t}\left(\frac14+\sum_{j\ge1}\rho^{2j}4^{1-j}\right)
 \le C d .
```

Here $`\rho^2<4`$ and $`N\le2n`$. No commutativity of the averaged projections was used.

## 3. Removing one example

Use $`H_2^2(p,r)=\sum_h(\sqrt{p(h)}-\sqrt{r(h)})^2`$ with all laws embedded by their actual hypothesis names. On the fixed $`N`$-block let $`q`$ now denote the optimizer for its random weights. Let $`q_{-i}`$ be the actual optimizer on the block with position $`i`$ removed, using the remaining weights. We show

```math
 \mathbb E_U\sum_i H_2^2(q,q_{-i})\le Cd .
```

**Removing the loss.** Keep the full support and the full restriction scheme. Replace weight $`U_i`$ by zero to obtain $`r_i`$. Along the path where this weight equals $`w`$, write $`s=\dot q/q`$. This score has mean zero. For two tangent scores $`s,v`$ at a positive law, the Hessian of the convex negative entropy of a projection onto $`M`$, along tangent vectors $`qs,qv`$, is $`\sum_c(qs)_M(c)(qv)_M(c)/q_M(c)=\langle P_Ms,P_Mv\rangle_q`$. The full entropy gives $`\langle s,v\rangle_q`$. Differentiating the first-order condition for all tangent directions thus gives $`As=-\big(\ell_i-\mathbb E_q\ell_i\big)=\pm f_i`$, where $`\ell_i`$ is the single binary mistake. The Hessian is positive definite on the simplex tangent space, so the interior optimizer depends smoothly on $`w`$ by the implicit function theorem. It follows that $`\|\partial_w\sqrt q\|_2^2=\|A^{-1}f_i\|_q^2/4`$. Cauchy–Schwarz bounds the squared endpoint distance by $`U_i`$ times the integral of this squared speed from zero to $`U_i`$. Bound $`U_i\le2`$ and extend the integral to $`[0,2]`$. With the other weights fixed, integration over this interval is exactly twice the expectation at a fresh uniform weight. Consequently

```math
 \sum_i\mathbb E_U H_2^2(q,r_i)\le \mathbb E_U D_T(q)\le Cd .
```

**Removing the coordinate from restrictions.** On the same full support and with zero weight at $`i`$, now take all feature restrictions from the other $`N-1`$ positions. Call the new minimizer $`r'_i`$. Couple a uniform $`m`$-subset to one avoiding $`i`$ by retaining it if possible and otherwise replacing $`i`$ with a uniformly chosen outside index. The result is uniform by symmetry and the chance of a change is $`m/N`$. In a changed pair the restrictions consist of a common partition refined by one of two binary observations. Modulo constants, the gradient of negative entropy for one such refinement minus that of the common partition is the random variable $`\log p(B\mid\mathrm{cell})`$. Its squared norm has a universal bound because $`u\log^2 u+(1-u)\log^2(1-u)`$ is bounded on $`[0,1]`$, with endpoint values taken by continuity. Thus the norm of the difference of gradients, after centering, is at most a universal constant times $`m/N`$ after averaging the coupling.

Interpolate the two objectives linearly. The full-entropy coefficient stays $`\tau`$ and the restriction terms stay convex. The tangent score of the optimizer solves the same differentiated first-order equation with Hessian at least $`\tau I`$ and right side of norm at most $`C\sum_j a_jm_j/N`$. Integrating the square-root speed along the unit interval therefore gives

```math
 H_2^2(r_i,r'_i)\le C\left(\sum_j a_jm_j/(N\tau)\right)^2 .
```

The sum over positions is $`O(d)`$, since

```math
 \sum_j a_jm_j/\tau
 =(\rho-1)\sum_{j=0}^J\rho^{J-j}d4^j
 \le\frac{\rho-1}{1-\rho/4}\,m_J,\qquad m_J^2\le nd .
```

**Removing redundant representatives.** Project full traces onto the surviving coordinates. A surviving trace has one or two full-trace representatives above it. The canonical representative after deletion is one of these full representatives, because any earlier hypothesis with the same full trace would also have the same surviving trace. Under $`r'_i`$ the masses of a two-element fiber are equal. Conditional on their sum, equal splitting maximizes the full entropy, while all other terms depend only on that sum.

Let $`\mu_i`$ be the total $`r'_i`$-mass of all two-element fibers. In each pair mark the endpoint of smaller mass under the original full law $`q`$, breaking ties once, to form a set $`E_i`$. Then $`r'_i(E_i)=\mu_i/2`$ and $`\sum_iq(E_i)\le d`$ by the weighted unit-distance bound in §2. The square-root triangle bound gives $`r(E)\le2p(E)+2H_2^2(p,r)`$. Hence

```math
 \sum_i\mu_i\le4d+4\sum_i H_2^2(q,r'_i).
```

Collapse each pair onto the actual surviving representative and call the resulting law $`p_i`$. For each pair of total mass $`u`$ the squared distance introduced is $`(2-\sqrt2)u`$. Write $`F_i`$ for the true deleted objective and $`C_i`$ for the set of surviving traces with two extensions. The entropy identity for splitting a pair shows that $`p_i`$ minimizes $`F_i(p)-\tau(\log 2)p(C_i)`$. The Bregman remainder of the full negative entropy is $`\mathrm{KL}(p_i\Vert q_{-i})`$; the other convex terms have nonnegative remainders. By optimality for both objectives,

```math
 \tau\,\mathrm{KL}(p_i\Vert q_{-i})
 \le F_i(p_i)-F_i(q_{-i})
 \le\tau(\log 2)\mu_i .
```

Finally $`H_2^2(p,r)\le\mathrm{KL}(p\Vert r)`$ by $`-\log x\ge1-x`$ applied to square-root density ratios. The triangle inequality for $`H_2`$, followed by Cauchy–Schwarz along the four successive comparisons, proves the claimed deletion bound. All estimates are uniform in the labeled block. Duplicate features and contradictory labels are allowed.

## 4. Information in the returned hypothesis

Fix a supersample and write $`Y=A(\widetilde Z_S)`$. Since its fair selector bits are independent before observing $`Y`$, the entropy chain rule and conditioning reducing entropy give

```math
 I(Y;S\mid\widetilde Z)
 \le\sum_{i=1}^n I(Y;S_i\mid\widetilde Z,S_{-i}).
```

For fixed values of the pool and the other bits, a summand is the Jensen–Shannon divergence of the two possible output laws. Both samples give **the same** ordered sample after deleting position $`i`$. Use the output law on this common sample with the schedule for $`n`$. For laws $`p,r`$, writing $`v=(p+r)/2`$ and using $`\log x\le x-1`$ gives

```math
 \mathrm{JS}(p,r)\le\frac12\sum_{h:p_h+r_h>0}
              \frac{(p_h-r_h)^2}{p_h+r_h}
 \le H_2^2(p,r).
```

Write $`c_i(T)`$ for the squared Hellinger distance between the learner on $`T`$ and the learner on $`T_{-i}`$ using this common schedule, with both laws already averaged over the weights. Convexity of squared Hellinger distance bounds $`c_i(T)`$ by the expected distance in §3 under the shared weight coupling. In the common finite alphabet of actual named hypotheses, the square-root triangle inequality bounds the row's Jensen–Shannon divergence by $`2(c_i(T_0)+c_i(T_1))`$. Conditional on the other bits, the fair bit selects $`T_0`$ or $`T_1`$ equally, so this is $`4\mathbb E[c_i(\widetilde z_S)\mid S_{-i}]`$. Summing and then applying §3 on each **selected** sample gives

```math
 I(A(\widetilde z_S);S)\le 4\mathbb E_S\sum_i c_i(\widetilde z_S)
 \le 4 \cdot 4928d.
```

For $`n=d`$ the selector entropy is at most $`n\log 2`$. The estimate holds for every deterministic pairing. Integrating the measurable pool statistic gives the original iid CMI bound. The empirical and information inequalities use the same proper learner and a common absolute constant of $`19{,}712`$. [Lean proof of this transfer](../../lean/Conjectures/AgnosticVC/FixedPairing.lean)

## A measurable globally consistent ERM suffices

Assume jointly measurable evaluation and a measurable diagonal in the hypothesis space. Suppose a single deterministic empirical risk minimizer $`E`$ on finite labeled samples has the global consistency property of Definition 4.13 in the companion paper. In particular, if $`E`$ returns $`h`$ on one sample, it also returns $`h`$ on every feature tuple containing those features when that tuple is labeled by $`h`$. Assume that for every feature law and sample size, $`E`$ is measurable on the completed iid experiment with independent fair labels. Then the two Conjecture 6 rates hold with the constants above. This condition permits any globally consistent measurable minimizer. [Framework paper, Definition 4.13 and Lemmas 4.14–4.15](https://arxiv.org/pdf/2001.09122v3)

For features $`x`$ and a feasible trace $`v`$, take $`g_x(v)=E(x,v)`$. Empirical minimization ensures $`g_x(v)|_x=v`$. Delete one row of $`x`$, leaving $`x'`$, and fix a trace $`u`$ on $`x'`$. Put $`h=g_{x'}(u)`$ and $`v=h|_x`$. By global consistency, $`g_x(v)=E(x,h|_x)=h`$. Therefore the shorter representative is one of the full representatives in its deletion fiber. This is the representative property used in the collapse step of §3. The optimizer, empirical estimate, and all other deletion steps depend on the prediction traces and the numerical weights. The four comparisons in §3 and the transfer in §4 therefore give the same information bound for the actual outputs named by $`g_x`$.

Fix an iid labeled law with feature marginal $`\mu`$. For each prescribed $`v`$, the map $`x\mapsto E(x,v)`$ is measurable under the completion of $`\mu^n`$. To see this, take any measurable output event and restrict its preimage in the fair-label experiment to the fixed label vector $`v`$. The label vector has positive probability, so sections of null sets at $`v`$ are null. Joint evaluation makes the feasibility event $`E(x,v)|_x=v`$ measurable on the same completion. These maps and events remain measurable when pulled back from features to the actual labeled samples. The latter have marginal $`\mu^n`$ on the features even if labels depend on those features. On each fixed feasible trace set and fixed training label vector, the objective has a unique minimizer, continuous in the weights. Indeed any limit point of minimizers along convergent weights minimizes the limit objective by continuity and compactness, and uniqueness gives convergence. The expected output probabilities are thus measurable by integrating a finite mixture over the independent weights.

On a fixed paired pool, there are finitely many pairs of a selector and a training trace. These pairs give a finite alphabet for the output before identifying equal hypothesis names. The equality matrix among their names is measurable on the completed pool because the diagonal is measurable. The finite information expression after merging names is measurable on each of the finitely many equality patterns and bounded by §4. Its integral equals the original iid CMI of the actual output. This proves the rates for the same learner under all iid laws, with measurability for each completed experiment.

The assumption on $`E`$ is stronger than existence of an ordinary measurable ERM. For the irrational circle-orbit class, restrict to samples of a single positive example from the orbit copy of the circle. If $`x,x'`$ lie in the same coset, the classifiers returned by $`E`$ x'`$ both fit the positive pair $`(x,x')`$. Global consistency forces both outputs to equal $`E`$ on that pair. Thus the parameter chosen by $`E`$ is in the input coset and constant on each coset. If it were measurable in the completion of Haar measure, the event that the returned parameter equals the input would be a measurable transversal. Its countably many translates under the irrational rotation are disjoint, equiprobable, and cover the circle. This contradicts countable additivity. Hence even allowing any globally consistent ERM still leaves classes whose iid rates require a different construction. [Circle class and ordinary Borel ERM](SCOPE.md#a-standard-borel-class-where-the-constructed-learner-fails)
