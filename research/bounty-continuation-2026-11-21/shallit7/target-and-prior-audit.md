# Shallit problem 7: primitive binary words

**Subsequent correction.** The [exact mixed-difference analysis](exact-mixed-difference-classes.md) disproves the 2010 conjecture about the individual lower classes as printed and identifies a conflict with the lower-class assertion of Theorem 6. The question for their union remains open.

Research checkpoint, 21 November 2026. **The full problem is unresolved in this work.** No prize application, sponsor contact, or payment claim has been made.

## Exact target and public offer

Let $`Q`$ be the language of nonempty binary words that are not proper powers:

```math
Q=\{w\in\{a,b\}^{+}:\text{ there are no }u\in\{a,b\}^{+},\ k\ge2\text{ with }w=u^k\}.
```

Determine whether $`Q`$ is context-free in the ordinary, unrestricted sense. Jeffrey Shallit's 2014 presentation *Open Problems in Automata Theory: An Idiosyncratic View*, slide 29, lists this as problem 7 with a **£200** offer. The slide gives no expiry or formalization-only condition. This is a public personal mathematical prize, rather than a donation offered in a solver's name. The present audit did not locate a withdrawal or an announcement that this exact prize had been paid. That records the public offer; it does not certify private payment history or sponsor acceptance of a future proof.

Primary offer: <https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf>.

Coordination: <https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069141704>.

The unrestricted qualifier matters. A proof that $`Q`$ is not deterministic, unambiguous, linear, or in a selected certificate class does not settle the offer. A non-context-free intersection of $`Q`$ with one regular language would settle the full question negatively. Conversely, verifying that many such intersections are context-free would not settle it positively.

## Current primary status checks

| Source | Exact scope checked | Consequence for eligibility |
|---|---|---|
| Antoine Amarilli, Mikaël Monet, Rémi Raphaël, Sylvain Salvati, *On the Complexity of Language Membership for Probabilistic Words*, STACS 2026, §6 | Defines primitive words and explicitly says ordinary context-freeness over a nonunary alphabet is unknown. Its weighted-membership algorithms and circuit constructions are separate claims. | Recent primary evidence that the full question remains open. |
| Will Howe, Grant Huffman, Jensen Kohlmeyer, Liam Kruer, *Decomposable disjoint-union circuits for primitive words*, November 2026, abstract and pp. 1–2 | Constructs length-indexed circuits of size $`n^{2+o(1)}`$. Products may join interlaced position sets. The paper expressly does not decide context-freeness or give a uniform context-free grammar. | This is not a resolution of the sponsor's target. |
| Florian Koechlin, *New Analytic Techniques for Proving the Inherent Ambiguity of Context-Free Languages*, FSTTCS 2022, Proposition 17 | Proves that the primitive-word language is not unambiguous context-free, using a bounded slice. | The ambiguity restriction prevents this from settling the full target. |
| Shallit's current talks and papers pages | The 2014 problem numbering was checked against the exact prize slide. A solved “problem 7” mentioned under an earlier talk has different numbering and statement. | No exact full resolution was found in the checked sponsor records. |

Primary URLs:

- STACS paper: <https://drops.dagstuhl.de/storage/00lipics/lipics-vol364-stacs2026/html/LIPIcs.STACS.2026.5/LIPIcs.STACS.2026.5.html>.
- November circuit manuscript: <https://hexagonmath.org/pdf/2611.00235v1>.
- Koechlin author manuscript: <https://lipn.fr/~koechlin/FSTTCS22.pdf>; publisher record: <https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.FSTTCS.2022.41>.
- Sponsor records: <https://cs.uwaterloo.ca/~shallit/talks.html>, <https://cs.uwaterloo.ca/~shallit/papers.html>.

These checks establish the exact distinction between the live question and the displayed nearby theorems. Absence of a located proof is not a novelty theorem, and a later candidate must be searched again before any full-resolution claim.

## Earlier work that constrains the proposed attack

The first route examined bounded slices

```math
Q_m=Q\cap(ab^*)^m.
```

Kászonyi and Katsura's 1997 paper proves $`Q_m`$ context-free when $`m`$ has at most three distinct prime divisors; repeated prime powers are allowed. It develops mixed-difference witnesses and stratified semilinear exponent sets. This rules out treating the first two or three prime axes as a new negative example.

Source: L. Kászonyi and M. Katsura, *On the context-freeness of a class of primitive words*, Publ. Math. Debrecen 51 (1997), 1–11, introduction and Theorem 1:
<https://publi.math.unideb.hu/paper/376/download/10_5486_PMD_1997_1707.pdf>.

Kászonyi's 2010 paper cites the further sufficient condition $`\sum_{p\mid m}1/p<4/5`$ for context-freeness, with the sum over distinct prime divisors. Its §4 studies sums of periodic vectors; §5 proves two extreme classes in a mixed-difference classification and retains intermediate classes as conjectural. The paper still conjectures that every $`Q_m`$ is context-free. Its definitions and periodic-sum construction are prior work for the algebraic approach below.

Source: László Kászonyi, *Semiperiodic vectors and the context-freeness of $`Q_n=Q\cap(ab^*)^n`$*, Publ. Math. Debrecen 77 (2010), 313–330, Theorems 1, 5, 6 and §5:
<https://publi.math.unideb.hu/paper/1506/download/10_5486_PMD_2010_4680.pdf>.

The indexed primary proceedings text of Sándor Horváth's *Strong Interchangeability and Nonlinearity of Primitive Words*, starting on printed p. 173, reports that $`Q`$ satisfies a strong interchange property while not being linear context-free. The large proceedings PDF could not be opened in full through the reader in this checkpoint. That access limit is explicit: this note does not use an uninspected formulation of its interchange theorem. It does rule out presenting a bare appeal to the ordinary interchange method as a new argument.

Primary proceedings: <https://ris.utwente.nl/ws/files/5118932/Nijholt95algebraic.pdf>.

## Actual mathematical attempt and stopping point

[The separate proof note](affine-certificate-obstruction.md) proves a uniform limitation of a proposed arithmetic certificate method. On a squarefree $`m`$-run slice, accepting a particular primitive vector while excluding every proper power requires at least $`\omega(m)`$ simultaneous affine disequality tests in a clause. The bound survives finitely many regular guards and arbitrary unions of such clauses.

The hoped-for bridge was that a fixed context-free grammar avoiding every proper power would impose a uniform bound on that certificate width. The note disproves even this version with an explicit four-nonterminal grammar whose language is contained in $`Q`$. It contains periodic-sum vectors requiring arbitrarily large width. The valid remaining route is the Ginsburg–Spanier stratified-semilinear characterization; no failure of that characterization is established here.

This is a restricted method obstruction and a failed bridge, not a proof that $`Q`$ is non-context-free. No finite word enumeration was used. The target remains open in this checkpoint.

## Other candidate screened before this reservation

The only other newly screened candidate was Shallit's 2014 problem 6, the context-free interpolation question, offered at £100 on slide 28. It was excluded after reading Rastko Maslic and Jeffrey Shallit's September 2026 primary paper *Solution to Bucher's density problem for context-free languages*. Theorem 1 gives the required pair of binary context-free languages for which every context-free interpolant has a finite gap on at least one side. This settles the exact proposed negative answer. The sponsor also lists the paper on his current publications page.

Primary proof: <https://arxiv.org/html/2609.08571v1>, §1.1, Theorem 1. No work on that already-resolved target is counted as a new result.
