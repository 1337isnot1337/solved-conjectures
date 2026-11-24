# Source and independent audit

## Target and priority

The target is [Coulangeon–Lazzarini, *Spherical designs and heights of Euclidean lattices*](https://doi.org/10.1016/j.jnt.2014.02.015), *Journal of Number Theory* 141 (2014), 288–315, [author preprint, Conjecture 21, §5.3, p. 15](https://arxiv.org/pdf/1401.2891). Their first two layers are the two smallest positive squared norms actually attained. They impose no irreducibility or unimodularity and prove the implication in dimensions 2 through 6. Failure of the all-shell conclusion refutes their conjecture. It does not conflict with the lower-dimensional theorem.

A targeted 2026-11-24 search used author and paper names, the conjecture number, its exact shell and design terminology, “counterexample,” “fully critical,” and binary Construction A or repetition-code sources. It checked [Lazzarini’s earlier thesis](https://www.algant.eu/documents/theses/lazzarini.pdf), [Böttcher–Fukshansky–Garcia–Maharaj on minimal-shell designs](https://arxiv.org/abs/1510.08804), [Martinet’s work on codes and eutaxy](https://jamartin.perso.math.cnrs.fr/Publications/eutaxcode.pdf), and the literature on dual root lattices. The lattices themselves need not be new: the elementary family is homothetic to the direct sum of the one-dimensional cubic lattice and the dual of the root lattice of type D in dimension 4k+1. No previous resolution specifically using these shell conditions was found. This bounded audit is not a historical priority claim.

## Audit of the argument

- The parity preimages are full-rank lattices because the codes are linear and their preimages contain the full-rank even cubic lattice.
- Before the first nonzero-codeword norm is possible, all shell sums are those of cubic shells. Sign symmetry settles first and off-diagonal moments; coordinate permutations settle the diagonal moments. For each displayed squared norm there is an explicit vector.
- At the first new squared norm, the base lattice contributes nothing because the norm is not a multiple of four. The only coset entries attaining equality are unit sign choices on the specified support and zeros elsewhere. This gives the stated anisotropic diagonal in each construction.
- Indecomposability does not assume the coordinate axes are invariant under every automorphism. It uses that every shortest vector has to lie entirely in one factor of any putative orthogonal lattice sum. The shortest vectors are exactly the coordinate-axis vectors. The factor subspaces consequently partition the axes. The code’s pairwise intersecting supports exclude such a partition.
- Independent exact enumeration of the dimension-ten witness gives, at squared norm 4, 20 vectors with diagonal 8 in every coordinate; at norm 8, 180 vectors with diagonal 144 in every coordinate; at norm 9, 512 vectors with diagonal 0 in the first coordinate and 512 in the other nine. These are unnormalized second moments. All first and off-diagonal moments vanish. Replay with the standard library using [verify.py](verify.py).

The optional [height result](HEIGHT.md) was also checked: the Jacobi-product derivative is strictly negative; the two trace-free deformations give opposite fixed signs for the primal theta variation. Fixed-covolume Poisson transfers the sign to the dual, and the Mellin endpoint bounds justify differentiation at zeta argument zero.

The counterexample is a written proof and does not use the supplementary script. No Lean or external review is claimed.
