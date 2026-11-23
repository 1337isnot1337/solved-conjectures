# Cut invariants and the Boolean quotient

Status: proved obstructions and research obligations. This note does not prove
an unrestricted Boolean circuit lower bound. Its purpose is to state exactly
which bounds survive Boolean gates and to give counterexamples to stronger
bounds that would be needed by the proposed transfer.

The results below have elementary proofs. No claim of historical novelty is
made. `ALL_CUTS.md` gives the stronger simultaneous-cut obstruction for small
monotone 2-CNF formulas. `verify_invariants.py` checks the explicit finite
examples with exact arithmetic; the asymptotic statements are proved here.

## 1. Models and the Boolean quotient

Fix a field K and N Boolean variables. A Boolean circuit is a directed acyclic
graph with input variables and constants, binary AND/OR gates, and unary NOT
gates. Fan-out is unrestricted. Its size is its number of internal gates.
A formula is a circuit in which every gate has fan-out at most one. Repeated
occurrences of the same input variable are allowed in a formula.

Let

```math
B_N=K[x_1,\ldots,x_N]/(x_1^2-x_1,\ldots,x_N^2-x_N).
```

Every element of B_N has a unique multilinear representative. Evaluation on
{0,1}^N identifies B_N with the algebra of all K-valued functions on the Boolean
cube, with pointwise addition and multiplication. The isomorphism holds in
every characteristic: the one-variable evaluation matrix [[1,0],[1,1]] is
invertible over every field, and the N-variable evaluation matrix is its
tensor power.

Write ML(p) for the multilinear representative of p. Boolean gates translate
to

```math
\begin{aligned}
f\land g&=\operatorname{ML}(fg),\\
f\lor g&=f+g-\operatorname{ML}(fg),\\
\neg f&=1-f.
\end{aligned}
```

These identities hold on Boolean inputs and hence in B_N. They do not give
a small ordinary arithmetic circuit for the multilinear representative:
they give a small circuit whose multiplication gates operate in B_N.

### Lemma 1.1. Ordinary-degree truncation does not commute with Boolean reduction

For every t >= 1, repeated squaring computes x^(2^t) with t multiplication
gates, and ML(x^(2^t)) = x. Its ordinary homogeneous degree-one component is
zero. Thus discarding ordinary terms of degree greater than one before
Boolean reduction loses the entire degree-one answer.

Proof. The relation x^2=x implies x^d=x for every positive d. Before reduction,
x^(2^t) is a monomial of degree 2^t. This proves both assertions.

The even smaller Boolean-gate example is x AND x: its ordinary arithmetic
translation is x^2 and its multilinear representative is x. This does not
exclude specialized simplifications. It disproves the proposed general rule
that ordinary homogeneous truncation can simply be applied before every
Boolean reduction. Truncation by the number of *distinct* variables in a
monomial is different; it can be implemented explicitly, but may require
tracking all subsets of size at most the cutoff.

## 2. Evaluation matrices and coefficient matrices have the same rank

Partition the variable set into A and B. For a Boolean function f, let
M_A(f) have rows indexed by a in {0,1}^A, columns indexed by b in {0,1}^B,
and entries f(a,b), viewed in K. Let r_A(f) be its rank over K.

For the multilinear extension F of f, let C_A(F) have rows indexed by
subsets S of A, columns indexed by subsets T of B, and entry equal to the
coefficient of x_(S union T) in F. Let Z_A(a,S)=1 if S is a subset of the
support of a, and zero otherwise. Define Z_B in the same way. Then

```math
M_A(f)=Z_A C_A(F)Z_B^{\mathsf T}.
```

With subsets ordered by cardinality, each Z is triangular with diagonal 1.
Consequently

```math
\operatorname{rank}_K M_A(f)=\operatorname{rank}_K C_A(F)
```

over every field. The statement is about the *whole* multilinear extension.
It does not identify the rank of an individual homogeneous component with
the rank of the full truth table.

## 3. The valid gate inequalities

### Proposition 3.1. Ordinary rank bounds

For every fixed cut A | B and all Boolean functions f,g,

```math
\begin{aligned}
r_A(f\land g)&\le r_A(f)r_A(g),\\
r_A(f\lor g)&\le r_A(f)+r_A(g)+r_A(f)r_A(g),\\
|r_A(\neg f)-r_A(f)|&\le1.
\end{aligned}
```

Proof. The truth matrix of AND is the entrywise product M_A(f) o M_A(g).
If M_A(f)=sum_i u_i v_i^T and M_A(g)=sum_j s_j t_j^T are rank
decompositions, their entrywise product equals

```math
\sum_{i,j}(u_i\circ s_j)(v_i\circ t_j)^{\mathsf T}.
```

This proves the product bound. The OR identity is M(f)+M(g)-M(f)oM(g),
so rank subadditivity proves the second bound. The NOT identity is J-M(f),
where J is the all-one matrix of rank one. Apply rank subadditivity in both
directions for the last bound.

