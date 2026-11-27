# Misère Domination Game

**Status:** proved for every path and cycle, answering the first clause of Brito–Marcilon–Martins–Sampaio's Question 2. The separate arbitrary-tree clause remains open. Not Lean-formalized.

On a path the second player wins exactly at orders 1 and 5 and at all orders congruent to 2 modulo 4. On a cycle the first player wins exactly at orders 4 and 8 and at all orders at least 13 congruent to 1 modulo 4.

The proof gives a linear-scan formula for the entire impartial misère octal game 0.337, including arbitrary heap sums. This also disproves the proposed algebraic periodicity in Liang's sense for 0.337, for every parameter tuple.

[Proof](PROOF.md) · [Periodicity](PERIODICITY.md) · [Audit](AUDIT.md) · [Solver](solve.py) · [Checker](verify.py)

Follow-up: [exact misère quotient](EXACT-QUOTIENT.md) · [sums of even cycles](EVEN-CYCLE-SUMS.md) · [mixed cycle sums and the obstruction for longer odd cycles](MIXED-CYCLE-SUMS.md).
