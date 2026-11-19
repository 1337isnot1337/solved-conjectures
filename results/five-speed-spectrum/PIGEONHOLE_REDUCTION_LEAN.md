# Elementary finite/infinite reduction

The new reduction replaces the lattice-volume inputs by an exact finite
pigeonhole argument. It produces larger coordinate cutoffs and keeps the
remaining finite classifications explicit.

## Approximation theorem

Let `v : Fin (n+1) → ℕ` be primitive, meaning that the gcd of its coordinate
list is `1`. Let `N` be its last coordinate and let `B` be a positive
integer. If `B^n < N`, then there exist an integer vector `w` and a real
number `t` such that

```math
  0\lt t<1,\qquad
  |w_i-t v_i|<1/B\quad\text{for every }i,
```

and `w` is not a real scalar multiple of `v`.

The coordinate `N` need not be the largest coordinate. Permuting coordinates
later makes the same argument apply to every entry.

For `0 ≤ k < N`, consider the `n` exact integer labels

```math
  \left\lfloor \frac{B(kv_i\bmod N)}{N}\right\rfloor,
  \qquad 0\le i\lt n.
```

Each label belongs to `{0,…,B−1}`, so there are at most `B^n` label vectors.
Two indices `k<l<N` have the same label vector. Set

```math
  t=\frac{l-k}{N},\qquad
  w_i=\left\lfloor\frac{lv_i}{N}\right\rfloor
      -\left\lfloor\frac{kv_i}{N}\right\rfloor.
```

The fractional parts for `k` and `l` lie in the same interval of length
`1/B`. Their difference gives the displayed approximation bound. For the
last coordinate, the error is exactly zero and `w_n=l−k`.

If `w=r v`, its last coordinate forces `r=t`. The gcd condition implies
that any real scalar taking all coordinates of `v` to integers is itself
an integer. This follows from the integer Bézout identity, iterated along
the list of coordinates. Since `0<t<1`, parallelism is impossible.

The proof uses natural-number division and remainders. The finite labels
and the error identity are exact.

## The rational plane and its value

The vectors `v` and `w` span a rational plane `F` of dimension two. If
every coordinate of `v` is positive, then `F` is coordinate-free.

The verified coefficient-rounding theorem gives

```math
  \mathop{\mathrm{spaceValue}}(\mathop{\mathrm{realSpan}}F)
  \le \mathop{\mathrm{value}}(v)+\frac{1}{2B}.
```

The estimate applies to the full real plane. It is not restricted to the
sample times used to construct `w`.

## Four-speed cutoff

Every coordinate-free rational plane in four coordinates has value at
least `1/4`. Coordinate coalescence reduces this claim to the verified
bound for at most three distinct positive speeds.

For a primitive positive four-speed tuple with value below `2/9`, take
`B=18`. If its last coordinate exceeded `18^3`, the constructed plane
would satisfy

```math
  \mathop{\mathrm{spaceValue}}(F)
  \le \mathop{\mathrm{value}}(v)+\frac1{36}
  <\frac29+\frac1{36}=\frac14,
```

which contradicts that plane lower bound. Permutation invariance gives

```math
  v_i\le 5832\quad\text{for every coordinate }i.
```

The verified exported interface is:

```lean
theorem Loneliness.Pigeonhole.four_speed_cutoff
    (v : Fin 4 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : Loneliness.value (List.ofFn v) < (2 / 9 : ℝ)) :
    ∀ i, v i ≤ 5832
```

This cutoff does not assume the four-speed gap. The finite classification
of primitive tuples within the cutoff is a separate theorem. Distinctness
and sorting are not assumptions of the cutoff.

## Five-speed cutoff

For five speeds, take `B=23`. The constructed plane then has value
strictly below `2/9` whenever the original line has value below `1/5`,
because

```math
  \frac15+\frac1{46}<\frac29.
```

The finite critical-plane theorem classifies such planes, conditional on
the four-speed gap. Every coordinate-free integer direction in an
accepted plane has value `s/(5s+1)` below `1/5`.

