# Normalized spectral extension and its quantifiers

**Status.** These are deductions from Proposition A.7 of the pinned Anthropic paper, not a proof that the matrix multiplication exponent is two. They repair the normalization issue in applying that proposition to Strassen's spectrum. No claim of independent novelty is made.

The imported result is Proposition A.7, “extension,” in Appendix A.6 of *VP ≠ VNP over every field*, at commit [`11b6c7e3c927df2658f513b6b68ea7f8929c62c5`](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp). The source calls a function satisfying the cover axioms below a spectral point. This class is broader than Strassen's normalized, additive spectrum. We use different names to keep the two classes separate.

## Definitions

Fix a field, a finite party set $I$ with at least two elements, and finite-dimensional tensors over that field. We identify tensors that restrict to one another. A restriction applies a linear map separately at each party. Products are tensor products regrouped by party. Write $1$ for the nonzero scalar tensor, $0$ for the zero tensor, and $U_I(r)$ for the full diagonal tensor of size $r$.

A tensor $S$ is covered by $T_1,\ldots,T_s$ if $S=S_1+\cdots+S_s$ and each $S_j$ is a restriction of $T_j$. A **cover functional** is a function $F$ with values in the nonnegative reals such that

```math
F(1)=1,\qquad F(ST)=F(S)F(T),\qquad
F(S)\le\sum_{j=1}^s F(T_j)
```

for every such cover, including the empty cover of zero. It follows that $F(0)=0$, that $F$ is restriction-monotone, and that

```math
1\le F(T)\le R(T)\qquad(T\ne0),
```

where $R(T)$ is tensor rank. Indeed, every nonzero tensor restricts to $1$, and a rank decomposition is a cover by copies of $1$.

A **normalized spectral point** is a cover functional satisfying $F(U_I(r))=r$ for every positive integer $r$. The first lemma proves that it is then additive under direct sum, so this definition agrees with the usual Strassen definition. Conversely, an additive, multiplicative, restriction-monotone function normalized on diagonal tensors satisfies the cover inequality: a cover of $S$ by $T_1,\ldots,T_s$ gives a restriction from their direct sum to $S$ by adding the local block maps.

For a map of party sets $\pi:I'\to I$, write $`\pi_*T`$ for regrouping a tensor according to $\pi$. For an inclusion $\iota:I\hookrightarrow I'$, write $`\iota_*T`$ for padding $T$ with one-dimensional factors at the new parties. Regrouping preserves products, restrictions, and covers. Padding is not assumed to preserve direct sums.

## Lemma 1: full normalization implies additivity

Let $F$ be a cover functional with $F(U_I(r))=r$ for every positive integer $r$. Then

```math
F(S\oplus T)=F(S)+F(T)
```

for all tensors $S,T$ on $I$.

**Proof.** The two summands cover $S\oplus T$, so the left side is at most the right side. Write $a=F(S)$, $b=F(T)$, and $c=F(S\oplus T)$.

For every positive integer $n$, distributivity decomposes $(S\oplus T)^{\otimes n}$ into direct-sum blocks indexed by binary words of length $n$. Retain the blocks with exactly $k$ copies of $S$. Every retained block is isomorphic to $S^{\otimes k}\otimes T^{\otimes(n-k)}$. For each word, use the same permutation of its factors at every party; the permutations for different words form a block-diagonal local map. Thus the original tensor restricts to

```math
U_I\!\left({n\choose k}\right)
\otimes S^{\otimes k}\otimes T^{\otimes(n-k)}.
```

Monotonicity, multiplicativity, and normalization give

```math
c^n\ge {n\choose k}a^k b^{n-k}
\qquad(0\le k\le n).
```

At least one of these $n+1$ nonnegative binomial terms is at least their mean. Therefore

```math
c^n\ge \frac{(a+b)^n}{n+1}.
```

Taking $`n`$th roots and letting $n$ tend to infinity proves $c\ge a+b$. This also handles zero summands. Together with the cover upper bound, it proves equality. $\square$

For later use, normalization at size two suffices. For a cover functional, the sequence $u(r)=F(U_I(r))$ is multiplicative and nondecreasing. If $u(2)=2$, let $m=\lfloor n\log_2 r\rfloor$. Then $2^m\le r^n<2^{m+1}$, so

```math
2^m\le u(r)^n\le2^{m+1}.
```

Taking $`n`$th roots and passing to the limit gives $u(r)=r$ for every positive integer $r$.

## Lemma 1a: classification of cover functionals by normalization

Every cover functional $G$ on a fixed finite party set $I$ with at least two parties has one of the following forms:

