# Horňák–Woźniak conjecture

In Conjecture 1 of *On arbitrarily vertex decomposable trees*, Horňák and Woźniak ask whether their five arithmetic admissibility conditions suffice for a tripod to admit every partition into connected pieces. Write $A\le B\le C$ for the numbers of vertices on the three arms excluding the centre, and put $n=1+A+B+C$. In the authors' convention the arm orders are $(A+1,B+1,C+1)$.

Theorem 19 of the preprint proves sufficiency when $B\ge(A-2)(A-1)$. The later construction of decomposable combs of arbitrarily long minimum arm settles the related existence question. The maximum-degree theorem of Barth and Fournier addresses a separate conjecture. Searches of the original statements, citing papers, algorithm papers and more recent work on arbitrarily partitionable trees found no resolution of the full five-condition conjecture.

- [Horňák and Woźniak, preprint, Theorems 9, 12 and 19 and §4](https://umv.science.upjs.sk/preprints/dokumenty/A3-2006.pdf)
- [Published article](https://doi.org/10.1016/j.disc.2007.04.008)
- [Barth, Baudon and Puech, *Decomposable trees: a polynomial algorithm for tripodes*](https://doi.org/10.1016/S0166-218X(00)00322-X)
- [Barth, Fournier and Ravaux, *On the shape of decomposable trees*, Theorem 7](https://webusers.imj-prg.fr/~herve.fournier/publications/shape.pdf)
- [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/67)

## All partitions with only consecutive sizes

Theorem 9 reduces the test for decomposability to partitions with sizes $i$ and $i+1$, possibly with one extra size $m\lt i$ in the indicated short-arm range. The following argument shows that conditions 1, 2 and 5 of Theorem 12 already handle the entire class with no extra size.

For a fixed $i$ put $j=i+1$. Reserve one size-$j$ piece for the centre, which is permitted by Lemma 11. If there is an extra piece of size $m$, choose an arm for it and subtract $m$ from that arm's capacity. All remaining pieces must fit into three bins of the resulting capacities $x_1,x_2,x_3$. Conversely, a feasible bin assignment gives a connected decomposition by placing each assigned piece on a consecutive segment outward from the centre, with all unused initial segments forming the central piece.

Let $a$ be the count of size-$i$ pieces, and let $b$ be the count of size-$j$ pieces other than the central one. Put $q_l=\lfloor x_l/i\rfloor$, $u_l=x_l\bmod i$, and $H_l=\lfloor x_l/j\rfloor$. If $b_l$ of the bigger pieces are in arm $l$, the capacity there for smaller pieces is

```math
q_l-b_l-\left\lceil\frac{b_l-u_l}{i}\right\rceil.
```

The ceiling is nonnegative for $b_l\ge0$, because $0\le u_l\le i-1$. Therefore feasibility is equivalent to being able to allocate the $b$ pieces to the arms with total ceiling cost at most $K=\sum_l q_l-a-b$, subject to $b_l\le H_l$. For an integer $K\ge0$, the maximum possible $b$, denoted $M(K)$, is obtained by starting with $\sum_l\min(u_l,H_l)$ and choosing up to $K$ of the largest increments. For each arm the increments are copies of $i$ followed by a possible smaller final increment, because allowing ceiling cost $k_l$ gives capacity $\min(H_l,u_l+i k_l)$. These increments can be taken in their within-arm order. Every $b\le M(K)$ is feasible at this cost by removing bigger pieces from an allocation. In particular

```math
0\le M(K+1)-M(K)\le i.
```

As the partition varies with the capacities fixed, the allotted total $ai+bj$ is constant. Increasing $b$ by $i$ increases $K$ by one. Therefore if the largest $b$ passes, all smaller choices with $K\ge0$ also pass.

When a partition in this class exists, the admissibility condition gives $\sum_l u_l=r(i)-1+\gamma_i i$, where $r(i)\in[1,i]$ represents $n$ modulo $i$ and $\gamma_i\le1$. The smallest possible $b$ is $r(i)-1$, so at this first value $K=1-\gamma_i\ge0$. It suffices to consider the largest $b$, for which $a=j-r(j)\le i$. Write $v_l=x_l\bmod j$ and $Q_l=\lfloor x_l/j\rfloor$. Putting $a_l$ smaller pieces in arm $l$ leaves capacity

```math
Q_l-a_l+\left\lfloor\frac{v_l+a_l}{j}\right\rfloor
```

for bigger pieces. The desired count is $b=\sum_l Q_l-a+\gamma_j$. When $\gamma_j=0$, any placement of all smaller pieces suffices, since the flooring terms are nonnegative. Such a placement exists because $K\ge0$. When $\gamma_j=1$, condition 5 gives an arm with $v_l\ge r(j)$ and $\lfloor x_l/i\rfloor+v_l\ge j$. Place $j-v_l\le a$ smaller pieces there to create one carry, and fit the other smaller pieces in the available capacity. This gives the desired number of bigger pieces. The case $i=A+B$ also has $\gamma_j\le1$, since the first two residues sum to $j-1$ at $j=A+B+1$.

For a fixed extra size $m$, subtracting it changes the minimum $K$ for any chosen arm by at most one. Thus it is enough to check the first and last counts of the size-$j$ pieces for each allowed pair $(i,m)$. If the last passes in some arm, the same arm works down to the second count, where $K\ge0$ even if its first value is $-1$. The general proof that the extra-size checks follow from admissibility remains open.

## A finite-exception theorem

**Theorem.** For all sufficiently large $A$, every admissible tripod with shortest arm size $A$ is arbitrarily vertex decomposable. In fact, for every fixed $D\gt0$, admissibility forces $B\gt A^D$ once $A$ is sufficiently large in terms of $D$.

### What the residue tests imply about the arm lengths

The first two tests of Theorem 12 are equivalent to requiring that the sum of the two smallest of $A\bmod i,B\bmod i,C\bmod i$ is less than $i$, for every $1\le i\le A+B$. If the three residues have sum $s\ge i$, condition 2 is that their maximum is at least $s-i+1$, which is exactly the asserted pair condition. That condition also rules out $s\ge2i$, and if $s\lt i$ both original tests hold.

For $A\ge2$, admissibility also implies the arm-length bound used in Theorem 8. Indeed, no expression of $n$ as a sum of parts in $[B+1,A+B]$ is possible. Any such expression can be balanced to use either a single size $i$ or consecutive sizes $i,i+1$ in the same interval. In the single-size case $r(i)=i$, while $A$ and $B$ are unchanged residues with sum at least $i$. Condition 2 then fails. In the consecutive-size case the positive count of size-$i+1$ parts can be reduced by $i$ at a time, replacing them by $i+1$ size-$i$ parts, to reach a count in $[1,i]$. Here $A+B\ge i+1$, both shorter arms have quotient zero at $i+1$, and only the longest arm can contribute to the left side of condition 4. Its contribution is at most $C\bmod i$, whereas condition 4 requires at least $A+B+(C\bmod i)-i\gt C\bmod i$. A carry of two would already violate condition 1.

The forbidden intervals for $n$ are consequently $[k(B+1),k(A+B)]$ for all positive $k$. As $n\gt2(B+1)$, any remaining $n$ belongs to a gap

```math
[k(A+B)+1,(k+1)(B+1)-1],\qquad
2\le k\le\left\lfloor\frac{B-1}{A-1}\right\rfloor.
```

The bound on $k$ is necessary for the gap to be nonempty. In particular $B\ge2A-1$ and $C=O(B^2/A)$.

### The reciprocal residues cannot avoid an open box at polynomial scales

Suppose there is a sequence of admissible triples with $A\to\infty$ and $B\le A^D$. Then $C$ is bounded by a fixed power of $A$ by the preceding argument. Pass to a subsequence on which every frequency $(h,k)\in\mathbb Z^2$ has either a finite limit $L_{h,k}$ for $(hB+kC)/A$, or tends to infinity in absolute value. This is possible by a diagonal selection using the compact extended real line. The frequencies with finite limit form a subgroup $R$ of $\mathbb Z^2$, and $R$ is saturated, meaning that a nonzero integer multiple in $R$ implies that the frequency itself is in $R$.

For any fixed compact interval of $t=A/i$ inside $(1,\infty)$, the points $(\{B/i\},\{C/i\})$ converge jointly with $t$ to Haar measure on the coset

```math
\{(x,y)\in(\mathbb R/\mathbb Z)^2:h x+k y=L_{h,k}t\pmod1
       \text{ for every }(h,k)\in R\}.
```

More precisely, the first coordinate $t$ has measure $dt/t^2$ in the limit when the count over $i$ is divided by $A$. For $(h,k)\in R$, the Fourier coefficient in the other two coordinates follows directly by Riemann sums. For $(h,k)\notin R$, let $H=hB+kC$. On the given interval of $i\asymp A$, the $r$-th derivative of $H/i$ has size comparable to $|H|/A^{r+1}$. Take a fixed derivative order $r$ larger than the power bounding $|H|$. Then $|H|/A^{r+1}\to0$ and $A^r|H|/A^{r+1}=|H|/A\to\infty$. The van der Corput derivative test gives a sum $o(A)$ on every fixed subinterval in $t$. Fourier approximation and approximation by step functions in $t$ give the claimed joint convergence.

- [Explicit van der Corput derivative-test bounds, Theorem 1](https://arxiv.org/abs/2407.02094)

It remains to see that this limiting measure gives positive mass to $\{t\},x,y\in(1/2,1)$. When $R$ has rank zero, both $x$ and $y$ are uniform. When it has rank two, $B/A$ and $C/A$ have finite limits $b_0,c_0\ge1$ and the coset is the point $(\{b_0t\},\{c_0t\})$. Simultaneous Dirichlet approximation gives an integer $T\gt2$ with $b_0T,c_0T$ arbitrarily close to integers. A sufficiently small decrement of $T$ puts all three fractional parts strictly in $(1/2,1)$ on an open interval. The same argument works if one limit is finite and the other coordinate is free.

The remaining case has rank one and both ratios unbounded. A primitive generator $(h,k)$ of $R$ must have nonzero coefficients of opposite signs. On $x,y\in(1/2,1)$ the values of $hx+ky$ form an open interval of length $(|h|+|k|)/2\ge1$. Thus their residues cover the circle apart from at most one point. If the length is exactly one, then $h=-k=\pm1$, and the sole excluded residue is $1/2$. The affine phase $L_{h,k}t$ can avoid that residue on an open interval of $t$ with $\{t\}\in(1/2,1)$, also when $L_{h,k}=0$. The corresponding lines cross the open square and have positive Haar measure there. In all cases the limiting measure is positive on the desired open set. Thus there must be a modulus $i$ with $i\le A$ at which all three residues exceed $i/2$. This contradicts the first two admissibility tests.

The van der Corput bound applies with derivative lower and upper bounds of the same order, so its normalized terms tend to zero uniformly for each fixed subinterval of positive length.

The resulting superpolynomial separation of the first two arms implies the hypothesis of Theorem 19 for all large $A$. For each remaining $A$, only finitely many choices of $B$ fall outside Theorem 19, and the bound on $C$ gives finitely many triples there as well. This argument does not provide a numerical cutoff for the exceptional set. It proves the finite-exception theorem and leaves the all-tripod statement open.


## Exact cross-check

To screen a bounded range, enumerate the integer gaps above with $2\le A\le56$ and $B\lt(A-2)(A-1)$, then apply Theorem 12 at every modulus $1\le i\le A+B$. In tests 3 and 4, a partition with at most $i$ bigger parts exists exactly when $n\ge r(i)(i+1)$. In test 5, a partition with at most $i$ smaller parts exists exactly when $n\ge (i+1)^2-i r(i+1)$. The statement of Proposition 20.1 omits the factor $i$ on $r(i+1)$; the proof gives the latter formula.

The range contains 686,518,911 candidate triples before the arithmetic tests. The only admissible triple is $(5,9,14)$, whose decomposition is given by the authors in §4. Independent direct enumeration of the two tests' triggering partitions agreed with the threshold implementation for 3,374 small tripods. Direct allocation of bigger pieces to the three arms agreed with the capacity formula for 276,832 small partitions with and without the extra piece. This cross-check covers the indicated range and the proof leaves the rest of the exceptional set undetermined.
