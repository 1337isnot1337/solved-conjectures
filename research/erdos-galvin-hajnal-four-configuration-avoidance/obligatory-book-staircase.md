# An obligatory countable book staircase

For a triple system, call \(\{x_i,y_i\}\) a **base** and \(z\) a **page** when \(\{x_i,y_i,z\}\) is an edge. This is terminology for the indicated subconfiguration; it does not constrain other edges.

**Theorem.** Every uncountably chromatic triple system on \(\omega_1\) contains pairwise disjoint bases \(e_i=\{x_i,y_i\}\), \(i<\omega\), and distinct pages \(z_0,z_1,\ldots,z_\omega\) outside all bases, with
\[
 e_i\cup\{z_j\}\in H \qquad (i\le j\le\omega).
\]
Moreover every finite submatching of these particular bases has uncountably many common pages in \(H\). But it is relatively consistent that such a triple system omits \(T_1,T_3,T_4,T_9\) and that **no two distinct vertices are common pages for infinitely many disjoint bases**. In particular the staircase cannot be extended by requiring a second terminal page.

## The staircase is obligatory

Take a continuous increasing chain \(\langle M_\alpha:\alpha<\omega_1\rangle\) of countable elementary submodels of a sufficiently large \(H(\theta)\), all containing \(H\), with union covering \(\omega_1\). For a vertex \(v\notin M_\alpha\), consider the link of \(v\) on \(M_\alpha\cap\omega_1\). If every such link has a finite vertex cover, properly colour \(H\) with countably many colours as follows. Order vertices block by block, where the first block is \(M_0\cap\omega_1\) and each later nonempty block consists of the new ordinals in \(M_{\alpha+1}\). Enumerate each block in order type at most \(\omega\). When assigning a colour, avoid all earlier colours within that block (only finitely many so far) and, for \(v\) in the block just above \(M_\alpha\), avoid the colours of its finite link cover in \(M_\alpha\). In a putatively monochromatic triple, the block of its last vertex cannot contain a second vertex of the triple, by injectivity within the block. Both other vertices are therefore in the old model and their pair is met by the link cover, a contradiction.

Hence for some \(M=M_\alpha\) and \(v\notin M\) the link has no finite vertex cover. A graph with no finite vertex cover has a countably infinite matching: after selecting finitely many disjoint edges, their endpoints are not a cover. Select this matching \(e_i\) in the link, and set \(z_\omega=v\). For any finite \(F\subseteq\omega\), the set of common pages for \(e_i\), \(i\in F\), belongs to \(M\), since the finite list of bases and \(H\) do. The set contains \(v\) and so is uncountable: any countable set belonging to \(M\) is a subset of \(M\). For each \(j<\omega\) choose a page for the first \(j+1\) bases, avoiding the countably many matching vertices, the terminal page, and the already chosen pages. This proves both conclusions.

## A second terminal page can be forbidden

In the one-Cohen witness of [PR #1082](https://github.com/1337isnot1337/solved-conjectures/pull/1082), each pair that has at least two pages is a bottom pair, and the selected graph edge from its middle vertex to each page is a top edge used by only one triple. Suppose \(z<w\) were common pages for infinitely many distinct bases. Each base lies strictly below \(z\) since it also has \(z\) as page. Its middle vertex therefore gives a lower neighbour of \(w\) below \(z\). Distinct bases give distinct middle vertices, since the same top edge cannot select two bases. This contradicts the finiteness of the set of lower neighbours of \(w\) in any bounded initial segment of \(w\). Disjointness of the bases was not needed for this exclusion.

The same exclusion holds for the direct tree witness on height \(\omega_1\). If two pages have different heights, the higher one has infinitely many lower neighbours bounded by the lower page's height. If their heights agree, the infinitely many common lower neighbours must be cofinal in that height (by the ladder condition). They lie on both predecessor branches. Thus the two pages agree on a cofinal chain of restrictions and are the same sequence. These arguments show the exact terminal-page threshold in a model of CH as well.

## Source boundary

[Erdős–Galvin–Hajnal 1975, Corollary 3.3, p. 436](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=12) gives, for each *finite* \(t\), a \(t\)-edge matching of bases having uncountably many common pages. The lower proof here obtains one infinite matching with this property for all its finite submatchings and also one common page for the whole matching. The graph analogue with obligatory \(H_{\omega,\omega+1}\) and consistently avoidable \(H_{\omega,\omega+2}\) is due to [Hajnal–Komjáth (1984)](https://doi.org/10.1007/BF02579219); see [Lambie-Hanson–Uhrik, Definition 3.3 and Lemma 3.4](https://arxiv.org/html/2312.01828). Doubling the bases requires a link-matching instead of a graph-neighbourhood argument. The preceding is a structural consequence of the main project, not a claim to resolve a separate named open conjecture.
