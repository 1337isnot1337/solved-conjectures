# Recognizing independent subdivisions at two branch vertices

Fix a pair of branch vertices joined by a path of $`h\ge1`$ edges whose internal vertices have degree two. Call these vertices the hubs. At the respective hubs let $`p,q\ge2`$ denote the numbers of branches pointing away from the joining path. These $`r=p+q`$ exterior arms are arbitrary rooted trees, rooted at the respective neighbors of the hubs. In each arm remove its chain of initial unary roots to obtain a rooted cap. Put $`L=\max_C(|C|-1)`$ over the caps, $`m=rL`$, and $`K=\max(3,L+1,m)`$. Sort the exterior arm orders as $`a_1\le\cdots\le a_r=b`$ (each order counts all vertices in that arm). Put $`d=\min(p,q)`$ and $`S=a_1+\cdots+a_d`$.

**Theorem.** If $`a_1\ge K`$, $`b\lt S`$, and $`b+m\le S`$, the ordinary chromatic symmetric function determines the tree among all finite unmarked trees. The length $`h`$ may be arbitrary. The proof recovers both hubs and their degrees, each exterior arm with its length and cap, and the division of the arms between hubs up to interchanging the hubs. The sufficient hypotheses concern the exterior lengths. For example, at two hubs each of degree three, fixed cap shapes and exterior orders $`t,t^2,t^2,t^2`$ satisfy them for all sufficiently large $`t`$. Independent subdivisions with bounded offsets from a common exterior length also satisfy them eventually. Stanley's general conjecture remains open. [Stanley’s question](https://math.mit.edu/~rstan/pubs/pubfiles/100.pdf)

Codex derived this partial theorem in the WadeDavis research session. [Independent mathematical review and prior work](TWO-HUB-SUBDIVISIONS-REVIEW.md) · [Finite checks](verify_two_hub_subdivisions.py)

Write $`n=1+h+\sum a_i`$. The ordinary invariant gives the tree forest polynomial $`U_T`$: the monomial of each edge-subset forest records its component orders, and the sign in Stanley’s power-sum expansion depends only on the number of components.

## Recovering the exterior caps and the two unmarked hubs

Root the tree provisionally at any centroid. For $`i\le K`$ the coefficient of $`x_i x_{n-i}`$ in $`U_T`$ counts the nonroot descendant subtrees (fringes) of order $`i`$. Such fringes are precisely the small sides of the corresponding single-edge cuts because $`2K\lt n`$ and each centroid branch has order at most $`n/2`$. In the target, the side of an exterior cut containing its hub has order greater than $`K`$, and both sides of a central cut have order at least $`2K+1`$. At the two scales $`B=L+1,K`$ the target consequently has exactly $`r`$ fringes of order $`B`$ and exactly $`rB`$ vertices whose fringe order is at most $`B`$. The arms each start with unary vertices above a cap of order at most $`L+1`$.

These equalities are observable and transfer to a competitor. By the two-scale argument each of its $`r`$ disjoint $`K`$-blocks consists of one $`(L+1)`$-block extended by a unary stem. Indeed at either scale the $`rB`$ vertices in the disjoint blocks exhaust the small-fringe vertices, hence contain all leaves. Every larger block then contains one smaller block by laminarity and counting. A side branch off the connecting stem would end in an uncovered leaf. The rooted forest polynomial through weight $`K`$, found by erasing the unique component larger than half the order when the remaining weight is at most $`K`$, gives the product of the $`r`$ rooted block factors through that cutoff. The [single-hub proof](HUB-SUBDIVISIONS.md) gives the computation: every fringe exterior to the blocks has order greater than $`K`$ and its top-weight term disappears in the child recurrence. The normalized block factors have degrees at most $`L`$, so the cutoff $`K\ge rL`$ recovers their full product. Its irreducible factors recover the cap multiset and $`r`$ gives the number of unit caps. These steps use the observed disjoint blocks and work with any exterior skeleton.

