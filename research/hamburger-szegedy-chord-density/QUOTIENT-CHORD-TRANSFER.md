# Chord transfer across a graph of copies

The [regular completion](REGULAR-NO-SHORT-EARS.md) for the [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642) can hide short exterior ears. It can also have a chord-dense cycle spanning every copy. This note separates the effects of the quotient cycle, the matching colors, and the routes inside the copies.

## Exact transfer via adjacent ports

Use the notation of the completion lemma: the seed $`H`$ has a spanning rim on $`h`$ vertices, with $`k_H=e(H)-h`$ chords, and $`K`$ is the bipartite quotient whose edges are partitioned into perfect matching colors. A color is assigned to one seed vertex; its edge between two copies connects copies of that vertex.

Take two matching colors assigned to adjacent ports $`u,v`$ on the seed rim. Let $`W`$ be a component of their union, and put $`S=V(W)`$ and $`m=|S|`$. Alternation gives one port of each type at each copy. Traverse the spanning path formed by deleting $`uv`$ from the rim, orienting it as needed. The paths and the edges of $`W`$ form a simple cycle $`D`$ on every vertex in all $`m`$ copies. Its length and chord count are exactly
```math
|D|=hm,\qquad k(D)=mk_H+e(K[S]).
```
Indeed the intra-copy chord count is $`m(k_H+1)`$ and the inter-copy count is $`e(K[S])-m`$. No endpoints of off-route quotient edges are lost.

Thus a component yields a witness precisely when $`e(K[S])\ge (h-k_H)m`$. In an $`M`$-regular quotient the same condition is
```math
|\partial_K S|\le \big(M-2(h-k_H)\big)m.
```
If the total count of edges between different components of the two-color factor is at most $`(M/2-h+k_H)|V(K)|`$, then summing the exact surplus identity shows that at least one component meets the condition. These are sufficient tests for the completion with its actual fixed assignment of colors; they do not require a Hamiltonian quotient.

## Transfer without prescribed adjacent ports

More generally, start with any simple quotient cycle $`W`$ of length $`m`$, not necessarily two-colored. In each copy, if the arrival and departure ports differ, choose uniformly between the two paths on the seed rim between them. Choose independently in different copies. If the ports agree, use the one-vertex path. Concatenating the internal paths and the quotient cycle edges always gives a simple cycle $`D`$. A single-port visit uses two distinct inter-copy edges at one vertex and does not repeat it.

For copy $`i`$ let $`P_i`$ be its chosen path, $`p_i(w)=\Pr(w\in V(P_i))`$ for each seed vertex $`w`$, and let $`g(P_i)=e_H(V(P_i))-(|V(P_i)|-1)`$ count its unused internal edges. Write $`\ell(e)`$ for the seed vertex assigned to the color of a quotient edge $`e`$. Then
```math
\mathbb E[k(D)-|D|]=
\sum_{i\in S}\mathbb E[g(P_i)-|V(P_i)|]
+\sum_{ij\in E(K[S])\setminus E(W)}
p_i(\ell(ij))p_j(\ell(ij)).
```
Each unused internal edge contributes at its own copy; each inter-copy chord is present exactly when both endpoint ports are retained. Independence of the routes in distinct copies gives the product. The expression remains valid for any independent distribution on simple intra-copy paths between the two ports.

For distinct ports, each seed vertex is retained with probability at least $`1/2`$, and expected path order is $`(h+2)/2`$. Let $`s`$ be the number of same-port visits and let $`b_*`$ count the quotient chords whose two incident visits both have distinct ports. Then there is a lift with at least as many chords as vertices whenever
```math
b_*\ge 2(h+2)(m-s)+4s.
```
This follows by keeping only the $`b_*`$ external chords, each with probability at least $`1/4`$; the length has expectation $`(h+2)(m-s)/2+s`$. It is only a sufficient test; the exact expression retains other chords. A nonnegative expected surplus yields a deterministic choice by conditional expectation: fix one local path at a time to a value that does not lower the current expectation. Every term is local to one copy or one quotient edge, so this is polynomial for the two rim choices per copy.

