# The missing-pair graphon regime forces parity

**Theorem.** Let a balanced six-color graphon have zero rainbow six-cycle density. If there is a fixed pair \(A,B\) of colors that does not occur together in any positive-density rainbow triangle, then there is an exact parity cut: the space splits into two halves so that three colors occur only across the cut and the other three only within its sides.

Equivalently any nonparity zero-cycle graphon must have a positive-density rainbow triangle containing each of the fifteen color pairs. This closes the [missing-pair reduction](PAIR-GRAPHONS.md) with no assumption on the mixture, balance or positivity of interpart degrees beyond the original color balance. It does **not** solve [Erdős #811](https://www.erdosproblems.com/811) in the remaining all-pairs regime.

## Setup

The missing-pair theorem gives three parts \(X_1,X_2,X_3\), each of measure \(2t=1/3\), with \(A,B\) filling precisely the within-part edges. Perform [deterministic refinement](DETERMINISTIC.md) if needed; it preserves forbidden densities and balance, and parity descends. [The two-type theorem](TWO-TYPES-ALL-PARTS.md) gives two half-blocks of size \(t\) in each part, with internal bit \(p_i\). Their internal rule depends only on the sum of bits. By [support compatibility](SUPPORT-PERMUTATIONS.md) that rule has the same effect in all three parts.

By [deterministic paired degrees](DETERMINISTIC-PAIRED-DEGREES.md), for each source part \(i\) there is a pairing bit \(\pi_i\) of the four cross colors \(K\), a measurable bit \(h_i\) on \(X_i\), and fixed bits \(\eta_{ij}\) for \(j\ne i\), such that
\[
\pi_i(\operatorname{col}(xy))=h_i(x)+p_j(y)+\eta_{ij}
\quad(x\in X_i,\ y\in X_j).
\]
The corresponding equation from the other endpoint also holds:
\[
\pi_j(\operatorname{col}(xy))=p_i(x)+h_j(y)+\eta_{ji}.
\]
All bit sums below are modulo two. The choice of which color pair has bit zero may be made independently for each source, by adjusting its shifts.

## A pairing shared by two parts suffices

If \(\pi_j,\pi_k\) define the same pairing, choose their color-bit conventions to agree, and call their common bit \(\pi\). Comparing the two equations on that interface forces \(h_j+p_j\) and \(h_k+p_k\) both constant almost everywhere. Consequently on every interpart interface the bit \(\pi(\operatorname{col}(xy))\) equals \(p_i(x)+p_{i'}(y)\) up to one fixed shift depending on the interface: on each edge at least one endpoint is in \(X_j\) or \(X_k\).

One can flip the bits of whole parts to make all three shifts equal. In fact their sum is unchanged by the flips; choosing this sum as the common shift gives a solvable linear system on the three part flips. As the internal bit effects agree and the internal pairs have two colors, the union of the zero-bit half-blocks is now one half of a parity cut, and one cross-color pair together with the opposite-bit internal color are its three crossing colors.

## Three different pairings are impossible

Identify \(K\) with \(\mathbb F_2^2\). If the three source pairings are distinct, take \(\pi_1,\pi_2,\pi_3\) to be the three distinct nonzero linear forms, changing the constant convention where necessary. Then \(\pi_1+\pi_2+\pi_3=0\).

Put \(f_i=p_i+h_i\), and write
\[
H_i=\mathbb E_{x\in X_i}(-1)^{h_i(x)},\qquad
F_i=\mathbb E_{x\in X_i}(-1)^{f_i(x)}
\]
with uniform probability on the part. For distinct \(i,j,k\), compute the signed degree in character \(\pi_j\) at a fixed typical \(x\in X_i\). The mean sign into \(X_j\) is \((-1)^{p_i(x)+\eta_{ji}}H_j\). Into \(X_k\), use \(\pi_j=\pi_i+\pi_k\) and add the two endpoint equations there. Its mean sign is \((-1)^{f_i(x)+\eta_{ik}+\eta_{ki}}F_k\). The sum is zero because each of the four colors has total degree \(t\) at \(x\) and the two target parts have the same mass. Cancel the sign \((-1)^{p_i(x)}\) to obtain
\[
(-1)^{\eta_{ji}}H_j+
(-1)^{h_i(x)+\eta_{ik}+\eta_{ki}}F_k=0.
\]
If some \(h_i\) takes both bit values on positive mass, this equation and the one with \(j,k\) reversed give \(H_j=F_j=H_k=F_k=0\). Since both \(p_j,p_k\) are balanced, all four combined \((p,h)\)-labels of those parts have measure \(t/2\). In particular their \(h\)'s take both values, so repeating gives the same uniform conclusion on \(X_i\). On the other hand, if all \(h_i\) are constant, then all \(F_i=0\) since the \(p_i\)'s are balanced, and the displayed equation forces \(H_j=0\), an impossibility for constant \(h_j\). Thus the uniform-label case is inevitable.

Now on any distinct-pairing interface \(X_i,X_j\), express the color in the two coordinates \((\pi_i,\pi_j)\). It is a full Klein table
\[
(h_i(x),p_i(x))+(p_j(y),h_j(y))+(\eta_{ij},\eta_{ji})
\]
with all four labels of each part present. Absorb the shift into a label offset. The [two-part difference test](ONE-POSITIVE-PART.md) says that internal edges of any given label difference must use the same color in the two parts; otherwise one and three alternating cross edges using the four colors connect opposite internal colors into a rainbow six-cycle. Concretely the difference \((1,0)\) preserves the internal bit in \(X_i\) (its second coordinate) but reverses it in \(X_j\) (its first coordinate). The internal effects already agree, so these edges have opposite internal colors. This contradiction rules out three different source pairings.

A pairing is shared by two parts, so the previous construction proves the theorem. This is a structural subcase of the open original conjecture, tracked at [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
