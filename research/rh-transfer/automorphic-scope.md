# Automorphic transfer scope

Status: source-scope audit and two elementary obstruction lemmas. No full named conjecture is resolved here.

This note treats the source result as correct, as requested. It checks what can be applied outside the final Dirichlet-GRH conclusion. It does not compile or verify Lean.

Source pin: [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src). Every source path below is relative to extracted/lean/src at that pin.

## 1. The strongest directly traced global Galois input

The chain is:

- Development/AutomorphicArithmetic/AutomorphicVarieties/SmallClassNumbers/CorGKOf.lean, litN;
- Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TopMainZj.lean, automorphic_inputs_from_literature;
- Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean, galoisLocalGlobalStrong_recParameter;
- Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean, Row0b and PropsB.

The last file gives the actual quantifiers. E must be a CM number field. The input is a cuspidal automorphic representation pi of GL_a over E, with a>=1, a regular algebraic infinity type, and a polarized-pair character over E's maximal totally real subfield. For every coefficient prime ell and coefficient-field isomorphism, the output is a continuous semisimple ell-adic representation r of G_E, an integer weight, and Hodge--Tate multisets satisfying PropsB.

The Hodge--Tate multiset is explicitly related to the infinity parameters:
~~~math
\operatorname{HT}_{\tau}(r)
=\left\{(a-1)/2-z:
z\in\operatorname{infChar}_{\iota\tau}(\pi)\right\}.
~~~
Complex conjugation reflects these weights about an integral total weight.

PropsB also gives the stated local conditions. At ell, spherical local components give crystallinity and the prescribed jumps. Other local assertions have the displayed Tor, monodromy-zero, or tame/squarefree/IsQpBig hypotheses. AwayB always compares dimensions; it asserts equality under its Tor and monodromy-zero conditions and a more limited tame comparison under the additional conditions. This audit does not silently replace PropsB with an unrestricted local-global compatibility theorem.

Most importantly, Row0b starts with pi and constructs r. It does not start with an arbitrary geometric Galois representation and construct an automorphic pi.

Direct source: [WeightsConjBis.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/TypeConditions/WeightsConjBis.lean).

## 2. What the other package names mean

### Regular algebraic is an actual hypothesis

In Development/AbelianVarietyTheory/Definitions/GlobalTwisting/DifferentiableAtChart.lean, IsRegAlg requires, at every complex embedding, a multiset with no repeated entries and
~~~math
z\in \mathbb Z+(a-1)/2
\quad\hbox{for every infinity parameter }z.
\tag{2.1}
~~~
Thus every difference of two parameters must be an integer. This restriction is not removed by quantifying over all ranks or all CM fields.

### Clozel purity is an infinity-weight statement

Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/ClozelPurity.lean assumes algebraic infinity parameters and concludes
~~~math
\operatorname{infChar}_{\bar\tau}(\pi)
=\{w_0-z:z\in\operatorname{infChar}_{\tau}(\pi)\}
~~~
for an integer w_0. The literal definition does not assert that every finite Satake parameter of every cuspidal representation has unit modulus. Confusing those statements would manufacture a proof of Ramanujan from a different meaning of purity.

### Caraiani temperedness is cohomological

Development/AbelianVarietyTheory/PublishedTheorems/GaloisGeometry₂/CaraianiTempered.lean requires a CM field, a conjugate-self-dual cuspidal representation, and IsCohomological. It concludes temperedness at finite places.

That entire class is prior art: Caraiani's 2012 [*Local-global compatibility and the action of monodromy on nearby cycles*](https://www.ma.imperial.ac.uk/~acaraian/papers/lgc1.pdf), Theorem 1.2, states this result for every rank n>=2. It cannot be credited as a newly solved named conjecture by extracting it from the archive.

### OpenImageCondition is not a general image theorem

In Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TemperedProductOfSquareIntegrable.lean, OpenImageCondition is a structure with the single field galoisRepOfPolarizedPairLit : RowT. WeakOfAtt.lean defines RowT to be the same Row0b statement above. The name does not provide an open-image or finite-image theorem for arbitrary Galois representations.

