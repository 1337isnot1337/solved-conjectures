# Catalogue

[Home](README.md) · [Verification](docs/verification.md) · [Lean status](docs/lean-status.md)

Each entry links to the mathematical argument and its accompanying checks. The claims below retain the scope stated in the notes; formalization status is tracked separately.

## Solitaire and combinatorial games

| Result | Finding | Lean | Evidence |
| :--- | :--- | :---: | :--- |
| [L-solitaire limit shapes](results/l-solitaire-limit-shapes/) | Eriksson–Jonsson–Sjoestrand (2020), Conj. 1: fixed-scale counterexample (`a_n = 1`) and corrected theorem for arbitrary layer sets at every diverging scale. | ☑ | [Lean](lean/) · [Proof](results/l-solitaire-limit-shapes/proof.pdf) |
| [Denominator degree](results/pham-denominator-degree/) | Pham (2022), §6: primitive period-10 necklace with reduced denominator degree 5. | ◐ | [Proof](results/pham-denominator-degree/PROOF.md) · [Check](results/pham-denominator-degree/verify.py) |
| [Three-player War](results/spivey-multiplayer-war/PROOF.md) | Spivey (2010), Q5: three winner-first conventions admit cycles with all three players active. | ☑ | [Proof](results/spivey-multiplayer-war/PROOF.md) · [Check](results/spivey-multiplayer-war/verify.py) |
| [CUT Family B](results/cut-family-b/PROOF.md) | Ellis–Thanatipanonda (2022), Conj. 2: nim-sequence matches the base game iff the least odd cut above 1 exceeds three times the least even cut. | ☑ | [Proof](results/cut-family-b/PROOF.md) · [Check](results/cut-family-b/verify.py) |
| [CUT with a preperiod](results/cut-arithmetic-periodicity/PROOF.md) | Dailly et al., Open Problem 4: finite arithmetic-periodicity test; both examples have preperiod 6, period 12, saltus 8. | ◐ | [Proof](results/cut-arithmetic-periodicity/PROOF.md) · [Check](results/cut-arithmetic-periodicity/verify.py) |

## Graph theory and discrete geometry

