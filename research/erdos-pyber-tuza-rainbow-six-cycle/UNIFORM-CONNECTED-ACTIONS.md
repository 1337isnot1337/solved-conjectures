# Uniform rainbow-cycle density for connected compact actions

**Theorem.** For each fixed $`m\ge3`$ there is $`\delta_m>0`$ such that every balanced $`m`$-color graphon invariant under a transitive action of a connected compact metrizable group has rainbow $`C_m`$ density at least $`\delta_m`$. The bound is independent of the group, its dimension, the homogeneous space and the coloring. This strengthens [CONNECTED-COMPACT-ACTIONS.md](CONNECTED-COMPACT-ACTIONS.md), which proves positivity on each individual action. It is still a structured subcase of Erdős #811.

The point is that connected compact homogeneity, allowing the group to change, is closed under colored cut limits. The usual uncolored node-transitive closure theorem of [Lovász–Szegedy](https://arxiv.org/abs/1406.4958) does not retain a connected transitive group on its own. This argument uses squared-neighborhood features and an elementary compactness argument for homogeneous metric measure spaces. It is not a rigidity assertion about retaining one prescribed group (compare [Chirvasitu](https://arxiv.org/abs/2206.11997)).

## Neighborhood features

Suppose $`W_{n,i}`$ converges to $`W_i`$ in the simultaneous colored cut metric, $`1\le i\le m`$. Work with cut-convergent versions on one standard atomless probability space, as allowed by the finite-color case of [colored cut compactness](https://arxiv.org/abs/1010.5155). Denote their self-adjoint integral operators by $`T_{n,i},T_i`$.

Cut convergence of bounded kernels implies operator-norm convergence on $`L^2`$: for $`L^2`$-unit test functions, truncate both at level $`M`$; their $`L^1`$ tails are at most $`1/M`$, while the bounded-term pairing is at most $`4M^2`$ times the cut norm. As the operators have uniformly bounded Hilbert–Schmidt norms, it follows that
```math
\|T_{n,i}^2-T_i^2\|_{\rm HS}
\le \|T_{n,i}-T_i\|_{\rm op}\big(\|T_{n,i}\|_{\rm HS}+\|T_i\|_{\rm HS}\big)\longrightarrow0.
```
Write $`F_n(x)`$ for the vector of rows of the square kernels, in the separable Hilbert space $`\mathcal H=(L^2)^m`$, and $`F(x)`$ for its limit counterpart. Thus $`F_n\to F`$ in $`L^2`$ as $`\mathcal H`$-valued functions. Their distributions $`\nu_n,\nu`$ converge weakly via that coupling.

The feature map loses no color information in the graphon sense. Every function in the range of $`T_i^2`$ is measurable with respect to $`\sigma(F)`$, because it is a linear functional of the squared row. Since the closures of the ranges of $`T_i^2`$ and $`T_i`$ agree by self-adjointness, the same holds for the range of $`T_i`$. This implies $`W_i`$ is $`\sigma(F)`$-measurable in its first coordinate as a row-valued map, by taking inner products with a countable $`L^2`$ basis. Symmetry gives the same second-coordinate factorization. More explicitly the two commuting conditional expectation operators in the two coordinates each fix $`W_i`$, so their product does as well. Hence $`W_i`$ descends to a kernel $`\widehat W_i`$ on the feature space with distribution $`\nu`$. The same argument applies at every $`n`$. This descent preserves all colored homomorphism densities.

## Compact connected feature spaces survive the limit

For each $`n`$ let $`K_n=\mathop{\mathrm{supp}}\nu_n`$. It is a connected compact set with a transitive measure-preserving isometry group. Indeed pull the original homogeneous model back to its connected compact group; the row orbit of the squared kernels is continuous in $`L^2`$ by strong continuity of translations. The image is compact and connected, group translations act by isometries, and Haar measure has full support. Pulling back or relabeling the probability space respects these row distances.

Weak convergence makes the $`\nu_n`$'s uniformly tight. Fix $`r>0`$; cover a common compact set of mass at least $`1/2`$ by finitely many balls of radius $`r/4`$. Some such ball has mass at least a constant $`c(r)>0`$ uniformly in $`n`$, and recentering at one point of $`K_n`$ it meets gives a ball of radius $`r`$ of at least this mass. Homogeneity makes the same lower bound hold for the ball about **every** point of $`K_n`$. Using tightness again, a common compact set missing less than $`c(r)`$ of every $`\nu_n`$ meets the $`r`$-ball about each point of every $`K_n`$. Varying $`r`$ shows the union of the supports is totally bounded. Its closure is compact in $`\mathcal H`$.

Now $`K_n`$ converge in Hausdorff distance inside that closure to $`K=\mathop{\mathrm{supp}}\nu`$. A limit of points of $`K_n`$ lies in $`K`$ by the uniform positive ball bounds and weak convergence. Conversely every neighborhood of any point of $`K`$ has positive $`\nu`$-mass and then eventually positive $`\nu_n`$-mass. Compactness makes both statements uniform. In particular $`K`$ is connected, as a Hausdorff limit of connected nonempty compact sets.

## Colored homogeneity also survives

For each color form the edge measures on the common compact space squared,
```math
\Lambda_{n,i}=(F_n,F_n)_*\big(W_{n,i}(x,y)\,d\mu(x)d\mu(y)\big),
\qquad
\Lambda_i=(F,F)_*\big(W_i(x,y)\,d\mu(x)d\mu(y)\big).
```
They converge weakly. To test a product of two bounded Lipschitz functions, first replace $`F_n`$ by $`F`$ with $`o(1)`$ error using the $`L^2`$ convergence, then replace $`W_{n,i}`$ by $`W_i`$ using the cut norm. Products of these functions generate a dense subalgebra of continuous tests on the compact product, giving the claim.

For any $`x,y\in K`$, approximate them by $`x_n,y_n\in K_n`$ and choose a color-preserving group translation $`g_n`$ taking $`x_n`$ to $`y_n`$. On a subsequence the graphs of $`g_n`$ converge in Hausdorff distance in the compact product. The limiting graph is the graph of a surjective isometry $`g:K\to K`$: distance preservation gives uniqueness of the target, and both projections of the limit graph are $`K`$ by Hausdorff convergence and surjectivity before the limit. Also $`g(x)=y`$. It preserves $`\nu`$ and all $`\Lambda_i`$, by weak convergence and invariance at every $`n`$. For example, extend a continuous test on $`K`$ and its composite with $`g`$ separately to the common compact space; graph convergence shows their evaluation along $`g_n`$ differs uniformly by $`o(1)`$, proving invariance, and the same proof works on the product for the edge measures.

Thus the group of isometries of $`K`$ preserving $`\nu`$ and all the colored edge measures is transitive. It is compact metrizable: it is a closed subgroup of the isometry group of a compact metric space, so compactness also follows directly from Arzelà–Ascoli. The isometries preserve the descended kernels almost everywhere because $`\Lambda_i=\widehat W_i\,\nu^{\otimes2}`$.

The identity component of a compact group acts transitively on any connected homogeneous space of that group. Indeed if $`H`$ is a point stabilizer and $`L^\circ`$ is the identity component, $`L/(L^\circ H)`$ is a coset space of the profinite group $`L/L^\circ`$; it is totally disconnected, as images of open subgroup cosets form clopen neighborhoods. It is also a continuous image of the connected space $`L/H`$, hence is a singleton. Apply this to the isometry group above. The measure on the homogeneous feature space is the pushforward of Haar measure, by uniqueness of a transitive compact invariant probability. The limiting colored graphon therefore has the required connected compact action.

## Uniformity

If no $`\delta_m>0`$ existed, take connected compact homogeneous examples with rainbow-cycle densities tending to zero. Compactness in the simultaneous colored cut norm gives a subsequential balanced limit of rainbow-cycle density zero. The preceding argument gives a connected compact transitive color-preserving action on the limit, contradicting the [individual action theorem](CONNECTED-COMPACT-ACTIONS.md). This proves uniform positivity. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
