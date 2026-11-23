# Reconstruction from countably many active blocks

Let $`H`$ be a nonempty class of binary predictors of VC dimension $`d\ge1`$, with jointly Borel evaluation on standard Borel spaces $`H`$ and $`X`$. Let $`\pi:X\to U`$ be a Borel map to a standard Borel space. The blocks are the fibers of $`\pi`$. A block is active for $`h`$ if $`h`$ differs from a fixed proper reference $`h_0`$ somewhere in that block.

Suppose there is a Borel relation $`R\subseteq H\times U`$ listing a countable set $`R_h`$ of declared blocks for each $`h`$. It contains all active blocks and at most $`s`$ additional blocks, for a fixed finite $`s`$. Suppose also that there is a countable sequence of Borel sets $`B_j\subseteq U\times H`$ with this property. For every finite tuple $`F`$ in one block $`u`$ and every $`h\in H`$, some section $`B_j(u)`$ contains $`h`$ and consists entirely of hypotheses with the same trace as $`h`$ on $`F`$. For example, a Borel code for the restriction to each block, into a second-countable space in which each binary evaluation is continuous on the code range, provides such a sequence by using a countable basis.

Then there is a countable universally measurable proper catalogue that realizes every finite trace and reads at most $`d+s`$ observed features per candidate. In particular the [local reconstruction theorem](measurable-local-reconstruction.md) gives actual iid CMI at most $`197{,}120d+32(d+s)`$ nats and expected empirical excess at most $`583\sqrt{d/n}`$ on every sample. The blocks may be uncountable and each hypothesis may differ from the reference on uncountably many features.

## At most d observed active blocks are needed

