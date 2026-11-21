# A cross-validation certificate from the observed modal model frequency

21 November 2026. This extends the separately documented weighted-unanimity argument. Its mathematical proof and independent review are retained as research. The [prior-coverage correction](prior-coverage-correction.md) shows that existing work already supplies the zero-error improvement used to connect this investigation to the historical cash offer. No separate still-open paid criterion for this modal extension has been established. This file adds no completed bounty and reports no award or payment.

## 1. Protocol and statement

Use $`K\ge1`$ consecutive iid blocks, each containing $`n\ge1`$ labeled examples. Train the same learner on all but each block, preserving the order of the remaining inputs. Independent fitting seeds are allowed. Every fit returns a finite description of a measurable binary classifier, and equal descriptions mean the same classifier.

Choose the most frequent stored description among the $`K`$ fitted models, breaking ties by a fixed order on descriptions. Let $`h_{\mathrm{mode}}`$ denote this classifier, $`c\ge1`$ its multiplicity, and

```math
 t=K-c
```

the observed number of dissenting models. Let $`r`$ be the total number of errors made by $`h_{\mathrm{mode}}`$ on all $`Kn`$ observed examples. Both quantities are computable from the supplied models and sample. When some models dissent, $`r`$ need not equal the cross-validation error count.

Write $`R(h)`$ for population classification risk and define

```math
 F_{n,r}(p)=\sum_{x=1}^n\frac{x}{r+x}\binom nx p^x(1-p)^{n-x}.
```

Then, with no event or stability assumption,

```math
 \boxed{
 \mathbb E\left[
 \frac{F_{n,r}(R(h_{\mathrm{mode}}))}{(t+1)(t+2)}
 \right]\le\frac1{K+1}.
 }                                                   \tag{1}
```

The expectation includes the sample and fitting randomness. In particular, it permits the observed dissent count to vary with the data.

## 2. Shared fits and description groups

Add an independent $`(K+1)`$-st block. For each unordered pair $`\{i,j\}`$, fit $`h_{ij}=h_{ji}`$ on all blocks except those two, retaining their order. Give each unordered pair its own independent seed. For a fixed deleted block $`j`$, the $`K`$ fits $`h_{ij}`$, $`i\ne j`$, have exactly the marginal law of the actual $`K`$-fold experiment.

Let $`a_j`$ be that deletion view's modal description, $`t_j`$ its number of dissenting fits, $`r_j`$ its modal classifier's errors on retained blocks, and $`X_j`$ its errors on the omitted block. Partition the $`K+1`$ views into groups according to their selected descriptions. Each group has a single classifier. If $`q`$ is that classifier's total number of errors on all augmented blocks, then

```math
 r_j+X_j=q
```

for every view in the group. With $`0/0=0`$, the disjoint omitted blocks give

```math
 \sum_{j\text{ in one group}}\frac{X_j}{r_j+X_j}\le1.  \tag{2}
```

There may be several description groups. Their number and dissent scores cannot vary arbitrarily, because two views share a pair-deletion fit.

## 3. The tournament inequality

From each distinct-description group choose one representative with the smallest dissent count in that group. Write these minimum counts as $`s_1,\ldots,s_g`$, where $`g`$ is the number of groups.

Between two representatives, the shared pair fit cannot equal both selected descriptions. At least one of the representatives therefore regards that edge as dissenting. Orient the edge outward from one such dissenting endpoint, choosing either if both dissent. This creates a tournament on the representatives. If $`d_i`$ is its outdegree, then

```math
 d_i\le s_i.                                         \tag{3}
```

For any nonnegative decreasing convex function $`w`$ on $`[0,\infty)`$, the tournament degree sequence satisfies

```math
 \sum_{i=1}^g w(s_i)
 \le \sum_{i=1}^g w(d_i)
 \le \sum_{d=0}^{g-1} w(d).                           \tag{4}
```

Here is the degree comparison. The sum of all outdegrees is $`g(g-1)/2`$. For any $`\ell`$ vertices, their total outdegree is at most their $`\ell(\ell-1)/2`$ internal edges plus the $`\ell(g-\ell)`$ edges to the rest. Thus the sum of the largest $`\ell`$ degrees is at most the sum of the largest $`\ell`$ numbers in $`0,1,\ldots,g-1`$. The transitive tournament sequence therefore majorizes the actual degree sequence. The finite convex-sum inequality gives the second inequality in (4); monotonicity and (3) give the first.

