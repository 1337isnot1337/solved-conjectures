# Transfer attempts and the precise missing theorem

This is a research record. Each conclusion below concerns the particular
argument stated. None is a proof that Boolean P versus NP is unresolvable
by algebraic methods, or that every possible cut invariant must fail.

## 1. Extract the minimal Hamiltonian-cycle component

Both the exact-cycle and containment predicates have degree-$`m`$
multilinear component $`HC_m`$. The exact-cycle predicate has uniform
polynomial-size Boolean circuits. Therefore a bound for arbitrary Boolean
circuits cannot be inferred from the complexity of that component alone.

The obstruction extends to higher layers: [LAYERS.md](LAYERS.md) proves
that for each fixed nonnegative integer $`c`$, a monotone predicate in P agrees
with containment through degree $`m+\lfloor c\log_2m\rfloor`$. It uses the
fact that a graph with $`m+r`$ arcs has at most $`2^r`$ choices of one
outgoing arc at every vertex, unless some vertex has no outgoing arc and
the answer is immediately negative. Merely adding a fixed logarithmic
number of overlap layers therefore does not supply the missing circuit bound,
even if the criterion also knows that the output predicate is monotone.
Corollary 7.2 strengthens the easy side to deterministic logarithmic space:
one mixed-radix counter indexes the successor choices, which are decoded
on demand by rescanning the input.

### An arithmetic consequence of the imported theorem

