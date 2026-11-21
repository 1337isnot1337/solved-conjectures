# Erdős 774: exact bounty target and prior-work audit

Status checked: 21 November 2026, approximately 19:52 UTC.

This is an eligible research target, not a completed bounty. No proof or refutation of Erdős 774 is supplied. No submission, fee, account action, award, or payment has occurred.

## 1. Exact mathematical target

A set $`D\subseteq\mathbb N`$ is **dissociated** when distinct finite subsets of $`D`$ have different sums. Equivalently, every finitely supported relation

```math
\sum_{d\in D}\epsilon_d d=0,\qquad \epsilon_d\in\{-1,0,1\},
```


is trivial.

The question is whether the following implication holds for every infinite $`A\subseteq\mathbb N`$:

```math
\begin{split}
&\exists\delta>0\ \forall B\subseteq A\text{ finite}\ 
  \exists D\subseteq B:
  |D|\geq\delta |B|\text{ and }D\text{ dissociated}\\
&\qquad\Longrightarrow
  \exists q<\infty\ \exists D_1,\ldots,D_q\text{ dissociated}:
  A=D_1\cup\cdots\cup D_q.
\end{split}
```


The extraction constant is fixed for the entire infinite set. There is no prescribed bound on the number of parts. A finite union can be converted to a partition by deleting overlaps, because dissociation passes to subsets.

Older harmonic-analysis sources usually call this property *quasi-independence*. It is not the additive-combinatorial $`B_2`$ property and is not a condition restricted to a fixed relation length.

