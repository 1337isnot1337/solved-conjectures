# Review of the alternating-path susceptibility checkpoint

Date: 20 November 2026 (America/Chicago).

Reviewed file: [matching_path_susceptibility.md](../inequalities/matching_path_susceptibility.md).

Status: the stated deductions are correct. The susceptibility comparison
remains unproved. The abstract root law is an obstruction to a scalar
relaxation and is not a matching-matrix counterexample.

## Path normalization

For every matching, the two sums of monomer indicators both equal m-K.
Consequently summing the cross covariances, with one vertex in each
bipartition class, gives Var K exactly. There is no factor two.

I checked the weighted switching identity against the earlier
[monotonicity proof](../../inequalities/hwang_matching_monotonicity.md).
After division by Z(G)^2, its left side is precisely the monomer
covariance. Every simple path between opposite classes has odd length
and positive sign. Orienting the path from its left endpoint to its
right endpoint counts it once in the double sum. The deleted complement
contributes two independent matching partition functions, hence their
square. No additional path multiplicity or factorial is present.

For a positive edge, p_ij=za_ij Z(G-i-j)/Z(G). Its one-edge summand is
p_ij^2/(za_ij). Discarding all longer paths is valid because their terms
are nonnegative. Weighted Cauchy-Schwarz uses total edge activity zm
and total edge occupancy mu, proving V>=mu^2/(zm). Zero entries cause
no division because they are omitted from that sum.

For q=mu/m>0, this bound implies the proposed bridge exactly when
q(1+q)>=z(1-q). Solving the quadratic gives the stated q_*(z). At
z=t/(1-t)^2, substitution of q=t gives -t^3/(1-t)<0, so the earlier
strict occupancy theorem leaves precisely the stated nonempty interval
as a possible gap in this sufficient argument. This is a statement
about the proof's unresolved region, not a claim of failure there.

## Root moments and the abstract law

The first three coefficient identities give

    p_2=m^2-2 sigma_2=2m-S_2,
    p_3=m^3-3m sigma_2+3 sigma_3=5m-6S_2+2S_3.

Here p_j is the power sum of the root squares. This independently checks
the normalization in equation (8). Weighted Cauchy-Schwarz applied to
a_ij^(3/2) and a_ij^(1/2) gives S_2^2<=m S_3. Substituting
S_2/m=2-M_2 gives the exact consequence
M_3>=2M_2^2-2M_2+1.

The three masses sum to one. Independent exact rational arithmetic
reproduced every displayed moment, the positive difference in (9),
q(2), V/m, and the negative difference in (11).

For the Catalan bounds, M_3<14/3<5 handles k=3. The support bound gives
M_4<=3M_3<14=C_4. From k=4 onward, the Catalan successive ratio is at
least three, so induction proves all remaining moment bounds. The
moments of orders zero, one, and two satisfy their bounds as stated.

For the logarithmic certificate, log(1/100)=-2 log 10>-14/3,
log(6/5)>=1/6, and log 3>1. Their weighted sum is exactly -923/952>-1.
The exponential series through degree six at 7/3 already exceeds ten,
which independently verifies the bound log 10<7/3 used here.

The simultaneous satisfaction of these scalar conditions does not
assert realizability by a doubly stochastic matching polynomial. The
note keeps that distinction explicit. Its last paragraph also correctly
restricts the possible consequence of a susceptibility proof to the
padding-limit statement established in the companion reduction.

## Review outcome

No correction is needed. The path inequality is valid at all positive
activities; the occupancy localization inherits the earlier restriction
0<z<=2. The abstract example rejects only the listed collection of
scalar constraints. Neither result is a full solution of a Minc entry,
and this review establishes no priority claim.
