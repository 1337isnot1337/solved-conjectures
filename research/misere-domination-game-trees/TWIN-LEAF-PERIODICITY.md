# Misère Domination Game on Trees

**Twin-leaf periodicity with a uniform cutoff.** Fix an arbitrary finite graph as a core and attach $k$ new leaves adjacent only to a specified core vertex $v$. For the initial position, the normal Sprague–Grundy value and the misère outcome are both periodic in $k$ with period two from $k=2m+1$ onward, where $m$ is the number of core vertices. The same cutoff $2|U|+1$ holds from a partial position with live core set $U$, counting only live leaves. The conclusion allows arbitrary edges among the core vertices and does not solve the winner problem on unrestricted trees.

## Exact recurrence

Write $U$ for the live core targets and $k$ for the number of live new leaves. Leaf identities are immaterial. Original dominated leaves are still possible move centers, but their only other target is $v$. If $v$ is live, all attached leaves must still be live in any reachable position because every move dominating an attached leaf also dominates $v$. For $k>0$ a leaf move always takes $(U,k)$ to $`(U\setminus\{v\},k-1)`$. Playing a dominated attached leaf to hit $v$ alone is never an additional option in a reachable position. The boundary value at $k=0$ can still be defined by having no attached leaves. Playing $v$ at $k>0$ deletes every attached leaf and a fixed subset of $U$, so its child outcome depends on $U$ but not on $k$. Every other legal move affects a strictly smaller live core set with the same $k$. At $k=0$ and $v\notin U$, dormant leaves cannot affect play, so identification with the core-only position is exact for the recurrences that need this boundary.

## Normal play

Induct on $|U|$, and put $T_m=2m+1$. With empty $U$, the positive-$`k`$ game has precisely the option to delete all leaves and to delete just one. Its Grundy values are one at odd $k$ and two at even positive $k$, giving the claim for $T_0=1$.

If $v\in U$, the leaf move has already reduced $|U|$, so every option Grundy value is periodic once $k\ge T_{m-1}+1$. Fixed sets of move centers for $k>0$ give periodicity of the mex. If $v\notin U$, all option values except the leaf move form a set $S_k$ that is periodic once $k\ge K=T_{m-1}$. With $g_k$ the Grundy value at $(U,k)$, write
```math
 g_k=f_k(g_{k-1}),\qquad
 f_k(x)=\mathop{\mathrm{mex}}(S_k\cup\{x\}).
```
If $a_k<b_k$ are the first two missing nonnegative integers of $S_k$, then $f_k(x)=a_k$ unless $x=a_k$, when $f_k(x)=b_k$. In particular $f_k(x)\ne x$. At the parity of $K$, the two-step map $F=f_K\circ f_{K+1}$ takes values in $`\{a_K,b_K\}`$ and fixes $a_K$: the intermediate value $f_{K+1}(a_K)$ cannot equal $a_K$. It either fixes $b_K$ too or sends it to $a_K$. Since $g_K$ is in this two-element set, after the first two-step update it is at a fixed point. The intervening parity is then determined by the same one-step rule. This gives $g_{k+2}=g_k$ for every $k\ge K+2=T_m$.

## Misère play

Let $w_k$ indicate that the next player wins. The empty-core game has $w_0=1$, and its positive-$`k`$ values alternate: clearing all ends the game and loses, so taking one is winning exactly when the resulting count loses. The case $v\in U$ again follows from the smaller-set induction. If $v\notin U$, let $A_k$ indicate that at least one non-leaf move leads to a losing child. It is periodic from $K=T_{m-1}$. The recurrence is
```math
 w_k=A_k\lor\neg w_{k-1}.
```
On either parity, the two-step map is the identity if both $A$'s are false, and constant otherwise. It is therefore idempotent. The same bound $K+2=T_m$ follows.

This proof does not discard leaves in pairs indiscriminately: a dominated center can remove every remaining attached leaf in one move, and the small-$`k`$ boundary can interact with the rest of the graph. It bounds exactly how far those interactions can propagate when the other live targets are fixed.
