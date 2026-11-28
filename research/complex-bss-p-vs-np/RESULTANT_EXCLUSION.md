# Exclusion complexity of quadratic resultants and the complex BSS separation

Status: **open major conjecture; proved reduction criterion and elementary subsidiary facts only**.
Date: November 23, 2026. Coordination: [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

This note uses the repository's standing assumption that the November 23 Anthropic VP != VNP theorem, including its quantitative border bound, is valid. It does not claim to settle Peter Bürgisser's Conjecture 1.1 or P_C != NP_C. A quantitative permanent-zero test lower bound follows from imported factor theorems. The main result below is a sharp *sufficient target* for the missing BSS separation: lower-bound the arithmetic complexity of **every nonzero polynomial multiple** of an explicit family of quadratic resultants.

## 1. Major open target and sources

The exact conjecture is Bürgisser (October 19, 2026, [Conjecture 1.1](https://arxiv.org/html/2606.25121v2)):

```math
\mathsf{VNP}_{\mathbb C}\not\subseteq\overline{\mathsf{VP}}_{\mathbb C}
\quad\Longrightarrow\quad
\mathsf P_{\mathbb C}(\mathrm{nu})\ne\mathsf{NP}_{\mathbb C}(\mathrm{nu}).
```

The premise is covered by the imported Anthropic claim. The conclusion is open, and the opposite direction of the implication in Bürgisser's Theorem 1.1 does **not** establish it.

Primary sources:
- P. Bürgisser, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, [arXiv:2606.25121v2](https://arxiv.org/html/2606.25121v2), Conjecture 1.1, Sections 1.4, 3 and 6.
- P. Bürgisser, *The Complexity of Factors of Multivariate Polynomials*, corrected [arXiv:1812.06828v1](https://arxiv.org/html/1812.06828v1), Lemma 1.1, Theorem 1.3, Remark 1.4(1), Corollary 1.5. Published 2004; this corrected reprint matters for exact statements.
- Anthropic / Claude, *VP != VNP over every field*, [pinned code and paper](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp). Imported border bound; **no new independent proof or Lean build here**.
- C. S. Bhargav, R. Curticapean, G. Jindal, H. Shukla, *Multivariate Resultants: Complexity and Applications to Real Feasibility*, [author manuscript](https://bhargavcs.github.io/files/resultants-and-etr.pdf); this is the reported exact-resultant arithmetic-complexity connection, **not** a nonzero-multiple theorem.

A search of the source literature and this repository's issues #247 and #248 found that the nonzero-multiple extension remains the critical missing implication. The graph lower bound was already developed in [research/bss-permanent-graph/](../bss-permanent-graph/); it is **not** reproved or presented as new here.

## 2. Resultant exclusion complexity: a sufficient criterion

Let $`q_0,\ldots,q_n`$ be homogeneous quadratic forms in projective coordinates $`x_0,\ldots,x_n`$, with every coefficient an independent input variable. Their multivariate resultant is the absolutely irreducible polynomial

```math
R_n=\mathop{\mathrm{Res}}_{2,\ldots,2}(q_0,\ldots,q_n)
\quad\in\mathbb C[u_1,\ldots,u_{N_n}],
\qquad N_n=(n+1)\binom{n+2}{2}=\Theta(n^3).
```

Its zero set consists exactly of coefficient tuples whose quadrics have a common **nonzero** projective solution. Define its *exclusion complexity*

```math
\mathop{\mathrm{EC}}(R_n)
=\min\{L(F):0\ne F\in\mathbb C[u_1,\ldots,u_{N_n}],\ R_n\mid F\}.
```

$`L(F)`$ is the length of a division-free arithmetic straight-line program computing $`F`$, with arbitrary complex constants and all arithmetic operations charged. The degree or multiplicity of the multiplier is unrestricted.

**Proposition 1 (precise sufficient criterion).** If $`\mathop{\mathrm{EC}}(R_n)=n^{\omega(1)}`$, then $`\mathsf P_{\mathbb C}(\mathrm{nu})\ne\mathsf{NP}_{\mathbb C}(\mathrm{nu})`$. This is an *if-then reduction*, not an established exclusion-complexity lower bound.

**Proof.**
(a) The family of languages $`Z_n=\{u:R_n(u)=0\}`$ lies in uniform $`\mathsf{NP}_{\mathbb C}`$: a witness is a nonzero vector $`x\in\mathbb C^{n+1}`$; evaluate the $`n+1`$ quadratic forms at $`x`$ (at most $`O(n^3)`$ scalar operations) and check that every output vanishes and at least one $`x_i`$ does not. Equivalently one can supply an index $`j`$ and $`x_j^{-1}`$ as witnesses and enforce $`x_j\cdot x_j^{-1}=1`$. This is a fixed algebraic verifier with polynomial input length and witness length.

(b) Suppose instead $`\mathsf P_{\mathbb C}(\mathrm{nu})=\mathsf{NP}_{\mathbb C}(\mathrm{nu})`$. Since the $`Z_n`$ belong to the latter, for every $`n`$ there would exist a deterministic, nonuniform algebraic decision circuit (or computation tree) deciding $`Z_n`$, of length $`T_n=n^{O(1)}`$, with arbitrary complex constants, arithmetic, **defined division**, and equality tests.

(c) By the generic-branch/exclusion lemma, any such tree for the zero set of an irreducible polynomial $`R_n`$ exposes a nonzero polynomial $`F_n`$ divisible by $`R_n`$, whose division-free straight-line-program complexity is $`L(F_n)\le4T_n+O(1)`$. To see this, follow an accepting path on a dense Zariski-open subset of the irreducible hypersurface $`V(R_n)`$. Represent every rational register by numerator and denominator circuits; an arithmetic instruction increases their operation counts by at most four. A zero-branch numerator vanishing on the hypersurface but not in the ambient polynomial ring must occur. Otherwise the accepted path would extend to a nonempty ambient Zariski-open set, incorrectly accepting a point outside $`V(R_n)`$. Such a nonzero numerator vanishes identically on $`V(R_n)`$ and hence is divisible by $`R_n`$ because the hypersurface is irreducible over $`\mathbb C`$. Division denominators stay nonzero on the retained generic subset and do not invalidate this argument. This is the established Bürgisser Lemma 1.1 mechanism, also spelled out with divisions in [the graph proof](../bss-permanent-graph/PROOF.md).

(d) Thus $`\mathop{\mathrm{EC}}(R_n)\le4T_n+O(1)=n^{O(1)}`$, contradicting the hypothesized superpolynomial exclusion-complexity bound. QED.

**Logical qualification.** Proving $`L(R_n)`$ is superpolynomial is **not enough**. A decision tree yields *some unknown* $`F_n=R_n Q_n`$, not necessarily $`R_n`$ itself. This is why Proposition 1 is not implied by the reported BCJS result about computing $`R_n`$.

## 3. Why Bürgisser's factor theorem does not close the bridge

The resultant is multihomogeneous of degree $`2^n`$ in the coefficient variables of **each** $`q_i`$. Indeed, fixing the other $`n`$ generic quadrics produces $`2^n`$ projective intersection points, so the resultant is, up to scalar, the product of $`q_i`$'s evaluations at those points. Consequently,

```math
\deg R_n=(n+1)2^n.
```

The corrected factor theorem (2018, Theorem 1.3) gives in characteristic zero, for a factor $`g`$ of degree $`d`$,

```math
\underline L(g)
\le O\big(M(d)M(d^4)\mathop{\mathrm{EC}}(g)+d^{2\gamma}M(d)^2\big),
```

where $`M`$ is the complexity of univariate polynomial multiplication and $`\gamma`$ is a valid matrix-multiplication exponent. The bound is **independent of the degree and multiplicity of the supplied multiple** $`F`$, but depends polynomially on the degree $`d`$ of the *target factor* $`g`$.

For $`g=R_n`$, $`d=(n+1)2^n`$. Therefore a polynomial-size decision circuit yields only $`\underline L(R_n)\le2^{O(n)}`$, not $`\underline L(R_n)\le n^{O(1)}`$. Even a superpolynomial border lower bound of the order currently claimed for the permanent would not contradict this. The proposed extension from *hard resultant* to *every nonzero multiple is hard* requires a genuinely new degree-insensitive recovery principle or a different lower-bound argument.

There is also an elementary geometric obstruction to shrinking the degree by simply replacing the defining equation. Since $`R_n`$ is absolutely irreducible, any nonzero polynomial $`H`$ in the same coefficient variables vanishing on all of $`V(R_n)`$ is divisible by $`R_n`$. Thus

```math
V(R_n)\subseteq V(H),\quad H\ne0
\quad\Longrightarrow\quad
\deg H\ge(n+1)2^n.
```

This statement concerns polynomials in the **same coefficient variables**; it does not rule out introducing auxiliary witnesses, highly special substitutions, or lower-degree equations defining an *incidence variety*. The degree bound alone is not a circuit-size lower bound: repeated squaring constructs some exponentially high-degree polynomials with only $`O(n)`$ gates.

### A conditional milestone to pursue

A concrete sufficient hypothesis is:

```math
\exists\,h(n)=n^{\omega(1)}
\quad\forall\,0\ne Q_n\in\mathbb C[u_1,\ldots,u_{N_n}]:
\quad L(R_nQ_n)\ge h(n).
```

Here $`Q_n`$ may depend on $`n`$, use arbitrary complex constants and have arbitrarily high degree. By Proposition 1, proving this would establish the nonuniform BSS separation and hence the uniform one. It is **open**.

A possible intermediate research direction is a robust *transverse initial-form transfer*: given a low-complexity $`F=RQ`$, seek a polynomially parameterized family of smooth points of $`V(R)`$ along which a suitable initial form of $`R`$ encodes a hard permanent polynomial while $`Q`$ does not vanish identically. A dimension/degree calculation must show that the family is sufficiently rich to evade an arbitrary cofactor $`Q`$. Fixed special slices do not suffice: $`Q`$ may vanish on the entire slice. The existing [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248) documents why naive finite-jet extraction can also be masked by an arbitrary cofactor. No such uniform recovery theorem is claimed here.

## 4. Distinct consequence: the zero set of the permanent itself

The established graph-hardness result tests $`y=\mathop{\mathrm{per}}_m(X)`$ on an extra input. One can instead apply the general factor argument *directly* to testing $`\mathop{\mathrm{per}}_m(X)=0`$, because the permanent is irreducible.

**Lemma 2 (elementary irreducibility, all fields).** The generic permanent $`\mathop{\mathrm{per}}_m(X)`$ is irreducible in $`\mathbb F[x_{ij}:1\le i,j\le m]`$ for $`m\ge2`$, over any field $`\mathbb F`$.

**Proof.** If $`\mathop{\mathrm{per}}_m=A B`$, then the total degree in the variables of row 1 is 1, so one of the factors, say $`A`$, is independent of row 1. Expanding the permanent in that row gives

```math
\mathop{\mathrm{per}}_m=\sum_{j=1}^m x_{1j}M_j,
```

where $`M_j`$ is the permanent of the submatrix deleting row 1 and column $`j`$. Since $`A`$ is independent of the row-1 variables, $`A\mid M_j`$ for each $`j`$. But $`M_j`$ is independent of *every* variable in column $`j`$; additivity of the total degree in that column forces $`A`$ to be independent of column $`j`$. This holds for every $`j`$, so $`A`$ is constant. QED.

By applying the generic path lemma to the irreducible hypersurface $`V(\mathop{\mathrm{per}}_m)`$, a size-$`T`$ algebraic decision circuit for the predicate $`\mathop{\mathrm{per}}_m(X)=0`$ yields a nonzero multiple with straight-line cost at most $`4T+O(1)`$. The factor theorem with $`d=m`$, schoolbook multiplication $`M(q)=O(q^2)`$, and classical $`\gamma=3`$ gives

```math
\overline S(\mathop{\mathrm{per}}_m)
\le K m^{10}(T+1)
```

after converting to the source paper's total-gate convention (input and constant gates included). Combining with the imported claimed border lower bound $`\overline S(\mathop{\mathrm{per}}_m)\ge2^{a(\log_2 m)^{4/3}}`$, for all sufficiently large $`m`$ and an absolute $`b>0`$,

```math
T\ge2^{b(\log_2 m)^{4/3}}.
```

This is a **conditional quantitative consequence of previously established factoring theory and the imported VP != VNP statement**, not a newly discovered lower-bound method. It applies to exact complex arithmetic with arbitrary constants, defined division and branching, but does **not** establish that the permanent-zero language belongs to $`\mathsf{NP}_{\mathbb C}`$ or that $`\mathsf{P}_{\mathbb C}\ne\mathsf{NP}_{\mathbb C}`$. An alternative route via the [graph theorem](../bss-permanent-graph/) and VNP-completeness is available; this direct proof makes irreducibility and the exclusion argument explicit.

## 5. Current status

**Established by this note, given imported sources:** precise all-multiple sufficient criterion for the nonuniform BSS separation, exponential-degree obstruction in the resultant factor route, elementary all-field irreducibility of the permanent, and the resulting complex permanent-zero decision lower bound.

**Not established:** a superpolynomial lower bound for $`\mathop{\mathrm{EC}}(R_n)`$, membership of permanent zero-testing in $`\mathsf{NP}_{\mathbb C}`$, a separation of complex BSS $`\mathsf P`$ and $`\mathsf{NP}`$, or a complete proof of Bürgisser's conjecture. No Lean formalization or external review of these new deductions is claimed.
