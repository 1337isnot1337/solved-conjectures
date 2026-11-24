# Concrete regular-value certificate attempts under an HN hypothesis

Research status: failed certificate attempts, 23 November 2026 (America/Chicago). The objective is a polynomial-resource complex first-order formula for the regular value of a short rational expression at a point where its displayed denominator vanishes. Such a formula could be relevant to the signed-multiplicity and saturated-path routes. The formulas below do not meet that objective. Their failures persist if Hilbert Nullstellensatz feasibility is assumed to have a polynomial-time decider.

The notes use division-free circuits for the displayed numerators and denominators. Derivatives and all arithmetic in a verifier are charged.

## 1. Pointwise quotient lifting sees support, not multiplicity

For univariate $`P,Q\in\mathbb C[t]`$, with $`Q\ne0`$, consider
```math
\forall t\in\mathbb C\ \exists u\in\mathbb C:
\qquad Q(t)u=P(t).                                      \tag{1}
```
This formula is equivalent to the support inclusion
```math
Q(t)=0\ \Longrightarrow\ P(t)=0.
```
It is not equivalent to polynomial divisibility or to regularity of $`P/Q`$.

For example,
```math
P(t)=t,\qquad Q(t)=t^2
```
satisfies (1): for $`t\ne0`$ take $`u=1/t`$, and at $`t=0`$ any $`u`$ works. The rational function $`P/Q=1/t`$ nevertheless has a pole at zero.

Adding a proposed value $`v`$ at a specified point $`\alpha`$,
```math
\forall t\ \exists u:
\quad Q(t)u=P(t),\qquad t\ne\alpha\ \lor\ u=v,             \tag{2}
```
does not repair this example at $`\alpha=0`$. Every $`v`$ is accepted. The existential values at distinct $`t`$ are independent; the formula supplies no continuity or regularity condition.

If $`Q`$ is known to be squarefree, then (1) does imply $`Q\mid P`$, because vanishing at every root forces all its distinct linear factors to divide $`P`$. That special case identifies the missing multiplicity information. It does not remove it from an arbitrary circuit denominator.

## 2. Polynomially many pointwise derivatives still do not force regularity

Fix a derivative cutoff $`\ell`$. A stronger candidate supplies a numerical quotient jet at every point:
```math
\forall t\ \exists u_0,\ldots,u_\ell:
\qquad
\sum_{i=0}^{j}\binom ji Q^{(i)}(t)u_{j-i}
=P^{(j)}(t)
\quad(0\le j\le\ell).                                  \tag{3}
```
These are the formal product-rule equations that genuine derivatives of a quotient satisfy. The derivative circuits through order $`\ell`$ can be formed by truncated gatewise differentiation with polynomial overhead in $`\ell`$ and the input circuit size. Formula (3) therefore has polynomial resources whenever $`\ell`$ is polynomially bounded.

Choose $`M=2^s>\ell`$ and
```math
P(t)=t^M,\qquad Q(t)=t^{M+1}.                            \tag{4}
```
Both circuits have $`O(s)`$ gates. At zero, every derivative of $`P,Q`$ appearing in (3) vanishes, so every equation is $`0=0`$. At nonzero $`t`$, set
```math
u_j=(-1)^j j!\,t^{-j-1}.
```
These are the actual derivatives of $`1/t`$ and satisfy every equation. Thus (3) accepts the pole $`1/t`$. Requiring $`u_0=v`$ when $`t=0`$ still admits every $`v`$.

For any fixed polynomial cutoff in the circuit length, $`M=2^s`$ eventually exceeds that cutoff. This disproves the proposed bounded-jet formula as a degree-independent regularity test. It does not rule out a different formula using the complete circuit in another way.

## 3. The same failure occurs when regular extension is promised

The signed-multiplicity route has more information: its rational function is known to extend regularly at the relevant zero or pole. Even with that promise, bounded pointwise quotient jets need not determine the extension value.

Let
```math
F(t)=t^M,\qquad M=2^s\ge2.
```
The two-derivative multiplicity expression is
```math
\mu(t)=\frac{F'(t)^2}{F'(t)^2-F(t)F''(t)}
=\frac{M^2t^{2M-2}}{Mt^{2M-2}}=M.                       \tag{5}
```
Take the displayed numerator and denominator in (5) as $`P,Q`$. If $`\ell<2M-2`$, every derivative in (3) vanishes at zero. At nonzero $`t`$, the genuine quotient jet is $`u_0=M`$, $`u_j=0`$ for $`j>0`$. At zero, any proposed $`u_0=v`$ is allowed.

