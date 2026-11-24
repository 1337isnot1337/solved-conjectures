# Brenti's poset Eulerian log-concavity conjecture: nonnaturally labeled boundary extensions

## Statement

For a finite poset $P$ and a bijective labeling $\omega$, let $W_{P,\omega}(t)$ count its linear extensions by the number of descents in their label words. A cover $x\lessdot y$ is **strict** if $\omega(x)>\omega(y)$ and **weak** otherwise.

Let $Q$ be a nonempty poset of width at most two with a natural labeling. Form $P=L\oplus Q\oplus U$, where $L$ and $U$ are chains, possibly empty. Retain a natural labeling on $Q$, but otherwise allow arbitrary distinct labels, including on $L$ and $U$ and through the two interfaces. Each nonempty interface has at most two covers. Call it mixed if one is strict and the other is weak.

**Theorem.** The coefficients of $W_{P,\omega}(t)$ are log-concave and have no internal zeros whenever at most one interface is mixed. If both are mixed, the same conclusion holds provided some two-chain decomposition of $Q$ places the minimum at the strict lower cover and the maximum at the strict upper cover in opposite chains.

In particular, a single new minimum or maximum of arbitrary label may be adjoined to any naturally labeled width-two poset. This is a nonnatural-label partial result on Brenti's original arbitrary-label conjecture, not a full resolution.

## Cover-sign invariance

The order polynomial counts weakly order-preserving maps to $[m]$ that are strict across every strict cover. This is equivalent to requiring strictness for every comparable pair whose labels decrease: any saturated chain between such a pair must include a strict cover. Conversely all covers are comparable pairs. Sorting a map by values, with ties broken by increasing labels, gives a linear extension. Given an extension with $i$ descents, the resulting value sequences satisfy exactly $i$ strict inequalities at adjacent positions, so there are $\binom{m+|P|-1-i}{|P|}$ such sequences. In particular, with $\Omega_{P,\omega}$ this order polynomial,
$$
 \sum_{j\ge0}\Omega_{P,\omega}(j+1)t^j
   =\frac{W_{P,\omega}(t)}{(1-t)^{|P|+1}}.
$$
Hence the signs on the covers, not label comparisons on unrelated pairs, determine $W$. This allows us to replace the natural labeling of $Q$ by a different one and place the chain labels anew to preserve the signs at the interfaces.

## The rook-matroid mechanism

