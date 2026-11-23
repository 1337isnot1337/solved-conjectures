# Model, input encoding, and quantified target

## 1. Uniform complex computation

The input space is the disjoint union of the finite-dimensional spaces C^N, with the length N available through the usual BSS input convention. Discrete headers and structural symbols are represented by explicit finite strings of bits. They contribute their length to N; a whole unbounded circuit description is not one unit-cost scalar.

A machine is one finite program. It has a finite tuple of constants from C fixed independently of N. Registers and tape cells contain exact complex numbers. The allowed scalar operations are addition, subtraction, multiplication, and division at a point where the divisor is nonzero. A branch tests equality to zero, or equivalently equality of two registers. Each scalar arithmetic operation, equality test, ordinary copy/shift, and control step has unit cost. There is no order test, complex conjugation, digit extraction, floor, arbitrary root operation, or primitive limit operation.

A decider must halt and return the correct answer on every valid input. A division by zero is not a permitted shortcut. One may either reject malformed encodings or use a fixed polynomial-time parser; this has no bearing on feasibility of the valid systems.

A language is in P_C if such a machine decides it with a bound p(N), where p is one polynomial independent of the input. It is in NP_C if there are polynomials p,q and a deterministic BSS verifier V such that

```math
x\in A\quad\Longleftrightarrow\quad
\exists w\in\mathbb C^{q(N)}\ V(x,w)=1,
```

and V halts in at most p(N) steps on every pair (x,w). The constants of V are fixed as part of that one machine. Padding allows witnesses of a length bounded by q(N) to have exactly that length.

The desired statement quantifies over every such deterministic machine, every finite tuple of complex constants, and every polynomial running-time bound. A lower bound only for rational constants, division-free machines, or a fixed number of branches does not establish it.

## 2. Encoding HN_C

Use division-free arithmetic circuits for input polynomials. A valid input specifies a variable count, a finite acyclic list of gates, output gate indices, and complex coefficient entries. Gate types are variable, coefficient, addition, subtraction, and multiplication. Discrete gate indices and tags have explicit binary encodings; each complex coefficient occupies one scalar position. Variables are the distinct referenced variable names, renumbered consecutively; unused declared variables can be removed without changing feasibility. Let N be the total length of this encoding. With this convention the numbers of variables, gates and outputs are at most N.

The feasibility question is

```math
\mathop{\mathrm{HN}}_{\mathbb C}(f_1,\ldots,f_s)=1
\quad\Longleftrightarrow\quad
\exists z\in\mathbb C^n\quad f_1(z)=\cdots=f_s(z)=0.
```

The degree need not be polynomial in N. Repeated squaring is represented by its gates and can produce exponential degree. This does not give a high-degree polynomial a free evaluation: every gate is still charged.

### Lemma 2.1: quadratic gate encoding

A list of such circuits of total size s can be transformed uniformly into a list of O(s) equations of degree at most two in O(n+s) variables, with encoding length polynomial in the original encoding. The new system is feasible exactly when the original system is feasible.

Proof. Introduce a variable v_g for the value at each gate. For a coefficient c use v_g-c=0; for an input z_i use v_g-z_i=0; for a sum or difference use v_g-v_a-v_b=0 or v_g-v_a+v_b=0; for a product use v_g-v_a v_b=0. Set each designated output variable equal to zero. Given z, the acyclic gate order uniquely determines every v_g and makes these equations hold exactly at the circuit's computed values. Conversely, induction through the same order shows that every solution to the new equations gives the correct gate values and hence a common zero of all original polynomials. Each new equation has constant support. Explicit sparse records take O(s log(n+s)) structural bits and O(s) scalar entries. Dense quadratic encoding also has polynomial length. The transformation is uniform and uses only copying, small integer arithmetic on explicit structure, and the input coefficients. ∎

Consequently circuit-encoded HN_C and feasibility of explicitly represented quadratic systems are polynomially equivalent. Conversely, a quadratic equation has an arithmetic circuit polynomial in its explicit encoding length.

## 3. Membership and completeness

