# Stationary rectangles for disjoint-type guessing

Follow-up to [Question 6.1 and its solution](https://github.com/1337isnot1337/solved-conjectures/pull/1062). The proof below strengthens the positive half from ordinary guessing to **strong** guessing, in fact to stationary rectangles of matching ladder prefixes. It uses neither forcing nor a club-guessing hypothesis.

## The theorem

There is a single ladder sequence \(\vec C\) on \(\omega_1\) with the following property. Let \((t_k:k<\omega)\) be any family of disjoint types with both depths and lower interleaving reaches bounded, and let \(f:\lim(\omega_1)\to\omega\). There are a color \(k\) and stationary sets \(A,B\subseteq f^{-1}(k)\) such that, with \(n=\operatorname{width}(t_k)\), for every \(\alpha\in A\) and \(\beta\in B\) the prefixes \(C_\alpha[n]\) and \(C_\beta[n]\) are disjoint and realize the normalized type \(t_k\), with the first prefix in the lower (0) role.

In particular \(B\cap\operatorname{acc}(A)\) is stationary, and every \(\beta\) in this set has unboundedly many matching \(\alpha<\beta\). Thus the published two-parameter criterion also characterizes **strong** disjoint-type guessing under \(\mathsf{PFA}(\omega_1)\), including over its countable forcing extensions by the separate preservation appendix. The already proved negative implication for ordinary guessing applies to strong guessing verbatim.

## Proof

Choose \(\vec C\) so that each finite increasing ordinal tuple is an initial segment of \(C_\beta\) for stationarily many \(\beta\). This is the standard starting construction from [Lambie-Hanson–Uhrik, Theorem 2.7](https://doi.org/10.1112/mtk.12261): partition the countable limit ordinals into \(\omega_1\) disjoint stationary sets, one for each finite tuple, and prescribe that tuple above its maximum on the corresponding stationary set.

Choose \(L>\sup_k\max\{d_k,r_k\}\). In a sufficiently large \(H(\theta)\) take an elementary chain of \(L\) countable models \(M_0,\ldots,M_{L-1}\) with strictly increasing heights \(\delta_j=M_j\cap\omega_1\), with all parameters \(\vec C,\vec t,f\), and with earlier heights in later models. All club and stationarity assertions on \(\omega_1\) below are correct in \(H(\theta)\). The set of \(\beta\) with prefix \((\delta_0,\ldots,\delta_{L-1})\) is stationary, so for some \(k\) its restriction to \(f^{-1}(k)\) is stationary. Call this restriction \(B\).

Let \(d=d_k\), \(r=r_k\), and \(n=\operatorname{width}(t_k)\). Normalize to end in 1. If \(d>0\), the word has the form \(\sigma 0^{n-r}1^{n-d}\), where \(\sigma\) ends at the last 1 before the last 0 and has \(r\) zeros and \(d\) ones. If \(d=r=0\), interpret this as \(0^n1^n\).

For an increasing tuple \(u\) of length \(r+1\), let \(P_{r+1}(u)\) assert that
\[
\{\alpha:f(\alpha)=k,\ C_\alpha[r+1]=u\}
\]
is stationary. Recursively define \(P_j(u)\), for \(j\le r\) and \(u\) of length \(j\), by requiring unboundedly many ordinals \(\xi\) with \(P_{j+1}(u^\frown\xi)\). By the choice of \(B\), \(P_{r+1}(\delta_0,\dots,\delta_r)\) holds. Downward induction gives \(P_0(\varnothing)\): if \(P_{j+1}(\delta_0,\dots,\delta_j)\) holds, then for each bound \(\eta<\delta_j\), the ordinal \(\delta_j\) witnesses the existence of an appropriate \(\xi>\eta\) in \(H(\theta)\). All parameters of that existential statement, other than the witness, are in \(M_j\). Elementarity gives a witness inside \(M_j\) for each \(\eta<\delta_j\), so \(M_j\) sees unboundedly many witnesses in its \(\omega_1\), and a second use of elementarity gives \(P_j(\delta_0,\dots,\delta_{j-1})\) in \(H(\theta)\).

We now select \(r+1\) lower-side points \(\gamma_0<\dots<\gamma_r\). For each \(i<r\) let \(s_i\) be the number of 1s preceding the \(i\)-th 0 in \(\sigma\) (indexing zeros from zero). Choose \(\gamma_i\) in the gap \((\delta_{s_i-1},\delta_{s_i})\), interpreting the lower bound as absent when \(s_i=0\), and maintain \(P_{i+1}(\gamma_0,\dots,\gamma_i)\). At this step the earlier points are in \(M_{s_i}\), since the \(s_i\) are nondecreasing. The unbounded-witness statement holds in that model, so it gives a point above the lower gap endpoint and all earlier points, and below \(\delta_{s_i}\). Next choose \(\gamma_r\) in \(M_d\), above \(\delta_{d-1}\) if \(d>0\) and above the earlier points, with \(P_{r+1}(\gamma_0,\dots,\gamma_r)\). This is the first zero after the last internal 1. The case \(r=d=0\) simply makes this one choice in \(M_0\).

The key difference from proving only ordinary guessing is that the resulting set of \(\alpha\) of color \(k\) with this \((r+1)\)-prefix is **stationary**, not just unbounded. On that set each remaining ladder coordinate before \(n\) is regressive. Applying Fodor's lemma finitely many times yields a fixed increasing completion \(\gamma_{r+1},\dots,\gamma_{n-1}\) on a stationary subset. The existence of such a finite completion is an assertion with parameters in \(M_d\). By elementarity one can choose all its entries in \(M_d\), so they are all below \(\delta_d\). If \(n=r+1\) there is no completion step. Let \(A\) be the stationary set defined by this full lower prefix and color \(k\).

For every \(\beta\in B\), its first \(d+1\) ladder points are \(\delta_0,\dots,\delta_d\). The first \(r\) lower-side points lie in their prescribed gaps. Every other lower-side point lies after the last internal 1 and before \(\delta_d\), where the terminal upper-only run begins. Thus the merged word is \(t_k\) exactly for all \(\alpha\in A,\beta\in B\). Since \(\operatorname{acc}(A)\) is club, the stated strong guessing follows.

## Scope

The lower prefix is fixed on \(A\). This does not prove the extra tail-coordinate requirement in the stronger variant in the published bounded-width theorem (that \(C_\alpha(n)\) can be made arbitrarily high below \(\beta\)). Nor does it provide surviving guesses for unbounded depth or reach, so it does not remove the odd-girth obstruction for the slow-growth graph application.

The original paper's Theorem 2.7 gives strong guessing for bounded width, and Theorem 2.8 gives strong guessing for all type sequences from club guessing. The stationary-prefix/Fodor argument above applies without club guessing, even at unbounded width when both interleaving bounds hold. It uses the same source ladder construction, with the new stationary quantifier and finite completion argument distinguished explicitly.
