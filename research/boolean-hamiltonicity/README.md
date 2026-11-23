# Boolean P versus NP via directed Hamiltonicity

## Status

Research remains open. This package proves coefficient identities, exact
restrictions, and obstructions to several proposed transfers from arithmetic
to Boolean circuit lower bounds. It does not prove P != NP, a superpolynomial
unrestricted Boolean circuit lower bound, or a uniform time lower bound.

Tracking: [issue #251](https://github.com/1337isnot1337/solved-conjectures/issues/251).
Related campaigns are [#247](https://github.com/1337isnot1337/solved-conjectures/issues/247)
on the permanent graph in the complex BSS model and
[#248](https://github.com/1337isnot1337/solved-conjectures/issues/248)
on P_C versus NP_C. Their algebraic decision models are different from the
Boolean model defined below.

## Exact target and quantifiers

For an integer $`m\ge3`$, encode a loopless labelled directed graph by the
$`N=m(m-1)`$ possible arc bits. Both opposite arcs are allowed.
Let $`C_m`$ be its Hamiltonian-cycle containment predicate and $`I_m`$ its
exact-cycle predicate. A directed cycle is counted once, independently of
its starting vertex.

An unrestricted Boolean circuit is a finite acyclic circuit with binary
AND/OR gates, unary NOT gates, input bits, and constants. Fan-out is
unrestricted. Size is the number of internal gates. Write $`s(m)`$ for the
least size of a circuit computing $`C_m`$ correctly on every graph input.

The sufficient nonuniform target is

```math
\forall k\in\mathbb N\ \forall M\in\mathbb N\
\exists m\ge\max(3,M):\quad s(m)>m^k.
```

This says that the family is outside $`\mathsf{P/poly}`$. An eventual
bound $`s(m)=m^{\omega(1)}`$ would be stronger. These are not equivalent
quantifier statements. Polynomial size in $`m`$ and in $`N`$ is equivalent
because $`N=m(m-1)`$.

The alternative uniform target is that no single deterministic Turing
machine decides all these instances in time polynomial in $`N`$.
For a complete language encoding, reject lengths that are not of the form
$`m(m-1)`$, and fix the finitely many smaller instances arbitrarily.
This convention does not affect either target.

### Why either target would imply P != NP

Containment is in NP: a certificate lists a cyclic ordering of the
vertices. Check that each vertex occurs exactly once and that all its
successive arcs are present. Both checks take polynomial time.

A deterministic time-$`T(N)`$ machine can be unrolled into a Boolean
circuit of polynomial size in $`T(N)+N`$: encode its bounded tape and
control configuration, implement one transition by a circuit of polynomial
size, and concatenate $`T(N)`$ transition layers. The machine and input
length determine this circuit by a polynomial-time construction when
$`T`$ is polynomial. Thus $`\mathsf P\subseteq\mathsf{P/poly}`$.
Proving the nonuniform target would put a language in NP outside
P/poly and hence outside P. Proving the uniform target directly would
also put this language in NP outside P. The uniform conclusion by itself
does not imply the nonuniform conclusion.

Karp's Main Theorem, item 9, also establishes that DIRECTED HAMILTON CIRCUIT
is NP-complete under polynomial-time many-one reductions. Therefore the
uniform target is equivalent to P != NP. The nonuniform target is
equivalent to $`\mathsf{NP}\not\subseteq\mathsf{P/poly}`$: if a complete
language had polynomial circuits, composing them with the polynomial
circuits for reductions would put every NP language in P/poly.
The source and encoding details are in [SOURCES.md](SOURCES.md).

## Proved checkpoints

| Claim | Proof |
| --- | --- |
| $`I_m`$ and $`C_m`$ agree on all graphs with at most $`m`$ arcs; their degree-$`m`$ multilinear components are both $`HC_m`$ | [LAYERS.md, Sections 1–2](LAYERS.md#2-the-shared-minimal-layer) |
| $`I_m`$ has polynomial-time uniform circuits of size $`O(m^3)`$ | [LAYERS.md, Proposition 2.2](LAYERS.md#2-the-shared-minimal-layer) |
| Every higher coefficient of $`C_m`$ is an alternating sum over families of cycles with a prescribed union | [LAYERS.md, Proposition 3.2](LAYERS.md#3-all-higher-coefficients) |
| The next two homogeneous components vanish; the degree-$`m+3`$ terms are exactly pair-overlap unions, each with coefficient $`-1`$ | [LAYERS.md, Theorem 4.2](LAYERS.md#4-the-first-overlap-layer) |
| A restriction adding two vertices makes $`I_{m+2}`$ identically zero while preserving $`C_m`$ and the ordinary polynomial $`HC_m`$ | [LAYERS.md, Theorem 5.1](LAYERS.md#5-a-restriction-that-kills-the-exact-predicate-and-preserves-containment) |
| Rank has multiplicative AND bounds and complement-stable variants, but the resulting bounds do not prove the target | [INVARIANTS.md](INVARIANTS.md) |
| Even with the exact-cycle predicate identically zero, a Hamiltonicity restriction can have exponential cut rank and a linear-size monotone formula | [INVARIANTS.md, Proposition 4.1](INVARIANTS.md#4-an-explicit-hamiltonicity-restriction-with-zero-exact-cycle-predicate) |
| Linear-size monotone formulas can have exponential truth-table and coefficient rank at every balanced variable cut, over every field | [ALL_CUTS.md](ALL_CUTS.md) |

These statements are elementary deductions or applications of established
methods. They are not presented as newly resolved conjectures. The
restriction that preserves containment supplies the requested reduction
checkpoint; it supplies no unproved hardness conclusion about that family.

## The unresolved implication

A successful invariant $`\mu`$ would need a lower bound on the whole
containment predicate, invariant under its different Boolean circuit
representations, and an upper bound on every size-$`s`$ unrestricted circuit.
For example, a superpolynomial lower bound in $`m`$ together with

```math
\mu(f)\le (N+s+1)^a
```

for some fixed constant $`a`$ would suffice. Gate inequalities must imply
this circuit-size bound with arbitrary negations, repeated input variables,
and shared subcircuits. A formula-size bound obtained by unfolding the
circuit DAG is not such a bound.

No invariant satisfying those requirements is proved here. The polynomial
extension of a Boolean predicate can be arithmetically hard even when
the predicate is easy; Hrubeš's Theorem 1 establishes this for monotone
2-CNFs under the arithmetic separation. The pinned Anthropic source itself
identifies the Boolean-ideal obstruction in Section 2.5. Counting cycles
modulo two does not remove the gap: the complete directed graph on three
vertices has two Hamiltonian cycles, so parity is zero and containment is one.

## Verification

The standard-library checks are:

```bash
python3 research/boolean-hamiltonicity/verify_layers.py
python3 research/boolean-hamiltonicity/verify_invariants.py
```

The first script compares independent truth-table and inclusion-exclusion
computations and checks the restriction by actual cycle enumeration. The
second uses exact rational and finite-field ranks and independently
enumerates cycles in the restriction gadgets. Finite checks support the
explicit examples; the written proofs establish the stated general
lemmas. No Lean formalization or independent rebuild of the upstream
arithmetic lower bound is claimed.

