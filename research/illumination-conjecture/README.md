# Illumination conjecture

**Partial research.** A convex body $K$ with downward-closed fibers in a fixed positive orthant satisfies $I(K)\le 2^q I(P)$, where $P$ is its projection and $q$ is the fiber dimension. If $P$ is a parallelotope, this proves the conjectured bound for $K$, with strict inequality unless $K$ is a product of $P$ and a box. The result covers fibers that collapse along parts of the boundary of $P$. Unrestricted illumination remains open. [Issue #363](https://github.com/1337isnot1337/solved-conjectures/issues/363)

## Target and current sources

Hadwiger’s 1957 Problem 20 asks for the worst-case number of translates of a convex body $K$ whose union contains $K$ in its interior. If $0\in\operatorname{int}K$, that union then contains $(1+\eta)K$ for some $\eta>0$. Dilation by $1/(1+\eta)$ gives a cover of $K$ by smaller positive homothets. Conversely, each smaller positive homothet lies in a translate of $\operatorname{int}K$. Boltyanski’s equivalent formulation asks for directions $v$ such that every $x\in\partial K$ has $x+tv\in\operatorname{int}K$ for some $t>0$ and a chosen $v$. The conjecture bounds the least number $I(K)$ by $2^{\dim K}$, attained by parallelotopes. [Hadwiger, *Ungelöste Probleme*, no. 20](https://www.e-periodica.ch/cntmng?pid=edm-001%3A1957%3A12%3A%3A246#page=2) · [Boltyanski attribution and equivalence](https://arxiv.org/abs/2510.25968)

The November 24, 2026 source check found Gorodzha’s sharp fractional bound $2^d$ and ordinary bound with a factor of order $d\log d$, and November results on other special classes. Sun and Vritsiou’s related work uses directions chosen from coordinate supports for unconditional bodies. The construction here uses one-sided fiber monotonicity and lifts directions from an arbitrary base. A bounded search found no unrestricted resolution and did not establish priority for the lifting construction. [Gorodzha](https://arxiv.org/abs/2609.23913) · [November manuscript](https://hexagonmath.org/pdf/2611.00011v1) · [Sun–Vritsiou](https://arxiv.org/abs/2407.11331)

## Lifting illumination from the base

Let $K\subset\mathbb R^p\times\mathbb R^q$ be a full-dimensional convex body, with $p,q\ge1$, and let $P$ be its first-coordinate projection. Assume every point $(x,y)$ of $K$ has $y\ge0$ coordinatewise, and $(x,z)\in K$ whenever $0\le z\le y$. In particular $(x,0)\in K$ for all $x\in P$.

An outward normal $n$ at $(x,y)$ is a vector attaining its support maximum over $K$ there. A direction illuminates a boundary point exactly when its scalar product with every nonzero outward normal there is strictly negative. For sufficiency, take a neighborhood of the active unit normals on which the scalar products remain negative. The compact complement has a positive minimum slack in its support inequalities, so a sufficiently short step gives strict inequality for every unit normal. Necessity follows since interior points strictly satisfy every nonzero supporting inequality.

For any outward normal $(h,a)$ at $(x,y)$, a negative $a_i$ requires $y_i=0$, since reducing a positive $y_i$ would improve the support value. Replacing all negative coefficients by zero gives another outward normal $(h,a^+)$, possibly zero. For any comparison point, zeroing its negative-coefficient coordinates stays in $K$ and has the same support value as testing $(h,a^+)$. Consequently it suffices to make the scalar product negative on the nonzero normals with $a\ge0$ and to use positive vertical entries on the zero coordinates of $y$.

Choose illuminating directions $v_j$ for $P$, with $1\le j\le I(P)$. For each $j$, the set of projected points $x$ with $x+t v_j\in\operatorname{int}P$ for some $t>0$ is relatively open in $P$. These sets cover $P$, including its interior. Compactness gives compact sets $R_j$ lying within the respective open sets and covering $P$. This follows by first taking finitely many closed relative balls contained in the open sets and grouping them by $j$.

Fix $j$ and $S\subseteq\{1,\ldots,q\}$. Consider all points $(x,y)\in K$ with $x\in R_j$ and $\operatorname{supp}(y)\subseteq S$, together with their unit outward normals $(h,a)$ with $a\ge0$. This is a compact family. If $\sum_{i\in S}a_i=0$, then $a\cdot y=0$. Testing against all $(x',0)$ shows that $h$ supports $P$ at $x$. Also $h\ne0$, since a nonzero nonnegative vertical normal cannot support $K$ at value zero when $K$ is full-dimensional. Hence $h\cdot v_j<0$.

There are $\epsilon>0$ and $M>0$ such that throughout this family

```math
h\cdot v_j+\epsilon\sum_{i\notin S}a_i-M\sum_{i\in S}a_i<0.
```

Indeed, choose $\epsilon$ small enough for strictness on the compact part with $\sum_{i\in S}a_i=0$. Strictness before the term with $M$ then holds on a neighborhood of that part. On the compact remainder the sum over $S$ has a positive lower bound, so choose $M$ sufficiently large. If either part is empty, only the other condition is needed. This argument also works for the union with any compact family of additional points and their nonnegative unit outward normals, provided $h\cdot v_j<0$ whenever the sum over $S$ vanishes in the added family.

Use the lifted direction $(v_j,w)$ with $w_i=-M$ for $i\in S$ and $w_i=\epsilon$ otherwise. It illuminates every point of exact support $S$ above $R_j$. The compact family used in the argument includes smaller supports to control the limiting nonnegative normals. The exact-support condition ensures every negative normal coefficient contributes a nonpositive term, strictly negative if the nonnegative part of the normal vanishes. Running through all $j,S$ proves $I(K)\le 2^q I(P)$.

## Strict bound over a parallelotope

Assume $P=[0,1]^p$ after an affine change of base coordinates. Use one direction from each vertex into $\operatorname{int}P$. For a distinguished vertex $\xi$, the directions associated to the other vertices illuminate all projected points except $\xi$. Indeed, if a point differs from $\xi$ in a coordinate, use the inward sign of the opposite face in that coordinate and in every other coordinate use any allowable inward sign. This yields a vertex other than $\xi$ from whose direction the point enters the interior.

Let $g_i(x)=\max\{y_i:(x,y)\in K\}$. Each $g_i$ is nonnegative, concave, and attains a global maximum. Suppose first that some $g_i$ is nonconstant. Some vertex $\xi$ is below its maximum, since otherwise concavity would force the maximum everywhere. Choose $x'\in\operatorname{int}P$ with $g_i(x')>g_i(\xi)$, possible by taking a convex combination of a maximizer and an interior point with sufficiently small positive weight on the latter. Set $v_\xi=x'-\xi$. For the support $S=\{1,\ldots,q\}\setminus\{i\}$ add the whole fiber over $\xi$ to the compact normal argument. If the sum over $S$ vanishes, then $a=a_i e_i$. When $a_i>0$, testing the support inequality against $(x',g_i(x')e_i)$ yields

```math
h\cdot v_\xi\le -a_i\bigl(g_i(x')-y_i\bigr)<0.
```

When $a_i=0$, the projected inward step gives $h\cdot v_\xi<0$. The direction for this proper support therefore satisfies the strict test against nonnegative normals throughout the fiber at $\xi$.

Suppose instead that all $g_i$ are constant, say $b_i$. If $(\xi,b)\in K$ at every vertex, downward closure and convexity give $K=P\times\prod_i[0,b_i]$. Otherwise choose a vertex $\xi$ with $(\xi,b)\notin K$. By compactness of that fiber, there is $\delta>0$ such that every point in it has $y_i\le b_i-\delta$ for at least one $i$. For each $i$, add the compact part of this fiber with $y_i\le b_i-\delta$ to the normal argument for $S=\{1,\ldots,q\}\setminus\{i\}$. When the sum over $S$ vanishes, a positive $a_i$ would contradict the support inequality at $(\xi,b_i e_i)\in K$. The remaining case is $a=0$ and uses the projected inward step. Thus the directions for these proper supports together satisfy the strict test against nonnegative normals at every point of the fiber.

In both cases, the set of points satisfying the strict test for a fixed direction against all nonnegative unit outward normals is relatively open in $K$. Its complement is the projection of a compact set of violating point-normal pairs. The union for the selected proper-support directions contains the fiber over $\xi$, so it contains all fibers over a relative neighborhood $U$ of $\xi$ in $P$. This follows by projecting the compact complement to $P$. At any point of full support over $U$, no normal has a negative vertical coefficient, and a proper-support direction illuminates that point. On the compact set $P\setminus U$, use the other vertex directions, with compact subsets subordinate to their projected illumination sets, for the full-support lift. Every proper support already has its ordinary coverage by the original construction. This eliminates the full-support direction at $\xi$ and proves $I(K)\le 2^{p+q}-1$ whenever $K$ differs from the product box. In the product case distinct vertices require distinct directions because they have conflicting strict sign requirements.

## Uniform omission and scope

As a separate consequence, if the fiber coordinate maxima are constant $b_i>0$ and $(x,b)\notin K$ for every $x\in P$, compactness gives one gap $\delta>0$ as in the preceding argument, now throughout $K$. For each projected direction $v_j$, use the same added sets $x\in R_j$, $y_i\le b_i-\delta$ for its proper supports. The argument then omits every full-support direction and gives $I(K)\le (2^q-1)I(P)$ for an arbitrary base.

The general obstruction to using this construction on arbitrary $K$ is the common lower section and coordinatewise closure of its fibers. The proof imposes both on one fixed affine coordinate system. It does not give the conjectured bound without a geometric hypothesis of this kind.

## Exact cross-checks

Over $P=[0,1]^2$, take the two-coordinate fiber cut from $[0,1]^2$ by $4y_1+4y_2\le6+x_1$. Exact rational enumeration of all active-constraint bases gave 20 vertices. At each, at least one of the 12 directions with horizontal part in $\{\pm1\}^2$ and vertical part in $\{(1,1),(1,-16),(-16,1)\}$ was strictly inward at every active inequality. This checks the uniform omission when the fiber maxima are constant.

For one-coordinate fibers $0\le y\le x_1+c$, the cases $c=0,1$ give respectively six and eight vertices. Exact checks used the four horizontal parts in $\{\pm1\}^2$ with vertical component $1/4$, together with the three horizontal parts other than $(1,1)$ with component $-4$. This tests the varying-maximum argument with a collapsed fiber and with a positive fiber. Checking vertices suffices for these polytopes since every boundary point has a vertex in its smallest face with all of the point’s active inequalities.
