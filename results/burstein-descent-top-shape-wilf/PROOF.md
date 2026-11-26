# Burstein's refined shape-Wilf conjecture

**Result.** [Conjectures 16 and 17 in the published paper by Alexander Burstein](https://dmtcs.episciences.org/en/articles/15066/download#page=15) are false. For every suffix permutation $\sigma$, including every nonempty suffix, we give an explicit Ferrers board where $231\oplus\sigma$ and $312\oplus\sigma$ have different $`F`$-descent-top distributions. The same board witnesses different $`F`$-ascent-bottom distributions. In particular the construction is not tied to a fixed pattern length or a computational cutoff.

The precise target is the pair of shape refinements in §4 of *Distribution of sets of descent tops and descent bottoms on restricted permutations*, DMTCS 26:1 (2025), [DOI 10.46298/dmtcs.12636](https://doi.org/10.46298/dmtcs.12636), also [arXiv:2306.08065v6](https://arxiv.org/html/2306.08065v6#S4). We do not refute ordinary unrefined shape-Wilf equivalence, or the ordinary permutation Destop-Wilf classification in Conjecture 11. On the published separation convention, the AscBottom version is the complement of the Destop version for every fixed board, so the two numbered conjectures are not counted here as independent results.

## Construction

Let $k=|\sigma|$, $h=k+3$, $r=k+1$ and $N=h+r=2k+4$. Use the Ferrers partition
```math
\lambda=(N^h,N-1,N-2,\ldots,N-r)=(N^h,N-1,N-2,\ldots,h).
```
The partition is self-conjugate: each of the first $h$ columns has height $N$, and column $h+j$ has height $N-j$ for $1\le j\le r$. Thus the same coordinate bounds hold whether the first coordinate is visualized as a row or as a column. If $p_1\cdots p_N$ is the traversal word, these bounds are $p_i\le\lambda_i$. In Burstein's $`F`$-separation, the first $h$ positions form a single block; each remaining position is a singleton block. Accordingly
```math
 \mathop{\mathrm{Destop}}\nolimits_F(p)=\varnothing
 \quad\text{if and only if}\quad p_1\lt p_2<\cdots\lt p_h.
```

There are exactly $h^r$ such traversals. Assign the last $r$ labels from right to left. At position $h+j$, its bound is $N-j$, and precisely $r-j$ labels have already been used, all below that bound. This leaves $N-j-(r-j)=h$ choices. The first block then consists of the remaining values in increasing order.

## The mismatch

In a traversal with empty $`F`$-descent-top set, consider an occurrence of either $231\oplus\sigma$ or $312\oplus\sigma$. Its first three terms cannot lie entirely in the increasing first block. Its third term is therefore at position at least $h+1$. It must be followed by $k$ terms of $\sigma$, and only $k$ positions follow position $h+1$, so the third term is exactly at $h+1$. The occurrence uses two first-block entries, then the entire tail. The two first-block values increase, so the prefix pattern cannot be $312$. Thus every one of these $h^r$ traversals avoids $312\oplus\sigma$.

For $231\oplus\sigma$ the occurrence's last selected position is $N$, where the board width/height is $h$. Burstein's definition requires the entire selected row/column rectangle to fit. Since the occurrence has $h$ distinct labels, these must be precisely $[h]$. Thus the two first-block values are $2,3$, the first tail value is $1$, and the suffix values are
```math
 3+\sigma(1),\ldots,3+\sigma(k).
```
This specifies exactly one traversal: those are its entire tail, and all other labels are increasing in the first block. Conversely the traversal is valid because all tail values are at most $h$ and the first block has bound $N$. The chosen labels $[h]$ form a valid occurrence since the top-right corner of the selected rectangle fits at position $N$, and all earlier coordinate bounds are at least $h$.

It follows that the empty-$`F`$-descent-top fiber of $\mathrm{Av}_F(231\oplus\sigma)$ has size $h^r-1$, whereas the corresponding fiber of $\mathrm{Av}_F(312\oplus\sigma)$ has size $h^r$. A preserving bijection cannot exist.

For each position that is not at the end of its block, its label is an $`F`$-ascent bottom or $`F`$-descent top according to comparison with the next label, exclusively. At a block end the label is an ascent bottom and not a descent top under the published definition, including at the final separator. Thus $\mathop{\mathrm{Ascbot}}\nolimits_F(p)=[N]\setminus\mathop{\mathrm{Destop}}\nolimits_F(p)$. The same mismatch occurs in the full-$`F`$-ascent-bottom fiber, refuting Conjecture 17 even for every allowed nonempty suffix. $\square$

## Small explicit check and scope

For $\sigma=1$, take $F=(6,6,6,6,5,4)$. The fiber in question has size $4^2=16$; only $`2356\,|\,1\,|\,4`$ contains $2314$ via $2,3,1,4$, and none contains $3124$. The counts are 15 versus 16. The same construction for $\sigma=\varnothing$ has $F=(4,4,4,3)$ and counts 2 versus 3; it also contradicts the further suggestion of joint Destop/Desbot shape-Wilf equivalence of $231$ and $312$, which would in particular preserve Destop alone. The nonempty example does not rely on whether the empty suffix was intended in Conjecture 16.

The source reports checks for short suffixes and avoiders of small size. Our proposition uses its literal Ferrers containment and separation definitions, and gives an explicit discrepancy in that size range. We do not know which board or statistic conventions were used in the reported checks. [check.py](check.py) independently enumerates the relevant fibers using literal pattern tests on selected board rectangles.

Prior-work screening (24 November 2026): the published version, latest arXiv revision, the original problem-session slides, and searches for both exact refined equivalences, conjecture numbers, and the small witness were checked. Existing proofs of ordinary shape-Wilf equivalence of $231,312$, of ordinary set-valued statistic Wilf equivalence on square boards, and inequivalence for multiset words do not give this counterexample for the published Ferrers statistic. No exact prior refutation surfaced in those searches; broader priority is not asserted.
