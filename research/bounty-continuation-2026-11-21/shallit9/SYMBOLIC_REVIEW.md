# Independent review of the Shallit 9 symbolic checkpoint

21 November 2026. Reviewed source: `agents/conjectures/shallit9-symbolic-closure-gap.md`, SHA256 `21bfaf98674231682f1c80f751cf9ea21ede2385417324026bf8db402b446d80`.

The final written derivations and specified exact witnesses pass this review. Earlier informal Mahler identities are superseded by the reviewed file. The full Hankel nonvanishing target remains unresolved.

## Formal-series and transition identities

The four indicator-series equations follow by direct inspection of the even and odd output maps. Substituting $`f_1(z)=G(z^2)`$ and $`f_3(z)=G(z)-G(z^2)`$ gives $`f_4(z)=z(G(z^2)-G(z^4))`$. In the third indicator equation the argument must therefore be

```math
f_4(z^2)=z^2(G(z^4)-G(z^8)).
```

Using this expression gives exactly the final equation (1). Weighting the four indicator series by the letters gives (2), and substituting (1) into (2) gives (3), including its rational term $`(2+3z)/(1-z^2)`$. These are all-index algebraic derivations. The 128-coefficient replay checks transcription only.

The displayed quotient coordinates give the stated transition matrices. The exact verifier was replayed independently and reproduced determinant $`-1`$ for the nine flattened words. Hence these words form an integral basis of the full matrix algebra. Reduction to a field preserves that determinant and proves the absence of a common proper nonzero invariant subspace. This conclusion concerns fixed linear output coordinates only; it does not exclude other recurrence constructions.

## Determinant obstructions

The parity decompositions are simultaneous row and column permutations, so their determinant signs agree with the original matrices. The reproduced order-six Schur complement has unequal entries on one anti-diagonal and is therefore not Hankel. Since linear combinations of Hankel matrices remain Hankel, this is a valid obstruction to the proposed output-coded closure. It does not exclude a larger class of mixed matrices or bordered minors.

The rank-one determinant identity holds even when the original matrix is singular: multilinearity makes all terms using two constant columns vanish. Successive row and column differences convert the constant matrix into the top-left matrix unit. Its coefficient is therefore the determinant of the second-difference Hankel minor, with the source's shift unchanged. Both exact affine witnesses were independently replayed. Neither is a singularity at the original sequence values.

## Primary-source check and verification scope

I opened the [2010 Oberwolfach report](https://ems.press/content/serial-article-files/46296), including Problem 44 and Conjecture 45 on printed page 2234. The modular obstruction is explicitly conjectural there. I also checked Remark 15.5 of [Bacher's recurrence-matrix paper](https://arxiv.org/pdf/math/0601372), which supplies the general example showing that inversion need not preserve finite recursive complexity. It is not an impossibility theorem for this sequence.

The replay reproduced JSON SHA256 `0e49dce56b0f46cc377ab24d2b6361f89c3f510e10bd00b8cc01362e63e3725d`. It checks the specified basis determinant, Schur complement, affine witnesses, and series transcription. It extends no target search range and provides no all-order nonvanishing proof, Lean verification, priority claim, or new completed bounty.
