# Independent review of the congruence-cleared cone test

21 November 2026. This review covers the mathematical lemma and
four-coordinate calibration in Sections 2–3 of
[the authored note](stratified-cone-test.md).
The external Ginsburg–Spanier characterization and the current prize
status are not re-audited here. The test has not been violated for the
primitive-word exponent sets, and no full Shallit 7 conclusion follows.

The congruence-clearing step is valid. If the negative projected
witness lies in a rational finitely generated cone, it has a rational
nonnegative representation; clearing denominators gives an actual
nonnegative integer combination of projected periods. There are only
finitely many component/subspace pairs, so a common multiple can be
chosen before selecting the component that contains infinitely many
vectors $`N^2\mathbf1+Ne`$. For this selected component, adding
the cleared monoid vector really reaches the forbidden subspace,
contradicting safety. This avoids treating a real-cone intersection
as an integer-monoid intersection without justification.

All limiting steps use closed finitely generated cones. Dividing the
unprojected vector by $`N^2`$ gives $`\mathbf1`$ in the
period cone; projecting and dividing by $`N`$ gives the positive
projected witness in the projected cone. Separating the excluded
negative witness from that cone gives a form nonnegative on every
period and strictly positive on $`e`$, with the stated annihilator.

The span claim also follows. A form annihilating all periods vanishes
on $`N^2\mathbf1+Ne-b`$ for infinitely many distinct $`N`$,
so the polynomial's coefficients vanish. In particular it annihilates
$`e`$. Finite-dimensional linear duality then gives $`e`$ in
the period span.

In any conic representation of $`\mathbf1`$, every positive
coefficient multiplies a period annihilated by every separating form:
the forms are nonnegative on each period and sum to zero on
$`\mathbf1`$. Nonnegative periods and the positive coordinates
of $`\mathbf1`$ imply that these active supports cover every
coordinate.

The calibration is correct. For the two crossed equality hyperplanes,
the annihilators with the required sign at $`(0,0,1,1)`$ are
positive multiples of $`x_2-x_0`$ and $`x_3-x_1`$. An active
period with at most two nonzero coordinates must therefore have support
$`\{0,2\}`$ or $`\{1,3\}`$, with equal positive entries
on that support. Covering all four coordinates needs both types, whose
supports cross. No stratified period set can do this.

As an interpretation, writing the separating forms as a matrix with
column vectors $`u_i`$, an active two-coordinate period joins
positively antiparallel columns, while an active singleton requires a
zero column. The simultaneous noncrossing cover is a substantive
condition. The note correctly leaves open whether every possible
choice of such columns and covers can be excluded for a primitive
word witness. Finding a crossing for one selected set of forms would
not establish that universal exclusion.

No substantive correction was found within this review's scope.
