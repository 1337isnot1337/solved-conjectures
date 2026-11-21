# Coulter–Do–Moskovsky's conjecture

Research checkpoint for published Conjecture 3.15 in *Integration on complex Grassmannians, deformed monotone Hurwitz numbers, and interlacing phenomena* (arXiv:2308.04015; Canadian Journal of Mathematics, 2025). [Issue 193](https://github.com/1337isnot1337/solved-conjectures/issues/193).

The [asymptotic manuscript](ASYMPTOTIC.md) proves all predicted limits and eventually strict monotone convergence for every fixed profile, using the two largest character poles and an exact connectedness cancellation. It also proves eventual real-rootedness and simplicity. Monotonicity from genus zero is not established. The [independent audit](AUDIT.md) passed the mathematical argument and checked the published statement directly. Its monotonicity clause has no eventual qualifier, so this remains a partial result and adds no completed-conjecture count.

The [exact checker](verify.py) compares character sums with the independent cut-and-join recurrence and checks both residue formulas. [Recorded output](verification.json): 112 recurrence comparisons and 46 exact residue comparisons passed. These finite checks support the derivation; the manuscript supplies the general proof. Run `python verify.py` with Python and SymPy. No Lean work.
