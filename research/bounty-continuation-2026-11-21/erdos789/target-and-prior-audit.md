# Erdős 789: exact paid target and prior audit

Status checked on 21 November 2026. This is an unresolved research attempt. No proof of the square-root lower bound, refutation, Lean submission, award acceptance, or payment is claimed.

## Exact target

For a finite set of integers $`A`$, call $`B\subseteq A`$ admissible when equal sums of two nonempty subsets of $`B`$ have equal cardinalities. Subsets have no repeated elements. Define

```math
h(n)=\min_{|A|=n}\max\{|B|:B\subseteq A\text{ is admissible}\}.
```

The selected platform target is the full asymptotic statement

```math
h(n)=\Theta(\sqrt n).
```

The upper bound is known. The missing direction is one absolute constant $`c>0`$ such that every sufficiently large finite integer host $`A`$ contains an admissible subset of size at least $`c\sqrt{|A|}`$. Improving a logarithmic factor without reaching this statement would not complete the target. Verifying finitely many host sizes would not complete it either.

The exact Lean definition quantifies over `Finset ℤ` and explicitly requires both compared subsets to be nonempty. The stronger signed property used in the research note is sufficient for this definition; it is not silently substituted as an equivalent definition for arbitrary signed hosts.

Primary statement: [current Formal Conjectures source](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/789.lean).

## Direct reward evidence and limitations

The [live Conjectures.io target](https://conjectures.io/problems/erdos789-erdos-789-variants-sq) was open with no full attempt or contribution listed. Its estimate was $2,542 during the initial check and $2,718 on the 21:40 UTC recheck. The estimate is dynamic, not a guaranteed cash amount. The platform pays the solver in Subnet 66 Alpha after verification and review; this is not an OEIS donation.

| Field | Observed value |
|---|---|
| Exact theorem | `Erdos789.erdos_789.variants.sq` |
| Task ID | `fc-v2-variants-sq-dab0d8777ab891b243fba512-formalized` |
| Source-type SHA-256 | `5f0475c69d1d1d8fe299a0db410a528e1ee8017f96eaf19609441e9bc257c04d` |
| Task commitment | `f7fe19d396db548754e444fc45d6017e385c49cf2f6de869305085c99a945b43` |
| Terms | v13, effective 11 November 2026; review policy v4 |

The [submission terms](https://conjectures.io/submission-terms) require the exact pinned Lean statement, no admitted dependencies, permitted axioms only, and original AI logs. Verification costs a credit and does not guarantee a reward. An established public proof predating acceptance can disqualify a later submission, including an independent rediscovery or first Lean formalization. Public release before acceptance therefore needs a separate eligibility decision. Logs carry the platform's stated reuse and licensing terms.

No account action, log upload, purchase, submission, or acceptance of these terms was performed. The public research reservation is [issue 223, comment 7069566082](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069566082).

## Prior results checked

1. **Current upstream statement and Korsky's actual proof.** The current Formal Conjectures source still marks the square-root variant open, while recording Korsky's 2026 lower bound

   ```math
   h(n)\gg\sqrt{\frac{n\log\log n}{\log n}}.
   ```

   It links a [pinned Lean proof at commit 57a0dc60e2cc245b69870647d122fb851f72d8e4](https://github.com/mo271/formal-conjectures/blob/57a0dc60e2cc245b69870647d122fb851f72d8e4/FormalConjectures/ErdosProblems/789.lean). That source was retrieved and its modelling, residue-class, and valuation arguments were read. It was not rebuilt in this session. The reference copy is [the pinned upstream file](https://github.com/mo271/formal-conjectures/blob/57a0dc60e2cc245b69870647d122fb851f72d8e4/FormalConjectures/ErdosProblems/789.lean), SHA-256 `fac91fb2ecab3462c69f09ab988bc3418bf222748eb845c6158abb719ba48b9a`, with its original Apache license header retained. Its remaining `sorry` declarations include the still-open full target; they are not a full proof of this bounty.

2. **The solved interval extremal problem is different.** Deshouillers and Freiman, *On an additive problem of Erdős and Straus, 2*, Astérisque 258 (1999), Theorem 1, prove for all sufficiently large $`N`$ that an admissible subset of $`[1,N]`$ has size at most

   ```math
   2\sqrt{N+1/4}-1.
   ```

   The terminal interval attains the corresponding integer bound. The [primary paper](https://numdam.org/item/AST_1999__258__141_0.pdf), including its definition and theorem statement on printed pages 141–142, was opened. This gives an upper bound by choosing one particular host. It does not produce a large admissible subset of every arbitrary host.

3. **Earlier interval and infinite-set work.** Erdős, Nicolas, and Sárközy's 1991 [*Sommes de sous-ensembles*](https://www.numdam.org/item/JTNB_1991__3_1_55_0/) addresses interval upper bounds and the growth of infinite admissible sets. Its abstract was checked. It does not supply the missing arbitrary-host square-root extraction theorem.

4. **Recent enumeration work was screened at abstract level only.** Indexed abstracts for Wang and Yang's *Sharp enumeration and growth of admissible sets of integers*, arXiv:2610.34372, describe counting admissible sets in an interval and bounds for infinite admissible sets. Direct arXiv retrieval failed. This audit does not claim a full reading of that manuscript or use its results in a proof. The available abstract does not state the arbitrary-host lower bound.

5. **Existing finite computations were not repeated.** The [author's working report for problem 789](https://www.erdosproblemaday.com/report/789) records exact finite thresholds and earlier literature. Those finite results are separate from the asymptotic target. Its older lower-bound summary is superseded by the current upstream Korsky reference.

Searches included the exact problem number, exact square-root question, admissible-set terminology, Korsky's title, and Erdős–Straus modelling terminology. Both search engines were used. No matching complete resolution was found. This is a bounded prior-art search, not a proof that no unindexed result exists.

## What this attempt actually did

The known primitive-residue and valuation argument was read before attempting a replacement. The resulting work is in [the model-height and modular-visibility note](model-height-and-visibility-gap.md):

- a precise conditional model-height statement that would suffice for the full target;
- an alternative sufficient modular detection route;
- an infinite family, within the actual admissibility setting, showing why a fixed prime and quotient rank alone do not ensure detection of a positive proportion of the host;
- the explicit missing input, with no change to the best known bound.

The conditional reduction is a consequence of the existing method. No novelty or priority claim is made for it or for the elementary stress-test family. This attempt has not solved the bounty.