| Result | Finding | Lean | Evidence |
| :--- | :--- | :---: | :--- |
| [Li's coefficient-sign prediction](results/li-coefficient-sign/) | Li (2026), Problems 4.9 and 4.6 (first question): 31-vertex non-spider tree with `[e_3e_2^14]X_T = +29`. | ☐ | [Proof](results/li-coefficient-sign/PROOF.md) · [Check](results/li-coefficient-sign/verify.py) |
| [Line-size sets](results/erdos-607-line-sizes/PROOF.md) | Erdős Problem 607 / OEIS A401948: sharp counting asymptotic with exact leading prefactor. | ☐ | [Proof](results/erdos-607-line-sizes/PROOF.md) · [Check](results/erdos-607-line-sizes/verify.py) |
| [Distance graphs with three missing differences](results/distance-graph-densities/PROOF.md) | Carraher et al., arXiv Conjecture 38 proved for all admissible parameters. Conjecture 39 fails for every `k=50,59,68,…`. The [corrected formula](results/distance-graph-densities/CLASSIFICATION.md) gives all densities for gaps five and seven. | ◐ | [Strip verifier](results/distance-graph-densities/verify.cpp) and [counterexample verifier](results/distance-graph-densities/counterexample.py) |

## Number theory, packing and partitions

| Result | Finding | Lean | Evidence |
| :--- | :--- | :---: | :--- |
| [Batista's Egyptian fractions](results/batista-egyptian-fractions/PROOF.md) | OEIS A398581: the lexicographically first triple uniquely maximizes the last denominator for admissible `k ≢ 1 (mod 5)`. | ☑ | [Proof](results/batista-egyptian-fractions/PROOF.md) · [Check](results/batista-egyptian-fractions/verify.py) |
| [Growing rectangles](results/rectangle-partition-asymptotics/PROOF.md) | Gajdzica–Zakarczemny, Remark 5.9: uniform asymptotic for `log p(h,w)` as `h → ∞`, `w ≥ h`. | ◐ | [Proof](results/rectangle-partition-asymptotics/PROOF.md) · [Check](results/rectangle-partition-asymptotics/verify.py) |
| [Two-difference Motzkin density](results/two-difference-motzkin/PROOF.md) | The exact character formula for any pair in any compact abelian group, including noncyclic finite subgroups. The cyclic maximum-independent-set problem has a prior 2026 solution. | ☐ | [Proof](results/two-difference-motzkin/PROOF.md) and [finite checks](results/two-difference-motzkin/verify.py) |
| [Liu–Zhu packing and Natalchenko–Sagdeev covering](results/symmetric-four-point-density/PROOF.md) | Sharp densities for every symmetric four-point set of integers. For odd coprime steps the proof determines the longest interval that can be covered exactly once. | ☑ | [Proof](results/symmetric-four-point-density/PROOF.md) and [finite checks](results/symmetric-four-point-density/verify.py) |
| [Packing with two nonmixed gaps](results/nonmixed-gap-packing/PROOF.md) | Natalchenko–Sagdeev’s main packing conjecture for arbitrary gap counts. The same formula gives the circle parameter in their Section 4 question. | ☑ | [Proof](results/nonmixed-gap-packing/PROOF.md) and [finite checks](results/nonmixed-gap-packing/verify.py) |
| [Haralambis’s three-difference conjecture](results/haralambis-three-differences/PROOF.md) | For every triple of positive integer differences, the extremal density equals the circle rotation bound. One pair sum is a period of an optimal set. | ☑ | [Proof](results/haralambis-three-differences/PROOF.md) and [certificate checks](results/haralambis-three-differences/verify.py) |

## Lonely runners

| Result | Finding | Lean | Evidence |
| :--- | :--- | :---: | :--- |
| [Five-speed Loneliness Spectrum Conjecture](results/five-speed-spectrum/PROOF.md) | The values below 1/5 are exactly s/(5s+1) for positive integers s. Cordella’s twelve sporadic primitive quintuples exhaust the exceptions to the two known families. | ◐ | [Proof](results/five-speed-spectrum/PROOF.md) and [exhaustive verifier](results/five-speed-spectrum/verify.py) |
| [Eight-speed Loneliness Spectrum Conjecture](results/eight-speed-spectrum/) | The values below 1/8 are exactly s/(8s+1). Three infinite families and 17 sporadic tuples exhaust the primitive cases. | ☐ | [Proof](results/eight-speed-spectrum/PROOF.md) and [exhaustive verifier](results/eight-speed-spectrum/verify.py) |
| [Seven-speed Amended Loneliness Spectrum Conjecture](results/seven-speed-spectrum/) | The values below 1/7 are exactly s/(7s+1), 3/23, 5/37 and 9/65. One infinite family and 27 sporadic tuples exhaust the primitive cases. | ☐ | [Proof](results/seven-speed-spectrum/PROOF.md) and [exhaustive verifier](results/seven-speed-spectrum/verify.py) |
| [Six-speed Loneliness Spectrum Conjecture](results/six-speed-spectrum/PROOF.md) | The values below 1/6 are exactly (P−1)/(6P) for P ≥ 7 congruent to ±1 modulo 6. Cordella’s nine sporadic sextuples exhaust the exceptions to the three known families. | ◐ | [Proof](results/six-speed-spectrum/PROOF.md) and [exhaustive verifier](results/six-speed-spectrum/verify.py) |
| [Tight six-speed sets and seven-coordinate critical subtori](results/tight-six-speeds/PROOF.md) | The consecutive set is the unique primitive six-speed equality case. The seven-coordinate critical plane is unique up to signs and permutations. | ◐ | [Proof](results/tight-six-speeds/PROOF.md) and [exhaustive verifier](results/tight-six-speeds/verify.py) |
| [Eight lonely runners, all equality cases](results/tight-seven-speeds/PROOF.md) | Exactly three primitive seven-speed sets attain 1/8. They are the consecutive speeds and the two examples in Goddyn and Wong’s census. | ◐ | [Proof](results/tight-seven-speeds/PROOF.md) and [exhaustive verifier](results/tight-seven-speeds/verify.py) |
| [Nine lonely runners, unique equality case](results/tight-eight-speeds/PROOF.md) | The consecutive speeds 1 through 8 are the only primitive set attaining 1/9. | ◐ | [Proof](results/tight-eight-speeds/PROOF.md) and [exhaustive verifier](results/tight-eight-speeds/verify.py) |
| [Eleven through fourteen lonely runners, all equality cases](results/tight-eleven-to-fourteen/) | Only consecutive primitive speeds attain equality for 11–13 runners. For 14 runners the Goddyn–Wong set is the only further case. | ☐ | [Proof](results/tight-eleven-to-fourteen/PROOF.md) and [verifier](results/tight-eleven-to-fourteen/verify.py) |
| [Ten lonely runners, unique equality case](results/tight-nine-speeds/PROOF.md) | The consecutive speeds 1 through 9 are the only primitive set attaining 1/10. | ☐ | [Proof](results/tight-nine-speeds/PROOF.md) and [exhaustive verifier](results/tight-nine-speeds/verify.py) |

☑ Lean formalization of the stated result · ◐ Partial formalization with explicit remaining dependencies · ☐ No Lean formalization

See [docs/lean-status.md](docs/lean-status.md) for exact formalized statements and gaps.

## Precise scope

The L-solitaire counterexample relies on the original paper's Definitions 2--4 allowing *positive*, not necessarily diverging, horizontal scaling factors. It does **not** refute the natural corrected assertion for diverging scales. The note supplies a proof of that corrected assertion for all admissible layer sets.

The necklace result refutes **only** Pham's exact-degree guess. It does **not** refute the distinct Harris--Nguyen (2025) conjecture that a necklace and its reverse-complement dual admit a common denominator of degree equal to their period. The included dual calculation is consistent with that conjecture.

The Li example is neither a spider nor a caterpillar and refutes the **non-spider** sign prediction. Earlier spider constructions already refute the unrestricted coefficient assertion; likewise, earlier literature contains trees with two degree-4 vertices. The newly reported result is explicitly limited to the non-spider class, and novelty is provisional pending independent review (see the [novelty audit](results/li-coefficient-sign/NOVELTY.md)). This example does **not** refute Dahlberg--She--van Willigenburg's general non-`e`-positivity conjecture.

These are mathematical claims with explicit proofs and computer checks, **not peer-reviewed publications**. A literature search cannot establish that a counterexample or stronger theorem is the first discovery. Please cite the primary publications when discussing the original conjectures.

## Primary sources

- Kimmo Eriksson, Markus Jonsson, Jonas Sjoestrand, [*Limit shapes of stable and recurrent configurations of a generalized Bulgarian solitaire*](https://combinatorialpress.com/article/ojac/vol15/192.pdf), *Online Journal of Analytic Combinatorics* 15 (2020), paper 10. Definitions 2--4, Theorems 3--5, Conjecture 1.
- Nhung Pham, [*Limiting behavior in growth of Bulgarian solitaire orbits*](https://arxiv.org/abs/2208.14496) (2022), Theorem 1.2 and section 6.
- A. J. Harris and Son Nguyen, [*Bulgarian Solitaire: A new representation for depth generating functions*](https://ajc.maths.uq.edu.au/pdf/93/ajc_v93_p224.pdf), *Australasian Journal of Combinatorics* 93 (2025), Conjecture 1.1.
- Brian Hopkins, [*Henrik Eriksson's Bulgarian Solitaire Variant*](https://math.colgate.edu/~integers/a9Proc23/a9Proc23.pdf), *INTEGERS* 24A (2024), Theorem 5 (cyclic states for consecutive bottom-layer picking).

- Ethan Y. H. Li, [*A quantitative way to e-positivity of trees*](https://arxiv.org/abs/2503.09484), arXiv:2503.09484v2 (10 February 2026), Section 4, Problems 4.6 and 4.9.
- Kai Zheng, [*On the e-positivity of trees and spiders*](https://doi.org/10.1016/j.jcta.2022.105608), *Journal of Combinatorial Theory, Series A* 189 (2022), Theorem 5.3 (earlier spider coefficient formula).
- Mirko Hornak and Mariusz Wozniak, [*On arbitrarily vertex decomposable trees*](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf), 2006 preprint / *Discrete Mathematics* 308 (2008), 1268--1281 (older spider and two-degree-four-vertex cases).
- Davion Q. B. Tang, David G. L. Wang and Monica M. Y. Wang, [*e-Positive caterpillars have maximum degree at most three*](https://arxiv.org/abs/2610.39481), arXiv:2610.39481v1 (29 October 2026) (caterpillar case).
- David Batista, [OEIS A398581](https://oeis.org/A398581), and Hùng Việt Chu, [Theorem 1.3 on best two-term underapproximations](https://arxiv.org/abs/2306.12564).

- Václav Kotesovec’s [conjectured exponential base](https://oeis.org/A401948) for the counting function in [Erdős Problem 607](https://www.erdosproblems.com/607). The verifier accepts the [10,000-term reference table](https://oeis.org/A401948/b401948.txt) with the option `--table b401948.txt`.

For the other entries, primary publications and conjecture identifiers are cited in their linked proof notes.
