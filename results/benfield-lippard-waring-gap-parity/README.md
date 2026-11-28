# Benfield–Lippard’s stable Waring-gap parity conjecture

**Prior work.** A complete proof of Conjecture 10.4 by the same argument was already public in the Omega Institute's tracker: [issue 23099](https://github.com/the-omega-institute/trureturing/issues/23099) of 28 October 2026 and [issue 8611](https://github.com/the-omega-institute/trureturing/issues/8611) of 18 September 2026. Cite that work for the proof. This page records a later derivation first committed on 24 November 2026. It is unranked and is not counted as a new resolution. [Details](PROOF.md)

**Proved.** For every integer exponent at least 2, the largest stable offset not represented and the number of such offsets are both odd. This is Conjecture 10.4. The proof also gives their congruences modulo a power of two.

The key observation is that the least representable offset in each residue class modulo `2^e−1` uses no copy of that generator. Every remaining prime-base generator is even.

- [Complete proof](PROOF.md)
- [Independent audit](AUDIT.md)
- [Complete Lean verification of Conjecture 10.4](FORMALIZATION.md)
- [Discovery issue #399](https://github.com/1337isnot1337/solved-conjectures/issues/399)

This is distinct from the [symmetry refutation](../benfield-lippard-waring-gap-symmetry/).
