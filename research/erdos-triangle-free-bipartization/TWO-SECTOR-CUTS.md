# Why one split circular sector does not suffice

This is an all-odd-girth obstruction to a restricted cut family, not to the [Erdős deletion conjecture](https://www.erdosproblems.com/23).

Let q≥3 be odd and g=q+2. In the circular model join points whose shorter angular separation exceeds (q−1)/(2q). Divide the circle into q equal sectors. Relabel the sectors so that movement by (q−1)/2 sectors increases the label by one modulo q. In these labels all allowed edges join label i to i+1 and require the fractional sector coordinates to increase in that direction.

Fix a cut family allowed to split the vertices of **at most one sector** between its two sides; it otherwise colors the sectors in any way. There is a weighted C_g in this model for which every such cut costs at least 1/(g²−1), strictly above the claimed Erdős bound 1/g². The true optimal cut on that graph costs only 1/(g+1)².

Choose g points v₀,…,v_(q+1) in increasing order of fractional coordinates, with labels j modulo q. Increasing coordinates give edges precisely when the index difference is 1 or q+1. Thus the graph is the path through the points in order, closed by v₀v_(q+1). Give the even and odd index positions masses 1/(g+1) and 1/(g−1), respectively; there are (g+1)/2 even positions and (g−1)/2 odd positions, so their total mass is one. Every path edge costs 1/(g²−1); the closing edge joins the two even endpoints and is lighter.

A cut crossing the entire path must alternate the signs. Labels 0 and 1 each occur twice, and their two occurrences are separated by odd index difference q, so each label would have to split. One allowed split cannot achieve that. Thus some path edge is missed. On the other hand the alternating path coloring misses only the closing edge. No odd-cycle cut can do better than the cheapest edge, proving both claims.

## Exact conditional two-sector optimization

There is an elementary extension past this obstruction. Fix two adjacent labels L,R and alternate the remaining sector signs. The neighbors of L and R outside the pair have the same sign, say positive, since the remaining sector path has odd order. For x in L let a(x) be its incident mass to the preceding sector; for y in R let b(y) be its mass to the following sector. The optimal completion on these two sectors is the minimum cut in a network with undirected edges L–R at their product masses, a terminal joined to L with capacities w_x a(x), and the other terminal joined to R with capacities w_y b(y). To see this, reverse the sign variable on R: an internal edge is missed exactly when its two new variables differ. An L-vertex pays its external mass on the positive side, and an R-vertex pays its external mass on the negative side after reversal. These are exactly the terminal-edge penalties.

In particular this gives the cheapest cut for every fixed adjacent split pair without guessing two independent coordinate thresholds. It solves the obstruction above by taking labels 0 and 1, but no universal bound for this larger cut family is asserted. Previously documented [fixed semicircle obstructions](FIXED-HEINIG-ROTATIONS.md) restrict the angular intervals rather than the number of split sectors; the argument here rules out even arbitrary assignments within a single split sector.