Choose a decomposition of $Q$ into row chain $A$ and column chain $B$. The [Alexandersson–Jal width-two correspondence, Theorem 5.4 and Lemma 5.6](https://arxiv.org/html/2410.00127v3#S5.SS2) supplies a skew board and a canonical natural labeling of $Q$ by steps of its innermost path. Its basis-generating polynomial is
$$
 \mathcal R(\mathbf x,\mathbf y)
 =\sum_{\sigma\in\mathcal L(Q)}
        \prod_{a\in\operatorname{RA}(\sigma)}x_a
        \prod_{b\in\operatorname{DT}(\sigma)}y_b .
$$
Here $\sigma$ is the canonical label word of an extension, $\operatorname{RA}$ consists of row-chain ascent tops with the first position treated as an ascent, and $\operatorname{DT}$ consists of descent tops, all in the column chain. The specialization $x_a=1$, $y_b=t$ gives $W_Q(t)$.

We use two endpoint features of the canonical labels. If there are two minima, the row minimum is canonically the smallest label. If there are two maxima, the column maximum is canonically the largest label. Indeed the two minima must be first elements of the two chains, and the two maxima last elements. For either pair, both possible orders of the consecutive pair occur along feasible linear-extension paths: choose both minima first or both maxima last. Thus the square for the pair lies in the skew region. The innermost-path labeling has row label less than column label on every square, as in the proof of Theorem 5.4. Labels increase inside both chains, so the row minimum is chronologically and numerically first in the canonical labeling and the column maximum numerically last. If the construction strips a unique extreme on the other end, padding by its empty row or column restores that extreme and does not disturb the property at the end with two choices.

If the lower interface is mixed, choose the row chain to contain the minimum $v$ with a strict lower cover. With the canonical labeling just described,
$$
 v\in\operatorname{RA}(\sigma)\quad\Longleftrightarrow\quad \sigma\text{ starts at }v,
$$
because there is no label smaller than $v$. Place the last label of $L$ between the labels of the two minima. Since only cover signs matter, this realizes the required interface. A descent at that interface occurs exactly when $\sigma$ starts at $v$. Thus we make the extra specialization $x_v=t$.

If the upper interface is mixed, choose the column chain to contain the maximum $w$ with a strict upper cover. Then
$$
 w\in\operatorname{DT}(\sigma)\quad\Longleftrightarrow\quad \sigma\text{ does not end at }w,
$$
because its label is greatest. Place the first label of $U$ between the two maximum labels to realize the required upper interface signs. Now the descent occurs exactly when $\sigma$ ends at $w$; setting $y_w=1$ and multiplying the whole polynomial by $t$ makes precisely that change. If both interfaces are mixed, our opposite-chain condition makes both of these changes available within one matroid representation.

All descents internal to $L$ and $U$, and any uniform interface descent, contribute a common monomial factor. The prescribed comparisons within each chain and at its endpoint can be maintained by choosing all its other labels successively, respecting the sign at each neighboring pair, and then ranking the resulting distinct real labels. The comparisons of non-cover pairs are irrelevant.

The remaining polynomial counts matroid bases by intersection cardinality with one fixed subset of the ground set, namely the variables specialized to $t$. Those coefficients are ultra-log-concave by the Lorentzian basis-polynomial theorem and its closure under nonnegative linear substitutions, exactly as in [Alexandersson–Jal Corollary 5.8](https://arxiv.org/html/2410.00127v3#S5.SS2). This implies ordinary log-concavity. A common monomial factor preserves log-concavity with no internal zeros, proving the theorem.

## Larger closure and a reduction of the possible counterexamples

The class of labeled posets satisfying Brenti's conclusion is closed under:
- **Disjoint union with absolutely arbitrary interleaving of labels.** The two labeled order-polynomial counts multiply because there are no constraints between the components. Thus the identity in the cover-sign section and [Theorem 1.2 of *Preservation of log-concavity under Hadamard products*](https://arxiv.org/html/2609.11589v1#S1) give the conclusion.
- **Ordinal sum with a uniform interface.** Every extension is the concatenation of two component extensions. The interface contributes a constant $0$ or $1$ to every descent count, so the descent polynomial is a monomial times the product of the component polynomials. Ordinary convolution preserves log-concavity with no internal zeros.

These closures extend the theorem to recursively constructed posets of unbounded width, starting from the boundary extensions above and from their globally label-reversed counterparts. In particular, every smallest counterexample to Brenti is connected and has no nontrivial ordinal split whose interface has uniform cover signs. This does not assert closure under an arbitrary ordinal sum.

One can also remove the no-internal-zeros clause as an independent obstruction: the graph of linear extensions under adjacent swaps of incomparable vertices is connected. To transform one extension into another, move the next desired vertex leftward through all preceding vertices not appearing in the already matched prefix; each is incomparable with it because the two extensions put them in opposite orders. Swapping adjacent increasing labels $a<b$ raises the central descent indicator by $1$, while each exterior indicator decreases by either $0$ or $1$. Thus any such swap changes the total by at most $1$, and along a path between minimum and maximum descent counts all intermediate counts occur.

## Sources and scope

- [Brenti, *Unimodal, log-concave, and Pólya frequency sequences in combinatorics* (1989), Conjecture 1.1](https://doi.org/10.1090/memo/0413), restated as [Alexandersson–Jal Conjecture 5.2](https://arxiv.org/html/2410.00127v3#S5.SS1), allows every labeling, not just natural labelings.
- [Brändén–Huh, *Lorentzian polynomials*, Theorems 2.10 and 3.10](https://arxiv.org/abs/1902.03719) supplies the nonnegative linear specialization and matroid basis facts used above. Alexandersson–Jal proves the naturally labeled width-two case. The endpoint regrouping allows strict covers at otherwise nonnatural boundary interfaces.
- [Ferroni, *Unimodality shenanigans in Ehrhart theory*](https://arxiv.org/html/2609.10513v2) refutes Brenti's different Gorenstein-IDP Hilbert numerator conjecture, not the labeled-poset conjecture. The failed Neggers–Stanley real-rootedness claim is also stronger and different.
- A search for earlier results on arbitrary-labeled minimum/maximum extensions of width-two posets and this rook-matroid specialization did not locate an identical result. The current argument does not cover arbitrary strict signs inside the two chains or a general pair of mixed interfaces.
