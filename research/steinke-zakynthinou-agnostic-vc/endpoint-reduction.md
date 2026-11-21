# A two-endpoint reduction for agnostic learning

**Theorem.** On a finite or countably infinite instance domain, every binary class of VC dimension one has a proper distribution-independent learner with constant original conditional mutual information and expected empirical excess $`O(1/\sqrt n)`$ on every ordered sample. Both constants are uniform over all such classes. The proof reduces the class to the [agnostic real-threshold theorem](../../results/steinke-zakynthinou-thresholds/PROOF.md) using one random endpoint per observation. This is a partial result toward Steinke and Zakynthinou’s US$500 Conjecture 6. It earns no separate prize under the published terms. [Sponsor statement, §2.3–3](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf) · [Coordination](https://github.com/1337isnot1337/solved-conjectures/issues/240)

## A common order on the hypotheses

Fix a class $`H`$ and one member $`h_0`$. For each finite subset of the instance domain and each restriction realized there, retain one representative hypothesis. These choices and $`h_0`$ give a countable core $`H_c`$ attaining exactly the same optimum on every individual finite sample. The sets $`D_x=\{h\in H_c:h(x)\ne h_0(x)\}`$ are laminar. If two of them intersected with both differences nonempty, their three regions and $`h_0`$ would realize the four possible labelings of the two points. This structure, and its application to ordering a countable proper core, are known. [Ben-David](https://arxiv.org/abs/1507.05307) · [Zhang, §6 and Supplement I.5](https://arxiv.org/abs/2610.25062)

Order $`H_c`$ with $`h_0`$ first so that every $`D_x`$ is convex. Here is an existence argument. For any finite subset of hypotheses, the restrictions of the $`D_x`$'s are a finite laminar family. Adjoin the singletons and the full set; a depth-first ordering of its inclusion tree makes all sets consecutive. Put the root's child containing $`h_0`$ first (the singleton if there is more than one hypothesis). In the compact product of binary pairwise order comparisons, total-order axioms, convexity constraints, and the requirement that $`h_0`$ is first are closed constraints. The finite construction satisfies any finite collection, so all hold together. Append a distinct final copy of $`h_0`$, giving an extended order $`E`$; the copy has the same predictions.

Give the elements of $`E`$ fixed strictly positive weights summing to one. Represent an element $`h`$ by its interior coordinate $`s(h)`$, the weight strictly below it plus half its own weight. Represent any initial segment by its total weight. For a nonempty interval $`D_x`$, let $`a_x,b_x`$ represent the initial segments strictly before it and through it, respectively. The first and last copies of $`h_0`$ put both cuts strictly between zero and one. For an empty $`D_x`$, take $`a_x=b_x`$ at the cut just after the first $`h_0`$. For every $`h\in E`$,
```math
 1[h\in D_x]=1[s(h)\ge a_x]-1[s(h)\ge b_x].
```
Crucially, between any two distinct cut coordinates used here, including the outer sentinels zero and one, lies an interior coordinate of an actual element of $`E`$. The initial segments are nested, and a member of their nonempty difference has its interior strictly between the coordinates.

## Encoding the loss by one random endpoint

For an observed pair $`(x,y)`$, let $`b=1[h_0(x)\ne y]`$, $`\sigma=1-2b`$. The loss of $`h`$ is $`b+\sigma(1[s(h)\ge a_x]-1[s(h)\ge b_x])`$. There are two possible threshold examples, at features $`-a_x`$ and $`-b_x`$. Give them signs $`\sigma`$ and $`-\sigma`$ respectively, and label a positive-sign example zero and a negative-sign example one. A real threshold with parameter $`-v`$ predicts $`1[v\ge c]`$ on feature $`-c`$. Write $`l_0(v),l_1(v)`$ for its binary losses on the two possible examples. Then
```math
 l_0(s(h))+l_1(s(h))=1+\ell(h;x,y)-b.
```
Independently choose either endpoint with probability one half for each sample row. Train the proper real-threshold learner on these $`n`$ transformed observations and let $`v`$ be minus its output parameter.

Decode $`v`$ using the selected endpoint values. Take the largest selected cut at most $`v`$ and the smallest selected cut greater than $`v`$, using zero and one as respective defaults. Their coordinates are strictly ordered even when $`v`$ is outside the unit interval. Choose the first element in a fixed enumeration of $`E`$ whose interior lies strictly between them, and identify the appended copy with $`h_0`$ after decoding. The interior chosen before identification has exactly the same predictions as $`v`$ on the selected synthetic features. Its original predictions after identification remain the same. The algorithm uses only its input, its private coins and the fixed class. On a countable instance domain the fixed lookups and the finite comparisons used here are measurable.

## Accuracy on every fixed sample

Fix the original labeled sample. Write $`L(h)`$ for its total loss, $`\widehat U(h)`$ for the sum of its selected synthetic losses at $`s(h)`$, and $`U(h)=\mathbb E\widehat U(h)`$. The last displayed identity gives $`2(U(h)-U(g))=L(h)-L(g)`$. Temporarily keep the two copies of $`h_0`$ distinct in the supremum over $`E`$.

The expected supremum of $`|\widehat U-U|`$ is at most $`3\sqrt n`$. Indeed the centered sum is $`\tfrac12\sum_i\epsilon_i(l_{i,0}-l_{i,1})`$ for independent fair signs $`\epsilon_i`$. For either choice of endpoint the loss on row $`i`$ is a fixed bit plus a fixed sign times $`1[v\ge c_i]`$. The signed sum of the bits has expected absolute value at most $`\sqrt n`$. As $`v`$ moves, the signed sum of the indicators ranges over prefixes of independent fair signs in order of $`c_i`$. Its expected maximum absolute value is at most $`2\sqrt n`$ by the $`L^2`$ maximal inequality for martingales. Equal endpoints only omit possible prefixes. Apply the triangle inequality to the two processes and divide by two.

On each synthetic sample the expected total loss of the base learner is within $`C_L\sqrt n`$ of the minimum, where $`C_L`$ is its universal threshold constant. Its decoded element retains that synthetic loss. Comparing with an original optimal element, taking expectations and using the supremum twice gives total excess at most $`2(C_L+6)\sqrt n`$. The conclusion holds for each fixed original sample.

## Information in the proper output

Give all entries of the original paired iid pool $`T`$ independent fair endpoint coins $`U`$. The transformed pool $`T'`$ is iid. Given $`T,U,S`$, the base output uses only $`T'_S`$ and independent algorithm coins. Since the selector is independent of both pools and the endpoint coins,
```math
 I(v;S\mid T,U)=I(v;S\mid T')\le C_I.
```

For the lower decoded boundary, list all distinct full-pool cuts at most $`v`$ in decreasing order. For the upper boundary list the cuts strictly greater than $`v`$ in increasing order. Record in each list the rank of the first selected cut or the position immediately following the list if none is selected. These two ranks and $`v,T'`$ determine the actual proper hypothesis.

For either rank $`K`$, preserve the joint marginal of $`v,T,U`$ and independently redraw the selector. Under this comparison law the chance that $`K>k`$ is at most $`2^{-k}`$: avoiding the first $`k`$ distinct cuts requires avoiding at least $`k`$ different pool entries. If any selector pair is entirely forbidden the event is impossible; otherwise at least $`k`$ independent bits are forced. With $`\lambda=(\log2)/2`$, this gives $`\mathbb E_{\rm ref}e^{\lambda K}\le1+\sqrt2`$. The KL cost of restoring the true selector is $`I(v;S\mid T,U)`$. The entropy variational inequality and comparison to the geometric code proportional to $`e^{-\lambda k}`$ give
```math
 H(K\mid v,T,U)\le C_I+2\log(1+\sqrt2).
```
The two ranks may be dependent; subadditivity suffices. Their inclusion gives CMI at most $`3C_I+4\log(1+\sqrt2)`$. Finally $`I(S;U\mid T)=0`$, so revealing the auxiliary coins in the analysis also bounds the CMI conditional on the original pool alone.

## Where the reduction stops

The organizing structure here is the interval representation on a common order of hypotheses. VC dimension alone does not give a dimension-only bound on the number of changes per observation in such an order. For example, use two disjoint chains of $`m`$ threshold tests apiece, with independent thresholds on the chains. There are $`(m+1)^2`$ distinct hypotheses and VC dimension two. Any listing changes at least one of the $`2m`$ predictions at each step. Some test therefore changes at least $`((m+1)^2-1)/(2m)`$ times. A bounded list of signed endpoints for each feature cannot handle this entire family in one order. The full arbitrary-dimension prize remains open in this work.