Consequently the promise that a regular extension exists does not make (2) or (3) sound for its value. The actual constant graph $`v=M`$ must be distinguished from the vertical component introduced by clearing the common factor.

When the relevant denominator order is bounded by a supplied polynomial bound $`B`$, direct derivatives do suffice: find the first nonzero $`Q^{(q)}(\alpha)`$ with $`q\le B`$, require $`P^{(j)}(\alpha)=0`$ for $`j<q`$, and test
```math
P^{(q)}(\alpha)=vQ^{(q)}(\alpha).
```
The present problem has no such polynomial bound on $`q`$. Binary encoding of a candidate $`q`$ does not supply the derivative circuits of that order.

## 4. Gatewise weighted initial equations do not certify a valuation

A different proposal is to encode a leading order and leading coefficient for every circuit register, then use an HN query to check the initial equations at those weights. The following two-gate circuit already shows that the listed initial equations can admit false orders.

Let
```math
x=1+t,\qquad z=x-1.
```
The exact output is $`z=t`$. Assign weights
```math
w(t)=1,\qquad w(x)=0,\qquad w(z)=2.
```
Here the weight of a nonzero constant is zero, and the initial part keeps the terms of minimum weight.

The two gate equations are
```math
x-1-t=0,\qquad z-x+1=0.
```
Their initial equations are only
```math
x-1=0,\qquad -x+1=0.                                  \tag{6}
```
They have a solution with all leading coefficients nonzero, for example $`t=x=z=1`$. Thus feasibility of the gatewise initial system accepts the assigned output order two.

But the full circuit ideal also contains $`z-t`$, obtained by adding the two gate equations. Its initial form at the assigned weights is $`-t`$. Hence the full initial ideal has no point with all leading coefficients nonzero. The actual output order is one, as direct substitution already shows.

The failure is the distinction between the initial forms of the supplied generators and the initial ideal of all their polynomial consequences. A sound valuation certificate must address that distinction. The example does not prove that all methods need a large initial ideal or that no compressed certificate exists; it refutes this particular small HN encoding.

## 5. What the oracle hypothesis does and does not supply

Under $`P_{\mathbb C}=NP_{\mathbb C}`$, a fixed complex polynomial-hierarchy formula can be decided in polynomial time. That collapse would apply to a correct polynomial-size formula for the regular graph. It cannot turn the false formulas above into correct ones.

An HN query can test feasibility of the finite displayed equations. It does not assert that their pointwise quotient values form a regular function, or that their gatewise initial solutions lift to an actual formal arc. Those are the missing mathematical properties.

The distinction agrees with the primary-source caveat in Bürgisser and Cucker's [STOC 2004 extended abstract](https://www3.math.tu-berlin.de/algebra/work/p04-buergisser.pdf), Section 5.2, Lemma 5.5 and Remark 5.6: the cited transversality reasoning uses Euclidean neighborhoods and does not furnish a short complex-field formula. Its later counting-oracle application is not a polynomial-hierarchy regularity certificate.

No fixed-level complex formula for the required regular graph, no polynomially bounded local division witness, and no degree-independent radical-jet bound is proved in this note. The exact open step is to supply such a formula with soundness at the vanishing denominator, or exploit additional structure of the saturated resultant path to avoid that operation.

## 6. A sound three-polynomial closure formulation

There is an exact short formulation if approximate image membership is supplied as a separate primitive. For $`Q\ne0`$, define the polynomial map
```math
\Phi_{\alpha,v}(t,w)
=\bigl(t-\alpha,\ Q(t)w-1,\ P(t)w-v\bigr).               \tag{7}
```
Then the one-variable rational function $`P/Q`$ has finite regular value $`v`$ at $`\alpha`$ if and only if
```math
0\in\overline{\Phi_{\alpha,v}(\mathbb C^2)}.             \tag{8}
```
The bar can be taken as Euclidean or Zariski closure: the image is constructible, and these closures agree for complex constructible sets.

For the forward implication, choose $`t_\nu\to\alpha`$ avoiding the finitely many roots of $`Q`$, and put $`w_\nu=1/Q(t_\nu)`$. Regularity gives $`\Phi_{\alpha,v}(t_\nu,w_\nu)\to0`$.