- $G(T)=1$ for every nonzero tensor $T$, and $G(0)=0$; or
- $G=F^h$ for a normalized spectral point $F$ and a real number $0\lt h\le1$.

In the second case, $h=\log_2G(U_I(2))$ and $F=G^{1/h}$ are uniquely determined. This is a consequence of the cover axioms, not a claim that the normalized spectrum has been classified.

**Proof.** The same power-sandwich argument gives

```math
G(U_I(r))=r^h,\qquad h=\log_2G(U_I(2)).
```

The restrictions $1\le U_I(2)$ and its cover by two copies of $1$ imply $0\le h\le1$. If $h=0$, a nonzero tensor $T$ lies between $1$ and $U_I(R(T))$ under restriction. Both bounding tensors have value one, so $G(T)=1$.

Suppose $h>0$ and set $F=G^{1/h}$. Multiplicativity and full-unit normalization hold immediately. The remaining point is the cover inequality; raising a single cover inequality to the power $1/h$ would not prove it.

Let $S$ be covered by $T_1,\ldots,T_r$, and write $a_i=G(T_i)$. Zero covering tensors may be removed. Expand $S^{\otimes n}$ using the cover, and group the resulting words by their type $k=(k_1,\ldots,k_r)$, where the $k_i$ are nonnegative integers with sum $n$. There are

```math
N_k={n!\over k_1!\cdots k_r!}
```

words of this type. Every corresponding summand is a restriction of the product $\prod_i T_i^{\otimes k_i}$ after reordering factors. The sum of these $N_k$ restricted tensors is a restriction of

```math
U_I(N_k)\otimes\prod_i T_i^{\otimes k_i}.
```

To see the last statement, use the diagonal tensor's label to select the word-specific local maps, then add their block maps at each party. Thus the tensors displayed above, one for each type, cover $S^{\otimes n}$. Applying $G$ gives

```math
\begin{aligned}
G(S)^n
&\le\sum_k N_k^h\prod_i a_i^{k_i}
\\ &=\sum_k\left(N_k\prod_i a_i^{k_i/h}\right)^h
\\ &\le(n+1)^r\left(\sum_{i=1}^r a_i^{1/h}\right)^{hn}.
\end{aligned}
```

For the last inequality, each parenthesized term is at most the sum of all such terms, which is $(\sum_i a_i^{1/h})^n$ by the multinomial formula, and there are at most $(n+1)^r$ types. Taking $`n`$th roots and letting $n$ tend to infinity proves

```math
F(S)\le\sum_iF(T_i).
```

Consequently $F$ is a normalized cover functional. Lemma 1 makes it additive, so it is a normalized spectral point. $\square$

Conversely, if $F$ is a normalized spectral point and $0\lt h\le1$, then $F^h$ is a cover functional. Its product law is immediate. For a cover of $S$ by $T_1,\ldots,T_r$, the cover inequality for $F$ and the scalar inequality $(\sum_i a_i)^h\le\sum_i a_i^h$ give the required inequality for $F^h$. Thus the classification describes exactly the cover functionals, including the separately stated zero-exponent case.

This lemma also explains the scale issue for prices. Taking logarithmic wire values multiplies every distance of $F$ by $h$ under the operation $F\mapsto F^h$. Taking arbitrary additional nonnegative multiples and pointwise limits of those distances retains geometry but does not retain the full-unit normalization.

## Theorem 2: extension preserving all old tensor values

Let $F$ be a normalized spectral point on $I$. Let $\iota:I\hookrightarrow I'$ be an inclusion into a finite party set. Fix finitely many retractions $\pi_j:I'\to I$ satisfying $\pi_j\iota=\mathop{\mathrm{id}}_I$, and nonnegative weights $\theta_j$ with sum one. Terms with zero weight may be omitted.

There exists a normalized spectral point $F'$ on $I'$ such that both of the following hold:

```math
F'(\iota_*T)=F(T)
\quad\text{for every tensor }T\text{ on }I,
```

and

```math
F'(S)\le\prod_j F((\pi_j)_*S)^{\theta_j}
\quad\text{for every tensor }S\text{ on }I'.
```

The retractions and their joint probability law are fixed before $F'$ is chosen.

**Proof.** First require preservation of only a finite list of nonzero old tensors $T_1,\ldots,T_m$. Apply the source's Proposition A.7 to the cover functional $F$ and to

```math
C=U_I(2)\otimes T_1\otimes\cdots\otimes T_m.
```

It gives a cover functional $G$ on $I'$ with

```math
G(S)\le\prod_jF((\pi_j)_*S)^{\theta_j}
\quad\text{for every }S,
\qquad G(\iota_*C)=F(C).
```

