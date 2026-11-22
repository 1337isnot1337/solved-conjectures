# The proper agnostic threshold theorem

The formal theorem establishes the proper randomized threshold case of Conjecture 6. For every integer $`n\ge 1`$, the same Borel learner satisfies, on every labeled sample $`z`$,

```math
 \mathbb E\,\widehat L_z(A(z)) \le
 \inf_{t\in\mathbb R\cup\{\infty\}}\widehat L_z(h_t) + \frac{512}{\sqrt n}.
```

For every probability law on labeled real observations, its original conditional mutual information is at most **300 nats**. The quantifier over laws includes atoms, and a single constant of 1024 works even when information is expressed in bits. [Source problem, Definition 3, Conjecture 6 and §3](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Framework, §4.4](https://arxiv.org/pdf/2001.09122v3) · [Combined Lean theorem](../../lean/Conjectures/SteinkeZakynthinou.lean)

## The class and its measurable structure

The source class contains $`h_t(x)=\mathbf 1_{\{x\ge t\}}`$ for real $`t`$, together with $`h_\infty=0`$. The algorithm always returns a finite real cutoff. On a nonempty finite sample, any cutoff greater than its largest feature gives exactly the predictions of $`h_\infty`$. The range of empirical losses over all source comparators therefore equals the range over finite cutoffs, even with repeated features and conflicting labels. The formalization proves equality of these ranges and their infima. [Source-class lemmas](../../lean/Conjectures/SteinkeZakynthinou/SourceClass.lean)

Knowing a finite cutoff determines the whole classifier. Conversely its predictions at rational points recover the cutoff, since $`t=\inf\{q\in\mathbb Q:h_t(q)=1\}`$. Lean proves that the map to rational evaluations is a measurable embedding and has a measurable inverse on its image. Thus the real parameter carries exactly the information in the returned classifier under the evaluation sigma-algebra. [Measurable recovery](../../lean/Conjectures/SteinkeZakynthinou/SourceClass.lean)

## The learning experiment

For each $`n`$, the learner has a finite set of internal outcomes. Both the weight and returned cutoff of each outcome are Borel functions of the training sample. Summing the weights of all outcomes with cutoff in a Borel set gives a Borel Markov kernel on the real line. Lean identifies integration of empirical error against this kernel with the original weighted sum. [Output kernel and expected loss](../../lean/Conjectures/SteinkeZakynthinou/OutputKernel.lean)

Let $`T`$ be the paired iid pool, $`S`$ the independent vector of fair bits, and $`Y`$ the output. Conditional on the pool, the joint law $`J_T`$ of $`(S,Y)`$ has rectangle probabilities

```math
 J_T(\{s\}\times B) = 2^{-n} A(T_s)(B).
```

The formalization constructs this conditional kernel and the corresponding joint distribution and proves that the pool and selector have their specified product marginal. The KL divergence of the conditional joint law from the product of its conditional marginals is finite and equals the proof's finite likelihood formula, with all internal outcomes returning the same real cutoff grouped together. Integrating that KL over $`T`$ yields the 300-nat bound. The learner sees only the selected training sample. [Joint experiment](../../lean/Conjectures/SteinkeZakynthinou/ConditionalKernel.lean) · [KL identity](../../lean/Conjectures/SteinkeZakynthinou/JointKL.lean)

The learner orders equal feature values by label (positive first) and then by training-row index. The endpoint rounding rule returns a closed threshold at the anchor, the least greater observed feature, or a finite cutoff above the maximum. Its rowwise comparison permits conflicting labels at a single feature. The stability proof uses positions in the paired pool to compare neighboring samples and proves that these positions preserve the training-row order used by the actual learner. It sums the individual row contributions before integrating over the iid pool. [Rounding](../../lean/Conjectures/SteinkeZakynthinou/Rounding.lean) · [Adjacent samples](../../lean/Conjectures/SteinkeZakynthinou/Adjacency.lean) · [Averaging](../../lean/Conjectures/SteinkeZakynthinou/Averaging.lean)

## Verification and separate results

| Statement | Evidence |
| --- | --- |
| Proper randomized learner, 300 nats and empirical excess at most `512 / √n` | Lean theorem `properThresholdTheorem_source`. Its fixed learner works for every iid law and every sample. The [dedicated workflow](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/lean-steinke-zakynthinou.yml) strictly elaborates, audits and kernel-replays the import closure. |
| Private-tag construction, less than 21 nats and excess at most `2056 / √n` | The [written proof](PROOF.md) analyzes a different learner. The 300-nat Lean theorem uses the rational branch rule and label-first rounding. |
| Polynomial-time finite-coin algorithm, less than 23 nats | [Written proof and exact computation model](EFFICIENCY.md), with an implementation on rational inputs and a finite diagnostic. |
| Deterministic polynomial-time algorithm, less than 7,000 nats | [Written proof](DETERMINISTIC.md) and [priority estimate](PRIORITY.md), with an implementation on rational inputs and a finite diagnostic. |

The sharper information constant and the two computational guarantees do not yet have corresponding Lean endpoints in this package. The separate threshold offer is US$20 for the proper case. An award requires the sponsors' decision. [Source offer, §3](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)
