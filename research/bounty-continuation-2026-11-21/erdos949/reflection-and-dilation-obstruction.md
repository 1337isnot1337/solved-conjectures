# Erdős 949: reflection criteria and a fixed-basis obstruction

Date: 21 November 2026. Scope: exact symbolic lemmas and a failed proof route. **This does not solve or refute Erdős 949.** See the [target and prior-work audit](target-and-prior-audit.md).

Write $`\mathfrak c=|\mathbb R|`$. A set $`S\subseteq\mathbb R`$ is sum-free if $`(S+S)\cap S=\varnothing`$. All sumsets below include repeated summands. We work in ZFC and do not assume that $`\mathfrak c`$ is regular.

## 1. Two sufficient conditions

The parent worker supplied these two observations; both have been checked directly. They are recorded as elementary deductions, with no novelty claim.

For a sum-free set,


```math
(S+S)\cap S=\varnothing,
\qquad
(S-S)\cap S=\varnothing.
```


The second statement follows because $`x-y=z`$ with $`x,y,z\in S`$ would give $`y+z=x`$.

### Reflection about an element of S

Suppose $`s\in S`$ and


```math
T=S\cap(2s-S),\qquad |T|=\mathfrak c.
```


Then $`2s-T=T`$. Set $`A=T-s`$. Its cardinality is $`\mathfrak c`$, and $`A\subseteq S-S\subseteq S^c`$. Also


```math
A+A=T+T-2s=T-T\subseteq S-S\subseteq S^c.
```


Thus this condition proves the full conclusion for that $`S`$.

### Translation by twice an element of S

Suppose $`s\in S`$ and


```math
T=S\cap(S+2s),\qquad |T|=\mathfrak c.
```


Again set $`A=T-s`$. It has the right size and lies in $`S-S`$. For $`x,y\in T`$, both $`x`$ and $`y-2s`$ belong to $`S`$, so


```math
(x-s)+(y-s)=x+(y-2s)\in S+S\subseteq S^c.
```


Consequently, a counterexample to Erdős 949 would have to satisfy


```math
|S\cap(2s-S)|<\mathfrak c,
\qquad
|S\cap(S+2s)|<\mathfrak c
\quad\text{for every }s\in S.
```


These are necessary restrictions on a hypothetical counterexample, not a complete dichotomy.

## 2. Unary and diagonal avoidance is easier than pairwise avoidance

For every $`s\in S`$, some $`k\in\{2,3,5\}`$ satisfies


```math
ks\notin S,\qquad 2ks\notin S.
```


Proof: $`2s\notin S`$. If $`4s\notin S`$, take $`k=2`$. Otherwise $`4s\in S`$, which forces $`3s,5s\notin S`$ using $`s+3s=4s`$ and $`s+4s=5s`$. If $`6s\notin S`$, take $`k=3`$. If $`6s\in S`$, then $`10s\notin S`$ because $`4s+6s=10s`$, and $`k=5`$ works.

When $`|S|=\mathfrak c`$, a finite partition therefore supplies a fixed $`k`$ and a subset $`T\subseteq S`$ of size $`\mathfrak c`$ such that $`kT`$ and $`2kT`$ both avoid $`S`$. This does **not** establish that $`kT+kT`$ avoids $`S`$. The construction below exhibits that precise gap, even on a prescribed basis already contained in $`S`$.

## 3. The established partition theorem used

