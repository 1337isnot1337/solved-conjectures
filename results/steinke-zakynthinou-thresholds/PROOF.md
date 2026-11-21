# Proper agnostic threshold learning with constant conditional mutual information

21 November 2026. Complete proposed proof, independently checked within
this research effort. This is not a Lean formalization or an externally
accepted prize result. The [source audit](PRIOR_AUDIT.md) found no earlier
resolution of the exact separately rewarded threshold problem.

## Theorem

For each positive integer $`n`$, there is one distribution-independent,
measurable randomized learner $`A_n`$ that outputs a finite real parameter
$`t`$, representing the proper classifier $`h_t(x)=1[x\ge t]`$, such that
for every probability distribution $`D`$ on $`\mathbb R\times\{0,1\}`$,

```math
I(A_n(\widetilde Z_S);S\mid\widetilde Z)<21
```

in nats, and for every individual labeled sample $`z`$ of size $`n`$,

```math
\mathbb E_{A_n}\widehat L_z(A_n(z))
\le\inf_{t\in\mathbb R}\widehat L_z(h_t)+\frac{2056}{\sqrt n}.
```

Here $`\widetilde Z`$ is an iid paired supersample from $`D`$ and
$`S`$ is its independent fair selector. The constant 4096 in both places
satisfy the single-constant convention of the sponsor's Conjecture 6,
whether information is measured in nats or bits. No restriction on
feature atoms or label noise is imposed.