## Random assignment of matching colors

The regular completion can choose which seed type receives each matching color, subject to the prescribed multiplicities $`b_v=d-d_H(v)`$, with $`M=\sum_v b_v`$. Allocate the $`M`$ given matching colors uniformly to labelled slots of these types. At a quotient cycle visit the two incident matching colors differ. The probability of a same-port visit is exactly
```math
p=\frac{\sum_v b_v(b_v-1)}{M(M-1)}.
```
For a quotient chord, the probability that both visits use distinct ports is at least $`1-2p`$ by a union bound; no independence of color assignments is needed. Given the assignment, the independent rim choices give conditional retention probability at least $`1/4`$ on that event. The expected length is exactly $`m[(1-p)(h+2)/2+p]`$. Therefore, for # Chord transfer across a graph of copies

The [regular completion](REGULAR-NO-SHORT-EARS.md) for the [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642) can hide short exterior ears. It can also have a chord-dense cycle spanning every copy. This note separates the effects of the quotient cycle, the matching colors, and the routes inside the copies.

## Exact transfer via adjacent ports

Use the notation of the completion lemma: the seed $`H`$ has a spanning rim on $`h`$ vertices, with $`k_H=e(H)-h`$ chords, and $`K`$ is the bipartite quotient whose edges are partitioned into perfect matching colors. A color is assigned to one seed vertex; its edge between two copies connects copies of that vertex.

Take two matching colors assigned to adjacent ports $`u,v`$ on the seed rim. Let $`W`$ be a component of their union, and put $`S=V(W)`$ and $`m=|S|`$. Alternation gives one port of each type at each copy. Traverse the spanning path formed by deleting $`uv`$ from the rim, orienting it as needed. The paths and the edges of $`W`$ form a simple cycle $`D`$ on every vertex in all $`m`$ copies. Its length and chord count are exactly
```math
|D|=hm,\qquad k(D)=mk_H+e(K[S]).
```
Indeed the intra-copy chord count is $`m(k_H+1)`$ and the inter-copy count is $`e(K[S])-m`$. No endpoints of off-route quotient edges are lost.

Thus a component yields a witness precisely when $`e(K[S])\ge (h-k_H)m`$. In an $`M`$-regular quotient the same condition is
```math
|\partial_K S|\le \big(M-2(h-k_H)\big)m.
```
If the total count of edges between different components of the two-color factor is at most $`(M/2-h+k_H)|V(K)|`$, then summing the exact surplus identity shows that at least one component meets the condition. These are sufficient tests for the completion with its actual fixed assignment of colors; they do not require a Hamiltonian quotient.

## Transfer without prescribed adjacent ports

More generally, start with any simple quotient cycle $`W`$ of length $`m`$, not necessarily two-colored. In each copy, if the arrival and departure ports differ, choose uniformly between the two paths on the seed rim between them. Choose independently in different copies. If the ports agree, use the one-vertex path. Concatenating the internal paths and the quotient cycle edges always gives a simple cycle $`D`$. A single-port visit uses two distinct inter-copy edges at one vertex and does not repeat it.

For copy $`i`$ let $`P_i`$ be its chosen path, $`p_i(w)=\Pr(w\in V(P_i))`$ for each seed vertex $`w`$, and let $`g(P_i)=e_H(V(P_i))-(|V(P_i)|-1)`$ count its unused internal edges. Write $`\ell(e)`$ for the seed vertex assigned to the color of a quotient edge $`e`$. Then
```math
\mathbb E[k(D)-|D|]=
\sum_{i\in S}\mathbb E[g(P_i)-|V(P_i)|]
+\sum_{ij\in E(K[S])\setminus E(W)}
p_i(\ell(ij))p_j(\ell(ij)).
```
Each unused internal edge contributes at its own copy; each inter-copy chord is present exactly when both endpoint ports are retained. Independence of the routes in distinct copies gives the product. The expression remains valid for any independent distribution on simple intra-copy paths between the two ports.

