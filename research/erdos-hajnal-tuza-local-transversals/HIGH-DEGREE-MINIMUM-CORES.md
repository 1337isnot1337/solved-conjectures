# Exponentially high-degree points in every minimum intersection

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This gives a high-degree core shared across **all** minimum pairs,
without any assumption on the order of the ground set. It does not
yet identify a fixed dense core that meets all edges.

Let $`r=5t+z`$, $`1\le z\le t/1000`$, let $`\tau>t`$,
and assume the local span condition. Write $`m=t+s`$ for the
minimum intersection size. Fix an integer $`1\le u\le t/20`$.
Call a point high-degree if its degree in the full family is at
least
```math
D_u=\frac{(4/3)^u}{s+u}.
```
Then every minimum intersection has at least $`t-u+1`$
high-degree points. In particular, the same high-degree set
contains all but $`s+u-1`$ points of **every** minimum intersection.

## Localized multiplicity lemma

Let $`X=A\cap B`$ be any minimum intersection. For **every**
$`(t-u)`$-set $`L\subset X`$, at least $`(4/3)^u`$ distinct
edges miss $`L`$, meet $`X\setminus L`$, and have total
intersection excess to $`A,B`$ at most $`\delta+u`$, where
$`\delta=z-3s+2`$.

Indeed, choose an $`s`$-cut contained in $`L`$ and a standard
witness $`E`$ for that cut. Such a cut exists since
$`t-u\ge s`$. Thus $`E\cap X\subset L`$, and $`E\cap X\ne
\varnothing`$ because $`X`$ is a transversal. Write
$`U=E\cap(A\setminus B)`$. For every $`u`$-set $`Y\subset U`$
choose an edge $`F`$ avoiding $`L\cup Y`$, which has size $`t`$.
This gives $`F\ne A,B,E`$, $`F\cap X\subseteq X\setminus L`$,
and a nonempty $`X`$-residue.

The proof of the [larger-cut two-wing balance](EXPONENTIAL-NEIGHBOR-TRADEOFF.md)
applies: its inputs are that $`E`$ is a standard witness,
the $`X`$-residues of $`E,F`$ are disjoint, and $`|F\cap X|
\le s+u`$. It bounds the total excess by $`\delta+u`$ and shows
$`|F\cap U|>|U|/4`$. Thus each distinct $`F`$ can account for
at most a $`(3/4)^u`$ proportion of the $`u`$-sets $`Y`$.
Covering all $`Y`$ takes at least $`(4/3)^u`$ distinct $`F`$'s.

## Degree consequence

If $`X`$ has at most $`t-u`$ high-degree points, take $`L`$
to contain all of them. Then each point of $`X\setminus L`$
has degree strictly below $`D_u`$, so the sum of the degrees on
this $`(s+u)`$-set is strictly below $`(4/3)^u`$. This contradicts
the multiplicity lemma, which counts distinct edges, each
incident with at least one of these points.

For a fixed offset at the first moving jump $`r=5t+1`$, where
$`s=1`$, this has two useful consequences.

* For any fixed $`d>0`$, take
  $`u=\lceil (d+2)\log t/\log(4/3)\rceil`$ for sufficiently
  large $`t`$. All but $`O_d(\log t)`$ points of every minimum
  intersection have degree at least $`t^d`$.
* Every edge $`A`$ participating in a minimum pair contains at
  least $`2t-2u+1`$ high-degree points. If $`A,B`$ is such a
  pair, choose a singleton witness $`E`$; then $`A\cap B`$
  and $`A\cap E`$ are both minimum intersections and their
  intersection is a singleton. Apply the degree bound to
  both. The same argument with linear $`u`$ gives an
  exponential degree threshold while retaining a linear
  number of high-degree points on each such edge.

The conclusion locates the high-degree points uniformly across
minimum pairs. It does not say that the high-degree set itself
has small order, and is compatible with having many different
high-degree points in different minimum intersections.