Consequently, a primitive positive five-speed tuple of value below `1/5`
satisfies at least one of the following:

- every coordinate is at most `23^4 = 279841`;
- its value is `s/(5s+1)` for an integer `s≥1`.

The four-speed gap is an explicit hypothesis of this five-speed reduction.
The finite five-speed classification within the cutoff remains separate.

The proof composition is checked separately from the finite critical-plane
evidence. `LonelinessFiveSpeedReduction` takes both `FourSpeedGap` and
`CandidatePairsChecked` as explicit parameters. The latter is the exact
finite Boolean coverage proposition. `LonelinessFiveSpeedCutoff` removes
that parameter by using all 64 certificate blocks. Those blocks and the
final wrappers have passed their gates, so finite coverage is discharged
in the final cutoff theorem.

## Structural five-speed cutoff

The stronger endpoint uses the existing predicate
`CriticalFamilies.ContainsCriticalQuadruple`. It means that the speed list
contains a positive integer dilation of either `{1,2,3,4}` or `{1,3,4,7}`.
Containment concerns membership, so this predicate also applies to lists
with repeated entries.

Every integer direction with nonzero coordinates in a classified critical
product plane has this property. This structural statement does not need a
value bound on the direction. It follows from the critical quadruple in
the product plane, then transfers through the signed coordinate
permutation used by the classification.

The resulting finite/infinite endpoint is:

```lean
theorem Loneliness.Pigeonhole.five_speed_finite_or_critical_quadruple
    (hgap : Loneliness.CoordinateSubspace.FourSpeedGap)
    (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : Loneliness.value (List.ofFn v) < (1 / 5 : ℝ)) :
    (∀ i, v i ≤ 279841) ∨
      Loneliness.CriticalFamilies.ContainsCriticalQuadruple (List.ofFn v)
```

Thus every primitive nonfamily tuple below `1/5` lies inside the finite
coordinate box. This is the endpoint required to prove the exact list of
twelve nonfamily tuples. The weaker spectrum endpoint alone cannot prove
that list, since the twelve exceptional tuples also have spectrum values
of the form `s/(5s+1)`.

## Modules and verification

| Module | Statement |
|---|---|
| `LonelinessPigeonhole` | Primitive scaling, exact grid collision, independent integer approximation |
| `LonelinessPigeonholePlane` | Rational plane, dimension two, actual value bound |
| `LonelinessFourSpeedCutoff` | Unconditional cutoff `5832` for primitive four-speed tuples below `2/9` |
| `LonelinessFiveSpeedReduction` | Finite-or-spectrum proof with both mathematical and finite-coverage inputs explicit |
| `LonelinessFiveSpeedCutoff` | Conditional finite-or-spectrum result with cutoff `279841` |
| `LonelinessPlaneProductFamily` | Every nonzero integer direction in a critical product plane contains a critical quadruple |
| `LonelinessFiveSpeedFamilyCutoff` | Conditional finite-or-critical-quadruple result with cutoff `279841` |

`LonelinessPigeonhole`, `LonelinessPigeonholePlane`, and
`LonelinessFourSpeedCutoff` passed source checking and independent replay
with the pinned stock `leanchecker`. Their ten theorem declarations passed
the transitive axiom audit; only `propext`, `Classical.choice`, and
`Quot.sound` occur.

The five-speed proof core and final wrappers also passed source checks,
transitive axiom audits, and independent stock kernel replay. The 64
finite-plane certificate blocks passed their hosted gates, and the full
semantic composition passed against their hash-verified artifacts.

The two structural modules also passed source checks and separate stock
kernel replays. Their six theorem declarations passed the transitive
axiom audit with only the same three standard axioms.

The finite four-speed search and finite five-speed search are not supplied
by these cutoff modules. The stronger structural endpoint reduces the
exact nonfamily classification to the finite box, but does not assert its
enumeration result.
