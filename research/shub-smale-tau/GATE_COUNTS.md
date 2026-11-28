# Gate counts and complete computation histories

Status: research. No proof or disproof of the full conjecture is claimed.
Section 1 gives a valid real-root consequence of Risler's theorem. Section 2
records why a stronger proposed arithmetic bound has been withheld. The
remaining reductions and counterexamples have independent elementary proofs.
No novelty is claimed for the theorem combination.

## 1. An unconditional tradeoff from real additive complexity

For a division-free straight-line program beginning with `1,x`, let `a`
count additions and subtractions, let `m` count multiplications, and let
`s=a+m`. Let its nonzero output be `f`, and write `N_R(f)` and `N_Z(f)`
for its numbers of distinct real and integer roots.

The imported result is Jean-Jacques Risler, *Complexité et géométrie réelle*,
Séminaire Bourbaki exposé 637 (November 1984), Astérisque 133–134 (1986),
pp. 89–100, Proposition 3.1. It states that a nonzero real polynomial of
additive complexity at most `a` has at most `C_R^(a^2)` distinct real roots,
for an absolute constant `C_R`. The definition before the proposition allows
free real constants and does not charge multiplication or division.
Consequently the additive complexity of the present program is at most `a`.
The primary text and its displayed proposition were inspected:
<https://www.numdam.org/article/SB_1984-1985__27__89_0.pdf>.

Set `K=max(1,log_2 C_R)`. Addition does not increase the maximum degree of
an available register; multiplication at most doubles it. Therefore

```math
N_{\mathbb Z}(f)\le N_{\mathbb R}(f)
\le\min\{2^m,2^{Ka^2}\}.
\tag{1.1}
```

When `a=0`, every register is a monomial, so the bound of one root is
immediate. The imported theorem handles `a>=1`.

### Proposition 1.1

For every nonzero output of a length-`s` program,

```math
N_{\mathbb Z}(f)\le N_{\mathbb R}(f)
\le 2^{s-h_K(s)},\qquad
h_K(s)=\frac{\sqrt{1+4Ks}-1}{2K}.
\tag{1.2}
```

Proof. By definition `K h_K(s)^2+h_K(s)=s`. If `a>=h_K(s)`, use
`log_2 N_R(f)<=s-a<=s-h_K(s)`; if `a<h_K(s)`, use
`log_2 N_R(f)<=Ka^2<K h_K(s)^2=s-h_K(s)`. An output with no real
roots satisfies the conclusion directly, so no logarithm of zero is needed.

Thus the saving in the exponent is of order `sqrt(s)`. This remains an
exponential bound. It applies to real roots and uses no special information
from integrality. The more elementary factorial-divisibility bound in
ARITHMETIC.md does use integrality, although it is asymptotically weaker.

### Corollary 1.2

For `n>=1`, let

```math
\mu(n)=\min_{0\ne H\in\mathbb Z[x],\ F_{2^n}\mid H}\tau(H),
\qquad F_N(x)=\prod_{j=1}^N(x-j).
```

Then

```math
\mu(n)\ge n+\sqrt{n/K}.
\tag{1.3}
```

Indeed any such `H` has at least `2^n` real roots. Equation (1.1) forces
`m>=n` and `a>=sqrt(n/K)`, and `s=m+a`. The argument treats every
nonzero cofactor. It does not give a superpolynomial lower bound in `n`.

A related safe restriction is that programs with `a=O(sqrt(log s))`
have `s^{O(1)}` real roots, directly from the same imported theorem.

## 2. A stronger arithmetic source dependency is unresolved

Rojas, *Additive Complexity and the Roots of Polynomials Over Number
Fields and p-adic Fields*, arXiv:math/0201154v2 (2 April 2002), Theorem 1,
prints a stronger fixed-field root bound. Its Section 2 imports an
unrestricted arithmetic multivariate Descartes bound from
arXiv:math/0110327v3. The displayed proof of that imported bound contains a
valuation-count step that fails for tropically degenerate systems.

Here is a direct counterexample to that step. Over `C_2`, take

```math
Y-1-X=0,\qquad Y^{2^t}-1=0.
\tag{2.1}
```

The individual Newton polytopes have respectively three edges and one edge.
All torus solutions are isolated. For roots of unity of orders
`2,4,...,2^t`, the solutions `(X,Y)=(zeta-1,zeta)` have valuation vectors

```math
(1,0),(1/2,0),\ldots,(1/2^{t-1},0).
```

