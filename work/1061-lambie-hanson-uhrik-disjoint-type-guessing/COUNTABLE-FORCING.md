# Disjoint-type guessing after countable forcing

**Status:** candidate proof of a preservation theorem. This does not settle Question 6.2 of Lambie-Hanson and Uhrik.

## Theorem

Suppose $`V\models\mathsf{PFA}(\omega_1)`$ and $`\mathbb R\in V`$ is any countable forcing. In $`V^{\mathbb R}`$, a sequence of disjoint types has a guessing ladder sequence **if and only if** its depths and lower interleaving reaches are both bounded. This applies to type sequences and ladder sequences not in $`V`$.

In particular one Cohen real over $`V`$ does **not** give full DTG, and it does not give a guessing sequence for the bounded-depth family $`0^{k+1}1\,0\,1^{k+1}`$. This rules out the proposed route to Question 6.2 using a first Cohen real to obtain full DTG and a second to apply the published Theorem 4.1. It does not rule out the graph construction itself, or a construction using a weaker hypothesis than full DTG.

## Proof

For the forward construction in the bounded case, apply the ZFC half of [the main proof](PROOF.md) inside the extension. For the obstruction, fix $`\mathbb R`$-names $`\dot C,\dot t`$ and work below any condition forcing that $`\dot C`$ is a ladder sequence and one specified parameter $`h`$ is unbounded on $`\dot t`$. Here $`h`$ is either depth $`d`$ or reach $`r`$; the union of these two tests suffices by strengthening conditions. Replace $`\mathbb R`$ by this cone. Normalize types to end in 1. For a type $`t`$ of positive reach, write $`t=\sigma0^{n-r}1^{n-d}`$, with $`\sigma`$ ending in 1 and containing $`r`$ zeros and $`d`$ ones.

### A ground-model poset

A record $`(\beta,k,u)`$ consists of a countable limit ordinal $`\beta`$, a natural color $`k`$, and $`u\in\mathbb R`$ which decides $`t=\dot t_k`$ of width $`n`$, with $`h(t)>0`$, and decides the increasing $`(n+1)`$-point initial segment $`a=C_\beta[n+1]`$. Its *tag* is $`(k,u)`$, its *prefix* is $`a[n]`$, and its guard marker is $`a(h(t)-1)`$. Two tags interact precisely when their colors agree and their $`\mathbb R`$-conditions are compatible. Interacting tags always decide the same type.

A condition in the auxiliary poset is a finite set of cuts below $`\omega_1`$ and a finite set of records. In reach mode it also has a finite set of flags, explained below. The order is reverse inclusion in each coordinate. Every record at $`\beta`$ and cut $`\eta<\beta`$ must pass this **guard**:

* its guard marker is $`\ge\eta`$; or
* a record at an ordinal $`\alpha\le\eta`$ has the same tag and the same $`n`$-point prefix.

In depth mode, interacting records must not have prefixes realizing their type as an unordered pair (that is, allow either prefix to provide the 1-side when testing for a forbidden match). A pair of equal prefixes never realizes a disjoint type.

In reach mode, a flag consists of a tag deciding $`t`$ with $`r>0`$, a $`d`$-tuple $`b`$ of increasing ordinals, and $`c\le\omega_1`$ strictly above $`b`$. It forbids an interacting record if its $`n`$-point prefix is entirely below $`c`$, disjoint from $`b`$, and together with $`b`$ has word $`\sigma0^{n-r}`$, with $`b`$ the 1-side. A condition permits no such conflict. For every record the condition must contain its exact flag $`b=a[d]`$, $`c=a(d)`$, with the record's tag. This condition therefore forbids every match of two interacting records, in either role: the upper prefix supplies the exact flag and the lower prefix violates it. Conversely an exact flag and an interacting record conflict precisely if those complete prefixes realize the normalized type in those roles. Any flagged lower prefix has its $`r`$-th point (index $`r-1`$) below the last marker in $`b`$.

There is no requirement of unique color or unique tag at a vertex. All records are pieces of information about a later total coloring, not themselves its values.

### Density

For every $`\beta`$ and $`v\in\mathbb R`$, it is dense to have a record $`(\beta,k,u)`$ with $`u\le v`$. Given a finite auxiliary condition, let $`\eta`$ be the largest cut below $`\beta`$, or use $`0`$ if none. Strengthen $`v`$ to decide that some ladder point $`C_\beta(j)`$ is at least $`\eta`$. Strengthen again to select $`k`$ not used by any existing record or flag, and decide $`t_k`$ with $`h(t_k)>j`$. Unboundedness guarantees there is such a $`k`$ even after finitely many are excluded. Finally decide $`C_\beta[n_k+1]`$. The guard holds at every existing cut below $`\beta`$. Add the record and, in reach mode, its exact flag. The fresh color precludes any cross-conflict, and its own prefix intersects its exact flag.

### Strong properness

Include all parameters, in particular the forcing-decision relations on finite data, in a large countable elementary model $`M`$, and set $`\delta=M\cap\omega_1`$. Every member of $`\mathbb R`$ belongs to $`M`$ because $`\mathbb R`$ is countable. Given a condition in $`M`$, adjoining cut $`\delta`$ is a valid extension. Let $`w`$ be any extension of that master candidate.

