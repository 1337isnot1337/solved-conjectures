# Why fixed rational shift filters do not remove nonrational cofactors

Status: an exact obstruction to a specified universal filter model.
No general circuit-dependent pole projector is ruled out or constructed.
The unrestricted consecutive-root all-multiples problem remains open.
The cofactor-recovery theorem still pays for the degree of its recovered
rational denominator.

This note extends the irreducible-shift example in
[RATIONAL_POLE_SELECTION.md](RATIONAL_POLE_SELECTION.md). It does not repeat the finite-jet
counterexample there or the anchored cofactor-difference theorem in
`ANCHORED_DIFFERENCES.md`.

## 1. Irreducible poles cannot cancel across distinct rational shifts

For a nonconstant polynomial `Q in Q[x]`, write `R_Q=Q'/Q`.

### Lemma 1.1

If `Q` is irreducible over `Q` and `h_1,...,h_r` are distinct rational
numbers, then the polynomials `Q(x+h_j)` are pairwise coprime.

**Proof.** Make `Q` monic. Its rational translates are still monic
irreducible polynomials. A common root of two would force those two
polynomials to be identical. If `D=deg Q`, the coefficient of `x^(D-1)`
in `Q(x+h)` is the corresponding coefficient of `Q` plus `D h`.
Characteristic zero therefore forces the two shifts to agree. QED.

Irreducibility in characteristic zero also makes every root of `Q`
simple. Thus `R_Q(x+h_j)` has a simple pole of residue one at each
root of `Q(x+h_j)`.

### Corollary 1.2

For every integer `q>=0`, the ordinary forward difference satisfies

```math
\Delta^q R_Q(x)=
 \sum_{j=0}^q(-1)^{q-j}\binom qj\frac{Q'(x+j)}{Q(x+j)}.
\tag{1.1}
```

It has exactly `(q+1)deg Q` distinct simple poles and reduced denominator

```math
\prod_{j=0}^q Q(x+j)
\tag{1.2}
```

up to a nonzero scalar. Indeed the supports are disjoint by Lemma 1.1
and every displayed residue is nonzero. The same conclusion, with one
factor for every selected shift, holds for any finite weighted sum with
nonzero rational weights.

This is the opposite of cofactor annihilation. Finite differencing of
a polynomial eventually vanishes, but finite differencing of its
logarithmic derivative does not. For the prescribed factor
`F_N=product_(j=1)^N(x-j)`, the first difference of `F_N'/F_N` telescopes
to `1/x-1/(x-N)`. For an irreducible nonrational cofactor, the same
operation doubles rather than removes its pole support.

## 2. A finite shift/differential filter obstruction

Consider a fixed linear operator on rational functions of the form

```math
(\mathcal L R)(x)=
 \sum_{j=1}^r\sum_{\ell=0}^{d_j}
   a_{j,\ell}(x)R^{(\ell)}(x+h_j),
\tag{2.1}
```

where the shifts `h_j` are distinct rational numbers, all
`a_(j,ell) in Q(x)`, and `a_(j,d_j)!=0`. Zero shift blocks are
discarded. Let `B` bound the degrees of the numerator and denominator
of every nonzero coefficient in reduced form. The derivative orders
are arbitrary finite nonnegative integers.

Finite compositions and sums of rational-coefficient multiplication,
rational translation, and differentiation can be put in (2.1), using
the product rule and shifting the rational coefficients. Thus the model
includes fixed finite differences and finite weighted translated sums.

### Theorem 2.1

Let `Q in Q[x]` be irreducible with degree `D>B`, `D>=2`. For every
shift block `j`, `L(R_Q)` has a pole of exact order `d_j+1` at every
root of `Q(x+h_j)`. In particular it has at least `rD` distinct
nonrational poles.

**Proof.** Let `alpha` be a root of `Q` and put `beta=alpha-h_j`.
Its minimal polynomial over `Q` is the degree-`D` polynomial
`Q(x+h_j)` after monic normalization. Therefore no nonzero rational
polynomial of degree less than `D` vanishes at `beta`. Every coefficient
in (2.1) is consequently regular there, and every nonzero coefficient
is nonzero there.

By Lemma 1.1 all other shift blocks are regular at `beta`. Within the
`j`th block,

```math
R_Q^{(\ell)}(x+h_j)
 =\frac{(-1)^\ell\ell!}{(x-\beta)^{\ell+1}}
   +\text{a function regular at }\beta.
```

The unique highest-order pole has leading coefficient
`(-1)^(d_j) d_j! a_(j,d_j)(beta)`, which is nonzero. It cannot cancel
against a lower derivative or another shift. Finally `D>=2` makes
all these poles nonrational, and Lemma 1.1 makes the `r` pole sets
disjoint. QED.

### Corollary 2.2: the prescribed interval does not repair the filter

Let `N>=1`, `e>=1`, and

```math
H=F_N Q^e.
```

Under the hypotheses of Theorem 2.1, `L(H'/H)` retains every one of
the nonrational poles asserted there, with the same orders.

**Proof.** The identity

```math
H'/H=F_N'/F_N+eR_Q
```

is exact. Every translate and derivative of `F_N'/F_N` has only
rational poles. The coefficient denominators of the filter cannot
vanish at the degree-`D` points in the theorem. Thus `L(F_N'/F_N)`
is regular at all of them, while multiplying the nonzero leading
Laurent coefficients of `L(R_Q)` by `e` cannot cancel them. QED.

The counterexample has only one irreducible cofactor factor and no
rational cofactor roots. It does not rely on unknown multiplicity:
already `e=1` suffices.

## 3. Charged counterexamples and the degree limitation

