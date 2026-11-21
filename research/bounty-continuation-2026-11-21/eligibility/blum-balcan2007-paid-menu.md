# Blum–Balcan 2007: paid-menu scope and prior-proof audit

Research checkpoint, 21 November 2026. No new solution, sponsor acceptance, or payment is claimed. This note does not reserve an item from the menu.

## Original offer

The three-page primary note, [*Open Problems in Efficient Semi-Supervised PAC Learning*](https://www.cs.cmu.edu/~ninamf/papers/openproblems.pdf), offers US$300 for a positive solution to any of four questions. The [author's publication list](https://home.ttic.edu/~avrim/Papers/pubs.html) still links the note and mentions monetary rewards. This is evidence of a published offer, not confirmation that a particular submission would be accepted or paid today.

The formal benchmark is polynomial running time and a number of labelled examples polynomial in

```math
\frac{\log |C_{D,\chi}(\varepsilon)|+\log(1/\delta)}{\varepsilon},
\qquad
C_{D,\chi}(\varepsilon)
=\{h\in C:1-\chi(h,D)\le\varepsilon\}.
```

The target has zero prediction and incompatibility error. Unlabelled samples can depend polynomially on the full description size. The note explicitly distinguishes its simple already-solved monotone-disjunction example from the four paid questions, and mentions a cover-based strengthening only as an ideal refinement.

## Co-training with disjunctions: an earlier public exact argument

The exact target uses an arbitrary joint distribution on pairs of Boolean vectors and one disjunction whose values agree almost surely on the two views. No conditional independence assumption appears.

Grisha Pochuev's [public record](https://doi.org/10.5281/zenodo.23716387), version record **23716388**, was created on **28 October 2026**. Its manuscript is dated 20 October. I downloaded and read the actual proof, including the stopping rule; the conclusion below is not based only on the title or abstract.

The central algorithm is valid. Write the selected feature set as the complement of an excluded set $`E`$. An unlabelled pair with active sets $`A,B`$ imposes exactly

```math
A\subseteq E\Longleftrightarrow B\subseteq E.
```

Initialize $`E`$ with the features appearing in labelled negative pairs, then close under both implications. Induction proves that no target feature is excluded. At termination the complementary disjunction is the greatest feasible support, agrees on every unlabelled pair, and satisfies every positive labelled example under realizability. Incidence counters give polynomial, indeed input-linear, execution.

For an independent unlabelled sample $`U`$, the empirical agreement class $`H_U`$ satisfies

```math
\Pr(H_U\not\subseteq C_{D,\chi}(\tau))
\le 2^d e^{-\tau |U|}.
```

Conditioning on $`U`$, the ordinary finite-class consistency bound gives label complexity of order $`(\log|C_{D,\chi}(\tau)|+\log(1/\delta))/\varepsilon`$. The proof uses neither independence between views nor a class-counting oracle. Its capped doubling-and-validation wrapper also removes advance knowledge of the compatible-class size. The author's explicit disclaimer about novelty and sponsor acceptance does not make the mathematical argument unavailable as prior art.

**Decision:** do not pursue or count the same disjunction-agreement theorem as a new completion.

## Two-sided disjunctions: older partial result and newer formal-criterion argument

The [2013 primary paper](https://proceedings.mlr.press/v28/balcan13.html) gives useful algorithms, but its Theorems 1–2 retain a term involving the inverse minimum occurrence probability of a non-indicator. The proper algorithm also restricts the number of non-indicators. These assumptions cannot simply be deleted when matching the unrestricted 2007 question.

Pochuev's second [public record](https://doi.org/10.5281/zenodo.23718907), version **23718908**, was created on **28 October 2026**. Its elementary counting lemma checks under its stated conventions: all pairs of monotone disjunctions are allowed, including an empty negative disjunction; the same tolerance is used in the compatible-class count and target prediction error.

Every support point is nonempty under a perfectly compatible target. Let $`F`$ be a uniformly random subset of size $`f=\lfloor\varepsilon n\rfloor`$. For each nonempty point $`x`$, choosing one coordinate of $`x`$ gives

```math
\mathbb P_F(x\subseteq F)\le f/n\le\varepsilon.
```

Thus some $`F`$ has $`D(x\subseteq F)\le\varepsilon`$. Set $`T=[n]\setminus F`$. Each of the $`2^f`$ distinct pairs $`(T\cup S,\varnothing)`$, $`S\subseteq F`$, is compatible outside this exceptional event. Consequently

```math
\log_2|C_{D,\chi}(\varepsilon)|\ge\lfloor\varepsilon n\rfloor.
```

Classical supervised elimination then meets the stated polynomial cardinality benchmark. This does not establish that unlabelled data helps; it does not settle a cover-number strengthening, a zero-incompatibility benchmark, or a convention excluding empty disjunctions. The author states those limits. I checked the hitting-set argument and its elementary supervised consequence; I do not certify every optional extension in that manuscript.

**Decision:** the stated cardinality benchmark, under these conventions, has an earlier public proof. A changed convention requires a separately evidenced funded target rather than a silent reinterpretation.

## Majority: distinguish the two denominators

The original wording says that a positive point contains at least 60% of the positive indicators and at most 40% of the negative indicators. Under the literal reading in which the denominator is the size of each complete indicator class, let $`P,N`$ partition the coordinates, let $`s_i=1`$ on $`P`$ and $`s_i=-1`$ on $`N`$, and put $`z=2x-\mathbf1`$. Then

```math
y\langle s,z\rangle\ge\frac n5,
\qquad
\|s\|_2=\|z\|_2=\sqrt n.
```

This is a normalized Euclidean margin of at least $`1/5`$. The classical Perceptron mistake bound is therefore 25, independently of dimension. Standard online-to-batch conversion and validation give polynomial-in-$`1/\varepsilon,\log(1/\delta)`$ labelled complexity without unlabelled data. This is a direct application of a pre-existing general theorem, not a new mathematical resolution claimed here.

The [2014 Balcan–Berlind paper](https://proceedings.mlr.press/v33/balcan14.pdf) explicitly calls its related model a slightly modified form. Its [supplement, Section A.2](https://proceedings.mlr.press/v33/balcan14-supp.pdf), instead takes the fraction among indicators active in the example. That condition yields an $`L_\infty L_1`$ margin, and does **not** imply the preceding dimension-free Euclidean bound. These are different assumptions. I found no source identifying them or authorizing a new payout for the modified formulation.

**Decision:** no reservation or completion count from this wording issue. The literal interpretation has classical coverage; the alternative needs an exact funded statement and separate status audit.

## Linear separators: genuine earlier weakening, with its scope retained

Sridharan–Kakade's [2008 paper](https://www.cs.cornell.edu/~sridharan/final_multi.pdf), Section 4, discusses an answer through surrogate losses and their corresponding incompatibility functions. This does not by itself establish the original zero-one agreement statement.

Blum–Mansour's [2017 primary paper](https://proceedings.mlr.press/v65/blum17a/blum17a.pdf) is a more direct prior result. It gives a polynomial-time algorithm under weak dependence: a positive fraction of the second-view draws is conditionally independent given the label, with the remainder allowed arbitrary same-label dependence. It uses one label for orientation. Its assumptions include inverse-polynomial margin and a centering/semi-homogeneity condition; Theorem 17 states the correctness and polynomial expected running time. Section 6 explicitly leaves removal of these geometric assumptions open.

This is a substantive prior answer to the menu's request for a nontrivial weakening. It is not a proof for every compatible distribution. A further strengthening must not be promoted as the first answer to the broad alternative, and its current award eligibility has not been established.

## Download receipts

All PDFs below were downloaded from the linked primary source and text-extracted locally. The two Zenodo creation times were read from their public API records, which are retained beside this note.

| Source | SHA256 |
|---|---|
| Original 2007 note | `7242bf15e5e287b8bed153a026d906eb8063dfc6c9d4b47242acabfb67e62a6a` |
| 2013 disjunction paper | `47a724b9b77c23628f5e0ccca260fc8b68c83b0e74b4d64b62e0b2785f559090` |
| Sridharan–Kakade 2008 | `96cb6eea39db50cab4538b0dc48ac50d235adfd666dee4364e182cb23086a611` |
| Pochuev agreement manuscript | `a97cb47fdbcadab907691e8afb071cd240c48d0a7e34e08ee30c39fe86dbf0e7` |
| Pochuev two-sided manuscript | `54c622c134c20eaccb94957c969e2d51588082c4d28096eea1c1afc93ee929de` |
| Balcan–Berlind 2014 paper | `2c66a9cf0180980a8f211b56255256d26bb71ca99d0cb0474a38e9fadad09fab` |
| Balcan–Berlind 2014 supplement | `ae603f70ae5f7ddde48fb55b219488ec5c3b73db5449dbbc024c985cff7b1363` |
| Blum–Mansour 2017 | `9410281da504f46f2f38450e35f1eda30204f13dcdf24514daec3343b3fdcf9c` |

No full-resolution or bounty-payment claim follows from this audit. The older-COLT search continues with other exact offers.
