# Independent mathematical review of the weighted cross-validation certificate

21 November 2026. Reviewed sources:

- `agents/demath_zzz/langford-cross-validation/weighted-unanimity-certificate.md`, SHA-256 `56c16f3c7fe961818a48fc199e42bb099e29934242e23dbcaeafccc4a33b4208`.
- `agents/demath_zzz/langford-cross-validation/agreement-is-not-a-binomial-test.md`, SHA-256 `4f6a7194c1d435116e9b09ee0dc42cf7657e42fe363b0aff2ababb9fe1f515be`.

An intermediate version of the weighted source, SHA-256 `4aebff1d1a7dd41a5df986aed97ef2d67708e4c3000f7cc98b5a214de433a44d`, differed from the initially reviewed source only in three `\mathrm{CV}` rendering macros. The counterexample changed only two `\mathrm{bin}` macros. Reversing those substitutions recovered the exact original hashes. The final weighted source additionally updates the prior-coverage status; its complete text was read again and its mathematical proof is unchanged.

The mathematical statements pass this review under the specified ordered-block protocol. Prior-art and the sponsor's improvement criterion require separate checks. This file does not add a completed bounty or report an award decision.

## 1. The probability argument

The shared unordered-pair fit is the decisive consistency property. On an augmented sample of $`K+1`$ blocks, any two unanimous deletion views contain the same fit with those two blocks removed. Their common classifier descriptions must therefore agree. Consequently all unanimous views have one common classifier, including views whose omitted block has no error. This is a statement about each fixed augmented dataset and collection of seeds; it requires no probabilistic stability assumption.

For that common classifier let $`q`$ be the total errors over all augmented blocks, $`X_j`$ the omitted block's errors, and $`r_j`$ the retained blocks' errors. On every unanimous view, $`r_j+X_j=q`$. The held-out blocks are disjoint, so

```math
 \sum_j 1_{E_j}\frac{X_j}{r_j+X_j}\le1,
 \qquad 0/0=0.
```

For a fixed deleted block, its data are independent of every fit used in that view. Conditional on the retained data and its fitting seeds, its error count is binomial with parameters $`n,R(h^{(j)})`$. Deleting any block leaves the same ordered iid marginal law. Thus equal expectations of the summands give the exact-count moment in the source. The proof does not require the joint score vector to be invariant under permutations.

For a randomized learner, one seed per unordered pair correctly couples the proof. Within each fixed deletion view those seeds are distinct and independent, matching the independent calls made in the actual protocol. Sharing a seed between the two occurrences of a pair fit changes no single-view marginal law. Empty pair-training inputs at $`K=1`$ cause no exception.

Replacing block error counts by indicators that a block has any error gives the second moment bound. The source does not assume the two resulting certificates have a pointwise ordering.

## 2. Confidence, computation, and the baseline

The binomial polynomial $`F_{n,r}`$ is strictly increasing, continuous, and has endpoints $`0`$ and $`n/(r+n)`$. Its proof separates $`r=0`$, for which $`F_{n,0}(p)=1-(1-p)^n`$, from $`r>0`$, for which a shared-uniform coupling proves strict monotonicity. Inverting it at the fixed Markov threshold is valid for the random observed count $`r`$: the probability statement bounds the same random variable before inversion. No additional union bound over $`r`$ is needed.

When the threshold is at least $`F_{n,r}(1)`$, the bound must be one. The source handles this case explicitly. Rational coefficients and monotonicity permit a certified upper approximation to the root; using an upper approximation only weakens the bound.

The equality event is computable when it compares finite stored descriptions. Equal descriptions are only a sufficient test for the same function; equivalent programs need not be recognized. The theorem does not infer semantic equality from finitely many equal predictions. The coherent order of the retained blocks is part of the algorithm's protocol and is not silently supplied for arbitrary adaptive partitions.

The Gibbs classifier's risk is the average risk of the fold classifiers, both on and off unanimity. Each held-out block is independent of its own fit. The usual conditional exponential-moment bound and Jensen's inequality therefore prove the stated CV baseline even when the fitted models across folds are dependent. The union bound combining this baseline with the unanimity certificate uses failure budgets $`\delta-\gamma`$ and $`\gamma`$. The source correctly disclaims samplewise domination of the ordinary baseline at the full budget $`\delta`$.

The guarantee is unconditional over the training sample and fitting randomness. It can return a smaller upper bound after an observed event, but does not assert conditional coverage given that event. The event need not be likely for every learner; the certificate remains defined and valid everywhere.

## 3. The finite selection counterexample

The first-consistent-coordinate learner is fully specified, with constant-one fallback and all labels zero. For $`K\ge2`$, one coordinate is eligible for a fold precisely when all its observed ones lie in that fold. Two such eligibility events overlap only when the coordinate is all zero. This gives the union probability

```math
 u=K(1-p)^{m-n}-(K-1)(1-p)^m.
```

Unanimity with zero CV error occurs exactly when the first coordinate eligible anywhere is globally zero. An earlier locally eligible coordinate would make at least one fold choose a different index. The constant-one fallback cannot have zero error. Independence across feature columns yields the source's finite geometric-series formula with no omitted fallback mass.

Every selected coordinate has population risk $`p`$, despite its data-dependent selection. In the leave-one-out regime $`p=c_0/K`$, the event probability tends to $`[1-(1-u_\infty)^d]/(1+c_0)`$, where $`u_\infty=(1+c_0)e^{-c_0}>0`$. The interval

```math
 \log(1/\delta)\lt c_0<1/\delta-1
```

is nonempty for each $`0<\delta<1`$. A fixed finite feature dimension can therefore make the limiting event probability greater than $`\delta`$, while the actual risk exceeds the full-sample zero-error binomial endpoint. This invalidates that proposed inference from realized agreement alone. It does not refute a theorem with a stronger, uniform assumption.

The same construction checks the scale of the positive result. Taking sufficiently large finite $`d`$ and then $`K\to\infty`$ makes $`K\mathbb E[1_{E_0}R(h)]`$ arbitrarily close to $`c_0/(1+c_0)`$. Taking $`c_0`$ large makes this approach one. Thus the leading constant of the zero-error moment cannot be uniformly reduced below one. At fixed $`\delta`$, a universal unanimity/zero-error endpoint of the form $`a(\delta)/K+o(1/K)`$ must have $`a(\delta)\ge1/\delta-1`$. These are scope and optimality observations within the same investigation.

## 4. Status

The proof and the counterexample are sound under their explicit interfaces. This is a written proof review, not a Lean formalization. Subsequent prior-source checking found that CV-CRC already supplies the zero-error unanimity improvement, and a common random-key reduction removes the apparent order-sensitivity distinction. The weighted and modal extensions remain research theorems; this review does not justify counting the historical improvement bounty as newly resolved.
