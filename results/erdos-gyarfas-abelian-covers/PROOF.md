# Every abelian cover contains a power-of-two cycle of length at most 32

Let $B$ have vertex set $\{0,1,2,3,4\}$ and oriented edges $(0,4),(4,1),(0,2),(0,3),(1,2),(1,3),(2,3)$. This is $K_4$ with the 0–1 edge subdivided. In an abelian voltage cover, give each oriented edge a label in an abelian group $A$. Traversing the edge adds its label to the sheet coordinate and the reverse traversal subtracts it. The choice of $A$ and the labels is arbitrary.

The first four edges form a spanning tree. Translating the origin in each vertex fiber along its unique tree path sets the four tree labels to zero. The remaining three labels define a homomorphism from $\mathbb Z^3$ to $A$. Let $N$ be its kernel. A walk returns to its original sheet exactly when its signed chord count belongs to $N$. Two visits during a walk coincide exactly when their base vertices agree and the intervening signed chord count lies in $N$.

## Certificate over all kernels

At a node we know a lattice $L\subseteq N$. Start with $L=0$. The certificate gives a cyclic list of base vertices of length 4, 8, 16 or 32. Its signed chord count is in $L$, so it lifts to a closed walk. Record the base vertex and accumulated chord count before each step, omitting the repeated end. If all lifted vertices are distinct, the walk is the required simple cycle. Otherwise some repeated base vertex has a difference $d$ of chord counts in $N$. The checker establishes that $d\notin L$, and that the certificate contains the child lattice $L+\mathbb Z d$. Every possible collision is covered. Following an actual collision therefore strictly enlarges $L$ while preserving $L\subseteq N$.

The verifier reaches exactly 64 lattices. A strictly ascending chain in this finite list must terminate, so the simple-cycle outcome occurs for every kernel. The certificate contains 24 walks of length 4, 24 of length 8, 14 of length 16 and two of length 32. These are counts of certificate nodes. They do not prescribe the distribution of cycle lengths among covers. [Certificate](abelian-cert.jsonl) · [Verifier](verify.py)

For the lattice tests, the largest nonvanishing minor size gives the rank, and the gcd of all minors of that size gives the index in the saturation, by Smith normal form. When a vector is appended, its membership in the old lattice is equivalent to both quantities staying the same. Indeed unchanged rank gives the same rational span and saturation, and nested sublattices of equal finite index coincide. The checker compares differently presented child lattices by mutual membership.

## Sharpness

Take $A=\mathbb Z/19$ and assign the three oriented chords the labels $1,8,0$ in the displayed order. This yields a connected simple graph on 95 vertices. The second verifier checks an explicit simple 32-cycle and searches all simple paths on at most 16 vertices that start at their smallest vertex. It tests closure at 4, 8 and 16 vertices. Every cycle of any of those lengths would be encountered at its smallest vertex. None occurs. Thus the universal bound 32 is attained even for a cyclic cover. [Sharpness check and explicit cycle](sharpness.py)
