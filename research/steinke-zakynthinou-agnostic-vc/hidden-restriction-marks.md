# Linear information for approximate local hypothesis catalogues

[Deterministic score deletion and accuracy calibration](calibrated-catalogue-votes.md) allow a different dimension in the catalogue and in the empirical error target. They also give a measurable voting learner with sample-size-independent whole-output CMI.

Let $`H`$ be a binary class of VC dimension $`d\ge1`$, on standard Borel instance and hypothesis spaces with jointly Borel evaluation. Let $`G(T)`$ be a catalogue obtained by applying countably many universally measurable proper reconstruction maps to the feature subtuples of $`T`$ of length at most $`k`$. Include one fixed candidate. For every $`n\ge d`$, there is a universally measurable proper learner supported on $`G(T)`$ with

```math
\mathbb E[\widehat L_T(A(T))]
\le \min_{h\in G(T)}\widehat L_T(h)+C\sqrt{d/n}
```

on every sample and whole-output selector information at most $`C(d+k)`$ on every fixed paired pool, hence the same bound on actual iid CMI. Here $`C`$ is universal. In particular, an $`O(d)`$-read catalogue with empirical approximation error $`O(\sqrt{d/n})`$ gives the conjectured two rates. This improves the [earlier catalogue learner](approximate-catalogues.md), which had an iterated logarithm in the information bound. The proof uses a nested entropy objective. The deletion comparison averages the deleted row's random restriction mark before measuring Hellinger distance.

## A likelihood moment for nested pruning

