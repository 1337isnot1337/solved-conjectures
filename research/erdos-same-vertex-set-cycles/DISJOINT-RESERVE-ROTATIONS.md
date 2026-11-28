# Compatible rotation clouds from disjoint reserve edges

Partial progress on [Erdős #585](https://www.erdosproblems.com/585). This supplies simultaneous endpoint families and avoids the collision in [the independent-rotation example](PAIRED-ROTATIONS.md). It still does not force two closures.

Let $`H`$ be a bipartite [density-critical core](DENSITY-CRITICAL-PROFILE.md) with parameters $`a,w,N`$, and put $`D_*=a w(N)>3`$. Suppose $`P,Q`$ are nontrivial edge-disjoint paths using the same vertex set $`S`$. Remove their edges from the reserve and colour the remaining edges red or blue so that the two reserve degrees differ by at most one at every vertex. Such a colouring exists in any bipartite graph: in a component with odd-degree vertices, add a temporary vertex adjacent to all the odd vertices, take an Euler circuit, and discard the temporary edges to obtain trails. Alternate colours on each trail. Every original odd vertex is an endpoint exactly once, and all internal passes contribute one of each colour. In an all-even component alternate on an Euler circuit, whose length is even because the component is bipartite.

Assign the edges of $`P`$ to red and those of $`Q`$ to blue. The resulting layers $`H_R,H_B`$ are edge-disjoint and contain their respective initial paths. At every vertex the red layer degree is at least

```math
d_P(v)+\frac{d_H(v)-d_P(v)-d_Q(v)-1}{2}
\ge \frac{D_*-3}{2},
```

and the blue bound is identical. Here $`d_P,d_Q`$ are zero outside $`S`$ and never exceed two. In particular, no edge used by one layer's rotations can conflict with an edge in the other layer, regardless of rotation histories.

For either layer $`L`$, if $`t`$ edges per vertex are additionally allowed to be deleted, every nonempty proper set $`X`$ of size $`x`$ has at least $`(D_*-3-2t)x/4`$ remaining incident edges, by counting degrees and dividing by two. If $`T`$ is the set $`X`$ plus its external neighbours in this residual layer, all those incident edges lie in $`H[T]`$. Combining this with $`e_H(T)\le aP(|T|)`$, where $`P(y)=(y-1)w(y)`$ in the density profile, gives

```math
(|T|-1)w(|T|)\ge \rho xw(N), \qquad
\rho=\frac{1-(3+2t)/D_*}{4}.
```

Assume # Compatible rotation clouds from disjoint reserve edges

Partial progress on [Erdős #585](https://www.erdosproblems.com/585). This supplies simultaneous endpoint families and avoids the collision in [the independent-rotation example](PAIRED-ROTATIONS.md). It still does not force two closures.

Let $`H`$ be a bipartite [density-critical core](DENSITY-CRITICAL-PROFILE.md) with parameters $`a,w,N`$, and put $`D_*=a w(N)>3`$. Suppose $`P,Q`$ are nontrivial edge-disjoint paths using the same vertex set $`S`$. Remove their edges from the reserve and colour the remaining edges red or blue so that the two reserve degrees differ by at most one at every vertex. Such a colouring exists in any bipartite graph: in a component with odd-degree vertices, add a temporary vertex adjacent to all the odd vertices, take an Euler circuit, and discard the temporary edges to obtain trails. Alternate colours on each trail. Every original odd vertex is an endpoint exactly once, and all internal passes contribute one of each colour. In an all-even component alternate on an Euler circuit, whose length is even because the component is bipartite.

Assign the edges of $`P`$ to red and those of $`Q`$ to blue. The resulting layers $`H_R,H_B`$ are edge-disjoint and contain their respective initial paths. At every vertex the red layer degree is at least

```math
d_P(v)+\frac{d_H(v)-d_P(v)-d_Q(v)-1}{2}
\ge \frac{D_*-3}{2},
```

and the blue bound is identical. Here $`d_P,d_Q`$ are zero outside $`S`$ and never exceed two. In particular, no edge used by one layer's rotations can conflict with an edge in the other layer, regardless of rotation histories.

For either layer $`L`$, if $`t`$ edges per vertex are additionally allowed to be deleted, every nonempty proper set $`X`$ of size $`x`$ has at least $`(D_*-3-2t)x/4`$ remaining incident edges, by counting degrees and dividing by two. If $`T`$ is the set $`X`$ plus its external neighbours in this residual layer, all those incident edges lie in $`H[T]`$. Combining this with $`e_H(T)\le aP(|T|)`$, where $`P(y)=(y-1)w(y)`$ in the density profile, gives

```math
(|T|-1)w(|T|)\ge \rho xw(N), \qquad
\rho=\frac{1-(3+2t)/D_*}{4}.
```

3+2t\lt D_*`$. In either layer the external neighbourhood of $`X`$ exceeds $`Cx`$ if

```math
(C+1)x+\mathrm e^{\mathrm e}\le
\exp[(\log(N+\mathrm e^{\mathrm e}))^{\rho/(C+1)}].
```

This follows by the same strict comparison with the factor $`(C+1)x-1`$ as in the original profile. No global joinedness is asserted for either layer.

Now suppose $`S`$ is of maximum possible order among common-support path pairs in $`H`$. Fix one endpoint in each initial path, and let $`R_R,R_B`$ be the other endpoints obtainable by rotations within the corresponding layers induced on $`S`$. Use $`t=0`$ above. Every pair of endpoints in $`R_R\times R_B`$ comes with two **simultaneously** compatible paths. Write $`U_i=N_{H_i}(R_i)\setminus S`$ for their outside neighbourhoods. Then

```math
U_R\cap U_B=\varnothing.
```

Indeed, if an outside vertex were in both, attach it to one chosen reachable endpoint in each colour. Both edges are new to the paths and they are distinct because the layers are disjoint. The two vertex sets extend by the same vertex, contradicting maximality. The Pósa bound within $`H_i[S]`$ shows for each colour $`i`$ that either its endpoint cloud exceeds the size range in the displayed expansion estimate, or $`|U_i|>(C-2)|R_i|`$.

This is stronger than keeping the second path fixed while rotating the first: the no-meeting condition applies to entire independently rotatable clouds, with no compatibility assumption. What remains open in this approach is to prevent both outside neighbourhoods from staying disjoint, or to find a common support admitting closures inside the layers despite possible large bipartite holes. The existence of a nontrivial initial path pair at the sharp density is also not established by this lemma.

## Outside edges need no assigned colour

There is a stronger obstruction than disjointness of the layer neighbourhoods. The endpoint clouds depend only on the layers induced on $`S`$. Consider all edges of $`H`$ to an outside vertex $`x`$ after these clouds have been fixed. If $`x`$ has a red-cloud neighbour $`r`$ and a blue-cloud neighbour $`b`$ with $`r\ne b`$, then the selected rotated paths are compatible, and attaching $`x`$ via $`rx,bx`$ works regardless of the original edge colours. Thus whenever $`N_H(x)\cap R_R`$ and $`N_H(x)\cap R_B`$ are both nonempty, they must both equal the same singleton. Both endpoint clouds can therefore be compared using the full, unsplit exterior of $`H`$, not just their own layers. A shared endpoint still needs genuinely distinct edges.

Likewise one can set aside a third reserve for closing edges without losing simultaneous small-set expansion. To split the unpinned reserve into three layers, split each vertex into clones of degree three plus at most one smaller clone, and properly edge-colour the resulting bipartite graph with three colours by Kőnig's line-colouring theorem. Each original vertex has at least $`\lfloor d_{\mathrm{res}}(v)/3\rfloor`$ incident edges of each colour. Add the initial paths to the first and second layers, respectively. They have minimum degree at least $`(D_*-4)/3`$: for the red layer use $`d_P+\lfloor(d_H-d_P-d_Q)/3\rfloor\ge(d_H+2d_P-d_Q-2)/3`$; the blue layer is symmetric. Thus the same incidence calculation gives a positive simultaneous small-set expansion factor when $`D_*>4`$. If the two fixed endpoints have edges in the third reserve to their respective reachable endpoint clouds and those two edges are distinct, they close the paths into two edge-disjoint cycles on $`S`$. The argument does not ensure those reserve edges exist; in particular the bipartition requires opposite-colour endpoints for each closure.
