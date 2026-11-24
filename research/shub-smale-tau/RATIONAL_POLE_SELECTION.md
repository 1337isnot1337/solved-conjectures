# Irreducible shifts and rational-pole selection

Status: a restricted lemma and exact method obstructions within the
unresolved tau project. No unrestricted factor extraction, root-count
bound, or separation is proved. Programs start with `1,x`; every scalar
used in a charged program is constructed from 1.

## 1. The separating shift depends only on irreducible factor count

Let `Q` be a nonzero polynomial in `Q[x]` with `r` distinct nonconstant
irreducible factors over `Q`. There is an integer

```math
1\le h\le {r\choose2}+1
```

such that `Q(x)` and `Q(x+h)` have disjoint complex root sets.

To prove this, normalize the distinct irreducible factors as monic
polynomials `P_1,...,P_r`. If `Q(x)` and `Q(x+h)` share a root, then
some `P_i(x)` and `P_j(x+h)` share a root. Both are irreducible over
`Q`, so they are identical. In particular their degrees agree. A
nonconstant monic polynomial cannot equal its own nonzero translate:
its coefficient of degree one less than its degree changes by `d*h`.
Thus `i!=j`. For each unordered pair, comparison of that same
coefficient determines at most one positive shift; reversing the pair
reverses its sign. There are at most `binom(r,2)` bad positive integers,
which proves the assertion. Multiplicities do not affect this argument.

The shift may be selected nonuniformly, and its integer constant costs
`O(log(r+1))` gates. In `COFACTOR_RECOVERY.md`, this replaces the earlier
`d^2+1` choice by `binom(r,2)+1`, where `d=deg rad(Q)`. The endpoint
products then cost `O(r^2+log(N+1))` gates. This improves only the shift
part of that proof. Its reduced rational denominator still has degree
`2d`, and its reconstruction still uses that degree.

For example, take `D=2^k`, `k>=1`, and `Q=x^D+2`. This polynomial has
a constant-free program of length `k+2` and is irreducible over `Q`.
Indeed, if it had monic nonconstant integer factors, reduction modulo
2 would force the constant coefficient of each factor to be even,
contradicting the constant coefficient 2 of their product. Monic Gauss
factorization reduces a rational factorization to this case.

Here `r=1`, so `h=1` separates the roots. The rational function

```math
\frac{Q'(x+1)}{Q(x+1)}-\frac{Q'(x)}{Q(x)}
```

has exactly `2D` simple poles with residues `+1` and `-1`; its reduced
denominator therefore has degree `2D`. Also `Q` has no real or rational
roots. Thus neither irreducible factor count nor rational-root count
controls the denominator degree in the existing reconstruction. This
is a limitation of that reconstruction, not a lower bound against a
method using the full circuit in another way.

## 2. Long equal jets can conceal a rational pole

For every integer `ell>=2`, set

```math
M=2^\ell-1,\qquad D=2^{\ell+1},\qquad P=x(2-x),
```

and define

```math
Q_0=x^D+2,\qquad Q_1=x^D+2-3P^M.
```

There are constant-free programs of lengths at most `ell+3` and
`3ell+6`, respectively. Construct 2 and 3 in two gates, construct `P`
in two gates, obtain `x^D` by `ell+1` squarings, and compute
`P^(2^ell-1)` with the recurrence `v_1=P`, `v_(j+1)=v_j^2 P`,
using `2ell-2` gates. Three final gates multiply by 3, add 2, and
subtract. All constants are charged.

The polynomial `Q_0` has no rational roots. Since `D>2M`, `Q_1` is
monic and has constant coefficient 2. Its possible rational roots are
therefore `1,-1,2,-2`. Direct substitution gives

```math
Q_1(1)=0,\quad Q_1(-1)=3+3^{M+1}>0,
```

```math
Q_1(2)=2+2^D>0,\qquad
Q_1(-2)=2+2^D+3\,8^M>0.
```

Moreover `Q_1'(1)=D`, because `P'(1)=0`. Thus `Q_1` has exactly one
rational root, namely the simple root 1.

For `i=0,1`, put

