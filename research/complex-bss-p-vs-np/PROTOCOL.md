# Weighted permanent protocols: valid formula and failed compressions

Status: research. This note does not prove that the permanent graph belongs to a fixed level of the complex polynomial hierarchy, and does not prove P_C differs from NP_C.

## 1. A uniform formula with a growing number of alternating blocks

Let X be an m by m complex matrix, m at least 1. Put

```math
F_X(z_1,\ldots,z_m)
=\left(\prod_{j=1}^m(2z_j-1)\right)
 \left(\prod_{i=1}^m\sum_{j=1}^m X_{ij}z_j\right).
```

This polynomial has degree at most D=m+1 in each variable, and an arithmetic circuit of size O(m^2). Its Boolean sum is the permanent:

```math
\sum_{b\in\{0,1\}^m}F_X(b)=\mathop{\mathrm{per}}_m(X).
```

Proof. Expand the product of row sums. A term is indexed by a map f from the rows to the columns and has coefficient product_i X_{i,f(i)}. If the image of f is S, its coefficient after summing over b is

```math
\sum_{T\supseteq S}(-1)^{m-|T|}
=\begin{cases}1&S=\{1,\ldots,m\},\\0&S\ne\{1,\ldots,m\}.\end{cases}
```

Surjective maps between two m-element sets are permutations. This proves the identity over C, including inputs with cancellations or zero entries.

For each i, let a_i=(a_{i,0},...,a_{i,D}) be D+1 quantified complex numbers and write q_i(t)=sum_{d=0}^D a_{i,d}t^d. Define R(X,y,a_1,r_1,...,a_m,r_m) by the conjunction

```math
\begin{aligned}
q_1(0)+q_1(1)&=y,
\\ q_{i+1}(0)+q_{i+1}(1)&=q_i(r_i) &&(1\le i\lt m),
\\ q_m(r_m)&=F_X(r_1,\ldots,r_m).
\end{aligned}
```

The relation R is decidable uniformly using O(m^2) arithmetic operations and equality tests. Horner evaluation suffices for every q_i; division is unnecessary. The total number of quantified field elements is m(m+2)+m=O(m^2).

### Proposition 1

For every X and y,

```math
y=\mathop{\mathrm{per}}_m(X)
\quad\Longleftrightarrow\quad
\exists a_1\ \forall r_1\ \exists a_2\ \forall r_2\ \cdots
\exists a_m\ \forall r_m\ R(X,y,a_1,r_1,\ldots,a_m,r_m).
```

Proof of completeness. For a fixed prefix r_1,...,r_{i-1}, choose

```math
q_i(t)=\sum_{b_{i+1},\ldots,b_m\in\{0,1\}}
F_X(r_1,\ldots,r_{i-1},t,b_{i+1},\ldots,b_m).
```

Its degree is at most D. Each endpoint recurrence follows by separating the next Boolean variable, and the terminal equation follows when no Boolean variables remain. The existential coefficients depend only on the preceding universal challenges, as the displayed quantifier order permits.

Proof of soundness. Define the true remaining sum at a prefix r_1,...,r_{i-1} to be the displayed polynomial s_i(t). Suppose the claimed previous value differs from s_i(0)+s_i(1). If the endpoint equation is false, R already fails. Otherwise q_i differs from s_i as a polynomial. Since C is infinite, there is r_i with q_i(r_i) different from s_i(r_i). This preserves a false claim for the next stage. Starting from a false y, repeat until i=m; the last false claim contradicts q_m(r_m)=F_X(r_1,...,r_m). Universal choices may depend on the earlier existential coefficients. Thus no existential winning strategy exists for a false y.

This has 2m quantifier blocks. Polynomially many quantified elements do not make the number of blocks constant. It therefore supplies no membership claim in any fixed Sigma_k^C or Pi_k^C.

## 2. Moving challenges before messages is unsound

Consider the proposed replacement