### Proposition 3.2. A complement-invariant version

Let U_A(f) be the span, in the space of K-valued functions on {0,1}^B,
of the constant function 1 together with all rows f(a, .). Define

```math
\sigma_A(f)=\dim_K U_A(f).
```

Then

```math
\begin{aligned}
\sigma_A(\neg f)&=\sigma_A(f),\\
\sigma_A(f\land g)&\le\sigma_A(f)\sigma_A(g),\\
\sigma_A(f\lor g)&\le\sigma_A(f)\sigma_A(g).
\end{aligned}
```

Also

```math
\max\{1,r_A(f)\}\le\sigma_A(f)\le r_A(f)+1,
\qquad \sigma_A(f)\le 2^{|B|}.
```

Proof. The spans of {1,f(a,.)} and {1,1-f(a,.)} coincide. For either binary
gate, all output rows belong to the span of products uv with u in U_A(f)
and v in U_A(g). This product space has dimension at most the product of
the two dimensions. It also contains 1. The remaining assertions follow
directly from the definition.

Thus log_2 sigma is subadditive at binary gates and unchanged at NOT gates.
For an input x_i it is zero when i is in A and at most one when i is in B.
An induction on a *formula* therefore bounds log_2 sigma by the number of
input occurrences from B. For a DAG, the same induction counts occurrences
in the unfolded formula, which may be exponentially larger than the DAG.
It does not count each shared gate only once. No rule in Proposition 3.2
licenses such an amortization.

Even in formulas, these inequalities give a logarithmic-rank lower bound.
Since log_2 sigma <= |B|, this direct use of the inequalities cannot yield a
superpolynomial lower bound in N. For a probability distribution w on cuts,
the weighted average sum_A w(A) log_2 sigma_A(f) is still at most N and
satisfies the same formula inequalities. Averaging the inequalities does
not change this limitation.

### Exact failure of an additive rank rule

On variables x_1,...,x_4,y_1,...,y_4, use the cut X | Y. Set

```math
f=(x_1\lor y_1)\land(x_2\lor y_2),
\qquad g=(x_3\lor y_3)\land(x_4\lor y_4).
```

The ranks of M(f) and M(g) are both 4, while the rank of M(f AND g) is 16,
over every field. Indeed the two-variable OR matrix is

```math
\begin{pmatrix}0&1\\1&1\end{pmatrix},
```

whose determinant is -1, and the relevant matrices are tensor products
of two or four copies, with constant rows/columns on unused variables.
Hence r(f AND g) <= r(f)+r(g) is false: it would assert 16 <= 8.

More generally h_k=AND_(i=1)^k (x_i OR y_i) has a monotone formula with
2k-1 gates and rank 2^k across X | Y. Its whole multilinear extension is

```math
\prod_{i=1}^k(x_i+y_i-x_i y_i).
```

It has 3^k nonzero monomials over every field, integer coefficient absolute
sum 3^k, and 2^k minimal satisfying assignments. All these quantities can
therefore grow exponentially in the size of a small formula. None admits
a universal polynomial upper bound in arbitrary Boolean formula size.

## 4. An explicit Hamiltonicity restriction with zero exact-cycle predicate

The preceding counterexample can be realized by a pure restriction of the
directed-Hamiltonicity predicates. No identification of input variables is
needed.

For k >= 1 take 3k vertices s_i,a_i,b_i, with i read modulo k. Leave only
the following 2k arcs free:

```math
s_i\longrightarrow a_i\ :\ x_i,
\qquad s_i\longrightarrow b_i\ :\ y_i.
```

Fix the following 4k arcs to one:

```math
a_i\longrightarrow b_i,\quad
b_i\longrightarrow a_i,\quad
a_i\longrightarrow s_{i+1},\quad
b_i\longrightarrow s_{i+1}.
```

Fix every other loopless directed arc to zero. Denote this restriction rho_k.
All listed arcs are distinct, including when k=1.

### Proposition 4.1. Exact restricted predicates

Under rho_k,

```math
\mathrm{IS}_{3k}|_{\rho_k}=0,
\qquad
\mathrm{CONTAINS}_{3k}|_{\rho_k}=\bigwedge_{i=1}^k(x_i\lor y_i).
```

Moreover the number of directed Hamiltonian cycles, each counted once
with start vertex s_0, is product_(i=1)^k (x_i+y_i) on Boolean inputs.

Proof. Every restricted graph contains the 4k fixed arcs, while a graph
that is exactly one directed Hamiltonian cycle on 3k vertices has exactly
3k arcs. Thus IS is always zero.

The only incoming arcs to a_i or b_i originate at s_i or at the other
internal vertex. In a Hamiltonian cycle these two vertices cannot form
their own two-cycle, since the graph has 3k > 2 vertices. Consequently
the cycle enters the pair from s_i. After entering its first internal
vertex it must visit the other before leaving: otherwise the unvisited
internal vertex has no possible predecessor in the cycle. It then moves
to s_(i+1). Thus each module is traversed in exactly one of two ways:

