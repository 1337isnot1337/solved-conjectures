# Ribbon lattice-path Z-polynomials

**Theorem.** Let \(M\) be a connected lattice-path matroid of rank \(r\) whose skew shape is a ribbon. Then
```math
Z_M(t)=N_{r+1}(t)=\sum_{k=0}^{r}\frac{1}{r+1}\binom{r+1}{k}\binom{r+1}{k+1}t^k.
```
In particular \(Z_M\) is real-rooted. The polynomial does not depend on the row-length composition of the ribbon.

This is the connected ribbon statement on the SymCat list of real-rooted open problems. Loops, coloops, and disconnected ribbons are not part of that statement.

The evaluation \(Z(U_{r,r+1})=N_{r+1}\) is Proudfoot–Xu–Young, Proposition 4.9, and is used as a cited input. The new step is that every connected ribbon has the same \(Z\)-polynomial as the circuit of the same rank.

## 1. Snakes and their graphic model

A ribbon is a connected skew shape with no \(2\times 2\) square. The connected lattice-path matroid of a ribbon is a snake matroid. Benedetti–González D’León–Hanusa–Harris–Khare–Morales–Yip record, in Remark 2.9 of arXiv:2511.01711, that snake matroids are exactly the matroids obtained from \(U_{1,2}\) by a succession of series and parallel extensions of the last element:
```math
S(b_1)=\parallel^{b_1-1}(U_{1,2}),
\qquad
S(b_1,\ldots,b_k)=\parallel^{b_k-1}(\mathrm{series}(S(b_1,\ldots,b_{k-1}))).
```
Here \(\mathbf b=(b_1,\ldots,b_k)\) is a composition, the rank is \(k\), and both operations are taken at the current last element. Parallel extension adds an element parallel to the last element. Series extension adds an element in series with the last element. Both operations preserve representability by a graph: parallel extension adds a parallel edge, and series extension subdivides the chosen edge.

Thus every connected snake is the cycle matroid of a connected multigraph built from a pair of parallel edges by subdividing the distinguished last edge or adding an edge parallel to it.

## 2. The simplification is a cycle chain

Parallel edges do not change the lattice of flats. A flat contains every element of a parallel class or none of them, and deleting all but one element of each class is a lattice isomorphism. The \(Z\)-polynomial depends only on the lattice of flats, so it is unchanged by simplification. It is therefore enough to determine \(Z\) for the simplification of the multigraph in Section 1.

That simplification is a **cycle chain**, constructed as follows.

- The simplification of \(U_{1,2}\) is a single edge. Call this the rank-one chain.
- Subdividing an edge whose parallel class still has another edge replaces that class, in the simplification, by an edge \(f\) and attaches a path of length two with the same endpoints. The result is the parallel connection of the previous simplification with a \(3\)-cycle along \(f\).
- Subdividing an edge that is already simple inserts one vertex into the block containing that edge. A cycle remains a cycle, and no new block appears.

By induction on the construction, the simplification is either a single edge or a connected graph whose blocks are cycles of length at least \(3\), with the block-cut tree a path, and with the distinguished last edge lying on the final block. Call the latter graphs cycle chains of positive block number. Series-parallel graphs that are not built in this order need not be cycle chains. The cycle matroid of \(K_{2,3}\) is a counterexample to the Narayana evaluation outside this class: its \(Z\)-polynomial is \(1+11t+21t^2+11t^3+t^4\), whereas \(N_5(t)=1+10t+20t^2+10t^3+t^4\).

## 3. Deleting the end glue edge preserves \(Z\)

The deletion formula used here is Braden–Vysogorets, Theorem 2.8(6), in the Electronic Journal of Combinatorics 27 (2020), P1.17. For a simple matroid \(M\) and an element \(e\) that is not a coloop,
```math
Z_M(t)=Z_{M\setminus e}(t)+\sum_{F\in S}\tau(M/(F\cup e))\,t^{(\mathrm{crk}\,F)/2}Z_{M/F}(t),
```
where \(S\) is the set of flats \(F\) such that \(e\notin F\) and \(F\cup e\) is a flat, and \(\tau\) is the coefficient of \(t^{(\mathrm{rk}-1)/2}\) in the Kazhdan–Lusztig polynomial when the rank is odd and is zero when the rank is even.

Let \(G\) be a simple cycle chain with at least two blocks. Write \(G\) as the parallel connection of the remaining chain \(R\) and the final cycle \(C\), along their unique common edge \(e\). The edge \(e\) lies on \(C\), so it is not a coloop. Both \(R\setminus e\) and \(C\setminus e\) are connected: \(C\setminus e\) is a path, and \(e\) lies on a cycle of \(R\).

For \(F\in S\), the contraction \(G/(F\cup e)\) is the direct sum of the corresponding contractions of \(R\) and of \(C\). Each side has positive rank. Indeed, if one side retained no edge, connectedness of that side minus \(e\) would put \(e\) in the closure of \(F\), so \(F\) would not be a flat. If a retained edge became a loop, its endpoints would be joined by \(F\cup e\) and not by \(F\) alone, so the edge would lie in the closure of \(F\cup e\) and \(F\cup e\) would not be a flat. Lemma 2.7 of Braden–Vysogorets therefore gives \(\tau(G/(F\cup e))=0\). Every term of the sum vanishes, and
```math
Z_G(t)=Z_{G\setminus e}(t).
```
Deleting \(e\) merges the two cycles through \(e\) into one cycle and leaves every other block unchanged. The result is a simple cycle chain with one fewer block, on the same vertex set, and still connected, so the rank is unchanged.

## 4. Induction

Proceed by the number of blocks in the simplification.

If the simplification is a single edge, the matroid has rank \(1\) and \(Z_M(t)=1+t=N_2(t)\).

If the simplification is a single cycle of length \(v\ge 3\), the cycle matroid is \(U_{v-1,v}\). Proudfoot–Xu–Young, Proposition 4.9, gives \(Z=N_v\). The rank is \(r=v-1\), so this is \(N_{r+1}\).

If there are two or more blocks, Section 3 replaces the graph by a cycle chain of the same rank and one fewer block without changing \(Z\). Repeating this deletion reaches a single cycle of the same rank \(r\), hence of length \(r+1\). Therefore \(Z_M(t)=N_{r+1}(t)\).

Narayana polynomials are real-rooted; Proudfoot–Xu–Young record this for the circuit case in Example 5.3. The identity transfers real-rootedness to every connected ribbon.

## 5. What is not claimed

The argument does not evaluate \(Z\) for a disconnected ribbon, for a snake with a loop or a coloop, or for an arbitrary series-parallel matroid. It does not reprove the circuit evaluation or the Braden–Vysogorets deletion formula. No Lean formalization is claimed.
