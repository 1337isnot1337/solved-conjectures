# The remaining Pasch direction

The finite Knaster construction in [the companion note](CCC-AMALGAMATION.md) gives a negative consistency result for exact Problem 8/C. The following reductions concern the still-open positive direction. They do not settle it.

## Lower-link and inter-link restrictions

Let $H$ on $\omega_1$ omit the Pasch configuration and have no uncountable independent set.

1. For any three fixed distinct vertices $a,b,c$, their three pairs have at most countably many common extensions $z$. Otherwise take a triple $xyz$ in the common extension set. Then $abx,bcy,caz,xyz$ form a Pasch.
2. For a fixed cycle $abcd$ of four distinct vertices, at most one $z$ outside them has all four cycle edges in its link. Indeed if $z,w$ both do, take $zab,zcd,wbc,wda$.
3. More generally the extension sets for the two opposite matchings $`\{ab,cd\}`$ and $`\{bc,da\}`$ cannot have distinct representatives $z,w$ outside the four points, by the same construction. In particular if both sets are nonempty then both are the same singleton.

Close a cofinal sequence of countable blocks over the countable sets in (1) and the finite sets in (2), taking the union over the finitely many orderings of each input. On one point per block there are no triangles or four-cycles in any lower link: the apex of one would lie inside the closure of the earlier points and hence below its own block. Condition (3), unlike this restriction on individual links, constrains the family of lower links jointly.

## A ZFC barrier to the individual-link strategy

A witness from the [sharp-density asymptotic proof](../erdos-galvin-hajnal-sharp-triple-density/ASYMPTOTIC-DICHOTOMY.md) already has **forests** as all its lower links in ZFC. In that witness a pair $\alpha<\beta$ designates at most one $\gamma<\alpha$ such that $`\{\gamma,\alpha,\beta\}`$ is a triple. A cycle in the lower link of $\beta$ would have a largest vertex $\alpha$ with two lower neighbors, contradicting uniqueness. Nevertheless the witness has no uncountable independent set. Thus a proof of the positive consistency direction cannot just assume acyclicity, let alone the absence of triangles and four-cycles, in individual lower links. An argument using those lower links has to exploit the joint cross-apex restrictions, or another property of the original hypergraph.

Also, if a fixed pair of vertices in a link has uncountably many common neighbors, the repeated-pair pattern $\mathcal T_6$ follows using a triple among the neighbors. The same argument does not give Pasch: the resulting anchors all contain the original link vertex, while a Pasch has degree two at every vertex. This is the precise point at which the solution of 8/D stops carrying over to 8/C.