For each old tensor $T$, the displayed upper bound gives $`G(\iota_*T)\le F(T)`$, because every retraction returns $T$. All values of nonzero tensors are positive. Multiplicativity and equality on $C$ therefore force equality on each of its factors. In particular,

```math
G(\iota_*U_I(2))=2,
\qquad G(\iota_*T_j)=F(T_j)\quad(1\le j\le m).
```

Contracting the extra parties shows that $U_{I'}(2)$ restricts to $`\iota_*U_I(2)`$. Every regrouping $`(\pi_j)_*U_{I'}(2)`$ is equivalent to $U_I(2)$: at each old party the vectors with all grouped indices equal form a two-element independent family. Consequently,

```math
2\le G(U_{I'}(2))
\le\prod_jF(U_I(2))^{\theta_j}=2.
```

The size-two observation following Lemma 1 gives $G(U_{I'}(r))=r$ for every $r$. Lemma 1 then makes $G$ additive. This proves normalized extension with any prescribed finite list of old values.

To preserve all old values at once, use compactness. Choose one representative of each tensor equivalence class on $I'$. Place the coordinate of every nonzero tensor $S$ in the compact interval $[1,R(S)]$, and fix the zero coordinate to zero. This is a set-indexed product of compact spaces. The cover-functional axioms, normalization, the asserted upper bound for each $S$, and each desired equality $`G(\iota_*T)=F(T)`$ are closed conditions: each is an equality or inequality in finitely many coordinates using continuous operations.

The finite-preservation construction proves the finite-intersection property for this family of closed conditions. Compactness supplies one function satisfying all of them. It is the required $F'$. $\square$

## Corollary 3: normalized midpoint extensions

Add one party $D$ and choose the random retraction that sends $D$ to $A$ or $B$, each with probability one half, while fixing every old party. Define wire distances by

```math
d_{UV}=\log_2 F'(W_{UV}(2)).
```

Theorem 2 gives a normalized extension preserving all old tensor values and satisfying

```math
d_{AD}\le\tfrac12d_{AB},\qquad
d_{BD}\le\tfrac12d_{AB},\qquad
d_{CD}\le\tfrac12(d_{CA}+d_{CB})
```

for every old party $C$. Wire distances obey the triangle inequality, so the first two inequalities are equalities. This construction retains $`F'(U_{I'}(r))=F'(\iota_*U_I(r))=r`$.

The result repairs normalization; it does not give a perimeter bound of two. The Euclidean scalar model in the companion note already admits ordinary midpoints while retaining full-unit charge one.

## Quantifiers: one joint law, one extension

Theorem 2 has the form

```math
\forall\text{ finite retraction laws }\mathcal L,
\quad\exists F'_{\mathcal L}
\quad\forall S:
\ F'_{\mathcal L}(S)
\le\prod_jF((\pi_j)_*S)^{\theta_j}.
```

It does not give one extension satisfying the bounds for every law. This stronger statement is false, even for a flattening point.

Take three old parties $A,B,C$ and the normalized point given by matrix rank across the cut $A\mid BC$. Its wire distance has $d_{AB}=1$. Add $D$. The deterministic retraction sending $D$ to $A$ would force $d_{DA}=0$, because the wire $W_{DA}(2)$ becomes a tensor at only one old party, hence has value one. The deterministic retraction sending $D$ to $B$ would similarly force $d_{DB}=0$. If the same extension satisfied both requirements while preserving the old wire, the triangle inequality would give

```math
1=d_{AB}\le d_{AD}+d_{DB}=0,
```

a contradiction.

For overlapping auxiliary configurations, one may specify a single joint random map of all the new parties and apply Theorem 2 once. Every tensor inequality obtained from that one extension is then simultaneous. Alternatively, one may extend in stages while preserving all previously chosen tensor values. In either case, changing the placement law can change the extension. Optimizing different configurations independently and then treating their optimized values as values of one spectral point requires a separate compatibility proof.

## What this establishes and what remains missing

The source's generalized cover-functional extension can be upgraded to a fully normalized, additive extension preserving every old tensor value. This conclusion uses the full diagonal tensor, the binomial direct-sum argument, and compactness; the wire metric alone does not imply it.

To obtain $\omega_{\mathbb C}=2$ from this result, one still needs a valid inequality on full tensors, evaluated in one compatible extension, that forces $d_{AB}+d_{BC}+d_{CA}\le2$ for every initial normalized point. The theorem does not establish that inequality, and a model satisfying only unit and wire constraints does not automatically extend to a point on all tensors.