Galvin and Shelah, *Some Counterexamples in the Partition Calculus*, Journal of Combinatorial Theory A **15** (1973), 167–174, [Theorem 1, printed p. 170](https://shelah.logic.at/files/95020/23.pdf), prove


```math
\mathfrak c\not\longrightarrow[\mathfrak c]^2_{\aleph_0}.
```


In the form needed here: for every set $`B`$ of size $`\mathfrak c`$ and every countably infinite color set $`C`$, there is a coloring


```math
\chi:[B]^2\longrightarrow C
```


such that every subset $`T\subseteq B`$ of size $`\mathfrak c`$ contains a pair of every color. The result holds in ZFC, including when the continuum is singular. The primary PDF's definition of the partition notation is on printed p. 168; Section 2 proves Theorem 1 through Lemmas 1–4. The proof is not re-proved or claimed here.

## 4. Construction

Choose a rational Hamel basis $`B\subseteq(1,2)`$ of $`\mathbb R`$. Such a basis exists because the rational span of $`(1,2)`$ is all of $`\mathbb R`$: for every positive $`x`$, choose rational $`r\in(x/2,x)`$, so $`x=r(x/r)`$ with $`x/r\in(1,2)`$; use negatives for negative $`x`$. A maximal independent subset of this spanning set is a basis. Its cardinality is $`\mathfrak c`$.

Use the Galvin–Shelah theorem with the countable color set


```math
C=\mathbb Q_{>0}\setminus\{1,\tfrac12\}.
```


For $`e=\{b,b'\}\in[B]^2`$, write $`q_e=\chi(e)`$. Define


```math
S=(B\cup(-B))\ \cup
\ \bigl\{\varepsilon q_{\{b,b'\}}(b+b'):
\{b,b'\}\in[B]^2,\ \varepsilon\in\{-1,1\}\bigr\}.
```


Every element of $`S`$ has one of two unique support forms in the basis $`B`$:

1. one basis coordinate, with coefficient $`1`$ or $`-1`$;
2. two distinct basis coordinates, with the same coefficient $`q_e`$ or $`-q_e`$ on both, where that unordered pair has only the one assigned positive magnitude $`q_e`$.

The following assertions hold.

### 4.1 S is sum-free

It is enough to compare supports and coefficients of $`x+y`$ for $`x,y\in S`$.

- **Two one-coordinate elements.** Equal supports give zero or coefficient $`\pm2`$, neither of which is a one-coordinate element of $`S`$. Distinct supports give coefficients $`\pm1`$: opposite signs are not allowed on a two-coordinate element of $`S`$, and equal signs have the excluded magnitude $`1`$.
- **One-coordinate plus two-coordinate.** Disjoint supports give three nonzero coordinates. If the one-coordinate support is inside the pair, the two coefficients become $`u\pm1`$ and $`u`$, where $`u=\pm q_e`$. They are unequal. Neither vanishes because $`q_e\ne1`$. Thus the sum has none of the allowed forms.
- **Two two-coordinate elements, equal supports.** The coefficients are $`\pm q_e`$ on both coordinates, so the sum is zero or has magnitude $`2q_e`$ on that same pair. That pair only carries magnitude $`q_e`$ in $`S`$.
- **Two two-coordinate elements, disjoint supports.** The sum has four nonzero coordinates.
- **Two two-coordinate elements, exactly one shared coordinate.** If the shared coefficient does not cancel, three nonzero coordinates remain. If it cancels, the two private coordinates have opposite nonzero coefficients. Neither outcome is an element of $`S`$.

These cases are exhaustive, so $`(S+S)\cap S=\varnothing`$.

### 4.2 Size, span, and unboundedness

The inclusion $`B\subseteq S`$ gives $`|S|=\mathfrak c`$ and $`\mathop{\mathrm{span}}_{\mathbb Q}S=\mathbb R`$.

Every positive integer $`n\ge2`$ occurs as a color on $`[B]^2`$. Its corresponding positive element $`n(b+b')`$ exceeds $`2n`$, since $`B\subseteq(1,2)`$. Thus $`S`$ is unbounded above; symmetry makes it unbounded below. This example is outside the previously established small-cardinality, boundedness, and proper-span cases.

No claim about its measurability or Baire property is needed or made.

### 4.3 Both own-center fibers are singletons

For every $`s\in S`$,


```math
S\cap(2s-S)=\{s\}.
```


To prove this, suppose $`x+y=2s`$ with $`x,y\in S`$.

If $`s`$ has one coordinate, then $`2s`$ has that coordinate with coefficient $`\pm2`$. The support cases above show that only two identical one-coordinate summands can produce it. Hence $`x=y=s`$.

If $`s`$ has two coordinates, then $`2s`$ has equal nonzero coefficients on that pair. Two one-coordinate summands could produce it only if $`q_e=1/2`$, which was excluded. A one-coordinate and a two-coordinate summand give unequal coefficients or three coordinates. Two summands on different pairs give four coordinates, three coordinates, or opposite coefficients on their private coordinates. Thus both summands must use the same pair as $`s`$. Its only allowed coefficients are $`\pm q_e`$, and their sum equals the coefficient of $`2s`$ only when both summands equal $`s`$.

Since $`S=-S`$, the equation $`x-y=2s`$ with $`x,y\in S`$ is equivalent to $`x+(-y)=2s`$. The preceding result gives $`x=s`$ and $`y=-s`$. Therefore also


```math
S\cap(S+2s)=\{s\}.
```


Thus neither sufficient condition in Section 1 is available for this example, even though the original conclusion holds, as shown below.

### 4.4 Every rational dilation of every large subset of this basis fails

For every nonzero rational $`r`$ and every $`T\subseteq B`$ with $`|T|=\mathfrak c`$, the set $`rT`$ fails at least one required condition for $`A`$.

- If $`|r|=1`$, then $`rT\subseteq S`$, so unary avoidance fails.
- If $`|r|=1/2`$, then $`2rT\subseteq S`$, so diagonal avoidance fails.
- Otherwise $`|r|\in C`$. By the color theorem, there are distinct $`b,b'\in T`$ with $`q_{\{b,b'\}}=|r|`$. Symmetry of $`S`$ gives


```math
rb+rb'=r(b+b')\in S.
```


For the third case, unary and diagonal avoidance nevertheless hold: the only one-coordinate elements of $`S`$ have coefficients $`\pm1`$, while $`r`$ and $`2r`$ are different from those coefficients. The failure is entirely in a sum of distinct elements.

In particular, every $`k\in\{2,3,5\}`$ gives unary and diagonal avoidance on $`B\subseteq S`$, but no continuum-sized subset of $`kB`$ has all pairwise sums outside $`S`$.

### 4.5 The full Erdős conclusion still holds for S

Fix $`b_0\in B`$ and put


```math
A=\{b-b_0:b\in B\setminus\{b_0\}\}.
```


This set has cardinality $`\mathfrak c`$. Every element has two coefficients $`1,-1`$, so it is outside $`S`$. A repeated sum has two coefficients $`2,-2`$, also outside $`S`$. A sum of distinct elements is


```math
(b-b_0)+(b'-b_0)=b+b'-2b_0,
```


which has three nonzero coordinates because $`b,b',b_0`$ are distinct. It too is outside $`S`$.

Therefore $`A\subseteq S^c`$ and $`A+A\subseteq S^c`$.

## 5. Exact scope and stopping point

This is an obstruction to rational dilations of subsets of a **prescribed** basis, even when that basis lies in $`S`$ and all relevant unary/diagonal tests pass. It is not an obstruction to choosing a different basis adapted to $`S`$, to affine translations, or to arbitrary continuum-sized sets. The explicit translated-basis solution makes that limitation concrete.

The construction also shows that the singleton own-center fiber conditions do not by themselves give a complete proof strategy. They do not imply the old small-cardinality, boundedness, or proper-span cases.

The remaining problem is still the full statement for an arbitrary sum-free $`S`$. The attempted passage from unary-safe rational dilations to continuum-sized pairwise avoidance is invalid. The Galvin–Shelah theorem is established prior work, and this application has no novelty claim. No award, full resolution, or numeric subcase completion follows.