Use the particular decreasing convex weight

```math
 w(x)=\frac1{(x+1)(x+2)}
     =\frac1{x+1}-\frac1{x+2}.
```

Its first derivative is negative and its second derivative is positive on $`[0,\infty)`$. Its finite sum telescopes:

```math
 \sum_{d=0}^{g-1}w(d)=1-\frac1{g+1}\le1.              \tag{5}
```

Inside a description group, $`w(t_j)\le w(s_i)`$. Multiply (2) by that maximum group weight, then sum over groups and use (4)–(5). This proves the deterministic inequality

```math
 \sum_{j=1}^{K+1}
 \frac{1}{(t_j+1)(t_j+2)}
 \frac{X_j}{r_j+X_j}\le1.                            \tag{6}
```

## 4. Taking expectations and inverting

For each fixed $`j`$, its modal model, dissent count, and retained error count depend only on the other blocks and the fitting seeds used in that view. The omitted block is independent. Its error count is conditionally $`\mathop{\mathrm{Bin}}(n,R(h_{{\mathrm{mode}},j}))`$. Integrating it in (6) produces $`F_{n,r_j}`$.

Every deletion view has the original ordered iid marginal law. The $`K`$ pair seeds in a fixed view are independent, as required by the protocol. Averaging and summing (6) proves (1). Joint permutation invariance of the learner or the collection of selected descriptions is not required.

For a prescribed $`\gamma\in(0,1)`$, set

```math
 z=\frac{(t+1)(t+2)}{(K+1)\gamma}.
```

The function $`F_{n,r}`$ is continuous and strictly increasing on $`[0,1]`$, with $`F_{n,r}(0)=0`$ and $`F_{n,r}(1)=n/(r+n)`$. Define the reported modal-risk bound by

```math
 B_{\mathrm{mode}}=
 \begin{cases}
 1,&z\ge n/(r+n),\\
 F_{n,r}^{-1}(z),&z\lt n/(r+n).
 \end{cases}
```

Markov's inequality applied directly to (1) gives

```math
 \Pr\{R(h_{\mathrm{mode}})>B_{\mathrm{mode}}\}\le\gamma.         \tag{7}
```

There is no union bound over the random $`t`$ or $`r`$. Both were already inside the same random variable in (1). Certified bisection gives a computable upper approximation to the inverse for rational confidence inputs.

For zero observed modal-model errors and small $`z`$, the endpoint is

```math
 1-(1-z)^{1/n}\sim
 \frac{(t+1)(t+2)}{(K+1)n\gamma}.
```

Thus a bounded observed number of dissenting models permits the scale of the whole sample. The separate exact-unanimity proof has a better constant at $`t=0`$; this extension supplies one certificate defined on every sample.

## 5. Choosing between two derived classifiers

The standard CV certificate applies to the Gibbs classifier $`h_{\mathrm{Gibbs}}`$, which chooses a fold model uniformly at prediction time. Give that certificate failure budget $`\delta-\gamma`$ and give (7) budget $`\gamma`$, with $`0<\gamma<\delta`$ fixed before observing data. Evaluate both certificates and output whichever of $`h_{\mathrm{mode}}`$ and $`h_{\mathrm{Gibbs}}`$ has the smaller reported upper bound. On the intersection of their two coverage events, either choice is covered. Hence the selected classifier and bound satisfy the required unconditional probability at least $`1-\delta`$.

The procedure uses the existing fitted models and their predictions. The proof's extra fits are not executed. Spending confidence on both certificates is explicit; this does not assert pointwise domination of a baseline that uses the entire budget $`\delta`$ alone.

## 6. A general weight form and scope

The same proof works for any fixed nonnegative decreasing convex weight with finite sum $`W=\sum_{d\ge0}w(d)`$:

```math
 \mathbb E\bigl[w(t)F_{n,r}(R(h_{\mathrm{mode}}))\bigr]
 \le\frac{W}{K+1}.
```

The telescoping rational weight was chosen to make the proof and inversion concrete. It is not an assertion that this weight is optimal.

The theorem concerns exact agreement of finite stored model descriptions, coherent block deletion, and iid examples. It does not identify functions from finitely many matching predictions, assume unknown algorithmic stability, or claim conditional coverage after selecting an agreement event. Existing conformal, jackknife, model-selection, and stability work must still be compared before the result is presented as a new paid resolution.
