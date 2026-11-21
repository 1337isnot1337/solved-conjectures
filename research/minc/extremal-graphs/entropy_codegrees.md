# Maximum permanent when the line sum does not divide the order

For a binary matrix \(G\) with all degrees \(k\), let \(c_{ab}\) be the number of common row neighbors of columns \(a,b\), including \(c_{aa}=k\). Fix \(\beta<1\). If for each column \(a\) the sum of its \(k\) largest codegrees \(c_{ab}\) is at most \(\beta k^2\), then for \(k\) sufficiently large in terms of \(\beta\)
\[
 \log\frac{(k!)^{n/k}}{\operatorname{per}G}
 \ \ge\ c_\beta\,\frac nk\log k,\qquad c_\beta>0. \tag{1}
\]
In particular every sufficiently large prime order with \(2\le k=o(n)\) admits a \(k\)-regular matrix beating every \(k\)-regular circulant, in the sequential sense that any such sequence eventually has this property. The theorem quantifies the loss at many stages of the entropy proof of Brègman's inequality. [Radhakrishnan](https://www.tcs.tifr.res.in/~jaikumar/Papers/EntropyAndCounting.pdf) · [Minc Problem 12](https://yair-lavi.com/mincs-list/problem-12/)

## An exact lower bound from column sums

Choose a uniform perfect matching and an independent uniform order of the rows. Condition on the revealed prefix and its assignments. The residual graph on \(m\) rows and \(m\) columns has a perfect matching. Its true row assignment probabilities \(P_{ij}\) form a doubly stochastic matrix. Let \(Q_{ij}\) give equal mass to each still available neighbor of row \(i\), and set \(s_j=\sum_iQ_{ij}>0\). For the next uniformly chosen row, the difference between its log available degree and its conditional assignment entropy has average \(m^{-1}\sum_i D(P_i\Vert Q_i)\). Passing to the column marginal of the joint distributions \(P/m,Q/m\) gives the lower bound
\[
 \frac1m\sum_j-\log s_j=\frac1m\sum_j\phi(s_j),
 \qquad \phi(s)=s-1-\log s.
\]
The expected sum of log available degrees over the process is \(n\log(k!)/k\), since each row's rank among its original \(k\) matched neighbors is uniform. The entropy chain rule sums the assignment entropies to \(\log\operatorname{per}G\).

For the resulting graph statistic we can now condition on the complete matching \(M\). Label each column by its matched row. Write \(O_i=\{j:G_{i,M(j)}=1\}\) and \(I_j=\{i:j\in O_i\}\). Both have size \(k\) and contain their own label. For a remaining row set \(T\), both remaining label sets are \(T\), and \(s_j=\sum_{i\in I_j\cap T}1/|O_i\cap T|\) for \(j\in T\). Conditional on \(M\) the set \(T\) is uniform at each fixed size. Mixing independent Bernoulli-\(p\) subsets with the beta integral \(\binom nm\int_0^1p^{m-1}(1-p)^{n-m}\,dp=1/m\) gives
\[
 \log\frac{(k!)^{n/k}}{\operatorname{per}G}
 \ \ge\ \mathbb E_M\sum_j\int_0^1
       \mathbb E_p[\phi(s_j)\mid j\in T]\,dp. \tag{2}
\]
Only the statistic on the right is evaluated with the whole matching fixed. Conditioning the original assignment entropy on the whole matching would invalidate the argument.

## Fluctuation at an intermediate density

