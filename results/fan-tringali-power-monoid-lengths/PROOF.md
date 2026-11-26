# Fan–Tringali’s length-set conjecture

**Original statement (Fan–Tringali, Section 5).** If $H$ is a
Dedekind-finite monoid with an element of infinite order, then every
finite nonempty set of integers at least two occurs as a length set
in both its finitary power monoid (all finite nonempty subsets) and
its restricted finitary power monoid (such subsets meeting the
unit group). Here Dedekind-finite means that $ab=1$ implies $ba=1$.
The authors reduce the statement to the equality
```math
\mathscr L(\mathcal P_{\mathrm{fin},0}(\mathbb N_0))
=\{\{0\},\{1\}\}\;\cup\;\mathcal P_{\mathrm{fin}}(\mathbb N_{\ge2}).
```
The last term denotes the family of finite nonempty subsets.

**Result.** The equality holds, and so does the original quantified
statement. The same construction also proves Tringali’s 2026
survey Conjecture 5.1, for the *reduced* finitary power monoid of
every monoid with an element of infinite order, without a
Dedekind-finiteness hypothesis.

The construction gives more: for any finite nonempty multiset of
integers at least two, one can prescribe those lengths with those
multiplicities, counting factorizations up to permutation of their atom
factors. These realizations are also relatively cancellative in
Reinhart’s sense. We prove a graph realization statement from which
both conclusions follow.

## 1. Setting and the local gadget

For a nonnegative integer lattice, the reduced finitary power monoid
consists of its finite subsets containing zero, with sumset addition
and identity $`\{0\}`$. An atom is a nonidentity element that is not the
sum of two nonidentity elements. We use $+$ for sumsets, and write
$`B_J=\sum_{i\in J}\{0,e_i\}`$ for the Boolean box on a finite set
$J$ of coordinate indices. Set $`B_\varnothing=\{0\}`$.

Let $Y\subseteq\mathbb N_0^2$ be the nine occupied positions in this
array, with horizontal coordinate $x=0,1,2,3$ from left to right
and vertical coordinate $y=0,1,2,3$ from top to bottom:

```text
..##
.###
##..
##..
```

Here the auxiliary quotients need not contain zero. For either
coordinate $i$, there is a unique set $D_i$ such that
$`Y=D_i+\{0,e_i\}`$. All occupied runs in each row and column
have length two or three. A length-two run forces its only possible
domino start; in a length-three run the two endpoints force both
possible starts. Every legal domino lies within one run, proving
existence and uniqueness. But there is **no** $D$ with
$`Y=D+B_{\{1,2\}}`$: the occupied point $(1,1)$ lies in no
occupied unit square. The four candidate squares are blocked by,
respectively, one of $(0,0),(1,0),(0,1),(2,2)$.

## 2. Graph realization

Let $G$ be any finite simple graph on $[d]$, $d\ge1$.
We construct $X$ so that its unordered atomic factorizations
are in bijection with the maximal cliques of $G$, with length
$|J|+1$ for the clique $J$. A maximal clique is one that cannot
be enlarged, not necessarily a largest one.

Use $d$ ordinary coordinates and two extra coordinates $h,m$,
called height and marker. The height-zero part of $X$ is
$`B_{[d]}\times\{(0,0)\}`$. For each nonedge $`\{a,b\}`$ of
$G$, make a separate marker slice at height one. Put a copy of
$Y$ in ordinary coordinates $a,b$ and the entire
$`\{0,1\}`$ independently in each of the other ordinary coordinates.
The marker values can be the distinct integers $1,2,\ldots$.
If there are no nonedges, use a single upper slice containing the whole
Boolean box $B_{[d]}$. View each $B_J$ henceforth also as a set
at height and marker zero.

**Box-divisor lemma.** There is a set $C_J$ containing zero with
$X=B_J+C_J$ exactly when $J$ is a clique. When it exists,
$C_J$ is unique, with height-zero part $B_{[d]\setminus J}$.

Indeed, since $0\in B_J$, any candidate $C_J$ is a subset
of $X$. The sum with $B_J$ preserves height and marker, so
the individual slices can be treated independently. On the bottom
slice a coordinate of $J$ must be identically zero in the
quotient, since adding its coordinate unit must stay within the
Boolean box. Projection onto the remaining coordinates forces
$B_{[d]\setminus J}$.

In the slice for nonedge $`\{a,b\}`$, set
$`K=J\cap\{a,b\}`$. Each coordinate of $J\setminus K$ has
width one in the slice and must be zero in the quotient. After fixing
the coordinates outside $`J\cup\{a,b\}`$ to any binary values, the
remaining two-dimensional quotient must add to $Y$ with
$B_K$. If $K$ is empty, that quotient is $Y$; if
$|K|=1$, it is the unique domino quotient from Section 1; if
$|K|=2$, none exists. This proves the lemma, including uniqueness
across every slice. If there were no nonedges, the upper Boolean slice
is handled exactly like the bottom one.

**Atomic factorization lemma.** In every atomic factorization of
$X$, there is exactly one factor of positive height, since
coordinate maxima add under sumsets and the maximum height of
$X$ is one. All factors contain zero, so every height-zero
factor is contained in the bottom Boolean box and has marker zero.
Their product together with the height-zero part of the high factor
equals the bottom Boolean box.

In any sum of sets containing zero that equals a Boolean box, every
axis with width one must have a width-one contribution from exactly
one summand; all other summands have width zero on that axis. Thus
each summand is supported on its own set of axes, and projection of the
sum onto those axes forces that summand to be the full Boolean box on
them. Consequently every low atom is exactly $`\{0,e_i\}`$ for a
distinct ordinary axis $i$; conversely each such two-point set is
an atom. If the axes of the low atoms form $J$, the high factor is
$C_J$ by the box-divisor lemma.

