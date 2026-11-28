# Erdős 25: exact target and source audit

21 November 2026. This is a research reservation for the full logarithmic-density question. No proof or counterexample has been obtained.

## 1. Exact mathematical target

Let $`1\le n_1\lt n_2<\cdots`$ be distinct positive integers and choose one residue $`a_i\bmod n_i`$ for each modulus. Define

```math
A=\{m\in\mathbb N:\text{for every }i,
\ m\lt n_i\text{ or }m\not\equiv a_i\pmod {n_i}\}.
```

Does the limit

```math
\lim_{X\to\infty}
\frac1{\log X}\sum_{\substack{1\le m\le X\\m\in A}}\frac1m
```

exist for every such system?

The activation condition and the single-residue restriction are both part of the target. A proof for summable reciprocal moduli, pairwise coprime moduli, or a finite system is not a completion. A counterexample allowing several residues at one modulus is not a completion.

Primary statement records:

- [Erdős Problems 25](https://www.erdosproblems.com/25), citing Erdős [Er95], displays the full question as open.
- [Formal Conjectures source](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/25.lean), theorem `Erdos25.erdos_25`, is categorized as research open. Its source `sorry` is not a proof and may not be imported as one.

## 2. Direct solver offer and exact formal scope

The [live Conjectures.io page](https://conjectures.io/problems/erdos25-erdos-25), reopened on 21 November 2026, offers the full target to the first accepted proof or refutation. It displayed an estimated **US$2,730**, with no published attempt or contribution. The estimate had changed from US$2,718 during the same research session; it is not a fixed dollar promise.

The [payment description](https://conjectures.io/how-it-works) says the reward is paid to the solver's selected wallet in Subnet 66 Alpha. The displayed dollar figure varies with the pool and exchange rate; the amount is locked at submission. This is a direct solver reward, not a donation in the solver's name.

The [submission terms v13, effective 11 November 2026](https://conjectures.io/submission-terms), require the exact Lean theorem, permitted axioms only, original AI chat logs, kernel acceptance, and separate review. A verification attempt costs a credit. Existing established mathematical proofs disqualify an independent rediscovery or first Lean port. No account, fee, submission, wallet action, or sponsor contact is authorized or performed here.

The [task bundle at commit `85cfaba5faee2b8738d56c959d0acc774964a399`](https://github.com/conjectures-io/conjectures-tasks/tree/85cfaba5faee2b8738d56c959d0acc774964a399/versions/fc-v2-erdos25-erdos-25-aecd890e5f5dfd0355831208-formalized) was inspected through its manifest and source metadata:

- Task ID: `fc-v2-erdos25-erdos-25-aecd890e5f5dfd0355831208-formalized`.
- Source declaration: `Erdos25.erdos_25`.
- Generated/source type SHA256: `0296f636686c1a8f82bdf2d005e25e6259d09e61f6181662bdea0e64f94d3e24`.
- Source metadata supports both `formalized` and `counterexample` modes.
- The affirmative target is `True ↔` the universal existence of a logarithmic density, with positive, strictly increasing natural moduli and arbitrary integer residues.
- The source theorem itself is forbidden as a dependency. Permitted axioms are `propext`, `Quot.sound`, and `Classical.choice`.

A future valid negative result would need the platform's counterexample task, not a proof of the affirmative wrapper.

## 3. Exact prior work inspected

### Chojecki: positive special cases and a conditional reduction

Przemyslaw Chojecki, [*Truncated Congruence Sieves and Erdős Problem 25*](https://www.ulam.ai/research/erdos25.pdf), dated 19 March 2026, 13 pages.

The full paper was read, including the explicitly unresolved hypotheses:

- Theorems 3.1 and 3.2 prove natural density for summable reciprocal moduli and for pairwise coprime moduli.
- Section 4 gives the disjoint first-kill sets and finite quotient sieves.
- Conjecture 5.1 is a uniform harmonic estimate with a globally sublogarithmic error charge. Theorem 5.4 is conditional on that unproved statement.
- Proposition 6.1 rules out controlling the unconditioned tail union.
- Proposition 6.3 constructs prime-power tower spikes. Section 8 explicitly leaves their global synchronization unresolved.

These are prior partial results, not a full solution. The note's proposed transverse-tower program is not used as a proved input.

### Wang: full multi-residue counterexample, different target

Shouqiao Wang, [*A Proposed Solution to Erdős Problem 486*](https://github.com/ShouqiaoW/erdos/blob/main/486/paper.tex), public July 2026. The fetched TeX blob is `472f40ff58331b28e8b4995dde4b99826299d1d2`; its associated PDF blob is `d8bf9fef43e46b15355cb2b3522d09e50c63cb6f`. The repository also contains a [Lean directory](https://github.com/ShouqiaoW/erdos/tree/main/486/lean). This audit inspects the analytic construction's scope; it is not an independent kernel replay of that formalization.

Section 3 chooses a finite family of moduli $`q_S`$, indexed by central subsets of a prime set. Every endpoint $`m`$ uses $`q_{K(m)}`$. Many different endpoints use the same modulus and require distinct residues there. The small periodic footprint is then combined with large endpoint deletion in the global gliding-hump construction of Section 4.

That construction settles the more general multiple-residue formulation if its proof is accepted. It does not satisfy the one-residue-per-distinct-modulus hypothesis of Erdős 25. The strict-versus-inclusive activation discrepancy is addressed in the paper using a primitive-set argument; it is not the obstruction to transfer.

The paper's arithmetic skeleton and small-footprint proof were read in full. The proposed route below begins precisely at the missing distinct-modulus allocation.

### Current research records and false leads

The [Erdős 25 research record](https://erdosproblems.ai/wiki/problems/integer_sequences/E0025), updated in October 2026, still lists the full target as open and identifies the single-residue restriction as the barrier to importing Wang's construction. This is a secondary status cross-check, not proof of openness or novelty.

A search hit for an elementary Davenport–Erdős/Rogers proof concerns [Erdős 281](https://erdosproblems.ai/wiki/problems/covering_systems/E0281/claims/2026_01_18_koishichan), not the arbitrary-residue target here.

The live repository issue search for `erdos25` and `Truncated Congruence` found no existing reservation. Quoted `Erdős 25` searches returned only unrelated issue 25 about voltage graphs. Local campaign notes and result directories were also searched before reservation.

No matching full proof was located in this bounded primary-source audit. This is not a guarantee that no proof exists and is not a novelty claim.

## 4. Concrete next attempt

Test whether a finite Wang-style deletion block can be made injective in its moduli while retaining both:

1. a positive fraction of early endpoint deletions, at comparable modulus and endpoint sizes; and
2. a summably small measure of the completed periodic union.

The first check is a capacity calculation for the specified prime-incidence skeleton. Merely replacing each repeated modulus by a distinct multiple may leave far too few admissible moduli below its endpoint. A valid full counterexample would require a replacement construction and then the complete infinite assembly, not a finite block alone.

If the prime-incidence route cannot meet that capacity requirement, record the exact obstruction and examine whether it suggests a uniform positive density argument. No finite search is being counted as a resolution.

