# Exact bound for separated defect demands

Research note for [Erdős Problem 23](https://www.erdosproblems.com/23) and its higher odd-girth analogues. This is a partial result, not a resolution of the unrestricted problem. The [hop-distance tail bound](HOP-DISTANCE-TAIL.md) applies without the joint-separation hypothesis below, but has a larger constant.

Let (G) be a finite graph with nonnegative vertex masses of total one and product edge masses. Fix a maximum cut. Let (B) be its crossing graph and (D) its defect edges. Let (Fsubseteq D) have mass (t>0), with every edge in (F) between two vertex sets (A,C) at distance at least (Lge1) in (B). Here the distance is between **sets**: every pair in (A	imes C) has distance at least (L), not just the pairs belonging to (F). Then
```math
 tle rac{1}{(L+1)^2}.
```
For even (L), equality is attained by taking the balanced blow-up of (C_{L+1}), choosing a maximum cut that leaves exactly one complete consecutive pair of classes uncut, and taking those classes as (A,C). In particular the coefficient for (L=4) is exactly (1/25).

## Proof and equality

Let (f(v)=min(L,d_B(A,v))), writing (f(v)=L) if the distance is infinite. Let (a_i) be the mass at level (i). All crossing-graph edges change (f) by at most one. Across the prefix ({fle i}), for (0le i<L), flipping the original cut shows that the crossing-graph mass across this prefix is at least the defect mass across it. All of (F) crosses every prefix. Consequently (a_i a_{i+1}ge t) for (0le i<L). The remaining bound (a_L a_0ge t) holds because (F) lies between levels 0 and (L). Multiply these (m=L+1) inequalities:
```math
  t^m le left(prod_{i=0}^{L} a_iight)^2le m^{-2m}.
```
There is no positive-mass edge of (Dsetminus F) between distinct levels at equality, since it would cross some prefix and make the corresponding product exceed (t). All levels then have mass (1/m), consecutive levels are joined completely in (B), and the level pair ((L,0)) is joined completely in (F), after ignoring zero-mass vertices. If (L) is even and (G) is triangle-free, there are no edges within any level: two vertices there have a common neighbor in an adjacent level. Thus equality forces the balanced (C_m) blow-up for even (Lge4) in the triangle-free case. Conversely, in that blow-up the displayed cut is maximum: one can move each independent twin class to a single cut side without decreasing the cut, and every cut of the odd cycle omits at least one edge.

## Quantitative stability

Write (t=(1-delta)/m^2) with (0ledelta<1), and set (u_i=1/m). Since each consecutive product, including (a_La_0), is at least (t), the relative entropy satisfies
```math
   sum_i u_ilog(u_i/a_i)le -	frac12log(1-delta).
```
Pinsker's inequality gives (s=sum_i |a_i-u_i|lesqrt{-log(1-delta)}). The total missing mass (M) of the cycle edges in (G), for (mge3), obeys
```math
 Mlesum_{imod m} a_i a_{i+1}-mt
 =delta/m+sum_{imod m}(a_i-u_i)(a_{i+1}-u_{i+1})
 le delta/m+s^2/2 .
```
For distinct levels, no extra crossing-graph edges are possible outside this cycle template. For each of the (L) prefix cuts the mass of extra defect edges crossing the prefix is at most (a_i a_{i+1}-t). Every extra interlevel defect edge crosses at least one prefix. Their total mass is therefore at most (delta/m+s^2/2).

If (G) is triangle-free, an intralevel edge (v w) has the property that the missing masses from (v) and (w) into any chosen adjacent level (j) add to at least (a_j). Integrating over unordered intralevel edges at level (i) bounds their mass by ((a_i/a_j)M_{ij}), where (M_{ij}) is missing mass across the pair. Choose (j=i+1) cyclically, so each (M_{ij}) appears once. For (s<1/m), all (a_i/a_j) are at most ((1/m+s)/(1/m-s)). Hence for fixed even (Lge4) the graph is (O_L(delta)) in product edge-edit mass from a (C_m) blow-up with these nearly equal classes, and their weights are within (O(sqrt{delta})) in (ell_1) of uniform. The proof uses only the maximum-cut flip inequalities and triangle-freeness, and requires no minimum degree.

## What the hypothesis does not give

A lower bound on the length of the shortest path for *each* demand does not supply jointly separated endpoint sets. For instance, the defect graph need not be bipartite; even for a bipartite defect graph, endpoint sets of different components can be close in (B). A proof of the unrestricted conjecture cannot simply substitute individual distances into this lemma. The [general distance-tail argument](HOP-DISTANCE-TAIL.md) uses a different partition method. Komlós's [Covering odd cycles](https://doi.org/10.1007/BF01215920) and the [higher odd-girth sparse-half theorem](https://arxiv.org/abs/1609.05712) give related bounds with different hypotheses or constants; this note does not claim literature priority for the elementary layer argument.
