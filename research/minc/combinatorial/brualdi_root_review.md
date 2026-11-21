# Root review of the Brualdi structural reduction

Research date: 20 November 2026 (America/Chicago). This is a review of a partial theorem, not a proof of Brualdi's cohesiveness conjecture.

I checked the argument in `brualdi_structure.md` independently, including the strict inequalities needed at order four. No gap was found in the stated structural conclusions.

## Exact scope checked

For every global permanent minimizer on the doubly stochastic face supported by `C_n = J_n - I_n + E_nn`, for every `n >= 4`, the proof establishes:

1. The permanent is strictly below that of `(J_n-I_n)/(n-1)`.
2. Every nonempty zero rectangle has at most `n-2` rows plus columns.
3. The free diagonal entry is positive.
4. Every prescribed diagonal zero has permanental cofactor strictly below the permanent.
5. The entire free row and column are positive.
6. The directed graph of additional top-block zeros is acyclic.

These statements do not establish that the additional-zero graph is empty. An acyclic graph may have edges. The proof therefore does not yet produce an interior minimizer or justify a symmetry reduction.

## Points requiring care

- The minimum on the face with one zero rectangle of dimensions `r` by `c`, where `r+c=n-1`, is exactly `d_(r+1) d_(c+1)`, with `d_s=s!/s^s`. The repeated-support averaging argument is applied to a global minimizer on that larger face. It is not a monotonicity claim for averaging arbitrary matrices.
- The product is at least `d_2 d_(n-1)`. The comparison with the zero-diagonal uniform matrix is an equality at `n=4`, so the explicitly negative directional derivative into the restored diagonal is essential. It makes the exclusion strict at that order as well.
- The cofactor conditions use full indecomposability. They do not follow merely by asserting that all entries in a row have the same derivative. The multiplier calculation and irreducibility of `AA^T` justify that assertion at a face minimizer.
- The nondegenerate permanent bilinear form is a classical input. The relevant zero-rectangle condition applies to each matrix obtained by deleting two rows, because it already holds for the whole minimizer. The transpose supplies the corresponding column statement.
- The free diagonal positivity argument is valid because, if that entry were zero, every diagonal entry would be zero. Simultaneous row and column relabeling can then move any diagonal cofactor to the allowed free position without leaving the face.
- The directed-cycle contradiction uses a column permutation only. It makes the extra zeros on the cycle prescribed diagonal zeros and moves an old prescribed diagonal zero, whose cofactor is strictly too small, to an allowed off-diagonal position. The free index is fixed throughout.
- A zero entry may have cofactor exactly equal to the permanent. Consequently the support of the nonnegative upper-triangular cofactor excess need not equal the additional-zero graph. An argument that identifies them would introduce a gap.

## Sources checked

The full two-page English text of A. A. Panov, *On the signature and kernel of the bilinear form associated with a permanent*, Russian Mathematical Surveys 39:6 (1984), 219-220, was inspected through MathNet:

https://www.mathnet.ru/links/a301ed41849e632a177821beeb0c2fb0/rm2512_eng.pdf

Theorem 1 gives the precise nonsingularity/signature criterion. The note added in proof attributes that theorem to an earlier paper. Its author name is corrupted as “Barat” in the PDF text extraction; the publisher's primary record identifies **Ravindra Bapat**, *A matrix of permanents*, Linear Algebra and its Applications 56 (1984), 57-62, DOI https://doi.org/10.1016/0024-3795(84)90113-7 . The publisher abstract independently confirms the nonsingularity criterion and its use in equality for Alexandroff's inequality. The full Bapat article was not obtained.

The current Minc Problem 14 page supplies the conjecture and historical context:

https://yair-lavi.com/mincs-list/problem-14/index.html

The combined structural conclusion has not received an exhaustive historical-priority audit. Its status is a checked research theorem with an explicit remaining gap, not an independently refereed result or another completed entry.
