# Alternative Sturm verification of the canonical-line counterexample

The six-part witness already appeared in issue #316. The newer noninterlacing pair remains on the canonical line on both sides, strengthening the earlier result. See the [earlier proof](PROOF.md) for the underlying conjecture resolution.

**Result.** The symmetric edge polytope of the complete six-partite graph
```math
G=K_{2,2,2,2,2,2}
```
has Ehrhart roots off the canonical line $`\mathop{\mathrm{Re}}(s)=-\tfrac12`$. This disproves the universal canonical-line statement in [Higashitani–Kummer–Michałek, Conjecture 4.10(i)](https://d-nb.info/1144744067/34), also [Kölbl, Conjecture 0.1(i)](https://arxiv.org/pdf/2404.02136#page=3). A general matching-deletion $`h^*`$-formula keeps the witness small and exact.

## 1. Ehrhart count after deleting a matching

Let $`G`$ be a complete graph on $`N\ge3`$ vertices with a matching of $`m`$ edges deleted. This is the complete multipartite graph with parts of size one or two, where the size-two parts are the deleted pairs. The symmetric edge polytope $`P_G`$ is the convex hull of the vectors $`\pm(e_u-e_v)`$ for retained edges, in the zero-sum lattice. Its dimension is $`d=N-1`$ because $`G`$ is connected.

For an integer zero-sum vector $`v`$, let $`S`$ be its total positive mass (also total negative mass), and let $`s_i`$ be the sum of absolute coordinates in part $`i`$. Then
```math
v\in tP_G\quad\Longleftrightarrow\quad S\le t\ \text{ and all }\ s_i\le t
\qquad (t\in\mathbb Z_{\ge0}). \tag{1}
```
For necessity, every generating edge vector has $`\ell^1`$ norm 2 and has at most one unit of absolute mass in each part. Convexity of the corresponding norms gives both inequalities.

For sufficiency, clone the individual units of positive and negative mass, and match positive units to negative units, allowing matches across graph parts. The maximal cross-part matching has size $`S-\max(0,\max_i(s_i-S))`$. Indeed a subset of positive units all in part $`i`$ has as neighbors all negative units outside that part, giving maximal Hall deficiency $`s_i-S`$ for that part. A subset with units in at least two different parts has all negative units as neighbors and has no deficiency. Hall's theorem, with dummy vertices to absorb the maximal deficiency, gives the stated size. If a positive and a negative unit are still unmatched they must lie in the same part, since otherwise the matching was not maximal. Such units can be joined by a path of length two through any other part. Thus $`v`$ is a sum of $`S+\max(0,\max_i(s_i-S))=\max(S,\max_i s_i)`$ signed graph-edge vectors. Since $`0\in P_G`$, this proves (1).

The full complete graph has just the condition $`S\le t`$. For a deleted pair to violate (1), its absolute mass must exceed $`t`$, which is impossible unless its coordinates have opposite signs. Distinct pairs cannot both violate because total absolute mass is $`2S\le2t`$. To count a violation of one fixed pair, prescribe the integer vector on the $`N-2`$ remaining vertices. Write $`p,q`$ for its positive and negative masses, $`H=p+q`$. Fix an orientation for the signs on the omitted pair. The two remaining coordinate magnitudes are then uniquely $`S-p,S-q`$, where
```math
S\le t,\qquad 2S-H>t.
```
There are no choices for $`H\ge t`$. If $`H<t`$, the latter inequality gives $`S>(t+H)/2\ge\max(p,q)`$, so both remaining coordinates are automatically nonzero. The number of choices is $`t-\lfloor(t+H)/2\rfloor=\lceil(t-H)/2\rceil`$, for each of the two orientations.

The generating function in a variable $`z`$ for the number of excluded vectors for this one pair is therefore
```math
2\left(\frac{1+z}{1-z}\right)^{N-2}
   \sum_{k\ge1}\left\lceil\frac{k}{2}\right\rceil z^k
=\frac{2z(1+z)^{N-3}}{(1-z)^N}.
```
The first factor enumerates complement coordinates by absolute mass, and the last identity uses $`\sum_{k\ge1}\lceil k/2\rceil z^k=z/((1-z)^2(1+z))`$. Since violations of different pairs are disjoint, the standard $`h^*`$-formula $`\sum_{j=0}^d\binom dj^2z^j`$ of the full type-$`A_d`$ root polytope ([Higashitani–Kummer–Michałek, Example 3.5](https://d-nb.info/1144744067/34)) gives
```math
h_G^*(z)=\sum_{j=0}^{N-1}\binom{N-1}{j}^{\!2}z^j
    -2m\,z(1+z)^{N-3}. \tag{2}
```

## 2. An exact certificate

For $`N=12,m=6`$, (2) gives the $`h^*`$-vector
```math
(1,109,2917,26793,107892,211932,211932,107892,26793,2917,109,1).
```
Let $`E(s)=\sum_{j=0}^{11}h_j^*\binom{s+11-j}{11}`$ be the Ehrhart polynomial. Define $`Q(w)=2^{11}11!\,E((w-1)/2)/8`$. Expanding the binomial factors gives
```math
Q(w)=87411w^{11}+8333765w^9+219501678w^7
       +1819237530w^5+4596049711w^3+3575490705w .
```
The canonical line maps to the imaginary axis under $`w=2s+1`$. For real $`y`$, we have $`i^{-11}Q(iy)=yR(y^2)`$, where
```math
R(u)=87411u^5-8333765u^4+219501678u^3-1819237530u^2
       +4596049711u-3575490705.
```
The Sturm sequence of $`R`$ has degrees $`5,4,3,2,1,0`$ and leading signs $`+,+,+,+,+,-`$. Its signs at negative infinity are $`-,+,-,+,-,-`$, with four variations; at positive infinity they are $`+,+,+,+,+,-`$, with one variation. Hence $`R`$ has exactly three distinct real roots and a nonreal conjugate pair. The sequence terminates at a nonzero constant, so there are no repeated roots. Consequently $`Q`$ has roots not on the imaginary axis and $`E`$ has roots off the canonical line.

The rational-arithmetic [checker](check_sturm.py) independently enumerates $`E(0),\ldots,E(11)`$ using signed coordinate counts and (1), verifies (2), reconstructs the exact shifted polynomial, and replays its Sturm certificate. No numerical root approximations are used in the disproof.

## Priority and scope

The conjecture is numbered 4.10 in the published *Selecta Mathematica* paper ([DOI 10.1007/s00029-017-0350-6](https://doi.org/10.1007/s00029-017-0350-6)); the canonical line is written $`\mathcal R`$ in its statement. [Kölbl’s subsequent paper](https://arxiv.org/abs/2404.02136) and [dissertation, Chapter 5](https://ir.library.osaka-u.ac.jp/repo/ouka/all/101775/34955_Dissertation.pdf) restate it and prove families with other part sizes. The witness is not a counterexample to the separate Ehrhart coefficient positivity conjecture. Bounded targeted searches for this graph, the complete multipartite canonical-line conjecture, and cocktail-party graphs did not locate an earlier exact counterexample; the [current problem record](https://mathdb.com/p/362579/higashitani-kummer-micha-ek-conjecture-for-complete-multipar) still gives the conjecture. No least-size or exclusive-priority claim is made.
