# Steinke–Zakynthinou Conjecture 6: exact target and first construction test

Date checked: 21 November 2026. Research reservation: [issue 223, comment 7068455935](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068455935).

Status: the exact target remains unresolved in the sources checked. No completed bounty, submission, sponsor reconfirmation, or payment is claimed. The calculations below test a proposed construction; they do not resolve the conjecture. No novelty claim is made for the elementary information lemma.

## 1. Full target and payment scope

The primary source is Steinke and Zakynthinou, [*Open Problem: Information Complexity of VC Learning*, COLT 2020](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf), Conjecture 6 and Section 3.

For a binary hypothesis class $`\mathcal W\subseteq\{0,1\}^{\mathcal X}`$ of VC dimension $`d\ge1`$ and $`n\ge d`$, the conjecture asks for one proper randomized learner $`A:(\mathcal X\times\{0,1\})^n\to\mathcal W`$ satisfying, for an absolute constant $`c`$,

```math
\mathop{\mathrm{CMI}}_D(A)\le cd\quad\text{for every distribution }D,
```

and, for every individual dataset $`z`$,

```math
\mathbb E_A\widehat L_z(A(z))
\le \inf_{w\in\mathcal W}\widehat L_z(w)+c\sqrt{d/n}.
```

Here $`\widehat L_z`$ is average binary classification error. For an iid supersample $`\widetilde Z\sim D^{n\times2}`$ and independent uniform selection bits $`S\in\{0,1\}^n`$,

```math
\mathop{\mathrm{CMI}}_D(A)
=I(A(\widetilde Z_S);S\mid\widetilde Z).
```

The learner cannot depend on $`D`$. The information bound averages over the supersample; the empirical-error requirement is pointwise in the input dataset. The output in the information expression is the entire hypothesis.

The authors offer US$500 for a proof and US$300 for a negative resolution. An improper-only proof earns half the proof prize; an accompanying impossibility theorem for proper learners earns the full amount. The paper gives no expiry. No new sponsor confirmation or secured-funds evidence was found.

## 2. Exact prior-resolution checks

