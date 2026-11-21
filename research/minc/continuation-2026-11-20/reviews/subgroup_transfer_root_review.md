# Root review of the permanent-dominance transfer checkpoint

Review date: 20 November 2026 (America/Chicago).

I read the complete transfer checkpoint and the independent review, checked
the general formulas below, and executed all four exact checkers. All passed.
No full Minc-list entry is resolved.

## Fourier normalization

For a linear character, the subgroup average of the inverse representation
matrices weighted by the character is an orthogonal projection. Fourier
inversion therefore introduces the factor d_lambda/[S_n:H]. For a character
of degree q, the actual isotypic projector has an additional factor q, and
normalizing the matrix function by q introduces another. The normalized
coefficient is consequently d_lambda/([S_n:H]q squared).

The independent review now uses g for an unnormalized character sum and
f=g/q for the normalized one. This avoids confusing the coefficients
1/(m q) and 1/(m q squared).

The distinction between an eigenvalue and a spectral average is real. For
A=J_2 direct-sum [1], the Schur power is I plus the regular action of a
transposition and has spectrum {0,2}. The normalized standard-character
immanant of S_3 is one. I checked the stronger eigenvalue assertion in
[Wanless's survey](https://arxiv.org/pdf/2202.01867), printed page 4, and
the numerical-range statement in
[Zhang's survey](https://doi.org/10.1515/spma-2016-0030), page 308.
The latter is the statement required for the usual implication.

## Orthogonal markers

Only permutations preserving the nonzero Gram blocks contribute after
adjoining all-ones marker blocks. Intersecting the proposed subgroup with
the block-preserving group and projecting onto the old indices gives the
groups K, G, and the kernel K_0 used in the checkpoint.

Average the representation over K_0. Since K_0 is normal in K, its fixed
subspace is K-invariant and its representation descends to G. The fiber
character sum is |K_0| times the descended character. Its dimension is
at most the original dimension, while |K_0| is at most the product of
the marker-block factorials. These facts prove the stated factor at most
one. No dominance violation can be created by this marker operation
unless one was already present for a constituent character in the old order.
The formulas remain valid when the fixed subspace is zero; that case
has zero character sum. Ratios can simply be avoided if per A is zero.

The limitation to all-ones marker blocks is necessary. The checkpoint
correctly excludes arbitrary orthogonal Gram blocks from this argument.

## The appended-vector criterion

For a permutation moving the new index, the new entries are b_i and
conjugate(b_j). Thus the cofactor must appear as D_ji=per A(i|j), giving
the scalar b* D b. The same index pairing with the character defines
D_H. Replacing a permutation by its inverse conjugates its character and
all its factors, so D_H is Hermitian, including for complex characters.

Writing b=W* v and c=||v|| squared plus ||u|| squared proves the quadratic
form identity. The coefficient delta controls orthogonal appended
components, so it cannot be omitted from the no-extension criterion.
For both specified cores delta is positive and all six two-dimensional
forms are positive definite. Hence the certificate excludes every
appended vector in every ambient dimension, not merely four test vectors.

The four direct evaluations used by the independent checker recover
the two diagonal entries and the real and imaginary parts of the
off-diagonal entry. Their agreement with the separate cofactor
construction checks the conjugation convention without sharing its code.

## Exact checks and scope

The affine-group, exceptional-subgroup, one-vector, and independent review
scripts all returned successful exact checks. The first two moments and
the Schur--Weyl rank bound certify the quoted block spectra without a
floating-point eigenvalue computation. The induced-character identities
and subset-orbit counts give the stated dimension factors.

The published permanent-on-top examples remain prior counterexamples to
a different conjecture. The checkpoint proves why the specified transfer
operations do not turn them into counterexamples to Lieb's dominance
conjecture. Other cores and subgroup-character directions remain open.
No historical-priority claim is made for the general identities.
