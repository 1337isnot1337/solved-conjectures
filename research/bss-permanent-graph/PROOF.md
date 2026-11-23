# A quantitative BSS decision lower bound for the permanent graph

Written 23 November 2026. Coordination: [#247](https://github.com/1337isnot1337/solved-conjectures/issues/247). Application boundary: [#248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

This note proves a consequence of Claude (Anthropic), *VP ≠ VNP over every field*, at commit `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`, and Peter Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, corrected arXiv:1812.06828v1. The imported results are stated explicitly below. The new material here is the detailed model conversion and quantitative deduction, not a new border lower-bound method. The [source audit](SOURCES.md) separates inspected statements from a fresh formal proof check.

## 1. Statement and computational model

For an integer $`m\ge2`$, write

```math
f_m(X)=\mathop{\mathrm{per}}_m(X)
=\sum_{\sigma\in S_m}\prod_{i=1}^{m}x_{i,\sigma(i)},
\qquad
g_m(X,y)=y-f_m(X),
\qquad
G_m=V(g_m)\subset\mathbb C^{m^2+1}.
```

The input is the ordered list of the $`m^2`$ complex matrix entries, followed by $`y`$. For fixed $`m`$, its scalar length is $`N=m^2+1`$. A scalar is one exact complex input, not a binary encoding or a bounded-precision number.

A deterministic algebraic computation tree is a finite rooted tree with the following nodes. An arithmetic node computes one of $`u+v`$, $`u-v`$, $`uv`$, or $`u/v`$ from input coordinates, constants, or values computed earlier on that path. A branch tests equality of two such values; testing a value against zero is included. Leaves accept or reject. Each arithmetic node and each branch costs one. Loading a constant, copying a value, and naming an input may be free; making them costly can only strengthen the lower bound. Constants are arbitrary elements of $`\mathbb C`$, with no algebraicity, bit-size, or computability restriction.

Division is permitted only when its divisor is nonzero on the actual input at that point of execution. A tree decides $`G_m`$ if it is defined and terminates on every input in $`\mathbb C^N`$, accepting exactly the points of $`G_m`$. Its cost is the maximum number of arithmetic and branch nodes on an executed path. If that maximum is infinite, every lower bound below is immediate; otherwise denote it by $`T`$. Only reachable portions of the tree matter. Tree size need not be polynomial, and no uniformity is assumed for the family of trees.

**Theorem 1.** There exist constants $`b>0`$ and $`m_1\ge2`$ such that for every $`m\ge m_1`$ and every such tree deciding $`G_m`$,

```math
T\ge 2^{b(\log_2 m)^{4/3}}.
```

The constants $`b,m_1`$ are independent of the tree and of all of its complex constants. In particular, allowing a separate nonuniform tree with arbitrary constants for every $`m`$ does not avoid the bound.

Section 8 proves the corresponding uniform BSS-machine statement. The proof also covers a specified convention that charges only nonlinear operations and branches, by a separate polynomial conversion in Section 9. No root, transcendental-function, conjugation, order, or arbitrary-polynomial oracle nodes are part of the model.

## 2. Two imported results and their conventions

### 2.1. Arithmetic and approximative straight-line complexity

For a polynomial $`h\in\mathbb C[z_1,\ldots,z_n]`$, let $`L(h)`$ be the least number of binary additions, subtractions, and multiplications in a division-free straight-line program computing $`h`$. Input variables and arbitrary complex constants are available without a separate operation charge. Arithmetic involving a scalar is charged. Thus $`L`$ counts all arithmetic operations, not only nonscalar multiplications.

Let $`R=\mathbb C[\varepsilon]_{(\varepsilon)}`$, the local ring of rational functions regular at $`\varepsilon=0`$, and $`K=\mathbb C(\varepsilon)`$. Define $`\underline L(h)`$ as the least $`r`$ for which there is $`H\in R[z_1,\ldots,z_n]`$ with $`H|_{\varepsilon=0}=h`$ and a division-free straight-line program of length at most $`r`$ over $`K`$ computing $`H`$. Intermediate constants and values may have poles in $`\varepsilon`$; the output coefficients must be regular. This is Bürgisser's Definition 2.1, using the operation convention of his Section 1.1.

Define exclusion complexity by

```math
\mathop{\mathrm{EC}}(g)
=\min\{L(P):0\ne P\in\mathbb C[z_1,\ldots,z_n],\ g\mid P\}.
```

There is no upper bound on the degree of $`P`$ or on the multiplicity of $`g`$ in $`P`$.

### 2.2. Bürgisser's factor theorem

**Imported result B.** In characteristic zero, for $`g`$ of degree $`d\ge1`$, corrected arXiv:1812.06828v1, Theorem 1.3 gives

```math
\underline L(g)
\le C\left(M(d)M(d^4)\mathop{\mathrm{EC}}(g)
             +d^{2\gamma}M(d)^2\right).
```

Here $`M(q)`$ is an arithmetic-operation bound for multiplying two univariate polynomials of degree at most $`q`$, and $`\gamma`$ is any admissible matrix-multiplication exponent. The constant is uniform in the degree, number of input variables, and chosen multiple of $`g`$. The graph case has the sharper bound, stated in Remark 1.4(1),

```math
\underline L(y-\varphi(x))
\le C_B M(d^2)\mathop{\mathrm{EC}}(y-\varphi(x)),
\qquad d=\deg(y-\varphi(x)).                         \tag{B}
```

Its direct decision version is Corollary 1.5. We prove our own division-safe decision-to-exclusion step instead of assuming the coefficient-one convention of Lemma 1.1. Over $`\mathbb C`$, one may take

```math
M(q)\le C_M q\log_2(q+1)\qquad(q\ge1).              \tag{2.1}
```

For completeness, choose a power of two $`s\ge2q+1`$ with $`s<4q+2`$, pad the coefficient vectors to length $`s`$, apply the radix-two discrete Fourier transform at the $`s`$th roots of unity, multiply corresponding values, and apply the inverse transform. The recurrence for each transform is $`A(s)\le2A(s/2)+Cs`$, so it uses $`O(s\log s)`$ additions and scalar multiplications. Roots of unity and $`1/s`$ are allowable complex constants. This proves (2.1) while charging scalar arithmetic. Section 7 gives an alternative using only schoolbook multiplication and Theorem 1.3.

Source: [Bürgisser, corrected full text](https://arxiv.org/html/1812.06828v1), Section 1.1, Theorem 1.3, Remark 1.4(1), Corollary 1.5, Definition 2.1. The 2018 correction identifies an error in the original Theorem 5.7, which is not invoked in this deduction. The dependence on multiplicity in Theorem 1.2 is precisely why the exact-factor theorem is insufficient for the present argument.

### 2.3. The pinned permanent border lower bound

Let $`\overline S(h)`$ be the least size of a circuit over $`\mathbb C((\varepsilon))`$ whose output is

```math
h+\varepsilon H,
\qquad H\in\mathbb C[[\varepsilon]][z_1,\ldots,z_n].
```

A circuit is a finite list of input variables, arbitrary scalar constants, sums of two earlier entries, and products of two earlier entries. Its size counts **all entries**, including inputs and constants. Intermediate coefficients may have negative powers of $`\varepsilon`$. No input-dependent division gates are allowed. No bound on the degree of the approximating output is imposed.

**Imported result A.** In the pinned paper, Theorem 1.4 applies the quantifiers of Theorem 1.1 to the approximating circuits of Definition 1.3. Specializing to characteristic zero, there exist $`a>0`$ and $`m_0`$ such that for every $`m\ge m_0`$,

```math
\overline S(f_m)>m^{a(\log_2 m)^{1/3}}
                 =2^{a(\log_2 m)^{4/3}}.             \tag{A}
```

The appendix labels are Definition N.1 and Theorem N.5. The precise formal statement is `Statement.MainTheoremApprox`; `Solution.mainTheoremApprox` proves it using `Paper.thm_approx`. It quantifies over every field of the specified characteristic, arbitrary Laurent-series constants, every sufficiently large $`m`$, and every approximating circuit. There is no infinitely-often restriction or constant-free hypothesis.

Sources: [pinned paper](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf), [Statement.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean), [Solution.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean).

## 3. Algebraic facts about the graph

The substitution homomorphism

```math
\pi:\mathbb C[X,y]\longrightarrow\mathbb C[X],
\qquad P(X,y)\longmapsto P(X,f_m(X))
```

is surjective and has kernel $`(g_m)`$. Indeed, polynomial division in $`y`$ by the monic polynomial $`y-f_m(X)`$ gives a remainder in $`\mathbb C[X]`$, and that remainder equals $`\pi(P)`$. Therefore

```math
\mathbb C[X,y]/(g_m)\cong\mathbb C[X].
```

The quotient is an integral domain, so $`(g_m)`$ is prime and $`g_m`$ is irreducible. The graph is isomorphic to affine $`m^2`$-space, hence is irreducible. Since $`f_m`$ is homogeneous of degree $`m`$ and $`m\ge2`$, $`\deg g_m=m`$. The graph is a proper hypersurface: for any $`X`$, choosing $`y=f_m(X)+1`$ gives a point outside it.

A polynomial that vanishes on a nonempty Zariski-open subset of this graph vanishes on the entire graph. Equivalently, its substituted polynomial $`\pi(P)`$ vanishes on a dense open subset of affine space and is zero. The kernel calculation then gives $`g_m\mid P`$. This avoids any additional Nullstellensatz assumption in the extraction step.

## 4. Extracting a small nonzero multiple from one path

**Lemma 2.** If a tree of cost $`T`$ decides $`G_m`$ in the model of Section 1, then

```math
\mathop{\mathrm{EC}}(g_m)\le4T+3.                    \tag{4.1}
```

**Proof.** We follow one graph-generic execution, retaining a nonempty Zariski-open subset $`U\subset G_m`$ on which every point follows the chosen prefix. Initially $`U=G_m`$. Represent each register by a pair of polynomials $`(A,B)`$ with value $`A/B`$. Initially input variables have pairs $`(z_i,1)`$ and a constant $`c`$ has pair $`(c,1)`$. The denominator of every retained register is nonzero at all points of the current $`U`$.

For registers $`A/B`$ and $`C/D`$, propagate the pairs by

| Operation | Numerator | Denominator | Division-free operations |
| --- | --- | --- | ---: |
| Addition | $`AD+CB`$ | $`BD`$ | 4 |
| Subtraction | $`AD-CB`$ | $`BD`$ | 4 |
| Multiplication | $`AC`$ | $`BD`$ | 2 |
| Division | $`AD`$ | $`BC`$ | 2 |

These are circuit operations; the polynomial coefficients are never expanded. At a division node the divisor cannot vanish identically on $`U`$: that would make the actual tree undefined on every input in $`U`$. Shrinking $`U`$ to avoid the divisor's numerator when necessary preserves a nonempty Zariski-open set. All denominator polynomials therefore remain nonzero upon restriction to the graph. In particular, each is also a nonzero ambient polynomial.

At an equality branch $`A/B=C/D`$, write

```math
E=AD-CB.                                               \tag{4.2}
```

Its restriction to the irreducible graph either vanishes identically or is nonzero. In the first case follow the equality branch. In the second case follow the disequality branch and replace $`U`$ by $`U\setminus V(E)`$. The latter set is nonempty because the graph is irreducible and $`E`$ does not vanish identically on it. For a zero test of $`A/B`$, one may simply take $`E=A`$.

Only finitely many restrictions arise on the selected path. The prefix therefore continues with nonempty $`U`$ until a leaf at depth at most $`T`$. If a prefix of greater depth existed, any point of its nonempty $`U`$ would contradict the worst-case bound. The reached leaf is accepting, because its $`U`$ consists of graph points and the tree is correct.

Suppose every equality branch selected on this path had $`E=0`$ as an ambient polynomial. Then those branches impose no ambient equation. Every other restriction on the path is the nonvanishing of a nonzero ambient polynomial: a denominator, a divisor numerator, or a disequality numerator. Let $`Q`$ be the product of all of these polynomials, with $`Q=1`$ for an empty product. It is nonzero. Since $`g_m Q`$ is a nonzero polynomial over the infinite field $`\mathbb C`$, there exists $`z\in\mathbb C^N`$ such that $`g_m(z)Q(z)\ne0`$. The point $`z`$ satisfies every condition along the accepting path, with every executed division defined. It would therefore be accepted, although $`g_m(z)\ne0`$. This contradicts correctness.

Consequently some equality branch has a numerator $`E`$ that is nonzero as an ambient polynomial and vanishes identically on the graph. By Section 3, $`g_m\mid E`$. To compute this one numerator, reproduce the numerator/denominator pairs of the arithmetic registers before that branch. There are at most $`T`$ arithmetic instructions, costing at most $`4T`$ division-free operations. Compute (4.2) with at most three additional operations. Previous branch predicates need not be computed by this straight-line program; their choices have already fixed the path. Thus $`L(E)\le4T+3`$, proving (4.1). $`\square`$

Identically zero tests have been handled explicitly: they may select a branch, but cannot serve as the nonzero multiple. Rational cancellation is unnecessary, because the pairs retain all required denominator restrictions. A source multiple such as $`g_m^{2^k}`$ can have enormous multiplicity after only $`k`$ squarings; nothing in Lemma 2 bounds or expands that multiplicity. No product of all tree tests is computed. The product $`Q`$ appears only in the correctness contradiction, not in the circuit whose complexity is bounded.

## 5. From the multiple to a compatible border circuit

Apply (B) with $`d=m`$ to Lemma 2:

```math
\underline L(g_m)\le C_B M(m^2)(4T+3).               \tag{5.1}
```

If $`G_\varepsilon(X,y)`$ is an approximating polynomial for $`g_m`$, the polynomial $`-G_\varepsilon(X,0)`$ approximates $`f_m`$. Substituting the scalar $`0`$ does not increase arithmetic cost; multiplication by $`-1`$ adds at most one operation. Hence

```math
\underline L(f_m)\le C_B M(m^2)(4T+3)+1.             \tag{5.2}
```

There is no division-elimination cost depending on the degree of the source multiple. Lemma 2 already produced a division-free polynomial circuit, and Bürgisser's approximative complexity is defined by division-free output programs. The permitted rational functions in $`\varepsilon`$ are scalar constants, not divisions by an input-dependent expression.

**Lemma 3 (gate convention).** For every polynomial $`h`$,

```math
\overline S(h)\le6\underline L(h)+1.                 \tag{5.3}
```

**Proof.** Take an approximating division-free program of length $`r=\underline L(h)`$ over $`\mathbb C(\varepsilon)`$. Replace every subtraction $`u-v`$ by $`u+(-1)v`$. There are at most $`2r`$ addition/multiplication gates. Discard gates not needed for the output. If there is an arithmetic gate, at most $`4r`$ distinct input and constant leaves feed the at most $`4r`$ operand positions of these gates; together with the operation gates this gives at most $`6r`$ entries. If there is no arithmetic gate, the output is one input or constant entry. The uniform bound $`6r+1`$ covers both cases.

The natural Laurent expansion embeds $`\mathbb C(\varepsilon)`$ in $`\mathbb C((\varepsilon))`$. Every output coefficient is regular at zero and has constant term equal to the corresponding coefficient of $`h`$. Consequently the output lies in $`h+\varepsilon\mathbb C[[\varepsilon]][z]`$, exactly as required by imported result A. Intermediate poles are allowed in both conventions. $`\square`$

For readers who prefer to list all $`n`$ inputs even when unused, the alternative bound $`n+4r+2`$ follows by counting at most $`2r+1`$ used original constants, one shared $`-1`$, and at most $`2r`$ operation gates. Either bound is polynomial in the number of inputs and arithmetic cost. Bound (5.3) uses the pinned source's actual convention, which lists only gates that occur.

Combining (2.1), (5.2), and (5.3), and absorbing numerical constants, gives one absolute $`K>0`$ such that for every $`m\ge2`$ and every correct tree,

```math
\overline S(f_m)
\le6C_B M(m^2)(4T+3)+7
\le K m^2\log_2(m+1)(T+1).                           \tag{5.4}
```

The only degree in this loss is the target graph degree $`m`$. The input count is $`m^2+1`$; no exponential function of it occurs. The degree and multiplicity of the extracted multiple do not occur at all.

## 6. Quantitative lower bound

Let $`\ell=\log_2m`$. For $`m\ge\max\{2,m_0\}`$, inequalities (A) and (5.4) imply

```math
T+1>
\frac{2^{a\ell^{4/3}}}{K m^2\log_2(m+1)},            \tag{6.1}
```

and therefore

```math
\log_2(T+1)>
a\ell^{4/3}-2\ell-\log_2\log_2(m+1)-\log_2K.         \tag{6.2}
```

The sum of the last three terms divided by $`\ell^{4/3}`$ tends to zero. Choose a threshold, independent of the tree, after which that sum is at most $`(a/2)\ell^{4/3}`$. Then

```math
T+1>2^{(a/2)\ell^{4/3}}.
```

Enlarge the threshold until $`(a/6)\ell^{4/3}\ge1`$. The preceding inequality implies

```math
T>2^{(a/2)\ell^{4/3}}-1
 \ge2^{(a/3)\ell^{4/3}}.
```

Thus Theorem 1 holds with $`b=a/3`$ after increasing $`m_1`$. The input-length formulation has the same exponent: $`m=\sqrt{N-1}`$ gives $`\log_2m=\tfrac12\log_2(N-1)`$. In particular the lower bound exceeds every fixed polynomial in $`N`$ for all sufficiently large valid input lengths.

The proof of `Paper.thm_approx` at the pinned commit supplies the witness $`a=1/1600^2`$. It is possible to substitute this into the displayed estimates. The argument needs only the stated existential positive constant, and neither imported theorem provides a practical explicit threshold for the final decision lower bound.

## 7. An independent polynomial-loss route through the general factor theorem

The sharper graph estimate is not needed to preserve the exponent. Take $`\gamma=3`$ using ordinary matrix multiplication, and take $`M(q)\le C(q+1)^2`$ using coefficient convolution. Theorem 1.3 then gives, for $`d\ge2`$,

```math
\underline L(g)
\le C'\left(d^2d^8\mathop{\mathrm{EC}}(g)+d^6d^4\right)
\le C'd^{10}(\mathop{\mathrm{EC}}(g)+1).
```

With $`g=g_m`$, Lemma 2, specialization, and Lemma 3 yield

```math
\overline S(f_m)\le K' m^{10}(T+1).                  \tag{7.1}
```

Combining (7.1) with (A) subtracts only $`10\log_2m+\log_2K'`$ from the exponent. The proof of Section 6 goes through unchanged. This second route establishes the requested exponent without the graph-specific improvement, fast polynomial multiplication, or any best-known matrix multiplication exponent.

## 8. Uniform BSS machines and arbitrary constants

Define a language on finite complex tuples by accepting at length $`N=m^2+1`$, $`m\ge2`$, exactly the tuple consisting of an $`m\times m`$ matrix and its permanent; reject other lengths. An explicit dimension header instead changes the length by only a constant. Denote this language by $`G`$.

Fix a deterministic complex BSS machine $`\mathcal M`$ with its usual finite program and fixed finite tuple of arbitrary complex constants. Arithmetic, defined division, equality branching, and ordinary control and tape operations have unit cost. Tape shifts and copy-address states are governed by the machine's finite control; no primitive converts arbitrary complex data directly into a discrete address. The standard elementary instruction model is enough. A presentation with a fixed rational map at each computation node is also covered: each of the finitely many fixed rational expressions can be expanded once into a finite straight-line program, giving a machine-dependent constant factor $`k_{\mathcal M}`$. No primitive may perform a family of unbounded-degree or unbounded-arity operations for free as the input length grows.

Suppose $`\mathcal M`$ decides $`G`$ and has a finite worst-case time bound $`t_{\mathcal M}(N)`$ at input length $`N`$. Fix $`m`$ and unroll its computation for at most $`t_{\mathcal M}(m^2+1)`$ steps. A branch history determines the control state, all shift instructions, and which register each instruction addresses. Input coordinates become named inputs of a computation tree; copies and shifts merely rename the available expressions. A field operation becomes its corresponding arithmetic node, and an equality branch becomes a tree branch. For fixed rational-map nodes, use the finite expansion described above.

The result is a correct algebraic computation tree for $`G_m`$ of height at most

```math
T_m\le k_{\mathcal M}\bigl(t_{\mathcal M}(m^2+1)+1\bigr). \tag{8.1}
```

The unrolled tree can have exponentially many nodes. The lower bound concerns height, so its total size is immaterial. Its constants are among the original machine constants and fixed constants in the instruction expansions; Theorem 1 even permits arbitrary additional constants.

Combining (8.1) with Theorem 1 gives

```math
k_{\mathcal M}\bigl(t_{\mathcal M}(m^2+1)+1\bigr)
\ge2^{b(\log_2m)^{4/3}}
```

for every sufficiently large $`m`$. Thus every such machine has superpolynomial worst-case running time along these input lengths. If for some length the worst-case time is infinite, the obstruction is immediate at that length. In particular no uniform polynomial-time BSS machine decides $`G`$:

```math
G\notin\mathsf P_{\mathbb C}.
```

This is an obstruction with the standard arbitrary machine constants. It does not rely on replacing them with algebraic constants, encoding them in bits, or restricting to constant-free machines.

## 9. A specified nonscalar-operation convention

The main proof charges all arithmetic operations. A lower bound in a total-gate model cannot simply be asserted in a model where linear arithmetic is free. Here is an explicit conversion for one usual stronger convention.

Allow arbitrary affine-linear combinations of already available registers at zero cost. Charge every multiplication of two nonconstant register functions, every division by a nonconstant register function, and every equality branch. Here a register is constant precisely when its ambient rational function in $`\mathbb C(X,y)`$ belongs to $`\mathbb C`$, before imposing branch conditions. Constancy only on a branch locus or on the graph does not qualify. Multiplication or division by a nonzero complex scalar is free. Require a finite computation tree, with all executed divisions defined. Let $`q`$ be the maximum charged cost on any path. The constants in an affine combination are arbitrary complex numbers, not input-dependent functions supplied by an oracle.

Follow the same graph-generic accepting path. There are at most $`q`$ nonlinear gate outputs on it, say $`w_1,\ldots,w_s`$, $`s\le q`$. Every register before the next nonlinear gate is an affine-linear combination of $`1`$, the $`N=m^2+1`$ input coordinates, and the preceding $`w_i`$. This follows by induction: affine operations preserve that span, and a nonlinear operation adds one new generator.

Choose the informative equality from the proof of Lemma 2. To compute its rational difference, it suffices to compute the at most $`2s`$ affine input forms to nonlinear gates, the $`s`$ nonlinear gates, and one final affine form for the difference tested. Each affine form uses at most $`N+s`$ nonconstant signals and can be evaluated with at most $`2(N+s)+1`$ ordinary arithmetic operations. Consequently its rational straight-line program has length at most

```math
(2q+1)\bigl(2(N+q)+1\bigr)+q
\le10(q+1)(N+q+1).                                  \tag{9.1}
```

The affine coefficients can depend on the selected path. This creates no problem because exclusion complexity permits arbitrary constants and the extraction is an existence argument. Clearing numerator/denominator pairs as in Lemma 2 costs at most four operations per instruction. The final rational difference has a nonzero numerator divisible by $`g_m`$. Thus

```math
\mathop{\mathrm{EC}}(g_m)\le40(q+1)(N+q+1).           \tag{9.2}
```

Combining (9.2) with (B) and Lemma 3 gives

```math
\overline S(f_m)
\le K''m^2\log_2(m+1)(q+1)(m^2+q+2)
\le K'''m^4\log_2(m+1)(q+1)^2.                      \tag{9.3}
```

Here $`m^2+q+2\le(m^2+2)(q+1)`$ and $`m^2+2\le\tfrac32m^2`$ for $`m\ge2`$. Comparing (9.3) with (A), taking logarithms, and absorbing the polynomial terms shows

```math
q\ge2^{b'(\log_2m)^{4/3}}
```

for some $`b'>0`$ and all sufficiently large $`m`$. For example, $`b'=a/6`$ is valid eventually. This proves compatibility for this precisely stated convention. It does not assert a lower bound for an unspecified measure in which tests or more powerful primitives might also be free.

## 10. Scope, prior work, and the BSS campaign

The published graph-to-approximation transfer is Bürgisser's Corollary 1.5. The present graph lower bound is obtained by applying that established transfer to the pinned permanent border lower bound, with a division-safe proof and explicit gate accounting. It is recorded as a theorem-combination consequence supporting the campaign, not as an original named-conjecture resolution.

No membership proof for $`G`$ in $`\mathsf{NP}_{\mathbb C}`$ or any fixed level of the uniform complex polynomial hierarchy appears here. A witness for a single permutation term does not certify the sum defining the permanent. Therefore $`G\notin\mathsf P_{\mathbb C}`$ does not by itself imply $`\mathsf P_{\mathbb C}\ne\mathsf{NP}_{\mathbb C}`$ or $`\mathrm{HN}_{\mathbb C}\notin\mathsf P_{\mathbb C}`$.

For source orientation, Bürgisser's separate 2026 paper, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, arXiv:2606.25121, Theorem 1.1 has the opposite implication toward algebraic hardness. Its Conjecture 1.1 explicitly proposes the reverse border-hardness implication for the nonuniform BSS classes. That conjecture is not used as a theorem here. The independent source audit identifies the retrieved version and the limits of that check.

The available ingredient for [campaign #248](https://github.com/1337isnot1337/solved-conjectures/issues/248) is Theorem 1 and inequality (5.4). The still-missing step for that campaign is a separate complexity upper bound or reduction placing an appropriate hard decision problem inside its nondeterministic or bounded-hierarchy target.