Subtract the degree counts of the $`K`$-blocks from the ambient degree sequence, which the ordinary invariant determines. For a cap vertex its ambient degree is its child count plus one, and added unary vertices have degree two. In the remainder exactly two vertices have degrees greater than two, with degrees $`p+1,q+1`$; all others have degree two. Contract the disjoint pendant blocks to leaves. The remaining connected tree therefore has a unique path joining those two hubs, with all other arms terminating in one contracted leaf. This forces the same unmarked skeleton in every competitor, and each exterior arm has order at least $`K`$. [Degree-sequence reconstruction, Martin–Morin–Wagner, Corollary 5](https://arxiv.org/abs/math/0609339)

## Seeing the first arms through the two-part coefficients

Let $`A_1,A_2`$ denote the sums of exterior arm orders at the two hubs. For an exterior arm of order $`s`$, the sizes at least $`K`$ of its sides directed away from its hub are exactly $`K,K+1,\ldots,s`$, with multiplicity one, because each such side lies on its unary stem or is the whole order-$`K`$ block. Orient a central cut toward the first hub. Its side orders range once each from $`A_1+1`$ to $`A_1+h`$, and the reverse orientation gives $`A_2+1,\ldots,A_2+h`$.

For $`i\ge K`$, $`i+1\lt n/2`$, let $`c_i=[x_i x_{n-i}]U_T`$, and let $`u_j`$ be the multiplicity of exterior arm order $`j`$. Then
```math
 c_i-c_{i+1}=u_i-u_{n-1-i}
 -\sum_{j=1}^2 \mathbf{1}_{i=A_j}
 +\sum_{j=1}^2 \mathbf{1}_{i=A_j+h}.
```
This follows by differencing the two oriented central intervals and the exterior tails $`\sum_{s\ge i}u_s+\sum_{s\ge n-i}u_s`$. The strict midpoint restriction counts every single-edge cut of the given sizes just once.

The first $`d`$ exterior orders are always recoverable, including on a competitor with unknown lengths. For any admissible two-hub skeleton, each $`A_j`$ is at least the sum $`S`$ of the $`d`$ smallest orders, and $`S>a_d`$ because $`d\ge2`$. Also $`n-1-b=h+\sum_{i\lt r}a_i>a_d`$. There are at least two arms of size at least $`a_d`$, and at least two other arms of order at least $`K`$, so $`2(a_d+1)\lt n`$. Consequently the observed differences equal $`u_i`$ through $`i=a_d`$. Scan them from $`K`$ upwards until the first $`d`$ lengths have been collected, trimming the final multiplicity in case of a tie. The same procedure applies to every competitor and therefore recovers $`S`$ unconditionally.

More generally all differences through $`i=S-1`$ equal $`u_i`$. Indeed $`A_j\ge S`$, $`n-1-b>S`$, and $`n=1+h+A_1+A_2\ge2S+2`$. Under $`b\lt S`$ the scan yields all $`r`$ arms on the target, so every competitor has exactly the same entire multiset of exterior orders. Now $`h=n-1-\sum_i a_i`$ is determined as well.

## Matching the caps to exterior orders

The weight-$`S`$ truncation of the product of the exterior rooted arm factors is also an observable on every recognized skeleton. Any forest in which an edge of the central path is removed has at least $`S+1`$ vertices on each side of that cut. All remaining forest components are contained in those sides. Thus it cannot have a component of order at least $`n-S`$. If the central path is intact and a component of such size exists, it must contain the path: any component avoiding the path is part of a single exterior arm and has order at most $`b\lt n-S`$, since $`n-1-b>S`$. The root component is unique because $`2S\lt n`$. After erasing this component, the remaining polynomial through weight $`S`$ is precisely the truncated product of the exterior arm factors, each arm independently attached to the intact path.

For clarity, rooted factors use $`Q_C=P_C+U_C`$, where $`P_C`$ is the rooted forest polynomial omitting the root component. Give $`x_i`$ weight $`i`$, let $`H=(1-\sum_i x_i)^{-1}`$, $`y_i=[H]_i`$ and write $`\tau_s`$ for truncation through weight $`s`$. If an arm has known size $`s`$ and cap factor $`G`$, its full factor is $`Q=\tau_s(HG)`$ with $`\deg G\le L`$. The previously recovered cap list determines all $`G`$'s. Process the largest remaining size $`j`$ and omit factors already matched by division with constant term one. In the independent homogeneous variables $`y_i`$, a size-$`j`$ factor contains $`y_j`$ only as a monic summand, and smaller factors omit it. If $`P`$ denotes the remaining product, then
```math
 \tau_m\left(H\rvert_{y_j=0}
 \left.\frac{\partial\log P}{\partial y_j}\right\rvert_{y_j=0}\right)
 =\tau_m \sum_{a_i=j} 1/G_i.
```
Here $`m\le j`$ and $`j+m\le b+m\le S`$. Multiplying by the product $`W`$ of all distinct nonunit cap factors recovers the complete linear combination of $`W`$ and the $`W/G`$'s, since their degrees are at most $`m`$. Independence follows by reduction modulo each nonunit irreducible $`G`$. Hence every multiplicity at size $`j`$ is determined. Proceed down the sizes. In the unit-only case the lengths already specify every arm. This is the finite logarithmic derivative argument of the [independent single-hub theorem](HUB-SUBDIVISIONS.md). The multiset of all fully decorated exterior arms is now known.

## Assigning the arms to the two hubs

The ordinary invariant also determines the polynomial
```math
 C_T(x,y)=\sum_{\varnothing\ne V'\subseteq V(T),\ T[V']\text{ connected}}
    x^{|V'|}y^{|\partial V'|},
```
where $`\partial V'`$ counts edges meeting the subset in exactly one endpoint. This is the subtree size and boundary distribution in Wang–Yu–Zhang, arXiv version 3, Theorem 4.2 (or select induced edge count $`|V'|-1`$ in the generalized degree polynomial of a tree). [Wang–Yu–Zhang](https://arxiv.org/html/2308.03980v3) · [Aliste-Prieto–Martin–Wagner–Zamora](https://arxiv.org/abs/2402.10333)

For a rooted arm $`E`$ with its parent included in a connected choice, set
```math
 F_E=y+x\prod_{E'\text{ branch of }E} F_{E'} .
```
The omitted arm contributes the boundary edge $`y`$. With its root included, each child branch can be chosen independently. This polynomial is monic in $`x`$ of degree $`|E|`$, equals $`x^{|E|}`$ modulo $`y`$, and has constant coefficient exactly $`y`$ as a polynomial in $`x`$. It is irreducible by Eisenstein at $`y`$ over $`\mathbb Z[y]`$. This is the attached-branch polynomial of Eisenstat, Gordon and Redlich, Definition 3.7 and Theorem 3.9, applied after adjoining a new unary root above the arm. Their theorem recovers the whole rooted arm by factoring $`(F_E-y)/x`$ into monic child factors, inductively. [Eisenstat, Gordon and Redlich, §3](https://www.davideisenstat.com/cv/EisenstatGR08.pdf)

Let $`B_1,B_2`$ be the two products of $`F_E`$ over arms at the respective hubs. Their product is already known.

Compute the contribution $`C_0`$ of connected subsets avoiding both hubs. Every such subset lies entirely in one known rooted exterior arm, or entirely inside the path of $`h-1`$ inner vertices. Its ambient boundary is computed there with the edge to the hub accounted for if the attachment vertex lies in the subset. For an internal path interval, include its two external boundary edges, allowing a hub to be the exterior endpoint. Thus $`C_0`$ is independent of the unknown allocation. The connected subsets meeting both hubs contain the whole path and contribute $`x^{h+1}B_1B_2`$. A subset meeting only the first hub takes a prefix of between zero and $`h-1`$ of the internal path vertices and has one dangling boundary edge toward the other hub. Including the analogous contribution at the other hub gives
```math
 C_T-C_0-x^{h+1}B_1B_2=x y(1+x+\cdots+x^{h-1})(B_1+B_2).
```
The sum and product determine $`B_1,B_2`$ as an unordered pair by the monic quadratic having them as roots. Unique factorization then assigns all arms to the two hubs, with repetitions. Knowing $`h`$ reconstructs the entire unmarked tree.

The allocation identity itself has no length restriction once the unmarked two-hub skeleton, full exterior arm multiset and central length are known. When every cap is a point the entire resulting tree has just two branch vertices, and Wang, Yu and Zhang already proved identification without length restrictions. Here the caps are arbitrary and may contain many additional branch vertices; the theorem addresses recognition among unpromised competitors.

## An obstruction for one-edge data

One-edge counts alone leave a genuine ambiguity outside the hypotheses. Take two exterior arms at each hub, use a common fixed cap on every arm, and let $`t`$ exceed the cap order. At the first hub use orders $`t,8t`$, at the second use $`t,t`$, and take central length $`3t`$. A second tree has $`t,5t`$ at the first hub, $`t,t`$ at the second and central length $`6t`$. These unmarked trees are distinct for large $`t`$: the short-end blocks recognize the two hubs and the unordered exterior lengths differ.

To see the coincidence, the three size-$`t`$ arms and the cap-internal cuts agree. Before folding edge sizes about $`n/2`$, the first tree's remaining path-tail and central-cut intervals are $`[1,8t]`$ and $`[2t+1,5t]`$, and the second tree's are $`[1,5t]`$ and $`[2t+1,8t]`$. Both pairs cover exactly the same sizes with the same multiplicities. For nontrivial caps replace the common initial part of the path-tail intervals by their identical cap-internal cut counts. Thus all two-part coefficients agree. The example concerns that restricted information alone.

## Distinguishing one transposition without size restrictions

At any vertex $`z`$ of degree at least three, fix all branches except two. Write $`R`$ for the product of the attachment factors of those other branches. Let $`C,D`$ be the two chosen unary-stripped caps, of orders $`d_C,d_D`$. Compare the tree in which they are assigned total arm orders $`s,t`$, respectively, with the tree in which these total orders are exchanged. Assume $`s,t\ge\max(d_C,d_D)`$, so both constructions exist. For $`Y=y/(1-x)`$ and $`N_C=x^{-d_C}(F_C-Y)`$, the difference of their connected-subset size and boundary polynomials is
```math
 xY(R-1)(x^s-x^t)(N_C-N_D).
```
The expression is computed in the rational function field; its value is a polynomial by the combinatorial identity. In particular an exchange of two distinct orders between distinct unary-stripped caps changes the ordinary chromatic symmetric function. Other branches and the two arm lengths are unrestricted.

Indeed, appending $`u`$ unary roots to $`C`$ gives an attachment polynomial $`Y+x^u(F_C-Y)`$. A connected subset containing $`z`$ contributes according to the product of all attachment factors. The difference from these subsets is $`xYR(x^s-x^t)(N_C-N_D)`$. For subsets avoiding $`z`$, the two cap-internal contributions are fixed. At each new unary vertex the contribution of subsets whose topmost vertex is that vertex is $`xy`$ times the factor of its child. Summing over those vertices gives
```math
 xy\left(uY+\frac{1-x^u}{1-x}(F_C-Y)\right).
```
The total number of unary vertices is unchanged under the swap. The surviving terms from the two extended arms give $`-xY(x^s-x^t)(N_C-N_D)`$, proving the identity. If $`d_C\ge d_D`$ and $`N_C=N_D`$, the displayed attachment recurrence makes $`F_C`$ the factor of $`D`$ with $`d_C-d_D`$ unary roots appended. Rooted completeness and the definition of a stripped cap force $`C=D`$. Since there is at least one other branch, $`R\ne1`$.

In the preceding ambiguous family, regard the second hub and its two order-$`t`$ arms as the distal cap of an arm at the first hub. Its order is $`2t+1`$. The two examples exchange orders $`8t`$ and $`5t`$ between that cap and the fixed cap on the long exterior arm. The transposition identity therefore distinguishes them using the connected-subset polynomial. The remaining open length regimes may involve more than one transposition or different hub groupings.
