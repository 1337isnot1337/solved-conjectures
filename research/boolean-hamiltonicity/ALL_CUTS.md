# Large rank at every balanced cut in a small monotone formula

Status: a proved obstruction to a proposed rank bound, not a Boolean circuit
lower bound. The construction uses the standard graph-CNF and induced-matching
method. No claim of priority is made. Related prior work is recorded in
[SOURCES.md](SOURCES.md).

## 1. Statement

Let a cut of the variables of a Boolean function be a partition
$`[N]=A\sqcup B`$. Its truth-table matrix over a field $`F`$ is

```math
M_A(f)_{a,b}=f(a,b),\qquad
a\in\{0,1\}^A,\quad b\in\{0,1\}^B.
```

The cut is balanced if $`N/3\le |A|\le 2N/3`$.

**Theorem 1.** For every integer $`N\ge72`$, there is a monotone 2-CNF
$`F_N`$ on $`N`$ variables, with each variable occurring at most 512 times,
such that:

1. A fan-in-two monotone Boolean formula computes $`F_N`$ using at most
   $`512N-1`$ AND/OR gates.
2. For every balanced cut and every field,

```math
\mathop{\mathrm{rank}}_F M_A(F_N)
\ge 2^{7N/524288}.
```

The size bound counts a fresh occurrence of each OR clause, followed by an
AND tree. In particular, the statement holds even for formulas, before any
savings from shared subcircuits or negations. The existence proof below selects
one finite graph for each $`N`$; it does not assert a polynomial-time uniform
algorithm for selecting this graph family. Nonuniform existence is enough to
refute an asserted upper bound for every small circuit.

## 2. An elementary graph existence lemma

**Lemma 2.** For every integer $`N\ge72`$, there is a simple graph on $`N`$
vertices of maximum degree at most 512 with at least $`7N`$ edges crossing
every balanced cut.

**Proof.** Independently include every unordered pair as an edge with
probability $`p=72/N`$. Fix a balanced cut with $`a=|A|`$. Its crossing-edge
count $`X_A`$ is binomial with mean

```math
\mu_A=p\,a(N-a)\ge16N.
```

For a sum $`X`$ of independent Bernoulli variables of mean $`\mu`$,
the exponential-moment bound gives

```math
\Pr[X\le\mu/2]
\le \exp\!\left(\frac{\log 2}{2}\mu-\frac12\mu\right)
\le e^{-\mu/8}.
```

Indeed, apply Markov's inequality to $`e^{-(\log 2)X}`$ and use
$`1+t\le e^t`$ in the product of its Bernoulli moments. The last step uses
$`\log 2\le3/4`$, which follows from
$`e^{3/4}\ge1+3/4+(3/4)^2/2>2`$.
Consequently, $`\Pr[X_A<8N]\le e^{-2N}`$.
There are at most $`2^N`$ cuts, so the probability of any bad balanced cut
is at most $`2^N e^{-2N}`$.

Let $`d_v`$ be the random degree of a vertex and put

```math
Y=\sum_v d_v\,\mathbf1_{\{d_v>512\}}.
```

For $`D\sim\mathop{\mathrm{Bin}}(N-1,p)`$, expanding the expectation by
which incident edge is present gives

```math
\mathbb E[D\,\mathbf1_{\{D>512\}}]
=(N-1)p\Pr[\mathop{\mathrm{Bin}}(N-2,p)\ge512].
```

For a binomial variable $`Z`$ of mean at most 72, Markov's inequality on
$`\binom{Z}{512}`$ gives

```math
\Pr[Z\ge512]
\le {n\choose512}p^{512}
\le \frac{72^{512}}{512!}
\le\left(\frac{72e}{512}\right)^{512}.
```

If $`n<512`$, the first bound is zero and the same conclusion holds.
The factorial estimate follows by integrating $`\log t`$:
$`\log(k!)\ge\int_1^k\log t\,dt\ge k\log k-k`$.
Therefore

```math
\mathbb E[Y]
\le72N\left(\frac{72e}{512}\right)^{512}
<72N\left(\frac12\right)^{512}<\frac{N}{100}.
```

Here $`e<3`$ implies $`72e/512<1/2`$. Thus $`\Pr[Y>N]<1/100`$.
Together with the cut estimate, the probability that either property fails
is less than one: for $`N\ge72`$, $`2^N e^{-2N}<1/100`$ as well.
Choose a graph with all crossing counts at least $`8N`$ and $`Y\le N`$.

Delete every edge incident to a vertex whose original degree exceeds 512.
The number of deleted edges is at most $`Y`$, even though an edge may be
counted twice in $`Y`$. The resulting graph has maximum degree at most 512,
and every balanced cut still has at least $`8N-Y\ge7N`$ crossing edges.
This proves the lemma. $`\square`$

