# Erdős–Purdy conjecture

**Lean status:** none.

In a nontrivial pairwise balanced design on $`v`$ points with a point-transitive abelian automorphism group, at least $`v`$ blocks have one size. A power improvement over the square-root lower bound also holds for finite noncollinear point sets in a projective plane over any field.

The abelian bound is attained by the Fano plane. For unrestricted finite linear spaces, it remains open whether every sufficiently large order admits a design with maximum block-size multiplicity of order the square root of the number of points. [Erdős and Purdy, §2](https://users.renyi.hu/~p_erdos/1978-42.pdf)

## Proofs

- [Transitive designs and the sharp abelian bound](regularity.md)
- [The power gap over arbitrary fields](field-obstruction.md)
- [Finite subfields from small projections](small-projections.md)
- [Prime-order planes](prime-planes.md)
- [Limiting block-size distribution](profiles.md)
- [Restriction to prescribed orders](restriction.md)
- [Averaging block-size counts](windows.md)
- [Point-symmetry obstruction](symmetry.md)
- [Original formulations and preceding bounds](PROOF.md)

**Reproducible check.** Direction energies and finite subplane incidences. Run `python3 results/erdos-block-size-multiplicity/check_field.py` from the repository root. [Verifier](check_field.py)

**Review record.** Independent proof review is pending. [Discussion and checks](https://github.com/1337isnot1337/solved-conjectures/issues/780) · [Original research files](https://github.com/1337isnot1337/solved-conjectures/tree/17fbd24838da0aff7b8081d6338b5e03d601893b/research/erdos-block-size-multiplicity).

If you use these results, please credit the authors of the original problem and the proof you use, and cite [Cinna Davis’s site](https://itsdavis.com/) and [the specific proof in this repository](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-block-size-multiplicity/regularity.md).
