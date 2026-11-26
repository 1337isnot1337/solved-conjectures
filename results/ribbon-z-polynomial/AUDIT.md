# Internal audit

The audited statement is the connected ribbon identity in `PROOF.md`. The audit rechecks the reduction. It is not an external referee report, and it claims no Lean verification.

## Citations that the argument treats as inputs

- Proudfoot–Xu–Young, Proposition 4.9: the coefficient of \(t^i\) in \(Z(U_{d,d+1})\) is the Narayana number \(N(d+1,i+1)=\frac1{d+1}\binom{d+1}{i+1}\binom{d+1}{i}\). For a cycle of length \(r+1\) one has \(d=r\), and \(\binom{r+1}{i+1}\binom{r+1}{i}=\binom{r+1}{i}\binom{r+1}{i+1}\), which is the SymCat normalization.
- Braden–Vysogorets, Theorem 2.8(6), supplies the deletion formula for a simple matroid and a non-coloop. Lemma 2.7 supplies \(\tau(A\oplus B)=0\) when both summands have positive rank.
- Remark 2.9 of arXiv:2511.01711 supplies the series-and-parallel characterization of snakes. The graphic reading of those two operations is the standard one: parallel extension adds a parallel edge, and series extension subdivides an edge.

## Steps checked in the reduction

Parallel classes contribute no new flats: a flat contains a whole class or none of it, and retaining one representative is a lattice isomorphism. Passing to the simplification does not change \(Z\).

The simplification is a path of cycles because each operation touches only the distinguished last edge. Subdividing a non-simple edge appends a triangle along the surviving edge. Subdividing a simple edge lengthens the last cycle. The block-cut tree therefore remains a path. This does not extend to an arbitrary series-parallel graph; \(K_{2,3}\) is the explicit obstruction recorded in the proof.

For a simple cycle chain with an end cycle \(C\) glued along \(e\), both deletions of \(e\) are connected, and \(e\) is not a coloop. In the deletion formula, a summand with \(\tau\neq 0\) would require a direct sum in which some side has rank zero. Rank zero with no remaining edge would put \(e\) in the closure of the flat, and rank zero with a looped remaining edge would put that edge in the closure of the flat plus \(e\). Both contradict membership in the set \(S\) of the deletion formula. The sum is empty of nonzero terms, so deleting \(e\) preserves \(Z\) and the rank, and it decreases the number of blocks by one.

The induction ends at a single cycle of rank \(r\), whose matroid is \(U_{r,r+1}\). The cited circuit evaluation gives \(N_{r+1}\). The rank-one simplification is the separate base \(1+t=N_2(t)\).

Real-rootedness is inherited from the Narayana polynomial. It is not given a separate elementary proof here.

## Finite check

`verify.py` recomputes the graphic flat recursion for every connected snake with at most eight edges produced by the series-and-parallel construction, and for the diamond. All matched the Narayana polynomial. The same recursion gives \(Z(M(K_{2,3}))=1+11t+21t^2+11t^3+t^4\). The script is a consistency check of the graphic model. The all-rank argument is the deletion induction.

## Not claimed

Disconnected ribbons, loops, coloops, and the hook factorization mentioned parenthetically on the SymCat page are outside the proof. The circuit evaluation and the deletion formula are not reproved.
