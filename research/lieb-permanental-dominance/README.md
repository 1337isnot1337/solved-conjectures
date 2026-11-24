# Lieb's permanental dominance conjecture

**Partial research.** The conjectured inequality holds for all permutation subgroups whose induced actions on their orbits are regular, including all abelian permutation subgroups. It also holds for transitive actions of sufficiently large degree in terms of the point-stabilizer order, with an explicit sufficient threshold. Both statements follow from a stronger absolute-product bound. The full conjecture remains open. [Issue #351](https://github.com/1337isnot1337/solved-conjectures/issues/351)

## Original statement and literature

For a Hermitian positive-semidefinite matrix $A=(a_{ij})$ of order $n$, write $w_A(g)=\prod_i a_{i,g(i)}$. Lieb's Conjecture $\alpha$ asks whether for every subgroup $G\le S_n$ and nonzero complex character $\chi$ of $G$,

```math
\frac{1}{\chi(1)}\sum_{g\in G}\chi(g)w_A(g)
 \ \le\ \operatorname{per}(A).
```

The sum is real because inversion conjugates both factors. This is the upper counterpart of Schur's determinant inequality. Since every representation of a finite group can be made unitary, $|\chi(g)|\le\chi(1)$. Thus a sufficient condition is $\sum_{g\in G}|w_A(g)|\le\operatorname{per}(A)$. The stronger sufficient condition is the one proved here for the stated group classes. [Lieb, 1966, Conjecture $\alpha$](https://iumj.s3-us-west-2.amazonaws.com/abstracts/16008_abs.pdf)

The November 24, 2026 source check included Wanless's distinction between Lieb's conjecture and the false permanent-on-top assertion, Zeng's order-four full-subgroup theorem, and Li's result on ordinary immanants through order fifteen. The latter concerns the full symmetric group as the character domain. A current degree-one project lists the cyclic order-five entries among its remaining cases, which are included in the general regular-orbit proof below. No prior proof of the exact group classes here or unrestricted resolution was located in the bounded search. Priority is provisional. [Wanless](https://arxiv.org/abs/2202.01867) · [Zeng](https://arxiv.org/abs/2608.21749) · [Li](https://arxiv.org/abs/2609.13412) · [Lavi's degree-one project](https://yair-lavi.com/mincs-list/problem-2/index.html)

We use the permanental Fischer inequality proved by Lieb. For any partition of the indices into blocks $B_j$, the permanent is at least $\prod_j\operatorname{per}(A[B_j])$. A zero diagonal entry forces a zero row and both sides of the desired absolute-product inequality vanish. Otherwise simultaneous diagonal scaling makes the diagonal all ones, multiplying each permutation product and the permanent by the same positive factor. Work in this normalization, so $r_{ij}=|a_{ij}|\le1$. [Lieb's theorem, discussed in Wanless, Corollary 1](https://arxiv.org/abs/2202.01867)

## 1. Regular actions and arbitrary products of their orbits

A regular action is transitive with trivial point stabilizers. More generally, an action is semiregular if no nonidentity element fixes any point.

First consider a $3\times3$ correlation matrix. Let $x=r_{12}^2$, $y=r_{23}^2$, $z=r_{13}^2$, and $R=\Re(a_{12}a_{23}a_{31})$. Its permanent is $1+x+y+z+2R$. If $R\ge0$, it is at least $1+x^2+y^2+z^2$. If $R\lt0$, the nonnegative determinant gives $x+y+z\le1$, and

```math
x(1-x)+y(1-y)
 \ ge\ 2\sqrt{xy(1-x)(1-y)}
 \ ge\ 2\sqrt{xyz}
 \ ge\ -2R.
```

Adding $z(1-z)\ge0$ gives the same bound on the permanent. Thus on a triple the permanent is at least $1+\sum r_{ij}^4$. The same bound holds for blocks of size one or two, since the permanent of a pair is $1+r_{ij}^2$.

For $n\ge4$, partition the indices uniformly into triples, with a final block of size one or two if necessary. By Fischer and nonnegativity of the cross products, the permanent is at least $1+\sum r_{ij}^n$ over pairs sharing a block. The total number of such pairs in each partition is $n$ when $3$ divides $n$, and $n-1$ otherwise. Averaging gives

```math
\operatorname{per}(A)\ \ge\ 1+\frac2n\sum_{i\lt j}r_{ij}^n.
```

For each nonidentity element of a semiregular $G$, all $n$ indices are moved. AM–GM bounds $|w_A(g)|$ by $n^{-1}\sum_i r_{i,g(i)}^n$. For each ordered pair $i\ne j$ there is at most one $g$ with $g(i)=j$, because any two differ by an element fixing $i$. Summing and including the identity gives the asserted absolute-product bound.

For $n=1,2$ the assertion follows directly. For the nontrivial semiregular action on three points, the two nonidentity elements are 3-cycles. Put $p=\sqrt{xyz}$. If $R\ge0$, AM–GM gives $x+y+z\ge3p^{2/3}\ge2p$. If $R\lt0$, we also have $p^{1/3}\le1/\sqrt3\le3/4$ from $x+y+z\le1$, so $x+y+z\ge4p$. In both cases the permanent is at least $1+2p$, the sum of the three magnitudes.

Now suppose the induced group $G_j$ on each orbit $B_j$ of $G$ acts regularly. The restriction map embeds $G$ in $\prod_j G_j$. Its absolute-permutation-product sum is at most the sum over the full direct product, namely

```math
\prod_j \left(\sum_{g_j\in G_j}|w_{A[B_j]}(g_j)|\right)
 \ \le\ \prod_j\operatorname{per}(A[B_j])
 \ \le\ \operatorname{per}(A).
```

An abelian group acts regularly on every orbit after passing to the induced permutation group. If an element fixes one point, commutation with the transitive action makes it fix every point there, so it is the identity of the induced group. This proves the all-abelian assertion and also treats nonabelian groups with regular orbit actions.

## 2. A block bound for large powers

For an integer $s\ge2$, set $C=\binom{s}{2}$, $\epsilon=1/(20000s^4)$ and

```math
M(s)=4+\left\lceil\epsilon^{-1}\log(4C)\right\rceil.
```

For any correlation matrix of order $d\le s$ and any integer $m\ge M(s)$, we claim

```math
\operatorname{per}(A)\ \ge\ 1+\sum_{i\lt j}r_{ij}^m.
```

Call a pair strong if $r_{ij}\ge1-\epsilon$. The choice of $m$ ensures $C(1-\epsilon)^{m-2}\le1/4$. If there are no strong pairs, let $w$ be the largest off-diagonal magnitude, taking $w=0$ if there is no pair. The sum of powers is at most $w^2/4$, while Fischer on a maximizing pair gives $\operatorname{per}(A)\ge1+w^2$.

If exactly one pair is strong, put $x=r_{12}\ge1-\epsilon$ and let $w$ maximize the remaining magnitudes, again allowing $w=0$. We show $\operatorname{per}(A)\ge1+x^m+w^2/4$. If a pair of magnitude $w$ is disjoint from the strong one, Fischer gives the stronger bound $(1+x^2)(1+w^2)$. If it shares an endpoint, use the triple on these vertices, and adjust phases to make $a_{12}=x$. For unit Gram vectors, Cauchy–Schwarz gives $|a_{13}-a_{23}|^2\le2(1-x)$. The triple permanent is

```math
1+x^2+(1+x)(|a_{13}|^2+|a_{23}|^2)-x|a_{13}-a_{23}|^2.
```

When $w^2\ge4(1-x)$ this is at least $1+x^2+w^2/2$. Otherwise use the pair bound and $x^2-x^m\ge x^2(1-x^2)\ge1-x\gt w^2/4$, since $m\ge4$ and $x\ge9/10$. The weak-pair powers sum to at most $w^2/4$. This proves the claim in the one-pair case, including $w=0$.

If there are at least two strong pairs, partition the Gram vectors by the connected components of the strong-pair graph. Use a spanning tree within each component to adjust phases so that adjacent Gram vectors on the tree have real nonnegative inner product. Each tree step has Euclidean length at most $\sqrt{2\epsilon}$. Any Gram entry within a component therefore differs from $1$ by at most $2s\sqrt{2\epsilon}=1/(50s)$ after the phase changes. The block-diagonal product of permanents for the components is a sum over the permutations within all components. Each summand has real part at least $49/50$ by telescoping its $d\le s$ factors of modulus at most one. Thus Fischer gives

```math
\operatorname{per}(A)\ \ge\ \frac{49}{50}\prod_j d_j!,
```

where $d_j$ are the component sizes. Put $q=\sum_j\binom{d_j}{2}$. For $q\ge2$, $\prod_j d_j!\ge(4/3)(1+q)$. A component of size at least three gives the factor $4/3$ on its own, and otherwise two size-two components give it together. Adding other components preserves the bound using $d!\ge1+\binom d2$. It follows that the permanent is greater than $1+q+1/4$. Within-component powers sum to at most $q$. Across components, all magnitudes are at most $1-\epsilon$, so their powers sum to at most $1/4$. This completes the block proof.

## 3. Transitive actions with controlled point stabilizers

Let $G$ act transitively on $n$ points and let the point-stabilizer order be $b$. For an element $g\ne1$, let $m(g)$ be its number of moved points. For a fixed stabilizer $K$, the fixed-point proportion of $g$ is $|g^G\cap K|/|g^G|$, by the coset model of the action and uniform conjugation. The conjugacy class cannot be contained in $K$, since the intersection of all point stabilizers is trivial. Its intersection contains at most $b-1$ elements, so $m(g)\ge n/b$.

Take $s=2b^2+2$ and suppose

```math
n\ge\max\{s^2,b\,M(s)\}.
```

Set $m=\lfloor n/b\rfloor$. Applying AM–GM to the moved points and using $m(g)\ge m$ gives

```math
|w_A(g)|\ \le\ \frac1{m(g)}\sum_{i:g(i)\ne i}r_{i,g(i)}^m .
```

There are exactly $b$ elements mapping any $i$ to any $j$ by transitivity. Since $1/m(g)\le b/n$, summing gives $\sum_g|w_A(g)|\le1+(2b^2/n)\sum_{i\lt j}r_{ij}^m$.

On the other hand, take a uniformly relabeled partition into blocks of size $s$ and possibly one remainder of size $r\lt s$. The probability that a fixed pair shares a block is

```math
\frac{(s-1)n-r(s-r)}{n(n-1)}
 \ \ge\ \frac{2b^2}{n},
```

using $r(s-r)\le s^2/4\le n$ and $s-1=2b^2+1$. By the block inequality, applicable since $m\ge M(s)$, and Fischer, averaging gives $\operatorname{per}(A)\ge1+(2b^2/n)\sum_{i\lt j}r_{ij}^m$. This proves the absolute-product inequality under the explicit threshold. The threshold is $O(b^9\log(b+1))$. The orbit product argument in §1 also allows any mixture of regular orbits and orbits satisfying this threshold for their induced actions.

For arbitrary groups the absolute-product bound is too strong. For example, take a correlation matrix of order three with $(a_{12},a_{23},a_{13})=(1/2,1/2,-1/2)$ and $G=S_3$. It is positive semidefinite, its permanent is $3/2$, and the sum of magnitudes of the six permutation products is $2$. A route to the unrestricted conjecture needs to retain cancellation or otherwise use character information.

The local exact cross-check used 129 Gaussian-integer Gram matrices with regular cyclic and dihedral actions. It summed the full permanent in Gaussian integers and bounded each absolute product from above by an integer square-root enclosure. A separate exact check tested the triple fourth-power inequality on sampled rank-two Gaussian Gram matrices and reproduced the displayed $S_3$ obstruction. The proof of the general restricted results is independent of these finite checks.
