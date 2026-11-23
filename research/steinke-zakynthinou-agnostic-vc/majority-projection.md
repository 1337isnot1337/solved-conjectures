# Proper reconstruction by measurable vote projection

A measurable projection from high-agreement votes gives a proper catalogue learner with the conjectured empirical rate and substantially fewer feature reads than the general proper catalogue. Existence of projections as functions of votes is a separate issue from their measurability. Even a pointwise compact, majority-closed VC-one class with distinct standard Borel names can have a non-Borel majority operation. Universal measurability of that operation for every such class is equivalent to universal measurability of all boldface $`\Delta^1_2`$ sets.

## Proper learning from a measurable projection

Let $`H`$ be a jointly Borel VC class of dimension $`d\ge1`$ on standard Borel spaces. Put $`r=\max(1,\operatorname{VC}(H^*))`$. Suppose for an integer $`p\ge2`$ that there is a universally measurable map from each finite list of proper hypotheses to a proper name that agrees with their vote wherever strictly fewer than a fraction $`1/p`$ of the list disagree with it. This is the measurable version of the [projection-number condition](https://proceedings.mlr.press/v125/bousquet20a.pdf). Then there is one distribution-independent proper learner with expected empirical excess $`O(\sqrt{d/n})`$ on every sample and whole-output fixed-pool information and actual iid CMI at most

```math
O\!\left(
d+d p^2\log(ep)\min\{r\log(ep),\log(en/d)\}
\right).
```

The constants in this inequality are universal.

Use universally measurable base maps choosing any proper realization of a finite supplied trace, with a fixed proper default when infeasible. Fix a full feature tuple and an original feasible trace on it. For every distribution on its positions, a disagreement-set epsilon net of size at most $`s=O(dp\log(ep))`$ ensures that the selected base map on that labeled subtuple has error at most $`1/(4p)`$. This follows from the ordinary [VC epsilon-net argument](approximate-catalogues.md#removing-a-loss-weight) at radius $`1/(4p)`$ for the disagreements with a fixed proper realization of the trace. The same proof is for any finite sampling distribution on the positions. Taking the finite minimax over all base-map outputs on eligible subtuples gives a mixture for which each position has error probability at most $`1/(4p)`$.

There are two ways to sample a finite odd vote from this mixture. With $`a=O(p\log(en/d))`$ draws, the expected fraction of positions where at least $`1/p`$ of the votes are wrong is $`O(\sqrt{d/n})`$. For a fixed position, the exponential moment of its mistake count at unit parameter is at most $`\exp((e-1)a/(4p))`$. Hence the probability of this event is at most $`\exp(-a/(2p))`$. Choose the universal constant in $`a`$ sufficiently large and average over positions. At least one vote thus has the stated error fraction after projection.

Alternatively $`a=O(rp\log(ep))`$ draws suffice for an exact projected trace. The error tests at positions of the tuple form a class of VC dimension $`v=O(r)`$ on the finite set of base-map outputs, since they are dual tests and their complements. For a set of mixture mass at most $`1/(4p)`$ whose first sample count is at least $`a/p`$, an independent ghost count is at most $`a/(2p)`$ with probability at least half by Markov's inequality. Conditional on a joint pool of pairs, randomly swap the two members of each pair. For any fixed pooled trace of size $`K`$ whose two counts meet these bounds, $`K\ge a/p`$ and their difference is at least $`K/3`$. This difference is a sum of at most $`K`$ independent fair signs. Its upper tail has probability at most $`\exp(-K/18)`$. The Sauer bound on the $`2a`$ positions gives overall failure probability at most

```math
2\exp\bigl(v\log(2ea/v)-a/(18p)\bigr).
```

This is less than one for sufficiently large absolute constant in $`a=O(vp\log(ep))`$. Thus some vote has fewer than a fraction $`1/p`$ errors at every position, and its projection realizes the target trace exactly.

For the catalogue, use whichever vote-length bound is smaller. Include the projected outputs from all votes with that length of base maps, using all eligible subtuples and proposed labels. A single reconstruction reads at most $`as`$ observed features, with constituent subtuples and labels given by countable side information. All maps are universally measurable by composition, and a fixed proper candidate may always be included. The above reasoning works for every feasible trace on every full tuple, so it also works for an empirical minimizer with any supplied labels. The [linear-information catalogue theorem](hidden-restriction-marks.md) gives the bound and returns a proper name in the original space. The output vote itself and its components need not be released.

## Pointwise majority can require a nonmeasurable name

Let $`Z=2^{\mathbb N}`$ and let $`A\subseteq Z`$ be any boldface $`\Delta^1_2`$ set. Thus both $`A`$ and its complement are projections of coanalytic relations on $`Z\times\mathbb N^{\mathbb N}`$. By the Novikov–Kondô uniformization theorem take coanalytic relations $`U_0,U_1`$ with singleton sections on their respective domains $`A,Z\setminus A`$ and empty sections elsewhere. Since their complements are analytic there are Borel sets $`B_e\subseteq Z\times(\mathbb N^{\mathbb N})^2`$ for $`e=0,1`$ such that

```math
(x,y)\notin U_e
\quad\Longleftrightarrow\quad
\exists z\ (x,y,z)\in B_e .
```

[Coanalytic uniformization, Kechris, Theorem 36.14](https://link.springer.com/book/10.1007/978-1-4612-4190-4)

Use a standard Borel name space containing a zero name, auxiliary names $`u_{x,j}`$ for each key $`x\in Z`$ and $`j\in\mathbb N`$, and one name $`h_{x,e,y}`$ for each $`x,e,y`$. Use the following disjoint types of features:

- One base feature $`c_x`$ for each key $`x`$.
- A private auxiliary feature $`a_{x,j}`$ for each auxiliary name.
- A test feature $`t_{x,e,y,z}`$ for each tuple of its indices.

The zero name predicts zero everywhere. Auxiliary hypothesis $`u_{x,j}`$ is positive at $`c_x,a_{x,j}`$ only. Hypothesis $`h_{x,e,y}`$ is positive at $`c_x`$ and at the features $`t_{x,e,y,z}`$ with $`(x,y,z)\in B_e`$. All tests use Borel equalities and the Borel sets $`B_e`$, so evaluation is jointly Borel. Each nonzero name is positive at exactly one base feature, and its remaining positive features are disjoint from those of every other name. For each $`x`$ precisely one name $`h_{x,e,y}`$ is positive only at $`c_x`$, with $`e=0`$ exactly when $`x\in A`$. Thus all prediction functions in the name space are distinct.

This class has VC dimension one. Two features from different keys cannot be simultaneously positive. At a single key, a positive non-base feature forces the base to be positive. Two non-base features that can both be positive are positive under the same unique hypothesis, so cannot be shattered. A base feature alone is shattered using zero and an auxiliary hypothesis.

The class is closed in the product prediction topology. Any pointwise closure element with a positive non-base feature must equal the unique hypothesis positive there, by testing it on that feature together with any other position. A closure element with all non-base features zero may have at most one base feature positive, and all those possibilities already belong to the class. The class is also closed under odd majorities. Such a majority either uses no key with a strict majority of names and returns zero, or it predicts positive at the base of one key. In the second case it either has a strict majority for one nonzero name and returns that name's function, or it returns the base-only function at that key. Any non-base feature with a strict majority requires a strict majority of its unique positive name.

These properties give dual Helly number at most two, including for infinite partial labelings. If every pair of requirements is feasible, every finite collection is feasible by induction. To pass from $`m-1`$ to $`m\ge3`$, choose three hypotheses fitting the constraints with three different individual positions omitted, then take their majority. For an infinite set, finite feasibility gives a common realization by product compactness of the class.

Fix any finite $`p\ge2`$ and take an odd number $`a>p`$ of distinct auxiliary names at key $`x`$. This tuple depends Borel measurably on $`x`$. Its majority is the base-only function at that key, and every feature has disagreement fraction at most $`1/a<1/p`$. A high-agreement projection must match the majority everywhere and hence return its unique proper name. Reading the name's Borel tag $`e`$ decides membership in $`A`$. This excludes a Borel projection for every finite $`p`$ in ZFC by taking an analytic non-Borel $`A`$. In particular the ternary majority operation is non-Borel. If there is a $`\Delta^1_2`$ set that fails universal measurability, it excludes universal measurability of these projections as well. Such sets exist, for example, under $`V=L`$. [Jech, Set Theory, Corollary 25.28](https://fa.ewi.tudelft.nl/~hart/onderwijs/set_theory/Jech/25-descriptive_set_theory.pdf)

Conversely, the graph of the exact odd majority operation for any jointly Borel majority-closed class with unique names is coanalytic, since it tests agreement at every feature. It is total and single-valued. The inverse image of any Borel set of names and its complement are both projections of coanalytic sets, hence are $`\Delta^1_2`$. If all boldface $`\Delta^1_2`$ sets are universally measurable, the operation is universally measurable. The same sufficient regularity condition gives high-agreement projection maps whenever the sections are nonempty, by applying coanalytic uniformization first.

The obstruction concerns exact pointwise vote projection into the given name space. In the same example a positive non-base sample feature supplies its unique proper name. If the trace's only positive feature value is $`c_x`$, use any auxiliary name at key $`x`$ whose private feature is absent from the sample. Include all auxiliary indices as countable side information. Zero realizes the all-negative trace. This gives a Borel one-feature catalogue and both learning rates in this very class.

If the output convention allows a new Borel code for a function in the original class, odd majority closure also gives a direct use of the vote code. Use the standard Borel space of odd vote tuples, with majority evaluation. Its prediction class is exactly $`H`$ because every vote is proper as a function and repetitions give every original hypothesis. Apply the catalogue proof above at $`p=2`$ directly to these codes, obtaining CMI $`O(d(1+\min\{r,\log(en/d)\}))`$ and the original empirical rate. This bounds the information in the vote code. Recovering the original name is the separate operation that the example obstructs.
