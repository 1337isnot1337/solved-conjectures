# Limits of estimating a reference law from a pilot sample

Two different requirements arise when using the [known-marginal learner](known-feature-marginal.md) or [dominated-marginal learner](dominated-marginals.md) with an estimated reference law. Exact domination cannot be guaranteed by any universally measurable finite-sample reference rule, even with synthetic outputs and unrestricted information. Approximate domination of VC disagreement probabilities can require an unbounded information budget if the pilot reference puts mass only on observed points and a fixed countable library of reference laws. These statements concern the reference measure that would be supplied to the learner. [The iid learning target](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

## No finite-sample rule can supply a dominating law

Let $`X`$ be an uncountable standard Borel space. For any countably many universally measurable rules $`K_j:X^{k_j}\to\mathcal P(X)`$, with each $`k_j`$ finite, there is a single atomless probability $`\mu`$ on a Borel set $`P`$ such that for every $`j`$ and for $`\mu^{k_j}`$-almost every $`x`$,

```math
\mu(P)=1,\qquad
K_j(x)\bigl(P\setminus\{x_1,\ldots,x_{k_j}\}\bigr)=0.
```

In particular $`\mu`$ and each estimated reference law are mutually singular almost surely. The same conclusion holds if the rule outputs a random law from a universally measurable kernel. Consequently there is no positive probability of finding a dominating reference by choosing from such a countable list and any finite collection of observed subtuples.

It suffices to use $`X=[0,1]`$ by a Borel isomorphism. For each nonempty finite binary word $`s`$ choose an independent uniform $`U_s\in[0,1]`$. For an infinite binary sequence $`b`$ put

```math
f_U(b)=\sum_{m\ge1}4^{-m}\left(b_m+\frac14 U_{b|m}\right).
```

The series converges uniformly and the image lies in $`[0,1]`$. The map is continuous in the tree values and in $`b`$. It is injective in $`b`$ for each fixed $`U`$. At the first difference at index $`m`$, the order-one bit difference after accounting for both displacements is at least $`(3/4)4^{-m}`$, while the total possible tail difference is at most $`(5/12)4^{-m}`$. The image $`P_U`$ of the full binary space is compact. It has Lebesgue measure zero since the $`2^m`$ cylinders at depth $`m`$ each have image in an interval of length at most $`(5/12)4^{-m}`$. The fair binary product law pushed forward by $`f_U`$ gives an atomless probability $`\mu_U`$ carried by $`P_U`$.

Draw an infinite sequence of independent fair binary paths $`B^i`$ independently of $`U`$, and set $`X_i=f_U(B^i)`$. Conditional on $`U`$, the $`X_i`$ are iid from $`\mu_U`$. Fix a rule $`j`$ and a word $`s`$. On the event that no path among the first $`k_j`$ has prefix $`s`$, the inputs $`X_1,\ldots,X_{k_j}`$ are unchanged when $`U_s`$ varies. Holding all the other tree values and the paths fixed, the whole image $`P_{U,s}=f_U([s])`$ of the cylinder with prefix $`s`$ is the translate of a fixed compact Lebesgue-null set by $`4^{-|s|}U_s/4`$. For any point $`y`$ the set of values of $`U_s`$ putting $`y`$ in this translate has measure zero. Integrating first in $`y`$ against the fixed output probability $`K_j(X_1,\ldots,X_{k_j})`$ shows that this output assigns zero mass to $`P_{U,s}`$ for almost every $`U_s`$ on the unvisited event.

These integrations use completed product laws. To see the measurability explicitly, the compact cylinder image varies continuously in $`U`$ in the Hausdorff topology by uniform convergence. Evaluation of a probability on a variable compact set is Borel by measurable integration of its membership indicator. On the unvisited event the reference law can be evaluated with $`U_s`$ set to zero, so it is a universally measurable function of the remaining variables. Taking a Borel version under their joint law justifies Fubini on the completed product with $`U_s`$.

With probability one, this zero-mass conclusion holds for every unvisited word $`s`$ and every rule $`j`$. Every other binary path has a prefix that is not visited by the finitely many sampled paths. Injectivity gives the desired covering of $`P_U\setminus\{X_1,\ldots,X_{k_j}\}`$ by these unvisited cylinder images. Fubini in the tree values therefore yields one fixed $`U`$ for which the conclusion holds for all $`j`$ under their iid input laws. Any repeated use of a rule on subtuples of a larger sample is covered by taking a countable intersection over input position tuples. The conclusion also applies to randomized rules by first applying it to each rule's mean probability measure. The mean is universally measurable by kernel integration. Zero mean mass on the specified set implies zero mass with probability one under the rule's private randomness.

## An information lower bound for references supported on pilot points

Consider the following one-sided approximation condition on a reference probability $`R`$ for a feature law $`P`$:

```math
P\{h\ne h'\}\le C R\{h\ne h'\}+\epsilon
\qquad (h,h'\in H)
\tag{1}
```

where $`C`$ is finite. There is a jointly Borel VC-one class such that the following holds. Fix any countable library of feature laws, independent of the unknown feature marginal. Suppose that, outside the selected pilot points, the released reference $`R`$ is absolutely continuous with respect to a fixed probability that is a mixture of the library. There is an atomless feature law $`P`$ for which, if (1) holds with probability at least $`q`$ and $`0<\epsilon<1`$, then the pilot's released-reference information satisfies

```math
I(R;S\mid W)\ \ge\ q(\epsilon^{-1}-1)\log 2 .
\tag{2}
```

Here $`W`$ is an iid paired pilot pool of size $`p`$ with a fair independent selector $`S`$, and the reference uses only the selected pilot and independent randomness. In particular if $`q`$ is an absolute positive constant and $`\epsilon=O(p^{-1/2})`$, the CMI of the reference is $`\Omega(\sqrt p)`$.

Take $`X=[0,1]^2`$, the zero predictor, and the predictors

```math
h_{u,t}(v,x)=1_{\{v=u,\ x\le t\}}
\qquad (u,t\in[0,1]).
```

Within one fiber these are thresholds, and points from two different fibers can never both be positive. Thus the class has VC dimension one. Choose a fiber $`u_0`$ with probability zero under each measure in the fixed library, which is possible since each first-coordinate marginal has at most countably many atoms. Let $`P`$ be uniform on this fiber in its second coordinate. All reference mass in that fiber lies at selected pilot points. Write $`M`$ for the number of these points with positive reference mass. Between their ordered second coordinates and the endpoints there are $`M+1`$ gaps of total length one. Within any such gap an interval disagreement of two thresholds has reference mass zero. Approximate the whole gap from within by these intervals in (1) to get $`M\ge\epsilon^{-1}-1`$ on success.

On the paired iid experiment the $`2p`$ feature values are distinct almost surely. Given $`W,R`$, the $`M`$ atoms in the fiber identify $`M`$ distinct rows and their selected bits. The set of identified rows and the bits are measurable functions of $`W,R`$, by evaluation of mass at a variable singleton. Conditional entropy of the selector is therefore at most $`(p-M)\log 2`$ given those values. Since $`H(S\mid W)=p\log 2`$, this proves $`I(R;S\mid W)\ge\mathbb E[M]\log 2`$ and hence (2).

Exact domination is too strong even for an unrestricted finite pilot reference. The approximate lower bound applies when the measure is released or charged in the CMI proof and its novel support consists of selected observations. A learner can hide its reference, select hypotheses directly from a local catalogue, or use sample-dependent synthetic support. The inequalities above give no lower bound on the final proper hypothesis for those mechanisms.
