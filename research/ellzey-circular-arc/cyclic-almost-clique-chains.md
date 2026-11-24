# Ellzey’s conjecture: cyclic complete and almost-complete blocks

**Partial result.** Cyclic chains of increasing cliques and almost-cliques satisfy elementary positivity and elementary unimodality, for arbitrary mixtures of the two kinds of blocks.

Let $H_1,\ldots,H_r$, $r\ge3$, be increasing labelled blocks, each a complete graph $K_s$ ($s\ge2$) or $K'_s=K_s-(1,s)$ ($s\ge3$). Glue the last vertex of each block to the first vertex of the next, with distinct junctions and no other identifications. Orient each block increasingly before gluing. This is a circular indifference digraph: a complete block comes from its entire circular interval, and an almost-complete block comes from the union of the interval with its first endpoint omitted and the interval with its last endpoint omitted. Those two intervals generate all arcs of that block except the first-to-last arc.

Unroll at one junction to form a natural unit interval graph $G$ by gluing the increasing blocks along a line, then label by that linear order. The directed circular chain is precisely the closure in Tom–Vailaya’s weighted trace conjecture (published Conjecture 74, preprint Conjecture 5.16), whose separate proof gives
$$
 X_{\mathrm{cl}(G)}(x;q)
 =\operatorname{tr}F_G(q)
 =\operatorname{tr}\bigl(F_{H_1}(q)\cdots F_{H_r}(q)\bigr).
$$
The product identity is Tom–Vailaya’s published Proposition 29 (preprint Proposition 3.10).

For a block of size $s$, set $h=s-2$. In a nonzero entry of its given forest matrix (published Proposition 37, preprint Proposition 3.17), denote the row by $i$, column by $j$, and let $m=s-i+j-1=h+1-i+j$ be the index of the elementary factor $e_m$. Omit the shared factor $[h]_q!$ temporarily. The nonzero polynomial weights are:

| Block | First index range | Second index range | Common center |
|---|---|---|---|
| $K_s$ | $q^{h+1}[j-i]_q$ | $q^m[i-j]_q$ | $(m+h)/2$ |
| $K'_s$ | $q^{h}[j-i+1]_q$ | $q^m[i-j-1]_q$ | $(m+h-1)/2$ |

The index ranges are exactly those in Proposition 37, and zero terms are ignored. The centers in the table follow by averaging the first and last exponents of the indicated $q$-integer intervals. Multiplying by $[h]_q!$ adds center $h(h-1)/4$, preserving unimodality.

Each term in the trace of the product corresponds to a closed sequence of row/column indices (indeed the trace has finite support by Proposition 25 applied to $G$). Around such a sequence, $\sum m=\sum(h+1)$, since the index differences cancel. Thus all terms, before grouping by their elementary monomial, are nonnegative symmetric unimodal polynomials about precisely the center
$$
 \sum_{\text{blocks}}\frac{(h+1)(h+2)}4
 -\frac{\#\{\text{almost-complete blocks}\}}2.
$$
This is half the total arc count. Products preserve common-center unimodality as in the cyclic complete-block proof; sums for identical elementary monomials do too. Hence the entire circular chain is elementary-positive and elementary-unimodal.

The original authors already prove general-$q$ positivity for open complete/almost-complete chains and $q=1$ positivity for their closures. The new inference here concerns arbitrary circular complete/almost-complete chains at general $q$, including unimodality. For the primary source, see Tom–Vailaya, [The chromatic symmetric function of graphs glued at a single vertex](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v33i2p9/pdf/), Electronic J. Combin. **33** (2026), #P2.9, Propositions 25, 29, 37; Corollary 40; Theorem 60; Conjecture 74. No priority is claimed.