Use the pinned arithmetic lower bound, Theorem 1.1 of the Anthropic
paper, over a fixed field, as directed by the repository's
[standing research assumption](../../AGENTS.md#standing-research-assumption-anthropics-vp-versus-vnp-proof).
Then the unique multilinear extension of the
polynomial-time exact-cycle predicate itself requires arithmetic size
$`2^{\Omega((\log m)^{4/3})}`$.

Here is the complete transfer. From a division-free arithmetic circuit
of size $`s`$ for that extension, compute every homogeneous component
through degree $`m`$ at every gate. At an addition gate, add components
of equal degree. At a multiplication gate, use the truncated convolution

```math
(fg)_j=\sum_{a+b=j}f_a g_b,\qquad 0\le j\le m.
```

At most $`O((m+1)^2)`$ arithmetic gates replace each original gate.
Input and constant bookkeeping is polynomial in $`m`$. This gives an
ordinary arithmetic circuit of size $`O((s+m^2+1)(m+1)^2)`$ for $`HC_m`$.
Compare with the pinned lower bound
$`m^{c(\log_2m)^{1/3}}`$. Dividing by polynomial factors preserves the
$`2^{\Omega((\log m)^{4/3})}`$ scale. The conclusion follows.

This is an application of an imported arithmetic result and
the standard homogeneous-component construction, also stated in Hrubeš's
Lemma 4. It proves no Boolean lower bound. It shows explicitly why the
arithmetic conclusion can coexist with a polynomial-time Boolean predicate.
The same proof applies to the monotone predicate $`J_{m,c}`$ in LAYERS
Theorem 7.1, because its degree-$`m`$ component is also $`HC_m`$.

## 2. Apply ordinary homogeneous circuit arguments before reduction

Boolean gates arithmetize with multiplication in the quotient

```math
B_N=K[x_1,\ldots,x_N]/\langle x_i^2-x_i:1\le i\le N\rangle.
```

The identity $`x\land x=x`$ already shows that ordinary degree extraction
does not commute with reduction: the unreduced polynomial $`x^2`$ has no
degree-one term, but its reduced representative is $`x`$. Repeated
squaring makes the unreduced degree $`2^t`$ with $`t`$ gates and leaves
the same degree-one Boolean function.

There is no ordinary positive grading of this algebra in which a
nonzero input variable is homogeneous of degree one. In a direct-sum
grading with multiplication adding degrees, $`x^2`$ would have degree
two and $`x`$ degree one. Equality $`x^2=x`$ would force both to be zero,
contrary to the input function. This disproves that literal replacement
of the polynomial grading; it does not preclude a filtration or a different
invariant.

Truncation by the number of distinct variables in a monomial is a valid
alternative. [SUPPORT_QUOTIENT.md](SUPPORT_QUOTIENT.md) proves its exact
quotient model and then identifies the unresolved efficiency requirement.
Keeping track of every small support gives a correct, very large
computation. The existence of that computation is not a polynomial-size
simulation theorem.

## 3. Replace one cut by many cuts

[INVARIANTS.md](INVARIANTS.md) proves the valid fixed-cut rank inequalities.
AND combines truth matrices by entrywise product, yielding a product
bound on ranks. The stronger additive bound is false: the supplied
example has input ranks 4 and 4 and output rank 16.

The complement-invariant row-span dimension has useful multiplicative
bounds at both AND and OR. Taking logarithms gives additive bounds for
formulas, but the values are at most the number of variables. For a
circuit DAG, naive induction counts input occurrences in its potentially
exponential formula unfolding. A separate connectivity argument does give
$`r_A(f)\le2^{(s_2+1)/2}`$ for arbitrary circuits with $`s_2`$ binary gates.
Its implied lower bound $`s_2\ge2\log_2r_A(f)-1`$ is at most $`N-1`$.
These calculations therefore do not give a superpolynomial size bound.

The formula

```math
\bigwedge_{i=1}^k(x_i\vee y_i)
```

has $`2k-1`$ gates and cut rank $`2^k`$. It is also an explicit restriction
of Hamiltonicity on $`3k`$ vertices for which the exact-cycle predicate
is identically zero. Thus that vanishing checkpoint and high rank at a
cut can coexist with an easy restricted containment predicate.

The stronger [ALL_CUTS.md](ALL_CUTS.md) construction has linear-size
monotone formulas and exponential rank at every balanced variable cut,
over every field. It rules out the proposed polynomial-size upper bounds
for raw ranks and the stated normalized aggregates of those ranks.
The same obstruction applies to coefficient cut matrices because zeta
transforms preserve their ranks.

There may be invariants that use compatibility between decompositions,
not just the individual ranks. No such invariant with the required
unrestricted-circuit size bound has been established in this investigation.
The known balanced-rectangle-cover theorem cited in SOURCES applies to
decomposable circuits; arbitrary AND gates do not meet that hypothesis.

## 4. Count witnesses modulo two

The complete loopless directed graph on three vertices has exactly two
Hamiltonian cycles. Therefore

```math
HC_3(1)=0\quad\hbox{in }\mathbb F_2,
\qquad C_3(1)=1.
```

This is a counterexample to identifying the polynomial's parity output
with the decision predicate. It does not rule out a separate reduction
between the problems, but no such reduction sufficient for this lower-bound
transfer is supplied by parity counting itself.

## 5. Replace weighted addition by Boolean OR in the accelerator argument

The pinned paper's Theorem K.6 ends with an arithmetic contradiction

```math
V=1+V
```

in a nonzero ring. Replacing weighted sum by existence changes this final
equation to

```math
V=1\lor V.
```

The Boolean value $`V=1`$ satisfies that equation. Thus the literal
replacement loses the contradiction even if every earlier simulation
step were available. A Boolean negation diagonal would instead require
constructing an equation such as $`V=\neg V`$ in the intended computation
class. The arithmetic accelerator theorem does not provide that new
construction. This records a failure of that substitution, not a theorem
that no Boolean diagonalization approach can succeed.

## 6. Exact remaining obligation

To finish the requested target, one still has to prove a quantitative
lower bound for $`C_m`$ in the unrestricted AND/OR/NOT circuit model, or a
separate uniform deterministic time lower bound. A proposed invariant
must come with all of the following proved statements:

1. It depends on the Boolean function and respects every algebraic
   representative that agrees on the Boolean cube.
2. Its value is sufficiently large for Hamiltonian-cycle containment,
   possibly on the hardness-preserving restriction of LAYERS Theorem 5.1.
3. Its value has a sufficiently small upper bound for every size-$`s`$
   circuit with arbitrary fan-out and negations, counted as a DAG.

The first two points without the third do not establish the target.
The elementary obstructions here show specific false inequalities that
cannot be used to fill that third point. They do not fill it themselves.

