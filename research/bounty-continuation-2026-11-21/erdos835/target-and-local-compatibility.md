# Erdős 835: target audit and a local compatibility route

Date: 2026-11-21. Research coordination: [repository issue 236](https://github.com/1337isnot1337/solved-conjectures/issues/236).

Status: the full problem is unresolved by this work. No bounty submission or payment claim has been made. The results below are exact reformulations and a limitation of one proof strategy, not completed bounty results. No priority claim is made for the elementary reformulations.

## 1. Exact target and payment scope

The full question is whether


```math
\exists k>2:\quad \chi(J(2k,k))=k+1.
\tag{1}
```


Here the vertices of $`J(2k,k)`$ are the $`k`$-subsets of a fixed $`2k`$-set, and two vertices are adjacent when their intersection has size $`k-1`$. Equivalently, assign $`k+1`$ colors so that the $`k+1`$ subsets contained in every $`(k+1)`$-set have all different colors. Each such family is a clique, so $`k+1`$ is already a lower bound.

A positive answer requires one actual full coloring for some $`k>2`$. A negative answer must exclude every $`k>2`$. An additional excluded parameter, a coloring of a proper induced subgraph, or a necessary condition does not complete this target.

The live [Conjectures.io target](https://conjectures.io/problems/erdos835-erdos-835) was inspected on the date above and displayed no proof or refutation attempts. Its reward is paid to a solver destination in Subnet 66 Alpha; the displayed dollar value changes and is not a fixed cash award. Recognized contributions may receive part of the bounty.

The [submission terms](https://conjectures.io/submission-terms), version 13 effective 2026-11-11, require the exact pinned Lean target, a kernel-accepted proof and mathematical novelty at acceptance. A previously established public mathematical solution disqualifies a later formalization. This investigation has not purchased a verification credit, submitted a proof, registered a payout destination, or uploaded model logs.

The inspected positive task is

    fc-v2-erdos835-erdos-835-5e6d8de2f34888079fad178e-formalized

at task repository commit 85cfaba5faee2b8738d56c959d0acc774964a399. Its source-type SHA-256 is

    f967e72c8bf53da5895721dfe2bcf951ec3b0ace3ff8180ca1355d1639d592a4

The pinned manifest declares the direct existential target production eligible. Its environment uses Lean 4.35.0-rc2 and mathlib commit 065356127b1dc0016f66b7283ce0ce2c4055aa55. The base definition in FormalConjectures/ErdosProblems/835.lean was read; the proper-subset convention is consistent with the prescribed cardinalities. No formal statement defect was identified.

## 2. Prior work that this note does not claim

The original problem and discussion are at [Erdős Problems 835](https://www.erdosproblems.com/835) and [its discussion thread](https://www.erdosproblems.com/forum/thread/835).

Ma and Tang's primary paper, [A note on Erdős Problem #835](https://github.com/QuanyuTang/erdos-problem-835/blob/main/On_Problem_835.pdf), was read in full. The inspected PDF blob is c5f3c00468c2c0afad85bedbb7b90acbe8fc8009. Their proposition gives the necessary conditions


```math
t\mid\binom{k+t}{t-1}\qquad(1\le t\le k).
\tag{2}
```


They exclude every composite $`k+1`$, and show that all conditions (2) hold when $`k+1`$ is prime. Consequently the remaining parameters have even $`k`$ and prime $`p=k+1`$.

The public research records [Erdős 835](https://erdosproblems.ai/wiki/research/erdos_835) and [Steiner color partitions](https://erdosproblems.ai/wiki/research/methods/steiner_color_partitions) were read in full. They already discuss:

- partitioning the $`k`$-subsets into $`k+1`$ Steiner systems $`S(k-1,k,2k)`$;
- complement closure of each color class;
- the top Johnson eigenspace and root-of-unity formulations;
- exact pair-intersection counts and feasible two-point positive-semidefinite data;
- large sets induced on smaller windows;
- the failure of a direct global star/top sign-product argument.

Those observations are prior work, not accomplishments of this investigation. The other agent's higher-point and representation-theoretic route is recorded separately.

## 3. The first shell is a Latin square

Fix a $`k`$-set $`B`$ of color $`0`$, and put $`C=B^c`$. For $`a\in B`$, $`b\in C`$, define


```math
L(a,b)=c\bigl((B\setminus\{a\})\cup\{b\}\bigr).
\tag{3}
```


All these colors differ from $`0`$. For fixed $`a`$, the corresponding $`k`$ vertices, together with $`B`$, are the clique of all $`k`$-sets containing $`B\setminus\{a\}`$. For fixed $`b`$, they and $`B`$ are the clique of all $`k`$-sets contained in $`B\cup\{b\}`$. Hence every row and every column of $`L`$ contains each nonzero color exactly once. Thus $`L`$ is a Latin square of order $`k`$.

Conversely, any Latin square on the $`k`$ nonzero colors gives a proper coloring of the induced Johnson ball of radius one about $`B`$: two distinct first-shell vertices are adjacent exactly when their row indices or column indices agree.

## 4. Exact second-shell extension problem

Index a second-shell vertex by $`I\in\binom B2`$ and $`J\in\binom C2`$, and write


```math
M(I,J)=c\bigl((B\setminus I)\cup J\bigr).
\tag{4}
```


For each fixed row pair $`I=\{a,c\}`$, form a complete graph on $`I\cup C`$, which has $`k+2`$ vertices. Color its edges by


```math
\begin{aligned}
\mathop{\mathrm{col}}(ac)&=0,
\\ \mathop{\mathrm{col}}(ab)&=L(c,b),
\\ \mathop{\mathrm{col}}(cb)&=L(a,b),
\\ \mathop{\mathrm{col}}(bd)&=M(I,\{b,d\}).
\end{aligned}
\tag{5}
```


The exchange of the row labels in the two middle lines is intentional: the edge $`\{a,b\}`$ represents $`(B\setminus I)\cup\{a,b\}=B-\{c\}+\{b\}`$.

Every star in (5) must have all $`k+1`$ colors, so (5) is a one-factorization of $`K_{k+2}`$. This can also be seen by identifying its edges with the $`k`$-sets containing the fixed $`(k-2)`$-set $`B\setminus I`$. At a vertex $`b\in C`$, the $`k-1`$ colors $`M(I,\{b,d\})`$, for $`d\ne b`$, must therefore be exactly the colors other than $`L(a,b)`$ and $`L(c,b)`$.

There is a transposed condition for each column pair $`J=\{b,d\}`$. On the vertices $`B\cup J`$, give $`bd`$ color $`0`$, give $`ab`$ color $`L(a,d)`$, give $`ad`$ color $`L(a,b)`$, and give $`ac`$ color $`M(\{a,c\},J)`$. This is again a one-factorization of $`K_{k+2}`$.

### Proposition

For even $`k\ge4`$, a Latin square $`L`$ and an array $`M`$ give a proper $`(k+1)`$-coloring of the radius-two ball in $`J(2k,k)`$, with center color $`0`$, if and only if all the row-pair and column-pair complete graphs just defined are one-factorizations.

### Proof

The forward implication follows from the two induced families above. For the reverse implication, the first shell is proper by the Latin condition. A first-shell vertex indexed by $`(a,b)`$ and a second-shell vertex indexed by $`(I,J)`$ are adjacent precisely when $`a\in I`$ and $`b\in J`$; the factorization for $`I`$ makes the relevant colors different.

Two distinct second-shell vertices $`(I,J)`$ and $`(I',J')`$ are adjacent precisely in one of the following cases:

1. $`I=I'`$ and $`|J\cap J'|=1`$;
2. $`J=J'`$ and $`|I\cap I'|=1`$.

The first case is handled by the row-pair factorization and the second by the column-pair factorization. There are no edges from the center to the second shell. These exhaust the adjacency possibilities, proving the assertion.

The common array entries $`M(I,J)`$ are the compatibility requirement. Completing each row-pair factorization separately does not supply a single array whose column-pair factorizations also work.

This proposition is only about a proper induced ball. It supplies neither a full coloring nor a contradiction for all remaining prime parameters.

## 5. A simple pair-parity argument does not extend

An attempted shortcut would prescribe one common sign for the relative permutations at two vertices of every one-factorization. Already on $`K_8`$, both signs occur.

First use vertices $`\mathbb F_2^3`$, with the edge $`\{x,y\}`$ colored $`x+y`$. This is a one-factorization using the seven nonzero vectors. At vertices $`0`$ and $`e\ne0`$, the shared color is $`e`$. On the six remaining colors the relative permutation is $`x\mapsto x+e`$, a product of three transpositions, and has sign $`-1`$.

Second use vertices $`\{\infty\}\cup\mathbb F_7`$, color $`\{\infty,x\}`$ by $`x`$, and color $`\{x,y\}`$, for finite $`x\ne y`$, by $`(x+y)/2`$. At a finite vertex $`x`$, the finite edges use every color except $`x`$, and the infinity edge supplies $`x`$; this is therefore a one-factorization. At vertices $`\infty`$ and $`0`$, the shared color is $`0`$. The relative permutation on $`\mathbb F_7^\times`$ is $`x\mapsto x/2=4x`$, a product of two 3-cycles, and has sign $`+1`$.

These examples disprove that proposed universal parity premise. They do not produce the simultaneous array in Section 4 and do not settle any new instance of (1).

## 6. Every fixed-width individual window eventually exists

The prior window reduction has a stronger known existence barrier than the triple-system case alone.

### Proposition

Fix $`j\ge2`$. For every sufficiently large prime $`p>j`$, there is a proper $`p`$-coloring of


```math
J(p+j-1,j).
\tag{6}
```


Equivalently, the complete $`j`$-uniform hypergraph on $`p+j-1`$ points has a large set of Steiner systems $`S(j-1,j,p+j-1)`$.

### Proof from Keevash's theorem

Use Theorem 1.2 of Peter Keevash, [The existence of designs II](https://arxiv.org/pdf/1802.05900), arXiv:1802.05900v1, p. 3. For fixed block size $`q`$ and strength $`r`$, it gives a large set of $`(n,q,r,\lambda)`$ designs for sufficiently large $`n`$, subject to the design divisibility conditions and $`\lambda\mid\binom{n-r}{q-r}`$.

Set $`q=j`$, $`r=j-1`$, $`n=p+j-1`$, and $`\lambda=1`$. The final divisibility is automatic. For $`0\le i\le j-2`$, put $`h=j-i`$; then $`2\le h\le j<p`$. The design divisibility condition is


```math
h\mid\binom{p+h-1}{h-1}.
```


Indeed,


```math
\frac1h\binom{p+h-1}{h-1}
=\frac1p\binom{p+h-1}{h}.
\tag{7}
```


The integer $`\binom{p+h-1}{h}`$ is divisible by $`p`$: its numerator contains $`p`$, its other numerator factors lie strictly between $`p`$ and $`2p`$, and $`h!`$ is coprime to $`p`$. Thus (7) is an integer. The omitted endpoint $`i=j-1`$, if included in the convention, has divisor $`1`$.

Keevash therefore gives the large set. Each design class contains exactly one $`j`$-set through every $`(j-1)`$-set, so each class is an independent set of the Johnson graph. There are


```math
\frac{\binom n j}{\binom n{j-1}/j}=n-j+1=p
```


classes. This proves (6).

### Relation to the full target, and exact limitation

A full coloring at $`k=p-1`$, restricted to the $`k`$-sets containing any fixed $`(k-j)`$-set, gives (6). Consequently, nonexistence of one individual window of a fixed width $`j`$ cannot exclude all sufficiently large prime parameters.

The quantifier “fixed” matters: the threshold in Keevash's theorem depends on $`j`$. It cannot be applied here with $`j=k`$, and this argument asserts no bound uniform in $`j`$.

A large set at any one fixed larger width $`J`$ also supplies mutually consistent restrictions to its nested smaller windows. It does not give compatibility between all the windows of a $`2k`$-point ground set. In particular, the proposition does not prove that the array in Section 4 exists, and does not preclude an obstruction involving overlapping windows.

This is an application of an established existence theorem. It is not a newly solved design problem or a completed bounty.

## 7. Each single color can satisfy its matching constraints separately

There is no obstruction at the level of completing just one selected color, even if the first-shell Latin square has already been fixed.

For color $`0`$, choose any one-factorizations of $`K_k`$ on $`B`$ and on $`C`$, and label their factors by the same $`k-1`$ symbols. Select a rectangle $`(I,J)`$ for color $`0`$ when the factors containing $`I`$ and $`J`$ have the same label. For a fixed $`I`$, its selected column pairs are exactly one perfect matching of $`C`$. For a fixed $`J`$, its selected row pairs are exactly one perfect matching of $`B`$. These are precisely the color-$`0`$ requirements of the row-pair and column-pair factorizations, because the two added vertices are already joined by their color-$`0`$ edge.

For a nonzero color $`t`$, let $`\pi_t:B\longrightarrow C`$ be the Latin permutation defined by $`L(a,\pi_t(a))=t`$. Choose a one-factorization $`\mathcal F`$ of $`K_k`$ on $`B`$. Select a rectangle $`(I,J)`$ for color $`t`$ exactly when $`I`$ and $`\pi_t^{-1}(J)`$ are distinct edges in the same factor of $`\mathcal F`$.

For a fixed $`I`$, the other edges of its factor partition $`B\setminus I`$, so the selected column pairs partition $`C\setminus\pi_t(I)`$. Thus they supply exactly the internal matching left after the two color-$`t`$ cross edges in (5). The column-pair condition is identical after applying $`\pi_t^{-1}`$. Moreover, distinct edges in one factor are disjoint, so the chosen rectangle contains no first-shell entry of color $`t`$, as required.

These constructions use only the ordinary one-factorization of an even complete graph, which exists by the standard cyclic construction. They work for every Latin square of even order $`k`$.

The constructions for different colors are independent. Their selected rectangle sets can overlap and can fail to cover other rectangles. A common coloring $`M`$ needs these sets to partition all of $`\binom B2\times\binom C2`$. No such partition or uniform obstruction to it has been obtained here.

## 8. The remaining mathematical obligation

The local route currently needs one of two substantive advances:

- prove that the simultaneous row-pair and column-pair one-factorizations of Section 4 cannot exist for every remaining even $`k>2`$, or derive a stronger overlap condition that yields such an exclusion; or
- construct compatible colorings through all Johnson distance layers for some $`k>2`$.

Neither has been achieved. Separate factorization existence, a single fixed-width design, a parity assumption contradicted by Section 5, and the already known prime divisibilities do not discharge this obligation.
