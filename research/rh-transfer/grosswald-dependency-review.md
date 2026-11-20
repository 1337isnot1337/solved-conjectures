# Grosswald's conjecture

## Dependency review: the 2015 zero-counting gap

Date: 2026-11-20. Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

**Conclusion:** the specific defect reported in Trudgian's 2015 zero-counting argument does not enter the published McGown–Treviño–Trudgian proof of Grosswald's conjecture under GRH. This is a dependency audit of that risk. It is not a new proof of Grosswald's theorem, a rerun of the published finite computations, or a complete verification of every estimate in the cited papers.

## 1. The defect being checked

Bennett, Martin, O'Bryant and Rechnitzer, *Counting zeros of Dirichlet L-functions*, Math. Comp. 90 (2021), 1455–1482, identify an unjustified removal of a parameter inequality in Trudgian's 2015 argument. See their introduction, printed p. 1456. They repair the Dirichlet zero-counting estimates; Corollary 1.2 improves all twenty pairs of constants claimed in the older paper.

Their reference [2], which they say used the affected estimate, is their own *Explicit bounds for primes in arithmetic progressions* (2018), not the Grosswald paper. Their affected reference [13] is:

T. S. Trudgian, *An improved upper bound for the error in the zero-counting formulae for Dirichlet L-functions and Dedekind zeta-functions*, Math. Comp. 84 (2015), 1439–1450.

Primary source: [BMOR 2021 author PDF](https://personal.math.ubc.ca/~bennett/BeMaObRe-MathComp-2021.pdf), introduction, Corollary 1.2 and bibliography.

## 2. What the Grosswald proof actually uses

McGown, Treviño and Trudgian, *Resolving Grosswald's conjecture on GRH*, Theorem 1, prove, under GRH,

```math
g(p)<\sqrt p-2\quad(p>409),\qquad
\widehat g(p)<\sqrt p-2\quad(p>2791),
```

where the second quantity requires a prime primitive root.

Their analytic input is §2, Lemma 1, equations (3)–(4). These bound the smoothed sums

```math
\sum_{n<x}\Lambda(n)(1-n/x),\qquad
\sum_{n<x}\Lambda(n)\chi(n)(1-n/x).
```

The lemma is attributed to the proof of **Bach's 1997 Lemma 2.1**. Theorem 2 uses these inequalities directly. Theorem 3 uses the same estimates inside a character sieve. Neither argument invokes a bound for the zero-counting function.

The bibliography contains no Trudgian 2015 zero-counting paper. Its 2015 reference is **Treviño's Burgess-inequality paper**, a different author/title and a different estimate. Its Cohen–Oliveira e Silva–Trudgian reference supplies the earlier sieve and finite verification.

Primary source: [MTT author PDF](https://campus.lakeforest.edu/trevino/GrosswaldGRH.pdf), dated February 21, 2016, §§2–3 and references [1], [3], [8].

## 3. The finite-verification dependency

Cohen, Oliveira e Silva and Trudgian, *On Grosswald's conjecture on primitive roots*, Acta Arith. 172 (2016), 263–270, §4, describe exact finite arithmetic:

1. A segmented Eratosthenes sieve enumerates the primes below the stated endpoint.
2. A second sieve completely factors the relevant portion of each prime minus one.
3. Modular exponentiation tests the multiplicative orders of candidate primitive roots.
4. Record-holder data and the small initial range give the claimed complete finite check.

The same section treats prime primitive roots. These operations do not use a zero-counting estimate. The paper's large-prime argument uses an explicit Burgess inequality, while its §3 sieve follows elementary character identities.

This review inspected the published algorithms and their role in the later proof. It did not rerun the authors' finite computation.

Primary source: [publisher PDF](https://www.impan.pl/shop/en/publication/transaction/download/product/91309), especially §4, printed pp. 267–269. DOI: [10.4064/aa8109-12-2015](https://doi.org/10.4064/aa8109-12-2015).

## 4. Bach citation and limits of this audit

The older source is Eric Bach, *Comments on search procedures for primitive roots*, Math. Comp. 66 (1997), 1719–1727, DOI [10.1090/S0025-5718-97-00890-9](https://doi.org/10.1090/S0025-5718-97-00890-9).

Bach's [author-maintained errata](https://pages.cs.wisc.edu/~bach/errata.pdf), dated February 20, 2023, include a specific entry for this paper. It adds primitive-root data and clarifies an ERH assumption in an algorithmic reduction. It does not amend Lemma 2.1. That absence is supplementary evidence only.

The original Bach PDF could not be retrieved through the research interface during this audit. Accordingly, the claim here is the exact dependency statement visible in the Grosswald proof, not an independent rederivation of every constant in Bach's estimate.

## 5. Consequence for the research campaign

The reported 2015 defect gives no reason to retract the inherited Grosswald implication: the relevant analytic input is a separate 1997 estimate. Under the accepted RH/Dirichlet-GRH input, the full conditional theorem can be applied with credit to McGown, Treviño and Trudgian and their cited predecessors. It must not be described as a new proof discovered in this repository.

The argument concerns the original all-prime conjecture. The finite calculations are components of the published full proof, not a new conjecture indexed by a larger numerical cutoff.
