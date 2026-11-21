# Lieb’s permanental dominance conjecture

For all sufficiently large degrees $n$, every primitive permutation
group $H\le S_n$ other than $A_n,S_n$ satisfies Lieb's inequality for
**every character and every complex positive semidefinite matrix**.
For degree-one characters, the assertion includes $A_n$ and $S_n$.
Here primitivity means that the action is transitive with no nontrivial
system of blocks. Both the matrix rank and the character degree are
unrestricted in the first assertion. The proof yields the following
finite sufficient condition for any permutation group, primitive or not.

For $g\in S_n$ let $L(g)$ be the sum of $\lfloor j/2\rfloor$ over its
cycles of length $j$. If $\chi$ is a nonzero character of $H$ such that

```math
\sum_{g\in H\setminus\{e\}}
\frac{|\chi(g)|}{\chi(e)(2^{L(g)}-1)}\le1,                    \tag{1}
```

then $d_\chi^H(A)\le\chi(e)\operatorname{per}A$ for every complex PSD
Hermitian $A$. Replacing $|\chi(g)|/\chi(e)$ by one is sufficient for
all characters simultaneously. The [full conjecture](https://yair-lavi.com/mincs-list/conjecture-42/)
also includes all imprimitive groups and the ordinary immanants of $S_n$.
Its [degree-one case](https://yair-lavi.com/mincs-list/problem-2/)
includes all imprimitive wreath products with the trivial character.

## Charging a diagonal product to the permanent

A zero diagonal entry gives a zero row and both sides vanish. Otherwise
scale to a correlation matrix $C$; both sides scale by the same positive
constant. Put $w_g=\prod_i c_{i,g(i)}$ and $P=\operatorname{per} C$.
For every $g\ne e$,

```math
P-1\ge (2^{L(g)}-1)|w_g| .                                    \tag{2}
```

To prove this, rotate a fixed maximum matching uniformly around each
nontrivial directed cycle of $g$, independently from cycle to cycle.
A cycle of length two contributes one undirected edge; one may orient
it by choosing either arc uniformly. The resulting matching $M$ has
exactly $L(g)$ edges. Each directed arc of a cycle of length $j$ is
selected with probability $\lfloor j/2\rfloor/j\le1/2$. Since
$|c_{ij}|\le1$, when $w_g\ne0$ the expected logarithm of the product
of $|c_{ij}|^2$ on $M$ is at least $\log|w_g|$. In particular one
matching has product at least $|w_g|$. Fixed points have diagonal entry
one. [Lieb's permanental Fischer inequality](https://arxiv.org/abs/2202.01867)
on these pairs and the remaining singleton blocks now gives

```math
P\ge\prod_{ij\in M}(1+|c_{ij}|^2)
\ge1+(2^{L(g)}-1)\prod_{ij\in M}|c_{ij}|^2 .
```

Each nonconstant term in the expansion dominates the full product of the
numbers in $[0,1]$. The zero-product case follows from $P\ge1$.
For a permutation made of disjoint transpositions the constant in (2)
is sharp: take an all-ones block of size two on each transposition and
an identity matrix elsewhere. By the character bound, the triangle
inequality, and (2), the nonidentity contribution to the normalized
generalized matrix function is at most $P-1$ under (1). The identity
contributes one. This proves the criterion.

## Uniform large-degree deduction

Write $s(g)$ for the number of moved points. We have $L(g)\ge s(g)/3$
and, since $L(g)\ge1$ for $g\ne e$,
$(2^{L(g)}-1)^{-1}\le2\cdot 2^{-s(g)/3}$.
We prove that $\sum_{g\ne e}2^{-s(g)/3}=o(1)$ uniformly over primitive
groups $H\ne A_n,S_n$ as $n\to\infty$.

We use the trichotomy in the proof of Lemma 7 of [Kempe, Pyber and
Shalev, *Permutation groups, minimal degrees and quantum computing*,
p. 566](https://ems.press/content/serial-article-files/29484?nt=1).
It follows there from Cameron's classification. For a fixed absolute
$c$ and all sufficiently large $n$, either $|H|\le n^{c n^{1/3}}$,
or $H$ embeds in the action of $S_l$ on unordered pairs of $l$ letters,
or in the product action of $S_l\wr S_2$ on $[l]^2$.
The same source records Babai's minimum-degree bound
$s(g)\ge(\sqrt n-1)/2$. In the small-order alternative the required
sum is at most $n^{c n^{1/3}}2^{-(\sqrt n-1)/6}=o(1)$.

For the pair action, an underlying permutation moving $t$ letters fixes
at most $\binom{l-t}{2}+t/2$ unordered pairs: a fixed pair is two
fixed letters or one transposition. Thus it moves at least
$t(2l-t-2)/2\ge t(l-2)/2$ pairs. There are at most $l^t$ underlying
permutations of support $t$. The sum for the whole ambient group is
bounded by $\sum_{t\ge2}(l2^{-(l-2)/6})^t=o(1)$.

For the square action, a base element $(u,v)$ moving $t_1,t_2$ letters
in the two coordinates moves $l(t_1+t_2)-t_1t_2\ge l(t_1+t_2)/2$
ordered pairs. There are at most $l^{t_1+t_2}$ elements with those
parameters. Putting $z=l2^{-l/6}$, their nonidentity contribution
is at most $(1-z)^{-2}-1=o(1)$ for large $l$. An element exchanging
the two coordinates fixes at most $l$ ordered pairs since the first
coordinate determines the second. All such elements together contribute
at most $(l!)^2 2^{-(l^2-l)/3}=o(1)$. These bounds also apply to
subgroups. This completes the uniform estimate and (1) applies.

Finally, for $n\ge5$, $A_n$ is perfect and has only its trivial linear
character. The sum over its even permutations equals
$(\operatorname{per}A+\det A)/2\le\operatorname{per}A$ by Schur's
inequality. The two linear characters of $S_n$ give the permanent and
determinant. Thus every sufficiently large primitive action satisfies
Minc's degree-one inequality.

## Scope and prior work

The counting trichotomy, minimum-degree bound, permanental Fischer
inequality, and permanent-determinant inequality are all prior work.
The support-count exponent in Kempe–Pyber–Shalev's Lemma 7 alone does
not imply the weighted sum used above; the proof uses the two explicit
exceptional actions. Related permanental criteria include
[Rodtes's nonnegative-diagonal-products theorem](https://doi.org/10.1016/j.aam.2024.102758)
and the [earlier semiregular and abelian argument](../abelian-dominance.md).
Searches using primitive permutation groups, Frobenius groups, support
size, diagonal products, minimal degree, and subgroup permanental
dominance found these sources and the [Cheon–Wanless survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf).
Priority of this combination is unverified. Small primitive groups can
fail (1), and an imprimitive group with many small-support elements
can fail it in arbitrarily large degrees. Neither numbered problem is
fully resolved here.
