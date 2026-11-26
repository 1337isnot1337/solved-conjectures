# Three broad colors force parity

**Partial theorem.** Some absolute \(\varepsilon>0\) has the following property. Let six symmetric colors of a balanced graphon have zero rainbow six-cycle density. If three of the colors each have positive support of row measure at least \(1/2-\varepsilon\) outside a set of rows of measure at most \(\varepsilon\), the graphon is an exact two-part parity model. The three colors need not have any common support, and there is no support hypothesis on the other three. Neither the parity cut nor its palettes need be fixed in advance.

This strengthens the [six-individual-color criterion](HALF-SUPPORT.md) as to the number of colors required, with a nonexplicit \(\varepsilon\). It is a structural partial result for [Erdős #811](https://www.erdosproblems.com/811).

## Extracting synchronized approximate cuts

For contradiction take a sequence of nonparity zero-rainbow balanced graphons in which the hypothesis holds with errors tending to zero. Rename the three broad colors \(1,2,3\) in each graphon; write \(A_i=\mathbf1_{\{W_i>0\}}\) for their supports. In the following argument \(\delta,\beta=o(1)\) are the common row-degree deficit and the measure of an exceptional set (the union of the three exceptions).

Put \(P_j=6W_j\) for \(j=4,5,6\). Every product \(K=P_4P_5P_6\) in any order is doubly stochastic. For every permutation \(i,j,k\) of \(1,2,3\), the vanished rainbow count says
\[
(A_iA_jA_k)(x,y)K(x,y)=0
\quad\text{almost everywhere}.
\tag{1}
\]
Indeed a path in the first product can be joined to the reverse of a path in \(K\); replacing its positive weights by supports does not change whether its integral is zero.

If \(A_i\) has row degree greater than \(1/2+\delta\) at \(x\), then its neighborhood meets the \(A_j\)-neighborhood of every nonexceptional vertex in positive measure. Each nonexceptional \(y\) has a positive-measure \(A_k\)-neighborhood in the nonexceptional set. Thus \((A_iA_jA_k)(x,y)>0\) for almost every such \(y\). By (1) the \(K\)-rows from these high-degree \(x\) must send all their mass into the exceptional set. The column sums bound their measure by \(\beta\). Removing these rows for each \(i\) leaves a common set \(T_0\) of measure at least \(1-4\beta\) on which all three support degrees are within \(\delta\) of \(1/2\).

Choose \(x_0,y_0\in T_0\) with \(K(x_0,y_0)>0\), typical for (1) in every first-palette order, and set \(C_i=N_{A_i}(x_0)\), \(D_i=N_{A_i}(y_0)\). For each triple of distinct indices \(i,j,k\), the graphon \(A_j\) vanishes on \(C_i\times D_k\). Both sides have measure \(1/2+O(\delta)\). The half-degree rectangle argument in [TRIPLE-SUPPORT.md](TRIPLE-SUPPORT.md) applies to \(A_j\): on \(C_i\times D_k^c\) and on \(C_i^c\times D_k\) the missing weight is \(O(\delta+\beta)\) by the degree lower bound and symmetry. On \(C_i^c\times D_k^c\) the extra weight is \(O(\delta+\beta)\) by the degree upper bound. Thus \(A_j\) is \(o(1)\)-close in \(L^1\) to the indicator \(\mathbf1_{C_i}(x)\operatorname{xor}\mathbf1_{D_k}(y)\). Symmetry implies that \(C_i\) and either \(D_k\) or \(D_k^c\) differ by \(o(1)\), since the latter indicator's disagreement with its transpose is \(2p(1-p)\) for \(p=\mu(C_i\triangle D_k)\). Hence \(A_j\) is close to an inside- or across-block indicator for the cut at \(C_i\).

These cuts agree up to complement and \(o(1)\) measure. To see this, do the preceding argument with \(j\) fixed and swap the two other indices between the first and last positions; the same \(A_j\) is close to parity supports for each of the corresponding \(C_i\). For sign functions \(f,g\) their inside-block indicators are \((1+f(x)f(y))/2\) and \((1+g(x)g(y))/2\). Opposite relation signs give distance \(p^2+(1-p)^2\ge1/2\) where \(p=\mu\{f\ne g\}\); equal signs give \(2p(1-p)\), which is small only near equality up to complement. Taking \(j=1,2\) therefore aligns all three cuts. Write \(C=C_1\), and let \(\sigma=\pm1\) mark its halves. For each \(i\) there is a sign \(\eta_i=\pm1\) such that \(A_i\) is close to the support \(\sigma(y)=\eta_i\sigma(x)\). Pass to a subsequence with fixed \(\eta_1,\eta_2,\eta_3\).

Since \(W_i\le A_i\), the actual first three colors put \(o(1)\) weight on their wrong cut relations. Put \(\eta=\eta_1\eta_2\eta_3\). For each broad color, discard \(o(1)\) measure of rows so that every remaining support row is \(o(1)\)-close in measure to its ideal half. For any two retained endpoints with \(\sigma(y)=\eta\sigma(x)\), the path kernel \(A_1A_2A_3(x,y)\) is positive: the first and last neighborhoods contain almost all of their ideal halves, and the middle support is close in \(L^1\) to one on the resulting rectangle of area \(1/4-o(1)\). Therefore every complementary order \(K\) puts \(o(1)\) mass on this same relation: by (1) the endpoints of its mass there must include a discarded row or column, and \(K\) is doubly stochastic.

## The exact routing limit

Pass to a limit in the colored cut metric, keeping the cut as a decoration. One way is to add the graphon \(\mathbf1_C(x)\mathbf1_C(y)\) as a coordinate in [decorated graphon compactness](https://arxiv.org/abs/1010.5155). Its degree functions converge in \(L^1\) along the same relabelings, since \(\|\deg(U)-\deg(V)\|_1\le2\|U-V\|_\square\). Since these degree functions are \(\mu(C)\mathbf1_C\) with \(\mu(C)\to1/2\), the indicator converges in \(L^1\) to a cut of measure \(1/2\). The cut relation indicators then also converge in \(L^1\). Bounded colored counting continuity (a three-edge path and the extra relation edge joining its ends) passes the \(K\)-mass assertion to the limit. Balance and the assertions about the first three colors also pass to the limit. Thus in the limit:

- \(W_i\), \(i=1,2,3\), lies entirely on \(\sigma(y)=\eta_i\sigma(x)\).
- For **every order** of the three remaining normalized color operators,
\[
P_iP_jP_k\sigma=s\sigma,\qquad s=-\eta.
\tag{2}
\]

All \(P_i\) are self-adjoint Markov contractions on \(L^2\). For \(i=4,5,6\) put \(f_i=P_i\sigma\). In an order where \(P_i\) is applied first, equality of the initial and final norms in (2) gives \(\|f_i\|_2=1\). Since \(|f_i|\le1\), each \(f_i\) is a sign function almost everywhere. Equality in the contraction also gives \(P_i^2\sigma=\sigma\), using positivity of \(I-P_i^2\). For distinct \(i,j,k\), write \(v=P_j f_k\). Equality along (2) gives \(\|P_i v\|=\|v\|=1\), hence \(P_i^2v=v\). Applying \(P_i\) to \(P_i v=s\sigma\) gives
\[
P_j f_k=s f_i.
\tag{3}
\]
These equalities describe deterministic transitions on cut signs. Along a positive \(W_i\) edge \(x,y\) one has \(\sigma(y)=f_i(x)\), \(f_i(y)=\sigma(x)\), and \(f_j(y)=s f_k(x)\) for the other two colors. For each equality, the expected value of a sign is itself a sign, so the indicated value holds on the full positive support up to null sets.

Let \(t\) be the number of the first three colors which cross the cut. Since the cut is balanced and every color has degree \(1/6\), the total across-weight of the remaining colors in each row is \((3-t)/6\). Put \(h_i(x)=f_i(x)/\sigma(x)\). Each remaining color is entirely within in a row with \(h_i=+1\), and entirely across when \(h_i=-1\). Exactly \(t\) of these three signs are then \(+1\) in each row. If \(t=0\) or \(3\), all three remaining colors have one fixed relation sign; that already gives a parity cut.

If \(t=1\) or \(2\), exactly one of the three signs \(h_i\) differs from the other two. Write \(w(x)\) for its color. Its distinguished sign is \(s\): it is \(+1\) for \(t=1\) and \(-1\) for \(t=2\). Every positive edge in any remaining color preserves \(w\). In fact, on a \(W_i\) edge the transition formulas above give
\[
h_i(y)=h_i(x),\qquad h_j(y)=s h_k(x)h_i(x)\quad(j\ne i).
\]
If \(w(x)=i\), this keeps \(i\) distinguished. If \(w(x)=j\ne i\), substituting \(h_i(x)=h_k(x)=-s\) gives \(h_j(y)=s\) and keeps \(j\) distinguished.

The remaining palette has degree \(1/2\) and its edges never leave the classes of \(w\). Every positive-measure class therefore has size at least \(1/2\). If there is just one, all three remaining colors have fixed relation signs, with exactly three crossing colors among the six. If there are two, both have size \(1/2\). The remaining palette fills them internally because its row degree is \(1/2\), leaving the first palette entirely across. Thus either \(\sigma\) or the two \(w\)-classes give an exact parity model of the limit.

## Conclusion

Use that limit's cut, not necessarily the initially extracted cut, as the candidate parity cut for each graphon in the relabeled sequence. Cut convergence gives \(o(1)\) total wrong weight by testing the fixed two within-rectangles and two across-rectangles where the limiting wrong weights vanish. The [weighted graphon repair lemma](HALF-SUPPORT.md#weighted-graphon-repair-lemma) now forces an exact parity model for each sufficiently late graphon. This contradicts the chosen sequence and proves the theorem.

The unrestricted problem would follow if every zero-rainbow balanced graphon had three such broad colors, or an independent means of forcing the general parity criterion. Neither is shown here. Sources checked for exact priority are the [original chapter](https://doi.org/10.1016/S0167-5060(08)70377-7), the [modern balanced-coloring paper](https://arxiv.org/abs/2209.13867), and the [public #811 report](https://www.erdosproblemaday.com/report/811). Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
