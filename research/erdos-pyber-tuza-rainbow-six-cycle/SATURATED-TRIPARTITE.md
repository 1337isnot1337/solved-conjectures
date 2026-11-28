# Saturated tripartite interfaces contain rainbow six-cycles

**Theorem.** Partition a balanced six-color graphon into three parts $`X_1,X_2,X_3`$ of measure $`1/3`$, with colors $`A,B`$ filling precisely the within-part pairs. Suppose that, for almost every vertex, each of the other four colors sends all of that vertex's degree into just one of the two other parts. Then the graphon has positive rainbow six-cycle density. This concerns the opposite extreme from [positive interfaces](POSITIVE-TRIPARTITE.md); mixed degree profiles remain open.

Write $`t=1/6`$ and let the cross color labels be the four points of $`\mathbb F_2^2`$. We may pass to the [deterministic refinement](DETERMINISTIC.md): it preserves degrees into each part and zero rainbow cycle density.

## Saturation fixes the entire cross-color rule

Fix a cross color $`c`$. Its total edge masses between $`X_i,X_j`$ are all $`t^2`$: each part has total outgoing color-$`c`$ mass $`2t^2`$, and the three equations on the three symmetric pair masses have that unique solution. In $`X_i`$, let $`U_{ij}(c)`$ be those vertices sending their full color-$`c`$ degree into $`X_j`$. By saturation $`\mu(U_{ij}(c))=t`$. All $`c`$-edges on the interface are confined to $`U_{ij}(c)\times U_{ji}(c)`$, and since a vertex in either set already has degree $`t`$ to a set of size $`t`$, this entire rectangle is color $`c`$ up to null sets.

Each $`x\in X_i`$ sends exactly two colors into any given $`X_j`$, since its degree there is $`2t`$. The pair of colors it sends to the other part is complementary. For almost every $`x\in X_i,y\in X_j`$, the two pairs of colors they send to each other intersect in exactly one color, because the color rectangles just described partition the interface. Two pairs determining the same unordered complementary pairing have intersection zero or two, so can never occur on opposite sides of a given interface.

In each part toward a fixed neighbor, the distribution on two-element color sets gives each color marginal $`1/2`$. Hence each two-set and its complement have the same mass: if $`p_{ab}`$ is the mass of a pair $`\{a,b\}`$, comparing the sum of marginals for $`a,b`$ with the sum for the other two gives $`2p_{ab}=2p_{cd}`$. The collection of complementary pairings that a part uses is nonempty and independent of which other part is queried. These three collections are pairwise disjoint by the interface argument, so each uses exactly one of the three possible pairings, and all three are different.

Represent those pairings by the three distinct nonzero linear forms $`\pi_i:\mathbb F_2^2\to\mathbb F_2`$, each of whose fibers is one of the pairs. Write $`s_i(x)`$ for the bit of the pair used toward a fixed one of the two neighboring parts; the two bits have measure $`t`$ each in $`X_i`$. There are constants $`e_{ij}`$ with $`e_{ij}+e_{ik}=1`$ for distinct $`i,j,k`$, such that an edge of color $`c`$ between $`x\in X_i,y\in X_j`$ is characterized by
```math
\pi_i(c)=s_i(x)+e_{ij},\qquad \pi_j(c)=s_j(y)+e_{ji}.
```
The forms are distinct, so these two equations pick a unique color. All the corresponding bit rectangles are monochromatic.

## Two different kinds of four-step return

Suppose no rainbow six-cycle has positive density. Fix $`i\ne j`$ and consider four distinct cross colors on a walk alternating $`X_i,X_j,X_i,X_j,X_i`$. Choose the first two colors with the same $`\pi_j`$-bit and the last two with the other bit. Order them so the middle two have the same $`\pi_i`$-bit, which is possible because $`\pi_i,\pi_j`$ are distinct nonzero linear forms. The first and last then have the same $`\pi_i`$-bit as each other. By the monochromatic rectangles, this supplies positive-density four-step paths from any start to any end within one bit-cell of $`X_i`$; both bit-cells are available by switching the order appropriately. Such a path can only join vertices of equal $`A`$-row, since otherwise an $`A,B`$ path of length two within $`X_i`$ would close a rainbow six-cycle. Therefore $`A`$ is constant on each pair of bit-cells. Its degree $`t`$ makes it either the preserving-bit or the reversing-bit color there, with $`B`$ having the opposite rule. In particular an $`A,B`$ two-path of positive density joins any typical opposite-bit pair in $`X_i`$.

Now use the pattern $`X_i,X_j,X_k,X_j,X_i`$ with three distinct parts. Choose the middle colors $`c_2,c_3`$ having the same $`\pi_k`$-bit. They have different $`\pi_j`$-bits, and the other two colors $`c_1,c_4`$ also have different $`\pi_j`$-bits. Choose their order so $`\pi_j(c_1)=1+\pi_j(c_2)`$ and $`\pi_j(c_4)=1+\pi_j(c_3)`$. These are exactly the compatibility conditions at the two intermediate $`X_j`$ vertices, since the walks use different interfaces there; compatibility at $`X_k`$ follows from the choice of $`c_2,c_3`$. The start and end in $`X_i`$ have different bits: $`c_1+c_4=c_2+c_3`$ is the nonzero element of $`\ker\pi_k`$, so $`\pi_i(c_1+c_4)=1`$. Thus this four-step path exists with positive density between opposite-bit endpoints in $`X_i`$, and the $`A,B`$ path closes a rainbow six-cycle, a contradiction.

