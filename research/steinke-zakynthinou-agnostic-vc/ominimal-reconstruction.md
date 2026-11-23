# Proper linear reconstruction in tame parameter spaces

Suppose a jointly Borel binary class $`H`$ on standard Borel spaces has VC dimension $`d\ge1`$. Assume its predictions are given in a finite-dimensional o-minimal presentation as follows.

- There is a Borel parameter map $`\theta:H\to V_0\subseteq\mathbb R^m`$, where $`V_0`$ is definable of dimension $`p`$ in a fixed o-minimal expansion of the real field.
- A feature gives a formula tag from a countable list and a finite tuple of real coefficients. These data are Borel functions of the feature. For each tag the formula specifies a definable set in the parameter and coefficient variables, and a hypothesis predicts one exactly when its parameter belongs to the instantiated set.

There is a countable universally measurable proper catalogue realizing every finite trace with at most $`p`$ observed features per candidate. This gives one proper learner with actual iid CMI at most $`197{,}120d+32p`$ nats and expected empirical excess at most $`583\sqrt{d/n}`$ for every sample. In particular this gives the two conjectured rates if $`p=O(d)`$. The parameter image $`\theta(H)`$ may be an arbitrary Borel restriction, or the image of a Borel parametrization. The stated definability assumptions concern the ambient decision formulas. [Local reconstruction theorem](measurable-local-reconstruction.md) · [Conjecture 6](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

The feature budget is related to [Johnson and Laskowski's extended compression for o-minimal families](https://doi.org/10.1007/s00454-009-9201-3). Here the side information is countable, the decoder selects actual proper names even after arbitrary Borel parameter restrictions, and the resulting learner has a whole-output information bound.

## Each extra feature reduces the remaining dimension

For a feature $`x`$ let $`D_x`$ be its definable positive decision set in ambient parameter space. For a definable set $`V`$ and a definable $`A\subseteq V`$, its relative boundary is

```math
\partial_V A=V\cap\overline A\cap\overline{V\setminus A}.
```

It is definable uniformly in the defining parameters of $`V,A`$. It is contained in $`(\overline A\setminus A)\cup(\overline{V\setminus A}\setminus(V\setminus A))`$, which has dimension strictly below $`\dim V`$ whenever the boundary is nonempty. This uses the strict dimension drop for the frontier of a definable set and the maximum rule for dimensions of finite unions. Fixed definable families, including these boundary families, are Borel by cell decomposition. [Coste, *An Introduction to O-minimal Geometry*, cell decomposition and Theorem 3.22](https://perso.univ-rennes1.fr/michel.coste/polyens/OMIN.pdf)

Now fix a finite sample of features and a proper hypothesis $`h_*`$ realizing the target trace. Begin with $`V_0`$, which contains $`\theta(h_*)`$. If the predictions of all sample features are locally constant at $`\theta(h_*)`$ relative to the current $`V`$, stop. Otherwise choose a sample feature $`x`$ where local constancy fails and replace $`V`$ by $`\partial_V(V\cap D_x)`$. This retains $`\theta(h_*)`$ and decreases dimension. After at most $`p`$ steps, local constancy holds for all features. Because the sample is finite, a single basic rational open ball containing $`\theta(h_*)`$ then suffices to preserve all predictions on intersection with the final $`V`$.

For reconstruction, list all boundary sequences of length at most $`p`$ made from the observed anchors. The order, feature-reuse indices and chosen rational ball are countable side information. The actual catalogue reads a subtuple of distinct positions, and a step can reuse one of those positions. Given fixed tags for the instantiated formulas, membership in the resulting parameter set and ball is Borel jointly in the coefficients and the parameter. Tags range over a countable discrete set, so the relation with the supplied feature anchors stays Borel. Analytic uniformization supplies a universally measurable proper name whose parameter belongs to that set whenever one exists, with a fixed proper default otherwise. In the sequence constructed from $`h_*`$ the set has a realization, and every selected realization has the desired full trace. The usual catalogue theorem now gives the information and empirical bounds.

For instance, affine halfspaces on $`\mathbb R^m`$ and arbitrary Borel restrictions of their parameter space are covered. Normalize their nonzero affine coefficient vectors into the unit sphere in $`\mathbb R^{m+1}`$, and keep the zero vector separately. Positive rescaling preserves the decision test, and the ambient set then has dimension $`p=m`$. This also applies after any fixed Borel feature map into $`\mathbb R^m`$. The same argument covers any fixed family of semialgebraic decision formulas on a $`p`$-dimensional ambient parameter set. It also covers countably many Borel parameter charts with a common dimension bound by taking the union of their catalogues.

## Affine tests in separable parameter spaces

There is also a local rank bound that allows infinite-dimensional ambient parameter spaces. Let $`\theta:H\to E`$ be Borel into a separable real Banach space. Assume the decision at a feature is a specified function of the signs of finitely many continuous affine scores on $`E`$, where zero is a separate sign. The score evaluations and the finite lists are Borel in the feature and the parameter. Suppose for each proper parameter and each finite feature tuple that the linear parts of the scores vanishing at that parameter span a space of dimension at most $`k`$. Then an exact proper catalogue reads at most $`k`$ features.

At a target parameter, choose a basis among these tight linear parts. The equalities for that basis imply every other tight equality, because all the scores in question already vanish at the target. Every nontight score has a fixed sign near the target by continuity. From the observed features carrying the basis, list proper parameters in every basic open set intersected with the corresponding affine equalities, selecting names by analytic uniformization. The countable basis of $`E`$ and the finite score-index choices supply countable side information. One such list entry preserves every sign on the full sample. As before, repeated basis scores carried by one feature use just one observed position.

For a class of single affine threshold tests with an open parameter image $`\theta(H)\subseteq E`$, the tight rank is automatically at most $`d`$, its VC dimension. Indeed if $`k`$ independent tight linear parts occur at a parameter $`z`$, their joint linear map onto $`\mathbb R^k`$ is surjective. Choose preimages of the standard basis. Small signed sums of those preimages added to $`z`$ stay in the open parameter image and realize all strict sign patterns on the $`k`$ features. Hence they are shattered. This gives both conjectured rates for the open-parameter affine class, even in separable infinite-dimensional ambient spaces, whenever its VC dimension is finite.

## A VC-one class outside all such countable charts

The finite-dimensional presentation assumption can fail even at VC dimension one. Let $`Z=2^{\mathbb N}`$ and $`E_0`$ be equality except at finitely many coordinates. On $`X=Z\times\{0,1\}`$ use the zero classifier and the distinct names $`h_y`$ for $`y\in Z`$ with

```math
h_y(x,0)=1_{\{x\,E_0\, y\}},\qquad
h_y(x,1)=1_{\{x=y\}}.
```

Evaluation is Borel. Two orbit tests either always agree or cannot both be positive. Two distinct private tests cannot both be positive, and a positive private test determines the orbit-test bit. Thus no pair is shattered, while one feature is. This class has a direct one-feature catalogue: an orbit feature gives a countable list of its finite modifications, a private feature gives its name, and zero is available.

Suppose there were countably many Borel tame parameter charts covering the names. Some chart contains a nonmeager Borel set of keys $`y`$. Choose a nonempty clopen cylinder $`U\subseteq Z`$ on which those keys are comeager. Extend that chart's parameter map to all of $`Z`$ with a fixed default. A Borel map into a separable metric space restricts to a continuous map on a comeager subset. Remove the saturation under finite bit flips of its exceptional set and of the meager set of keys in $`U`$ missing from the chart. The remainder $`C`$ is comeager and invariant under finite flips. Every orbit through $`C\cap U`$ is dense there, and there is more than one such orbit. [Continuity on a comeager set, Kechris, Theorem 8.38](https://link.springer.com/book/10.1007/978-1-4612-4190-4)

Fix $`x\in C\cap U`$ and the chart's definable decision set $`D`$ for the orbit feature $`(x,0)`$. Put $`K=\theta(C\cap U)`$. Continuity implies that $`K\cap D`$ and $`K\setminus D`$ are both dense in $`K`$. They are the images of the orbit of $`x`$ and its complement within $`C\cap U`$, which are both dense there. Thus for every definable $`V`$ containing $`K`$, the relative boundary $`\partial_V(V\cap D)`$ contains all of $`K`$. Iterating this same boundary starting from the chart's $`V_0`$ gives a strictly decreasing dimension at every step while retaining nonempty $`K`$. This is impossible. The o-minimal catalogue theorem therefore needs a real structural premise even when the VC dimension is small.
