# Erdős 617: independent audit of the extremal core normalization

21 November 2026. This reviews `erdos617-extremal-core-normalization.md`, including its revised argument excluding a globally connected extremizer. The normalization is valid under the stated necessary one-color hypotheses and the identified external theorem. It is not a full solution, a Lean certificate, or a priority claim.

## 1. The optimization class is well-defined

Fix r≥6 and N=r²+1. Let

```math
T_r(m)=r\binom u2+uv\quad(m=ur+v,\ 0\le v\lt r),
\qquad
P_r(m)=\binom m2-(r-1)T_r(m).
```

The class consists of graphs G on a fixed N-vertex set with alpha(G)≤r and e(G[W])≤P_r(|W|) for every subset W. It is finite. A hypothetical balanced coloring supplies a member, and its sparsest color supplies one with at most B=rN/2 edges. Hence a global edge-minimum H in the class has e(H)≤B.

Deleting an edge preserves all the upper caps. If alpha(H)≤r−1, deleting any edge would still leave independence at most r, because one edge deletion increases independence by at most one. H has at least one edge since N>r. This contradicts minimality. Therefore alpha(H)=r, and every edge deletion increases independence to r+1. Componentwise additivity then shows that every component is independence-critical at its own independence number.

This minimizer need not be a subgraph of any originally chosen color. The proof is an optimization over necessary conditions, not a recoloring operation.

## 2. Padding closure is correct for every tested subset

For k=ur+v, 0≤v<r, and 0≤ell≤r, the exact difference is

```math
P_r(k+\ell)-P_r(k)-\binom\ell2
=u\ell+v\ell-(r-1)\mathop{\mathrm{max}}(0,v+\ell-r).
```

If v+ell≤r, this is u ell+v ell≥0. Otherwise it is

```math
u\ell+(r-v)(r-\ell)+(v+\ell-r)\ge0.
```

Thus adjoining an isolated clique of order at most r preserves every palette cap. For an arbitrary tested vertex set, use k equal to its intersection size with the retained induced graph and ell equal to its intersection size with the new clique. Iteration handles any number of new cliques.

The closure is for the palette caps only. The independence threshold still needs its own proof in each replacement below; it is not automatic.

## 3. Minimum degree in a noncomplete component

Take a minimum-degree vertex v of a noncomplete component C, with degree d≤r−1, and put X=N[v]. Every independent set outside X extends by v, so alpha(H−X)≤r−1. Replacing X by an isolated K_(d+1) therefore preserves alpha≤r as well as all palette caps.

Every vertex of X lies in C and has degree at least d. The difference between removed edges and added edges is at least

```math
\binom{d+1}{2}-e(H[X]).
```

This is positive unless X was already a clique. That exceptional case is impossible: a simplicial vertex in a connected noncomplete independence-critical component gives a proper clique X, with alpha(C−X)≤alpha(C)−1. Any edge leaving X could then be deleted without raising independence, since X remains complete and its complement remains unchanged. Connectedness supplies such an edge.

Therefore every noncomplete component has minimum degree at least r. The choice of a minimum-degree vertex within its component is necessary for the edge-saving estimate and is present in the proof.

## 4. Independent-set compression

For a nonempty independent k-set S in a noncomplete component, put X=N[S]. If |X|≤rk, its vertices can be partitioned into exactly k nonempty sets, each of size at most r, because k≤|X|≤rk.

Every independent set in H−X extends by all k vertices of S. Thus alpha(H−X)≤r−k, and replacing X by k isolated cliques preserves alpha≤r.

At least r|X|/2 edges are removed: each vertex of X has degree at least r, and half the degree sum is a lower bound for the number of edges incident to X. At most (r−1)|X|/2 edges are added. The replacement saves at least |X|/2>0 edges. Hence

```math
|N[S]|\ge r|S|+1.
```

A maximum independent set dominates its component. Consequently every noncomplete component C satisfies

```math
|C|-r\alpha(C)\ge1.
```

No assumption about maximum independent sets extending prescribed smaller independent sets is used.

## 5. Absorbing a smaller clique component

The (r+1)-vertex cap excludes cliques larger than r. There must be at least one noncomplete component, since a union of cliques of orders at most r and total independence at most r has at most r² vertices.

