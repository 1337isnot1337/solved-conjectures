# The Erdős bound for triangle-free three-colorings with biregular links

**Theorem.** Suppose a triangle-free graph, or graphon, has a proper three-coloring \(A,B,C\) in which each of the three bipartite links is biregular: every vertex in a given class has a constant weighted degree to each different class. These constants need not agree with each other, the three class masses need not be equal, and the graph itself need not be regular. Then it satisfies the sharp \(N^2/25\) deletion bound of [Erdős Problem 23](https://www.erdosproblems.com/23), for product vertex weights of total \(N\).

There is no vertex-count restriction. The proof gives an explicit rooted cut and verifies one inequality over five **continuous** parameters by exact integer arithmetic. A purely analytic argument below also covers the equal-link case and proves bipartiteness above a sharp density threshold in that case. Neither result assumes the conjecture for arbitrary three-colorings or resolves it in general.

## The rooted cut

Normalize \(N=1\). Write \(a,b,c\) for the class masses and \(x,y,z\) for the unordered edge masses \(AB,AC,BC\), respectively. If any pair mass is at most \(1/25\), color its two classes alike and the third oppositely. Assume now that all three pair masses are larger, and define
```math
\rho=\frac{x}{ab},\qquad \sigma=\frac{y}{ac},\qquad \theta=\frac{z}{bc},
\qquad I=y\sigma,\quad J=z\theta.
```
These are well defined. Across an edge of \(AB\), the two endpoint neighborhoods in \(C\) are disjoint. The respective degrees there are \(y/a,z/b\), so \(\sigma+\theta\le1\). Cyclically the other two pair sums of link densities are at most one as well.

Sample a root \(v\in C\) uniformly by its mass. Initially put \(A,B\) on one side. Flip the \(A\) and \(B\) neighbors of \(v\) to the other side. No edge between \(A\) and \(B\) has both endpoints flipped, by triangle-freeness. The resulting missed cost in \(AB\) is \(x(1-\sigma-\theta)\), using biregularity to count edges incident to the flipped groups. Then assign every vertex \(w\in C\) to its cheaper side. Its total incident mass is \(D=(y+z)/c\). Its mass to the flipped \(A,B\) groups is \(K(v,w)=K_A(v,w)+K_B(v,w)\), where \(K_A\) and \(K_B\) are the common-neighbor kernels restricted to those classes. The cost at \(w\) is at most
```math
\min(K,D-K)\le 2K-2K^2/D .
```
The inequality is valid on both halves of \([0,D]\). For a nonbinary graphon use independent flips on the two classes with probabilities \(W(v,\cdot)\), and choose the sign in \(C\) against the expected losses. The fractional sign assignment can be rounded by atomless subdivision (or finite sampling and a limit); there are no edges within \(C\).

Uniform root averaging gives \(\int_{C^2}K_A=cI\) and \(\int_{C^2}K_B=cJ\). For the mixed square, the number
```math
R(s,t)=\int_C W(s,v)W(t,v)\,dv,\qquad (s,t)\in A\times B,
```
vanishes on the \(AB\) edge support, and \(\int_{A\times B}R=yz/c\) by biregularity. Thus Cauchy–Schwarz implies
```math
\int_{C^2}K_AK_B=\int_{A\times B}R^2
\ge \frac{(yz/c)^2}{ab-x}=\frac{IJ}{1-\rho}.
```
The measure of the \(AB\) nonedge set is at most \(ab-x\) even for a nonbinary graphon. Also \(\int_{C^2}(K_A-K_B)^2\ge(I-J)^2\). Combining gives
```math
\int_{C^2}K^2 \ge (I+J)^2+\frac{4\rho}{1-\rho}IJ.
```
The average cut therefore proves
```math
\beta\le
x(1-\sigma-\theta)+2(I+J)
-\frac{2}{y+z}\left((I+J)^2+\frac{4\rho}{1-\rho}IJ\right).
\tag{1}
```

## Exact five-parameter inequality

For \(2(x+y+z)>3197/10000\) use the [Balogh–Clemen–Lidický dense tail](https://arxiv.org/abs/2103.14179), which transfers to arbitrary order and weights by equal blow-up and continuity; the strict side of the threshold needs no boundary approximation. It remains to take \(x+y+z\le3197/20000\). Let \(C\) be a largest class, and exchange \(A,B\) if needed so \(y\le z\). All class masses lie in \([1/5,3/5]\). For example, \(\sigma+\theta\le1\) and \(y,z\ge1/25\) imply \(c(1-c)\ge4/25\), by \(1/a+1/b\ge4/(a+b)\). Cyclically every class is at least \(1/5\), so no class exceeds \(3/5\). The edge masses lie in \([1/25,1597/20000]\).

Over this compact domain the right side of (1) is strictly below \(1/25\). The complete certificate is in [check_biregular.py](check_biregular.py); run `python3 check_biregular.py`. It visits 87,179 boxes, at depth at most 29. All endpoints and products use integers rounded outward on a dyadic grid. This certifies every real parameter point, not only values found in a search. To see why the bounding step is sound:

- The first term of (1) is at most the upper endpoint for \(x\) times \(1\) minus the two lower link densities. Boxes violating a density-sum condition or the class ordering are pruned only using their enclosing endpoints.
- Write \(T=I+J\) and let \(u\) be an upper bound for \(y+z\). The quadratic contribution is at most \(2T-2T^2/u\), whose maximum on the enclosed interval for \(T\) occurs at \(u/2\) or an endpoint.
- The positive quantity \(8\rho IJ/[(1-\rho)(y+z)]\), which is subtracted, is bounded below using lower endpoints for \(\rho,I,J\) and the upper endpoint for \(y+z\).

Bisecting a box never removes points; each accepted nonempty box satisfies the required rational upper bound. The final result holds for the full domain and uses no Lean verification.

## An analytic argument in the equal-link case

If every vertex has degree \(p/2\) into each other class, integration gives \(a=b=c=1/3\) and \(x=y=z=p/6\). Formula (1) becomes
```math
\beta\le \frac p6+\frac{p^2}{2}-\frac{3p^3}{2-3p}.
```
For \(p\le6/25\) the ordinary whole-class cut already costs at most \(1/25\). For \(6/25\le p\le1/3\) the displayed function is decreasing and at \(6/25\) it equals \(91/2500<1/25\): after multiplying its derivative by \(6(2-3p)^2\), the numerator is \(4+12p-171p^2+162p^3\), negative and decreasing on that interval. Also \(p\le1/3\) follows from the two-link density-sum condition. This replaces the earlier narrower [spectral argument](EQUITABLE-THREE-SPECTRAL.md) for the exact equal-link hypothesis.

In fact the equal-link graph is bipartite if \(p>4/15\). For two vertices on \(C\), positive \(K_A\) forces the union of their \(B\)-neighborhood supports to have mass at most \(1/3-p/2\): a common neighbor in \(A\) must have all its \(B\)-neighbors outside that union. Hence \(K_B\ge3p/2-1/3>0\), using \(fg\ge f+g-1\) on the union for the nonbinary case. Symmetrically positivity in either class gives the same lower bound in both. The positive-overlap relation on \(C\) is transitive, since two such overlaps against a shared row sum to more than its \(B\)-degree \(p/2\), so their other two rows cannot have disjoint support. Thus this relation gives components with disjoint neighbor sets in \(A\) and \(B\). In the atomless case the transitivity and positive row mass give a measurable partition modulo null sets: choose a typical row, take its positive-overlap set, and use transitivity and symmetry with Fubini to identify its class; repeat on the remaining set.

Each component in \(C\) has mass at least \(p/2\), since a neighbor of any of its typical vertices must have all its \(C\)-neighbors inside the component and has \(C\)-degree \(p/2\). Its corresponding neighbor sets in \(A,B\) have the same mass as it by biregularity. There are at most two components. There cannot be just one, since for a typical \(v\in C\), \(\int_C K(v,w)\,dw=p^2/2\) would be at least \((3p-2/3)/3\), which is larger on \(4/15<p\le1/3\). With two components, each has mass at most \(1/3-p/2<p\). A vertex of \(A\) and one of \(B\) belonging to the same component have common neighbors in its \(C\)-class, by their two degrees \(p/2\); they cannot be adjacent. The six class-component cells now have the adjacency template of an even six-cycle, so the whole graph is bipartite. The threshold is sharp for bipartiteness: \(K_3\times C_5\) (edges when both coordinates are adjacent) has equal link degrees, normalized density \(4/15\), and an odd cycle.

The general theorem still requires **biregularity in all links**, not just a proper coloring or two equal cross-degrees at each vertex that vary with the vertex.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
