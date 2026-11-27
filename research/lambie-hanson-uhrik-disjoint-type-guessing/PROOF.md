# Lambie-Hanson and Uhrik’s disjoint-type guessing problem

**Status:** complete candidate proof, pending independent review and priority checks.

[Lambie-Hanson–Uhrik (2024), Question 6.1](https://doi.org/10.1112/mtk.12261) asks whether bounded depth suffices for disjoint-type guessing. The answer is independent of ZFC, relative to the consistency of ZFC. In fact there is a two-parameter classification of the families which always work.

## Statement and notation

A type of width $n\ge1$ is a binary word with $n$ copies each of 0 and 1. It describes the increasing merge of two disjoint sets of size $n$. In each type $t$ we may exchange 0 and 1 to arrange that its last symbol is 1. Let $d(t)$ be the number of 1s before the last 0, the authors' depth. If $d(t)=0$, put $r(t)=0$. Otherwise let $r(t)$ be the number of 0s before the last 1 which precedes the last 0. Equivalently the normalized word is
\[
 t=\sigma\,0^{n-r(t)}\,1^{n-d(t)},
\]
where $\sigma$ ends in 1, with $d(t)$ ones and $r(t)$ zeros (or is empty when $d(t)=0$). In particular $d(t),r(t)<n$.

A ladder sequence $(C_\alpha)$ gives an increasing cofinal sequence of order type $\omega$ at each nonzero countable limit ordinal $\alpha$. It guesses $(t_k:k<\omega)$ if for every $f:\omega_1\to\omega$, there are two distinct limit ordinals of the same color $k$ whose first $n_k=\operatorname{width}(t_k)$ ladder points have type $t_k$ or its opposite.

**Theorem.**
1. If $d(t_k)$ and $r(t_k)$ are both bounded, such a guessing sequence exists in ZFC.
2. If either parameter is unbounded, then $\operatorname{PFA}(\omega_1)$ implies no such guessing sequence exists.
3. Club guessing implies the existence of a guessing sequence for all types, as already proved in the source.

For example the sequence $t_k=0^{k+1}1\,0\,1^{k+1}$ has depth constantly 1 and $r(t_k)=k+1$. Thus bounded depth alone is insufficient in the negative model, whereas $\diamondsuit$ gives a positive model. See Theorems 2.8 and 5.2 of the source; its Section 5 explicitly recalls that $\operatorname{PFA}(\omega_1)$ is consistent relative to ZFC, with no large cardinal required. The depth-unbounded part of (2) is exactly their Theorem 5.2 and is not claimed as new.

## ZFC: simultaneous bounds on both parameters

Fix a ladder sequence such that every finite increasing sequence of countable ordinals occurs as an initial segment of stationarily many ladders. Such a sequence is obtained by indexing all finite sequences by $\omega_1$, partitioning the countable limit ordinals into $\omega_1$ disjoint stationary sets, and prescribing the corresponding prefix whenever the ordinal is greater than that prefix. This is the same choice as in the source's Theorem 2.7.

Let $L$ be a positive integer exceeding both uniform bounds. For a given $f$, choose a nested sequence of countable elementary submodels $M_0,\dots,M_{L-1}$ of a sufficiently large $H(\theta)$ containing all parameters, with $\delta_i=M_i\cap\omega_1$ strictly increasing. Choose a countable model $M_*$ containing these models, with $\beta=M_*\cap\omega_1$, such that $C_\beta(i)=\delta_i$ for $i<L$. This is possible by stationarity of the prefix and the club of relevant model ordinals. Set $k=f(\beta)$ and $r=r(t_k), d=d(t_k), n=n_k$.

Write $\exists^\infty$ for unboundedly many countable ordinals. The standard elementarity argument in Theorem 2.7 gives
\[
 \exists^\infty u_0\,\cdots\,\exists^\infty u_r\,\exists^\infty \alpha:
 \quad \alpha\text{ is a limit},\ f(\alpha)=k,\ 
 (u_0,\ldots,u_r)\text{ is the initial segment of }C_\alpha .
\]
For completeness, the prefix $(\delta_0,\ldots,\delta_r)$ and $\beta$ witness the innermost relation above all bounds in $M_*$, so elementarity first replaces $\beta$ by the unbounded quantifier. Next use $M_r$ and the witness $\delta_r$ above its bounds, then descend through $M_{r-1},\dots,M_0$. At each step the earlier prefix is in the model used, and the inner unbounded assertions already hold in the ambient structure.

If $d=0$, choose $\alpha<\delta_0$ of color $k$ by elementarity in $M_0$. Its whole ladder is below $C_\beta(0)$, so gives the separated type.

If $d>0$, choose the first $r$ lower points $u_0,\ldots,u_{r-1}$ so that their merge with $\delta_0,\ldots,\delta_{d-1}$ is $\sigma$. For a lower point whose next upper cut in $\sigma$ is $\delta_j$, use $M_j$ and the current unbounded assertion to choose it strictly between $\delta_{j-1}$ and $\delta_j$, above the previous selected lower point (omit the left bound for $j=0$). The previous chosen points and all parameters of the unbounded assertion belong to $M_j$, and this preserves the assertion for the remaining points. Then use $M_d$ to choose $u_r>\delta_{d-1}$ and $\alpha<\delta_d$, with $f(\alpha)=k$ and the selected initial segment. The choices exist because the cut points and earlier choices are in $M_d$. All remaining lower ladder points are between $\delta_{d-1}$ and $\delta_d$. The merge of the two full $n$-prefixes therefore has exactly type $\sigma 0^{n-r}1^{n-d}$, as desired. This argues for ordinary guessing; it does not assert the strong unbounded-predecessor variant.

## Negative model when the lower parameter is unbounded

Assume that $r(t_k)$ is unbounded. Use only the infinite set of colors $k$ with $r_k=r(t_k)>0$, which does not change the goal of producing an avoiding map into $\omega$. Write $d_k=d(t_k)>0$ and $\sigma_k$ for the normalized initial interleaving word. Fix an arbitrary ladder sequence.

For a fixed color $k$, a **flag** consists of $k$, an increasing $d_k$-tuple $\mathbf b$ of countable ordinals, and an ordinal $c>\max\mathbf b$ with $c\le\omega_1$. It forbids a colored ladder of color $k$ if its first $n_k$ points are disjoint from $\mathbf b$, their merge with $\mathbf b$ has word $\sigma_k0^{n_k-r_k}$, and all those points are strictly below $c$. The value $\omega_1$ acts as no upper bound. In particular any ladder forbidden by this flag has at least its first $r_k$ points strictly below $\max\mathbf b$. If $\mathbf b$ is the first $d_k$ points of a ladder $B$ and $c=B(d_k)$ (zero-based), the test holds for $A$ exactly when the $n_k$-prefixes of $(A,B)$ have normalized type $t_k$.

A condition consists of a finite set of cuts $x\subseteq\omega_1$, a finite partial coloring $g$ of the nonzero countable limit ordinals with the chosen colors, and a finite set of flags $F$. For a colored $\beta$ of color $k$, its **exact flag** uses its first $d_k$ ladder points as the tuple and $C_\beta(d_k)$ as the cutoff. Require:
1. $F$ contains the exact flag of every colored ordinal.
2. No colored ladder is forbidden by any flag.
3. For every $\delta\in x$ and colored $\beta>\delta$ of color $k$, either $C_\beta(r_k-1)\ge\delta$, or there is a colored $\beta'\le\delta$, also of color $k$, with the same first $n_k$ ladder points as $\beta$.

The first two requirements already enforce avoidance of both orientations of every same-color type, by testing the lower sequence against the exact flag of the upper sequence. Here lower and upper refer to the normalized type, not necessarily to the order of the ladder ordinals themselves.

Order by extension of all three coordinates. The poset has size $\aleph_1$. The conditions coloring a given limit ordinal $\alpha$ are dense: choose a fresh color outside the finitely many colors already used in the map or the flags, with $r_k$ larger than the number of points of $C_\alpha$ below the largest cut strictly below $\alpha$ (ignore this last requirement if there is no such cut). Add $\alpha$ in that color and its exact flag. The new flag cannot forbid its own ladder, since it shares points with its tuple. The guard in (3) holds at every relevant cut.

### Strong properness

Let $M$ be a countable elementary submodel containing the poset and all its parameters, and put $\delta=M\cap\omega_1$. For $p\in M$ add $\delta$ as a cut. This is a condition, since every colored ordinal of $p$ lies below $\delta$. Let $q$ be any extension of the resulting condition. We may first strengthen $q$ to color $\delta$; a reduction for this stronger condition is also a reduction for the original $q$. Write $k_*=g_q(\delta)$. By elementarity choose $\bar\delta<\delta$ with $C_{\bar\delta}[n_{k_*}]=C_\delta[n_{k_*}]$, above every cut and colored ordinal from $q$ below $\delta$. Indeed the finite prefix belongs to $M$, and $\delta$ is a witness in the ambient structure for any such lower bound.

Define an inner condition $q_M$ as follows:
- Keep the cuts and colored ordinals of $q$ below $\delta$. Add $\bar\delta$ colored $k_*$.
- For every flag of $q$ whose tuple is entirely below $\delta$, keep its tuple and color, replacing its cutoff by $\omega_1$ if the cutoff is at least $\delta$. Discard all other flags.

All these finite data are in $M$. The exact flags for every retained or copied ordinal are present: each such exact flag already occurs in $q$ entirely below $\delta$, and copying the prefix copies its first $d_k+1\le n_k$ points. The truncated flags have the original effect on any prefix contained in $\delta$, so none forbids a retained or copied ordinal. For an inner cut and the new copy $\bar\delta$, apply the original requirement at that cut to $\delta$: it gives the same guard or an old inner proxy. Thus $q_M$ is a condition.

Let $s\in M$ extend $q_M$. The coordinatewise union of $s$ and $q$ is well defined, and still contains the exact flag for each colored ladder. For the remaining tests:
- **Flags on inner ladders:** A flag from $q$ with any tuple point at or beyond $\delta$ cannot forbid an inner ladder, because the last tuple point must precede the ladder prefix's last point. Any other flag from $q$ has equivalent effect on inner ladders to its version kept in $q_M$ and hence in $s$.
- **Flags on outer ladders:** For a colored $\beta\ge\delta$ from $q$, either it has a same-color prefix copy in $s$ or it has $C_\beta(r_k-1)\ge\delta$. The case $\beta=\delta$ uses $\bar\delta$; for $\beta>\delta$ these are the alternatives of (3) at $\delta$, replacing a proxy equal to $\delta$ by its copy. In the copy case no flag of $s$ forbids the copy. In the guard case all tuple markers of flags of $s$ lie below $\delta$, and those flags would have to put the first $r_k$ points of the outer ladder below the last marker. Thus no new flag conflict is possible.
- **Cuts:** An outer cut places no restriction on an inner colored ordinal. For an inner cut $\eta<\delta$ and an outer colored ordinal $\beta$, the guard at $\delta$ propagates to $\eta$. In the copy case, if the copy is at most $\eta$ it is itself a proxy. Otherwise the requirement for the copy at $\eta$ in $s$ gives the same guard or a still earlier proxy for $\beta$.

Thus the union is a common extension. The added cut is strongly generic, so the poset is proper. Use $\operatorname{PFA}(\omega_1)$ to meet the $\aleph_1$ dense coloring requirements. The union of the partial colorings avoids every prescribed same-color type. Because the starting ladder sequence was arbitrary, this proves the negative assertion.