Conversely, an approximating sequence in (8) has
```math
t_\nu\to\alpha,\qquad
Q(t_\nu)w_\nu\to1,\qquad
P(t_\nu)w_\nu\to v.
```
Eventually the middle product is nonzero, so $`Q(t_\nu)\ne0`$, and
```math
\frac{P(t_\nu)}{Q(t_\nu)}
=\frac{P(t_\nu)w_\nu}{Q(t_\nu)w_\nu}\longrightarrow v.
```
A one-variable rational function near a finite point either has a removable singularity with a unique finite limit or has a pole whose modulus diverges along every approach avoiding the point. The displayed finite limit therefore proves the assertion.

Map (7) has two variables, three output coordinates, and circuit size $`O(L(P)+L(Q)+1)`$. It specializes directly to the signed-multiplicity numerator and denominator. This is a sound reduction to approximate polynomial satisfiability, rather than a claim that this restricted approximate problem belongs to $`NP_{\mathbb C}`$ or to a fixed level of $`PH_{\mathbb C}`$.

Replacing image closure by ordinary feasibility is false even in the smallest removable example:
```math
P(t)=Q(t)=t,\qquad \alpha=0,\qquad v=1.
```
The rational function is the constant one. The map values tend to zero along $`t\to0,w=1/t`$, but its exact zero equations contain both $`t=0`$ and $`tw=1`$, which are inconsistent. Thus an ordinary HN oracle cannot be substituted for the closure predicate in (8) without an additional reduction.

The formulation is specific to a univariate quotient. For a rational function of several variables, a finite limit along one sequence need not imply regularity at the point. No such stronger claim is made here.

## 7. Symbolic field extension does not add a valuation predicate

Assume hypothetically that a fixed BSS machine decides HN over $`\mathbb C`$ in polynomial time, with its allowed finite list of complex constants. Let $`K`$ be an algebraically closed extension of $`\mathbb C(\epsilon)`$, equipped with an extension of the $`\epsilon`$-adic valuation.

For a fixed encoded input dimension and time bound, the machine's computation has a finite first-order description using field equations and inequations. Algebraically closed field extensions preserve such statements with the machine constants as parameters. Thus the same bounded program decides field solvability over $`K`$.

If the supplied coefficients are rational functions of $`\epsilon`$ represented by small circuits over $`\mathbb C`$, its arithmetic registers remain rational functions with shared circuit representations. An equality branch reduces to testing whether a numerator polynomial $`p(\epsilon)`$ is identically zero. Its negation is the HN condition
```math
\exists e,u\in\mathbb C:\quad p(e)u-1=0.
```
Under the hypothesized HN algorithm, the polynomially many symbolic branches can therefore be simulated with polynomial overhead. This gives exact generic field decisions, without selecting a root or an algebraic witness function.

It does not give decisions about the valuation ring
```math
\mathcal O=\{a\in K:\mathop{\mathrm{val}}_\epsilon(a)\ge0\}.
```
No pure-field first-order formula, even one using $`\epsilon`$ as a parameter, defines $`\mathcal O`$ as a subset of $`K`$. Indeed, Boolean combinations of algebraic sets are constructible, and existential projection preserves constructibility by [Chevalley's theorem, Stacks tag 054K](https://stacks.math.columbia.edu/tag/054K). Induction over quantifiers shows that every one-variable field-definable subset of an algebraically closed field is constructible. A constructible subset of the affine line is finite or cofinite. But $`\mathcal O`$ and its complement are both infinite: they contain respectively $`\epsilon^j`$ and $`\epsilon^{-j}`$ for positive integers $`j`$.

The witness distinction is already visible in one equation:
```math
\epsilon c=1.
```
It has a solution in $`K`$, namely $`c=\epsilon^{-1}`$, and has no solution with $`c\in\mathcal O`$. A transferred HN query answers the first question. It cannot be treated as an answer to the second.

Likewise, an existential scalar in a symbolic extension cannot silently be assumed to be a constant complex coefficient independent of $`\epsilon`$. The embedded constant field is also infinite and coinfinite and is not a definable subset in the pure-field language. Any intended restriction to constant or regular series witnesses needs an additional, explicitly represented condition.

This nondefinability statement is about arbitrary elements of the extension field as field elements. It does not prove that valuations or regular values of *bounded circuit encodings over $`\mathbb C`$* lack finite complex formulas: for a bounded explicit degree, their coefficient conditions can be written down. The unresolved resource issue is whether those conditions admit polynomial-size encodings when the circuit degree and required cancellation order are exponential.

Thus symbolic transfer supplies algebraic solvability and generic equality decisions. It does not supply valuation-ring membership, boundedness of the unknown witnesses, a regular-graph predicate, or an aggregate over an exponentially large set of roots.
