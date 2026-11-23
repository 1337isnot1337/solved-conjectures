# Proper measurable reconstruction in classes closed under intersection

Let $`X,H`$ be standard Borel spaces, with Borel evaluation and finite VC dimension $`d\ge1`$. Suppose the represented functions are closed under nonempty finite conjunctions. Then there is one proper learner using standard Borel output codes, with actual iid CMI at most $`197{,}216d`$ nats for every iid law and expected empirical excess at most $`583\sqrt{d/n}`$ on every sample. Its output codes represent functions of the original class, and evaluate by a Borel map. If the supplied name space itself has a universally measurable map implementing binary conjunction, the learner can return names in that space with the same rates.

The proof is by proper local reconstruction with at most $`2d+1`$ observed features. It uses the finite intersection property twice, first for positive closure and then for combining negative witnesses.

## Positive features

Fix a feasible finite trace, let $`P`$ be the set of features marked one, and let $`N`$ be the set marked zero. For a feasible set of positive requirements $`Q`$, put

```math
H_Q=\{h\in H:h(x)=1\text{ for every }x\in Q\},
\qquad
\mathrm{cl}(Q)=\{x:h(x)=1\text{ for every }h\in H_Q\}.
```

Choose an inclusion-minimal $`Q\subseteq P`$ with $`\mathrm{cl}(Q)=\mathrm{cl}(P)`$. In particular, $`H_Q=H_P`$, since imposing $`Q`$ forces every point of $`P`$. For each $`q\in Q`$, there is a hypothesis making $`q`$ zero and every other point of $`Q`$ one. If none existed, imposing $`Q\setminus\{q\}`$ would already force $`q`$, contradicting minimality. Take any conjunction of the witnesses to realize the corresponding nonempty set of zeros in $`Q`$. The all-one pattern is realized by feasibility. Thus $`Q`$ is shattered and $`|Q|\le d`$. For $`Q=\varnothing`$ the same size bound holds.

## Negative features

For every integer $`j\le d`$ fix a universally measurable proper selector $`g(Q,x)`$ of a hypothesis in $`H_Q`$ making $`x`$ zero, wherever this is feasible. Here $`Q`$ is provided as an ordered $`j`$-tuple. The finite constraints are Borel, so Jankov–von Neumann supplies the selectors. Extend by a fixed proper name outside the analytic domains. Also fix a selector $`g(Q)`$ for $`H_Q`$ alone. [Analytic selection, Kechris, Theorem 18.1](https://doi.org/10.1007/978-1-4612-4190-4)

For the trace above, $`g(Q,x)`$ exists on its feasible branch for each $`x\in N`$, and matches all positive features since it is in $`H_Q`$. When $`N`$ is empty, use $`g(Q)`$. Otherwise choose an inclusion-minimal $`J\subseteq N`$ such that the hypotheses $`g(Q,x)`$ for $`x\in J`$ together make each feature of $`N`$ zero in at least one of them. Such a $`J`$ exists because taking all of $`N`$ works. Each $`x\in J`$ has a private feature $`z_x\in N`$ made zero by $`g(Q,x)`$ and one by all other chosen witnesses. The private features are distinct.

If $`|J|=m`$, choose $`m-1`$ of the private features. Each nonempty requested set of zeros on these features is realized by conjoining their corresponding witnesses. The all-one pattern on these features is realized by the one omitted witness. Hence $`m-1\le d`$. The conjunction of the witnesses for $`J`$ therefore realizes the requested full trace and can be formed from $`Q`$ and $`J`$, requiring at most $`2d+1`$ observed features. A fixed finite index specifies the number and roles of the anchors and the order in which they are provided.

## Learner and output codes

Use as auxiliary names the standard Borel disjoint union of tuples in $`H^j`$ for $`1\le j\le d+1`$, evaluating a tuple by the conjunction of its entries. These names realize exactly the original class of functions. In particular their VC dimension is $`d`$ and each name evaluates to a proper function. The two selectors above are universally measurable, so their tuples supply the required measurable local reconstruction maps. The [named-output theorem](measurable-local-reconstruction.md) applies to the auxiliary names with $`k=2d+1`$. It bounds CMI of the actual tuple output by $`197{,}120d+32(2d+1)\le197{,}216d`$, as well as the stated empirical excess. The information bound holds for the full output code and therefore for every measurable representation determined by it. If a universally measurable binary meet operation is supplied on the original names, composing it finitely gives an original name determined by the tuple. For each iid law, take a Borel version of the postprocessing under the marginal law of the tuple. This gives the same joint law with the selector and supersample, so data processing gives the same bound in the original name space.

The dual argument works for finite unions by switching the two prediction bits. More generally, if the class of all nonempty finite conjunctions of an original class of VC dimension $`d`$ has dimension $`D`$, that conjunction class has a Borel evaluation on its finite tuple code space. The theorem then gives an actual iid learner with CMI $`O(D)`$ and empirical excess $`O(\sqrt{D/n})`$ relative to the original class, with outputs in the conjunction class.

## An obstruction to a general conjunction-closure reduction

On $`m\ge4`$ features, take the binary vectors of Hamming weight at most one or at least $`m-1`$. The VC dimension is three. Any three coordinates admit all eight traces, since either their ones or their zeros number at most one. No four coordinates admit a trace with two zeros and two ones. Choose any reference bit vector, including one outside the class, and switch coordinates where the reference is one. At least $`\lceil m/2\rceil`$ coordinates have the same reference bit. On that set, the cloud opposite to the reference bit gives the all-one vector and every vector with exactly one zero. Nonempty conjunctions realize every trace on the set. Thus the conjunction closure after any fixed bit switch has VC dimension at least $`\lceil m/2\rceil`$. The closure argument does not yield a linear-in-$`d`$ reduction for arbitrary finite VC classes.

Even a countable cover by subclasses that become closed under conjunction after their own fixed bit switches need not exist. Consider the jointly Borel class on plane lines whose hypothesis at a point predicts one on exactly the lines through that point. The VC dimension is two, as in the [category reconstruction example](category-trace-core.md#reconstruction-with-bounded-intersections-modulo-countable-differences). For any fixed bit switch and any two distinct points $`p,q`$, their switched conjunction, converted back to the original coordinates, could equal a proper hypothesis only at $`p`$ or $`q`$. Indeed, on lines where both predictors are zero it stays zero, and a third point lies on some line through neither $`p`$ nor $`q`$. Thus a switched-conjunction-closed subclass must be a chain in the switched coordinatewise order. Such a chain has at most two points. For any three in increasing order, a line through the middle point and through neither endpoint gives equal endpoint bits and a different middle bit, which is impossible in a chain after any switch. The uncountable class cannot be covered by countably many subclasses of size at most two.