The shifted-cyclotomic calculation in Section 3 proves these valuations.
For `t>3`, the number of valuation vectors exceeds the product of the
edge counts. Geometric isolation is therefore insufficient for the claimed
edge-count argument.

Even the simplest case shows the failure of the associated mixed-volume
step over `Q_2` itself. The system `Y-1-X=0, Y^2-1=0` has the simple
torus root `(-2,-1)`, of valuation `(1,0)`. At that valuation the initial
Newton faces are parallel segments in the `Y` direction, so their mixed
volume is zero. The root nevertheless exists; the Jacobian determinant
there is two. A transverse tropical-intersection hypothesis cannot be
inferred from the triangular form of a circuit system.

This is a counterexample to the displayed proof step, not to the final
numerical bound for `Q_2` roots. In (2.1), among nontrivial roots of unity
only the one of order two belongs to `Q_2`. No counterexample to the final
2002 fixed-field inequality is asserted here. A repaired proof with the
needed unrestricted hypotheses has not been verified.

This scope issue is consistent with two later primary sources:
Koiran–Portier–Rojas, arXiv:1309.0486v1, Definition 1.9 and the following
paragraph, distinguish the general valuation count from the transverse
case covered by Smirnov's theorem. Goldstein–Rojas–Stone–Vera,
*New Explicit Root Counts for p-adic Circuit Systems*,
DOI <https://doi.org/10.1145/3832046.3832061> (published 18 August 2026),
describe previous explicit multivariate bounds as requiring tropical
genericity. The 2026 abstract was inspected; no inaccessible full text is
claimed to have been read.

Accordingly the proposed bound `2^(s-s/(log_2 s+8))` is retained only as
a conditional calculation in Appendix A. It is not listed as a verified
unconditional result. The status was corrected before repository publication.

Primary versions: <https://arxiv.org/pdf/math/0201154v2>,
<https://arxiv.org/pdf/math/0110327v3>, and
<https://arxiv.org/html/1309.0486v1>.

## 3. A false intermediate theorem in the 2003 source

Rojas, *A Direct Ultrametric Approach to Additive Complexity and the
Shub–Smale Tau Conjecture*, arXiv:math/0304100v2, 9 April 2003,
Theorem 2, claims that at most `a(a+1)/2` different valuations occur
among all nonzero `C_p` roots of a polynomial of additive complexity
at most `a`. That assertion is false as written.

Take

```math
F_t(x)=(1+x)^{2^t}-1.
```

It has additive complexity at most two. Its factorization is

```math
F_t(x)=x\prod_{j=0}^{t-1}\bigl((1+x)^{2^j}+1\bigr).
```

For the `j`th factor, its constant coefficient is two, its leading
coefficient is one, and all intermediate binomial coefficients are even.
The latter fact follows from `(1+x)^{2^j}=1+x^{2^j}` over `F_2`.
Its Newton polygon therefore has the single lower edge from `(0,1)`
to `(2^j,0)`, and its nonzero roots in `C_2` have valuation `2^{-j}`.
Thus the different nonzero root valuations of `F_t` are

```math
1,\frac12,\frac14,\ldots,\frac1{2^{t-1}}.
```

Already `t=4` gives four valuations although `a(a+1)/2=3`.
Equivalently, the lower hull for `F_4` has vertices
`(1,4),(2,3),(4,2),(8,1),(16,0)`.

The earlier Proposition 2 in that paper uses an incorrect Newton-polygon
rule for sums under cancellation. For example, over `Q_2`, the constant
polynomials `1` and `2^k-1` both have Newton point `(0,0)`, while their
sum has Newton point `(0,k)`, outside the convex hull of those inputs.
Thus the claimed containment and vertex-inheritance statement do not
hold. Theorem 3 of that paper explicitly invokes Theorem 2, so its
displayed proof cannot be used without repair. This audit does not claim
that every conclusion in the 2003 paper is false.

The counterexample concerns `C_2`, not `Q_2`: for `F_t`, only roots
zero and minus two lie in `Q_2` when `t>=1`. It is not a counterexample to the final numerical 2002 additive-complexity
bound. Section 2 identifies a separate gap in that bound's displayed source proof.

Versioned source: <https://arxiv.org/pdf/math/0304100v2>, Theorem 2,
Proposition 2, and Sections 4 and 6.

## 4. Fixed residue classes can encode all integer roots at linear cost

Fix a positive integer `p>=2`. For any nonzero `f in Z[x]` with a
length-`s` program, there is a nonzero `G in Z[y]` with a program of
length `O(s+tau(p))` such that

