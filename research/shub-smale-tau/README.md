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

The quantitative elementary bounds are

```math
\mu(n):=\min_{0\ne h\in\mathbb Z[x]}
\tau\left(h(x)\prod_{j=1}^{2^n}(x-j)\right)
\ge 1+\log_2\log_2((2^n)!)
=n+\log_2 n+1+o(1)
```

for $n\ge1$, and

```math
\#\{a\in\mathbb Z:f(a)=0\}=O(2^s/s)
```

for a nonzero length-$s$ output as $s$ grows. These estimates remain far below the requested strength. No novelty is claimed for these elementary estimates or the classical BSS implication.

## Proofs and source scope

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

The verifier uses the Python standard library and exact arithmetic. It checks finite instances of identities and counterexamples. The general statements rest on their written proofs. No Lean verification or full-conjecture verification is claimed.

## Missing result

For the consecutive-root BSS route, prove that $\mu(n)$ is not polynomially bounded. For the full τ-conjecture, prove the displayed integer-root inequality for every root configuration. The existing bounds, rank obstructions and arithmetic identities do not supply either conclusion. These files remain in `research/` and are not a solved-results entry.