Fix \(M,j\) and condition on \(j\in T\). Let \(X_\ell\) be the remaining independent Bernoulli indicators, with \(X_j=1\), and set \(Y=\sum_{\ell\in I_j\setminus\{j\}}(X_\ell-p)\). We show uniformly for \(p\le1/2\), \(pk\) sufficiently large, that
\[
 \mathbb E[(s_j-1)Y]\ge(1-\beta)/4,\qquad
 \mathbb E[(1+s_j)Y^2]\le Cpk. \tag{3}
\]
For any function \(f\) of these bits, \(\mathbb E[f(X)(X_\ell-p)]=p(1-p)\mathbb E[\Delta_\ell f]\), where \(\Delta_\ell\) sets that bit to one and subtracts the value at zero. For \(\ell=i\in I_j\setminus\{j\}\), the summand of \(s_j\) indexed by \(i\) contributes \(\mathbb E[1/(2+\operatorname{Bin}(k-2,p))]\) to the difference. There are \(k-1\) such contributions. A summand \(i\ne j,\ell\) can decrease only when \(\ell\in O_i\). It then contributes a loss \(p\,\mathbb E[1/(B(B+1))]\), \(B=2+\operatorname{Bin}(k-3,p)\), by conditioning on \(X_i=1\). The number of these ordered incidences is at most
\[
 \sum_{\ell\in I_j}|I_j\cap I_\ell| \le \beta k^2.
\]
The remaining summand \(i=j\) loses at most \(O((pk)^{-2})\) at each of at most \(k\) indices. For a fixed positive offset and a binomial variable on \(k-O(1)\) trials, its shifted inverse moment of fixed order \(a\) is \((pk)^{-a}(1+o(1))\) as \(pk\to\infty\), uniformly here. This follows by splitting at relative deviation \((pk)^{-1/4}\) and using the binomial exponential tail. The same conclusion applies to the product of adjacent inverse factors above. Multiplying the summed differences by \(p(1-p)\) proves the first part of (3), since the positive and negative main terms are \(1-p\) and at most \((1-p)\beta\).

For the other part, \(\mathbb E Y^4=O((pk)^2)\) by expanding the fourth moment of independent centered bits. Also \(\mathbb E s_j^2=O(1)\). To see the latter, expand the square over pairs \(i,\ell\in I_j\). Condition on both indicators being one. Each denominator comes from a \(k\)-set and has at most three forced bits, including at least one forced present bit. Cauchy–Schwarz and the inverse second moment bound its conditional reciprocal product by \(C/(pk)^2\). The sum of the probabilities that both indicators are one is \(\mathbb E|I_j\cap T|^2=O((pk)^2)\). A final Cauchy–Schwarz gives (3).

Integration of the derivative of \(\phi\) gives \(\phi(s)\ge(s-1)^2/[2(1+s)]\) for \(s>0\). By weighted Cauchy–Schwarz, (3) gives \(\mathbb E\phi(s_j)\ge c_\beta/(pk)\). Integrating (2) from \(K_\beta/k\) to \(1/2\) proves (1).

## Prime cyclic supports and the competing matrix

Let \(S\subset\mathbb Z/n\) have \(k\) elements, with \(n\) prime and \(k\le n/2\), and put \(r(x)=|S\cap(S+x)|\). Pollard's theorem gives \(\sum_x\min(r(x),a)\ge a(2k-a)\) for each \(1\le a\le k\), with equality for an interval. The \(r(x)\) have total \(k^2\). Subtract the truncated sums from this total and sum the resulting inequalities, using \(b^2=b+2\sum_{a\ge1}(b-a)_+\). This yields
\[
 \sum_x r(x)^2\le k^2+2\sum_{b=1}^{k-1} b^2=(2k^3+k)/3. \tag{4}
\]
Each row of the codegree matrix is a translate of these counts. Cauchy–Schwarz bounds its largest \(k\) terms in sum by \(k^2\sqrt{(2+1/k^2)/3}\le(\sqrt3/2)k^2\) for \(k\ge2\). Thus (1) applies with an absolute constant. [Pollard's theorem](https://doi.org/10.1112/jlms/s2-8.3.460)

There is always an unrestricted degree-\(k\) matrix within \(O(\log(k+1))\) in logarithm of the Brègman bound. Use \(\lfloor n/k\rfloor-1\) complete \(k\)-blocks and a final regular block of order \(m\in[k,2k)\). Its normalized permanent is at least \(d_m=m!/m^m\), by van der Waerden. The log deficit is at most \(\log(d_k^{m/k}/d_m)=O(\log(k+1))\) by Stirling. When \(k\to\infty\) and \(n/k\to\infty\), (1) beats this deficit. For bounded \(k\ge2\), the [complete-component bound](maximum_core.md) excludes a maximizing prime-order circulant eventually. These arguments cover every sequence in the sparse assertion.

The sources checked for the entropy refinement included Radhakrishnan, the fixed-degree extremal results of Wanless, the Cheon–Wanless survey, and searches on stability in Brègman's inequality, codegree energy, regular bipartite matchings, prime cyclic permanents and Pollard's theorem. The fixed-degree component result and the additive energy input are prior results. The codegree loss (1) was not located there. [Wanless](https://users.monash.edu.au/~iwanless/papers/complementDM.pdf) · [Cheon and Wanless](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf)
