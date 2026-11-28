# Two broad colors force parity

**Partial theorem.** There is a constant $`\varepsilon>0`$ with the following property. Let six symmetric colors of a balanced graphon have zero rainbow six-cycle density. Suppose that for two colors there is an $`a\in[0,1]`$ such that their support row degrees are at least $`a-\varepsilon`$ and $`1-a-\varepsilon`$, respectively, outside sets of measure at most $`\varepsilon`$. Then the graphon has an exact two-part parity cut.

Only two colors are involved in the support hypothesis, and they need not have a common support. This improves the [three-broad-color criterion](THREE-BROAD.md) for [Erdős #811](https://www.erdosproblems.com/811). It is not a solution for arbitrary completely balanced colorings.

## Limit reduction

Assume a sequence of counterexamples with errors tending to zero, and normalize each color to have degree $`1/6`$, with all colors summing to one. Write $`A_i=\mathbf1_{\{W_i>0\}}`$ for the two specified color supports $`i=1,2`$. After a subsequence, their lower degree bounds tend to $`a,1-a`$. Write $`P_i=6W_i`$ for the four other colors $`i\in I=\{3,4,5,6\}`$. An operator product $`K`$ of these four colors in any order is doubly stochastic and satisfies $`0\le K(x,y)\le6`$ almost everywhere. The latter follows by composing a kernel bounded by six with a stochastic kernel.

The first two colors can occupy consecutive edges of the missing rainbow cycle, so
```math
(A_1A_2)(x,y)K(x,y)=0
\tag{1}
```
almost everywhere for every order of $`K`$, using the reverse of its four-edge path. All other orders of the six edges likewise have zero density if the two color kernels are replaced by their supports.

In each graphon before taking a limit, if an $`A_1`$-row has degree greater than $`a+\delta`$, whereas an $`A_2`$-row has degree at least $`1-a-\delta`$, their neighborhoods intersect. Thus (1) forces the $`K`$-rows of the first kind to route entirely to the exceptional $`A_2`$-rows. By column sums the two sets' measures satisfy the same upper bound. Interchange the roles of the two colors and use column routing to get the corresponding upper bound for $`A_2`$. Here $`a`$ can be the graphon's own threshold before taking the subsequence. Hence the two support degrees converge in $`L^1`$ to $`a`$ and $`1-a`$.

Pass to a [colored cut-metric limit](https://arxiv.org/abs/1010.5155), including $`A_1,A_2`$ as two additional coordinates. They still dominate $`W_1,W_2`$ (test nonnegative integrals on all rectangles), have degrees $`a,1-a`$, and all their mixed rainbow counts vanish by counting continuity. The dominating property and balance give $`a,1-a\ge1/6`$. The $`A_i`$ are initially only $`[0,1]`$-valued in the limit. But at any typical $`(x,y)`$ with $`K(x,y)>0`$, their two row supports must be disjoint by (1), and have measures at least $`a,1-a`$; they are therefore complementary and their weights are exactly their indicators. The row and column sums of $`K`$ show this for almost every row of both kernels. We work with this exact limit next.

## The four remaining colors act on finitely many joint row types

At every positive $`K`$ pair $`x,y`$, the $`A_2`$-row of $`y`$ equals the complement of the $`A_1`$-row of $`x`$, as elements of $`L^1`$. Since $`K\le6`$ and has row sum one, the $`A_2`$-fiber of this row type has measure at least $`1/6`$ for almost every $`x`$. The column sums give the same statement in the other direction. There are consequently at most six types, bijectively paired by complementation, and each paired pair of fibers has the same measure by double stochasticity. The row maps into $`L^1`$ are measurable, so these fibers are measurable. Write $`F_\varnothing`$ for the vector of indicators of the $`A_2`$-row types and $`F_I`$ for the paired $`A_1`$-type indicators. Then **every** order of the four factors sends $`F_\varnothing`$ to $`F_I`$.

For each $`S\subseteq I`$, define $`F_S`$ by applying the operators indexed by $`S`$ to $`F_\varnothing`$. The order is immaterial. Indeed, for either order apply the same remaining prefix of operators $`T`$; both results are $`F_I`$. Each operator is a Markov contraction in $`L^2`$. The initial and final corresponding indicators have equal norms, hence so do the two intermediate functions $`u,v`$ and their images under $`T`$. Equality in the contraction gives $`T^*Tu=u`$, $`T^*Tv=v`$, because $`I-T^*T`$ is positive semidefinite. Thus $`Tu=Tv`$ gives $`u=v`$. The intermediate functions are again indicators: they take values in $`[0,1]`$, preserve the integral, and have squared norm equal to that integral. Their components partition the space.

For every $`i\in I`$ one has
```math
P_iF_S=F_{S\triangle\{i\}}.
\tag{2}
```
For $`i\notin S`$ this is the definition. For $`i\in S`$, use $`F_S=P_i F_{S\setminus\{i\}}`$ and equality in the self-adjoint contraction, which gives $`P_i^2 F_{S\setminus\{i\}}=F_{S\setminus\{i\}}`$.

Refine the partition by the joint vector of types for all sixteen subsets $`S`$. Equation (2) gives a deterministic action on the atoms: each positive $`W_i`$ edge from an atom must end at the atom obtained by toggling its coordinate index by $`\{i\}`$ in all sixteen coordinates. This follows for each indicator because an average of zero or one can use only the indicated target value. These toggles are commuting involutions. Double stochasticity gives equal mass to two atoms paired by a toggle; in particular each positive atom has measure at least $`1/6`$, since it is a full target for a normalized kernel bounded by six. Also, the four-color palette stays inside each toggle orbit. Its row degree $`4/6`$ forces every positive orbit to have mass at least $`2/3`$. Hence there is precisely one orbit.

We can identify its atoms with a quotient of $`(\mathbb Z/2)^4`$, on which each remaining color acts by adding one element $`b_i`$. Indeed this is a transitive action of an abelian group, so the stabilizer is common and the quotient acts regularly. The number $`q`$ of atoms is a power of two at most six, and their common mass is $`1/q`$. Both $`A_1,A_2`$ are constant on each pair of joint atoms since their rows are constant on them and the kernels are symmetric. The case $`q=1`$ is excluded by their degrees strictly between zero and one. Thus $`q=2`$ or $`4`$.

## Classification of the two possible quotients

For $`q=2`$, each $`A_i`$ is the within-block or across-block indicator, by its positive degree less than one. If they are the same, the opposite block relation is filled by the four-color palette; exactly three of its colors must use that relation, because their degrees are $`1/6`$ and a target block has mass $`1/2`$. If $`A_1,A_2`$ have opposite relations, at most two of the remaining colors use either relation. Three would already fill the entire half in each row, leaving no weight for the corresponding specified color, which by its support would then have degree zero. So two of the four colors are across and two within. Either way there are exactly three crossing colors with the other three within.

For $`q=4`$, no atom pair can have $`A_1=A_2=0`$: otherwise an entire target atom of measure $`1/4`$ would be filled by the remaining colors, each of which puts either all its degree $`1/6`$ into that atom or none. Therefore $`A_1+A_2=1`$ on every atom pair, since their degrees sum to one. At most one of the remaining colors can use each transition, by $`2/6>1/4`$; there are four colors and four translations, so all translations are used and the $`b_i`$ are distinct. In each transition the relevant $`A_i`$ receives exactly $`1/4-1/6=1/12`$ of row weight, since the other $`A`$ support is absent. Each $`A_i`$ therefore has precisely two target atoms in each row by balance.

Now zero rainbow density forces $`A_2`$ to be invariant under every simultaneous translation. Otherwise some $`(\alpha,\gamma)`$ lies in $`A_2`$ but $`(\alpha+b,\gamma+b)`$ does not, for a translation $`b=b_i`$ from one of the remaining colors. Use the $`A_2`$ edge $`\alpha`$ to $`\gamma`$, the color $`i`$ to $`\gamma+b`$, and then the $`A_1`$ edge to $`\alpha+b`$ by complementation and symmetry. The remaining three colors give a path to $`\alpha`$, since the sum of all four elements of $`(\mathbb Z/2)^2`$ is zero. This type walk has positive decorated density: the two support edges have value one on the indicated atom rectangles, and the one- and three-edge segments of the other colors have positive mass by their deterministic transitions and row degrees. It contradicts the vanished mixed count. Such translation invariance makes the two target differences for $`A_2`$ a fixed two-subset of the four-element group. Every two-subset is a coset of an index-two subgroup. With the subgroup halves as the cut, one of $`A_1,A_2`$ is within and one across. Two of the four translation colors cross that cut, so again this is exact parity.

## Back to the sequence

The limit's parity cut gives $`o(1)`$ wrong weight in the earlier graphons by cut convergence on its fixed rectangles. The [weighted graphon repair lemma](HALF-SUPPORT.md#weighted-graphon-repair-lemma) makes those cuts exact for sufficiently late graphons, contradicting the assumed sequence. This proves the theorem. The finite relation in (2) is the additional step beyond the previous three-color routing argument.

The [original Erdős–Tuza chapter](https://doi.org/10.1016/S0167-5060(08)70377-7), [modern balanced-coloring paper](https://arxiv.org/abs/2209.13867), and [public working report](https://www.erdosproblemaday.com/report/811) were checked for a matching two-support result. No exact match was found in that bounded search. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
