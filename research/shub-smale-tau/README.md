# Shub–Smale τ-conjecture

Status: open research. This work proves neither the conjecture nor its negation. It does not prove a BSS separation.

Tracking: [issue #260](https://github.com/1337isnot1337/solved-conjectures/issues/260). Related BSS research: [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## Exact target

A program starts with $1,x$. Each gate adds, subtracts, or multiplies two previously available values; reuse is allowed and division is forbidden. The gate count is its length. Let $\tau(f)$ be the minimum length producing $f$. The target is

```math
\exists C>0\ \forall f\in\mathbb Z[x]\setminus\{0\},\qquad
\#\{a\in\mathbb Z:f(a)=0\}\le(1+\tau(f))^C.
```

Roots are distinct, with no multiplicity count. Arbitrary free integer constants are not part of this model.

## Established statements and their limits

| Statement proved or reconstructed | What it establishes |
| --- | --- |
| Exact input-block, translation, carry and product recursions | The identities needed to formulate the proposed invariant; floor and residue operations are not treated as free SLP gates. |
| The primitive squarefree polynomial $(1+x)^{2^n-1}-1$ has maximal evaluation and binary coefficient rank at every cut | Both rank tables are exponentially large for a program of at most $2n$ gates with only one integer root. |
| A primitive squarefree integer multiple can have exactly the prescribed integer roots and constant first nonzero jets | Divisibility, multiplicity removal and coefficient-content removal cannot force high first-jet rank. |
| The product of distinct nonzero integer roots divides the first nonzero coefficient | A cofactor-robust lower bound for consecutive roots, and a weak improvement over the degree bound for arbitrary integer roots. |
| Short constants can have superpolynomially many distinct prime divisors | Counting prime support does not provide a polynomial gate budget either; the cyclotomic argument is elementary. |
| A unit-resultant addition restriction is equivalent to τ | Even two real-root-free coprime inputs with resultant of absolute value one retain the full root-count question. |
| Rank after selecting the positive integer roots is equivalent to τ | A weighted determinant proof gives the desired lower bound for every root configuration, but the polynomial circuit upper bound is unresolved. |
| Exact weighted collision and cancellation identities | A valid prime-averaging calculation with its height dependence; no polynomial circuit bound for its cancellation term. |
| Squarefree-exponent modular root average | A short circuit can have a superpolynomial uniform-residue average of modular root counts despite having only two integer roots. |
| Classical Shub–Smale BSS transfer, including machine constants | Superpolynomial complexity for every nonzero multiple of the consecutive-root polynomial would suffice for the uniform complex BSS separation. |
| Rational-root and monic-input formulations are equivalent to the stated conjecture | Explicit transformations cost at most 6s+2 and 24s+20 gates; constants, denominator clearing and zero registers are included. |
| A coefficient-sensitive larger-sieve inequality | A precise reciprocal modular-root average would suffice for arbitrary roots; its circuit bound through addition remains unresolved. |
| Every finite prescribed set of prime-adic cut-minor valuations can be imitated | A short approximate inverse with at most three integer denominator roots matches all these valuations. Exact inversion and adaptive prime selection remain different requirements. |
| Matrix-power and quadratic-chain restrictions | Integer evaluation bounds the relevant cyclotomic degrees; lattice collisions give d ≥ (7/6)log₂N−6 for a quadratic composition constant on N consecutive integers. Neither covers general SLPs. |
| Endpoint-anchored extraction with a cofactor-degree parameter | A size-s program for F_N Q yields a nonzero scalar multiple of F_N in O((s+1)(q+1)^4+log(N+1)) gates, where q=deg Q. The construction does not need a program for Q; q may still be exponential in s. |
| Powered cofactors with supplied bases of small total degree | A shifted Bezout identity removes arbitrary powers with only logarithmic dependence on the exponents. The construction returns a nonzero integer scalar multiple of F_N and permits overlap with the prescribed roots. |
| Unknown cofactors with few distinct complex roots | A length-s program for F_N Q gives a nonzero integer scalar multiple of F_N in O((s+1)(d+1)^14) gates, where d=deg rad(Q). No cofactor circuit or factorization is supplied. The choices are nonuniform, and d may be exponential. |
| Integer gate budgets | A coprime addition has a product-of-parent-values resultant budget; units on five integer evaluation points have one sign; bounded smaller-summand values give an integer escape bound. Arbitrary addition cancellation remains unbounded. |
| Adaptive evaluation-prime support | The monic primitive squarefree family x^(n+1)−x has at most three integer roots, while every nonzero integer evaluation can have superpolynomial prime support relative to its circuit length. Adaptive anchor selection cannot fix that proposed bound. |
| Root-parity and multiplicity selectors | Neighboring shifted gcds retain half-integer roots even for F_N. A charged O(k^3)-gate integer polynomial realizes 2^k−1 positive multiplicity classes but at most two integer roots. Neither supplies the missing root selection. |
| Truncated integer-root collision energy | Consecutive integers minimize the energy prime by prime. Products and first-zero histories have exact laws, but the proposed polynomial addition bound is proved equivalent to τ and remains unresolved. |
| Primitive powers at root births | At most 2s+1 nonzero primitive-exponent equations, each with O((s+1)^2) charged gates, cover all real roots. Their shared prefixes retain the unrestricted root problem. |
| Polynomial-order jets of the coalescing Boolean inverse | An explicit integer recurrence computes every jet through order R in polynomially many gates in n,R. The degeneration merges the separated integer poles. |
| Exact Frobenius selection and finite precision | A selected permutation has a rational polynomial representative exactly when it is central in the Galois group; an explicit quadratic Newton lift never equals its limit at a finite stage. |
| Dense integer roots in variable square chains | More than half the degree forces prime divisibility and even valuations; more than three quarters forces valuation doubling. A six-root degree-eight example makes the latter threshold strict. |
| Separate charged height and real additive complexity | The coefficient bound $\log_2\lVert f\rVert_1\le a2^m$ and integer-root divisibility improve the earlier exponential estimate by a factor of order sqrt(s). The consecutive-multiple lower bound gains a logarithmic term. These are classical-theorem consequences. |
| Exact obstruction to extending the first Bremner family | An explicit rational quotient and resultant exclude every nondegenerate rational prefix collision within the displayed first elliptic family and its Hadamard transforms. Other families and unbounded depth remain unresolved. |
| Complete pairing test for the two displayed elliptic families | Exact resultants, two congruence-lattice certificates and seven rational fibers exclude every proposed lift drawn from either family or its Hadamard transform. The outside-family example prevents promotion to an arbitrary-chain theorem. |
| Missing-prime and difference-group selection | A polynomial bound for the least prime not dividing a short nonzero constant is equivalent to a positive-power ultimate-factorial lower bound. The stated S-unit reduction remains exponential in group rank. |
| The displayed elliptic families are not exhaustive | An exact signed-relation certificate places a Paul/Bremner 16-root example outside both families and all their Hadamard images under rational scaling, labels and signs. |
| Rational torsion in a polynomial elliptic family | Mazur's theorem gives at most 262δ rational roots of a nonzero specialized division polynomial, independent of its index, and a fixed-cost bounded-index root cover. This is a consequence of existing theorems. |

The general quantitative bounds recorded here are consequences of existing theorems and algorithms:

```math
N_{\mathbb Z}(f)\le\min\left\{1,\frac{32}{\sqrt{s+1}}\right\}2^{s-h_K(s)},\qquad h_K(s)=\frac{\sqrt{1+4Ks}-1}{2K},
```

```math
n+\sqrt{n/K}+\tfrac12\log_2 n-1\le\mu(n)
:=\min_{0\ne h\in\mathbb Z[x]}\tau\left(h\prod_{j=1}^{2^n}(x-j)\right)
\le C_\varepsilon 2^{(1/2+\varepsilon)n}.
```

Here K is an absolute constant from Risler's real additive-complexity bound. The older bound 2^(s−h_K(s)) also holds for real roots. CHARGED_HEIGHT.md improves the integer-root estimate by a factor of order sqrt(s), using log₂||f||₁≤a2^m and integer-root divisibility, where a and m count the two gate types. The consecutive-multiple lower bound holds for n≥1 and arbitrary cofactors; it adds only a logarithmic correction to the earlier linear lower bound. A stronger attempted p-adic bound is retained only conditionally because an unrestricted tropical-valuation step in its cited proof fails. The upper bound reconstructs the classical block-product algorithm, including constant construction and denominator clearing. In particular every possible exponent in the full conjecture must be at least 2, as Smale already recorded in 1998. The earlier elementary factorial-divisibility estimate remains in ARITHMETIC.md. None of these bounds proves the full conjecture or the superpolynomial consecutive-root lower bound. No novelty is claimed for these theorem combinations or the classical BSS implication.

The consecutive-root minimum is also equivalent up to linear circuit overhead to a charged circuit problem for polynomial representatives of the inverse of a binary-value polynomial on the Boolean cube. This handles arbitrary cofactors; converting a representative into its multilinear normal form remains an unproved additional step.

## Proofs and source scope

- [ANCHORED_DIFFERENCES.md](ANCHORED_DIFFERENCES.md): exact endpoint-sensitive cofactor reduction, a division-free quotient matrix, and the precise scope of universal shift and probe obstructions.
- [POWERED_COFACTORS.md](POWERED_COFACTORS.md): charged Bezout construction, logarithmic power lifting, and extraction for cofactors of small total base degree.
- [COFACTOR_RECOVERY.md](COFACTOR_RECOVERY.md): recovery of an unknown small radical support from a shifted logarithmic derivative, with charged Padé reconstruction and multiplicity selection.
- [INTEGER_GATE_BUDGETS.md](INTEGER_GATE_BUDGETS.md): unit rigidity, resultant divisibility, an integer escape invariant, a valid two-anchor S-unit reduction and its adaptive-support obstruction.
- [ROOT_SELECTION.md](ROOT_SELECTION.md): coefficient parity versus root parity, charged many-multiplicity examples and translation-boundary failures.
- [COLLISION_ENERGY.md](COLLISION_ENERGY.md): a universal arithmetic minimum, exact product/history laws, and a proof that the missing polynomial energy bound is τ-equivalent.
- [PRIMITIVE_BIRTHS.md](PRIMITIVE_BIRTHS.md): a charged covering by primitive exponent equations at the first vanishing register, with arbitrary root configurations.
- [INVERSE_DEFORMATIONS.md](INVERSE_DEFORMATIONS.md): the integer recurrence for all finite coalescing jets, spacing-preserving Newton lifts, and endpoint indicators.
- [FROBENIUS_SELECTION.md](FROBENIUS_SELECTION.md): coefficient fields of selected Galois permutations, exact Newton cost and precision, and a never-exact quadratic example.
- [HARMONIC_FAMILIES.md](HARMONIC_FAMILIES.md): reciprocal fixed-point averages for binomial products and integer quadratic iterates, an intersective-iteration failure, and a classical Schur test of addition rules.
- [DENSE_SQUARE_CHAINS.md](DENSE_SQUARE_CHAINS.md): prime divisibility with an unknown cofactor, precise root-density thresholds, and the distinction between coefficient bit length and circuit length.
- [SQUARE_CHAIN_EXTENSION.md](SQUARE_CHAIN_EXTENSION.md): the charged Bremner construction, exact prefix-extension equations, and a complete rational-collision obstruction for its first displayed family.
- [SQUARE_CHAIN_SECOND.md](SQUARE_CHAIN_SECOND.md): an explicit second-family map, common-rotation restriction and complete certificates for the stated cross-family and ordinary self-prefix obstructions.
- [SQUARE_CHAIN_COMPLEMENT.md](SQUARE_CHAIN_COMPLEMENT.md): the complementary-prefix resultant, exact rational-root lattice lemma and completed two-family pairing test.
- [NONRATIONAL_POLE_FILTERS.md](NONRATIONAL_POLE_FILTERS.md): exact retention of nonrational poles under fixed translated/differential filters, with explicit coefficient-degree and universal-probe limits.
- [RATIONAL_POLE_SELECTION.md](RATIONAL_POLE_SELECTION.md): a smaller irreducible-factor shift bound, equal long jets with different rational-pole parts and the charged consequence of a hypothetical projector.
- [SQUARE_CHAIN_SCOPE.md](SQUARE_CHAIN_SCOPE.md): the explicit Paul/Bremner counterexample to exhaustion by the two elliptic families and their Hadamard images.
- [CHARGED_HEIGHT.md](CHARGED_HEIGHT.md): the unrestricted charged-height refinement, its all-multiples counterpart and exact discriminant obstructions.
- [SELECTION_SCOPE.md](SELECTION_SCOPE.md): the precise strength of a missing-prime rule and the quantitative limitation of difference-group ranks.
- [SOURCE_REFRESH_2026.md](SOURCE_REFRESH_2026.md): recent factor, GCD and radical results with their input-degree and constant-model dependencies.
- [ELLIPTIC_SPECIALIZATIONS.md](ELLIPTIC_SPECIALIZATIONS.md): the rational-torsion root bound and a root cover whose additional circuit cost is independent of the multiplication index.
- [NORMALIZATION.md](NORMALIZATION.md): fully charged rational-to-integer and monic transformations, with arbitrary intermediate cancellation.
- [PRIME_AVERAGES.md](PRIME_AVERAGES.md): exact integer and projective-rational sieve inequalities, harmonic averages and a multiquadratic local-cover test.
- [CIRCUIT_HISTORY.md](CIRCUIT_HISTORY.md): complete-history obstructions, explicitly conditional square compression, real power comparisons and simultaneous Galois selection.
- [INVERSE_TESTS.md](INVERSE_TESTS.md): positive-characteristic exact inverses, unknown multiplicities, finite-prime imitations and the scope of factor extraction.
- [ORACLE_FACTORS.md](ORACLE_FACTORS.md): low-degree factors of small arithmetic circuits with arbitrary unary polynomial gates have polynomial border complexity; ordinary compositions and factor extraction cannot supply the proposed transfer.
- [INTEGER_SPECIALIZATIONS.md](INTEGER_SPECIALIZATIONS.md): matrix-power roots, uniform extraction of a positive factorial multiple, translations and rational Chebyshev levels.
- [FOLD_CHAINS.md](FOLD_CHAINS.md): a charged constructive candidate, finite witnesses and a restricted lattice-based depth lower bound.
- [GATE_COUNTS.md](GATE_COUNTS.md): a real-root tradeoff from separate gate counts, a precise arithmetic source dependency, complete-history cancellation, and the precise S-unit quantifier issue.
- [BLOCK_PRODUCTS.md](BLOCK_PRODUCTS.md): a fully charged proof of the classical square-root upper bound, Newton multiplication, and fixed-divisor obstructions.
- [BOOLEAN_INVERSE.md](BOOLEAN_INVERSE.md): a linear-cost equivalence for all consecutive-root multiples, exact Cauchy structure, and the unresolved Boolean quotient step.
- [PROOF.md](PROOF.md): exact weaker target, self-contained reconstruction of its BSS consequence, factorial implication and explicit missing step.
- [CONSECUTIVE.md](CONSECUTIVE.md): digit recursions, uniform all-cuts rank proof and finite-sampling obstructions.
- [JETS.md](JETS.md): normalized Taylor coefficients, cancellation depth and an explicit multiplier with identical positive derivatives at every prescribed root.
- [ARITHMETIC.md](ARITHMETIC.md): coefficient divisibility, arbitrary root sets, all-prime collision identity, cancellation and the known fixed-p-adic counterexample with its proof.
- [BEZOUT_BARRIER.md](BEZOUT_BARRIER.md): an exact reduction showing that the restricted cancellation problem is equivalent to τ.
- [ROOT_SELECTED_RANK.md](ROOT_SELECTED_RANK.md): an invariant that sees arbitrary integer roots, its exact rank and the equivalent missing circuit bound.
- [MODULAR_AVERAGE.md](MODULAR_AVERAGE.md): an exact CRT average and its circuit cost.
- [SOURCES.md](SOURCES.md): pinned imported theorem interfaces, implications in the supplied sources, recent prior-result checks and the finite-completion obstruction.
- [REVIEW.md](REVIEW.md): mathematical review and the scope of exact checks.

The Anthropic result at commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5` is accepted as the standing repository premise. The inspected statements give permanent/HC circuit and border lower bounds. A reduction from a short polynomial with many integer roots to a small permanent circuit has not been obtained. The forward implication alone does not establish its converse.

## Reproduction

Run from the repository root:

```bash
python3 research/shub-smale-tau/verify.py
```

The verifier uses the Python standard library and exact arithmetic. Most checks cover finite instances of identities and counterexamples. The square-chain resultant certificates additionally prove complete algebraic identities: each has a proved degree bound and is checked at more distinct points than that degree. Their rational-root exclusions are exhaustive finite-field checks. These certificates support the stated restricted theorems; they do not verify the full conjecture. No Lean verification is claimed.

## Missing result

For the consecutive-root BSS route, prove that $\mu(n)$ is not polynomially bounded. For the full τ-conjecture, prove the displayed integer-root inequality for every root configuration. The existing bounds, rank obstructions and arithmetic identities do not supply either conclusion. These files remain in `research/` and are not a solved-results entry.