HN_C belongs to NP_C: the witness is the point z, and evaluating all circuit gates and comparing outputs to zero costs polynomially many BSS steps. The gate variables from Lemma 2.1 may also be included as a redundant witness.

The standard BSS completeness theorem says that HN_C is NP_C-complete under uniform polynomial-time BSS reductions. See Blum–Shub–Smale (1989), and Bürgisser, arXiv:2606.25121v2, Sections 1.1 and 2.1, which explicitly state the completeness and its quadratic restriction. Here is the relevant encoding mechanism, including the operations that can otherwise hide an error.

A polynomial-time verifier has only polynomially many accessible tape cells during its computation. A polynomial-size tableau stores their values, the finite control state, and Boolean choices of branch outcomes at every step. Conditions for a fixed instruction are polynomial equations. Conditional constraints are gated by Boolean activation variables, and any resulting higher-degree equations are quadratized by Lemma 2.1. One-hot state and head-position variables and their local transitions give polynomially many constraints. Halting is padded by idle steps to the fixed time bound.

An active division v=a/b requires both

```math
bv-a=0,\qquad bu-1=0
```

for an auxiliary u. The second equation excludes b=0. An equality branch whose Boolean flag b is one exactly on the zero outcome can be encoded by

```math
b(b-1)=0,\qquad b t=0,\qquad (1-b)(tu-1)=0.
```

For b=1 these require t=0. For b=0 they require t nonzero. The inactive inverse variable is unrestricted. Boolean activation for the finite control state handles inactive instructions in the same way. Input cells are constrained to their supplied values, constants to the machine's fixed constants, and the final state to acceptance.

Every accepting run supplies a solution of the tableau constraints. Every solution supplies a legal run: the Boolean state/branch constraints and deterministic transitions force the correct next configuration, and the inverse equations validate every used division and nonzero branch. The number of time steps and cells is polynomial, so the constraints and the uniform construction have polynomial size. This is the standard completeness construction, not a new theorem.

Thus proving HN_C outside P_C is equivalent to proving P_C != NP_C with the stated machine constants.

## 4. The permanent graph and hierarchy

For an m by m matrix X over C, define

```math
\mathop{\mathrm{per}}_m(X)
=\sum_{\sigma\in S_m}\prod_{i=1}^m X_{i,\sigma(i)},
\qquad
G_m=V\!\left(y-\mathop{\mathrm{per}}_m(X)\right)
\subseteq\mathbb C^{m^2+1}.
```

Its input length is polynomially equivalent to m^2. A family of graph deciders derived from one uniform machine is a special case of a nonuniform family of algebraic computation trees, obtained by unrolling the machine at each fixed input length. Each tree may use different constants; the imported permanent lower bound permits them. The generic branch used in the graph-hardness argument need not be found by a uniform algorithm.

Define Sigma_0^C=Pi_0^C=P_C. A fixed level Sigma_k^C is given by k alternating blocks of polynomially many quantified complex elements, beginning existentially, followed by a uniformly polynomial-time decidable relation. Pi_k^C begins universally. The integer k is fixed independently of m, and all variable lengths and verification costs have uniform polynomial bounds.

If P_C=NP_C, every fixed level collapses to P_C. Proof is induction on k: P_C is closed under complement; a polynomial existential quantifier over a P_C relation defines an NP_C language and therefore a P_C language under the hypothesis. Complement handles universal quantification. The machine and polynomial obtained at each step can depend on that fixed k.

This argument does not give a polynomial-time algorithm for a family with k=k(m) tending to infinity. Its exponent can grow at each elimination step. Nor does a feasibility decider provide polynomial-time functions returning arbitrary complex roots: even choosing a square root cannot be performed globally by rational arithmetic on a generic input. Any proposed witness-construction step must supply its own justification.

## 5. Exact logical gap

The graph-hardness consequence in this folder proves, relative to the imported border lower bound, that G is outside P_C. To deduce the target from P_C=NP_C it remains to put G in a class that actually collapses with a sufficiently controlled cost. A polynomial number of quantified scalars, without a bound on the alternating dependencies, is insufficient. The incidence alternative must instead supply its own polynomial-size NP witness equations and complexity-preserving boundary argument.
