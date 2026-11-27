# Zhang’s uncountable triple rainbow problem

[Question 5.5](https://jingjzzhang.github.io/EvenMoreResultsRainbowRamsey.pdf#page=15) asks whether every 2-bounded colouring of triples of the first uncountable ordinal can consistently have an uncountable rainbow, and whether PFA implies that.

**Candidate answer: no, in ZFC.** Use the colour of the two largest vertices to prescribe one pair of smaller vertices that will receive the same triple colour. Each top pair has only one such instruction. Todorčević's strong pair colouring makes the instruction occur in every uncountable set after fixing the two smaller vertices.

- [Proof](PROOF.md) and [one-page manuscript source](note.tex) (compiled locally and visually checked).
- [Prior-art audit](PRIOR-ART.md)
- [Finite rule checks](check_ordered_matching.py): 896 exhaustive instructions and 5,000 seeded cases. This checks the matching rule, not the infinite partition theorem.
- [Research issue #1087](https://github.com/1337isnot1337/solved-conjectures/issues/1087)

The separate Question 5.4 about countable order types is not claimed. No Lean or independent referee report.
