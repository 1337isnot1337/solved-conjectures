# Erdős–Sárközy–Sós conjecture: genuine Sidon lifts with bounded interior gap energy

Partial research for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783), continuing [the cyclic Ruzsa gap theorem](RUZSA-CYCLIC-SIDON.md). Fix an integer $K\ge2$. For every large prime $p$, put $M=p(p-1)$. There exists a genuine integer Sidon set $A^*\subset[0,KM)$ of size $p-1$ such that the sum of the squared lengths of all gaps of $A^*+A^*$, **clipped to**
\[
 [M,(2K-1)M],
\]
is $O_K(M)$. The same interval has $\gg_K M$ distinct sums. The two omitted edge intervals have total length at most $2M$, so by fixing $K$ sufficiently large, the controlled interval is as large a fraction of the actual sum span as desired. However $K$ is fixed before $p\to\infty$, and the original whole-span integer problem remains open.

In fact for these lifts the omitted edges necessarily account for unbounded squared gap energy: the [modular discrepancy theorem](MODULAR-EXTENSIONS.md) gives an $\Omega(\log p)$ whole-span mean-square lower bound, because the Ruzsa modulus has only $O(p)$ missing nonzero differences. So reducing the representation count to one in the interior does not repair either real edge.

The randomized lift and disjoint-pair idea has a clear antecedent in [Ruzsa (1996), Theorem 4.1](https://geodesic.mathdoc.fr/articles/10.4064/aa-77-4-353-359/). His construction partitions and reflects a Ruzsa set, uses its well-covered **difference** residues and a selected primitive root, and controls the largest gap by $O(\log N)$ on a particular long subinterval. Here the cyclic **sum** window estimates supply the required candidates directly for unsigned lifts, the squared-gap cost is bounded on average, and the controlled fraction can be made arbitrarily close to one. No priority is claimed for the randomized disjoint-pair device.

## One lift per residue

Let $A$ be the cyclic Ruzsa set, using least nonnegative representatives $a<M$. Choose independently $U_a$ uniform in $\{0,\ldots,K-1\}$ and put $A^*=\{a+MU_a:a\in A\}$. Since each residue has exactly one chosen lift and unordered sums in $A$ are distinct modulo $M$, the lifted integer set is Sidon for every outcome.

A modular sum $s$ has its unique unordered pair $\{a,b\}$. Their original integer representatives sum to $s+M\epsilon$ with $\epsilon\in\{0,1\}$. In row $r$, $1\le r\le 2K-2$, this pair hits $s+rM$ if and only if $U_a+U_b=r-\epsilon$. The right side lies in $[0,2K-2]$, so for $a\ne b$ the success probability is at least $K^{-2}$. For pairwise vertex-disjoint pairs these events are independent.

## From modular hits to lifted hits

In a modular interval of length $h\le M/2$, the Ruzsa set has $O(\sqrt h)$ points: lift the interval to one consecutive integer interval and count distinct positive differences. A modular interval $I$ of length $h$ therefore has at most $O(\sqrt h)$ diagonal sum sites $2a$, because the preimage of $I$ under doubling is contained in a bounded number of circular intervals of length $O(h)$. The off-diagonal representations of its sum sites are edges in a simple graph on $A$. Each endpoint $a$ has partners only in $I-a$; hence the degree is $O(\sqrt h)$. If $I$ contains at least $h/4$ modular sums and $h$ exceeds a sufficiently large absolute constant, the graph has $\gg h$ edges after removing the diagonals. Greedily taking an edge and removing all edges incident to its endpoints extracts a matching of size $\gg\sqrt h$.

For an interval of $h$ sites within row $r$ whose modular interval is of this type, the chance of no lifted sum is $\le e^{-c_K\sqrt h}$. By the [fourth moment](RUZSA-CYCLIC-SIDON.md), for $h\le p/2$ the exceptional modular starting sites contribute $O(M(h^{-2}+p^{-1}))$ potential empty windows. Therefore the expected number of empty windows wholly within row $r$ is
\[
 O_K\bigl(M(h^{-2}+p^{-1}+e^{-c_K\sqrt h})\bigr), \qquad 1\le h\le p/2,
\]
where the bounded small $h$'s are absorbed into the constant. This estimate summed over $h\le p/2$ is $O_K(M)$.

For each longer window use monotonicity of the number of empty windows (a longer window gives an empty shorter one with the same start). The expected count at $h=\lfloor p/2\rfloor$ is $O_K(M/p)$. The earlier [Fourier tent estimate](RUZSA-CYCLIC-SIDON.md) guarantees $\gg p$ actual modular sum sites in *every* window of a suitable fixed length $C p$, not just on average. Using the graph matching again, the probability of an empty lifted window of that length at any given start wholly within a controlled row is $\le e^{-c'_K\sqrt p}$. A union bound over $O_K(M)$ starts shows that all controlled rows have no such empty windows simultaneously with probability $1-o(1)$.

Temporarily insert row endpoints when accounting for gaps within each row. This only makes the interval accounting explicit: its squared internal and boundary pieces equal the row length plus twice its empty-window counts, with windows that touch the inserted endpoints excluded. The total cost with the empty-window count truncated at $Cp$ has expectation $O_K(M)$ by the two bounds above. Markov and the high-probability $Cp$ bound give an outcome with the full cost $O_K(M)$. Remove the artificial boundaries to combine adjacent rows. Every row is nonempty since it has no length-$Cp$ void, so a gap crossing a row boundary joins at most two pieces. The combination costs at most twice their squared costs. This proves the clipped bound on the whole controlled interval. If an endpoint of that interval lies outside the actual sum span, the artificial boundary only adds an exterior piece, which is harmless for the upper bound. Cauchy–Schwarz on the pieces of total length $(2K-2)M$ yields $\gg_K M$ sums there; the no-void event also ensures that the actual sum span reaches to within $O(p)$ of both ends of the strip.

Finally let $E_{\rm mid}$ and $E_{\rm edge}$ be the sums of squares of the pieces obtained by cutting gaps at the two ends of the controlled interval. For every original gap, the square of its length is at most three times the sum of its squared pieces. The whole-span lower bound $\Omega(M\log p)$ and $E_{\rm mid}=O_K(M)$ therefore give $E_{\rm edge}=\Omega_K(M\log p)$ for these lifts. Any full counterexample has to use different endpoint geometry, not just a better random choice of representatives in this template.
