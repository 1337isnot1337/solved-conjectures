# Grimm’s conjecture: squarefree Hall obstructions in short intervals

Tracking issue: [#337](https://github.com/1337isnot1337/solved-conjectures/issues/337).

**Status:** Structural obstruction to dropping the consecutive-composite hypothesis. This is neither a proof nor a counterexample to Grimm’s conjecture.

[Grimm’s original conjecture](https://doi.org/10.2307/2317188) states that if every integer in \(n+1,\dots,n+k\) is composite, then those integers admit pairwise distinct representative prime divisors. Hall’s theorem lets one search for a subset of the run having fewer distinct prime divisors than elements. A subset minimal under inclusion with this property will be called a **minimal Hall-deficient set**. The result below shows that even exact factorizations, squarefreeness, minimality, and a short span do not suffice to rule such sets out in arbitrary intervals.

## Theorem

Fix \(\epsilon>0\). For all sufficiently large \(X\) there are sets \(S\) of distinct odd squarefree semiprimes in \([X^2,(3X)^2]\) with the following properties:

1. Writing \(N=\min S\), one has \(\max S-N\ll_\epsilon \sqrt N(\log N)^\epsilon\).
2. Each set has \(\asymp_\epsilon\log\log N\) elements and is minimal Hall-deficient. Its union of prime divisors has exactly \(|S|-1\) elements.
3. There are \(\gg\sqrt N/\log N\) primes strictly between \(\min S\) and \(\max S\). These are not sets contained in a composite run.

The number of distinct minima in the indicated range is
\[
  \gg_\epsilon \frac{X\exp(-\sqrt{\log X})}{(\log X)^\epsilon}.
\]
For any fixed \(s\ge5\), the same construction gives sets with exactly \(s\) elements arbitrarily far out with span \(O_s(\sqrt N)\) and the same internal-prime property.

### 1. A minimal obstruction from a graph

For any \(m\ge4\), take a graph \(G_m\) made of three internally vertex-disjoint paths with common endpoints and lengths \(1,2,m-2\). It is simple, has exactly \(m\) vertices and \(m+1\) edges, and contains two disjoint edges: for example take the first edge of the length-2 path and the last edge of the length-\((m-2)\) path, orienting both paths in the same direction. Every simple cycle consists of two of the three entire paths. Removing any edge leaves at most one simple cycle, hence every proper subset of edges forms a pseudoforest (each component has at most one cycle). In such a subset the number of distinct endpoints is at least its number of edges.

Assign distinct odd primes to the vertices and form the product of the endpoints of each edge. Distinct edges give distinct products by unique factorization. The full set of products has \(m+1\) integers and exactly \(m\) prime divisors; every proper subset has at least as many prime divisors as integers. This is minimal Hall-deficiency with no prime powers and no non-squarefree values.

### 2. Positioning the primes

Let \(y=(\log X)^\epsilon\), or take \(y\) sufficiently large and fixed for the fixed-size assertion. [Maynard, *Dense clusters of primes in subsets*, Theorem 3.2](https://doi.org/10.1112/S0010437X16007296) supplies \(\gg X\exp(-\sqrt{\log X})\) integer starts \(x_0\in[X,2X]\) for which \((x_0,x_0+y]\) has \(\gg\log y\) primes. Retain any \(m\asymp\log y\) of these primes, or exactly \(m=s-1\) for fixed size. Index the retained primes as \(p_1<\dots<p_m\).

We can require that every retained prime \(p\) have \(\gg p/\log p\) primes between \(p^2\) and \((p+1)^2\). Indeed, [Bazzanella, *Primes between consecutive squares*, Theorem 1](https://doi.org/10.1007/s000130050469) gives the expected prime count in these square intervals with \(O_\delta(Y^{1/4+\delta})\) exceptions for upper squared endpoint \(Y\). Use \(Y=(3X+1)^2\) and a fixed \(\delta<1/4\). There are \(O_\delta(X^{1/2+2\delta})\) exceptional bases that could occur in our prime clusters. Each such base contaminates at most \(y+1\) cluster starts. Their total is \(o(Xe^{-\sqrt{\log X}})\), so deleting them preserves the order of magnitude of good starts. The unconditional portion of Bazzanella’s theorem suffices.

Place \(p_1,p_2\) on one of the disjoint edges of \(G_m\), and \(p_{m-1},p_m\) on the other. These edge products are the extreme products of any distinct pairs:
\[
  N=p_1p_2,\qquad\max S=p_{m-1}p_m.
\]
They satisfy
\[
  p_1p_2 < p_2^2 < (p_2+1)^2 < p_{m-1}p_m
\]
for \(m\ge4\): even for \(m=4\), \(p_3,p_4\) exceed \(p_2+1\) because all retained primes are odd. Hence the promised primes truly lie *between the extreme products*, not just in an enlarged ambient interval. Also
\[
  \max S-N\le(x_0+y)^2-x_0^2=O(Xy)=O(\sqrt N\,y).
\]
Finally a common minimum \(N\) identifies \(p_1,p_2\) by factorization and can come from at most \(y+1\) starts. Dividing the number of good starts by \(y+1\) proves the stated abundance. These bounds show that the ratio \((\max S-N)/N\) tends to zero, so no two members can divide one another.

### 3. A positive result for the semiprime family

**Proposition.** Every finite set of odd semiprimes (including prime squares) in an interval \([N,N+h]\), with \(h<4\sqrt N+4\), has distinct representative prime divisors, regardless of whether the other integers in the interval are composite. In particular, a minimal Hall witness consisting entirely of odd semiprimes must have intrinsic span at least \(4\sqrt N+4\).

Construct the graph with the used prime divisors as vertices and an edge for each semiprime. A prime square gives a loop. There are no multiple edges. Compare two vertex-disjoint edges, writing their endpoints as \(a\le b\) and \(c\le d\) with \(a<c\). If they are not nested then \(b<d\); as the primes are odd, \(c\ge a+2\) and \(d\ge b+2\), so
\[
 cd-ab\ge 2a+2b+4\ge 4\sqrt{ab}+4\ge4\sqrt N+4.
\]
This is impossible on the given span. Thus every two disjoint edges are nested in the prime order.

This nesting condition restricts the nonloop edges to at most one cycle. First, a cycle of length at least four is impossible: let \(v\) be its least vertex and \(u,w\) its two neighbors along the cycle. The other cycle edge at \(w\) is disjoint from \(vu\), and it must lie inside \(vu\) because \(v\) is least. Thus \(w<u\). Swapping \(u,w\) gives the opposite strict inequality.

Second, two triangles sharing an edge would give a 4-cycle. For two triangles sharing only a vertex \(v\), call their other vertices \(a,b\) and \(c,d\). If \(v\) is least, compare edges \(va\) with \(cd\) and \(vc\) with \(ab\), forcing \(c<a\) and \(a<c\). Otherwise relabel so that \(a\) is least. Comparing \(av\) with \(cd\) forces \(c,d<v\), and comparing \(ab\) with \(vc\) forces \(v<b\). Then \(cd\) and \(vb\) are disjoint separated edges, contrary to nesting. If the triangles are vertex-disjoint, let \(a\) be the least vertex of their union and \(b,c\) its two partners. Every vertex of the other triangle lies inside both \(ab\) and \(ac\) by nesting. An edge of the other triangle is then separated from \(bc\), again a contradiction.

There is at most one loop: the products associated to two loops at different odd primes have difference at least \(4\sqrt N+4\). A loop disjoint from a triangle cannot be nested with every triangle edge, because two of the triangle vertices lie on the same side of the loop vertex. If the loop shares a triangle vertex \(p\), then nesting with the opposite edge forces that edge's vertices to satisfy \(a<p<c\). The two edges through \(p\) have products with difference \(pc-pa\ge4p\). Also \(N\le pa\le p(p-2)\), so \(p\ge1+\sqrt{N+1}\), making the difference strictly greater than \(4\sqrt N+4\). Thus a loop and a triangle cannot coexist, and the graph has at most one cycle, counting a loop as a cycle.

Consequently every edge subset is a pseudoforest, with at least as many incident vertices as edges. Hall applies. The same matching conclusion holds for arbitrary even and odd semiprimes if also \(h<N/2\), which is automatic at the stated square-root scale for sufficiently large \(N\): assign each even semiprime \(2p\) the divisor \(p\), which divides no other member since \(p\ge N/2>h\). This includes \(4=2\cdot2\) if present.

The proposition is stronger than the pairwise factor support condition, and gives the correct square-root *order* for the preceding examples of any fixed cardinality. It does not cover higher prime powers, integers with three or more prime factors counted with multiplicity, or every possible span of a bona fide Grimm kernel.

### 4. Consequence for actual composite runs

For sufficiently large \(N\), if a true composite run contains a Hall-deficient set consisting entirely of semiprimes and having minimum \(N\), its intrinsic span must be at least \(4\sqrt N+4\) by the proposition. With \(m=\lceil\sqrt N\rceil\), one has
\[
   N\le m^2<(m+1)^2\le (\sqrt N+2)^2=N+4\sqrt N+4 .
\]
Hence the same run contains a whole consecutive-square interval \([m^2,(m+1)^2]\) with no prime. Thus this obstruction type forces a Legendre exception, not merely an interval comparable to a square gap.

For maximal composite runs whose opening prime belongs to \([X,2X]\), Bertrand's postulate places the closing prime below \(4X\). Distinct maximal runs are disjoint, so choosing one witnessing square interval per bad run gives distinct bad square intervals. Bazzanella's theorem then bounds the number of these runs by \(O_\delta(X^{1/4+\delta})\) for every fixed \(\delta>0\). Likewise the number of possible minima \(N\in[X,2X]\) for this obstruction type, regardless of the beginning of the run, is \(O_\delta(X^{3/4+\delta})\): each bad square base \(m\) can receive at most \(2m-1=O(\sqrt X)\) such minima, namely those in \(((m-1)^2,m^2]\). These actual-run consequences do not exclude minimal Hall witnesses that include an integer with at least three prime factors counted with multiplicity.

## Source and priority audit (2026-11-24)

* [Grimm (1969)](https://doi.org/10.2307/2317188) introduces the universal statement. [Ramachandra–Shorey–Tijdeman (1975)](https://www.degruyterbrill.com/journal/key/crll/1975/273/html) give a short-range result; [Laishram–Shorey (2006)](https://doi.org/10.1142/S1793042106000498) use minimal Hall witnesses and establish a finite range; [Laishram–Murty (2013)](https://arxiv.org/html/1306.0765) obtain bounds on related functions and state the conjecture as open. [Arévalo’s 2026 author report](https://fabianarevalo.com/math) concerns a finite verification through \(10^{12}\), not a proof. The Erdős Problem 375 discussion additionally reports finite computations; those do not settle the universal assertion.
* [Zhang, viXra:2103.0044](https://vixra.org/pdf/2103.0044v1.pdf), Sections 5–6, claims duplicate greatest prime factors inside one composite run cannot share another factor. In the composite run strictly between 44587 and 44617, the two members \(44590=2\cdot5\cdot7^3\cdot13\) and \(44616=2^3\cdot3\cdot11\cdot13^2\) share smallest prime 2 and greatest prime 13. Both endpoints are prime by trial division through 211. A list of proper divisors in order for the 29 integers is:
  \[
  2,3,2,17,2,19,2,3,2,7,2,103,2,3,2,13,2,5,2,3,2,31,2,7,2,3,2,5,2.
  \]
  Thus the exact intermediate assertion is false, without refuting Grimm.
* [Marshall, viXra:1702.0286](https://vixra.org/pdf/1702.0286v1.pdf), derives distinct representative primes from unique factorization without a matching argument. Interpreted as a claim that each number has a private prime divisor, it fails already for 24 in the run \(24,25,26,27,28\): 2 also divides 26 and 28 and 3 divides 27. Interpreted as the existence of a globally injective choice, the inference is the conjecture itself.
* [Majkic’s posted manuscript](https://www.academia.edu/176527237/Gromms_Conjecture) infers that a chain of reassignment must find a new available prime from the fact that every pair of integers has distinct representatives. The pair condition alone does not prevent longer Hall deficiencies: every pair in the theorem above has distinct representatives, but no global representative system exists. The argument does not supply a proof that the consecutive-composite property prevents such a longer obstruction.
* The May 2020 compilation [*30 Ideas About Prime Numbers*, Idea 19](https://oeis.org/A333721/a333721.pdf) uses Bertrand's postulate to assert a prime between two odd integers with the same prime support. Such integers need not have ratio at least 2 (e.g. 45 and 75), so that inference does not follow from Bertrand. It also passes from distinct support sets to a sufficient number of distinct primes, which does not follow even in short intervals, as the construction here shows. This identifies gaps, not a counterexample to its intermediate same-support conjecture.
* The analytic inputs are Maynard’s prime clusters and Bazzanella’s unconditional square-interval estimate. The graph-to-prime-product transfer uses these theorems, not a new prime distribution estimate. Searches for Grimm, semiprime Hall obstructions, and short-interval prime products found no exact earlier statement of this transfer; no exclusive priority is claimed.
