# Literature check

The target is the connected ribbon statement on Per Alexandersson’s SymCat page *Real-rootedness: problems and results*, section on lattice-path matroids, as read on 26 November 2026 at `https://www.symmetricfunctions.com/realRootedOpenProblems.htm`.

The page states that if \(M\) is a connected lattice-path matroid of rank \(r\) whose shape is a ribbon, then \(Z_M(t)\) equals
```math
N_{r+1}(t)=\sum_{k=0}^{r}\frac{1}{r+1}\binom{r+1}{k}\binom{r+1}{k+1}t^k,
```
and in particular is real-rooted. It records that the circuit case \(U_{r,r+1}\) is Proudfoot–Xu–Young, and that the identity was checked for all \(1022\) connected ribbon matroids on at most \(11\) elements. The page asks what explains the independence of the composition. A parenthetical sentence about hooks with coloops is a separate remark and is not the conjecture proved here.

## Sources compared

| Source | What was checked | Relation to this statement |
| --- | --- | --- |
| Proudfoot–Xu–Young, *The Z-polynomial of a matroid*, Electron. J. Combin. 25 (2018), P1.26, Proposition 4.9 and Example 5.3 | Circuit evaluation and real-rootedness of Narayana polynomials | Cited input for \(Z(U_{r,r+1})\). Not a proof for a ribbon with an internal part greater than \(1\). |
| Braden–Vysogorets, *Kazhdan–Lusztig polynomials of matroids under deletion*, Electron. J. Combin. 27 (2020), P1.17, Theorem 2.8 and Theorem 3.2 | Deletion formula and the parallel-connection vanishing for Kazhdan–Lusztig polynomials | The vanishing argument also kills the sum in the \(Z\)-formula (6). The paper computes several graphic families and does not state the ribbon identity. |
| Benedetti–González D’León–Hanusa–Harris–Khare–Morales–Yip, arXiv:2511.01711, Remark 2.9 | Series-and-parallel characterization of snakes | Used to match ribbons with the graphic construction. The paper’s theorems are about Chow classes, not \(Z\)-polynomials. |
| Gao–Lu–Xie–Yang–Zhang and the sparse-paving paper arXiv:2609.07636v1 | Uniform and sparse-paving real-rootedness | The corank-one uniform case is identified with Narayana polynomials. Ribbon matroids that are not circuits are not the stated family. |
| This repository, both permanent branches, open issues, and pull requests on 26 November 2026 | Search by ribbon, snake matroid, and \(Z\)-polynomial | No result directory, issue, or pull request states this identity. Issue #747 is the tracking issue for the present note. |

The uniform evaluation is a prior theorem. The deduction that every connected ribbon reduces to that circuit by glue-edge deletions is the step not found in the sources above. This note does not claim that no specialist had noticed the deduction.

## Scope boundary

\(K_{2,3}\) is series-parallel and not a cycle chain. Its \(Z\)-polynomial is \(1+11t+21t^2+11t^3+t^4\), not \(N_5(t)\). The ribbon hypothesis is essential.