Suppose K_k is a component with k<r, and let h=r−k. Choose h vertices X from a noncomplete component; its minimum degree r ensures enough vertices exist. Removing K_k lowers independence by exactly one, and removing X cannot increase it. Replacing their union by one isolated K_r restores at most one, preserving alpha≤r.

The number of deleted edges is at least C(k,2)+rh−C(h,2). After adding C(r,2) edges, the saving is at least

```math
\binom k2+rh-\binom h2-\binom r2=h>0.
```

Thus all complete components have order exactly r. The choice of X may be arbitrary inside the noncomplete component; its degree lower bound suffices.

## 6. One residual component, and the full-clique issue

The total defect is N−r alpha(H)=1. Complete components contribute zero; every noncomplete component contributes a positive integer. There is therefore exactly one noncomplete component R, and it has defect one.

Writing q for the number of complete components and s=r−q gives |R|=rs+1 and alpha(R)=s.

The revised proof correctly treats q=0 explicitly. If q=0, H is connected and has minimum degree at least r. The edge budget makes it r-regular. It is neither an odd cycle nor K_(r+1), so Brooks' theorem gives an r-coloring. One color class has at least r+1 vertices, contradicting alpha(H)=r. Hence q≥1 and s<r.

The inherited (r+1)-vertex cap gives the one-neighbor rule around any full K_r. If R contained such a clique Q, an independent s-set outside Q would extend through Q since s<r. Therefore alpha(R−Q)≤s−1. Any edge leaving Q would be redundant for independence; connectedness would force R=Q, contrary to noncompleteness. Thus R is K_r-free.

Finally the uniform-vector case of Abiad–Kumar–Pragada Theorem 2.2 gives at least 2N/r=2r+2/r vertices in full cliques. Here only the q complete components contain full cliques, so qr≥2r+2/r and q≥3. This avoids reliance on the preceding long full-clique intersection proof.

## 7. Additional conclusions in the reviewed note

The same-core ratio-minimality argument is valid. If a proper induced subgraph has positive order-minus-r-times-independence defect, an inclusion-minimal such F has |F|=r alpha(F)+1. With a=alpha(F)<s, its complement in R has r(s−a) vertices. Replacing that complement by s−a isolated K_r's preserves independence and caps while saving at least half the removed vertex count. This contradicts global minimality.

The paired-tip degree bound also follows correctly. For nonadjacent u,v, the independent-set expansion gives

```math
|N(u)\cap N(v)|\le d(u)+d(v)-2r+1.
```

The tips of a K_r-minus-an-edge block share r−2 neighbors, so their degree sum is at least 3r−3. Every core vertex of such a block has an exterior neighbor, since its internal degree is only r−1 whereas delta(R)≥r. A critical-edge certificate for one such exterior edge supplies an independent s-set outside the block. It must dominate all r block vertices and each member has at most two neighbors there, yielding 2s≥r.

Neither ratio-minimality nor independence-criticality has been shown here to imply that R is chromatic-critical. Bounds requiring chromatic-criticality remain unavailable without another proof.

## Recorded outcome and limits

No mathematical gap was found after the explicit q=0/Brooks step was added. The verified normal form is

```math
H=qK_r\mathbin{\dot\cup}R,
\quad q\ge3,
\quad |R|=rs+1,
\quad\alpha(R)=s,
\quad\omega(R)\le r-1,
\quad\delta(R)\ge r,
```

with a single connected independence-critical, ratio-minimal core. The existing local P_1,P_2,P_3 deductions give s≥4.

The core still has the nonempty potential edge interval

```math
\frac{r^2s}{2}+\frac{3r}{2}+\frac1s
\le e(R)\le
\frac{r^2s}{2}+\frac{(q+1)r}{2}.
```

The normal form does not eliminate this interval or construct an actual balanced coloring. Cross-color consequences cannot be transferred through the replacements. The earlier connected-H inequality q(q−1)<r does not apply to this disconnected H, and no such transfer was used.

This review checks the written argument and its accounting. It is not a Lean verification. The external localized independence theorem and Brooks' theorem remain cited mathematical inputs. No priority search for the combined normalization was undertaken in this review, and no full-bounty completion is claimed.

The reviewer posted and re-read the scope and proof assessment in [issue 45](https://github.com/1337isnot1337/solved-conjectures/issues/45#issuecomment-7067701027).