The [official live task](https://conjectures.io/problems/erdos774-erdos-774) displays the exact type

~~~lean
True ↔
  ∀ (A : Set ℕ), A.Infinite → A.IsProportionatelyDissociated →
    ∃ T, (∀ S ∈ T, S.IsDissociated) ∧ T.Finite ∧ A = ⋃₀ T
~~~

The two definitions were read in the linked [upstream source at commit 7d1a8c9912747679d0093f6d1216420c33ee5ffa](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/774.lean). They quantify over every finite subset and use injectivity of finite subset sums. No mismatch was found. In particular, a set containing zero fails the proportional hypothesis on its singleton subset; zero creates no counterexample.

## 2. Direct payment and machine contract

The official page was added on 13 August 2026. It displayed a dynamic estimate of **USD 2,720** at the later check; an earlier check during this audit displayed USD 2,718. Both proof and refutation lanes showed no attempts. These platform activity counts do not measure outside research.

The [official FAQ](https://conjectures.io/faq) states that the successful solver is paid in Alpha to the payout wallet after verification and approval. Thus the offer is direct compensation to a solver, not a donation in the solver's name. The dollar display is an estimate, not a promise of a fixed cash payment.

Under [submission terms v13, effective 11 November 2026, review policy v4](https://conjectures.io/submission-terms), a submission must prove the exact pinned type with permitted axioms and dependencies. Original AI chat logs are required. Verification, review, and payment are separate states. The amount is quoted at acceptance; acceptance does not reserve priority. Established public proofs of the same direct problem before acceptance disqualify a reward, even without prior Lean formalization. A public full-proof commit before acceptance therefore needs a concrete priority review if a solution is found. No such complete proof is present here.

The pinned task bundle was inspected at repository commit **85cfaba5faee2b8738d56c959d0acc774964a399**:

- [Manifest](https://github.com/conjectures-io/conjectures-tasks/blob/85cfaba5faee2b8738d56c959d0acc774964a399/versions/fc-v2-erdos774-erdos-774-5800b4fb66835797923f8daf-formalized/manifest.json).
- [Source metadata](https://github.com/conjectures-io/conjectures-tasks/blob/85cfaba5faee2b8738d56c959d0acc774964a399/versions/fc-v2-erdos774-erdos-774-5800b4fb66835797923f8daf-formalized/source-metadata.json).
- [Task environment](https://github.com/conjectures-io/conjectures-tasks/blob/85cfaba5faee2b8738d56c959d0acc774964a399/versions/fc-v2-erdos774-erdos-774-5800b4fb66835797923f8daf-formalized/task-version.json).

| Field | Observed value |
| --- | --- |
| Task ID | fc-v2-erdos774-erdos-774-5800b4fb66835797923f8daf-formalized |
| Source type SHA-256 | 8914d5a1276424975fa40f964c7ef097f9852f715c441699dda2f2103821cc4a |
| Task commitment SHA-256 | 9b08c2be798e56a29c6e4908c0bbe377046c218876c7636fdc043602bc14a425 |
| Production eligible | true |
| Known proof collisions recorded | none |
| Lean toolchain | leanprover/lean4:v4.35.0-rc2 |
| Mathlib commit | 065356127b1dc0016f66b7283ce0ce2c4055aa55 |
| Forbidden dependency | Erdos774.erdos_774 |
| Permitted axioms | propext, Quot.sound, Classical.choice |
| Submission limit | 31,457,280 bytes; 14,400 seconds |

The source theorem itself has an admitted proof, as expected for an open task. Importing that admitted proof is forbidden; this is not a solution or a formalization defect.

## 3. Primary literature and exact distinctions

The following sources were opened beyond search snippets.

| Source | What it establishes or records | What it does not establish |
| --- | --- | --- |
| [Alon–Erdős, 1985, pp.201–203](https://users.renyi.hu/~p_erdos/1985-07.pdf) | The final paragraph states the full free-sequence question and reports no counterexample. | Its bounded-order constructions do not settle full dissociation. |
| [Grow–Whicher, 1984, pp.490–493](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1174FB55D7CFE16B357F38BA76E01B0B/S0008439500069010a.pdf/finite-unions-of-quasi-independent-sets.pdf) | A 15-element integer example has hereditary extraction fraction $`1/2`$ but needs more than two parts. The paper also gives the compactness and separated-block reduction between finite and infinite formulations. | A fixed finite coloring gap does not give unbounded required colors with one extraction constant. |
| [Harrison–Ramsey, author manuscript, 1995; published 1996](https://www.math.hawaii.edu/~ramsey/random3.pdf) | Gives positive decomposition results for a class of random block sets and discusses a bound depending only on the Sidon constant. | Does not resolve the arbitrary integer set. |
| [Nešetřil–Rödl–Sales, 2024](https://link.springer.com/article/10.1007/s00493-024-00115-1) | The full free-set question is left open. Fixed-$`h`$ variants have counterexamples. Bounded-size set-system representations admit a positive partition theorem. | A fixed-$`h`$ counterexample is not a full-dissociation counterexample. |
| [Lewko, arXiv:2606.06669v1, 4 June 2026](https://arxiv.org/abs/2606.06669) | Proves the bounded-torsion case. For a prime-power exponent $`p^s`$, the finite bound depends on $`s\log_2p/\delta`$. The introduction explicitly excludes the integer case from its result. | Passing to a modulus that grows with the integer set does not give a uniform finite number of colors. |

The Lewko primary PDF was also read through an [accessible manuscript mirror](https://arxiv.cnoctave.top/pdf/2606.06669); the identity and date were checked against the official arXiv record and author publication list.

Searches included the exact target wording, proportional quasi-independence, finite unions of quasi-independent sets, Pisier decomposition, integer Sidon decomposition, and 2024–2026 material. No complete primary proof of the integer target was located. This is a bounded search result, not a proof that no uncatalogued resolution exists.

## 4. Prior research that prevents duplicate attacks

The external [Erdős 774 approach registry](https://erdosproblems.ai/wiki/research/erdos_774/approaches), updated 16 October 2026, contains extensive author-recorded research. Its manuscript pages are primary research records, not externally certified solutions.

They already treat Grow-source amplification, raw relation-rank density, fixed-width encodings, private lifts, full tensors, prime-grid colorings, and several fixed relation templates. The initial idea of amplifying the Grow–Whicher example was therefore not pursued as new work.

The most sharply specified remaining family consists of oriented simplicial boundary columns. For one fixed $`C>0`$, take $`k=\lfloor n/(C\log n)\rfloor`$. The [extraction manuscript](https://erdosproblems.ai/wiki/research/erdos_774/routes/simplicial_extraction) proves a uniform hereditary dissociation fraction using the exact exterior-root relation lattice, semistability, and a weak Gaussian bound. Its coloring problem is left open. I read the lattice and symmetry steps; the full external Gaussian input was not re-proved here.

Two other author-recorded results constrain the search:

- [Three colors avoid every decomposable ternary cycle](https://erdosproblems.ai/wiki/research/erdos_774/lemmas/decomposable_cycle_colors).
- [Two colors avoid all joined simplex boundaries and cycles of sufficiently small vertex excess](https://erdosproblems.ai/wiki/research/erdos_774/lemmas/joined_boundary_colors).

These are avoidance theorems for specified families of relations, not dissociated colorings for all relations. They prevent those restricted templates from being used alone to prove unbounded coloring.

## 5. Work performed and remaining gap

The companion [minimal-support counting diagnosis](minimal-support-counting-gap.md) gives a rigorous obstruction to one tempting shortcut: at the critical simplicial scale, the weighted incidence over **all** ternary-cycle supports diverges for every fixed exponential weight. Disjoint elementary cycles already force this. The calculation does not show that the family has unbounded chromatic number.

A local-lemma approach would instead need an estimate for inclusion-minimal ternary supports. No required uniform estimate was found in the bounded primary-literature comparison. A general integer-matrix example also shows why such minimal supports cannot automatically be identified with rational matroid circuits.

The subsequent [simplicial construction](simplicial-minimality-obstruction.md) strengthens that warning inside the actual boundary matrices: ternary-minimal supports can have rational nullity growing linearly in the number of ambient vertices. The construction has dissociated coloring number two, so it does not supply the desired unbounded coloring number. Its uniform proof passed [independent review](SIMPLICIAL_REVIEW.md), and its explicit generator was replayed separately. The appended Gaussian calculation controls macroscopic supports conditional on the cited external lattice theorem; small and intermediate minimal supports remain untreated.

The substantive target remains one of the following:

1. A uniform partition theorem for every proportionately dissociated integer set; or
2. Finite configurations with one fixed hereditary extraction constant and unbounded actual dissociated coloring number, followed by the already-known compactness/block construction.

No step in this audit supplies either conclusion.

Coordination: [campaign issue 223, reservation comment 7068287428](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068287428). Root publication is separate from these scratch notes.
