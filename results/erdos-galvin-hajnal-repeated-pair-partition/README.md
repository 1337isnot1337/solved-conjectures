# Erdős–Galvin–Hajnal’s repeated-pair partition problem

Erdős, Galvin and Hajnal asked in 1975 whether every triple system on the first uncountable ordinal contains either an uncountable independent set or the six-vertex repeated-pair configuration in their Diagram 5. Cinna Davis’s proof shows that this assertion, Problem 8/D, is independent of ZFC relative to its consistency. The positive model follows from a reduction to pair-rainbow coloring. The negative model preserves CH when started over CH and simultaneously omits the neighboring Pasch configuration from Problem 8/C. The possibility of a positive model for 8/C is tracked separately. [Original question](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=49) · [Open Pasch direction](https://github.com/1337isnot1337/solved-conjectures/issues/1052)

- [Independence theorem and positive model](PROOF.md)
- [Simultaneous negative model](NEGATIVE-MODEL.md)
- [Source and prior-art comparisons](PRIOR-ART.md)
- [Independent internal mathematical review](REVIEW.md)
- [Reproducible check of the finite amalgamation cases](verify_amalgamation.py)

The proof is written and internally reviewed. It has no Lean formalization. Run `python3 verify_amalgamation.py` in this directory to repeat the finite check.
