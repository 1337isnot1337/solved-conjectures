# Uniform rainbow six-cycles for pro-odd homogeneous actions

**Theorem.** Let \(G\) be a metrizable profinite group all of whose finite quotients have odd order. For a balanced six-color graphon invariant under a transitive action of \(G\), the average density over the 720 ordered rainbow six-cycle color assignments is at least \(6^{-6}/81\). This holds for fractional colors and for arbitrary stabilizers in the homogeneous space.

This covers all inverse limits of odd finite groups and applies even when their orders have factors of three. It is distinct from the connected compact theorem, and does not cover arbitrary homogeneous actions with an even finite quotient or general nonhomogeneous graphons.

## Odd finite groups

First let \(G\) be finite of odd order. Pull the coloring back to \(G\), so the kernels are real, self-adjoint Cayley kernels with degrees exactly \(1/6\); no diagonal assumption beyond balance is needed. Decompose the centered color operators in the unitary regular representation, with the notation of [ALL-CAYLEY.md](ALL-CAYLEY.md). Over all nontrivial blocks the total Hilbert–Schmidt energy is at most \(30\), and for every palette \(S\) the total squared norm of the centered union is at most \(|S|(6-|S|)\), as in that proof.

The nontrivial irreducibles are of complex type. Indeed the Frobenius–Schur indicator averages \(\chi(g^2)\), and squaring is a permutation in an odd-order group, so this average equals the zero average of a nontrivial irreducible character. Hence a block and its distinct conjugate contribute equal squared norms for each real color union. A nonlinear irreducible has degree \(d\ge3\), since irreducible degrees divide the odd group order. Its multiplicity matrices consequently obey the subset norm inequality of the [six-matrix estimate](ALL-CAYLEY.md) with effective dimension \(2d\ge6\). Thus the average mixed trace of that block is bounded below by minus \(\frac16(2/3)^4\) times its energy. The dimension weights for summing the block remain the actual dimensions \(d\) of the regular representation decomposition.

For a one-dimensional nontrivial character, the real centered coefficients have mean absolute value at most \(2/3\) by [the odd cosine estimate](FOURIER-CAYLEY.md), because the character image has odd order at least three. The same energy-charging estimate follows by the arithmetic- and quadratic-mean bounds. After summing the blocks the centered trace is at least \(-80/81\). The constant block contributes exactly one in the normalized operators; rescaling by \(6^{-6}\) proves the finite-group claim. This proof uses an average of the orders, not a bound on every individual order.

## Profinite limits

As above pull the graphon back to \(G\), with kernels \(W_i(x,y)=f_i(x^{-1}y)\). Take a decreasing sequence of open normal subgroups whose intersection is trivial, and replace each \(f_i\) by its coset conditional expectation. The approximants retain inversion symmetry, sum one, values in \([0,1]\), and means \(1/6\). They are balanced colored Cayley kernels on the finite quotients, each odd by hypothesis. The conditional expectations converge in \(L^1\) to \(f_i\), by density of locally constant functions (or martingale convergence). Haar invariance makes the same \(L^1\) convergence hold for the associated kernels. The ordered cycle densities converge by telescoping the six bounded factors. The uniform finite bound passes to the original graphon.

This is an additional structured result for [Erdős #811](https://www.erdosproblems.com/811); the numerical lower bound is inherited from the existing six-matrix estimate, not a new optimized constant. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
