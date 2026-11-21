# Coulter–Do–Moskovsky's conjecture

Research package for published Conjecture 3.15 in *Integration on complex Grassmannians, deformed monotone Hurwitz numbers, and interlacing phenomena* (arXiv:2308.04015; Canadian Journal of Mathematics, 2025). [Issue 193](https://github.com/1337isnot1337/solved-conjectures/issues/193).

The [asymptotic theorem](ASYMPTOTIC.md) proves every predicted limiting root and eventually strict monotone convergence for every fixed profile. The proof computes the two largest character poles and an exact connectedness cancellation. It also proves eventual real-rootedness and simplicity. The [independent mathematical audit](AUDIT.md) passed.

The [scope note](SCOPE.md) distinguishes this asymptotic result from monotonicity beginning at genus zero. The stronger all-genus statement is false: profile (2,2) has an exact initial reversal. Both witness polynomials already appear in the authors' earlier data, which is credited. The published conjecture begins with genus tending to infinity, so this package is not presented as a wording-only disproof. It remains outside the strict completed-conjecture tally.

The [exact checker](verify.py) compares character sums with the independent cut-and-join recurrence and checks both residue formulas. [Recorded output](verification.json): 112 recurrence comparisons and 46 exact residue comparisons passed. These finite diagnostics support the derivation; the manuscript supplies the general proof. The separate [initial-reversal checker](verify_initial_reversal.py) enumerates monotone transitive factorizations directly and certifies the two root movements with exact arithmetic. No Lean work.

The [independent priority review](PRIORITY.md) records the primary-source checks, later-paper comparisons, global issue and public-corpus searches, and their limits. No earlier all-profile asymptotic theorem was located. The initial-reversal polynomials are traced back to Moskovsky's 2022 thesis.