For any clique $J$, this high quotient is an atom if and only if
$J$ is maximal. If $`J\cup\{v\}`$ is still a clique, uniqueness
gives $`C_J=\{0,e_v\}+C_{J\cup\{v\}}`$; both factors are
nonidentity. Conversely, in any decomposition of $C_J$ into
two nonidentity factors, just one has positive height. Their height-zero
parts sum to $B_{[d]\setminus J}$, so the low factor is a nonempty
coordinate box $B_I$ on axes outside $J$. Then $B_{J\cup I}$
divides $X$, contradicting maximality. This proves the asserted
bijection, since the low factors and the high quotient for each
maximal clique are all uniquely determined.

**Relative cancellativity.** Every binary decomposition of $X$
has one low factor $B_J$ and one high factor $C_J$, where $J$
is a clique; the low factor can be the identity. The box-divisor lemma
gives $C_J$ from $B_J$, while the height-zero part of $C_J$
gives $J$. Thus either summand determines the other. This is
precisely the implication $X=A+B=A+C\Longrightarrow B=C$
called relative cancellativity by Reinhart.

## 3. Transfer to one coordinate and apply

Let $M$ be an upper bound on every coordinate of every point of
$X$, and choose an integer $b>2M$. Encode lattice points by
$\phi(x)=\sum_{i=0}^{d+1}x_i b^i$, using any fixed order of the
coordinates. Every binary decomposition of $\phi(Z)$, for a
subset $Z\subseteq X$ containing zero, lifts uniquely to a
decomposition of $Z$: both factors in one dimension contain zero
and hence are subsets of $\phi(Z)$; after lifting them as sets,
their pairwise sums have coordinates at most $2M<b$. There are
no carries, and equality of encoded points means equality of their
coordinate vectors. Conversely a lattice decomposition maps down
by additivity. All factors and intermediate partial sums in a
factorization are themselves subsets of the original element, because
all other summands contain zero. Applying the binary observation
repeatedly preserves all factorizations and their atomicity.

Given a finite nonempty list $\ell_1,\ldots,\ell_s$ with each
$\ell_i\ge2$, let $G$ be the disjoint union of complete
graphs of orders $\ell_1-1,\ldots,\ell_s-1$. Its maximal
cliques are precisely those components, including any isolated
one-vertex components. The construction yields exactly one atomic
factorization for each list occurrence, and its length is
$\ell_i$. Taking lists without repetitions gives the conjectured
length sets. The sets $`\{0\}`$ and $`\{1\}`$ are supplied by the
identity and a two-element atom, and no other possibilities occur
outside the finite nonempty subsets of integers at least two:
every nonidentity set factors into atoms by induction on its maximum,
and each nonidentity factor contributes at least one to the maximum.

Finally, Fan–Tringali’s Theorem 3.8 and Proposition 3.2(iii)
(Theorem 4.11(i) in combined form) embed the reduced
$\mathbb N_0$ system of length sets into the systems for both
finitary power monoids in their conjecture, over every Dedekind-finite
non-torsion monoid. Thus the proof resolves their full statement, not
just numerical monoids.

For the survey formulation, if $u$ has infinite order in $H$,
then $n\mapsto u^n$ embeds $\mathbb N_0$ in $H$. Any factor
of the image of a set containing zero, in the reduced power monoid
of $H$, is a subset of that image because the other factors contain
the identity. So every such factor lies in the copy of
$\mathbb N_0$, and factorizations lift faithfully there. This
also transfers the multiplicity assertion to those reduced monoids. In the copied divisors, mutual divisibility is equality by containment, and a nonidentity summand increases the maximum exponent, so the survey’s irreducibles agree here with atoms.

## Sources and priority

- Y. Fan and S. Tringali, [*Power monoids: A bridge between
  factorization theory and arithmetic combinatorics*](https://doi.org/10.1016/j.jalgebra.2018.07.010),
  J. Algebra 512 (2018), 252–294, [Section 5 and Theorem 4.11(i) in
  the authors’ copy](https://imsc.uni-graz.at/tringali/docs/Fan%26Tringali_-_PMs.pdf).
- A. Reinhart, [*On the system of length sets of power
  monoids*](https://doi.org/10.4064/aa251028-7-7), Acta Arith. 224
  (2026), 363–386, [arXiv:2508.10209v2](https://arxiv.org/html/2508.10209v2).
  This work obtained all two-element length sets, an additive closure
  result for particular systems, and certain intervals; see its
  introduction for the distinction from the full conjecture.
- P.-Y. Bienvenu and A. Geroldinger, [*On algebraic properties of power
  monoids of numerical monoids*](https://d-nb.info/1354323661/34),
  Israel J. Math. 265 (2025), 867–900, Conjecture 1.1, states the
  numerical-monoid form.
- S. Tringali, [*Power monoids and their arithmetic: a survey*,
  Conjecture 5.1](https://arxiv.org/html/2602.15754v3#Thmconjecture1),
  arXiv:2602.15754v3, May 2026, records the still-open reduced
  formulation and explains the transfer to every non-torsion monoid.

Searches through these sources, the author-maintained
[power-semigroup bibliography](https://salvo-tringali.github.io/home/biblio-on-power-semigroups.html),
and exact-title and construction-related queries through November 24,
2026 did not identify a prior full resolution. This records the search,
not a guarantee of priority.