Use the [nested entropy optimization and notation](approximate-catalogues.md#pruning-a-nested-entropy-objective), with nonincreasing split temperatures and minimum split temperature $`\tau>0`$. For a vertex $`v`$ let $`P_v`$ be the original conditional law on its leaves and $`P'_v`$ the law conditional on entering $`v`$ in the pruned problem. As before put $`r_v=\exp(-(F'_v-F_v)/\beta_v)`$. The subprobability $`U_v=r_v P'_v`$ is zero on wholly pruned subtrees. At a leaf the corresponding $`r_v`$ is one or zero according to survival.

Fix a subtree whose root temperature is $`b`$. For $`0<\alpha\le\tau/(2b)`$, put $`\eta_v=1+\alpha-\alpha\beta_v/\tau`$ at each internal vertex of the subtree. Then

```math
\mathbb E_{P_v}\left[\left(\frac{dU_v}{dP_v}\right)^{1+\alpha}\right]
\le r_v^{\eta_v}.
```

For an internal child $`w`$ write $`c_w=\beta_w/\beta_v`$. The original and pruned child-weight ratio from the nested recursion implies that within this child the density of $`U_v`$ relative to $`P_v`$ is $`r_w^{c_w-1}dU_w/dP_w`$. For a nonempty pruned child, multiplying its moment bound by $`r_w^{(c_w-1)(1+\alpha)}`$ yields $`(r_w^{c_w})^{\eta_v}`$ because $`(c_w-1)(1+\alpha)+\eta_w=c_w\eta_v`$. A completely removed child contributes zero. A leaf child contributes its survival indicator, which also equals its term in the recursion for $`r_v`$ raised to $`\eta_v`$. Averaging over children and using concavity of $`x^{\eta_v}`$, with $`1/2\le\eta_v\le1`$, proves the bound by induction.

## Mixing over one coordinate's mark

Consider a fixed leaf set and fixed costs. Let $`P`$ be the optimizer with a coordinate $`i`$ omitted from all nonterminal restrictions, and let $`Q`$ be the optimizer when $`i`$ is first revealed at a level with split temperature $`b`$. In the latter hierarchy, within that level put the reveal of $`i`$ immediately after all the other tests, still at temperature $`b`$. Let $`C`$ range over the prefix cells just before that reveal. Write $`r_0,r_1`$ for the factors from pruning the $`P`$ subtree inside $`C`$ to $`i=0,1`$ respectively, using an initial trivial split at temperature $`b`$. Put $`R_C=r_0+r_1`$. The pruning inequality gives $`1\le R_C\le2`$. The conditional law $`Q(\cdot\mid C)`$ is the sum of the two subprobabilities $`U_0,U_1`$ divided by $`R_C`$, and the value of $`C`$ decreases by $`b\log R_C`$.

Along a prefix path, let $`\delta_v`$ denote the value change at a node when passing from $`P`$ to $`Q`$. Every $`\delta_v`$ lies in $`[-b\log2,0]`$, by monotonicity and translation invariance of the value recursion. Multiplying the conditional probability ratios gives the terminal factor $`\exp(-\delta_C/\beta_{\mathrm{parent}(C)})`$ times the root factor $`\exp(\delta_{\rm root}/\beta_{\rm root})`$ and the nonroot internal factors $`\exp(\delta_v(1/\beta_v-1/\beta_{\mathrm{parent}(v)}))`$. The latter factors are at most one, and their exponents together with the root exponent sum to at least $`-b\log2/\beta_{\mathrm{parent}(C)}`$. Since all prefix temperatures are at least $`b`$, it follows that

```math
\tfrac12 P(C)\le Q(C)\le R_C P(C).
```

For a trivial prefix these inequalities follow from $`P(C)=Q(C)=1`$. Consequently $`dQ/dP\le dU_j/dP(\cdot\mid C)`$ on slice $`i=j`$ of $`C`$.

Set $`\alpha=\tau/(2b)`$ and $`\gamma=\alpha(b/\tau-1)`$, so $`0\le\gamma\le1/2`$. The pruning domination gives $`dU_j/dP(\cdot\mid C)\ge1`$ on its slice. Using $`(x-1)^{1+\alpha}\le x^{1+\alpha}-1`$ for $`x\ge1`$, the likelihood moment above therefore gives

```math
\mathbb E_{P(\cdot\mid C)}\left[\left(\frac{dQ}{dP}-1\right)_+^{1+\alpha}\right]
\le r_0^{1-\gamma}+r_1^{1-\gamma}-1
\le \min(r_0,r_1)^{1-\gamma}.
```

The majority term in the middle expression is at most one. Also $`\min(r_0,r_1)\le2m_C`$ for $`m_C=\min(Q(i=0\mid C),Q(i=1\mid C))`$, since the slice weights are $`r_j/R_C`$. On the negative side, with $`x=dQ/dP-1`$, we have $`x_-^2\le x_-`$ and $`\mathbb E_P x_-=\operatorname{TV}(P,Q)\le 2\sum_C Q(C)m_C`$ by the [bit omission comparison](approximate-catalogues.md#removing-a-bit-from-the-restrictions). For $`0\le s\le1`$, the squared square-root change $`(\sqrt{1+s x}-1)^2`$ is at most $`s^2 x_-^2`$ if $`x\le0`$, and at most $`\min((sx)^2,sx)\le (sx)^{1+\alpha}`$ if $`x\ge0`$. Combining the two sides and $`P(C)\le2Q(C)`$ gives

```math
H_2^2((1-s)P+sQ,P)
\le 6s^{1+\alpha}\sum_C Q(C)m_C^{1-\gamma}.
\tag{1}
```

## Schedule and weighted-loss stability

Fix the target sample size $`n`$ and set $`t=n/d`$, $`L=1+\log t`$, and $`b_0=\sqrt t`$. For $`L\ge100`$, take the scales $`u_0=1`$, $`u_1=2^{128}`$, and $`u_{j+1}=\exp(u_j^{1/8})`$ for $`j\ge1`$. Take the largest $`J`$ with $`u_J\le \exp(\sqrt L)`$. Independently for each row draw a uniform mark on $`[0,1]`$ and a loss weight uniform on $`[0,2]`$. Use restriction $`M_j`$ containing the rows whose marks are at most $`d u_j/n`$. The split temperatures through these levels are $`b_0`$ at level zero and $`b_j=b_0 u_{j-1}^{-1/4}`$ for $`1\le j\le J`$. The terminal split into full traces has temperature $`\tau=b_0/L`$. They are nonincreasing, because for $`j\ge2`$ we have $`u_{j-1}^{1/4}=(\log u_j)^2\le L`$. Use the same thresholds and temperatures on the full $`n`$-row training samples and on their $`(n-1)`$-row deletions. For $`L\lt100`$, use no restriction marks and only the terminal temperature $`\tau=b_0`$.

On the traces of $`G(T)`$, minimize the weighted mistake count minus the nested entropy bonus. Return the first-witness proper name of a random trace drawn from the optimizer, using the [same witness order as before](measurable-local-reconstruction.md#learner). No marks or loss weights are returned. The expected bonus through the nonterminal levels is $`O(d b_0)`$ by the [same Sauer estimate as before](approximate-catalogues.md#schedule-and-empirical-error). In detail, the first two levels cost an absolute multiple of $`d b_0`$, and the other bounds are $`O(d b_0 u_{j-1}^{-1/8})`$ since $`\log u_j=u_{j-1}^{1/8}`$. The terminal bonus is at most $`\tau d(1+\log t)=d b_0`$ for $`L\ge100`$, and at most $`100d b_0`$ otherwise. Comparing to a point mass on a catalogue minimizer and applying the [weighted VC chaining bound](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#1-the-learner-and-its-empirical-error) proves the empirical claim.

On an $`n`$-row block let $`q`$ be the full optimizer, $`r_i`$ the optimizer on the same traces and restrictions with the $`i`$th loss weight zeroed, and $`s_i`$ the optimizer with that weight zeroed and $`i`$ omitted from all nonterminal restrictions. The terminal partition is still into full traces. The [loss-weight comparison](approximate-catalogues.md#removing-a-loss-weight) applies with these temperatures. With $`L\ge100`$, the squared-deletion sum for the first stage and all other nonterminal stages is bounded by

```math
C\left(n/b_0^2+\sum_{j=1}^J n b_j^{-2}\frac{1+\log u_{j-1}}{u_{j-1}}\right)=O(d).
```

The terminal contribution is $`O(d L^2(1+\log u_J)/u_J)`$. If $`J\ge1`$, maximality of $`J`$ gives $`u_J^{1/8}>\sqrt L`$, hence $`u_J>L^4`$, while $`1+\log u_J\le1+\sqrt L`$. If $`J=0`$, then $`L\lt(\log u_1)^2`$ is bounded by an absolute constant. For $`L\lt100`$ the sum is $`O(n/b_0^2)`$ directly. In all cases

```math
\sum_i\mathbb E H_2^2(q,r_i)=O(d).
\tag{2}
```

## Summing the hidden-mark comparisons

For each $`i`$, condition on the other marks and all the loss weights. Use a bar to average over the mark of $`i`$. Thus $`\bar q_i`$ and $`\bar r_i`$ are the full and zero-weight mixtures and $`s_i`$ already omits $`i`$. The probability that $`i`$ first appears at level $`\ell`$ is $`p_\ell=d(u_\ell-u_{\ell-1})/n`$ with $`u_{-1}=0`$. On this event $`r_i=Q_\ell`$, the optimizer given that level of first appearance. If $`i`$ never appears, $`r_i=s_i`$.

For $`L\ge100`$ set $`\theta_\ell=2^{-\ell-1}`$. Since $`2^\ell\le u_\ell\le\exp(\sqrt L)`$ and $`d/n=1/t`$, we have $`p_\ell/\theta_\ell\le 2\exp(2\sqrt L+1-L)\le\exp(-L/2)`$. Write $`\bar r_i`$ as the mixture with weights $`\theta_\ell`$ of

```math
(1-p_\ell/\theta_\ell)s_i+(p_\ell/\theta_\ell)Q_\ell
```

and put the remaining weight on $`s_i`$. Joint convexity of squared Hellinger distance and (1) bound $`H_2^2(\bar r_i,s_i)`$ by the sum over $`\ell`$ of

```math
6p_\ell(p_\ell/\theta_\ell)^{\alpha_\ell}
 \sum_C Q_\ell(C)m_C^{1-\gamma_\ell},
\qquad
\alpha_\ell=\frac{\tau}{2b_\ell},\quad
\gamma_\ell=\alpha_\ell(b_\ell/\tau-1).
\tag{3}
```

To sum this bound over coordinates, first use the smaller endpoint of each binary fiber under the true full law $`q`$ projected onto $`M_\ell`$. For a fixed realization of all marks and weights, summing these smaller endpoint masses over all $`i`$ first appearing at level $`\ell`$ gives at most $`d`$ by the [weighted unit-distance graph bound](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#2-averaged-prediction-projections). The total smaller mass under $`r_i`$ is at most its mass of the chosen $`q`$ endpoints. For any event $`B`$, $`r_i(B)\le2q(B)+2H_2^2(q,r_i)`$, by the square-root triangle inequality on $`B`$. It follows from (2) that

```math
\sum_i p_\ell\mathbb E\sum_C Q_\ell(C)m_C\le C_2 d .
```

Indeed $`p_\ell Q_\ell`$ describes the conditional contribution from the event that $`i`$ first appears at level $`\ell`$, and all the $`q`$ endpoint bounds apply at the common full realization. Jensen's inequality, with total averaging mass $`n p_\ell\le d u_\ell`$, yields

```math
\sum_i p_\ell\mathbb E\sum_C Q_\ell(C)m_C^{1-\gamma_\ell}
\le (n p_\ell)^{\gamma_\ell}(C_2 d)^{1-\gamma_\ell}
\le C_3 d\,u_\ell^{1/2}.
```

Now $`(p_\ell/\theta_\ell)^{\alpha_\ell}\le\exp(-b_0/(4b_\ell))`$. For $`\ell\ge2`$ the resulting factor $`u_\ell^{1/2}\exp(-b_0/(4b_\ell))`$ equals $`\exp(u_{\ell-1}^{1/8}/2-u_{\ell-1}^{1/4}/4)`$, whose sum over levels is bounded by a universal constant. Levels zero and one also cost an absolute constant, since $`u_0,u_1`$ are fixed. Summing (3) shows $`\sum_i\mathbb E H_2^2(\bar r_i,s_i)=O(d)`$. This sum vanishes for the schedule with no nonterminal restrictions. Combining with joint convexity for (2) and the squared triangle bound gives

```math
\sum_i\mathbb E H_2^2(\bar q_i,s_i)=O(d).
\tag{4}
```

## Removing the row, unavailable traces and names

Project $`s_i`$ to the short traces and call its projection $`a_i`$. Write $`D_i`$ for the set of full traces in two-element projection fibers, and $`\mu_i=s_i(D_i)`$. The law $`s_i`$ splits those fibers equally because every term except the terminal entropy depends only on the short trace.

The sum of $`\mathbb E\mu_i`$ is $`O(d)`$. To see this, use the event that $`i`$ never appears in the nonterminal restrictions, of probability at least $`1/2`$. The probability is one for the schedule with no marks, and otherwise it is $`1-du_J/n\ge1-\exp(\sqrt L+1-L)`$. On this event $`r_i=s_i`$. Let $`B_i(q)`$ choose the smaller endpoint at $`q`$ in every double fiber. On the event, $`r_i(B_i(q))=\mu_i/2`$ by the equal splitting, and the event is independent of $`s_i`$. Thus

```math
\frac14\sum_i\mathbb E\mu_i
\le\sum_i\mathbb E\!\left[1_{\{i\text{ never appears}\}}r_i(B_i(q))\right]
\le2d+2\sum_i\mathbb E H_2^2(q,r_i).
```

For the last inequality use the smaller-endpoint graph bound on the common full trace set. This calculation permits the smaller endpoint to depend on the mark of $`i`$ in $`q`$.

The projected law $`a_i`$ minimizes the short nested objective on the projected full catalogue with an extra linear bonus $`\tau\log 2`$ on double fibers, by the entropy chain rule. Remove this bonus to get $`t_i`$. Optimality of $`a_i`$ in its bonus objective gives an objective gap of at most $`\tau(\log 2)\mu_i`$ in the objective minimized by $`t_i`$. Its full-entropy Bregman remainder then gives $`H_2^2(a_i,t_i)\le(\log 2)\mu_i`$.

Let $`E_i`$ be the set of full traces whose first witness uses row $`i`$. Pointwise $`\sum_i q(E_i)\le k`$ because a witness reads at most $`k`$ rows. These sets depend only on the features. Equation (4) and $`s_i(E_i)\le2\bar q_i(E_i)+2H_2^2(\bar q_i,s_i)`$ give $`\sum_i\mathbb E s_i(E_i)=O(d+k)`$. Every trace unavailable in the short catalogue had all its full extensions in $`E_i`$, since an extension with a surviving witness would furnish the short trace. Consequently the unavailable mass under $`a_i`$ is at most $`s_i(E_i)`$. At $`t_i`$ the unavailable mass is at most twice that plus $`2H_2^2(a_i,t_i)`$. Restricting $`t_i`$ to the short catalogue and reoptimizing the nested objective therefore costs $`O(d+k)`$ summed squared Hellinger distance in expectation by [nested pruning](approximate-catalogues.md#pruning-a-nested-entropy-objective).

For the named-output comparison, lift full traces by their full first witnesses. Lift short traces that occur in the actual short catalogue by their short first witnesses, and the others by any full representatives of their extensions. Outside $`E_i\cup D_i`$, the full name and the projected short name coincide. The full witness survives, and any competing short witness for that trace extends to the same unique full trace and is already eligible in the full order. The two lifts of $`s_i`$, through the full names or through projection and short names, therefore have squared Hellinger distance at most $`2(s_i(E_i)+\mu_i)`$. Use the same short lift for $`a_i,t_i`$ and the final restricted optimizer, so these comparisons do not grow under lifting. The Hellinger triangle inequality, (4), and the mass bounds give an expected sum of named deletion costs $`O(d+k)`$. Finally average the remaining marks and weights by joint convexity. This compares the full $`n`$-row marginal output law to the $`(n-1)`$-row auxiliary law. Two possible training samples that differ in one selector bit share the same auxiliary law after deleting that row, so the [selector transfer](../../results/steinke-zakynthinou-agnostic-vc/PROOF.md#4-information-in-the-returned-hypothesis) gives the fixed-pool information bound.

Catalogue feasibility and first-witness selection use countable tests of universally measurable evaluations. Conditional on a trace set and on restriction marks the finite optimizer depends continuously on the loss weights. The learner thus has a completed joint output law for every iid distribution, and the fixed-pool bound integrates to actual iid CMI. If the catalogue approximation holds almost surely for each iid law, the [exact-ERM fallback](approximate-catalogues.md#deletion-lost-support-and-names) supplies the samplewise empirical assertion without changing the iid channels almost everywhere. Constructing a general $`O(d)`$-read catalogue accurate at the required rate remains a separate problem.
