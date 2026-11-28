# Odd-girth deletion for regular circular quotients, with equality

Let $g\ge5$ be odd and put $q=g-2$. Consider a complete circular model whose adjacency window is
$
\left(\frac{q-1}{2q},\frac{q+1}{2q}\right),
$
with strict boundary separation and positive vertex weights of sum one. Its odd girth is at least $g$: a cycle of odd length at most $q$ would have total clockwise displacement equal to a half-integer plus a correction of absolute value less than $1/2$, not an integer.

If this model is degree-regular, its normalized bipartization cost is at most $1/g^2$. Equality holds only for the balanced blow-up of $C_g$, including arbitrary subdivisions of its independent classes into weighted twins. There is also an explicit neighborhood of each regular weighting in which the bound persists without exact regularity.

For the inequality on regular blow-ups, the [Bedenknecht–Mota–Reiher–Schacht sparse-half result](https://www.math.uni-hamburg.de/home/schacht/2019/Andrasfai.pdf) already gives a route: on a regular graph, two halves of equal mass have the same number of internal edges. This note gives a direct interval-cut proof without that theorem and shows the strictness and periodic-weight mechanism. It concerns the circular class, not the unrestricted [Erdős odd-girth bipartization problem](https://www.erdosproblems.com/23).

## Uniform quotient weights

Use the [window-event classification](REGULAR-CIRCULAR-QUOTIENTS.md). On $m$ twin classes the first allowed offset is $J=\lceil (q-1)m/(2q)\rceil$, and there are $k=m-2J+1>0$ allowed offsets. In particular
$
k<m/q+1,\qquad m-k\text{ is odd}.
\tag{1}
$
If the reduced weights are uniform, cut into the two closest contiguous block sizes. The cut misses exactly $\lfloor k^2/4\rfloor$ template edges, by summing $\binom{s-J+1}{2}$ for the two block sizes $s$. The product-weighted cost is $\lfloor k^2/4\rfloor/m^2$. If $k=1$, it is zero. If $k\ge2$, (1) and parity give $m\ge q(k-1)+2$. Therefore
$
\frac{m}{q+2}\ge \frac{k}{2}+\frac{(q-2)(k-2)}{2(q+2)}.
\tag{2}
$
This proves the claim for uniform weights, strictly when $k\ge3$. The only case permitting equality is $k=2,m=q+2$; its graph is the single cycle $C_g$, since its two shifts are $\pm(m-1)/2$ and the generator is coprime to $m$.

## Genuinely periodic quotient weights

Put $h=\gcd(m,k)$. When $h>1$ it is odd, by (1). Write $m=hM,\ k=hK$, and let $J'=(M-K+1)/2$. Then
$
 J=hJ'-(h-1)/2,\qquad K<M/q+1/h,\qquad M-K\text{ is odd}.
\tag{3}
$
Partition the original circular order into blocks of $h$ consecutive vertices. Degree regularity makes weights periodic modulo $h$, so every block has mass $1/M$ and the same within-block normalized weight vector. Vary the block origin modulo $h$; this rotates the within-block residue weights. Let $\zeta$ be the probability that two independent within-block positions $A,B$, drawn from that normalized weight vector, have $B-A>(h-1)/2$ in the linear order of a block. Some choice of origin has $\zeta\le1/8$. Indeed for two distinct residues of shorter circular separation $d$, the probability over block origins that their linear separation exceeds half the circumference is $d/h$. A uniform random semicircle separates those residues with probability $2d/h$. For any fixed semicircle the separation probability of two independent drawn residues is at most one half. Symmetry between the two residues gives the further factor of one half for the oriented condition in $\zeta$, for an average at most $1/8$.

Cut the blocks into the two closest contiguous sizes. The integer $J'$ is at least two: (3) implies $M\ge4$, and $J'=1$ would give $K=M-1$, contrary to $K<M/q+1/h$. Thus no edge lies within one block, since $J>h-1$. Among two blocks in the same part of the cut, let $d$ be their positive forward separation within that part. For $d<J'-1$, their largest vertex displacement is below $J$. For $d=J'-1$, the condition to reach $J$ is $B-A>(h-1)/2$. For $d=J'$, the condition fails on the reversed difference event, also of probability $\zeta$. For $d>J'$, upper bound the edge mass by the full block product. The upper displacement threshold can only further reduce these estimates. Compare with the model on $M$ equal blocks with first offset $J'$: the modification increases the number of internal block-pairs in units of full block product by at most $2\zeta$. This is because the number of pairs at offset $J'-1$ exceeds the number at offset $J'$ by at most one in each contiguous part. Therefore a cut has cost at most
$
\frac{\lfloor K^2/4\rfloor+2\zeta}{M^2}
\le \frac{\lfloor K^2/4\rfloor+1/4}{M^2}.
\tag{4}
$

We check that (4) is strictly below $1/(q+2)^2$:
- If $K\ge3$, (3) and parity give $M\ge q(K-1)+2$, so (2) holds with $M,K$ in place of $m,k$. For odd $K$ the numerator in (4) is exactly $K^2/4$, and the extra term in (2) is positive. For even $K\ge4$, the square root of the numerator is at most $K/2+1/(4K)$, whereas the extra term in (2) is at least $(K-2)/10>1/(4K)$.
- If $K=2$, then $M>5q/3$ because $h\ge3$. For $q\ge5$, $5q/3\ge(9/8)(q+2)$, greater than $\sqrt{5/4}(q+2)$. For $q=3$, the odd integer $M>5$ is at least seven, which also suffices.
- If $K=1$, then $M>2q/3$, hence $M>(q+2)/2$ for $q\ge7$. For $q=3,5$, the even-order and lower-bound conditions give $M\ge4>(q+2)/2$. In either case the numerator in (4) is $1/4$.

This proves strictness for all $h>1$. Refining identical-neighborhood classes leaves the same optimum: sample an independent representative in each class from any cut to get a quotient cut of the same expected cost, and whole-class cuts give the converse.

## An explicit nearly regular extension

Let $\Delta$ be the width of the weighted degree interval on the quotient and assume it is below the minimum quotient weight. The same classification still gives the equal-step template, and consecutive weights in each step-$k$ orbit differ by at most $\Delta$. Average the weights on each orbit to make them periodic. The total absolute change in vertex weights is at most $m(m/h)\Delta$. The change in every cut cost is no larger, since the unordered product-measure difference is at most the absolute change in vertex masses.

If the quotient is $C_g$, the lightest adjacent product is at most $1/g^2$ for arbitrary weights, by AM–GM. For every other quotient the strict gap computed above gives a positive margin. In detail, if $m(m/h)\Delta$ is at most that margin, the odd-girth deletion bound still holds. Thus these near-regular, possibly nonregular circular weights are also covered, without any bound on the template rank.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