The theorem resolves the real-threshold case offered separately in
[Steinke and Zakynthinou's COLT 2020 open-problem paper](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf),
Section 3. It does not resolve their general VC-dimension conjecture.
The US$20 proper and US$15 improper offers concern alternative versions
of this same problem; they are not counted as separate solutions.

## Algorithm and proof structure

1. Give each input observation an independent uniform tag and sort by the
   lexicographic feature-tag order.
2. List the canonical threshold cuts, append the all-zero endpoint, and
   traverse this list forward and backward to form a folded cycle.
3. Apply a uniform random cyclic shift to a balanced binary tree on the
   cycle positions. At depth $`j`$, choose a child using the soft minimum
   of the two child empirical minima, with noise scale
   $`128\sqrt n\,2^{-j/4}`$.
4. At the selected tagged cut, use the closed real endpoint when its tag
   is at most one half and the open endpoint otherwise. Keep the all-zero
   endpoint if it was selected.
5. Replace an open endpoint by the next larger observed feature, or by
   $`w+1`$ if none exists. Replace the all-zero endpoint by one plus the
   sample maximum. These last changes preserve every training prediction
   and always return a finite closed threshold.

If two augmented features coincide, return the fixed threshold at zero.
This is a null event for every fixed input sample and every iid input
distribution, so it changes none of the stated expectations or information
quantities and makes the procedure everywhere defined.

Part I proves constant original information and the required empirical
accuracy through step 4. Part II proves that step 5 costs only a constant
factor in information and preserves empirical loss. The final constant
calculation appears after Part II. The proof never gives the learner a
ghost sample or the underlying distribution.

## Part I. The shifted tree and private-tag rounding

### 1. The intermediate improper theorem

Let

```math
\mathcal T=\{x\mapsto1[x\ge t]:t\in\mathbb R\}
\cup\{x\mapsto0\}.
```

For each $`n\ge1`$, the algorithm described below outputs either a closed threshold, an open threshold $`x\mapsto1[x>w]`$, or the constant-zero function. All are measurable binary functions. The open thresholds make the construction improper for the displayed class.

The claim is that absolute finite constants $`C_I,C_L`$ satisfy

```math
\mathop{\mathrm{CMI}}_D(A_n)\le C_I
\quad\text{for every distribution }D\text{ on }\mathbb R\times\{0,1\},
\tag{1}
```

and, for every individual labeled sample $`z`$ of size $`n`$,

```math
\mathbb E_{A_n}\widehat L_z(A_n(z))
\le\inf_{h\in\mathcal T}\widehat L_z(h)+\frac{C_L}{\sqrt n}.
\tag{2}
```

The CMI in (1) is $`I(A_n(\widetilde Z_S);S\mid\widetilde Z)`$, where the $`n\times2`$ pool is iid from $`D`$ and its selector bits are independent and fair. All information is in nats.

We first construct an auxiliary learner for distinct features in a measurable total order. Only comparisons and ranks are used. This interface includes the lexicographic order on $`\mathbb R\times(0,1)`$; no embedding of that entire order into the real line is assumed.

### 2. The distinct-feature auxiliary learner

Consider $`n`$ observations with distinct ordered features

```math
x_0\lt x_1\lt \cdots\lt x_{n-1}.
```

Let $`t_i=x_i`$ for $`i\lt n`$ and let $`t_n=\infty`$ denote the constant-zero rule. These are the $`n+1`$ canonical prediction traces. Write $`L_z(t)`$ for total, rather than normalized, empirical binary loss. Adjacent canonical losses differ by one in absolute value.

Set $`N=n+1`$ and $`M=2N`$. Make the cyclic leaf list

```math
t_0^+,t_1^+,\ldots,t_n^+,
t_n^-,t_{n-1}^-,\ldots,t_0^-.
\tag{3}
```

The signs distinguish two copies of the same hypothesis. Every step of this cycle changes total loss by at most one, including the two turning points and the closing step.

Fix a balanced binary tree on the ordinary positions $`0,\ldots,M-1`$: split each interval of size at least two into consecutive parts whose sizes differ by at most one. Its leaves are the individual positions. At depth $`j`$, every node has at most $`\lceil M/2^j\rceil`$ positions; its height is at most $`\lceil\log_2 M\rceil`$.

Independently choose a uniform cyclic shift $`\theta\in\{0,\ldots,M-1\}`$. Position $`h`$ of the tree represents leaf $`h+\theta\pmod M`$ of (3). At a visited internal node of depth $`j`$, let $`m_0,m_1`$ be the minimum total losses over the two child leaf sets. Put

```math
\sigma_j=128\sqrt n\,2^{-j/4}.
```

Choose child $`c\in\{0,1\}`$ with probability

```math
\Pr(c)=\frac{e^{-m_c/\sigma_j}}
{e^{-m_0/\sigma_j}+e^{-m_1/\sigma_j}},
\tag{4}
```

using fresh randomness at each choice. At the terminal leaf, output its canonical threshold.

For the information proof, augment that output. If its oriented leaf identifier is $`a`$ and its position in (3) is $`\mathop{\mathrm{pos}}_z(a)`$, also output

```math
V=\theta-\mathop{\mathrm{pos}}_z(a)\pmod M.
\tag{5}
```

Call the augmented output $`O=(a,V)`$. The actual threshold is a deterministic function of $`O`$. All constructions are measurable finite operations. They are permutation invariant because they use the sorted labeled observations, not their input indices.

#### Accuracy of the auxiliary learner

If the two child minima differ by $`\Delta\ge0`$, the conditional expected increase in the minimum upon choosing a child is

```math
\frac{\Delta}{1+e^{\Delta/\sigma_j}}\le\sigma_j.
```

The increases telescope along each path. With

```math
\eta=1-2^{-1/4}>0,
```

this gives, for every fixed distinct-feature sample,

```math
\mathbb E L_z(A_n^{\mathrm{aux}}(z))
\le\min_t L_z(t)+\frac{128\sqrt n}{\eta}.
\tag{6}
```

The folded copies and random shift change neither the global minimum nor this calculation.

### 3. Exact alignment for adjacent samples

Let $`z^0=C\cup\{u\}`$ and $`z^1=C\cup\{v\}`$ have size $`n`$, with $`n-1`$ shared observations and all $`n+1`$ feature values in their union distinct. The augmented leaf identifiers common to the two samples are the oriented copies of shared observations and of infinity.

For a common augmented output $`(a,V)`$, the abstract terminal tree position is $`-V\pmod M`$ under both laws. Thus the abstract tree path is the same. The shifts used under the two samples are respectively $`V+\mathop{\mathrm{pos}}_{z^b}(a)`$. Their node intervals are aligned relative to the common oriented output, rather than to a fixed data-dependent origin.

#### A uniform bound on corresponding leaf costs

Form the sorted union sample $`C\cup\{u,v\}`$, append infinity, and fold its list as in (3). This union cycle has $`M+2`$ positions. The cycle for $`z^0`$ is obtained by deleting the two oriented copies of $`v`$; the cycle for $`z^1`$ deletes the two copies of $`u`$.

Index either sample cycle forward from the common anchor $`a`$. At an equal relative cyclic offset $`r\in\{0,\ldots,M-1\}`$, its position in the union cycle is $`r+k_b`$, where $`k_b\in\{0,1,2\}`$ counts deleted union positions passed along that arc. The two union positions differ by at most two. The union loss is 1-Lipschitz around its folded cycle, so these two union losses differ by at most two.

The total loss on either sample is the union loss minus the absent observation's binary loss. The latter two subtracted values are in $`\{0,1\}`$. Thus the corresponding own-sample losses differ by at most three; we use the loose bound four below. Taking minima over any pair of corresponding abstract child intervals preserves that bound. Therefore, if

```math
\lambda_b=(m_{b0}-m_{b1})/\sigma_j
```

is the logistic parameter at a pair of aligned nodes, then

```math
|\lambda_0-\lambda_1|\le8/\sigma_j.
\tag{7}
```

#### Exact locality

At a pair of aligned parent nodes, call the comparison active if at least one oriented copy of $`u`$ lies in the $`z^0`$ parent interval or at least one copy of $`v`$ lies in the $`z^1`$ parent interval.

If the comparison is inactive, both parent intervals consist entirely of common leaf identifiers. They have the same size, contain the same anchor in the same relative position, and occur in the same common cyclic order. Walking left and right from the anchor therefore identifies their leaf sequences exactly; the child sequences agree as well.

Moreover, the binary loss of observation $`u`$ is constant on this common interval. In the folded order it can change only when passing one of the two copies of $`u`$, both of which are outside the interval. The same holds for $`v`$. The total-loss difference between samples is consequently one constant across the whole parent interval. Both child minima shift by that same constant, so

```math
\lambda_0=\lambda_1
\quad\text{at every inactive comparison.}
\tag{8}
```

Along a common abstract output path, the active depths form an initial segment: each source node is nested inside its source parent, so once both unmatched observations are outside, they stay outside.

This locality statement is the reason for folding the order. A circular list that simply jumps from infinity back to the first threshold would introduce an additional loss discontinuity unrelated to the changed observation.

### 4. Exact density ratios without a path-KL assumption

Let $`q_b(a,V)`$ be the mass of a common augmented output under sample $`z^b`$. The change of variables from $`(\theta,\text{terminal leaf})`$ to $`(a,V)`$ is a bijection, and therefore

```math
q_b(a,V)=\frac1M\prod_{j\text{ on its abstract path}}p_{b,j},
\tag{9}
```

where $`p_{b,j}`$ is the probability in (4) of the specified child. Every factor is positive. The two paths in (9) are identical abstract paths, even though their shifts depend on the final output.

The logarithm of a logistic child probability is 1-Lipschitz in its logistic parameter. If $`I_j(a,V)`$ is the indicator of an active comparison and

```math
\Lambda(a,V)=\log\frac{q_0(a,V)}{q_1(a,V)},
```

then (7)–(9) imply

```math
|\Lambda|\le8\sum_j I_j/\sigma_j.
\tag{10}
```

No conditional path-KL cancellation is asserted. All subsequent bounds use the actual joint masses in (9).

Because the active depths are an initial segment, the geometric sum in (10) gives

```math
\Lambda^2
\le\frac{64}{128^2\eta^2 n}\sum_{j\ge0}2^{j/2}I_j.
\tag{11}
```

There is also a global finite likelihood-ratio bound. The deepest internal depth $`j`$ satisfies $`2^j\lt M\le4n`$. Thus

```math
|\Lambda|\le D_0:=\frac{8\sqrt2}{128\eta}<1,
\qquad q_0\le e q_1,\quad q_1\le e q_0.
\tag{12}
```

For the strict inequality, $`\eta>1/8`$ follows from $`(8/7)^4<2`$, and then $`D_0\lt \sqrt2/2<1`$. The constants are deliberately loose. The factor 128 in the noise scale was proposed by the coordinator to make the transport constant at most $`e`$.

### 5. Averaging the active-node charge

Now let the shared observations and the two fresh observations be independent from an arbitrary distribution on the ordered feature-label space for which features are distinct almost surely.

Conditional on the unordered sample $`z^0`$, its distinguished observation $`u`$ is uniform among its $`n`$ observations. The auxiliary learner is permutation invariant. For any fixed augmented output and its depth-$`j`$ node, at most the number of node leaves are represented observation identifiers. Infinity leaves can only lower this count. Consequently the expected probability, under the law for $`z^0`$, that its own distinguished observation occurs in its node is at most

```math
\frac{\lceil M/2^j\rceil}{n}\le8\,2^{-j}.
\tag{13}
```

Only existing internal nodes are considered. The last inequality uses $`2^j\lt M\le4n`$. Restricting the sum to common augmented outputs only decreases this own-sample charge.

The corresponding event for $`v`$ belongs to the other sample's node. On common outputs, transport it to its own law by (12):

```math
\sum_{\mathrm{common}}q_0\,1[v\text{ occurs in node }1]
\le e\sum_{\mathrm{common}}q_1\,1[v\text{ occurs in node }1].
```

Then apply (13) under $`z^1`$. Repeating with the roles reversed yields

```math
\mathbb E\sum_{\mathrm{common}}(q_0+q_1)I_j
\le16(1+e)2^{-j}.
\tag{14}
```

This uses iid exchangeability only for the own-sample distinguished index. It does not assume that a ghost observation is uniform inside a node chosen under the other sample's law.

The augmented outputs outside the common support are precisely the oriented copies of $`u`$ under $`z^0`$ and of $`v`$ under $`z^1`$, with any relative shift. By the same permutation invariance, each expected missing-support mass is at most $`1/n`$.

### 6. Adjacent Jensen–Shannon divergence and original CMI

For two positive masses $`p,q`$, their contribution to equal-mixture Jensen–Shannon divergence is bounded by

```math
\frac12\left[p\log\frac{2p}{p+q}
+q\log\frac{2q}{p+q}\right]
\le\frac{(p-q)^2}{2(p+q)}
\le\frac{p+q}{8}\left(\log\frac pq\right)^2.
\tag{15}
```

The first inequality uses $`\log x\le x-1`$; the second uses $`|\tanh(t/2)|\le|t|/2`$. A mass present on only one side contributes half that mass times $`\log2`$.

Combining (11), (14), and (15), then summing the geometric series, proves

```math
\mathbb E\mathop{\mathrm{JS}}(q_0,q_1)
\le\frac{C_I}{n},
```

where one valid absolute constant is

```math
C_I=\log2+
\frac{1+e}{128\eta^2(1-2^{-1/2})}.
\tag{16}
```

For completeness, tensorize the independent selector bits in the CMI experiment:

```math
I(O;S\mid T)
\le\sum_{i=1}^n I(O;S_i\mid T,S_{-i}).
```

After averaging over the iid pool and the other selector bits, every summand is the expected Jensen–Shannon divergence between the two output laws on $`n-1`$ shared iid observations and two fresh iid alternatives. Unused pool entries do not affect either learner law. Equation (16) therefore gives

```math
\mathop{\mathrm{CMI}}_D(O)\le C_I.
\tag{17}
```

The actual auxiliary threshold has no greater CMI. This is an averaged iid statement, which is the quantifier required by the target; no fixed-pool constant-CMI claim is used.

### 7. Private tags remove the distinct-feature restriction

On an arbitrary real-feature sample $`z=((X_i,Y_i))_{i=1}^n`$, independently assign tags $`U_i\sim\mathop{\mathrm{Uniform}}(0,1)`$. Use the distinct lexicographically ordered features $`(X_i,U_i)`$ in the auxiliary learner. Its output is a virtual cut $`(w,u)`$ or infinity.

Round without consulting the dataset:

```math
(w,u)\longmapsto
\begin{cases}
x\mapsto1[x\ge w],&u\le1/2,\\
x\mapsto1[x>w],&u>1/2.
\end{cases}
\tag{18}
```

Infinity maps to the constant-zero function. This is the coordinator's improper rounding rule. It requires no successor feature, group multiplicity, or data-dependent postprocessing beyond the virtual output itself.

#### Information after rounding

In the CMI experiment, assign independent tags to the entire pool before selecting. The selected tags have exactly the distribution of the algorithm's private tags. The full tag array $`U`$ is independent of the original selector conditional on the original pool $`T`$. By data processing and (17),

```math
I(A_n;S\mid T)
\le I(A_n,U;S\mid T)
=I(A_n;S\mid T,U)
\le I(O;S\mid T,U)
\le C_I.
\tag{19}
```

The last quantity is the auxiliary CMI for the iid tagged distribution. The comparison-based proof applies directly to its lexicographic order. It never invokes a global order embedding into $`\mathbb R`$.

### 8. Accuracy after rounding, on every original dataset

Fix the original labeled dataset. For each equal-feature group $`g`$ of size $`m_g`$, let $`a_i=2Y_i-1`$ and $`A_g=\sum_{i\in g}a_i`$. Define its signed tag bridge

```math
E_g(u)=\sum_{i\in g}a_i\bigl(1[U_i\lt u]-u\bigr),
\quad 0\le u\le1.
```

Let $`L_g^-`$ be the empirical loss immediately before crossing this group; the loss immediately after crossing is $`L_g^+=L_g^-+A_g`$. At a virtual cut inside the group,

```math
L^{\mathrm{virtual}}(w,u)=L_g^-+uA_g+E_g(u).
\tag{20}
```

Write $`M`$ for the minimum total loss over the original threshold class on this fixed sample. Both endpoint losses are at least $`M`$: the closed threshold is in the original class, while the open threshold has the same empirical trace as the next observed feature threshold, or infinity. Thus both $`L_g^- -M`$ and $`L_g^+-M`$ are nonnegative.

If $`u\le1/2`$, the coefficient of $`L_g^- -M`$ in their convex combination is at least one half; if $`u>1/2`$, the coefficient of $`L_g^+-M`$ is at least one half. The rounding rule therefore satisfies

```math
L^{\mathrm{round}}-M
\le2\bigl(L_g^-+uA_g-M\bigr)
\le2\bigl(L^{\mathrm{virtual}}-M^{\mathrm{virtual}}\bigr)
+2\sup_{g,u}|E_g(u)|,
\tag{21}
```

where $`M^{\mathrm{virtual}}\le M`$ is the minimum virtual loss. The infinity case satisfies the same bound directly.

#### A uniform signed-bridge estimate

For a group of size $`m`$ with arbitrary fixed signs, an independent tag copy and Jensen's inequality give the usual squared symmetrization bound

```math
\mathbb E\sup_u|E_g(u)|^2
\le4\,\mathbb E\sup_u
\left|\sum_{i\in g}\varepsilon_i a_i1[U_i\lt u]\right|^2,
```

where the $`\varepsilon_i`$ are independent fair signs. To see the factor four explicitly, first replace each mean $`u`$ by an independent indicator with a copied tag, insert independent signs into the symmetric paired differences, and use $`|x-y|^2\le2|x|^2+2|y|^2`$.

Conditional on the tags, sorting them makes the last displayed process the partial sums of $`m`$ independent fair signs. Doob's squared maximal inequality bounds its expected squared maximum by $`4m`$. Hence

```math
\mathbb E\sup_u|E_g(u)|^2\le16m_g,
\qquad
\mathbb E\sup_{g,u}|E_g(u)|\le4\sqrt n.
\tag{22}
```

The second bound follows by bounding the squared maximum over groups by the sum of their squared maxima and using $`\sum_gm_g=n`$. There is no union-bound logarithm and no assumption about the labels within an atom.

Combining (6), (21), and (22) proves, for every original dataset,

```math
\mathbb E L_z(A_n(z))
\le M+\left(\frac{256}\eta+8\right)\sqrt n.
\tag{23}
```

Dividing by $`n`$ gives (2), with $`C_L=256/\eta+8`$.


## Part II. Properization with a bounded information cost

### 1. An adaptive rank code in a paired supersample

Let $`T`$ be any labeled paired pool of size $`n\times2`$, independent of a vector $`S`$ of $`n`$ fair selector bits. The pool need not be iid for this lemma. Let $`Q`$ be any randomized output based on the selected sample and private coins. Suppose it specifies one of:

- a closed threshold at a finite real $`w`$;
- an open threshold at a finite real $`w`$;
- the constant-zero function, denoted by infinity.

Write

```math
I=I(Q;S\mid T).
```

Define a positive integer $`K=K(Q,T,S)`$ on every possible triple, including those used under an independent-selector reference law:

- For a closed finite threshold, set $`K=1`$.
- For an open finite threshold at $`w`$, list the distinct full-pool feature values strictly greater than $`w`$ in increasing order. Let $`K`$ be the first group represented in the selected sample; if none is represented, use the index one past the end of the list as a sentinel.
- For the constant-zero output, list all distinct full-pool feature values in decreasing order, and let $`K`$ be the first group represented in the selected sample. This group always exists because $`n\ge1`$.

Thus $`K`$ is deterministic given $`Q,T,S`$ and is at most $`2n+1`$.

Under the reference law, keep the actual marginal of $`(Q,T)`$ but independently resample the fair selector. For any fixed $`Q,T`$,

```math
\Pr_{\mathrm{ref}}(K>k\mid Q,T)\le2^{-k}
\quad(k\ge0).
\tag{P1}
```

For the nonconstant cases of $`K`$, the event on the left says that none of the first $`k`$ distinct feature groups contributes a selected observation. If those groups contain both endpoints of any pair, this is impossible. Otherwise their pool entries belong to distinct pairs, and there are at least $`k`$ such entries. Every corresponding pair must independently select its other endpoint, giving probability at most $`2^{-k}`$. When the list is shorter than $`k`$, the event is empty. The closed-output case has $`K=1`$ and obeys the same bound.

Set

```math
\lambda=\frac{\log2}{2},
\qquad Z=\sum_{k=1}^{\infty}e^{-\lambda k}=1+\sqrt2.
```

Equation (P1) stochastically bounds $`K`$ by a geometric random variable with success probability one half. Therefore

```math
\mathbb E_{\mathrm{ref}}e^{\lambda K}
\le\frac{e^\lambda}{2-e^\lambda}=1+\sqrt2=Z.
\tag{P2}
```

The relative entropy between the actual and reference joint laws is exactly $`I`$. Its variational inequality, applied to $`\lambda K`$, gives

```math
\lambda\mathbb E K\le I+\log Z.
\tag{P3}
```

No unproved independence of the actual adaptive query and selector is used: their dependence is charged through $`I`$ in (P3).

For every conditional law of $`K`$ given $`Q,T`$, compare it with the fixed probability mass function $`e^{-\lambda k}/Z`$ on positive integers. Nonnegativity of relative entropy gives

```math
H(K\mid Q,T)\le\lambda\mathbb E K+\log Z
\le I+2\log Z.
\tag{P4}
```

Since $`K`$ is determined by $`Q,T,S`$, the information chain rule proves

```math
I(Q,K;S\mid T)
=I+H(K\mid Q,T)
\le2I+2\log(1+\sqrt2).
\tag{P5}
```

All variables used in the entropy comparison are bounded for a fixed $`n`$, apart from the harmless infinite reference support. The argument also holds trivially if $`I=\infty`$.

### 2. A proper finite-parameter threshold with identical empirical predictions

Given the actual selected sample and the output $`Q`$, perform the following finite, measurable postprocessing:

- Retain a closed threshold at $`w`$.
- Replace an open threshold at $`w`$ by the closed threshold at the smallest selected feature strictly greater than $`w`$. If there is no such feature, use the finite threshold $`w+1`$.
- Replace the constant-zero output by the closed threshold at one plus the largest selected feature.

Every resulting parameter is a finite real number. The output has exactly the same predictions as $`Q`$ on all selected observations, including repeated features. Hence every samplewise expected empirical-loss guarantee for $`Q`$ is preserved without changing its constant.

Given the full pool $`T`$, this proper output is a deterministic function of $`Q,K`$: the rank code identifies the successor or maximum, and the other cases use the displayed arithmetic. Conditional data processing and (P5) therefore give

```math
\mathop{\mathrm{CMI}}_D(A_n^{\mathrm{proper}})
\le2\mathop{\mathrm{CMI}}_D(Q)
+2\log(1+\sqrt2).
\tag{P6}
```

The actual algorithm consults only its selected input sample, not the full pool. The full pool appears solely in the conditional-information analysis.


## Final constants and conclusion

Part I establishes the improper information bound

```math
C_I=\log2+\frac{1+e}{128\eta^2(1-2^{-1/2})},
\qquad \eta=1-2^{-1/4},
```

and total empirical excess at most $`(256/\eta+8)\sqrt n`$. Part II
gives a finite proper threshold with the same empirical predictions and
information at most $`2C_I+2\log(1+\sqrt2)`$.

The elementary inequalities $`\eta>1/8`$, $`e<3`$, and
$`1-2^{-1/2}>1/4`$ give $`C_I<9`$ and $`256/\eta+8<2056`$.
Also $`2\log(1+\sqrt2)<3`$, so the proper information constant is
less than 21 nats. The empirical minimum over finite real thresholds
equals the minimum after adjoining the all-zero endpoint on every finite
sample: any parameter above the sample maximum realizes that endpoint.
This proves the displayed theorem.

Changing the information unit to bits divides the information constant
by $`\log2>1/2`$. The common constant 4096 therefore remains valid for
both information units and for every positive sample size.

## Review and verification record

The [tree and atom review](TREE_REVIEW.md), the
[properization review](PROPERIZATION_REVIEW.md), and the independent
[coordinator review](ROOT_REVIEW.md) check the written all-size argument.
The [source archive](reviewed-sources.json) preserves the exact pre-edit
drafts and their SHA256 hashes cited by those reviews. This consolidated
proof changes headings and equation labels and combines their conclusions;
it does not replace a hypothesis or omit an unresolved mathematical step.

The [finite checker](verify.py) and its [receipt](verification.json)
independently audit folded indexing and inactive-node cancellation. They
are supplementary checks, not an inference from small sample sizes to
the theorem. No Lean, external referee, sponsor acceptance, or payment
claim is made by this record.