```math
s_i,\ a_i,\ b_i,\ s_{i+1}
\qquad\text{or}\qquad
s_i,\ b_i,\ a_i,\ s_{i+1}.
```

The first exists precisely when x_i=1; the second precisely when y_i=1.
The choices in different modules are independent and concatenate into
a spanning directed cycle. This proves the existence identity and the
counting formula.

### Corollary 4.2. The vanishing checkpoint plus exponential rank is insufficient

For rho_k, the exact-cycle predicate vanishes identically, while the
containment truth matrix has rank 2^k across the x-variables versus the
y-variables over every field. The containment predicate on this restriction
nevertheless has a monotone formula with 2k-1 gates.

The unrestricted containment problem is not asserted to be easy. The
corollary refutes the inference from this checkpoint and a high rank on
one cut to a hard restricted containment function. A hardness-preserving
restriction requires a separate reduction and a separate lower-bound
argument. `ALL_CUTS.md` treats high ranks on every balanced cut.

## 5. A second simultaneous-cut obstruction using quadratic parity

This alternative is not needed for the monotone-CNF result in ALL_CUTS.md,
but gives an independent algebraic explanation. Let H be an undirected
graph on N vertices and define

```math
q_H(z)=\bigoplus_{\{u,v\}\in E(H)}(z_u\land z_v).
```

Each XOR can be implemented with a fixed number of AND/OR/NOT gates, so
q_H has size O(N^2). For a cut A | B, let R be the binary adjacency matrix
between A and B, with binary rank r. Over a field K of characteristic other
than two, the sign truth matrix of (-1)^q_H has rank 2^r, and hence

```math
\operatorname{rank}_K M_A(q_H)\ge2^r-1.
```

Proof. Terms internal to A and B only multiply rows and columns of the
sign matrix by nonzero scalars. The remaining matrix has entries
(-1)^(a^T R b). Binary invertible row and column transformations give
permutations of the assignments a and b that put R into rank normal form.
The resulting matrix is the tensor product of the r-variable Walsh matrix
and all-one matrices. The Walsh matrix W satisfies W W^T=2^r I, so it
has rank 2^r in characteristic other than two. Since its signed version
is J-2M_A(q_H), rank subadditivity gives the stated lower bound.

For all sufficiently large N there exists H for which r >= floor(N/8)
at every cut with N/3 <= |A| <= 2N/3. To see this, choose every edge
independently with probability 1/2. At a fixed cut with a=|A|, b=|B|,
the cross matrix is a uniform binary a by b matrix. The number of such
matrices of rank at most t is at most 2^(t(a+b)), because every one has
a factorization into an a by t and a t by b matrix. Therefore

```math
\Pr[\operatorname{rank}_{\mathbb F_2}(R)\le\lfloor N/8\rfloor]
\le2^{\lfloor N/8\rfloor N-ab}
\le2^{-7N^2/72}.
```

There are at most 2^N cuts. The union bound is less than one for all
sufficiently large N. Thus a quadratic-size circuit can have exponential
truth-table rank on every balanced cut. The monotone-CNF construction
strengthens this to linear-size formulas and works over every field.

## 6. What remains open in this attack

The desired Boolean implication needs an invariant mu with two proved
properties for the exact computational model:

1. A representation-independent lower bound for the Hamiltonicity
   containment truth table, or for a restriction connected to it by a
   fully stated reduction.
2. A uniform quantitative upper bound for every size-s AND/OR/NOT circuit
   with arbitrary fan-out. The bound must count the circuit DAG correctly
   and must be strong enough that the lower bound forces superpolynomial
   s as a function of the adjacency-matrix input length.

The gate inequalities above are valid but too weak. Strengthening them to
additive rank is false. Replacing one cut by all balanced cuts does not
fix this, even for monotone formulas. Working with multilinear coefficient
matrices instead of truth matrices does not fix it because their ranks
are identical. Counting minterms, nonzero multilinear coefficients, or
their integer absolute sum also does not give the required small-circuit
upper bound.

These counterexamples do not prove that every possible invariant fails.
They delimit the measures actually tested. No bound for arbitrary Boolean
circuits sufficient to separate P from NP is established here.

## Verification scope

`python3 verify_invariants.py` uses exact rational and finite-field row
reduction. It checks the tensor-rank examples, equality of truth and
coefficient ranks, the failed additive-rank inequality, the gate
inequalities on all two-variable Boolean functions and on a deterministic
sample of four-variable functions, and every free assignment of the
Hamiltonicity gadget for k=1,2,3,4. The gadget checker enumerates actual
Hamiltonian cycles by a graph search; it does not use the formula under
test to determine whether a cycle exists.

These finite checks are regression checks for explicit lemmas. They are
not a verification of the unresolved circuit lower bound, nor a formal
proof of the asymptotic statements.
