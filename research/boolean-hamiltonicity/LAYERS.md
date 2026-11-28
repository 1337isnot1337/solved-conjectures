# Multilinear layers and a restriction for directed Hamiltonicity

## Status and scope

This note proves identities for two Boolean graph predicates and an explicit
restriction between them. It does not prove a superpolynomial Boolean circuit
lower bound, a uniform time lower bound, or P != NP. The missing implication is
a bound on an invariant of the full containment predicate that holds for every
small Boolean circuit, including circuits with negations and shared subcircuits.

The results below are elementary deductions. No claim of prior novelty is made.
The associated tracking issue is
[solved-conjectures #251](https://github.com/1337isnot1337/solved-conjectures/issues/251).

## 1. Definitions and unique multilinear extensions

Fix an integer m >= 2. Graphs are simple directed graphs without loops on the
labelled vertex set [m]. Both opposite arcs between a pair of vertices are
allowed. Write E_m for the set of possible arcs and H_m for the collection of
arc sets of directed Hamiltonian cycles. A cycle is counted once, without a
distinguished starting vertex. Thus every H in H_m has m arcs and
|H_m| = (m-1)!.

For S contained in E_m define I_m(S) = 1 if S itself belongs to H_m and 0
otherwise. Define C_m(S) = 1 if some H in H_m is contained in S and 0 otherwise.
The two predicates mean respectively that the graph **is** a Hamiltonian cycle
and that it **contains** a Hamiltonian cycle. Also put

```math
h_m(T)=|\{H\in\mathcal H_m:H\subseteq T\}|,
\qquad
x^T=\prod_{e\in T}x_e,
\qquad
HC_m(x)=\sum_{H\in\mathcal H_m}x^H.
```

Let K be any field. A Boolean value is viewed as the corresponding element 0
or 1 of K. Every function f from {0,1}^E to K has a unique multilinear polynomial
extension, denoted M(f). Explicitly,

```math
M(f)(x)=\sum_{S\subseteq E}
 f(1_S)x^S\prod_{e\in E\setminus S}(1-x_e).
```

Here 1_S is the incidence vector of S. The displayed polynomial is multilinear.
At 1_T its only possibly nonzero summand is the summand indexed by S = T,
which equals f(1_T). For uniqueness, if a multilinear polynomial
sum_T a_T x^T vanishes on the Boolean cube, evaluation at 1_S gives
sum_{T contained in S} a_T = 0. Induction on |S| gives a_S = 0 for every S.

Expanding the displayed polynomial gives the coefficient formula

```math
[x^T]M(f)=\sum_{S\subseteq T}(-1)^{|T|-|S|}f(1_S).
```

These statements hold in every characteristic. Integers appearing as
coefficients below are mapped to K. Write I_m^* = M(I_m) and C_m^* = M(C_m).

## 2. The shared minimal layer

**Proposition 2.1.** The predicates I_m and C_m agree on graphs having at most
m arcs. Both multilinear extensions have no terms below degree m, and their
degree-m homogeneous components are HC_m.

**Proof.** If a graph with at most m arcs contains an m-arc Hamiltonian cycle,
its arc set equals that cycle. Consequently both predicates are zero below
m arcs and their common value on an m-arc set T is 1 exactly when T belongs
to H_m. For |T| < m, every value in the coefficient formula is zero. For
|T| = m, its only potentially nonzero term is S = T. This proves the
homogeneous-component assertions. ∎

More generally, if two Boolean functions agree on all inputs of Hamming weight
at most d, their unique multilinear extensions have identical homogeneous
components through degree d. This follows directly from the same coefficient
formula: the coefficient indexed by T depends only on inputs S contained in T.

**Proposition 2.2.** The family I_m is decidable in deterministic polynomial
time and has a polynomial-time uniform family of fan-in-two Boolean circuits
of size O(m^3), with AND, OR, and NOT gates.

**Proof.** Check that every vertex has exactly one outgoing arc and exactly
one incoming arc. The graph is then a disjoint union of directed cycles.
Check that every vertex is reachable from vertex 1; this holds precisely when
there is one cycle. The tests give a deterministic polynomial-time algorithm.

For a direct circuit bound, impose each exactly-one condition by an OR of
its entries together with the negation of the AND of each pair of entries.
There are O(m^3) gates across all rows and columns. Reachability from vertex 1
by a walk of length at most k has the recurrence

```math
R_{0,j}=[j=1],
\qquad
R_{k,j}=R_{k-1,j}\lor
 \bigvee_{i\ne j}(R_{k-1,i}\land x_{ij}),
\quad 1\le k\le m-1.
```

Replace every displayed disjunction by a binary tree of OR gates. The
recurrence has O(m^3) gates. Conjoin R_{m-1,j} for all vertices with the
degree conditions. If those conditions hold, reachability of all vertices
is equivalent to a single directed cycle. A deterministic circuit generator
enumerates these gates using the displayed finite loops in polynomial time. ∎

Thus the shared degree-m component cannot by itself distinguish the easy
predicate from the containment predicate. In particular, a proposed
lower-bound criterion applying to arbitrary Boolean predicates and depending
only on these shared components would give the same answer for I_m and C_m.
It cannot correctly conclude that every circuit for C_m is superpolynomial
from those components alone while keeping its claimed validity for I_m.

## 3. All higher coefficients

**Proposition 3.1.** The exact-cycle predicate has the extension

```math
I_m^*(x)=\sum_{H\in\mathcal H_m}
 x^H\prod_{e\in E_m\setminus H}(1-x_e).
```

For every T contained in E_m,

```math
[x^T]I_m^*=
\begin{cases}
0,&|T|\lt m,
\\ (-1)^{|T|-m}h_m(T),&|T|\ge m.
\end{cases}
```

**Proof.** The extension formula has a nonzero term only at the inputs that
are exactly Hamiltonian cycles. In the summand indexed by H, the monomial
x^T occurs precisely when H is contained in T. Its coefficient is
(-1)^{|T|-m}. Summing over H proves the claim. ∎

For the containment predicate, work temporarily in the Boolean quotient
ring

```math
B_E=K[x_e:e\in E]/(x_e^2-x_e:e\in E).
```

Reduction modulo these relations takes each monomial to the product of the
variables in its support. Every class has a unique multilinear representative,
as is also proved by the uniqueness argument in Section 1. Let ML denote
this reduction followed by selection of the multilinear representative.

**Proposition 3.2.** The containment extension is

```math
C_m^*(x)=\mathop{\mathrm{ML}}\left(
 1-\prod_{H\in\mathcal H_m}(1-x^H)\right)
=\sum_{\varnothing\ne\mathcal F\subseteq\mathcal H_m}
 (-1)^{|\mathcal F|+1}x^{\bigcup_{H\in\mathcal F}H}.
```

Consequently,

```math
[x^T]C_m^*=
\sum_{\substack{\varnothing\ne\mathcal F\subseteq\mathcal H_m
                 \\ \bigcup_{H\in\mathcal F}H=T}}
(-1)^{|\mathcal F|+1}.
```

**Proof.** At a Boolean graph input, the product is 1 if no Hamiltonian cycle
is present and 0 if at least one is present. Subtraction from 1 therefore
computes C_m. Expansion of the product followed by Boolean reduction replaces
the product over a family of cycle monomials by the monomial on their union.
The resulting polynomial is multilinear and has the correct Boolean values,
so uniqueness proves the identity. Grouping terms by their union proves the
coefficient formula. ∎

The union is essential: a shared arc appears once after Boolean reduction,
regardless of how many cycles in the family use it. Replacing unions by
disjoint products gives a different polynomial.

## 4. The first overlap layer

**Lemma 4.1.** Distinct directed Hamiltonian cycles on m vertices differ in
at least three outgoing arcs. Equivalently, their union has at least m+3 arcs.

**Proof.** Each cycle is a permutation giving the outgoing neighbour of every
vertex. Two permutations cannot differ at exactly one vertex, since their
images are the same set. If they differ at exactly two vertices a and b,
the new outgoing neighbours at a and b must be the two original neighbours
in the opposite order. Deleting the original outgoing arcs at a and b splits
the directed cycle into two directed paths. Reconnecting the tails to the
opposite heads closes those paths separately, producing two cycles rather
than one. Thus a second Hamiltonian cycle cannot differ at two vertices
either. The number of arcs in the union is m plus the number of differing
outgoing arcs. ∎

**Theorem 4.2.** For m >= 3, the degree-(m+1) and degree-(m+2) homogeneous
components of C_m^* vanish. Moreover,

```math
[C_m^*]_{m+3}=
-\sum_{\substack{T\subseteq E_m\\|T|=m+3\\h_m(T)=2}}x^T.
```

Every nonzero coefficient in this component is -1 in K. The number of
distinct monomials in this component is

```math
\frac{(m-1)!}{2}\binom{m}{3}.
```

**Proof.** A singleton family in Proposition 3.2 has union size m. A family
with at least two cycles has union size at least m+3 by Lemma 4.1. This proves
the two vanishing statements.

Now let |T| = m+3 and fix H contained in T if such a cycle exists. Any second
Hamiltonian cycle H' contained in T differs from H in at least three outgoing
arcs, but T contains only three arcs outside H. It must therefore use all
three of those arcs. The outgoing choices at their tails are forced, and
at every other vertex the outgoing arc of H is forced. Hence there is at
most one possible second Hamiltonian cycle. This also proves h_m(T) <= 2.
If there are two cycles, their union is T and the only family with union T
is that pair. Its coefficient is -1. If there are fewer than two, no family
of cycles has union T. This proves the component identity.

To count its monomials, fix H and choose three distinct tails a_1,a_2,a_3
in their cyclic order along H. Write b_i for the original successor of a_i.
Deleting these three arcs leaves the three disjoint directed paths
P_1 from b_1 to a_2, P_2 from b_2 to a_3, and P_3 from b_3 to a_1.
A cycle differing at exactly those three tails must permute the three
successor choices without a fixed point. There are two such permutations.
The reconnection

```math
a_1\longrightarrow b_2,\qquad
a_2\longrightarrow b_3,\qquad
a_3\longrightarrow b_1
```

joins the three paths in the order P_1, P_3, P_2 and gives one Hamiltonian
cycle. The other reconnection, sending a_1 to b_3, a_2 to b_1, and a_3
to b_2, closes each path separately and gives three cycles. Some of these
closed paths may be loops, which are also excluded from a Hamiltonian cycle.
Thus there is exactly one other Hamiltonian cycle for each choice of three
tails. Different choices give different second cycles because the tails
where they differ from H can be recovered from the pair.

There are (m-1)! choices for H and binom(m,3) choices of three tails. Every
unordered pair is counted twice. Finally, two different unordered pairs
cannot have the same union T, because such a T contains at most two cycles.
This proves the displayed monomial count. ∎

For example, at m=3 there are just two directed Hamiltonian cycles H_+ and
H_-, and they are arc-disjoint. Thus

```math
C_3^*=x^{H_+}+x^{H_-}-x^{E_3}.
```

Over the field with two elements, HC_3 evaluates to 0 on the complete
directed graph, because there are two cycles, while C_3 evaluates to 1.
Counting cycles modulo two therefore does not express existence. This is
an explicit six-arc counterexample, independent of any conjecture.

## 5. A restriction that kills the exact predicate and preserves containment

**Theorem 5.1.** For every m >= 2 there is an explicit variable-and-constant
restriction rho_m of graphs on m+2 vertices such that

```math
I_{m+2}\vert_{\rho_m}\equiv0,
\qquad
C_{m+2}\vert_{\rho_m}=C_m,
\qquad
HC_{m+2}\vert_{\rho_m}=HC_m.
```

The last identity is an identity of ordinary polynomials over every field.
Every old arc variable occurs exactly once in the restriction.

**Proof.** Choose an old vertex v and replace it by three vertices a,b,c.
Keep the other m-1 vertices. Replace each old arc u to v by u to a, each
old arc v to u by c to u, and retain each arc between two old vertices
different from v. Assign these arcs their original independent variables.
Fix the three arcs

```math
a\longrightarrow b,\qquad
b\longrightarrow c,\qquad
b\longrightarrow a
```

to 1. Fix all other possible arcs to 0.

The resulting graph always has two distinct arcs leaving b. It can therefore
never be exactly a directed Hamiltonian cycle, proving the first identity.

In any Hamiltonian cycle of the resulting graph, a must leave along a to b,
because a has no other possible outgoing arc. Vertex c must be entered
along b to c, because c has no other possible incoming arc. Hence every
Hamiltonian cycle uses the path a to b to c. In particular it cannot use
the extra arc b to a. Contracting the path to v gives a directed Hamiltonian
cycle in the original graph. Conversely, replacing v in an original
Hamiltonian cycle by this path gives a Hamiltonian cycle in the restricted
graph. These operations are inverse, proving a bijection of cycles and the
second identity.

For the third identity, every surviving cycle monomial uses the two forced
path arcs and no other new arc. After their variables are set to 1, that
monomial is exactly the original cycle monomial under the same bijection.
All other cycle monomials vanish. Summing proves the polynomial identity. ∎

In particular the restricted containment problem includes the entire original
containment family, with only two additional vertices. This is an exact
projection and makes no assumption that the original problem has any
unproved circuit lower bound. Substituting the constants and renaming the
variables in a Boolean circuit for C_{m+2} gives a circuit of no larger size
for C_m on this restricted family.

The restriction also illustrates why extraction of a homogeneous component
does not commute with Boolean restrictions that set variables to 1. The
whole polynomial I_{m+2}^* becomes zero, while its degree-(m+2) component
becomes the nonzero polynomial HC_m. Higher components cancel the lower
component after the restriction.

## 6. The exact algebraic gate rule and its limitation

For Boolean functions f and g, uniqueness of the multilinear representative
gives the following identities:

```math
M(\neg f)=1-M(f),
\qquad
M(f\land g)=\mathop{\mathrm{ML}}(M(f)M(g)),
```

```math
M(f\lor g)=M(f)+M(g)-\mathop{\mathrm{ML}}(M(f)M(g)).
```

Each identity follows by evaluating on the Boolean cube and checking the
two Boolean inputs to the gate. Thus a Boolean circuit of size s gives a
circuit with O(s) operations **in the Boolean quotient ring**. This assertion
does not give an O(s)-size ordinary arithmetic circuit for its canonical
multilinear representative. The repeated Boolean reductions are part of
the assertion and cannot be omitted.

Ordinary degree truncation is not compatible with these reductions. Starting
with the input x, repeatedly AND a gate with itself k times. The Boolean
function is still x and the Boolean circuit has k gates. Straight arithmetic
translation before reduction computes x raised to the power 2^k. Reduction
then returns x. Consequently terms of arbitrarily large ordinary degree
can contribute to the degree-one part of the canonical multilinear
extension. Already the circuit x AND x translates to x^2, whose ordinary
degree-one component is zero although its canonical representative is x.

An argument that postpones Boolean reductions must prove a bound that
accounts for this degree collapse and for repeated edges in the union
formula. None of the identities above proves such a bound.

## 7. A monotone polynomial-time predicate with the same logarithmic band

The shared-layer obstruction extends beyond the minimal homogeneous
component. A logarithmic number of additional layers still does not
distinguish containment from every monotone polynomial-time predicate.

**Theorem 7.1.** Fix a nonnegative integer c. Put

```math
k_c(m)=\left\lfloor\log_2(m^c)\right\rfloor,
\qquad
J_{m,c}(G)=C_m(G)\lor[|E(G)|>m+k_c(m)].
```

The family J_{m,c} is monotone and is in deterministic polynomial time,
and hence has polynomial-time uniform Boolean circuits of polynomial
size. Over every field its unique multilinear extension agrees with
C_m^* in every homogeneous degree at most m+k_c(m).

**Proof.** Both C_m and the condition |E(G)| > m+k_c(m) are monotone under
addition of arcs. Their disjunction J_{m,c} is therefore monotone.

First count the input arcs, writing M for their number. Accept immediately
if M > m+k_c(m). Otherwise the required answer is exactly C_m(G). In this
remaining case, reject if any vertex has outdegree zero. If all outdegrees
d_v are at least 1, enumerate all choices of one outgoing arc at every
vertex. The number of choices is

```math
\prod_v d_v
\le\prod_v 2^{d_v-1}
=2^{M-m}
\le2^{k_c(m)}
\le m^c.
```

The first inequality uses d <= 2^(d-1) for every positive integer d;
this follows by induction, starting with d=1. For each choice, check
whether the selected outgoing arcs form one directed Hamiltonian cycle.
For example, start at vertex 1, follow its selected successor m times,
and require that all m vertices were visited without an earlier repeat
and that the final vertex is again 1. This check takes polynomial time.
A Hamiltonian cycle exists exactly when at least one enumerated choice
passes. Enumeration therefore takes m^(c+O(1)) bit operations. The cutoff
is computable exactly: k_c(m) is one less than the binary length of the
positive integer m^c. The fixed integer c is part of the description of
the algorithm, so this is one uniform polynomial-time family.

By definition J_{m,c} and C_m agree on every graph with at most m+k_c(m)
arcs. The final assertion follows from the coefficient formula in
Section 1, or from its general agreement consequence in Section 2. ∎

The nonmonotone sparse cutoff variant

```math
D_{m,c}(G)=C_m(G)\land[|E(G)|\le m+k_c(m)]
```

has the same polynomial-time bound and the same prefix agreement. Its
algorithm rejects above the cutoff and uses the same successor enumeration
at or below it. The monotone variant J_{m,c} gives the stronger obstruction.

This is an elementary sparse-input parameter bound, not a new general
Hamiltonicity algorithm or a claim of priority. It gives a precise
limitation on the proposed transfer: for every fixed logarithmic band of
degrees above m, a monotone polynomial-time predicate has exactly the same
band of multilinear components as the containment predicate. A circuit
hardness criterion that sees only this prefix cannot distinguish the two
families, even when it also assumes that the output function is monotone.
The theorem does not assert a polynomial-size monotone circuit for J_{m,c}.
It makes no statement about invariants using the whole truth table or a
larger collection of layers.

**Corollary 7.2.** For each fixed nonnegative integer c, the families
J_{m,c} and D_{m,c} are decidable in deterministic logarithmic space on
a read-only adjacency-matrix input. The space bound is O(log m), or
equivalently O(log N) for N = m(m-1) input bits.

**Proof.** The threshold test uses a counter for M and a register for m^c.
Both have O(log m) bits because c is fixed. Scanning the input determines
every outdegree d_v using the same space. Above the threshold return the
appropriate immediate answer, and at or below the threshold reject if
any outdegree is zero.

In the remaining case the integer

```math
P=\prod_{v=1}^m d_v\le m^c
```

fits in O(log m) bits. Compute it by scanning rows successively and
multiplying the current product by each row's degree. Enumerate integers
t = 0,...,P-1. Use t as the index of a successor choice in mixed radix
with radices d_1,...,d_m, the first vertex being the least significant
digit. To find the chosen successor of a particular vertex v, set q=t.
For u=1,...,v-1, rescan row u to compute d_u and replace q by
floor(q/d_u). Set r=q mod d_v. Rescan row v and select its r-th outgoing
neighbour, counting from zero in the fixed input order. This computes
the successor without storing the complete selection. Repeated division
gives a bijection between the integers t in this range and all successor
choices.

For each t, store only the current vertex and a step counter. Start at
vertex 1, repeatedly compute the selected successor on demand, and accept
this choice precisely if its first return to vertex 1 occurs at step m.
If the first return is earlier, or there is no return in m steps, reject
this choice. To justify the test, suppose v_0=1,...,v_m=1 and no earlier
positive-index vertex is 1. If v_i=v_j for 0<i<j<m, applying the same
successor function another m-j times would give

```math
v_{m-(j-i)}=v_m=1,
\qquad 1\le m-(j-i)\lt m,
```

contradicting the first-return condition. Hence v_0,...,v_{m-1} are all
distinct, so they are exactly the m graph vertices and form a Hamiltonian
cycle. The converse is immediate. No visited-vertex array is needed.

There are only constantly many working registers: t, P, the current
vertex, the step and input-position counters, q, the current degree, and
the neighbour counter. Every register has O(log m) bits. Addition,
multiplication, quotient, and remainder on these bounded integers can
be implemented with O(log m) work bits and polynomial time. Every input
row access can be performed by rescanning the read-only input with an
O(log N)-bit position counter; random access is not assumed. The outer
enumeration has at most m^c iterations, so the running time remains
polynomial. If the encoding supplies only its length N, recover m by
counting N and trying integers until m(m-1) >= N; reject if equality
fails, and handle the finitely many smaller lengths separately. This also
uses O(log N) bits. ∎

## 8. Independent finite checks

The companion standard-library script `verify_layers.py` verifies the
identities on finite examples by independently computing truth-table
Moebius coefficients and cycle-family inclusion-exclusion coefficients.
It exhausts all directed graphs on 2, 3, and 4 vertices. It also checks
the three-tail pair count through 6 vertices and exhausts the original
inputs on 2, 3, and 4 vertices for the restriction of Theorem 5.1.
It enumerates only the restricted images on 4, 5, and 6 vertices; it does
not enumerate all 2^30 directed graphs on 6 vertices. An independent
outgoing-choice enumerator also checks both cutoff algorithms and their
coefficient agreement for all graphs on 2, 3, and 4 vertices, with fixed
c in {0,1,2}. For each of these instances the verifier checks monotonicity
of J_{m,c} on every pair of inputs related by adding a single arc. It also
checks the mixed-radix successor decoder against the ordinary Cartesian
product of neighbour lists on each sparse input with no zero outdegree,
and compares the first-return algorithm with independent cycle enumeration.
These checks validate the finite algorithmic identities; the written
register accounting establishes the asymptotic space claim.

Run it with:

```bash
python3 research/boolean-hamiltonicity/verify_layers.py
```

These are regression checks for the stated finite identities. The proofs
above supply their general quantifiers. The checks do not establish any
asymptotic circuit or time lower bound.
