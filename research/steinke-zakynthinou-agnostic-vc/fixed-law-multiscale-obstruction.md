# A single VC-one class and iid law with arbitrarily slow necessary empirical accuracy

There is a fixed VC-one class of distinct measurable classifiers and a fixed labeled iid law $`D`$ for which every proposed universal constant in the empirical requirement of Conjecture 6 fails at arbitrarily large sample sizes under completed measurability. This conclusion for proper learners uses only measurability of their scalar expected empirical loss. For improper learners with jointly measurable loss and actual iid CMI, the same fixed problem forces CMI to diverge along a sequence of sizes if the learner has the conjectured empirical accuracy. The class has uniform convergence in outer expectation separately for each labeled distribution. Its convergence can be arbitrarily slow along the chosen sequence. The evaluation map is jointly measurable with a trace Borel hypothesis space. [Conjecture 6 and its iid definition](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

## One class and one law

Let $`w_j=2^{-j}`$ for $`j\ge1`$, and choose increasing integer sample sizes $`n_j`$ with $`n_jw_j^2\to\infty`$. At level $`j`$ use a block of $`m_j\ge4n_j^2`$ sectors and the [disjoint finite-support construction](completed-finite-groups.md). In that construction, $`G_j\subseteq[0,1]^{m_j}`$ has full outer Lebesgue product measure and two distinct members differ in every coordinate. Its hypotheses are the indicators of the sets

```math
\{(j,i,g_i):1\le i\le m_j\}
\qquad (g\in G_j).
```

The feature domain is the countable disjoint union of the sector spaces, equipped with its standard Borel structure. Take all these indicators and the zero classifier as the class. Equip its names with the trace Borel structure from the countable disjoint union of the parameter spaces $`[0,1]^{m_j}`$ and a separate zero name. Coordinate equality makes evaluation jointly measurable. All nonzero supports are pairwise disjoint and finite. Therefore a point in a support can be shattered, but no two points can, so the dimension is one.

The single law $`D`$ chooses level $`j`$ with probability $`w_j`$, a uniform sector within its level, a Lebesgue-uniform value in $`[0,1]`$, and an independent fair label. For a sample $`z`$ of size $`n`$, write $`P_+(z)`$ for the fraction of its labels equal to one. This is the loss of the zero classifier. At size $`n=n_j`$, let $`K_j(z)`$ count the positive rows in level $`j`$, and let $`A_j`$ be the event that the sectors of the sample rows in that level are all distinct.

## An empirical advantage on full-outer-measure sets

Fix a level pattern, sector pattern and label vector satisfying $`A_j`$. Conditional on this pattern, the set of value tuples on which a proper classifier improves on the zero classifier by $`K_j/n_j`$ has full outer measure. If $`K_j=0`$, use the zero classifier. Otherwise project $`G_j`$ to the sectors of the positive rows at level $`j`$. This projection has full outer measure. Given any positive-measure Borel set of value tuples, Fubini gives a positive-measure set of positive-row values whose sections in the other coordinates have positive measure. Choose such positive-row values in the projection and extend them to some $`g\in G_j`$. For each negative row at level $`j`$, exclude the one value predicted positive by this $`g`$ in its sector. These exclusions remove finitely many null hyperplanes from the section. The resulting value tuple belongs to the original Borel set, and the chosen classifier fits all rows in level $`j`$ and predicts zero elsewhere. This proves the full-outer-measure assertion.

Let $`r_n(z)`$ be any completed-measurable expected training loss satisfying the samplewise empirical requirement with additive tolerance $`\epsilon_n`$. For the fixed pattern on $`A_j`$, completed measurability implies

```math
r_{n_j}(z) \le P_+(z)-K_j(z)/n_j+\epsilon_{n_j}
```

almost surely. Indeed, a positive-measure violation would contain a positive-measure Borel set under the conditional experiment, which must meet the fitted tuples. On other patterns the zero classifier gives $`r_{n_j}\le P_++\epsilon_{n_j}`$. Conditioning on levels and labels, the union bound for sector collisions gives $`\mathbb P(A_j^c)\le n_j^2/(2m_j)\le1/8`$ uniformly in that pattern. Since $`\mathbb E K_j=n_jw_j/2`$, averaging gives

```math
\mathbb E_{D^{n_j}} r_{n_j}
\ \le\ \tfrac12+\epsilon_{n_j}-\tfrac7{16}w_j .
\tag{1}
```

## Impossibility for proper outputs

Call a tuple unrelated if no two of its rows belong to the same nonzero support. The set of related tuples has inner measure zero under the atomless feature experiment. To prove this, induct on the number of rows. For any Borel subset of the related-tuple event, its section in the last feature is null whenever the preceding features are unrelated. Indeed, that section is contained in the union of the finitely many supports of the preceding rows, each of which is finite. The set of preceding tuples with a positive-measure section is measurable and is contained in their related-tuple event. By induction it has measure zero. Fubini then proves the assertion for the whole Borel subset, including when the label vector has been fixed.

On unrelated tuples, every proper classifier agrees with the zero classifier except possibly on one row, so expected training loss is at least $`P_+-1/n`$. If this expected loss is completed-measurable, the bound holds almost surely. Combining its expectation with (1) requires

```math
\epsilon_{n_j}\ \ge\ \tfrac7{16}w_j-\tfrac1{n_j}.
\tag{2}
```

For any fixed $`c`$, the tolerance $`c/\sqrt{n_j}`$ violates (2) for all sufficiently large $`j`$, since $`n_jw_j^2\to\infty`$. The class and $`D`$ are the same for every $`c`$. More generally, given any proposed rate $`a_n\to0`$, one can initially choose the $`n_j`$ so $`a_{n_j}\le w_j/16`$. Then that rate also fails on the single resulting problem.

## Lower bound with improper outputs

Under $`D`$, every output classifier with measurable loss has fresh population loss $`1/2`$, since the fresh label is independent and fair. Assume the actual completed iid selector/output experiment, measurable joint loss and ordinary seed expectations, as in the [fair-label argument](completed-finite-groups.md#fair-labels-and-improper-learners). Its [direct information inequality](completed-finite-groups.md#the-information-inequality-for-the-actual-iid-experiment) gives $`I\ge n(\mathbb E[L-\widehat L])^2/2`$ when the expected gap is nonnegative. If $`\epsilon_{n_j}\le w_j/16`$, (1) gives a gap of at least $`3w_j/8`$. Thus

```math
\mathrm{CMI}_D(A_{n_j})\ \ge\ \frac9{128}n_jw_j^2 .
```

With the conjectured empirical tolerance this bound applies for all sufficiently large $`j`$ and diverges, even for improper outputs.

## The uniform-convergence scope

Fix any labeled law $`P`$ and let $`U_J`$ be the union of levels greater than $`J`$. Put $`p_J=P_X(U_J)`$ and $`M_J=\max_{j\le J}m_j`$. The class of early hypotheses and the zero classifier has outer expected uniform loss deviation at most $`3/(2\sqrt n)+M_J/n`$ by the [bounded finite-support estimate](completed-finite-groups.md#distribution-uniform-convergence). A late hypothesis has loss differing from the zero classifier only on $`U_J`$, so its empirical-minus-population deviation is bounded by the absolute zero-classifier deviation plus $`P_n(U_J)+P(U_J)`$, treating $`U_J`$ as a feature event. Consequently

```math
\mathbb E_P^*\sup_{h\in H}|P_n\ell_h-P\ell_h|
\ \le\ \frac{3}{2\sqrt n}+\frac{M_J}{n}+2p_J .
```

Take $`n\to\infty`$ for each fixed $`J`$, then $`J\to\infty`$ for this fixed $`P`$. This proves uniform convergence separately for every $`P`$.

In the fixed fair-label law $`D`$, the proof of (1) gives outer expected uniform deviation at least $`7w_j/16`$ at $`n_j`$. For any measurable majorant, apply the full-outer-measure argument to the lower bound $`1/2-P_++K_j/n_j`$ on $`A_j`$, and use $`1/2-P_+`$ on the other patterns. The expectation calculation is identical. Thus the class fails an absolute VC-one $`O(1/\sqrt n)`$ bound even at one fixed law. Convergence is also not uniform over $`P`$. Taking $`P`$ supported entirely on the target level $`j`$ gives the same lower bound with $`w_j=1`$ at size $`n_j`$. The earlier fixed-size constructions have distribution-uniform convergence with a class-dependent modulus. The single-class construction strengthens the quantifiers at the cost of requiring convergence only separately for each law. Neither construction assumes a standard Borel hypothesis parameter space.