```math
f(r)=0\Longrightarrow G(1+pr)=0\qquad(r\in\mathbb Z).
```

Proof. Evaluate the original program at `(y-1)/p` by shared polynomial
numerator/constant denominator pairs. Initialize `x=(y-1,p)` and
`1=(1,1)`. For pairs `(A,B),(C,D)`, use

```math
(A,B)\mathbin\pm(C,D)=(AD\mathbin\pm BC,BD),\qquad
(A,B)(C,D)=(AC,BD).
```

Every denominator is a nonzero power of `p`; each gate requires at most
four new arithmetic gates. At the end, `G(y)/p^e=f((y-1)/p)` for some
nonnegative integer `e`. This proves the root inclusion and nonzeroness.
In fact roots in `1+pZ` correspond exactly to integer roots of `f`.

Therefore the fixed-prime digit hypothesis in the 2003 paper, counting
integer roots congruent to one modulo `p`, is indeed equivalent to tau,
but it has this independent proof requiring no valuation-count theorem.
Its apparent restriction to one residue class does not make the general
root configurations disappear.

## 5. Complete first-vanishing history is also tau-hard

One possible history-sensitive invariant assigns each root to the first
register that vanishes there. Multiplication cannot create a first zero
from two nonzero values. The natural hope is therefore a polynomial
bound on first zeros born at an addition/subtraction gate, assuming
every earlier register is nonzero at those inputs.

The following reduction shows that this restriction still contains the
whole conjecture, even with a monotone prefix. It addresses full program
history, not merely the two parents of the final gate.

### Proposition 5.1 (positive-pair simulation)

Given a length-`s` program for a nonzero `H in Z[x]`, there is a program
of length at most `6s+5` for `H` in which all nonzero integer roots
first vanish at the final subtraction gate.

Proof. Represent a value `h` by a pair `(A,B)` satisfying `h=A-B`.
For the input `x`, construct

```math
B=x^2+1,\qquad A=B+x=x^2+x+1.
```

Both are strictly positive on the real line. The only initialization
registers that may vanish are `x` and `x^2`, at zero. Represent the
constant one by `(2,1)`, with `2=1+1`. This takes four setup gates.

For `a=A-B` and `b=C-D`, use

```math
\begin{aligned}
a+b&=(A+C)-(B+D),
\\ a-b&=(A+D)-(B+C),
\\ ab&=(AC+BD)-(AD+BC).
\end{aligned}
```

These formulas use only additions and multiplications of strictly
positive polynomial registers. Addition/subtraction simulation costs
two gates, and multiplication simulation costs six. The differences
are symbolic representations; none is computed during the simulation.
Only at the end is `A-B=H` evaluated by one subtraction. Thus no
nonzero integer root of `H` zeros any prior register. Total size is
at most `4+6s+1`. This includes original zero registers: they become
equal positive pairs, not zero registers in the transformed program.

### Proposition 5.2 (all roots, a monotone prefix, and a fixed positive domain)

For `s>=1` and any nonzero length-`s` output `H`, there is a nonzero
polynomial `G` with exactly `N(H)` distinct positive integer roots,
produced by at most `12s+15` gates, such that:

1. every gate before the last is addition or multiplication;
2. every register before the last is strictly positive at every positive
   integer input;
3. the last gate is subtraction, and all roots of `G` first appear there.

Proof. The coefficient norm bound from the first research round gives
`||H||_1<=B=2^{2^{s-1}}`. Every nonzero integer root divides the first
nonzero coefficient, so every integer root lies in `[-B,B]`.
The constant `B` costs `s` gates: form two and square `s-1` times.
Construct `B+1`, set the substituted input to `y-(B+1)`, and replay
the program for `H`. This yields

```math
G(y)=H(y-(B+1))
```

in at most `2s+2` gates. Integer roots translate bijectively, and every
one becomes positive.

Now use the positive-pair simulation on this program, with the simpler
initial pairs `y=(y+1)-1` and `1=2-1`. These take two setup gates.
On every positive integer input both initial pairs, the original
inputs, and all subsequent sums and products are positive. The
simulation uses at most `6(2s+2)+2+1=12s+15` gates, followed only by
the final subtraction. This proves all three assertions.

A polynomial bound on first-vanishing roots in this promised class
would therefore prove tau. Conversely tau bounds the roots of every
register by a polynomial in its prefix length. Thus restricting to
first zeros, or insisting that their entire preceding history is
positive, is not by itself a weaker root-count problem. A successful
history-sensitive invariant must exploit information beyond these
zero/nonzero or sign patterns.

