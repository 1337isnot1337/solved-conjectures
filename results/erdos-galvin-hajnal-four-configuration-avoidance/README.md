# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

[Problem 9/C (1975)](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=58) asks whether an $`\aleph_1`$-chromatic triple system on $`\omega_1`$ can omit $`\mathcal T_1,\mathcal T_3,\mathcal T_4,\mathcal T_9`$ simultaneously.

**Candidate answer:** the existence statement is independent of ZFC, relative to the consistency of ZFC. A precaliber-$`\aleph_1`$ forcing of size $`\aleph_1`$ produces a witness omitting all four and can preserve CH. In a different model, a rainbow partition into countably many classes rules out every such witness.

- [Proof](PROOF.md)
- [Priority and source audit](PRIOR-ART.md)
- [Finite checks of the local amalgamations](check_amalgamation.py), which do not replace the forcing proof. Run with Python 3; expected counts: 3,252 free unions and 14,571 marked-triple extensions.

Coordination: [issue #1059](https://github.com/1337isnot1337/solved-conjectures/issues/1059). No Lean and no external referee report.

[**Cohen forcing strengthening.**](COHEN-PRODUCT.md) In every extension by \(\omega_1\) Cohen reals, the same four-pattern witness exists. The proof uses sealed low pages to obtain complete projections onto countable initial segments.