Code the spaces by Borel subsets of Baire space. Fix one real parameter $`r`$ for the spaces, block map, evaluation, $`R`$ and the joint relation $`(j,u,h)\mapsto h\in B_j(u)`$, so all are lightface $`\Delta^1_1(r)`$. As in the [countable-disagreement proof](countable-disagreement-reconstruction.md#the-number-of-features-needed-to-describe-the-positives), write $`\operatorname{HYP}(q)`$ for the reals hyperarithmetic in $`q`$, using effective joins for tuples. The effective perfect set theorem gives

```math
u\in R_h\quad\Longrightarrow\quad u\in\operatorname{HYP}(r,h)
```

because $`R_h`$ is countable. We use the same finite cone-avoidance statement as in that proof. For a nonempty $`\Sigma^1_1(q)`$ set of possible hypotheses and a finite list of reals outside $`\operatorname{HYP}(q)`$, some hypothesis in the set keeps every listed real outside $`\operatorname{HYP}(q,h)`$.

Fix a finite observed tuple and a proper realization $`h_*`$ of the target trace. Let $`P`$ be its observed block IDs in $`R_{h_*}`$. Partition $`P`$ into the genuinely active IDs $`P_0`$ and the additional declared IDs $`P_1`$. There are at most $`s`$ of the latter. Choose an inclusion-minimal $`I\subseteq P_0`$ such that $`P_0\subseteq\operatorname{HYP}(r,P_1,I)`$. Minimality and transitivity give

```math
u\notin \operatorname{HYP}(r,P_1,I\setminus\{u\})
\qquad (u\in I).
```

For each $`u\in I`$ fix one feature $`x_u`$ in that block where $`h_*`$ differs from $`h_0`$. These features are used only to prove a VC bound and need not be observed. Choose $`j_u`$ with $`h_*\in B_{j_u}(u)`$ such that every member agrees with it at $`x_u`$. For each $`S\subseteq I`$, the set of hypotheses in all the $`B_{j_u}(u)`$ for $`u\in S`$ is nonempty and $`\Delta^1_1(r,P_1,S)`$. The indices are natural-number constants. Apply finite cone avoidance to all $`u\in I\setminus S`$. The resulting hypothesis agrees with $`h_*`$ at the selected $`x_u`$ and has no declared activity at any omitted $`u`$. It therefore agrees with $`h_0`$ at the omitted $`x_u`$. This realizes precisely pattern $`S`$ in the disagreement coordinates. The $`x_u`$ are distinct, one in each block, so $`|I|\le d`$.

The map needs only one **observed** feature from each block indexed by $`P_1\cup I`$, in order to read its ID. No prediction at the external shattering features is used by the catalogue.

## The catalogue

From the observed anchors, enumerate the universally measurable digit lists of their block IDs and $`r`$ as in the [countable-disagreement proof](countable-disagreement-reconstruction.md#constructing-the-lists). Enumerate all finite tuples of the resulting IDs in $`U`$. One tuple lists exactly $`P`$. For each such tuple and each tuple of natural indices $`(j_u)_{u\in P}`$, make a countable tree. The root requires membership in $`B_{j_u}(u)`$ for all those $`u`$. Each node also has a finite list of forbidden block IDs, requiring that none be in the hypothesis's declared set $`R_h`$. Choose a proper hypothesis satisfying the current constraints wherever feasible. These are Borel constraints on the hypothesis and the finite parameters, so analytic selection supplies a universally measurable map, with default $`h_0`$ off the feasible domain.

For each block in the current hypothesis's declared set make a child adding that block to the forbidden list. Lusin–Novikov gives a countable Borel enumeration of the declared sets from the Borel relation $`R`$. At a fixed finite address the selections and the enumeration compose universally measurably. All addresses, finite ID-list codes and index tuples are countable side information, with no further reads of the observed tuple.

For the correct list $`P`$, choose $`j_u`$ so $`B_{j_u}(u)`$ agrees with $`h_*`$ at all observed features in its block. Along the tree these constraints preserve the trace in the listed blocks. If the current hypothesis disagrees with the target elsewhere, its declared set contains that unlisted block, whereas $`R_{h_*}`$ does not. Follow the child forbidding it. Each step retains feasibility via $`h_*`$ and removes at least one new observed block from possible future violations. There are finitely many, so a candidate on the tree realizes the entire trace. Reading at most $`d+s`$ features suffices.

## An atomless example requiring d observed features

For each $`d\ge1`$ consider the standard Borel feature space $`X=[d]\times[0,1]\times[0,1]`$ and the class indexed by $`\vartheta\in[0,1]^d`$ with

```math
h_\vartheta(j,a,z)=1_{\{a=\vartheta_j\}}.
```

The evaluation is Borel. One point in each block $`j`$ can be shattered by choosing independently whether to match its second coordinate. Two points in one block with distinct second coordinates cannot both be positive, and two with the same second coordinate always have identical predictions. Thus the VC dimension is exactly $`d`$. Taking $`h_0=h_{(0,\dots,0)}`$ and blocks indexed by $`(j,a)`$ gives the exact active relation from the theorem, with constant restrictions on each block.

Fix any countable family of universally measurable proper maps of at most $`k<d`$ observed features. The family can vary with $`n`$. Make the coordinates of $`\vartheta`$ independent uniform reals. Conditional on $`\vartheta`$, draw iid labeled features $`(J_i,\vartheta_{J_i},Z_i)`$, with $`J_i`$ uniform in $`[d]`$, $`Z_i`$ independent uniform in $`[0,1]`$, and all labels one. The conditional feature law is atomless and is realized by $`h_\vartheta`$.

Fix a sample size, a map and a tuple of input positions. Conditional on the block indices and on the values of the coordinates observed by the map, every $`\vartheta_j`$ in an unobserved block is an independent atomless coordinate. The output parameter cannot equal $`\vartheta_j`$ in such a block except on a null event. Formally one can take a Borel version of the universally measurable reconstruction map for the distribution of its input tuple, then use product integration. Intersect over the countably many maps and sizes and the finitely many position tuples at each size, and apply Fubini. For almost every fixed $`\vartheta`$, almost every sample at every size has the property that every catalogue candidate is positive only in blocks observed by that candidate. Any such candidate is positive in at most $`k`$ of the $`d`$ blocks of its conditional sampling law.

With probability tending to one, every block has empirical frequency at least $`1/(2d)`$. On that event the catalogue's best empirical loss is at least $`(d-k)/(2d)`$, while the proper class optimum is zero. Hence fewer than $`d`$ observed features cannot supply the approximate catalogue premise even with atomless iid data and a positive-probability failure criterion. This lower bound concerns the catalogue representation. The class itself has a $`d`$-feature catalogue and the two learning bounds above.