A separate finite-image search also found KillTransfer in Foundations/GaloisRepresentations/CharpolyFromTrace/KillTransferAlt.lean. Its finite-image property is an assumption. Given finite-image rho and equality of traces with rho', it transfers annihilators in the group algebra. KillTransfer.lean proves that assertion. It does not prove that an arbitrary geometric representation has finite image.

### The traced descent statements assume automorphic attachment

ModularityArgument/AutomorphyLifting/WeakOfAtt.lean starts WeakOfAtt with two existing attached cuspidal representations pi and P. Its AUpDown includes IsRegAlgAutomorphicAttached as a hypothesis. It controls descent and local properties inside an existing automorphic setting. Removing that input would be a separate theorem.

## 3. A direct obstruction to the routine Selberg transfer

Selberg's eigenvalue conjecture concerns all congruence quotients and excludes nonconstant Laplace eigenvalues in (0,1/4). In the standard parametrization
~~~math
\lambda=1/4-\nu^2,
~~~
a hypothetical exceptional cuspidal representation has 0<nu<1/2. The unrestricted conjecture is still explicitly discussed as open in Blomer's 2026 [*Automorphic Density Theorems and Applications*](https://epubs.siam.org/doi/10.1137/25M1794905), section 2.

Here is the precise elementary obstruction.

**Parameter-difference lemma.** A two-element multiset with difference 2nu, where 0<nu<1/2, cannot be translated into Z+c for any common c. Therefore a scalar twist cannot make it satisfy (2.1).

Proof: translating both entries preserves their difference. Two elements of Z+c have integral difference, whereas 0<2nu<1.

For a spherical GL_2(R) complementary-series parameter, the two infinitesimal parameters are nu and -nu, up to a common convention-dependent translation. Restricting the real Weil parameter to W_C, as in archimedean CM base change, preserves the difference 2nu. A character twist adds the same parameter to both entries at each embedding. Consequently these operations do not put a hypothetical Selberg exceptional representation into Row0b's regular algebraic input class.

This is a scope obstruction, not a proof that no theta correspondence could ever help. Any useful new transfer would have to address nonalgebraic archimedean parameters and preserve enough information to exclude the original exceptional representation. The existing algebraic-weight statement does neither.

The same gap prevents importing the full Ramanujan conjecture for Maass forms from CaraianiTempered. Known temperedness of the cohomological class remains valid, but it does not quantify over the required Maass spectrum.

## 4. A direct obstruction for the full Artin conjecture

Artin's holomorphy conjecture asks for entireness of the L-function of every nontrivial irreducible finite-image complex Galois representation. Strong Artin asks for the corresponding automorphic representation. The general holomorphy problem remains open in the primary 2025 paper of Gun, Hazra and Sahu, [*On holomorphy and non-vanishing of Artin L-functions*](https://link.springer.com/article/10.1007/s00605-025-02060-7), introduction. Its pointwise and special-group criteria are not the universal conjecture.

Finite-image representations have the opposite Hodge--Tate behavior from the regularity required in Row0b.

**Multiplicity lemma.** Let r be a finite-image ell-adic representation of dimension n>1. At each ell-adic embedding all its Hodge--Tate weights are 0, with multiplicity n. Finite base extension preserves that multiplicity. Twisting by a de Rham character of weight h replaces the multiset by n copies of h. More generally, if W is any nonzero de Rham representation, every Hodge--Tate weight of r tensor W occurs with its multiplicity in W multiplied by n.

Proof: r becomes trivial after a finite extension. The Hodge--Tate multiset can be read after that extension, where it is n copies of the trivial representation's weight. Hodge--Tate weights are stable under restriction to finite extensions, shift under a character twist, and add under tensor products.

Thus scalar twists, finite restrictions, and the full tensor with a regular geometric representation do not turn r into a regular representation. This does not prohibit a new constituent construction with further input; no such construction with recovery of the original Artin L-function has been proved here.

There is also the direction problem: Row0b constructs a Galois representation from an already known regular algebraic cuspidal representation. Reversing that implication would require a reciprocity theorem. Neither the repeated-weight issue nor the reversed implication is addressed by ordinary Dirichlet GRH.

