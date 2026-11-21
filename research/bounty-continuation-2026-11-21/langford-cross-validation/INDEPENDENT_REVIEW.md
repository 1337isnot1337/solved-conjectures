# Independent audit: weighted unanimity block-CV identity

Status: the finite-sample probability identity below is correct. This review does not establish novelty, prize eligibility, or resolution of the sponsor's full problem. It is independent of any claim that agreement is likely for the learner.

## Precise scope

Let $`K,n\geq1`$. The observations are iid labeled examples, divided into $`K`$ consecutive blocks of size $`n`$. On each leave-one-block-out training sequence, run the same measurable learner $`A`$, preserving the order of the retained observations. The calls may use independent random seeds. Each output is a measurable binary classifier with a program description on which exact equality is measurable.

Let $`E`$ be the event that all $`K`$ output descriptions agree. On $`E`$, denote the common classifier by $`h`$, let $`R(h)`$ be its population error probability, and let $`b`$ be the number of the $`K`$ observed blocks on which $`h`$ makes at least one error. Then

```math
\mathbb E\!\left[
 \mathbf1_E\,
 \frac{1-(1-R(h))^n}{b+1}
\right]\leq\frac1{K+1}.
```

Define the integrand to be zero off $`E`$; no arbitrary off-event classifier affects the assertion.

## Independent proof check

Add a $`(K+1)`$-st iid block. For each unordered pair $`\{i,j\}`$ of distinct block indices, train one model $`h_{ij}=h_{ji}`$ on all blocks except $`i,j`$, in their retained original order, using an independent pair seed. For each $`j`$, the $`K`$ models $`h_{ij}`$, $`i\neq j`$, form the ordinary $`K`$-fold ensemble on the sample with block $`j`$ removed.

Write $`E_j`$ for their unanimity event. On $`E_j`$, write $`h_j`$ for their common output and $`b_j`$ for its number of erroneous retained blocks. Define $`I_j`$ to indicate both $`E_j`$ and an error by $`h_j`$ on block $`j`$.

All pair models used for a fixed $`j`$, their unanimity event, their common classifier, and $`b_j`$ are independent of block $`j`$. Consequently,

```math
\mathbb E\!\left[\frac{I_j}{b_j+1}\right]
=\mathbb E\!\left[
 \mathbf1_{E_j}\,
 \frac{1-(1-R(h_j))^n}{b_j+1}
\right].
```

Here and below each quotient is zero when the relevant unanimity event fails. Pair seeds outside the $`j`$-ensemble need not be conditioned on. Independence of the seeds within that ensemble gives exactly the prescribed marginal law of independently randomized learner calls.

Fix all augmented data and seeds, and let $`J=\{j:I_j=1\}`$. If $`j,\ell\in J`$, the shared model $`h_{j\ell}`$ equals both $`h_j`$ and $`h_\ell`$. Thus every nonempty $`J`$ has one common classifier $`h_*`$. If $`q`$ augmented blocks contain an error of $`h_*`$, then $`J`$ is contained in those $`q`$ blocks and $`b_j=q-1`$ for every $`j\in J`$. Therefore, pointwise,

```math
\sum_{j=1}^{K+1}\frac{I_j}{b_j+1}
=\frac{|J|}{q}\leq1
```

when $`J\neq\varnothing`$, and the sum is zero otherwise.

Deleting any block leaves an ordered iid sequence of $`Kn`$ observations. Its $`K`$ distinct unordered-pair seeds are independent and have the original seed law. Each expectation above therefore has the same original-sample marginal, even if $`A`$ is order-sensitive. Taking expectations and summing proves the identity.

## Confidence inversion and boundary cases

For $`0<\delta<1`$, Markov's inequality yields a distribution-free, unconditional confidence guarantee: except on an event of probability at most $`\delta`$, on $`E`$,

```math
R(h)\leq
1-\left(1-\min\left\{1,\frac{b+1}{(K+1)\delta}\right\}\right)^{1/n}.
```

Off $`E`$, report the vacuous bound $`1`$. This is not a confidence statement conditional on observing $`E`$; no division by $`\Pr(E)`$ is justified.

If the displayed ratio is at least one, the bound is vacuous but valid. The proof handles $`b=0`$, $`K=1`$, randomized learners, and empty pair-training samples when $`K=1`$. It requires $`n\geq1`$. Equality of predictions could replace program equality if that equality event were measurable and the same global classifier were thereby identified; program equality is a sufficient, directly specified interface.

## Remaining scope check

The probability argument contains no defect found in this audit. It remains necessary to compare the exact interface, output, and rate with prior jackknife/min-max/conformal results and with the sponsor's stated acceptance conditions. This note supplies no novelty, complete-solution, or payout claim.

## Addendum: root's exact-count extension

The following strengthening, proposed by the parent researcher, also passes an independent audit. Keep the same augmented pair-model coupling. For a unanimous deleted-block view $`j`$, let $`X_j`$ be the number of errors on its omitted block and let $`r_j`$ be the total number of errors on its remaining $`K`$ blocks.

All unanimous views, even those with $`X_j=0`$, share one classifier: two such views contain their common pair model. If there is only one unanimous view, use its classifier. Let $`q`$ be this classifier's total number of errors on all $`K+1`$ augmented blocks. Then $`r_j+X_j=q`$ on every unanimous view, and therefore

```math
\sum_{j=1}^{K+1}
 \mathbf1_{E_j}\frac{X_j}{r_j+X_j}
\leq1,
\qquad 0/0:=0.
```

For $`q>0`$, the numerator sum counts a subset of its $`q`$ errors; for $`q=0`$, every summand is zero.

Conditional on the retained blocks and the pair seeds in the $`j`$-ensemble, $`X_j`$ is binomial with parameters $`n,R(h_j)`$, whereas $`r_j`$ is fixed. Thus, for the original $`K`$-block experiment, if $`r`$ is the total observed error count on unanimity,

```math
\mathbb E[\mathbf1_E F_{n,r}(R(h))]\leq\frac1{K+1},
\qquad
F_{n,r}(p):=
\mathbb E_{X\sim\mathop{\mathrm{Bin}}(n,p)}
\frac{X}{r+X}.
```

For every integer $`r\geq0`$, $`F_{n,r}`$ is continuous and strictly increasing on $`[0,1]`$, with $`F_{n,r}(0)=0`$ and $`F_{n,r}(1)=n/(r+n)`$. For $`r>0`$, this follows by coupling Bernoulli trials with uniform random variables: $`x/(r+x)`$ is strictly increasing, and any strict increase in $`p`$ gives positive probability of a strict increase in $`X`$. For $`r=0`$, $`F_{n,0}(p)=1-(1-p)^n`$.

Set $`c=1/((K+1)\delta)`$. On unanimity, report the unique root $`F_{n,r}^{-1}(c)`$ when $`c\lt F_{n,r}(1)`$, and otherwise report $`1`$. Report $`1`$ off unanimity. Markov's inequality yields unconditional coverage at least $`1-\delta`$. The random, observed $`r`$ causes no difficulty: the pointwise inversion of the same random variable $`\mathbf1_E F_{n,r}(R(h))`$ is valid.

This version retains the exact error count, rather than only the number of erroneous blocks. It requires the same coherent ordered block-deletion interface. Arbitrary sample-dependent repartitioning and independently chosen training-order conventions are outside this proof. No novelty or prize conclusion is added.