```math
\forall(r_1,\ldots,r_m)\ \exists(a_1,\ldots,a_m)\ R.
```

It accepts every X and every y. The following interpolation observation proves this stronger statement.

### Lemma 2

For arbitrary r,u,v in C, there is a polynomial q of degree at most 2 satisfying q(0)+q(1)=u and q(r)=v.

Proof. If r differs from 1/2, set

```math
q(t)=v+\frac{u-2v}{1-2r}(t-r).
```

If r=1/2, set

```math
q(t)=v+2(u-2v)(t-1/2)^2.
```

Both equations follow by substitution. Since D=m+1 is at least 2, both choices obey the protocol's degree bound.

To satisfy R for any preselected challenges, choose q_1 with endpoint sum y and value zero at r_1; choose each intermediate q_i with endpoint sum zero and value zero at r_i; choose the last polynomial with endpoint sum zero and value F_X(r) at r_m. When m=1, apply the lemma directly with u=y and v=F_X(r_1).

The smallest explicit false instance is m=1, X=[0], y=1. For every r, the degree-two polynomial

```math
q_r(t)=
\begin{cases}
(t-r)/(1-2r),&r\ne 1/2,
\\ 2(t-1/2)^2,&r=1/2
\end{cases}
```

passes the postponed protocol, even though the actual permanent is zero. This is an algebraic counterexample, not a numerical experiment.

## 3. Moving messages before challenges loses completeness

The reverse naive replacement

```math
\exists(a_1,\ldots,a_m)\ \forall(r_1,\ldots,r_m)\ R
```

also fails. Take m=2 and X=I_2, whose permanent is 1. Then

```math
F_X(z_1,z_2)=z_1(2z_1-1)z_2(2z_2-1).
```

The terminal equation would require a fixed polynomial q_2(r_2) to equal F_X(r_1,r_2) for every r_1,r_2. Set r_2=1. The right side is r_1(2r_1-1), which is not constant in r_1, while the left side is q_2(1). This is impossible. Thus this formula rejects a true instance.

Allowing each precommitted message to be a polynomial function of previous challenges repairs the logical dependency, but requires a representation of those multivariate functions. The degree bound alone gives exponentially many possible coefficients. A polynomial-size arithmetic representation is an additional assumption requiring its own proof.

## 4. What the cutting and postponement results supply