```math
L_i(x)=\frac{Q_i'(x+2)}{Q_i(x+2)}-\frac{Q_i'(x)}{Q_i(x)}.
```

Both denominators are nonzero at the centers 0 and 2. The difference
`Q_1-Q_0=-3[x(2-x)]^M` vanishes to order `M` at both centers. Dividing
by the nonvanishing `Q_0` and differentiating its formal logarithm
shows that the two logarithmic derivatives agree through order `M-2`
at both centers. Consequently

```math
L_1(x)-L_0(x)=O(x^{M-1})\quad\text{at }x=0.
```

Define the rational-pole part of a proper rational function with simple
poles as the sum of its principal parts at rational poles. The part of
`L_0` is zero, whereas the part of `L_1` is exactly

```math
\frac1{x+1}-\frac1{x-1}.
```

Thus an exponentially long common jet can conceal the presence of a
single rational root, even when the input programs have length
`O(ell)`. A selector using only these fixed-center jets cannot recover
the rational-pole part. This statement does not cover adaptive centers
or methods inspecting the entire program. It also does not prove that
the desired factor itself has large circuit complexity: in this example
that factor is simply `x-1`.

## 3. What a charged rational-pole projector would supply

Let `f in Z[x]` be nonzero, and let `q` be its number of distinct
rational roots. Write `rho(f'/f)` for the proper rational function

```math
\rho(f'/f)=\sum_{r\in\mathbb Q:\ f(r)=0}\frac{m_r}{x-r},
```

where `m_r` is the positive multiplicity. Suppose a constant-free
rational program of length `L`, with division allowed and every scalar
charged, computes this function. Then a division-free constant-free
program of length polynomial in `L+q+1` computes a nonzero integer
multiple of

```math
R_f(x)=\prod_{r\in\mathbb Q:\ f(r)=0}(x-r).
```

Here is the charged reduction. If `q=0`, output 1. Otherwise all residues
are nonzero, so the reduced denominator has degree exactly `q` and the
numerator has degree below `q`. For each divisor in the rational program,
its numerator after formal denominator clearing is a nonzero polynomial
of degree at most `2^L`. There are at most `L` such divisors. Hence one
may nonuniformly choose an integer center from
`{0,...,L*2^L}` at which all gates are defined. This center has an
`O(L+log(L+1))`-gate binary construction.

Evaluate the program in series arrays through order `2q-1` at that
center. This costs polynomially many rational scalar operations.
The degree-`q` normalized Padé denominator is uniquely determined by
those `2q` coefficients: the cross difference of two candidate proper
fractions has degree at most `2q-1` and vanishes to order `2q`.
The true reduced denominator therefore divides the other, and the
normalization fixes the scalar. Solve the resulting scalar linear
system, clear every scalar division using integer numerator/denominator
pairs, clear one common coefficient denominator, and translate back.
These steps produce a nonzero integer multiple of `R_f` with polynomial
charged cost. Neither a free root value nor an uncharged algebraic
constant is introduced.

This is a conditional reduction from the projector, not a construction
of the projector. In particular, obtaining a short representation of
`rho(f'/f)` already supplies the missing rational-root-factor selection
when `q` is small.

For the consecutive-root application with `f=H`, this `q` is at least
`N`, even if the cofactor has no rational roots. The lemma would then
pay polynomially in `N`. Projecting only the cofactor's logarithmic
difference can keep its rational support small, but does not by itself
remove the nonrational cofactor from `H`. Thus this conditional lemma
does not replace `deg rad(Q)` by the rational-root count of `Q` in
the consecutive extraction theorem.

Ordinary Galois averaging does not provide that projection. If `alpha`
has monic irreducible polynomial `P` of degree `d`, averaging the pole
`1/(x-alpha)` over a splitting-field Galois group yields

```math
\frac{P'(x)}{dP(x)},
```

which is nonzero for every `d`, not only `d=1`. The full logarithmic
derivative `f'/f` is already Galois invariant. Orbit sums are invariant
even when the individual roots are not rational. Selecting singleton
orbits is additional information, and no charged implementation of that
selection has been established here.
