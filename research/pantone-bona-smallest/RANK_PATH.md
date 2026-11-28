# Pantone–Bóna's smallest-terminal growth conjecture: exact rank paths and upper bound

This is partial progress on [Bóna–Pantone Conjecture 5.1](https://arxiv.org/html/2103.06918v2#S5). It does not prove the conjectured growth rate $9$, the precise asymptotic in Conjecture 5.3, or non-D-finiteness in Conjecture 5.2.

Let $`\mathcal D_k=\mathop{\mathrm{Av}}(A_{k,1})`$. A permutation is in $\mathcal D_k$ exactly when after every increasing subsequence of length $k-1$, all further entries are smaller than its first value. In particular its longest increasing subsequence has length at most $k-1$. The set is skew closed: an increasing subsequence is contained in one skew summand, and any later skew summand has smaller values.

## 1. Bound by removing left-to-right minima

Delete the left-to-right minima. They form a decreasing subsequence and the remaining permutation is in $\mathcal D_{k-1}$. In fact, if the remainder had an increasing subsequence of length $k-2$ followed by an entry above its first value, prepend a left-to-right minimum that comes before and below that first value. The resulting length-$`k`$ pattern violates membership in $\mathcal D_k$.

For a permutation of length $n$, a coloring with $j$ deleted entries requires at most $\binom nj^2$ choices of their positions and labels. Their order is decreasing; the remainder is a member of $\mathcal D_{k-1}$. If its growth rate is $\lambda$, then for every $b>\lambda$ the resulting bound is
```math
  |\mathcal D_k\cap S_n|
  \le C_b \sum_{j=0}^{n}\binom nj^2b^{n-j}
  \le C_b(1+\sqrt b)^{2n}.
```
Here the last inequality follows by expanding the square of the sum of the nonnegative numbers $\binom nj (\sqrt b)^{n-j}$. Thus
```math
  (k-2)^2\le \mathop{\mathrm{gr}}(\mathcal D_k)
       \le (k-4+\sqrt{2+\sqrt5})^2\qquad(k\ge4).
```
The lower bound is the monotone subclass already recorded by Bóna–Pantone; the upper uses iteration from $`\mathop{\mathrm{gr}}(\mathcal D_4)=2+\sqrt5`$ by [Callan–Mansour, Theorem 1](https://arxiv.org/html/1602.05182v1). Growth rates exist by skew closure and Fekete's lemma. For $k=5$, the upper bound is $3+\sqrt5+2\sqrt{2+\sqrt5}\approx9.35241$, not $9$. The merge estimate is standard; the construction above gives the inclusion needed to apply it here.

## 2. Exact rank-$`(k-1)`$ insertion paths

A point's rank is the maximum length of an increasing subsequence ending at it. Delete every rank-$`(k-1)`$ point of a member of $\mathcal D_k$; the standardized remainder $\sigma$ of length $m$ avoids $12\cdots(k-1)$. Let $d=k-2$. For $0\le p,q\le m$, an insertion site $(p,q)$ means inserting after exactly $p$ old positions and above exactly $q$ old values. Define $b(p,q)$ to be the minimum first value of a length-$`d`$ increasing subsequence in the first $p$ positions of $\sigma$ with all values at most $q$. Leave $b$ undefined if no witness exists.

Call $(p,q)$ eligible if $b(p,q)$ is defined and the suffix of $\sigma$ after position $p$ has no value at least $b(p,q)$. Construct an acyclic directed graph on eligible sites, with edge from $(p,q)$ to $(p',q')$ exactly when
```math
  p'>p,\qquad q'\lt b(p,q).
```
Then members of $\mathcal D_k$ whose rank deletion gives $\sigma$ are in exact bijection with the directed vertex paths in this graph, including the empty path. A path of $r$ vertices gives length $m+r$.

To prove necessity, rank-$`(k-1)`$ points decrease in value in reading order. None can occur in a witness for the rank of another: any such point before and below another would extend its own increasing subsequence to length $k$. Hence their witnesses are exactly the increasing length-$`d`$ subsequences among old points in their indicated prefix and value range. Membership in $\mathcal D_k$ forces all old points and all newly inserted points after a site below its minimum witness start. Two consecutive new points cannot use the same position gap: a witness for the second lies entirely in the old points, before both and below the second, and would supply a witness for the first with starting value below the second, contradicting avoidance. Thus positions strictly increase and the edge condition holds for consecutive sites.

Conversely, insert points at the sites of a path. Position gaps are distinct, and value gaps strictly decrease since $b(p,q)\le q$. Each inserted point ends an increasing length-$`(k-1)`$ subsequence by eligibility. Every old point after it lies below the starting value of every such old witness, by the suffix condition. Every new point after it does too: the next gap is below $b(p,q)$ in the sense $q'<b(p,q)$, and all subsequent gaps decrease. In particular all later points are smaller than this inserted point. Therefore it cannot lie anywhere but last within an increasing subsequence. Since the old points avoid length $k-1$, every increasing subsequence of length $k-1$ ends at an inserted point and was already accounted for. This proves avoidance and also that exactly the inserted points are removed by the rank deletion.

Consequently, if $P_\sigma(z)$ counts vertex paths by number of vertices (constant term 1), then
```math
 \sum_{n\ge0}|\mathcal D_k\cap S_n|z^n
 =\sum_{m\ge0} z^m
    \sum_{\sigma\in \mathop{\mathrm{Av}}_m(12\cdots(k-1))}P_\sigma(z).
```
This replaces the unrestricted tail at the first rank-$`(k-1)`$ element by a path with local compatibility conditions. It does not yet control the average exponential path count at the critical radius $z=(k-2)^{-2}$. [check.py](check.py) tests the derived counts against literal avoidance at small lengths.

## 3. An independent active-site description

A second elementary formulation is useful for future work. Prepend an entry above exactly $q$ of the old values, and consider the subpermutation of values higher than that new first entry. The insertion is valid if and only if the new upper subpermutation has no increasing length-$`(k-2)`$ subsequence ending before its last position. Indeed a forbidden pattern using the newly prepended entry would need it as its first element, and all subsequent elements of the forbidden pattern are larger than it. Thus the allowable first entries form a contiguous top interval of value gaps. This criterion alone does not close a finite recurrence for its interval length: when an inserted entry participates in a witness, the last position in a larger upper subset may be a different old element.

Source screening: the original paper explicitly left $k=5$ undecided; searches by its title, literal basis, claimed bound, and left-to-right-minimum formulation did not find an earlier resolution of Conjecture 5.1 as of 24 November 2026. Callan–Mansour's enumeration is prior, the merge inequality is standard, and no claim of priority for these structural observations is made.
