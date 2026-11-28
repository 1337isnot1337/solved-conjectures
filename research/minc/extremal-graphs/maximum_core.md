# Maximum permanent when the line sum does not divide the order

Let $A$ be a square binary matrix of order $n$ with all row and column
sums $d\ge2$. Its bipartite graph has $n$ rows and $n$ columns. Write
$a$ for the number of rows outside components isomorphic to $K_{d,d}$.
With natural logarithms,

```math
\log\frac{(d!)^{n/d}}{\mathop{\mathrm{per}}A}
\ \ge\ \frac{a}{4d(d+1)(2d+1)} .                              \tag{1}
```

Consequently every maximizer in [Minc Problem 4](https://yair-lavi.com/mincs-list/problem-4/)
has at most $4d^2(d+1)(2d+1)$ such rows. This polynomial bound
applies also to growing line sum. It gives an explicit finite reduction
and a range of [Problem 12](https://yair-lavi.com/mincs-list/problem-12/)
in which every circulant is beaten. The unrestricted maximum and the
exceptional maximizing components remain undetermined.

## Entropy loss from a forced column

Choose a perfect matching $M$ uniformly. There is one by Hall's
theorem. Represent it as a bijection from rows to columns. On the rows
form the digraph $D_M$ with arc $i\to j$ when $A_{i,M(j)}=1$. It
has every loop and all in- and out-degrees $d$, counting loops.
Call $i\to j$ asymmetric when $j\not\to i$, and let $b(M)$ be their
total number.

Independently give every row a uniform time in $[0,1]$. Reveal its
matched column in increasing time order. At the turn of $i$, let $R_i$
be the number of its neighbors still unused, and let $U_i$ be the
number among them that cannot be assigned to $i$ in *any* perfect
matching extending the revealed prefix. Conditional entropy is at most
$\log(R_i-U_i)\le\log R_i-U_i/R_i$. Given $M$, $R_i$ is uniform on
$1,\ldots,d$: it is the reverse rank of $i$ among its $d$
out-neighbors. By the chain rule,

```math
\frac nd\log(d!)-\log\mathop{\mathrm{per}} A
\ \ge\ \mathbb E\sum_i U_i/R_i .                               \tag{2}
```

This is the reveal process in [Radhakrishnan's entropy proof](https://www.tcs.tifr.res.in/~jaikumar/Papers/EntropyAndCounting.pdf).

For each asymmetric arc $i\to j$ in a fixed $D_M$ consider the event
that the $d-1$ out-neighbors of $j$ other than $j$ precede $i$, and
$i$ precedes $j$. These are $d+1$ distinct rows because $j\not\to i$.
The probability is $1/[d(d+1)]$. At this time the unrevealed row $j$
has only the available column $M(j)$. Thus $M(j)$ is unusable by $i$.
Events for different $j$ certify distinct unusable columns even when
they occur together.

Conditional on this event, the time of $i$ is the penultimate order
statistic of $d+1$ times, of mean $d/(d+2)$. Among the out-neighbors of
$i$, $i,j$ themselves have unused columns. Each other out-neighbor
either belongs to the constrained earlier rows or is independent of
the event and has probability $2/(d+2)$ of coming after $i$. Thus
$\mathbb E[R_i\mid\mathrm{event},M]\le2+2(d-2)/(d+2)\le4$.
Jensen's inequality gives conditional mean of $1/R_i$ at least $1/4$.
Summing these contributions in (2) gives a lower bound
$\mathbb E b(M)/[4d(d+1)]$.

## A reversible two-row count

We show $a\le(2d+1)\mathbb E b(M)$. For every pair consisting of a
matching $M$ and a row $i$ outside complete components, assign a
matching and a marked asymmetric arc as follows; ties may be resolved
by the row labels.

1. If $i$ has an asymmetric outgoing arc, mark one and keep $M$.
2. Otherwise the out- and in-neighborhoods of $i$ coincide. Call their
   common vertex set $S$. There is an arc $j\to k$ with $j\in S$ and
   $k\notin S$. Otherwise every row in $S$ sends all $d$ arcs to $S$;
   these rows and their matched columns would form a whole $K_{d,d}$
   component. If $k\not\to j$, mark $j\to k$ and keep $M$.
3. In the remaining case $j\leftrightarrow k$. Exchange the matched
   columns of $j,k$ to obtain another perfect matching $M'$. Now
   $i\to k$ since $i$ was adjacent to $M(j)$, and $k\not\to i$
   since $k\notin S$ and $M'(i)=M(i)$. Mark this asymmetric arc.
   Here $j\ne i$ since $k\notin S$.

Fix a target matching and a marked asymmetric arc $u\to v$.
The first rule has at most one preimage. In the second rule the original
center is an in-neighbor of $u$ (at most $d$ choices). In the third rule
the old center is $u$, $k=v$, and the swap partner $j$ has to be an
out-neighbor of $v$ in the new digraph: the edge from row $k$ to its old
matched column persists and that column is now matched to $j$. Once $j$
is chosen the old matching is recovered. This gives at most $d$ further
preimages. Counting over the finite set of matchings proves the claim
and hence (1).

## Consequences for the maximum

Write $n=td+r$ with $0\le r<d$. [Wanless (2003), Theorem 4](https://users.monash.edu.au/~iwanless/papers/pohang.LAA.pdf)
gives $M(n,d)\ge(d!)^t r!$. Its logarithmic deficit from Brègman is at
most $\log(d^r/r!)\le d$, since $d^r/r!$ is one term of $e^d$.
With $B_d=4d^2(d+1)(2d+1)$, (1) forces $a\le B_d$ for every
maximizer. The explicit residue-sensitive bound replaces the last $d$
by $\log((d!)^{r/d}/r!)$.

* If $n>B_d$ every maximizer has a complete component. Removing it
  gives a maximizer at order $n-d$, and appending one gives the reverse
  construction. Thus $M(n,d)=d!M(n-d,d)$ in this range.
* To evaluate $M(n,d)$ at any order, reduce by this equality to one
  order at most $B_d$ and account for the removed factorial powers.
  The finite extremal problem in the remainder is still nontrivial.
* A circulant is transitive on rows by simultaneous cyclic shifts.
  Existence of one complete component forces every component to be
  complete, which would imply $d\mid n$. Thus if $d\nmid n$ and
  $n>B_d$, no circulant can maximize. This conclusion holds for every
  sequence $d=o(n^{1/4})$ eventually. At any order with $d\nmid n$,
  (1) also gives the explicit factor $\exp[-n/(4d(d+1)(2d+1))]$
  below the Brègman bound for every circulant.

[Wanless (1999), Theorems 1, 3, 5, 7](https://users.monash.edu.au/~iwanless/papers/complementDM.pdf)
already proves a bounded component structure and eventual periodicity
for fixed $d$, by pairing partially overlapping rows. Its proof
contains quantitative local losses. The [current circulant problem
page](https://yair-lavi.com/mincs-list/problem-12/) also supplies explicit
bounds, including much smaller thresholds at some low degrees.
The contribution here is the direct entropy estimate (1) in terms of
all rows outside complete components and its simple polynomial cutoff.
No best constant or historical priority is asserted. Enumeration of
the finite remainder is not presented as a structural solution to P4.
