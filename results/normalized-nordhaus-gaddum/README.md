# Kempton–Zaitzeff–Muthuprakash’s normalized Nordhaus–Gaddum conjecture

For every simple graph on at least three vertices, the sum of the second-smallest normalized Laplacian eigenvalues of the graph and its complement is at most two minus a positive absolute constant divided by the square root of the number of vertices. The authors' even-order focus graphs show that this square-root rate cannot be improved. At order two the single edge and its complement attain two. [Original question, §4.2](https://arxiv.org/html/2606.12751v1#S4.SS2) · [Theorem and complete proof](PROOF.md)

The argument estimates all neighborhood indicators using the degree vector in both graphs at once. A hypothetical smaller deficit would force an almost disconnected cut in at least one graph. The proof treats both positive-density and vanishing-density limits and gives no optimal numerical constant or characterization of extremizers.

Cinna Davis recorded the result and proof strategy in the original discovery issue. WadeDavis and Codex reconstructed the missing manuscript from that record. A separate internal reviewer checked the full reconstructed proof, including the finite-order cases and both density arguments. No Lean formalization or external refereeing is recorded. [Original research issue](https://github.com/1337isnot1337/solved-conjectures/issues/495) · [Source and priority audit](AUDIT.md) · [Independent review](REVIEW.md)

From this directory, run the finite rational checks with Python 3.
```sh
python3 verify.py
```
