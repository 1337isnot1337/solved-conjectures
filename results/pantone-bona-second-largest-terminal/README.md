# Pantone–Bóna’s second-largest-terminal asymptotic conjecture

**Proved.** The number of permutations avoiding all four patterns `12345`, `12453`, `13452`, and `23451` is asymptotic to $9^n/n^3$ times exactly $27\sqrt3/(32\pi)$.

This resolves Conjecture 6.3 for $A_{5,4}$, not the neighboring equal-index $A_{5,5}$ conjecture. The method counts a decreasing tail whose labels occupy a single gap between rank markers. A uniform survival estimate for tableau walks controls long gaps and makes the exact asymptotic possible. The proof also gives the full leading term across the second-largest-terminal family.

- [Complete written proof](PROOF.md)
- [Lean statements and verification receipt](FORMALIZATION.md)
- [Primary sources and independent audit](AUDIT.md)
- [Exact supplementary checker](verify.py)
- [Discovery and review, issue #380](https://github.com/1337isnot1337/solved-conjectures/issues/380)

**Lean status.** Partial. Lean verifies the literal four-pattern class, its canonical split by a unique marker gap, the binomial interleaving count, and the block-deletion lemma for tableau walks. The exact leading amplitude follows in Lean from explicit counting and gap estimates.

No guessed differential equation, external referee review, or exclusive priority is claimed.
