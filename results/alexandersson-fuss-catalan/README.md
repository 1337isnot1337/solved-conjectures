# Alexandersson's Fuss–Catalan conjecture

**Status: proved as a short deduction from classical results; priority qualified.**

**Lean status: partial.** `Conjectures.FussCatalan` proves the closed-form polynomial is real-rooted, including the constant boundary case. `Conjectures.FussCycle` proves the cycle lemma, aperiodicity and the exact one-in-L count for rotation-invariant finite collections of integer sequences summing to −1. `Conjectures.FussCounting` verifies the exact binomial count of abstract slot selections and positive allocations. The bijections to block sequences and actual Fuss–Dyck paths remain; the combined repository gate is pending.

For every $m,n\geq1$ and $1\leq k\leq n$, the polynomial counting $m$-Dyck paths with exactly $k$ factors $NE$, by the number of factors $NNE$, is real-rooted. The Fuss parameter changes this polynomial only by a positive scalar.

The exact refinement is classical Kreweras/cycle-lemma enumeration. Its real-rooted binomial factor is already proved in the ordinary-Dyck work of Bóna et al. and Wang–Zhang. This note identifies their uniform scalar reduction for the conjecture still listed by Alexandersson and supplies a self-contained proof. It does not claim a new enumeration or root-preserving method.

## Exact formula

Let the paths have $n$ north steps and $mn$ east steps, staying weakly above $y=x/m$. For $n>k$,

```math
W_{n,k}^{(m)}(t)
 =\frac1{mn+1}\binom{mn+1}{k}
   \sum_{i=1}^{\min(k,n-k)}
        \binom ki\binom{n-k-1}{i-1}t^i.
```

For $n=k$ the polynomial is the positive constant $\binom{mn+1}{n}/(mn+1)$. Therefore

```math
W_{n,k}^{(m)}(t)
 =\frac{(n+1)\binom{mn+1}{k}}
        {(mn+1)\binom{n+1}{k}}
    W_{n,k}^{(1)}(t).
```

When $n>k$, there is one simple zero at zero and $\min(k-1,n-k-1)$ simple negative zeros. The proof covers every parameter simultaneously. It also transfers the previously established root-order statements for the ordinary-Dyck family.

## Proof and audit

[PROOF.md](PROOF.md) gives the exact cyclic-block count and an elementary Rolle argument for the binomial factor. It includes the empty-path convention, constant boundary, orbit periodicity issue, endpoint multiplicities and degree count. An independent reviewer checked the full argument.

[NOVELTY.md](NOVELTY.md) records the prior-work audit and classical attributions. No explicit earlier statement resolving this exact named Fuss conjecture was found in the inspected sources. Alexandersson–Leite's recent graph-peaks full text could not be retrieved, so an unconditional priority claim is not justified.

[verify.py](verify.py) independently enumerates 10,188 paths across 18 small parameter pairs to check the source convention and coefficient formula. It does not approximate roots and is not a proof step. Run it with Python 3; it has no external dependencies.

Conjecture sources:

- https://www.symmetricfunctions.com/realRootedOpenProblems.htm
- https://www.symmetricfunctions.com/realRootedCatalan.htm

Coordination and review: [issue #95](https://github.com/1337isnot1337/solved-conjectures/issues/95).