## 6. Joint multiplicative groups and the S-unit obstruction

A natural replacement for prime support is multiplicative rank. One short
constant may have enormously many prime factors, but the subgroup of
`Q^*` generated by `t` specified nonzero constants has rank at most `t`.
This distinction avoids the prime-support counterexample from the first
research round. It does not, by itself, control evaluations at many roots.

The relevant imported theorem is F. Beukers and H. P. Schlickewei,
*The equation x+y=1 in finitely generated groups*, Acta Arithmetica 78
(1996), 189--199, Theorem 1.1, DOI
<https://doi.org/10.4064/aa-78-2-189-199>. The author-hosted text is
<https://webspace.science.uu.nl/~beuke106/s-units.pdf>. It states that
the equation `u+v=1` has at most `2^(8r+8)` solutions in the divisible
closure of a fixed rank-`r` subgroup of `(C^*)^2`.

### Lemma 6.1 (what a fixed scalar trace group would give)

Let `R` be a finite set of positive integers, and suppose a subgroup
`Gamma` of `Q^*` of finite rank `rho` contains every `r` and `r+1`
for `r in R`. Then

```math
|R|\le 2^{16\rho+8}.
\tag{6.1}
```

Proof. The distinct pairs

```math
\left(\frac r{r+1},\frac1{r+1}\right),\qquad r\in R,
```

belong to `Gamma x Gamma`, have sum one, and are distinct because their
second coordinates are distinct. The group `Gamma x Gamma` has rank
`2rho`. Apply the imported theorem to its divisible closure.

This is a bound on a genuinely joint invariant. It is not a bound from
program length: even the one-gate program `x+1`, evaluated on any
chosen `N` distinct primes, has a scalar trace group of rank at least
`N`, since those input primes are multiplicatively independent.
That example is an evaluation-table obstruction, not a counterexample
to tau; the arbitrary sample points are not roots of `x+1`.

For a length-`s` program at a single input `r`, the group generated by
its nonzero register values has rank at most `s+1`. Across `N` inputs,
the group generated by all scalar register values can instead have
rank as large as `(s+1)N`. A bound for each individual group cannot be
substituted into (6.1), which requires one fixed group for all pairs.

### Lemma 6.2 (vector compression loses the field hypothesis)

Treating a register as the vector of its values on all `N` inputs
does reduce the multiplicative rank to the number of registers. But
these vectors live in the product ring `Q^N`, not in a field, and
coordinate projections can yield arbitrarily many scalar unit-equation
solutions from a vector group of rank at most two.

Proof. Choose any distinct positive integers `r_1,...,r_N` and put

```math
u=\left(\frac{r_i}{r_i+1}\right)_{i=1}^N,
\qquad
v=\left(\frac1{r_i+1}\right)_{i=1}^N.
```

The group generated by `u,v` under coordinatewise multiplication has
rank at most two, and `u+v=(1,...,1)`. Its `N` coordinate projections
give `N` distinct solutions of the scalar equation. Since `N` is
arbitrary, no field S-unit bound can be used to bound the number of
coordinate projections just from the rank of the vector group.

The shared circuit becomes a system of additive equations in such
vector generators. Compressing multiplication registers to monomials
recovers the additive presentation used by the attempted 2002 Rojas
argument. No new control of the number of rational coordinate
homomorphisms follows merely from this compression.


## A. Conditional calculation from the unresolved 2002 source dependency

Every assertion in this appendix that uses the 2002 root-count formula is
conditional on that formula holding without tropical-genericity assumptions.
The algebraic optimization is valid; the source dependency is unresolved.
It is retained to make the attempted argument and its exact gap reviewable.

Let a division-free straight-line program over `{+,-,*}`, beginning with `1,x`,
have `a` addition/subtraction gates and `m` multiplication gates. Put `s=a+m`.
Its nonzero output is `f in Z[x]`, and `N(f)` counts distinct integer roots.

### Conditional Lemma A.1

For `a>=1`,

```math
N(f)\le\min\left\{2^m,\ 37+a^2 25^a a!\right\}
\le\min\left\{2^{s-a},\ 2^{a(\log_2 a+7)}\right\}.
\tag{2.1}
```

For `a=0`, `N(f)<=1`.

