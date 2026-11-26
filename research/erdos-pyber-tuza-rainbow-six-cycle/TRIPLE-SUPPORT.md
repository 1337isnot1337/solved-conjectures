# A single common-support palette forces parity

**Partial theorem.** Let six symmetric balanced graphon colors have zero rainbow six-cycle density. Suppose some three colors have common positive support of row measure at least \(1/2-\delta\) outside a set of rows of measure at most \(\beta\), where \(\delta+\beta\le10^{-38}\). Then the coloring is an exact two-part parity model. No support condition is needed on the other three colors, or on additional support of the three specified colors.

This gives another sufficient criterion for [Erdős #811](https://www.erdosproblems.com/811), complementing the [six individual half-support conditions](HALF-SUPPORT.md). The proof does not show that every zero-rainbow balanced graphon has such a triple.

## A half-degree rectangle extracted from the missing cycle

Let \(W_1,\ldots,W_6\) be the kernels, summing to one with each row degree \(1/6\). Let \(A\) be the indicator of their common positive support for colors \(1,2,3\). Let \(K\) be the product kernel \((6W_4)(6W_5)(6W_6)\), so \(K\) is doubly stochastic. All products here are integral-operator products, not pointwise products. Concatenating a path in \(A\) with a reverse path in the three other colors would create a rainbow walk. Therefore
\[
A^3(x,y)K(x,y)=0
\quad\text{for almost every }(x,y).
\tag{1}
\]
For this implication the three edges in \(A\) may be assigned the three distinct colors in any prescribed order: each edge has all three weights positive. Replacing the positive weights by indicators affects positivity, not the zero conclusion.

Call a row good at first if its \(A\)-degree is at least \(1/2-\delta\). If \(x\) has \(A\)-degree greater than \(1/2+\delta\), then its neighborhood intersects that of every good \(y\) in positive measure, so \(A^2(x,y)>0\) there. The neighborhood of each good \(z\) meets the good set in positive measure, since \(1/2-\delta>\beta\). Hence \(A^3(x,z)>0\) for almost every good \(z\). By (1), the \(K\)-rows of such large-degree vertices send all their mass into the bad set, so those vertices have measure at most \(\beta\) by the column sums of \(K\). Discarding both original bad rows and these high-degree rows leaves a set \(T_0\) of measure at least \(1-2\beta\) on which all degrees are within \(\delta\) of \(1/2\).

The stochastic kernel \(K\) has positive weight on \(T_0\times T_0\). Choose a typical pair \(x_0,y_0\) there where \(K>0\). By (1), \(A^3(x_0,y_0)=0\). Set \(C=N_A(x_0)\) and \(D=N_A(y_0)\). Then \(A=0\) almost everywhere on \(C\times D\), and both \(C,D\) have measure within \(\delta\) of \(1/2\).

Put \(F(x,y)=\mathbf1_C(x)\mathbin{\mathrm{xor}}\mathbf1_D(y)\). The missing mass on \(C\times D^c\) is at most \(2\delta+2\beta\): a row of \(C\cap T_0\) has degree at least \(1/2-\delta\), all into \(D^c\), and the other rows have measure at most \(2\beta\). By symmetry of \(A\), the same bound holds on \(C^c\times D\). The weight on \(C^c\times D^c\) is at most \(4\delta+4\beta\), by subtracting the weight on \(C^c\times D\) from the total weight in the \(C^c\) rows, whose degrees are at most \(1/2+\delta\) off the exceptional \(2\beta\). Thus \(\|A-F\|_1\le8(\delta+\beta)\).

Since \(A\) is symmetric, \(\|F-F^{\mathsf T}\|_1\le16(\delta+\beta)\). Writing \(p=\mu(C\triangle D)\), this norm is \(2p(1-p)\), since \(F(x,y)\ne F(y,x)\) precisely when exactly one of \(x,y\) lies in \(C\triangle D\). Therefore either \(D\) or \(D^c\) differs in measure from \(C\) by at most \(16(\delta+\beta)\). The indicator \(A\) is within \(24(\delta+\beta)\) in \(L^1\) of a parity support \(P\), either the inside-block or the across-block indicator for the cut \(C,C^c\).

## No wrong edges of the specified palette between typical vertices

Write \(\sigma=\pm1\) for the cut signs, and write \(\eta=+1\) when \(P\) is the within-part indicator and \(\eta=-1\) otherwise. Let \(e=\sqrt{24(\delta+\beta)}\). Remove at most \(e\) measure of rows, to leave a typical set \(T\) on which every \(A\)-row differs from the corresponding \(P\)-row in measure by at most \(e\). For \(e=0\) the same statement holds off null sets. Both cut parts have measure at least \(1/2-\delta\).

For any typical \(x,y\) with \(\sigma(y)=\eta\sigma(x)\), \(A^3(x,y)>0\). Indeed, their \(A\)-neighbor sets contain all but \(e\) of the halves of signs \(\eta\sigma(x),\eta\sigma(y)\), respectively. Those halves are an allowed \(P\)-rectangle for the middle \(A\)-edge. The integral of \(A\) over their neighborhoods is at least \((1/2-\delta-e)^2-e^2>0\). It follows from (1) that \(K\) between typical endpoints is supported on the **opposite** relation \(\sigma(y)=-\eta\sigma(x)\).

For any cut half \(H_1\) and its target half \(H_2\) in this opposite relation, \(K\) has weight at least \(\mu(H_1)-2e\) on \(H_1\times H_2\): discard at most \(e\) mass of atypical start rows and at most \(e\) mass of atypical end columns. Now take typical \(u,v\) with \(P(u,v)=0\). The ideal \(A\)-neighbors of \(u,v\) have signs \(\eta\sigma(u),\eta\sigma(v)\), which form one such opposite pair of halves. Hence
\[
\int_{N_A(u)\times N_A(v)}K(x,y)\,dx\,dy
\ge 1/2-\delta-4e>0,
\]
using double stochasticity to discard at most another \(e\) at each end. If any \(W_i(u,v)>0\) for \(i\in\{1,2,3\}\) on a positive-measure set of such pairs, the path \(x,u,v,y\) uses color \(i\) in the middle and the other two specified colors on its end edges, followed in reverse by the path in \(K\). This gives a positive rainbow cycle integral, a contradiction. Therefore all three specified colors vanish almost everywhere on wrong pairs between typical vertices.

## Upgrade to exact parity

Let \(Q=W_1+W_2+W_3\). Its weight outside \(P\) is at most \(2e\), and its total integral is \(1/2\). The area of \(P\) differs from \(1/2\) by at most \(2\delta^2\). Thus
\[
\|Q-P\|_1\le 4e+2\delta^2.
\]
This is below \(10^{-14}/36\), the threshold of the [weighted graphon repair lemma](HALF-SUPPORT.md#weighted-graphon-repair-lemma). Apply the lemma, swapping the palette names if \(P\) was the within-part indicator. The result is an exact parity cut with the same palettes.

The original [Erdős–Tuza source](https://doi.org/10.1016/S0167-5060(08)70377-7), the [modern completely balanced work](https://arxiv.org/abs/2209.13867), and [the #811 working report](https://www.erdosproblemaday.com/report/811) were checked for a matching common-support statement. The new step is to use only one palette, deriving its structure from a rectangle with zero three-walk density and then using the complementary stochastic path to exclude extra wrong edges. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