Primary source: Claude, Anthropic, *VP differs from VNP over every field*, [pinned paper](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf), repository commit 11b6c7e3c927df2658f513b6b68ea7f8929c62c5. The downloaded pinned PDF was inspected; its SHA-256 is 882f5eefb1e067cc8c99ddfe660c10d1d67f9fcee7b69364bd0bab06c0c1f97c. A primary deposit is also available at [Hexagon v1 PDF](https://hexagonmath.org/pdf/2611.00954v1).

The relevant exact identifiers are Definition J.1, Theorem J.4, and Lemma K.4. Definition J.1 preserves a weighted sum over accepting runs:

```math
\mathop{\mathrm{sum}}(z)
=\sum_\rho w_\rho\prod_{u\in L_\rho}\mathop{\mathrm{sum}}(u).
```

Lemma K.4 groups runs according to how many times named constants occur, giving a sum of the form

```math
\sum_e \lambda^e\mathop{\mathrm{sum}}(z_e).
```

These are algebraic identities, not permutations of logical quantifiers. Existentially choosing one run or one exponent vector does not verify their sum.

Theorem J.4 uses parameters satisfying

```math
(\log v)^{C_{\mathrm{cut}}\alpha}\le v,
\qquad
v^H\le\tau\le v^{H\alpha},
\qquad
s v^{48}\le\tau.
```

It produces pieces of time at most v^H, at most tau v^2/v^H pieces on each accepting run, and cut-program time at most tau/v^24. These are per-run resource bounds. They do not bound the number of accepting runs by a polynomial.

Appendices G through K assume the contracting case. Definition 2.1 and Theorem 2.2 establish a contracting-or-flat dichotomy. A use of J.4 over C must establish its contracting hypothesis over C, or provide another argument covering the flat case. The all-fields permanent lower bound alone supplies neither missing protocol.

## 5. The exact inference that remains unproved

The target would follow from the graph lower bound plus a uniform constant-alternation formula of polynomial size for the weighted sum. Proposition 1 proves a polynomial-size formula with growing alternation, while Sections 2 and 3 refute the two immediate flattenings. Neither refutation rules out a different constant-alternation protocol.

One should also distinguish the following propositions:

1. Every finite fixed level of PH_C collapses under P_C=NP_C.
2. A family of polynomial-length formulas with an unbounded number of quantifier alternations is decidable in polynomial time under that hypothesis.

The first is the standard inductive consequence. The second does not follow by that induction, because the polynomial exponent can grow with the number of eliminated blocks.

There is a possible quantitative route requiring less than a fixed level: a sufficiently small O(log log m) alternation count could still contradict a quantitative permanent-graph lower bound, if the elimination cost and its constants are controlled. No such protocol is established here.

## 6. Source-direction warning

Bürgisser, *Intractability of Hilbert's Nullstellensatz implies algebraic hardness of permanent*, [arXiv:2606.25121](https://arxiv.org/abs/2606.25121), v1 dated 23 June 2026 and v2 dated 19 October 2026, states the reverse border-hardness-to-BSS-separation direction as a conjecture. Its proved implication begins with BSS separation and concludes a constant-free Valiant separation. Those implications cannot be interchanged. Exact theorem text and the v1/v2 changes belong to the separate source audit.

## 7. A barrier to committing arithmetic circuits for all messages

One proposed repair of Section 3 is to existentially specify arithmetic circuits for the coefficient functions of all adaptive messages. The circuits take previous universal challenges as inputs, so logical dependencies would be represented correctly. The following example rules out a generic polynomial-size commitment theorem of this form, assuming the imported permanent circuit lower bound. It does not rule out every possible constant-alternation formula for the permanent graph.

First, the standard sum-check protocol has a uniqueness property stronger than Proposition 1.

### Lemma 3: uniqueness of a winning message

Fix a polynomial f in N variables over an infinite field, use an upper bound on each individual degree, and consider the endpoint sum-check protocol for the Boolean sum of f. Fix a complete winning existential strategy. At every challenge prefix r_1,...,r_{i-1}, its i-th message is the polynomial

```math
q_i(u)=\sum_{b_{i+1},\ldots,b_N\in\{0,1\}}
f(r_1,\ldots,r_{i-1},u,b_{i+1},\ldots,b_N).
```

Proof. At a prefix of a winning strategy, the previous claimed value must be the true residual sum: otherwise the soundness argument of Proposition 1 supplies a continuation of universal challenges defeating the strategy. If q_i differs from the displayed polynomial, a challenge r_i at which they differ produces a false residual claim, which again has a defeating continuation. Thus they are identical. Every universal prefix is reachable, since the strategy supplies an existential response to every preceding prefix.

### Proposition 4: a true zero sum with a hard message family

Let n be at least 1, let A consist of n^2 variables, and put

```math
K_A(b)=
\left(\prod_{j=1}^n(2b_j-1)\right)
\left(\prod_{i=1}^n\sum_{j=1}^n A_{ij}b_j\right),
\qquad
f_n(t,A,b)=t(t-1)K_A(b).
```

The polynomial f_n has an arithmetic circuit of size O(n^2), N=n^2+n+1 variables, and individual degree at most n+1. Its full Boolean sum equals zero, because t(t-1) is zero at both Boolean values of t. Consider the sum-check protocol for this true value, with variable order t, then all entries of A, then b_1,...,b_n.

Suppose the coefficients of the message for b_1 are produced by arithmetic circuits in the preceding challenges t,A, with total size S(n). By Lemma 3 this message q(u;t,A) satisfies

```math
q(0;t,A)+q(1;t,A)
=\sum_{b\in\{0,1\}^n}f_n(t,A,b)
=t(t-1)\mathop{\mathrm{per}}_n(A)
```

for every t,A in C. If q(u;t,A)=sum_{d=0}^{n+1}a_d(t,A)u^d, then

```math
\mathop{\mathrm{per}}_n(A)
=\frac12\left(2a_0(2,A)+\sum_{d=1}^{n+1}a_d(2,A)\right).
```

Consequently the permanent has an arithmetic circuit of size S(n)+O(n). The same conclusion holds if one circuit directly evaluates q(u;t,A), by evaluating it twice at u=0,1 and setting t=2. Arbitrary complex circuit constants are allowed throughout.

Under the imported superpolynomial permanent lower bound, S(n) cannot be polynomially bounded. In particular, it is false that every true Boolean-sum instance with a polynomial-size kernel has a winning sum-check strategy whose messages can all be committed by polynomial-size arithmetic circuits.

This is a limitation of the proposed representation of adaptive strategies. The language consisting of these particular zero-sum instances is itself trivial to decide; the proposition makes no decision lower-bound claim for that language. Nor does it rule out short commitments for a specially selected different verifier for the permanent graph.

## 8. Sound batching and its actual size cost

There is one valid quantifier compression for the ordinary sum-check formula. It does not reach a fixed level for the permanent kernel.

Partition the m Boolean variables into h consecutive blocks B_1,...,B_h, each of size at most k. Instead of committing one univariate polynomial per coordinate, commit one polynomial Q_j in the variables of block B_j, with individual degree at most D=m+1. Write its complete coefficient vector, of length at most (D+1)^k, in the existential block. The quantified formula is

```math
\exists Q_1\ \forall r_{B_1}\ \cdots\ \exists Q_h\ \forall r_{B_h}.
```

The initial check is that the Boolean sum of Q_1 equals y. Each intermediate check is

```math
\sum_{b\in\{0,1\}^{B_{j+1}}}Q_{j+1}(b)=Q_j(r_{B_j}),
```

and the final check is Q_h(r_(B_h))=F_X(r), where F_X is the Ryser kernel from Proposition 1. Previously chosen universal challenges are parameters of the later existential messages, just as in the sequential protocol.

Completeness uses the truthful residual polynomial obtained by summing the kernel over all later Boolean blocks. It has the stated individual degree. For soundness, a wrong current claim makes the committed block polynomial differ from the truthful residual. A nonzero polynomial over the infinite field C is nonzero at some complex challenge tuple, which supplies a false next residual claim. Induction ends at the direct kernel check. Thus the block formula is equivalent to the permanent graph for arbitrary complex matrices.

For a coefficient monomial with exponent tuple alpha, its Boolean sum is 2 to the number of zero entries of alpha. Therefore each Boolean block sum can be checked directly from the coefficients, without enumerating its Boolean points. The total witness length and predicate circuit size are bounded by

```math
O\bigl(hk(D+1)^k+m^2\bigr).
```

For every fixed k this is polynomial, but h is still the ceiling of m/k. Taking k of order m/log(log m) would make h of order log(log m), while the coefficient count grows at least as (m+2) to a constant multiple of m/log(log m). That is superpolynomial. The block construction therefore does not yield the required short-alternation formula.

A future protocol with O(log(log m)) rounds could benefit from constant-factor batching only if it has an independently proved batching property of this kind. Arbitrary alternating formulas cannot be batched by committing small coefficient vectors: the required Skolem functions need not be polynomials of the asserted degree or small coefficient volume. If such a protocol admits grouping every fixed k consecutive rounds at polynomial total cost, the coefficient of its log(log m) round bound becomes tunable. That would address the hypothetical decider-exponent issue in the quantitative collapse calculation, but the O(log(log m)) starting protocol and the required batching property are both unproved here.
