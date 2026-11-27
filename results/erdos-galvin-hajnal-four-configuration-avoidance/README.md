# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

[Problem 9/C (1975)](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=58) asks whether an $`\aleph_1`$-chromatic triple system on $`\omega_1`$ can omit $`\mathcal T_1,\mathcal T_3,\mathcal T_4,\mathcal T_9`$ simultaneously.

**Candidate answer:** the existence statement is independent of ZFC, relative to the consistency of ZFC. CH alone gives a witness omitting all four. Independently, adding a single Cohen real works over any ZFC ground, even when CH fails. In a different model, a rainbow partition into countably many classes rules out every such witness.

- [Direct CH proof and the negative consistency proof](CH-WITNESS.md), which together give the independence argument in one file.
- [One-Cohen proof](ONE-COHEN.md)
- [Original independence proof](PROOF.md)
- [Priority and source audit](PRIOR-ART.md)
- [Finite checks of the path-selection rules](check_path_selection.py) (2,268 exhaustive finite path systems and 5,000 seeded record-selection tests).
- [Finite checks of the local amalgamations](check_amalgamation.py), which do not replace the forcing proof. Run with Python 3; expected counts: 3,252 free unions and 14,571 marked-triple extensions.

Coordination: [issue #1059](https://github.com/1337isnot1337/solved-conjectures/issues/1059). No Lean and no external referee report.

[**Cohen forcing strengthening.**](COHEN-PRODUCT.md) In every extension by \(\omega_1\) Cohen reals, the same four-pattern witness exists. The proof uses sealed low pages to obtain complete projections onto countable initial segments.

[**Preservation under σ-linked forcing.**](https://github.com/1337isnot1337/solved-conjectures/commit/2c86515e0a47dbd4af29b88bbd09879ea35ee25c) The same one-Cohen witness remains uncountably chromatic after σ-linked forcing and arbitrary-length finite-support iterations of such posets. In particular the positive side is consistent with full Martin’s Axiom restricted to σ-linked posets. The supplement does not assert the positive side under unrestricted MA.
