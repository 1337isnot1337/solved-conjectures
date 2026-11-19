# Hadamard order 2396 — partial results

**Open.** The Hadamard conjecture asks whether a sign matrix with mutually orthogonal rows exists at every order divisible by four. Both the November survey and the subsequent construction table list 2396 as the smallest unresolved order. [Egan, Kotsireas, London and Ó Catháin, Table 5](https://arxiv.org/html/2610.27175v2) · [Kumar, updated table](https://github.com/vatskishan03/Hadamard/blob/d885022/FRONTIER.md)

**Automorphism obstruction for the whole order.** Any real Hadamard matrix of order 2396 must have an automorphism group of order coprime to 479, allowing signed row and column permutations. The proof rules out a cyclotomic norm in two ways. [Proof and arithmetic certificate](AUTOMORPHISMS.md)

A binary Legendre pair on an abelian group of order 1197 would yield such a matrix. We bound its group of common multipliers by nine, allowing independent translations of the two rows. For a bordered quadruple of length 598, we also exclude a common order-eleven multiplier fixing the rows in suitable origins. Smaller symmetry groups and other constructions remain possible. The results are unrefereed and carry no priority claim. Their full Lean formalizations remain in progress; the checked arithmetic component is described below. [Proof](PROOF.md)

For a third route, we show that a core with quotient of order four and the stipulated autocorrelations always admits a fixed border after normalization. At order 2396 this leaves 14 possible coset-sum patterns. A binary core realizing one of them with the required correlations is still needed. [Border reduction and attribution](BORDER.md)

## Checked Lean components

**Lean status:** partial. The arithmetic, integral-basis coefficient, Fourier, and permutation components are checked; the complete signed-automorphism theorem and the sequence/border results are not yet fully formalized.

The arithmetic and integral-basis coefficient component of the automorphism
argument has passed strict source checks, a transitive axiom audit, and
independent pinned-kernel replay. It includes the order-239 residue calculation,
both norm exclusions, the fifth-power norm witness, and the coefficient
congruence in the full cyclotomic ring of integers. The quadratic descent, final
assembly, and separate ideal-class argument remain
candidates. [Exact checked scope and receipt](../../docs/lean-status.md#hadamard-automorphism-arithmetic).

The Fourier component has also passed these three gates. It constructs the
actual character embedding and indicator Fourier matrix, proves their Gram
identities, and derives the determinant quotient of norm 599³ from its residue
obstructions. The full signed-automorphism theorem is still a candidate.
[Fourier receipt and scope](../../docs/lean-status.md#hadamard-automorphism-fourier-component).

The permutation component has passed the same gates. It proves the sign
normalization, fixed-point and cycle counts, cyclic reindexing, and transport
into the ring of integers, and defines the full signed automorphism subgroup.
[Permutation receipt and scope](../../docs/lean-status.md#hadamard-automorphism-permutation-component).

## Reproduce the finite checks

Run from this directory with a C++17 compiler, Python with assertions enabled, and NumPy.

```sh
c++ -O2 -std=c++17 quotient133.cpp -o /tmp/hadamard-quotient133
/tmp/hadamard-quotient133 > /tmp/hadamard-quotient133.pairs
diff -u quotient133.pairs /tmp/hadamard-quotient133.pairs
python3 audit.py
python3 border.py
python3 automorphisms.py
```

The C++ program lists all 32 ordered pairs that pass the 133-point quotient. The Python audit recovers that list independently, checks all 133 shifts for every survivor, and exhausts the possible 21-point margins of all 32. Every survivor fails this necessary lifting condition.
