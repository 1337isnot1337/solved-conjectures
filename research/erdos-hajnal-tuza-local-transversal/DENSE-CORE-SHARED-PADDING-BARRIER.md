# A dense-core barrier for arbitrarily shared padding

Partial progress on [Erdős–Hajnal–Tuza's local transversal
problem](https://github.com/1337isnot1337/solved-conjectures/issues/1019).

**Theorem.** Let $`t\ge1`$, $`5t\lt r\le 5t+\lfloor t/8\rfloor`$,
and let $`\mathcal F`$ be an $`r`$-uniform family such that every
subfamily with union of size at most $`3r-3`$ has a common
vertex. If there is a set $`M`$ of size $`3t+1`$ such that
$`|E\cap M|\ge2t+1`$ for every $`E\in\mathcal F`$, then
$`\tau(\mathcal F)\le t`$.

The padding outside $`M`$ is arbitrary. In particular, the argument
is not restricted to private padding, bounded intersections of
padding, or the case where a minimum pair has disjoint padding.
It excludes a linear interval of uniformities close to $`5t`$.
The classical private-padding construction's threshold is
$`5t+1+\lfloor(t-1)/3\rfloor`$; the rest of the gap is open here,
as is the corresponding claim without the dense-core hypothesis.

## 1. Notation and minimum-pair witnesses

Suppose $`\tau(\mathcal F)>t`$, and put $`z=r-5t`$, so
$`1\le z\le t/8`$. Let $`A,B`$ achieve the minimum pairwise
intersection $`X=A\cap B`$. The argument in
[Near-threshold petals](../erdos-hajnal-tuza-local-transversals/NEAR-THRESHOLD-PETALS.md), §1, gives
```math
|X|=t+s,\qquad 1\le s\le\lfloor(z+2)/3\rfloor,\qquad
\delta=z-3s+2\ge0.
```
Let $`X_0=X\cap M`$, $`e=|X\setminus M|`$,
$`c=|M\setminus(A\cup B)|`$,
$`d_A=|A\cap M|-(2t+1)`$ and $`d_B=|B\cap M|-(2t+1)`$.
Double counting inside $`M`$ gives
```math
s=1+d_A+d_B+c+e.
```
In particular $`e+c\le s-1`$. Choose a $`z`$-set $`Z\subset X_0`$.
There is a $`t`$-set $`T\subset M`$ with $`T\cap X_0=Z`$: indeed
$`|M\setminus X_0|=2t+1-s+e\ge t-z`$. Let $`U`$ be an edge
avoiding $`T`$. It omits exactly $`T`$ in $`M`$, because every
edge omits at most $`t`$ points of $`M`$.

For every $`s`$-set $`S\subset X_0\setminus Z`$, choose an edge
$`E_S`$ avoiding $`X\setminus S`$. Let $`W_S=E_S\setminus(A\cup B)`$.
We have $`N=|X_0\setminus Z|\ge t+1-z>2s`$, since $`s\le z`$
and $`z\le t/8`$. Thus every $`S`$ admits a disjoint partner.
The petal inequalities (ibid., §2) give
```math
|W_S|\ge 3t+2s-2,\qquad |W_S\cap W_{S'}|\le\delta
\quad(S\cap S'=\emptyset).
```

## 2. Force large intersections with the same padding

Fix $`S`$. Write $`R=M\setminus E_S`$. It contains
$`X_0\setminus S`$, which has size $`t-e`$. Consequently
```math
t-e\le|R|\le t,\quad Z\subset R,\quad
z\le|R\cap T|\le z+e.
```
The last upper bound holds because $`T`$ meets $`X_0`$ only
in $`Z`$ and at most $`e`$ points of $`R`$ are outside $`X_0`$.

Choose a $`(t-z)`$-set $`P\subset M\setminus(T\cup R)`$.
The complement has at least $`t+1`$ points since
$`|T|,|R|\le t`$. Choose an edge $`F`$ omitting exactly $`Z\cup P`$
in $`M`$, using $`\tau>t`$. The three edges $`U,E_S,F`$
omit $`Z`$; their common set $`Q`$ inside $`M`$ satisfies
```math
|Q|=t-|R|+|R\cap T|+z+1\le 2z+2e+1.
```
They are distinct. Any point of $`X_0\setminus(Z\cup S)`$
lies in $`R`$ but not in $`T`$ or in $`Z\cup P`$, and this
set is nonempty since $`N>2s`$. Also $`P\cap T=\emptyset`$
and $`t>z`$, so the omissions $`T`$ and $`Z\cup P`$ differ.

Let $`C`$ be the common set of the three edges outside $`M`$,
and let $`j=|C|`$. If $`j\le t-2z-2e-1`$, choose a fourth
edge $`D`$ avoiding $`Q\cup C`$ and as many points of $`Z`$
as possible, with at most $`t`$ forbidden points. This is
possible by $`\tau>t`$. Since $`3z+2e+1\le t`$, one may
omit at least $`z-j`$ points of $`Z`$ (vacuous if $`j>z`$).
The four edges have no common point. The union in $`M`$
has size at most $`3t+1-z+j`$. Each outside part has size
at most $`r-2t-1`$, and the first three repeat each point of
$`C`$ three times. Thus the total union is at most
```math
3t+1-z+j+4(r-2t-1)-2j
=3r-3-j,
```
a contradiction. In particular $`|(U\cap E_S)\setminus M| \ge|C|\ge t-2z-2e`$.

Since $`|W_S|\ge3t+2s-2`$, at most $`2t+z-2s+2`$ points
of $`E_S`$ lie in $`A\cup B`$. At least $`2t+1-c`$
of those are in $`M`$. Subtracting the resulting bound
on exterior points in $`A\cup B`$ gives
```math
|W_S\cap(U\setminus M)|
\ge t-3z+2(s-e)-1-c\ge t-3z.
```
The last inequality follows from $`s=1+d_A+d_B+c+e`$.

## 3. Pack those intersections into one edge

Set $`L=|U\setminus M|=3t+z-1`$ and $`b=t-3z>0`$.
The $`s`$-subsets $`S`$ of the $`N`$-set $`X_0\setminus Z`$
now label subsets $`W_S\cap(U\setminus M)`$ of a single
$`L`$-set. Each has size at least $`b`$, and those at disjoint
labels overlap in at most $`\delta`$ points. The Kneser
spectral inequality from [Near-threshold petals](../erdos-hajnal-tuza-local-transversals/NEAR-THRESHOLD-PETALS.md),
§3, applied with $`m=N,p=b`$, gives
```math
L\ge \frac{b^2}{(1-s/N)\delta+(s/N)b}
\ge \frac{(t-3z)^2}{z}.
```
For the second inequality note $`b\le N`$ and
$`\delta+s=z-2s+2\le z`$.
Finally
```math
(t-3z)^2-z(3t+z)=(t-z)(t-8z)\ge0.
```
It follows that $`L\ge3t+z`$, contradicting $`L=3t+z-1`$.
This proves the theorem.

The starting estimates are credited to
[Erdős–Hajnal–Tuza, JCTA 58 (1991), Theorems 3 and 6](https://doi.org/10.1016/0097-3165(91)90074-Q).
The new step is using the dense core to force every selected
petal to overlap the padding of one fixed witness, followed
by the spectral packing bound. Neither the original all-$`r`$
problem nor any numerical instance is claimed solved here.
