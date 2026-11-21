# Nussbaum's three-valued Boolean period challenge

Checked 21 November 2026. Status: an active bounded research attempt, with no
proof, counterexample, submission, or payment. The full paid-target count is
unchanged.

## 1. Sponsor's exact target and cash offer

The final May 3 entry on
[Doron Zeilberger's official 2010 course page](https://sites.math.rutgers.edu/~zeilberg/math640_10.html)
asks for a proof or disproof that every periodic orbit of a Boolean-formula
map on

```math
Q_n=\{0,\tfrac12,1\}^n
```

has least period at most $`2^n`$, for every positive integer $`n`$. The
operations are OR = maximum, AND = minimum, and negation $`x\mapsto1-x`$.
It offers 100 US dollars for a proof and 25 US dollars for a disproof.
The heading prints a deadline of 3 May 2110. There is no express restriction
to enrolled students, and no donation recipient is named.

This is a public, source-stated personal cash offer. The page remains
available, but the present honoring of the offer and any eligibility details
not printed there are unconfirmed. No sponsor has been contacted. The
deadline is reported literally, rather than treated as a new guarantee.

The [published Maple generator](https://sites.math.rutgers.edu/~zeilberg/EM10/may3.txt)
chooses disjunctive-normal-form clauses and excludes a variable and its
negation from appearing together in a generated clause. The prose says
Boolean transformations more broadly. Since classically equivalent formulas
need not agree at $`1/2`$, this distinction matters. Any counterexample
constructed in this attempt must use noncontradictory clauses, and will
therefore satisfy the narrower generator convention as well.

The conjecture is uniform in $`n`$. A single explicit valid orbit of length
greater than $`2^n`$, together with its formula map, would refute the whole
advertised statement. Proving or testing another fixed value of $`n`$ would
not resolve it.

## 2. Prior-status and source comparison

Sources inspected:

1. [Nussbaum's sponsor-linked message](https://sites.math.rutgers.edu/~zeilberg/EM10/RogerNussbaumMessage.txt)
   identifies the general sup-norm conjecture, the known dimensions at that
   time, and the Lemmens--Scheutzow upper bound.
2. [Lemmens and Scheutzow, 2005](https://www.kent.ac.uk/smsas/personal/bl81/topical2.pdf),
   *On the dynamics of sup-norm nonexpansive maps*, proves the general upper
   bound
   
```math
\max_{0\le j\le n}2^j\binom nj.
```

   The [publisher record](https://doi.org/10.1017/S0143385704000665)
   states the same formula. Its smaller binomial bound for topical maps
   requires order preservation and additive homogeneity in the ordinary
   order, which arbitrary negated Boolean formulas do not possess.
3. [Lemmens, Scheutzow and Sparrow, 2007](https://doi.org/10.1016/j.ejc.2006.02.003),
   *Transitive actions of finite abelian groups of sup-norm isometries*,
   has an additional hypothesis excluding anticlockwise additive chains.
   The initial screen checked its abstract; the later
   [full primary manuscript](https://www.kent.ac.uk/smsas/personal/bl81/ejclemmens2.pdf)
   check found an explicit ternary eight-cycle violating that hypothesis.
   The [follow-up note](one-star-and-mixed-face-gap.md) verifies
   that this example also has a noncontradictory-DNF realization, so the
   hypothesis cannot be assumed for the sponsor's class.
4. [Lins, arXiv:2407.16671v2](https://arxiv.org/html/2407.16671v2),
   *Real analytic nonexpansive maps on polyhedral normed spaces*, proves the
   conjectured bound for real analytic maps. General minimum/maximum formula
   maps are not real analytic. The introduction still identifies the general
   conjecture as open. Its printed general-bound expression differs from
   the original 2005 theorem, so the original source is used for that bound.

Searches used the names Nussbaum, Lemmens and Zeilberger together with
Boolean, ternary, three-valued, Kleene, periodic, min-max and sup-norm. No
resolution of the exact advertised special class was found. This is a
bounded literature check, not a proof of priority or of absence from all
unindexed work.

The exact target was not found in the local campaign's previous target
notes or in a repository issue search. It is now reserved in
[issue 223, comment 7068594628](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068594628).

One nearby small symbolic offer was excluded: Holub's surviving
[200-euro word-power prize PDF](https://www.karlin.mff.cuni.cz/~holub/soubory/prizeproblem.pdf)
asks whether $`(u_1\cdots u_n)^k=u_1^k\cdots u_n^k`$ for $`k=2,3`$ can hold
without pairwise commutativity. [Saarela's 2017 theorem](https://ii.uni.wroc.pl/~aje/WordEq2017/papers/Saarela.pdf)
settles the more general three-exponent statement, including exponent 1.
It is not an eligible new target.

## 3. Information order and faces

Write $`*=1/2`$. Order one coordinate by $`*\preceq0`$ and
$`*\preceq1`$, with 0 and 1 incomparable, and give $`Q_n`$ the product
order. Every minimum, maximum and negation operation is monotone in this
information order. This follows directly from its three-valued truth table,
and hence holds for every formula.

For $`x\in Q_n`$, let

```math
V(x)=\{b\in\{0,1\}^n:b_i=x_i\text{ whenever }x_i\ne *\}
```

be its nonempty Boolean completion face. Then

```math
x\preceq y\quad\Longleftrightarrow\quad V(y)\subseteq V(x).
```

Two states are compatible when their faces intersect, equivalently when no
coordinate contains opposite definite bits. For distinct states, this is
equivalent to their sup-norm distance being $`1/2`$, rather than 1.

Every nontrivial periodic orbit is an information antichain. Indeed,
$`x\preceq F^j(x)`$ would give, after iteration by $`F^j`$, a cyclic chain
returning to $`x`$, so all its members would be equal. In addition, formula
maps are sup-norm nonexpansive. Distances along a finite periodic orbit
cannot strictly decrease and then return to their initial values, so the
cyclic permutation of the orbit preserves every distance and compatibility.

If an orbit contains a Boolean vertex, all later states are Boolean and
its period is at most $`2^n`$. Therefore a counterexample consists entirely
of nonbinary states, each with at least one star.

These observations are necessary conditions, not a proof of the bound.
For example, the map swapping two coordinates interchanges $`(0,*)`$ and
$`(*,0)`$, while their common completion $`(0,0)`$ is fixed. An arbitrary
Boolean completion does not lift the original period.

## 4. Exact interpolation criterion for noncontradictory DNF

Let $`S\subseteq Q_n\setminus\{0,1\}^n`$ be an information antichain.
Prescribe one output coordinate

```math
a:S\longrightarrow\{0,*,1\},
```

and write $`P=a^{-1}(1)`$, $`N=a^{-1}(0)`$, $`U=a^{-1}(*)`$.
A noncontradictory DNF clause is a minimum of literals, at most one of
$`x_i`$ and $`1-x_i`$ for each $`i`$. It corresponds to a Boolean face $`C`$:
the assignments satisfying every literal.

There is such a DNF whose restriction to $`S`$ is $`a`$ if and only if:

1. $`V(p)\cap V(z)=\varnothing`$ for all $`p\in P`$, $`z\in N`$.
2. For every $`u\in U`$,
   
```math
V(u)\not\subseteq\bigcup_{z\in N}V(z).
   \tag{1}
```


Here constant 0 and 1 are permitted as the empty disjunction and empty
conjunction. They can be excluded whenever the prescribed coordinate has
both a zero and a one, since neither is then needed.

### Necessity

A clause with satisfying face $`C`$ has value 1 at $`x`$ exactly when
$`V(x)\subseteq C`$; it has value 0 exactly when $`V(x)\cap C=\varnothing`$;
otherwise its value is $`*`$.

At a state $`p\in P`$, some clause has value 1. Every clause has value 0
at every $`z\in N`$, so the first condition follows.

At $`u\in U`$, some clause has value $`*`$. Its face meets $`V(u)`$ and is
disjoint from every $`V(z)`$, $`z\in N`$. Any Boolean vertex in that
intersection witnesses (1).

### Sufficiency and explicit construction

For each $`p\in P`$, include the clause specifying exactly the definite
bits of $`p`$, whose satisfying face is $`V(p)`$.
For each $`u\in U`$, choose

```math
b(u)\in V(u)\setminus\bigcup_{z\in N}V(z),
```

and include the full minterm specifying the Boolean vertex $`b(u)`$.

At $`z\in N`$, all clauses are zero by the two assumptions.
At $`p\in P`$, its own clause is 1.
At $`u\in U`$, the antichain condition prevents any $`P`$-clause from being
1: that would require $`V(u)\subseteq V(p)`$, or $`p\preceq u`$.
No full minterm is 1 at a nonbinary state. The minterm for $`b(u)`$ is
$`*`$ at $`u`$, so the maximum is exactly $`*`$.

This proves necessity and sufficiency, including an explicit formula
certificate. Applying it separately to every coordinate gives a criterion
for extending a prescribed map $`S\to Q_n`$ to a formula map of the narrower
class.

For a proposed cycle, the first condition is already forced by
compatibility preservation. The uncovered-completion condition is an
additional constraint. A cyclic isometry of faces cannot simply be assumed
to have a noncontradictory-DNF extension.

For a nontrivial cyclic orbit, no empty-clause convention is needed. An
all-zero output coordinate is also all-zero on the input orbit and can be
realized by its own positive input literal; an all-one coordinate has the
same identity-literal realization. Every state has a definite coordinate
unless the orbit is the singleton all-star state. Thus the construction
for a counterexample cycle can be written using nonempty literal clauses
and a nonempty disjunction in every coordinate.

## 5. Scope of the first computational attempt

The intended finite search seeks a counterexample to the whole uniform
statement. It must provide a list of distinct states, a cyclic permutation,
and explicit noncontradictory DNF clauses. A separate exact evaluator must
check every transition, every clause convention, and the strict period
inequality. Floating-point optimization output alone is not a certificate.

No such witness has been found at this checkpoint. No finite negative
search result will be counted as a resolution. The general upper bound,
the information-order antichain observation, and elementary representation
facts are not claimed as new mathematical discoveries.

The subsequent [local grid theorem](local-grid-and-one-star-orbit.md) proves the period bound whenever an orbit contains at least one one-star state, including mixed-face orbits. It passed [independent review](GRID_REVIEW.md) and [coordinator review](COORDINATOR_REVIEW.md). This is a uniform partial theorem, not a solution of the full sponsor statement.

Three further arguments apply with any number of stars per state. The [prime-power proof](prime-power-periods.md) counts Boolean vertices by lifting a common vertex of a maximal clique to distinct orbit faces. The [semiprime proof](semiprime-periods.md) reduces two distinct prime factors to the grid theorem. The [disconnected incompatibility proof](disconnected-conflicts.md) separates the coordinates responsible for different graph components. Other mixed-prime periods with connected incompatibility graphs remain unresolved in this work.