1. Haghifam, Dziugaite, Moran and Roy, [*On the Information Complexity of Proper Learners for VC Classes in the Realizable Case*](https://arxiv.org/abs/2011.02970), November 2020, refute the stronger proper realizable Conjectures 7 and 8. Their samplewise training-error requirement is of order $`d/n`$, whereas Conjecture 6 allows order $`\sqrt{d/n}`$. Their proper-PAC lower-bound contradiction does not establish a negative resolution of Conjecture 6.

2. Hanneke and Wang, [*The optimal information complexity of VC learning*](https://arxiv.org/abs/2610.10600), version 3 dated 8 November 2026, prove an order-$`d`$ bound for **evaluated** CMI in the **realizable** setting. The [full manuscript](https://arxiv.org/html/2610.10600v3#S1.SSx3), introduction, page 4, explicitly leaves optimal original CMI open. Its improper majority learner and its loss-vector information bound cannot be substituted for the proper agnostic statement above. This manuscript was read beyond its title and abstract.

3. Grünwald, Steinke and Zakynthinou, [*PAC-Bayes, MAC-Bayes and Conditional Mutual Information: Fast rate bounds that handle general VC classes*](https://proceedings.mlr.press/v134/grunwald21a/grunwald21a.pdf), COLT 2021, develops conditional-prior generalization bounds. Its VC application retains a logarithmic information-complexity term. It does not supply the learner demanded here.

4. Hafez-Kolahi, Golgooni, Kasaei and Soleymani Baghshah (NeurIPS 2020) derive VC generalization rates by chaining information estimates for approximations to a hypothesis. The rate in their Theorems 6–7 concerns generalization error. Conjecture 6 bounds the selector information of the entire returned hypothesis. [Primary paper](https://proceedings.neurips.cc/paper/2020/file/befe5b0172188ad14d48c3ebe9cf76bf-Paper.pdf)

Searches also used the exact conjecture number, authors, agnostic/proper qualifiers, and original-versus-evaluated CMI. Repository issue searches for “Steinke” and “information complexity” and matching local-note searches found no earlier reservation. This is a bounded documented prior-art check, not a proof that no unnoticed resolution exists.

The significance is the quantifier-preserving bridge between the optimal distribution-free VC error rate and information in a learner's complete output. Obtaining a logarithmic bound, an evaluated-information bound, a realizable theorem, or a theorem for one selected VC class would not complete this full target.

## 3. A low-information reference sampler

For this auxiliary information lemma, work with a finite or countable class of measurable hypotheses and a fixed enumeration. The first representative of each trace is then a measurable selection, so the information quantities below are defined. The same combinatorial argument applies to larger classes if a measurable coherent canonical-selection rule is separately supplied; no such general measurable-selection theorem is being asserted here. This restriction belongs to the auxiliary lemma, not to the full conjecture in Section 1.

Given the input features $`x=(x_1,\ldots,x_n)`$, let $`V(x)`$ be the finite set of distinct binary prediction traces of the class. Sample a trace uniformly and output the first hypothesis realizing it. Ignore the labels. Call this learner $`A_0`$.

For any fixed pooled feature sample $`\widetilde x`$, every hypothesis that can be output from one of its subsamples is the least representative of its **full-pool** trace too: a smaller hypothesis with that full trace would also share the selected trace. Thus all such outputs lie in one pool-dependent canonical set.

Use the uniform distribution on this canonical full-pool set as a conditional reference law. For each selector $`S`$, the conditional output law is uniform on $`|V(\widetilde x_S)|`$ distinct members. Its relative entropy to that reference is exactly

```math
\log |V(\widetilde x)|-\log |V(\widetilde x_S)|.
```

The variational identity for conditional mutual information therefore gives

```math
\mathop{\mathrm{CMI}}_D(A_0)
\le \mathbb E\log|V(X_1,\ldots,X_{2n})|
   -\mathbb E\log|V(X_1,\ldots,X_n)|.
```

All logarithms in this section are natural. The labels in the supersample do not affect these laws; conditioning on them does not change the calculation because the selector is independent of the full labeled pool.

### Trace-count doubling bound

For any finite binary trace family $`F\subseteq\{0,1\}^m`$ of VC dimension at most $`d`$, let $`M=|F|`$. Its unit-distance graph has at most $`dM`$ edges. For completeness, split the final coordinate and write its two projections as $`F_0,F_1`$. With $`U=F_0\cup F_1`$ and $`J=F_0\cap F_1`$,

```math
e(F_0)+e(F_1)\le e(U)+e(J),\qquad
e(F)=e(F_0)+e(F_1)+|J|.
```

The VC dimensions of $`U`$ and $`J`$ are at most $`d`$ and $`d-1`$, respectively. Induction gives $`e(F)\le d(|U|+|J|)=dM`$.

Let $`e_i`$ count edges in coordinate $`i`$. Deleting that coordinate leaves exactly $`M-e_i`$ traces, with $`0\le e_i\le M/2`$. Since $`-\log(1-t)\le2t`$ for $`0\le t\le1/2`$,

```math
\frac1m\sum_{i=1}^m
\log\frac{M}{M-e_i}
\le \frac{2}{mM}\sum_i e_i\le\frac{2d}{m}.
```

Apply exchangeability to iid feature samples, then telescope from $`n+1`$ to $`2n`$:

```math
\mathbb E\log|V(X_1,\ldots,X_{2n})|
-\mathbb E\log|V(X_1,\ldots,X_n)|
\le2d\sum_{m=n+1}^{2n}\frac1m
\le2d\log2.
```

Consequently $`\mathop{\mathrm{CMI}}_D(A_0)\le2d\log2`$ for every distribution. The sampler is proper and has the desired information scale, but it has no useful general empirical-error guarantee. This elementary observation supplies a reference law, not a solution.

## 4. Fixed-temperature trace Gibbs sampling fails the accuracy requirement

A proposed modification assigns a prediction trace weight

```math
\exp\bigl(-\eta\,n\widehat L_z(w)\bigr),
```

then chooses its least representative. The natural information-oriented scale $`\eta=\lambda/\sqrt n`$, for a fixed positive $`\lambda`$, does not yield the conjectured empirical accuracy. The following is an exact infinite family on one fixed VC-dimension-one class.

Take $`\mathcal X=\mathbb N`$ and

```math
\mathcal W=\{0\}\cup\{1_{\{j\}}:j\in\mathbb N\}.
```

For an integer $`m\ge1`$, set

```math
M=\lceil e^{\lambda m}\rceil,\qquad
r=Mm^2,\qquad n=Mr=M^2m^2.
```

The dataset consists of $`r`$ copies of each of $`M`$ distinct features, all with label zero. There are exactly $`M+1`$ distinct traces: the zero trace and $`M`$ one-point traces, each with precisely $`r`$ errors. The least representative of the zero trace also has zero training error, whether or not it is the globally zero function.

At the stated temperature, $`\eta r=\lambda m`$. Hence the Gibbs learner's expected empirical excess is exactly

```math
\frac1M\cdot
\frac{M e^{-\lambda m}}{1+M e^{-\lambda m}}
\ge\frac1{2M}
=\frac{m}{2\sqrt n}.
```

The factor $`m`$ is unbounded. Therefore no constant in an order-$`1/\sqrt n`$ empirical-error guarantee works for this fixed-temperature trace Gibbs construction. The data are legitimate individual datasets under the conjecture's samplewise requirement. No probabilistic typicality assumption is needed.

This does **not** refute Conjecture 6: a different learner can simply choose the zero hypothesis on these inputs. The subsequent [trace-Gibbs information lemma](trace-gibbs-cmi-lemma.md) proves a constant-in-$`n`$ CMI bound at this temperature, in its stated finite/countable measurable setting. The empirical-error obligation is nevertheless false. The information lemma has passed independent review by the parent and by the conjectures research agent.

## 5. Remaining mathematical obligation

The low-information reference sampler must be converted to an accurate learner without paying a logarithmic trace-cardinality penalty. The fixed-temperature Gibbs proposal does not do so. A separate perturbation proposal, independently flipping labels before well-ordered ERM, needs a bound on the information in the output hypothesis; label noise alone does not hide which feature values entered the sample. Neither proposal is a completed proof or counterexample.

The full-target investigation remains open. No formal-verification investment or bounty submission has been made for an unproved claim.

## 6. Sponsor-defined threshold target

The same primary offer also separately rewards a proof of Conjecture 6 for all real-line threshold functions: US$20 for a proper learner and US$15 for an improper learner, with stated efficiency and determinism bonuses. This is a separately stated whole-class target. Its exact status checks and current construction attempt are recorded in [the threshold continuation](agnostic-threshold-cmi-route.md). No completion or current sponsor reconfirmation is claimed for that offer either.
