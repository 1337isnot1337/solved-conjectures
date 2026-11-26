# All four missing labels and no complete root

**Theorem.** In the balanced [three-block model](PAIR-GRAPHONS.md) with zero rainbow six-cycle density, fix one part \(X\) of measure \(2t\), where \(t=1/6\). Suppose almost every outside vertex sees at least three cross colors into \(X\), all four missing-label classes \(M_a\) from [THREE-COLOR-PROFILES.md](THREE-COLOR-PROFILES.md) have measure at least \(t\), and almost every root in \(X\) lacks at least one unordered two-cross-color return palette. Then there is an exact parity cut.

The last requirement is a condition on roots, not on individual incident vertices. A root lacks a palette if neither order of its two colors gives a positive-density two-step return to that same part. The theorem leaves the case of a positive measure of complete roots open. Make colors deterministic via [circle refinement](DETERMINISTIC.md): it preserves the original per-part color degrees and the rooted two-path existence test used below. Parity descends.

## The forced label table

Let the palette be \(K=\mathbb F_2^2\). The four \(M_a\) are disjoint and their total size is at most \(4t\), so each has measure exactly \(t\), and they fill the outside. Write \(v(y)=a\) on \(M_a\).

If root \(x\in X\) lacks the palette \(\{a,b\}\), its outside \(a\)- and \(b\)-neighborhoods must be \(M_b\) and \(M_a\) respectively, since both neighborhoods have measure \(t\) and missing second colors force containment. On the other two missing-label classes \(M_c,M_d\) only colors \(c,d\) remain, and each class excludes its own label by definition. Thus the entire row of \(x\) on the outside is the fixed-point-free involution exchanging \(a,b\) and \(c,d\). On the four labels these involutions are exactly the nonzero translations. We obtain a label \(u(x)\in K\setminus\{0\}\) and a cross-color rule
\[
\operatorname{col}(xy)=u(x)+v(y).
\]
For \(d\in K\), let \(s_d\) be the measure of \(X\) with label \(d\). All three nonzero weights are positive: each outside vertex sends three colors into \(X\), and the table shows that this number is the same as the number of positive \(s_d\). We have \(s_0=0,\ 0<s_d\le t\) for \(d\ne0\), and \(\sum_d s_d=2t\).

## The split of outside labels

Let \(Y,Z\) be the other parts, and let \(w_a\) be the \(M_a\) mass in \(Y\); its mass in \(Z\) is \(t-w_a\). The degree of color \(c\) from an outside vertex with label \(a\) to the other outside part is \(h(c+a)=t-s_{c+a}\), by total balance. Count that color's \(Y,Z\) edges from both sides to obtain
\[
\sum_a w_a h(c+a)=\sum_a (t-w_a)h(c+a)=t^2.
\]
For a nontrivial character with kernel \(\{0,d\}\), the Fourier coefficient of \(h\) is \(2(t-s_d)\) in unnormalized convention. Hence if no \(s_d\) equals \(t\), then \(w_a=t/2\) at all four labels. If there is a saturated \(s_{d_0}=t\), it is unique, and \(w_a=t/2+q(-1)^{\pi(a)}\) for some \(|q|\le t/2\), where \(\pi\) is the nonzero bit with kernel \(\{0,d_0\}\).

## If both outside parts use all four labels

Apply the [two-part difference test](ONE-POSITIVE-PART.md) with \(Y\) as the side having all four labels and \(X\) as the side having three. All four differences occur among three labels of the Klein group. This assigns each difference the same internal color in the two parts. Averaging \(A\)-degrees over the four labels in \(Y\) makes its \(A\)-rule a two-element fiber of a bit on differences. In \(X\), which has three positive labels, the two classes for this bit therefore each have mass \(t\); one consists of a single label of mass \(t\), which must be \(d_0\). The bit is precisely \(\pi\), since \(d_0\) and \(0\) must lie in the same bit class, with the other two labels in the other class. Applying the test again with \(Z\) shows that all three parts use the same internal bit rule. In particular this case is impossible without a saturated \(X\)-label.

Write \(p_Y(y)=\pi(v(y))\) and \(p_Z(z)=\pi(v(z))\) for the outside row bits. At any root in \(Y\) or \(Z\), every unordered two-color palette has a positive-density return via \(X\): for starting label \(a\), choose as first color either palette color other than \(a\). Its target \(X\)-label is nonzero, and the second step produces an available outside label. The endpoint bit changes by the sum of the bits of the colors. Thus, by the complementary-palette argument, any two colors \(b,c\) present from an outside vertex into \(Y\) have their neighborhoods in single row classes whose bits differ by \(\pi(b)+\pi(c)\). There are at least two present colors by the degree cap \(t\); the same holds into \(Z\). Hence the cross interface \(Y,Z\) has
\[
\pi(\operatorname{col}(yz))=p_Y(y)+p_Z(z)+g
\]
for a constant bit \(g\): applying the class description from both ends makes the difference the sum of a function of \(y\) and a function of \(z\) which vanishes almost everywhere, so both functions are constant. (Equivalently write the expressions as \(p_Y(y)+a(z)\) and \(p_Z(z)+b(y)\) and compare.) The cross interfaces to \(X\) already have this form with shift zero and bit \(p_X=\pi(u)\). Flipping part bits, and if necessary interchanging which cross-color pair is called crossing, makes all three shifts agree. Together with the common internal bit rule this gives a half cut with exactly three crossing colors.

## The extreme split cannot avoid the cycle

It remains to eliminate \(|q|=t/2\), when \(Y\) uses the two labels of \(\pi\)-bit zero and \(Z\) the two labels of bit one, or vice versa. Swap parts to take the former case. All four outside label classes in their respective parts have mass \(t\).

Between labels \(a\) in \(Y\) and \(b\) in \(Z\), the two allowable colors are \(a,b\): the endpoint labels exclude \(a+d_0\) and \(b+d_0\), respectively. A vertex of label \(a\) sends color \(b\) only to the \(b\)-class of \(Z\), and there it has \(b\)-degree \(t-s_{a+b}\). Its \(a\)-degree in that block is \(s_{a+b}\). A vertex of label \(b\) has \(a\)-degree \(t-s_{a+b}\) into the \(a\)-class of \(Y\). Counting the \(a\)-edges of this block from both sides gives \(s_{a+b}=t/2\). In particular each vertex of either label sees both of these colors into the other class with positive degree.

Now take \(X\)-endpoints with labels \(d_0\) and \(d_1\ne0,d_0\). Choose any label \(a\) in \(Y\) and the label \(b\) in \(Z\) different from \(d_1+a\) (both latter bits are one). There is a positive-density four-step return with intermediate labels \(a,b,a\) in \(Y,Z,Y\), in colors \(d_0+a,a,b,d_1+a\), respectively. They are all distinct, and the two middle choices have positive simultaneous support by independently choosing one neighbor of each color at a root of label \(b\). Every pair of endpoint \(A\)-rows is therefore equal across these two \(X\)-label classes. Their combined mass \(t+s_{d_1}\) exceeds \(t\), impossible for a single \(A\)-row class. This rules out the extreme split.

This removes the all-heavy, entirely palette-deficient target-part profile from the nonparity obstruction. Neither the general mixed-profile case nor the unrestricted Erdős conjecture is resolved. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
