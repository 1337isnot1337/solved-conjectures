# Successor-cardinal preservation for the four-pattern construction

A follow-up to Erdős–Galvin–Hajnal Problem 9/C and the $`\omega_1`$ proof in [#1082](https://github.com/1337isnot1337/solved-conjectures/pull/1082). It is not a different fixed-cardinal conjecture and does not replace the negative consistency argument at $`\omega_1`$.

Suppose $`\kappa`$ is infinite regular and $`\kappa^{<\kappa}=\kappa`$, and put $`\lambda=\kappa^+`$. There is a $`<\kappa`$-closed, $`\lambda`$-cc forcing of size $`\lambda`$ adding a triple system on $`\lambda`$ of chromatic number $`\lambda`$ that omits the same four patterns. If $`2^\kappa=\lambda`$ holds in the ground model, it remains true in the extension.

## What changes in the forcing

Use exactly the conditions of the $`\omega_1`$ proof, except that supports are subsets of $`\lambda`$ of size $`<\kappa`$, not necessarily finite. Each condition consists of a support, a triple system on the support, and a regressive threshold $`b`$ on its positive points. Each repeated pair is bottom in every triple extending it; every triangle of the shadow is present as a triple. A shadow edge $`u<v`$ must satisfy $`b(v)\le u`$. Extensions extend the threshold function and preserve all triples on the old support.

The union of a descending chain of fewer than $`\kappa`$ conditions has support of size less than $`\kappa`$, by regularity. Any putative violation of the bottom-pair rule or triangle-shadow rule has finitely many witnessing vertices and edges, all seen together at some stage of the chain. The same union preserves all earlier induced conditions. Thus the forcing is $`<\kappa`$-closed.

For $`\delta<\lambda`$, there are at most $`\kappa`$ subsets of $`\delta`$ of size less than $`\kappa`$. Every $`{<}\kappa`$-subset of $`\lambda`$ is bounded, so in total there are $`\lambda`$ such supports. For each support there are at most $`\kappa`$ possible edge data and threshold functions, again using $`\kappa^{<\kappa}=\kappa`$. Fix an injective coding of the supports by ordinals below $`\lambda`$; there is a club $`C`$ of $`\delta<\lambda`$ such that every bounded $`{<}\kappa`$-subset of $`\delta`$ has its code below $`\delta`$. To get this club, close under the map taking $`\gamma<\lambda`$ to a strict bound on the codes for all $`{<}\kappa`$-subsets of $`\gamma`$. At a point of cofinality $`\kappa`$, all $`{<}\kappa`$-subsets are bounded.

For the chain condition, enumerate $`\lambda`$ conditions $`p_\xi`$, and press down the code of $`s_{p_\xi}\cap\xi`$ on $`C\cap E^\lambda_\kappa`$, obtaining a fixed root $`R`$ on a stationary set. Choose $`\lambda`$ many $`\xi`$ successively above all previously chosen supports; this is possible by regularity of $`\lambda`$. The supports then form a delta system with initial root $`R`$. There are at most $`\kappa`$ possible threshold, root-triple and root-shadow profiles on that fixed root. Thin to agreement. The free-union argument from #1082 works for every finite subfamily, so we obtain precaliber $`\lambda`$, in particular the $`\lambda`$-cc.

The forcing preserves $`\kappa,\lambda`$: $`<\kappa`$-closure preserves $`\kappa`$ and its regularity (for $`\kappa=\omega`$ this needs no closure), and $`\lambda`$-cc preserves $`\lambda`$. If $`2^\kappa=\lambda`$, the number of nice names for subsets of $`\kappa`$ is at most $`\lambda^\kappa=\lambda`$: each of $`\kappa`$ coordinates needs an antichain of at most $`\kappa`$ conditions from a poset of size $`\lambda`$.

## Chromaticity

Suppose $`p`$ forces a coloring into some $`\theta<\lambda`$. Work on $`C\cap E^\lambda_\kappa`$, discarding initial bounded segments as needed. For every eligible $`h<x`$, add $`x`$ isolated with bound $`b(x)=h`$ and extend to $`q_{h,x}`$ deciding its color.

For fixed $`h`$, press down the code of $`s_{q_{h,x}}\cap x`$, fixing it to $`R_h`$ on a stationary set of $`x`$. On a stationary subset also fix the color, and fix the profile on $`U_h=R_h\cap h`$ as read in the full conditions (including root shadow pairs witnessed by a vertex outside the root). These are at most $`\kappa<\lambda`$ possibilities even when $`U_h`$ is infinite. Then press down the code of $`U_h`$ as $`h`$ varies, obtaining a fixed $`R`$, and fix the profile and color on a stationary set of $`h`$.

Choose $`h_0<h_1<h_2`$, each higher than all earlier sets $`R_{h_i}`$. Then choose $`x_i`$ in the stationary set for $`h_i`$, each above all three $`h_j,R_{h_j}`$, with successive $`x_i`$ above all previous supports. The conditions have pairwise intersection exactly $`R`$, which lies below all petals. The bounds $`b(x_i)=h_i`$ give root-isolation, and all three marks are above all bounds. Free-union the conditions and add the triple on the three marks. The bottom-pair, shadow and induced-extension checks are identical to the finite-support proof: each test is on finitely many points. This forces a monochromatic triple.

Finally the four exclusions follow from the two universal local constraints exactly as for $`\omega_1`$. No assertion is made here at singular $`\kappa`$ or about realizing a proper class of these extensions simultaneously.
