# Spacing the prime pairs

Let \(k\) be the number of forms supplied by Maynard’s Theorem 3.4 for two simultaneous primes, with the fixed exponent used in the [interval proof](README.md). Every \(C>k-1\) works in that proof. The cofactors can depend on \(C\).

We need \(k\) positive integers \(s_i\) with two properties. Each pairwise difference must divide both entries, and the largest difference divided by the smallest must be less than \(C\). The second requirement is optimal up to the strict inequality for an ordered set of \(k\) points on the real line.

Take any \(k\) distinct base integers \(e_i\) from the construction in the interval proof. For \(i<j\) put \(e_{ij}=e_j-e_i\). Choose increasing positive integers \(b_i\) with the following properties, writing \(b_{ij}=b_j-b_i\).

1. The largest \(b_{ij}\) divided by the smallest is less than \(C\).
2. The integer \(b_{ij}e_{\ell m}-b_{\ell m}e_{ij}\) is nonzero for every two disjoint pairs \((i,j),(\ell,m)\).

For existence, start in a sufficiently small open neighborhood of \((1,2,\ldots,k)\), where the first inequality holds. Each expression in the second requirement cuts out a proper hyperplane, since the pairs are disjoint and both differences of \(e\)'s are nonzero. Choose a rational vector outside their finite union and clear its denominators.

Choose \(T\) a large positive multiple of all the absolute nonzero determinants in the second requirement, taking multiples of one if there are none. Put \(h_i=Tb_i+e_i\). For \(T\) sufficiently large the \(h_i\) increase and the largest distance divided by the smallest remains less than \(C\). We seek a common translation \(A\) such that \(s_i=A+h_i\) has the divisibility property. For each \(i<j\) impose

\[
 A\equiv-h_i\pmod{h_j-h_i}.
\]

Congruences sharing an index are compatible because the two entries of a pair agree modulo their difference. For disjoint pairs let \(g=\gcd(h_j-h_i,h_m-h_\ell)\). It divides

\[
 b_{ij}(h_m-h_\ell)-b_{\ell m}(h_j-h_i)
 =b_{ij}e_{\ell m}-b_{\ell m}e_{ij}.
\]

Hence \(g\mid T\), so \(g\mid e_{ij}\) and \(g\mid e_{\ell m}\). The base divisibility property now gives \(g\mid e_i\) and \(g\mid e_\ell\). Thus \(h_i\equiv h_\ell\pmod g\), as required. The generalized Chinese remainder theorem gives \(A\), which can be increased by a common multiple of the moduli to make every entry positive. Translation preserves all the distances. Substituting these \(s_i\) in the prime-pair argument proves the claim.

## Lower logarithmic density

Write \(E\) for the excluded maxima. The construction also gives

\[
 \liminf_{Z\to\infty}\frac{1}{\log Z}
 \sum_{\substack{M\le Z\\M\in E}}\frac1M
 \ \ge\ \min\{1,1/\log(k-1)\},
\]

where \(k\) may be taken at least three. To see this, fix \(C>k-1\) and use the corresponding fixed cofactor bound. List the sufficiently large adjacent pairs with those cofactors by their starting positions \(y_j\). The interval theorem, applied at \(y_j+1\), gives \(y_{j+1}\le C(y_j+1)\). For each \(\eta>0\) this implies \(y_{j+1}/y_j\le C+\eta\) eventually.

In each real interval \([\log y_j,\log y_{j+1}]\), the subinterval starting at the left endpoint of length \(\min\{1,\log(y_{j+1}/y_j)\}\) corresponds to excluded integer maxima after rounding. In logarithmic measure this covers a fraction at least \(\min\{1,1/\log(C+\eta)\}\). The same estimate applies to a final truncated interval. For the passage to the harmonic sum use the cells \((\log(M-1),\log M]\) associated with the excluded integers. If the next starting position is at most \(\lfloor ey_j\rfloor\), there is no rounding loss. Otherwise the loss at the right end is \(O(1/y_j)\). These latter \(y_j\)'s grow at least geometrically, since the next such starting position exceeds \(\lfloor ey_j\rfloor\). Their total rounding loss is bounded. Cell lengths differ from \(1/M\) by a summable \(O(1/M^2)\). Divide by \(\log Z\), then let \(\eta\) decrease to zero and \(C\) decrease to \(k-1\).