## Saturation into one fixed part is already enough

The conclusion also follows if there is just one fixed part, say $`X_1`$, such that almost every vertex outside $`X_1`$ sends exactly two cross colors into $`X_1`$, each with degree $`t`$. No saturation is assumed at vertices of $`X_1`$.

First, whenever all outside vertices in some family send exactly two colors into a part $`X`$, both of degree $`t`$, any two such complementary palettes that occur on positive-measure subfamilies give positive two-paths from every root in $`X`$, because the two colors cover $`X`$ from each such outside vertex. If no rainbow six-cycle exists, all endpoints of the two complementary palettes must lie in a common $`A`$-row class (as in [the positive-interface proof](POSITIVE-TRIPARTITE.md)). In particular, for almost every outside vertex with one such palette, its two color neighborhoods into $`X`$ are each entirely inside an $`A`$-row class (use a typical root in the other color). These neighborhoods partition $`X`$ into two sets of mass $`t`$; row classes have size at most $`t`$, so these are exactly the two row classes.

Apply this first with target $`X_1`$ and outside family $`X_2\cup X_3`$. The two-color palette distribution there has marginal $`1/2`$ for every color by degree balance in $`X_1`$, hence each palette and its complement have equal mass. Thus $`X_1`$ has exactly two $`A`$-row classes. Also each vertex in $`X_2`$ or $`X_3`$ is now saturated on both of its interfaces: the two colors not sent into $`X_1`$ must be sent with full degree to its remaining neighboring part. Apply the same two-path argument to the $`X_2,X_3`$ interface to obtain exactly two $`A`$-row classes on each side there as well. The complementary-palette condition holds on this single interface because the total edge mass of each one of the four colors between every pair of parts is $`t^2`$.

On the $`X_2,X_3`$ interface, all vertices of one $`A`$-row class have identical rows: for every outside $`y`$, each color neighborhood of $`y`$ is exactly one of the two row classes. Consequently the palettes sent from $`X_2`$ to $`X_3`$ are one fixed complementary pair, depending only on its two classes, and similarly for $`X_3`$. These pairings must differ, since the two palettes of the two endpoints of each edge intersect in exactly one color. Identify colors with their two independent pairing bits, and choose labels $`b(y),c(z)`$ of the two classes on $`X_2,X_3`$ so that their respective palettes *into* $`X_1`$ have first bit $`b(y)`$ and second bit $`c(z)`$. Let $`a(x)`$ be the class bit in $`X_1`$. The edge rules are
```math
\begin{array}{ll}
X_1,X_2: &(b(y),\ a(x)+o_2(y)),
\\ X_1,X_3: &(a(x)+o_3(z),\ c(z)),
\\ X_2,X_3: &(b(y)+1,\ c(z)+1)
\end{array}
```
for some measurable orientation bits $`o_2,o_3`$. Indeed the pair on each interface out of $`X_2`$ or $`X_3`$ is complementary to its pair on the other interface, and an outside vertex sends its two colors to different classes of $`X_1`$.

Take a four-step path $`X_2,X_1,X_3,X_1,X_2`$. If the endpoint $`X_2`$ vertices have opposite $`b`$-bits and opposite $`o_2`$-bits, this path can use all four cross colors: choose any middle $`X_3`$ vertex $`z`$, take opposite $`a`$-bits at the two $`X_1`$ vertices, and choose the first so that the first edge has second bit $`1+c(z)`$. Then the two middle edges exhaust the two colors of second bit $`c(z)`$, and the first and last edges exhaust the other two. This gives positive four-path density for any positive-measure choice of opposite-$`b`$, opposite-$`o_2`$ endpoints. But the $`A,B`$ two-path joins every opposite-$`b`$ pair in $`X_2`$, since its two internal colors are the preserving and reversing class rules. No rainbow six-cycle therefore forces $`o_2`$ to be constant almost everywhere: both $`b`$-classes have positive measure and their $`o_2`$-bits must agree on almost every cross pair. Similarly $`o_3`$ is constant.

It follows that at each vertex of $`X_1`$ the palette sent into $`X_2`$ is a full pair of one fixed second bit, with each color receiving degree $`t`$, and the palette sent into $`X_3`$ is a full pair of one fixed first bit, also with both degrees $`t`$. These two pairs intersect in one color, giving it degree $`2t`$ at that vertex instead of $`t`$. This contradiction proves the stronger claim.

The first proof uses saturation of all four cross colors, not a single zero degree. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870), original source [Erdős–Tuza](https://doi.org/10.1016/S0167-5060(08)70377-7), and the [missing-pair decomposition](PAIR-GRAPHONS.md).