## 3. A large induced matching at every cut

**Lemma 3.** In a graph of maximum degree at most $`D\ge1`$, any cut with $`q`$ crossing
edges contains a globally induced matching of at least $`q/(2D^2)`$ edges.
Here globally induced means that among the selected endpoints the graph
has only the matching edges, including no edges joining two endpoints on
the same side of the cut.

**Proof.** Greedily select a crossing edge $`uv`$ and discard every remaining
crossing edge incident to $`N[u]\cup N[v]`$. Because $`uv`$ is an edge,
both $`u`$ and $`v`$ belong to the intersection of the two closed
neighborhoods, so

```math
|N[u]\cup N[v]|\le2D.
```

At most $`2D^2`$ crossing edges are discarded at one step. Later selected
endpoints have no adjacency to earlier selected endpoints, which proves
the induced property. When the process terminates all $`q`$ crossing edges
have been discarded. If $`k`$ edges were selected, $`q\le2D^2 k`$.
$`\square`$

## 4. Proof of Theorem 1

Choose the graph $`G_N`$ from Lemma 2 and define

```math
F_N(x)=\bigwedge_{uv\in E(G_N)}(x_u\vee x_v).
```

There are at most $`512N/2=256N`$ clauses. Using one OR gate for every
clause and one fewer AND gate than clauses gives at most $`512N-1`$ gates.
A variable occurs exactly once for each of its incident edges.

Fix any balanced cut. Lemma 3 gives a globally induced crossing matching
$`u_1v_1,\ldots,u_kv_k`$ with

```math
k\ge\frac{7N}{2\cdot512^2}=\frac{7N}{524288}.
```

Fix all variables outside these $`2k`$ endpoints to 1. Every clause
with an outside endpoint becomes true; the induced property ensures that
the surviving clauses are exactly the $`k`$ matching clauses. Thus the
restricted function is

```math
\bigwedge_{i=1}^k(x_{u_i}\vee x_{v_i}).
```

Its truth-table matrix is the Kronecker product of $`k`$ copies of

```math
Q=\begin{pmatrix}0&1\\1&1\end{pmatrix}.
```

Since $`\det Q=-1`$, each copy is invertible over every field. Their
Kronecker product has rank $`2^k`$. Fixing variables selects a submatrix
of the original truth-table matrix, so cannot increase its rank. Therefore
$`\mathop{\mathrm{rank}} M_A(F_N)\ge2^k`$, as claimed. $`\square`$

## 5. The same obstruction for coefficient matrices

For the unique multilinear extension

```math
\widehat f(x)=\sum_{S\subseteq A,\ T\subseteq B}c_{S,T}x^S x^T,
```

let $`C_A(f)=(c_{S,T})`$. Let $`Z_A`$ have rows and columns indexed by
subsets of $`A`$, with $`(Z_A)_{U,S}=1`$ if $`S\subseteq U`$ and zero
otherwise. Define $`Z_B`$ similarly. Direct evaluation gives

```math
M_A(f)=Z_A C_A(f) Z_B^{\mathsf T}.
```

Under an order extending subset inclusion, each zeta matrix is triangular
with diagonal entries 1. Both are invertible over every field. Hence

```math
\mathop{\mathrm{rank}} M_A(f)=\mathop{\mathrm{rank}} C_A(f).
```

Theorem 1 therefore applies equally to the cut coefficient matrices of
the full canonical multilinear polynomial. Changing from the whole truth
table to its multilinear coefficients does not avoid this example.

## 6. Exactly which proposed bounds this refutes

For no fixed polynomial $`p`$ is it true that every size-$`s`$ Boolean
circuit on $`N`$ variables has a balanced cut with
$`\mathop{\mathrm{rank}} M_A(f)\le p(N+s)`$.
Theorem 1 refutes that assertion even for linear-size monotone formulas.
It also refutes the corresponding assertions for the minimum, maximum,
or normalized nonnegative weighted average of the ranks over all balanced
cuts. The same holds for weighted geometric means with weights summing
to one.

A logarithmic rank measure is not contradicted by the theorem, but its
value is always at most $`\min(|A|,|B|)\le N/2`$ for a single cut. An
upper bound linear in circuit size and a lower bound linear in $`N`$
would yield only a linear size lower bound. It would not separate
$`\mathsf{NP}`$ from $`\mathsf{P/poly}`$.

This theorem does not rule out every invariant involving cuts. For
example, a measure may depend on compatible decompositions, restrictions,
or additional information that is absent from a list of individual cut
ranks. Such a measure still needs its own gate and circuit-size theorem.
No such theorem for unrestricted Hamiltonicity circuits is proved here.