Take

```math
Q_k(x)=x^{2^k}+2,\qquad k\ge1.
\tag{3.1}
```

This is monic, irreducible, and positive on the real line. For
completeness, a nontrivial monic integer factorization would reduce
modulo 2 to a factorization of `x^(2^k)`, forcing both constant
coefficients to be even. Their product could then not be 2. Gauss's
lemma reduces any rational factorization to such an integer one.

Starting from `1,x`, compute 2 with one addition, square `x` `k`
times, and add 2. Thus `tau(Q_k)<=k+2`.

For a specified filter with coefficient-degree bound `B`, choose
`k>=1` with `2^k>B`. Theorem 2.1 then supplies a positive irreducible
counterexample with `O(log(B+2))` charged gates. In particular, if
all the filter's rational coefficient functions have a joint rational
arithmetic program of `t` gates from `1,x`, their syntactically cleared
numerators and denominators have degree at most `2^t`. One may take
`k=t+1`, giving a cofactor program of length `t+3`.

These quantifiers concern a filter fixed before the cofactor. They do
not disprove a family of filters whose coefficients depend on the
entire input circuit or on an externally bounded finite input class.
For a size-dependent filter with coefficient circuit length `t(s)`,
the adversarial cofactor above may have length `t(s)+3`, rather than
the original budget `s`.

Nor is coefficient degree a circuit lower bound. The polynomial
`Q_k` itself has exponentially large degree and a short circuit. If
the cofactor `Q` is supplied, multiplication by `Q` gives

```math
Q\frac{H'}H=Q\frac{F_N'}{F_N}+eQ'
\qquad(H=F_NQ^e),
\tag{3.2}
```

which has no nonrational poles and retains each prescribed rational
pole, since `Q(j)!=0` for `j=1,...,N`. This coefficient has degree
`D`, outside the strict `B<D` hypothesis, and may be short. Equation
(3.2) is not a solution to unknown-cofactor recovery: it assumes the
cofactor program is already available. It explains exactly why the
low-degree filter theorem must not be promoted to a prohibition of
adaptive short-circuit coefficients.

## 4. Irreducible cofactors do not escape the existing fixed-probe barrier

This section is explicitly in the **unbounded universal fixed-probe
model** of `ANCHORED_DIFFERENCES.md`, Proposition 4.2. There is no
Zariski-density claim for programs of a fixed constant-free length:
only finitely many such programs exist.

Fix `N`, distinct nonconstant rational nodes `z_i(x) in K=Q(x)`, and
positive integers `m_i`, with `M=sum_i m_i>=1`. At node `z_i`, use
the complete jet block `H^(j)(z_i(x))` for `0<=j<m_i`, as in that
proposition. With no probes the conclusion is immediate. Suppose a fixed rational
expression in those probes is defined on a dense part of its domain
and returns the same element `B(x) in K` for every `H=F_NQ`, even if
the promise is restricted to monic irreducible integer cofactors of
degree at least two. Then the expression is independent of its probe
variables, just as in Proposition 4.2.

Here is the additional density argument needed for the restriction.
Choose any fixed `D>=max(M,2)` and vary `c_0,...,c_(M-1)` over all
integers in the family

```math
Q_{\mathbf c}(t)=t^D+2+4c_0
                   +2\sum_{j=1}^{M-1}c_jt^j.
\tag{4.1}
```

Every member is monic and Eisenstein at 2: all nonleading coefficients
are even and the constant coefficient is 2 modulo 4. Thus every
member is irreducible of degree `D>=2`, has no rational root, and is
coprime to `F_N`.

The variation of its `M` lower coefficients is an invertible diagonal
affine transformation of the integer grid. The Hermite evaluation
matrix at the `M` prescribed jet coordinates is invertible over `K`
on polynomials of degree below `M`: an element of its kernel would
be divisible by a degree-`M` product of the distinct node factors.
Consequently the jets of (4.1) form a Zariski-dense subset of `K^M`.
Multiplication by `F_N` is invertible on each jet block, because
`F_N(z_i(x))!=0` for a nonconstant node. The probes of `H=F_NQ_c`
are therefore dense as well. Clearing the denominator of the fixed
expression minus `B(x)` proves that it is identically zero.

This also applies to a fixed rational expression built from finitely
many shifted logarithmic derivatives: each such input is a rational
combination of finitely many of the polynomial's jets. In particular,
the promised absence of rational cofactor roots does not turn the
fixed-probe approach into a cofactor-assisted formula for `F_N'/F_N`.
A cofactor-independent expression already represents that same
rational function without depending on its probes. The charged
oracle-elimination qualification is exactly the one in Proposition
4.2; no new division-free exact-factor extraction is inferred here.

The coefficient grid in (4.1) is unbounded, and its members do not
have one common bound on constant-free program length. This argument
does not apply to adaptive nodes, circuit-dependent branches,
cofactor-dependent coefficients, or all programs within one fixed
length budget.

## 5. Consequence for the proposed recovery route

The existing recovery theorem uses the actual reduced denominator of
the shifted cofactor logarithmic derivative. An irreducible cofactor
can already make that denominator exponentially large while having
no rational roots. The filter theorem proves that replacing the
reconstruction by a fixed finite rational shift/differential filter
does not remove this obstacle. Finite translated sums retain disjoint
irreducible pole sets, and low-degree rational coefficients cannot
cancel their highest Laurent terms.

The missing possibility is an input-circuit-dependent construction
that produces suitable high-degree coefficients or a different exact
operation without first recovering the cofactor. Neither the filter
theorem nor the unbounded fixed-probe argument rules out that
possibility. No such charged construction has been proved in this
note.
