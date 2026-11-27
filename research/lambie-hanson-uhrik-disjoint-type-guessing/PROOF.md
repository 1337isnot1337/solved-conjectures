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

A condition consists of a finite set of cuts $x\subseteq\omega_1$, a finite partial coloring $g$ of countable nonzero limit ordinals with the chosen colors, and finitely many flags. Require:
1. $g$ has no same-color pair realizing the prescribed type of that color or its opposite.
2. No colored ladder is forbidden by a flag.
3. For every $\delta\in x$ and $\beta\in\operatorname{dom}(g)$ with $\beta>\delta$, putting $k=g(\beta)$, either $C_\beta(r_k-1)\ge\delta$, or there is $\beta'\le\delta$ in $\operatorname{dom}(g)$ of color $k$ with the same first $n_k$ ladder points as $\beta$.

Order by extension of all three coordinates. The poset has size $\aleph_1$. The conditions coloring a given limit ordinal $\alpha$ are dense: take a fresh color outside the finitely many colors used in the map or the flags, with $r_k$ larger than the number of points of $C_\alpha$ below the largest cut strictly below $\alpha$ (ignore this last requirement if no such cut exists). Such fresh colors exist by unboundedness. The guard in (3) now holds at all relevant cuts.

### Strong properness

Let $M$ be a countable elementary submodel containing the poset and its parameters, and put $\delta=M\cap\omega_1$. For $p\in M$ add $\delta$ as a cut. This is a condition, since every originally colored ordinal in $p$ is below $\delta$. Let $q$ be any extension of this condition. We may first strengthen $q$ to color $\delta$; a reduction for this stronger condition is also a reduction for $q$. Write $k_*=g_q(\delta)$. By elementarity choose $\bar\delta<\delta$ with $C_{\bar\delta}[n_{k_*}]=C_\delta[n_{k_*}]$, above every cut and colored ordinal from $q$ below $\delta$. Indeed $\delta$ is a witness in the ambient structure for any such lower bound and the finite prefix belongs to $M$.

Define an inner condition $q_M$ as follows.
- Keep the cuts and colored ordinals of $q$ below $\delta$. Add $\bar\delta$ colored $k_*$.
- For every flag of $q$ whose tuple is entirely below $\delta$, keep the tuple and color, replacing its cutoff by $\omega_1$ if the cutoff is at least $\delta$. Discard flags with a tuple point at or above $\delta$.
- For every colored $\beta\ge\delta$ in $q$, with color $k$, add a flag if all its first $d_k$ ladder points are below $\delta$. This flag uses those points as its tuple and cutoff $C_\beta(d_k)$ if below $\delta$, otherwise $\omega_1$.

All data of $q_M$ are in $M$. It is a condition. Its colored prefixes are among those of $q$, including the copy of $\delta$, so the pair test is preserved. A truncated cutoff has precisely the original effect on ladders lying entirely below $\delta$. A flag added from an outer colored ladder forbids precisely the lower orientation of an actual bad pair for a ladder below $\delta$; it cannot forbid that outer ladder's own copy, since the tested prefixes must be disjoint. Hence the flag test holds. For an old inner cut and the copied ordinal $\bar\delta$, the original requirement for the color on $\delta$ supplies the same guard or an old inner proxy.

Let $s\in M$ extend $q_M$. We verify that the coordinatewise union of $s$ and $q$ is a condition. All new interactions concern an outer colored ordinal $\beta\ge\delta$ or an outer flag or cut.
- **Pairs:** If the outer colored prefix has a same-color copy in $s$, the pair test is inherited from $s$. This includes $\beta=\delta$ and all branches of (3) at $\delta$ which supply a proxy. Otherwise the guard gives $C_\beta(r_k-1)\ge\delta$. The outer ladder cannot act as the lower sequence in a bad pair with any inner ladder: that orientation would put its first $r_k$ points below the inner ladder's last interleaving marker, which is below $\delta$. If the outer ladder acts as the upper sequence, all its first $d_k$ points must be below the inner ladder's maximum, hence below $\delta$; its flag in $q_M$ precisely forbids the pair.
- **Flags:** A flag from $q$ cannot newly forbid an inner ladder, by the truncation rule (a discarded marker would have to lie below the inner ladder's maximum). A flag from $s$ cannot forbid an outer ladder with a copy in $s$. For any remaining outer ladder the guard puts its $r_k$-th point at or above $\delta$, while the flag tuple lies below $\delta$.
- **Cuts:** A cut of $q$ at or above $\delta$ adds no constraint on an inner colored ordinal. For an inner cut $\eta<\delta$ and an outer colored $\beta$, the guard at $\delta$ propagates to $\eta$. In the copy case, if the copy is at most $\eta$ it is itself a proxy. Otherwise the requirement for the copy at $\eta$ in $s$ gives either the same guard or a still earlier proxy for $\beta$.

Thus the union is a common extension. The added cut is strongly generic, so the poset is proper. Use $\operatorname{PFA}(\omega_1)$ to meet the $\aleph_1$ dense coloring requirements. The union of the partial colorings avoids every prescribed same-color type. Because the starting ladder sequence was arbitrary, this proves the negative assertion.
