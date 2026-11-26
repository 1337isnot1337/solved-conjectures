# Alexandersson’s ribbon Z-polynomial conjecture

Let \(M\) be a connected lattice-path matroid of rank \(r\) whose shape is a ribbon. Then the \(Z\)-polynomial of \(M\) equals the Narayana polynomial
```math
N_{r+1}(t)=\sum_{k=0}^{r}\frac{1}{r+1}\binom{r+1}{k}\binom{r+1}{k+1}t^k,
```
independently of the row-length composition. In particular it is real-rooted.

The statement is the connected ribbon problem on the SymCat list of real-rooted open problems. The circuit case \(Z(U_{r,r+1})=N_{r+1}\) is due to Proudfoot–Xu–Young. The argument here reduces every connected ribbon to that circuit.

- [Proof](PROOF.md).
- [Literature check](NOVELTY.md).
- [Internal audit](AUDIT.md).
- [Finite graphic check](verify.py).
- [Coordination issue](https://github.com/1337isnot1337/solved-conjectures/issues/747).

## Proof

Snake matroids are the connected lattice-path matroids of ribbons, and they are the matroids built from \(U_{1,2}\) by series and parallel extensions of the last element. Those operations are subdivision and doubling of a distinguished edge, so the simplification is a path of cycles glued along edges. Parallel edges do not change the lattice of flats.

For a simple path of two or more cycles, the Braden–Vysogorets deletion formula has vanishing correction terms along the edge where the last cycle is glued. Deleting that edge preserves the \(Z\)-polynomial and the rank, and it merges the last two cycles into one. Repeating the deletion reaches a single cycle of the same rank, whose \(Z\)-polynomial is the Narayana polynomial.

The same identity fails for the cycle matroid of \(K_{2,3}\), which is series-parallel but not a path of cycles.

## Verification

There is no Lean formalization. The written argument cites the circuit evaluation and the deletion formula, and it does not recheck those proofs in a proof assistant.

The finite script is not the proof. It recomputes the graphic \(Z\)-polynomial for every connected snake with at most eight edges and compares it with the Narayana polynomial. Run:

    python3 results/ribbon-z-polynomial/verify.py

The script uses only the Python standard library.

## Credits and references

The circuit evaluation is Proudfoot–Xu–Young, Proposition 4.9. The deletion formula is Braden–Vysogorets, Theorem 2.8. The series-and-parallel description of snakes is Remark 2.9 of arXiv:2511.01711. No external referee review is claimed.

- [SymCat, real-rooted open problems](https://www.symmetricfunctions.com/realRootedOpenProblems.htm), lattice-path section, as read on 26 November 2026.
- [Proudfoot–Xu–Young (2018)](https://doi.org/10.37236/7288), Proposition 4.9 and Example 5.3.
- [Braden–Vysogorets (2020)](https://doi.org/10.37236/9244), Theorem 2.8 and Lemma 2.7.
- [Benedetti et al., arXiv:2511.01711](https://arxiv.org/abs/2511.01711), Remark 2.9.