We construct a reduction of $`w`$ inside $`M`$. Keep the cuts and records whose ordinals are below $`\delta`$. Copy all records at $`\delta`$, if there are any, to one limit ordinal $`\bar\delta<\delta`$ above the retained cuts and record ordinals. Copy the full decided $`(n+1)`$-prefix, not just the first $`n`$ values. Such a simultaneous copy exists by elementarity: the finitely many tags and decisions at $`\delta`$ are all elements of $`M`$, and $`\delta`$ itself witnesses the existential assertion above any specified bound in $`M`$. In reach mode, keep all flags from $`w`$ with every marker below $`\delta`$, but replace their cutoffs $`c\ge\delta`$ by $`\omega_1`$; drop the other flags.

This finite reduction is in $`M`$, and is a valid condition. Exact flags for copied or retained records have all their coordinates below $`\delta`$, so are retained unchanged. Replacing the record ordinal of a copy does not change any compatibility test. It also does not change the validity of the guard at retained cuts: any old witness at or below such a cut was retained. Increasing a cutoff from $`c\ge\delta`$ to $`\omega_1`$ makes no difference for a prefix wholly below $`\delta`$.

Let $`s\in M`$ extend the reduction. We show that the coordinatewise union of $`s,w`$ is a condition. For any record of $`w`$ at $`\beta\ge\delta`$, the guard at $`\delta`$ either gives an identical-prefix same-tag proxy among the records of $`s`$, or its guard marker is at least $`\delta`$. If $`\beta=\delta`$, use the copy as the proxy. If $`\beta>\delta`$ and the guard gives a proxy at $`\delta`$, again use the copy. All proxies keep the *same $`\mathbb R`$-condition*, so their interactions with every $`s`$-record or $`s`$-flag are identical.

* In depth mode, an outer record having an identical proxy cannot conflict with any inner record by validity of $`s`$. If it has its $`d`$-th point $`\ge\delta`$, it cannot match a prefix wholly below $`\delta`$. Indeed if the outer prefix is the upper side, its $`d`$-th point must precede the largest lower-side point; if it is the lower side, its own largest point must precede the last point of the upper side.
* In reach mode, $`w`$-flags versus $`s`$-records were covered by the clipped flags in the reduction. A dropped flag has its final marker $`\ge\delta`$, but dropping it requires additional care: a lower prefix could have all its points below that final marker. The normalized word $`\sigma0^{n-r}`$ requires a lower-side point **after** the last marker, because $`r<n`$. Thus no dropped flag can conflict. In the other direction, an $`s`$-flag versus an outer $`w`$-record either is tested against an identical proxy in $`s`$, or that record has its $`r`$-th point $`\ge\delta`$, preventing conflict with a flag whose last marker is $`<\delta`$. Inner records of $`w`$ are already in $`s`$.
* New guard requirements occur only for a cut of $`s`$ and an outer record of $`w`$. A marker at least $`\delta`$ suffices. Otherwise use the same proxy: if the proxy is above the new cut, use its guard in $`s`$; if it is at or below the cut, it already witnesses the second option.

There are no additional constraints. This proves strong properness. There are exactly $`\omega_1`$ finite conditions, since all entries come from sets of size at most $`\omega_1`$ and singleton cuts give the reverse inequality.

### Extract the coloring in the extension

In the ground model use restricted PFA to take a filter $`H`$ on this auxiliary poset meeting the $`\omega_1`$ dense sets of the density argument. Let $`A`$ be the union of its records. For each $`\beta`$, the set of $`u`$ appearing in a record $`(\beta,k,u)\in A`$ is dense in $`\mathbb R`$. In an $`\mathbb R`$-generic extension, choose any such record whose $`u`$ is in the $`\mathbb R`$-generic filter and give $`\beta`$ its color $`k`$. Extend arbitrarily to non-limits. If two chosen records have the same color, their $`\mathbb R`$-conditions are compatible. They occurred together in an auxiliary condition of $`H`$, so their actual finite prefixes do not have the forbidden type. This is the required avoidance coloring.

## Prior art and scope

* [The source paper](https://doi.org/10.1112/mtk.12261), [open version](https://arxiv.org/abs/2312.01828): Theorem 5.2 proves the unbounded-depth obstruction in the PFA model itself. It does not make that claim for type and ladder names in extensions.
* [Asperó and Mota, Forcing consequences of PFA together with the continuum large](https://ueaeprints.uea.ac.uk/id/eprint/44058/1/tran6205ToAuthor.pdf), Introduction: one Cohen real always adds a weak club-guessing sequence (credited there to Juhász). Weak club guessing thus does not imply full DTG; this is consistent even with failure of the bounded-depth statement.
* Searches for the exact terminology with “countable forcing”, “Cohen”, “preservation”, and “weak club guessing” across the journal, arXiv indexes and Hexagon found the original paper and adjacent results but no statement of this preservation theorem. An unindexed result remains possible. Do not count it as a resolution of Question 6.2.