## 5. Named-target screen

| Full named target | Exact reason the inspected package does not settle it |
|---|---|
| Selberg's eigenvalue conjecture | Its possible complementary-series parameters fail the algebraic parameter-difference condition, which scalar twisting and archimedean CM base change preserve. |
| The Ramanujan conjecture | The traced finite-place temperedness statement is for conjugate-self-dual cohomological representations. This is already Caraiani's theorem and does not cover the full Maass spectrum. |
| Artin's holomorphy conjecture | Arbitrary finite-image representations have repeated Hodge--Tate weights; the traced correspondence also runs in the wrong direction for strong Artin. General Artin entireness is not supplied. |
| The Fontaine--Mazur conjecture | The input is an existing automorphic representation or existing automorphic attachment, not every irreducible geometric Galois representation. Nonregular representations and arbitrary base fields are not covered. |

The formulation of Fontaine--Mazur used in the last row is the geometric statement: an irreducible ell-adic representation unramified outside finitely many primes and de Rham at ell should arise, up to Tate twist, from smooth projective cohomology. For a statement reference, see Yang's [*A note on the Artin conjecture*](https://maths.inha.ac.kr/~jhyang/paper/artin.pdf), section 2, Conjecture A. That older reference is used for the formulation, not a current-status claim about particular two-dimensional cases.

No finite-rank or cohomological subcase in this table is promoted to a resolution of a full named conjecture. No exhaustive claim about every theorem in the archive is intended: this is an audit of the closed input chain feeding litN and the specific image/temperedness/descent statements found alongside it.

## 6. Two proposed quadratic-form bridges require a larger RH premise

Two suggestions from the parallel search were checked directly.

Kane's [*On two conjectures about mixed sums of squares and triangular numbers*](https://hkumath.hku.hk/~bkane/papers/mixed/mixed.pdf), Theorem 1.8, explicitly assumes both Dirichlet GRH and GRH for weight-two newform L-functions. Remark 1.9 identifies quadratic twists of elliptic-curve L-functions as the additional family.

Rouse's [*Quadratic forms representing all odd integers*](https://users.wfu.edu/rouseja/cv/451thm.pdf), proof of Theorem 7 in section 6, bounds expressions of the form
~~~math
\frac{\sqrt{L(F\otimes\chi_D,1/2)}}{L(1,\chi_D)}
~~~
for weight-two newforms F. Its invocation of Chandee's bounds concerns both the modular numerator and the Dirichlet denominator. The already traced theorem does not supply RH for those modular twists.

These are excluded transfers, not new solutions and not numerical cases offered as targets. Further novelty screening of these conditional classifications would be necessary only after the missing modular-L-function premise were actually supplied.

## 7. Reusable result and the next precise obligation

The strongest reusable source statement directly identified here is Row0b with its full regular-algebraic, polarized, CM hypotheses and its literal PropsB local conclusions. The cohomological temperedness result is also usable, with its existing prior-art attribution. Neither statement expands merely because it is packaged in a rank-N hypothesis.

The positive transfer work of this campaign is in [artin-density.md](artin-density.md), especially sections 13--16, and the triangular M3 replacement in [character-lifting.md](character-lifting.md). In particular, the finite-character congruence-depth bound is independent of the class number, and the Type II corner descends explicitly after its determinant twist.

The unresolved extension module is exactly
~~~math
V\otimes\operatorname{Ind}_{G_K}^{G_{\mathbb Q}}\nu,
~~~
where V is the odd descended rank-two representation and nu is a finite anti-cyclotomic class character. A strict Selmer-vanishing theorem, or an adequate quantitative integral substitute, for this module is the concrete next input needed by the proposed twisted OneChar argument. Section 17 of artin-density.md proves that the usual rank-one Rankin Euler-system criterion cannot provide it because its one-dimensional fixed-quotient condition is impossible.

That is a specific remaining arithmetic theorem. The present screen found no full named automorphic conjecture whose missing premise is already furnished by the inspected archive package.
