# Regular circular graphs and Erdős’s odd-girth deletion bound

**Theorem.** Let \(q\ge3\) be odd. Place finitely many positive-weight points on a circle of circumference one, with total weight one. Join two points if and only if their shorter circular distance exceeds \((q-1)/(2q)\). Suppose every point has the same total weight of neighbors \(p\). Then the graph has a cut leaving edge weight at most \(p^2/4\). It also has a cut leaving at most \(1/(q+2)^2\), and equality in the latter bound occurs only for a balanced complete blow-up of \(C_{q+2}\), after merging identical neighbor classes. Edge weights are products of endpoint weights.

This proves the genuine Erdős deletion inequality on the regular saturated circular subclass, for every odd girth and with no restriction on graph order. It does not cover regular graphs obtained by arbitrary deletions from a circular completion whose weighted degrees are not constant. The unrestricted [Erdős problem #23](https://www.erdosproblems.com/23) remains open. For the circular class without regularity, the triangle-free threshold is addressed separately in [Heinig's conjecture](HEINIG.md); arbitrary higher odd girth is not covered by either result.

## Regularity forces a consecutive-offset circulant

Merge coincident points and order the remaining angles on a lift of the circle to the real line. Put \(a=(q-1)/(2q)\). The neighbors of a point at \(x\) are the points in \((x+a,x+1-a)\). We may assume \(p>0\), so these lists are nonempty.

The first and last neighbor indices are nondecreasing as \(x\) advances. Equal weighted degrees and positive weights mean one index cannot advance unless the other does too. Merge each consecutive block with identical lifted neighbor endpoints, including a block straddling the seam if needed. Its members are independent twins. Pick one representative angle and give it the total block weight. For distinct consecutive blocks the neighbor endpoints still strictly advance: every neighbor list in the lift meets each lifted block either wholly or not at all, so any set of indices passed by an advancing endpoint consists of whole blocks.

This recovers the exact-regularity part of the more general [window-event classification](REGULAR-CIRCULAR-QUOTIENTS.md). If there are \(n\) blocks, both endpoints must therefore advance at least one at each of \(n\) steps, and exactly \(n\) over a turn. Thus the neighbor offsets are \(k,\ldots,k+d-1\) modulo \(n\) for some \(k,d\ge1\). Their invariance under reflection gives \(2k+d-1=n\). If \(d=1\) the graph is a matching. Otherwise the clockwise displacements to the \(k\)-th next representatives all exceed \(a\), and their sum is \(k\) turns. Thus \(k/n>a\), giving \(n>q(d-1)\). Since \(n+d\) and \(q\) are odd, this gives \(n\ge q(d-1)+2\).

Let \(w_i\) be the block weights. Subtracting two consecutive neighbor sums gives \(w_{i+k}=w_{i+k+d}\). Thus weights have period \(h=\gcd(n,d)\); this is odd since \(n+d\) is odd. Summing all neighbor sums counts each weight \(d\) times, so \(p=d/n\).

## Averaging works even with nonuniform periodic weights

Choose a uniformly shifted contiguous interval of \(\lfloor n/2\rfloor\) quotient vertices for one side of the cut. The probability of missing an offset-\(s\) edge is \(|n-2s|/n\), since the shorter index distance fits in either side and gives that many crossings in each direction across the shifts.

Write \(w_i=(h/n)b_{i\bmod h}\), with \(\sum b_r=1\). For independent residues \(R,T\) with law \(b\), the expected missed unordered weight is
```math
\frac{h}{2n^2}\,\mathbb E
\sum_{\substack{k\le s\le k+d-1\\s\equiv T-R\pmod h}}|n-2s|.
```
Indeed \(\sum_i w_iw_{i+s}=(h/n)\Pr[T-R\equiv s]\); the factor \(1/2\) removes orientation.

Put \(B=d/h\). For any residue, the \(B\) positions \(s-n/2\) form an arithmetic progression of spacing \(h\) centered at \(u\) with \(|u|\le(h-1)/2\); this follows by partitioning the entire offset interval into \(B\) consecutive groups of \(h\) terms. If \(B\) is even, pairs of positions symmetric about \(u\) straddle zero. Summing twice their absolute values gives \(hB^2/2\). If \(B\) is odd, pairing all but the center gives \(h(B^2-1)/2+2|u|\). In this odd case \(n/h\) is even, so \(n/2\) is a multiple of \(h\); hence \(|u|\) is the shorter distance between \(R,T\) on the circle of circumference \(h\). A uniform random semicircle separates two points at distance \(v\) with probability \(2v/h\). But for two independent points the separation probability conditional on the semicircle is \(2t(1-t)\le1/2\), where \(t\) is its mass. Therefore \(\mathbb E|u|\le h/4\), and in either parity the expected inner sum is at most \(hB^2/2\).

The expected missed weight is consequently at most \(d^2/(4n^2)=p^2/4\). The cut lifts by coloring every merged block monochromatically. For \(d\ge2\), the bound on \(n\) gives \(2n-d(q+2)\ge(q-2)(d-2)\ge0\), proving the Erdős bound. Equality requires \(d=2,\ n=q+2\). Then \(n\) is odd, \(h=1\), and the consecutive-offset template is an \(n\)-cycle, because its generator \((n-1)/2\) is coprime to \(n\). All its weights are equal. That example attains the bound.

## Prior result and remaining gap

[Bedenknecht–Mota–Reiher–Schacht, Lemma 2.1 and Theorem 1.4](https://www.math.uni-hamburg.de/home/schacht/2019/Andrasfai.pdf) give the circular representation for generalized Andrásfai homomorphisms and prove a *one sparse half* result, which does not control the sum of the two induced edge counts. [Heinig](https://arxiv.org/abs/0907.3928) exhibits the inexpensive cut for unweighted Andrásfai graphs. The earlier [regular odd-girth note](REGULAR-ODD-GIRTH.md) already obtained the sharp \(1/(q+2)^2\) inequality and equality characterization with a different block cut. The advance here is the stronger degree-dependent bound \(p^2/4\), obtained directly and uniformly for periodic weights by averaging one contiguous cut. The earlier note's near-regular extension still applies. It does not transform any hypothetical counterexample into a regular one: maximizing the minimum cut cost is not the same as maximizing quadratic edge density.
