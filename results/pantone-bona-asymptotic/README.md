# Pantone–Bóna’s asymptotic conjecture

**Proved.** The number of permutations that avoid all four patterns `12354`, `12453`, `13452`, and `23451` is asymptotic to $10^n/n^4$ times exactly $625\sqrt3/(192\pi)$.

The argument refines the authors’ front–tail decomposition to count each permutation once. In the limit, the split is canonical with the probability that a random geometrically stopped word contains a specified descending subsequence. The same method gives the leading constant for every $A_{k,k}$.

- [Complete written proof](PROOF.md)
- [Primary sources and independent audit](AUDIT.md)
- [Exact supplementary checks](verify.py)
- [Discovery and review, issue #377](https://github.com/1337isnot1337/solved-conjectures/issues/377)

The asymptotic proof does not rely on finite checks. A [shorter tableau proof](tableau-proof.md) also gives an exact hook sum. That sum leads to a separate [proof of the authors’ guessed differential equation](ode-proof.md) by rational-function certificates. No Lean verification or external refereeing is claimed.