Proof of the degree bound. Addition and subtraction do not increase the
maximum degree among available registers. A multiplication at most doubles
that maximum. Starting at degree one gives `deg f<=2^m`, hence `N(f)<=2^m`.

Proof that additive complexity is at most `a`. Process the program in order.
Treat the input `x` and every output of an addition/subtraction gate as formal
generators. Between these gates every available register is a constant times
a monomial in those generators. Multiplication preserves that description.
Every addition/subtraction gate introduces one new generator defined as the
sum of two such monomials; a subtraction is absorbed by a scalar coefficient
`-1`. This is exactly an additive presentation with at most `a` stages in
the sense of the 2002 paper. All constants belong to `Q_2`, so its Theorem 1
applies. Zero intermediate values cause no problem; the output is assumed
nonzero.

Here is a conservative explicit specialization of the imported formula,
avoiding reliance on its optimized decimal constants. Write

```math
c=\frac{e}{e-1},\quad
L=1+\log_2\frac{2}{\log2},\quad
K=1+\log_2\frac1{\log2}.
```

The first three terms of the theorem's formula are `1+2+8cL`, and its
`j`th later term is

```math
\frac13 j(6c)^j K L^{j-1}j!.
```

We have `c<8/5`, because `e>8/3`; also `log 2>2/3`, and
`log_2 3<8/5` because `3^5<2^8`. Thus `L<13/5`,
`6cL<624/25<25`, and `1+2+8cL<37`. Since `0<K<L`,
each later term is at most `j 25^j j!`. Summing at most `a` terms,
each at most `a25^a a!`, gives the first inequality in (A.1).
For `a<=2` the source uses fewer initial summands, so the same bound holds.
Integer roots are included among `Q_2` roots.

For `a>=1`, set `T=a^2 25^a a!`. Since `T>=25`, `37+T<3T`.
Using `a!<=a^a`, `log_2 a<=a-1` for positive integers, and `log_2 3<2`,

```math
\log_2(37+T)
\le \log_2 3+2\log_2a+a\log_225+a\log_2a
\le a(\log_2a+7).
```

When `a=0`, every register is a monomial in `x` with coefficient one;
the nonzero output has at most the root zero. This proves the lemma.

### Conditional Theorem A.2

For every `s>=1` and every nonzero output of a length-`s` program,

```math
\boxed{N(f)\le 2^{\,s-s/(\log_2s+8)}.}
\tag{2.2}
```

Proof. The case `a=0` follows from `N(f)<=1`. Otherwise put
`t=s/(log_2s+8)`. If `a>=t`, the degree bound gives
`log_2N(f)<=s-a<=s-t`, whenever `N(f)>0`. If `a<t`, then

```math
\log_2N(f)\le a(\log_2a+7)
\le a(\log_2s+7)
\lt t(\log_2s+7)=s-t.
```

The zero-root case is immediate. This proves the theorem.

The saving in the exponent is `(1+o(1))s/log_2s`. The resulting bound is
still exponential in `s`, not polynomial. This implication depends on the printed 2002 theorem. The source audit in
Section 2 prevents its use here as an established unconditional result.

### Conditional Corollary A.3

For

```math
\mu(n)=\min\left\{\tau(H):0\ne H\in\mathbb Z[x],\quad
\prod_{j=1}^{2^n}(x-j)\mid H\right\},
```

and `n>=1`,

```math
\boxed{\mu(n)\ge n+\frac{n}{\log_2n+8}.}
\tag{2.3}
```

Proof. Put `s=tau(H)`. There are at least `2^n` integer roots, so (A.2)
gives `n<=s-s/(log_2s+8)`. If `s>=2n`, the desired bound is automatic.
If `s<2n`, then `log_2s+8<=log_2n+9`, giving

```math
n\le s\left(1-\frac1{\log_2n+9}\right),
\qquad
s\ge n\frac{\log_2n+9}{\log_2n+8}.
```

This is (A.3). Unlike a lower bound for the exact product alone, the
argument covers arbitrary nonzero cofactors. It improves the elementary
`n+log_2n+O(1)` coefficient bound asymptotically, but does not approach the
superpolynomial growth needed for the BSS implication.

### Conditional Corollary A.4

For a family of length-`s` programs whose number of additions and
subtractions is `a=O(log s/log log s)`, the number of integer roots is
`s^{O(1)}`. This follows by substituting into
`log N(f)=O(a log(a+1))`. Consequently a family with root count $s^{\omega(1)}$ cannot have
$a=O(\log s/\log\log s)$. This is conditional on the same unresolved source dependency.

