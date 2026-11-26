# Builder–Blocker general position complexity conjecture

**Proved.** The decision problems for both starting orders in the Builder–Blocker general position game are PSPACE-complete, even on graphs of diameter two.

This resolves both parts of [Klavžar, Tian and Tuite, Conjecture 11](https://doi.org/10.22049/cco.2024.29122.1854). In the Builder-start game, a large universal clique forces the maximizing player's opening; in the Blocker-start game, a large set of leaves forces the minimizing player's opening. Once the universal vertex is played, the remaining choices simulate the optimization version of Node Kayles.

[Proof](PROOF.md) · [Audit and priority search](AUDIT.md) · [Exact minimax checker](verify.py) · [Tracking issue #916](https://github.com/1337isnot1337/solved-conjectures/issues/916)

**Verification:** Complete written proof and an exact minimax regression. No Lean formalization or external referee review is claimed.
