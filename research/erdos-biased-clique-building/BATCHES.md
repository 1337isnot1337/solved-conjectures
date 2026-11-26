# Arbitrary biased clique games from a simultaneous potential

**Theorem.** Fix positive integers \(p,q\). In the strict \((p,q)\) clique-building game, Bob has a single deterministic strategy giving both
\[
\omega(R)\le \left(\frac{2p}{\log(q+1)}+o(1)\right)\log n,
\qquad
\omega(B)\ge \left(\frac{1}{\log(1+p/q)}-o(1)\right)\log n.
\]
In particular he wins for all sufficiently large \(n\) whenever
\[
\log(q+1)>2p\log(1+p/q).
\tag{1}
\]
For every \(\varepsilon>0\), (1) holds whenever \(p\) is sufficiently large and \(q\ge (1+\varepsilon)p^2/\log p\). The previous unconditional sufficient order of magnitude in Cambie–Provoost Theorem 14 is \(p^2\). This is not a proof of their sharp \((p,p+1)\) conjecture, nor does the large-order argument answer Erdős’s exact all-orders \((1,2)\) question.

## Full batches

For each monitored edge set \(S\), choose an initial weight \(w_S>0\) and a discount \(0<b_S<1\), and put \(a_S=(1+q(1-b_S))^{1/p}\). The term at any state is \(\Phi_S=w_Sa_S^{r_S}b_S^{u_S}\) where \(r_S,u_S\) count its red and blue edges. Bob sequentially greedily maximizes \(D(e)=\sum_{S\ni e}(1-b_S)\Phi_S\); the potential \(\Phi=\sum_S\Phi_S\) decreases by exactly \(D(e)\) at each blue choice.

Fix an Alice batch \(E\) after a full Bob turn, and measure all terms at the start of that Alice batch. If \(j=|E\cap S|\), convexity on \([0,p]\) gives
\[
a_S^j-1\le\frac{j}{p}(a_S^p-1)=\frac{q}{p}(1-b_S)j.
\]
Thus the Alice batch increases \(\Phi\) by at most \(\frac{q}{p}\sum_{e\in E}D(e)\le q\max_{e\in E}D(e)\), computed before any red edge in that batch is chosen. Every \(e\in E\) was free during each of the preceding \(q\) blue choices. A blue choice never increases another edge's score, so those \(q\) greedy choices decreased \(\Phi\) in total by at least \(q\max_{e\in E}D(e)\). This covers a short final red batch as well. A short Bob turn exhausts the board and cannot be followed by red. The first Alice batch increases \(\Phi\) by a factor at most \(q+1\) because \(a_S^p\le q+1\). Hence \(\Phi_{\rm final}\le(q+1)\Phi_{\rm initial}\).

## Apply the two families

For the red clique family choose \(b_{\rm cl}>0\) small so that \(\log a_{\rm cl}\) is as close as needed to \(\log(q+1)/p\). Monitor every \(k\)-vertex clique edge set with initial weight \(a_{\rm cl}^{-\binom{k}{2}}\), for \(k=\lceil (2p/\log(q+1)+\eta)\log n\rceil\) and fixed \(\eta>0\). The total weight is \(o(1)\), as in the [one-edge proof](README.md). A fully red member would contribute one at the end.

For the red density family fix \(r>p/(p+q)\), take \(b=1-\delta\), and put \(a=(1+q\delta)^{1/p}\). The derivative at \(\delta=0\) of \(\theta=r\log a+(1-r)\log b\) is \(rq/p-(1-r)>0\). So choose constant \(\delta>0\) with \(\theta>0\), and monitor every \(m\)-vertex clique edge set with weight \(\exp(-\theta\binom m2)\) for \(m=\lceil C\log n\rceil\) and \(C>2/\theta\). Again the total weight is \(o(1)\), and any \(m\)-set of red density at least \(r\) would contribute at least one at the end.

For large \(n\) the total weight of both families is less than \(1/(q+1)\), so neither failure occurs. Every subset of at least \(m\) vertices has blue density greater than \(1-r\), by averaging smaller \(m\)-subsets. Greedily select a blue clique, at each step keeping the blue neighbors of a maximum-degree vertex in the current set. This gives \((1/(-\log(1-r))-o(1))\log n\) vertices. Let \(r\downarrow p/(p+q)\) and \(\eta\downarrow0\) to obtain the two bounds with arbitrarily small fixed errors.

Finally the left side of (1) increases in \(q\), and the right side decreases. At \(q=\lceil(1+\varepsilon)p^2/\log p\rceil\), the left side is \((2-o(1))\log p\), while the right side is at most \(2p^2/q\le 2\log p/(1+\varepsilon)\). This proves the stated bias range.

## Priority

The red clique bound alone is the standard Beck bound stated in [Cambie–Provoost, Theorem 14](https://arxiv.org/html/2505.03497v2#S3). Their unconditional sufficient condition is \(q>cp^2\); Theorem 16 is conditional and Conjecture 17 asks for \(q=p+1\). [Malekshahian–Spiro](https://doi.org/10.1002/jgt.70061) give the earlier exponential-bias sufficient condition. The claim here is the simultaneous deterministic control and its enlarged range, not a new red-only bound or a resolution of those conjectures. Searches by exact titles, author follow-ups, bias inequalities, and the [working report](https://www.erdosproblemaday.com/report/778) did not identify this simultaneous bound. Coordination: [#893](https://github.com/1337isnot1337/solved-conjectures/issues/893).
