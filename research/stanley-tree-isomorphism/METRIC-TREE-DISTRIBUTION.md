# Global distance distributions on metric trees

Consider a nontrivial finite tree of positive total length, and give every reduced edge a positive real length. Equip the resulting metric tree with its arclength probability measure $`\mu`$. The distance of two independent arclength samples is generally a continuous random variable. Nevertheless its **one global distribution** carries exactly the same information as the signed endpoint measure
```math
\sum_{u\lt v} (\deg(u)-2)(\deg(v)-2)\,\delta_{d(u,v)}.
```
In the integer-length case the latter in turn determines the ordinary distance histogram of the unweighted subdivision. The following derivation states the normalization explicitly.

Let $`L`$ be the total length, $`B(s)=\sum_{u\lt v}w_u w_v e^{s d(u,v)}`$, and $`K(s)=\int\!\int e^{s d(x,y)}\,d\mu(x)\,d\mu(y)`$. For real $`s\ne0`$,
```math
K(s)=\frac{2}{s^2 L^2}\left[B(s)-B(0)-sL\right].
```
To see this, put $`z_e=e^{s l_e}-1`$ for an edge of length $`l_e`$. Expanding the endpoint sum gives $`B(s)-B(0)`$ as the sum of $`\prod_{e\in F}z_e`$ over all nonempty edge sets contained in a simple path. Indeed for any such set the sum of defects on each of its two extreme exterior sides is $`-1`$. Thus its coefficient is one, including when the set consists of a single edge. For a set with distinct extreme edges $`e,f`$, the intervening edges can be chosen or omitted at will. If $`D`$ is the distance between the nearer endpoints of $`e,f`$, their combined contribution to the expansion is $`z_ez_fe^{sD}`$.

With **unnormalized** arclength on each variable, integrating over two points of the same edge gives $`2(z_e-s l_e)/s^2`$. For two different edges the contribution in both orders is $`2z_ez_fe^{sD}/s^2`$, by integrating the two distances to their nearer endpoints. Summing and dividing by $`L^2`$ gives the formula. As $`s\to-\infty`$, all positive-distance endpoint exponentials tend to zero; hence
```math
\lim_{s\to-\infty}sK(s)=-2/L,\qquad
\lim_{s\to-\infty}\bigl(s^2L^2K(s)/2+sL\bigr)=-B(0).
```
These limits recover $`L`$ and $`B(0)`$ from the global distribution, and then recover all of $`B(s)`$. Distinct positive distances give linearly independent exponentials. In the other direction the first derivative of $`B`$ at zero gives $`L`$, and $`K`$ determines the compactly supported probability distribution, for example by its moments. The identity establishes the claimed information equivalence.

The trivalent reconstruction theorem consequently identifies a metric tree with generic real lengths from its global distance distribution against all finite metric trees. The finite decision and fixed-excess reduction concern the same distribution: a lower-dimensional exceptional target set lies in proper rational hyperplanes, whereas an ambiguous full-dimensional chamber contains a nonempty open family of real targets. For fixed total length one can intersect these homogeneous sets with the positive length simplex. [Trivalent certificate](PATH-DISTANCE-CERTIFICATE.md) · [Decision and integer counts](PATH-HISTOGRAM-DECISION.md) · [Fixed-excess reduction](FIXED-EXCESS-REDUCTION.md)

Mémoli and Needham study both global and local distance distributions. In Lemma 4.18 they extract the metric graph coefficient $`q=\sum_v\deg(v)^2-4\lvert E\rvert`$ from the small-radius expansion for unit total length. On a tree this is $`M-4`$, exactly the square-defect information entering the decision bound. Their Theorem 11 characterizes the cycle using a global distance distribution, and Theorem 12 establishes local injectivity for metric trees using registered local distance profiles. The bridge here uses only the distribution for one independent pair of points. Evans and Lanoue instead sample leaves and consider the joint distribution of lengths of successively spanned subtrees. These results and Gutman's discrete endpoint identities are inputs and comparisons for the research program. No separate priority claim is made for the integral identity. [Mémoli and Needham, §§4.3–4.4](https://arxiv.org/abs/1810.09646) · [Evans and Lanoue](https://arxiv.org/abs/1506.01091) · [Gutman's endpoint polynomials](https://doiserbia.nb.rs/Article.aspx?id=0561-73320530001G)