For distinct ports, each seed vertex is retained with probability at least $`1/2`$, and expected path order is $`(h+2)/2`$. Let $`s`$ be the number of same-port visits and let $`b_*`$ count the quotient chords whose two incident visits both have distinct ports. Then there is a lift with at least as many chords as vertices whenever
```math
b_*\ge 2(h+2)(m-s)+4s.
```
This follows by keeping only the $`b_*`$ external chords, each with probability at least $`1/4`$; the length has expectation $`(h+2)(m-s)/2+s`$. It is only a sufficient test; the exact expression retains other chords. A nonnegative expected surplus yields a deterministic choice by conditional expectation: fix one local path at a time to a value that does not lower the current expectation. Every term is local to one copy or one quotient edge, so this is polynomial for the two rim choices per copy.

## Random assignment of matching colors

The regular completion can choose which seed type receives each matching color, subject to the prescribed multiplicities $`b_v=d-d_H(v)`$, with $`M=\sum_v b_v`$. Allocate the $`M`$ given matching colors uniformly to labelled slots of these types. At a quotient cycle visit the two incident matching colors differ. The probability of a same-port visit is exactly
```math
p=\frac{\sum_v b_v(b_v-1)}{M(M-1)}.
```
For a quotient chord, the probability that both visits use distinct ports is at least $`1-2p`$ by a union bound; no independence of color assignments is needed. Given the assignment, the independent rim choices give conditional retention probability at least $`1/4`$ on that event. The expected length is exactly $`m[(1-p)(h+2)/2+p]`$. Therefore, for p\lt1/2`$, some allowed assignment and some lift meet the full chord target if the quotient cycle has at least
```math
\frac{2(h+2)-2hp}{1-2p}\,m
```
quotient chords. This is an existence result over allowed assignments, not a claim about each assignment. It still assumes a chord-rich cycle in the quotient.

## The local obstruction can coexist with a spanning witness

For a seed consisting of the sparse rim from the completion obstruction, all deficits are positive. For every required quotient girth $`B`$ and degree $`M\ge2`$, one can take a bipartite Hamiltonian $`M`$-regular quotient. To see this directly, start with a sufficiently large even cycle and add $`M-2`$ perfect matchings, one at a time while preserving girth at least $`B`$. For the current matching add an unmatched opposite-shore pair at distance greater than $`B`$ whenever possible. Otherwise, if unmatched vertices remain, each shore has at most $`T`$ unmatched vertices, where $`T`$ bounds a radius-$`B`$ ball at degree $`M`$. Use more than $`3T`$ vertices per shore. For an unmatched opposite-shore pair $`a,b`$ a current matching edge $`a'b'`$ avoids the two radius-$`B`$ balls; there are more than $`2T`$ matching edges and at most $`2T`$ meet those balls. Switch it to $`ab',a'b`$. A short cycle with one new edge needs a long old path between its ends. A short cycle with two needs either an old path between the distant regions or an old # Chord transfer across a graph of copies

The [regular completion](REGULAR-NO-SHORT-EARS.md) for the [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642) can hide short exterior ears. It can also have a chord-dense cycle spanning every copy. This note separates the effects of the quotient cycle, the matching colors, and the routes inside the copies.

## Exact transfer via adjacent ports

Use the notation of the completion lemma: the seed $`H`$ has a spanning rim on $`h`$ vertices, with $`k_H=e(H)-h`$ chords, and $`K`$ is the bipartite quotient whose edges are partitioned into perfect matching colors. A color is assigned to one seed vertex; its edge between two copies connects copies of that vertex.

Take two matching colors assigned to adjacent ports $`u,v`$ on the seed rim. Let $`W`$ be a component of their union, and put $`S=V(W)`$ and $`m=|S|`$. Alternation gives one port of each type at each copy. Traverse the spanning path formed by deleting $`uv`$ from the rim, orienting it as needed. The paths and the edges of $`W`$ form a simple cycle $`D`$ on every vertex in all $`m`$ copies. Its length and chord count are exactly
```math
|D|=hm,\qquad k(D)=mk_H+e(K[S]).
```
Indeed the intra-copy chord count is $`m(k_H+1)`$ and the inter-copy count is $`e(K[S])-m`$. No endpoints of off-route quotient edges are lost.

Thus a component yields a witness precisely when $`e(K[S])\ge (h-k_H)m`$. In an $`M`$-regular quotient the same condition is
```math
|\partial_K S|\le \big(M-2(h-k_H)\big)m.
```
If the total count of edges between different components of the two-color factor is at most $`(M/2-h+k_H)|V(K)|`$, then summing the exact surplus identity shows that at least one component meets the condition. These are sufficient tests for the completion with its actual fixed assignment of colors; they do not require a Hamiltonian quotient.

## Transfer without prescribed adjacent ports

More generally, start with any simple quotient cycle $`W`$ of length $`m`$, not necessarily two-colored. In each copy, if the arrival and departure ports differ, choose uniformly between the two paths on the seed rim between them. Choose independently in different copies. If the ports agree, use the one-vertex path. Concatenating the internal paths and the quotient cycle edges always gives a simple cycle $`D`$. A single-port visit uses two distinct inter-copy edges at one vertex and does not repeat it.

For copy $`i`$ let $`P_i`$ be its chosen path, $`p_i(w)=\Pr(w\in V(P_i))`$ for each seed vertex $`w`$, and let $`g(P_i)=e_H(V(P_i))-(|V(P_i)|-1)`$ count its unused internal edges. Write $`\ell(e)`$ for the seed vertex assigned to the color of a quotient edge $`e`$. Then
```math
\mathbb E[k(D)-|D|]=
\sum_{i\in S}\mathbb E[g(P_i)-|V(P_i)|]
+\sum_{ij\in E(K[S])\setminus E(W)}
p_i(\ell(ij))p_j(\ell(ij)).
```
Each unused internal edge contributes at its own copy; each inter-copy chord is present exactly when both endpoint ports are retained. Independence of the routes in distinct copies gives the product. The expression remains valid for any independent distribution on simple intra-copy paths between the two ports.

For distinct ports, each seed vertex is retained with probability at least $`1/2`$, and expected path order is $`(h+2)/2`$. Let $`s`$ be the number of same-port visits and let $`b_*`$ count the quotient chords whose two incident visits both have distinct ports. Then there is a lift with at least as many chords as vertices whenever
```math
b_*\ge 2(h+2)(m-s)+4s.
```
This follows by keeping only the $`b_*`$ external chords, each with probability at least $`1/4`$; the length has expectation $`(h+2)(m-s)/2+s`$. It is only a sufficient test; the exact expression retains other chords. A nonnegative expected surplus yields a deterministic choice by conditional expectation: fix one local path at a time to a value that does not lower the current expectation. Every term is local to one copy or one quotient edge, so this is polynomial for the two rim choices per copy.

## Random assignment of matching colors

The regular completion can choose which seed type receives each matching color, subject to the prescribed multiplicities $`b_v=d-d_H(v)`$, with $`M=\sum_v b_v`$. Allocate the $`M`$ given matching colors uniformly to labelled slots of these types. At a quotient cycle visit the two incident matching colors differ. The probability of a same-port visit is exactly
```math
p=\frac{\sum_v b_v(b_v-1)}{M(M-1)}.
```
For a quotient chord, the probability that both visits use distinct ports is at least $`1-2p`$ by a union bound; no independence of color assignments is needed. Given the assignment, the independent rim choices give conditional retention probability at least $`1/4`$ on that event. The expected length is exactly $`m[(1-p)(h+2)/2+p]`$. Therefore, for # Chord transfer across a graph of copies

The [regular completion](REGULAR-NO-SHORT-EARS.md) for the [Hamburger–Szegedy conjecture](https://www.erdosproblems.com/642) can hide short exterior ears. It can also have a chord-dense cycle spanning every copy. This note separates the effects of the quotient cycle, the matching colors, and the routes inside the copies.

## Exact transfer via adjacent ports

Use the notation of the completion lemma: the seed $`H`$ has a spanning rim on $`h`$ vertices, with $`k_H=e(H)-h`$ chords, and $`K`$ is the bipartite quotient whose edges are partitioned into perfect matching colors. A color is assigned to one seed vertex; its edge between two copies connects copies of that vertex.

Take two matching colors assigned to adjacent ports $`u,v`$ on the seed rim. Let $`W`$ be a component of their union, and put $`S=V(W)`$ and $`m=|S|`$. Alternation gives one port of each type at each copy. Traverse the spanning path formed by deleting $`uv`$ from the rim, orienting it as needed. The paths and the edges of $`W`$ form a simple cycle $`D`$ on every vertex in all $`m`$ copies. Its length and chord count are exactly
```math
|D|=hm,\qquad k(D)=mk_H+e(K[S]).
```
Indeed the intra-copy chord count is $`m(k_H+1)`$ and the inter-copy count is $`e(K[S])-m`$. No endpoints of off-route quotient edges are lost.

Thus a component yields a witness precisely when $`e(K[S])\ge (h-k_H)m`$. In an $`M`$-regular quotient the same condition is
```math
|\partial_K S|\le \big(M-2(h-k_H)\big)m.
```
If the total count of edges between different components of the two-color factor is at most $`(M/2-h+k_H)|V(K)|`$, then summing the exact surplus identity shows that at least one component meets the condition. These are sufficient tests for the completion with its actual fixed assignment of colors; they do not require a Hamiltonian quotient.

## Transfer without prescribed adjacent ports

More generally, start with any simple quotient cycle $`W`$ of length $`m`$, not necessarily two-colored. In each copy, if the arrival and departure ports differ, choose uniformly between the two paths on the seed rim between them. Choose independently in different copies. If the ports agree, use the one-vertex path. Concatenating the internal paths and the quotient cycle edges always gives a simple cycle $`D`$. A single-port visit uses two distinct inter-copy edges at one vertex and does not repeat it.

For copy $`i`$ let $`P_i`$ be its chosen path, $`p_i(w)=\Pr(w\in V(P_i))`$ for each seed vertex $`w`$, and let $`g(P_i)=e_H(V(P_i))-(|V(P_i)|-1)`$ count its unused internal edges. Write $`\ell(e)`$ for the seed vertex assigned to the color of a quotient edge $`e`$. Then
```math
\mathbb E[k(D)-|D|]=
\sum_{i\in S}\mathbb E[g(P_i)-|V(P_i)|]
+\sum_{ij\in E(K[S])\setminus E(W)}
p_i(\ell(ij))p_j(\ell(ij)).
```
Each unused internal edge contributes at its own copy; each inter-copy chord is present exactly when both endpoint ports are retained. Independence of the routes in distinct copies gives the product. The expression remains valid for any independent distribution on simple intra-copy paths between the two ports.

For distinct ports, each seed vertex is retained with probability at least $`1/2`$, and expected path order is $`(h+2)/2`$. Let $`s`$ be the number of same-port visits and let $`b_*`$ count the quotient chords whose two incident visits both have distinct ports. Then there is a lift with at least as many chords as vertices whenever
```math
b_*\ge 2(h+2)(m-s)+4s.
```
This follows by keeping only the $`b_*`$ external chords, each with probability at least $`1/4`$; the length has expectation $`(h+2)(m-s)/2+s`$. It is only a sufficient test; the exact expression retains other chords. A nonnegative expected surplus yields a deterministic choice by conditional expectation: fix one local path at a time to a value that does not lower the current expectation. Every term is local to one copy or one quotient edge, so this is polynomial for the two rim choices per copy.

## Random assignment of matching colors

The regular completion can choose which seed type receives each matching color, subject to the prescribed multiplicities $`b_v=d-d_H(v)`$, with $`M=\sum_v b_v`$. Allocate the $`M`$ given matching colors uniformly to labelled slots of these types. At a quotient cycle visit the two incident matching colors differ. The probability of a same-port visit is exactly
```math
p=\frac{\sum_v b_v(b_v-1)}{M(M-1)}.
```
For a quotient chord, the probability that both visits use distinct ports is at least $`1-2p`$ by a union bound; no independence of color assignments is needed. Given the assignment, the independent rim choices give conditional retention probability at least $`1/4`$ on that event. The expected length is exactly $`m[(1-p)(h+2)/2+p]`$. Therefore, for p\lt1/2`$, some allowed assignment and some lift meet the full chord target if the quotient cycle has at least
```math
\frac{2(h+2)-2hp}{1-2p}\,m
```
quotient chords. This is an existence result over allowed assignments, not a claim about each assignment. It still assumes a chord-rich cycle in the quotient.

## The local obstruction can coexist with a spanning witness

For a seed consisting of the sparse rim from the completion obstruction, all deficits are positive. For every required quotient girth $`B`$ and degree $`M\ge2`$, one can take a bipartite Hamiltonian $`M`$-regular quotient. To see this directly, start with a sufficiently large even cycle and add $`M-2`$ perfect matchings, one at a time while preserving girth at least $`B`$. For the current matching add an unmatched opposite-shore pair at distance greater than $`B`$ whenever possible. Otherwise, if unmatched vertices remain, each shore has at most $`T`$ unmatched vertices, where $`T`$ bounds a radius-$`B`$ ball at degree $`M`$. Use more than $`3T`$ vertices per shore. For an unmatched opposite-shore pair $`a,b`$ a current matching edge $`a'b'`$ avoids the two radius-$`B`$ balls; there are more than $`2T`$ matching edges and at most $`2T`$ meet those balls. Switch it to $`ab',a'b`$. A short cycle with one new edge needs a long old path between its ends. A short cycle with two needs either an old path between the distant regions or an old a'\text{--}b'`$ path after the deletion, itself of length at least $`B-1`$. Both are impossible. This grows the current matching to a perfect one. The initial Hamilton rim gives the first two perfect matching colors, so assign them to adjacent seed ports.

The lifted cycle is Hamiltonian, and at degree $`d\ge4`$ its chord fraction is exactly $`d/2-1\ge1`$. Taking $`B`$ longer than the seed rim simultaneously leaves all globally shortest quota-attaining cycles with no short exterior ears. Thus the earlier obstruction is genuinely local, even inside an unbounded-degree and unbounded-girth family satisfying the target via a spanning cycle.

## Literature and scope

[Letzter et al., Corollary 7.2](https://doi.org/10.1112/jlms.70452) give a different polylogarithmic upper bound via nearly Hamilton cycles. [Small circumference in regular sublinear expanders](https://arxiv.org/abs/2608.20190v2) shows why one cannot instead assume a cycle covering a fixed fraction of every regular KS expander; that counterexample is not to the chord conjecture and has dense blocks. [Bradač–Janzer](https://arxiv.org/abs/2605.15043) prove Hamiltonicity with a polylogarithmic degree hypothesis and edge expansion, not the constant-degree forcing required here. The known [almost-linear chord theorem](https://arxiv.org/abs/2601.08769) likewise does not prove the full statement. The transfer rules apply to the constructed copy hosts or a supplied quotient; no new universal density bound is asserted.
