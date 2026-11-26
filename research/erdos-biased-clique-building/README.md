# Erdős’s biased clique-building conjecture

**Status: partial.** In the strict \(1:2\) game Bob wins on \(K_n\) for all sufficiently large \(n\). The original assertion asks for every \(n\ge4\), and the argument does not decide the remaining orders. More generally, the argument works for every fixed \(1:q\) bias with \(q\ge2\).

For arbitrary fixed batch sizes, [the batch proof](BATCHES.md) gives an explicit strict-win criterion and a subquadratic sufficient bias.

## Rules and statement

Alice starts. She claims one edge on each of her turns. Bob claims \(q\) unclaimed edges on each of his turns, taking all remaining edges if fewer than \(q\) are left. Bob wins if his final graph has a strictly larger clique than Alice's. This is the strict biased clause of [Erdős #778](https://www.erdosproblems.com/778), posed in [Guy's 1983 list of Erdős problems](https://doi.org/10.1080/00029890.1983.11971168). The equal-bias clique and degree clauses are separate.

For fixed \(q\ge2\), Bob can simultaneously ensure, in terms of natural logarithms,
\[
\omega(R)\le\left(\frac{2}{\log(q+1)}+o(1)\right)\log n,\qquad
\omega(B)\ge\left(\frac{1}{\log(1+1/q)}-o(1)\right)\log n.
\tag{1}
\]
For \(q=2\), the leading coefficients are about \(1.8205\) and \(2.4663\), respectively. The blue coefficient is larger whenever \(q\ge2\), since \(q^2>q+1\).

## A simultaneous potential strategy

On a finite board, choose a weighted family of monitored edge sets \(S\). Repeated sets with different parameters are allowed. Choose \(w_S>0\), \(0<b_S<1\), and \(a_S=1+q(1-b_S)\). With \(r_S\) and \(u_S\) denoting the numbers of red and blue edges in \(S\), set
\[
\Phi_S=w_Sa_S^{r_S}b_S^{u_S},\quad
\Phi=\sum_S\Phi_S,\quad
D(e)=\sum_{S\ni e}(1-b_S)\Phi_S.
\]
Bob chooses an unclaimed edge maximizing \(D(e)\) on each of his \(q\) attempts, recomputing after each claim. A blue claim at \(e\) decreases the potential by exactly \(D(e)\). It also decreases or leaves unchanged the value of \(D\) on every other unclaimed edge.

Ignore the initial red move until measuring its effect on \(\Phi\): it multiplies the potential by at most \(q+1\). Group subsequent moves into a full Bob turn followed by the next Alice move, if any. If Alice selects \(e\) after Bob's turn, then at every blue selection the chosen edge had score at least the subsequent score of \(e\). Thus the total blue decrease is at least \(q\) times the score of \(e\) just before Alice's move. The red increase is exactly \(qD(e)\) by the defining relation between \(a_S\) and \(b_S\). Each such round does not increase \(\Phi\). A last Bob turn with no Alice move only decreases it, even if that blue turn is short.

Therefore it is enough to arrange \(\sum_S w_S<1/(q+1)\). Then \(\Phi<1\) at the end, and no monitored set may have \(\Phi_S\ge1\). Importantly, this is **one** strategy for both families below, not a split of Bob's move budget.

## Red clique upper bound

Fix \(\eta>0\), put \(k=\lceil(2/\log(q+1)+\eta)\log n\rceil\), and monitor the edge set of every \(k\)-vertex subset. Choose a constant \(b_{\rm cl}>0\) sufficiently small that \((2/\log(q+1)+\eta)\log a_{\rm cl}>2\), where \(a_{\rm cl}=1+q(1-b_{\rm cl})\). A red \(K_k\) gives potential one for its monitored edge set if the initial weight is \(a_{\rm cl}^{-\binom{k}{2}}\). The total initial weight of this family is
\[
\binom nk a_{\rm cl}^{-\binom{k}{2}}
\le \exp(k\log n-\tbinom{k}{2}\log a_{\rm cl})=o(1).
\tag{2}
\]

## Red density upper bound on every logarithmic-size subset

Fix \(p\) with \(1/(q+1)<p<1\). Let \(b_{\rm den}=1-\delta\), \(a_{\rm den}=1+q\delta\) for a sufficiently small constant \(\delta>0\). Then
\[
\theta=p\log(1+q\delta)+(1-p)\log(1-\delta)>0,
\]
since its derivative at \(\delta=0\) is \((q+1)p-1>0\). Monitor the edge set of every \(m\)-vertex subset, where \(m=\lceil C\log n\rceil\) and \(C>2/\theta\). Give each set weight \(e^{-\theta\binom m2}\). At the end every edge is red or blue, so if an \(m\)-vertex subset has red density at least \(p\) then its potential is at least one. The total start weight is at most
\[
\exp(m\log n-\theta\tbinom m2)=o(1).
\tag{3}
\]
Equations (2) and (3) make the required total start weight less than \(1/(q+1)\) for sufficiently large \(n\). Thus all \(m\)-vertex subsets have red density less than \(p\). Every vertex subset of size at least \(m\) also has red density less than \(p\), since that density is the mean density of its \(m\)-vertex subsets.

## Blue clique lower bound and strict win

Start with all \(n\) vertices as candidates for a blue clique. If a candidate set has \(N\ge m\) vertices, its blue edge density exceeds \(s=1-p\). Some vertex has blue degree at least \(s(N-1)\) in the set; add it to the clique and keep its blue neighbors as candidates. Put \(L=s/(1-s)\). After \(j\) iterations, as long as the preceding sets were large enough, the candidate count \(N_j\) has
\[
N_j+L\ge s^j(n+L).
\]
Therefore this gives \(\log(n/m)/(-\log s)-O_p(1)\) blue clique vertices. For each \(p>1/(q+1)\) the coefficient of \(\log n\) can be made arbitrarily near \(1/(-\log(1-p))\), since \(m=O(\log n)\). Letting \(p\) approach \(1/(q+1)\) from above and \(\eta\) approach zero proves the simultaneous asymptotic estimates (1): for any prescribed errors choose the two constant parameters first and then take \(n\) sufficiently large. This proves Bob's strict win for each fixed \(q\ge2\).

## Source and priority

[Malekshahian–Spiro, Theorem 3 and Conjecture 1](https://doi.org/10.1002/jgt.70061) prove a larger-bias sufficient condition, including eventual \(1:4\), and ask about every strictly larger bias. [Cambie–Provoost, Theorem 8](https://arxiv.org/html/2505.03497v2) prove \(1:3\) for every \(n\ge4\); they state the \(1:2\) question explicitly, and their Conjecture 17 asks for eventual wins at bias \((p,p+1)\). Their use of a balancing strategy controls vertex degrees for the other games, not edge densities on logarithmic-size subsets in the clique game. The multiplicative potential above is in the tradition of Beck's balancing and Erdős–Selfridge methods; the claimed advance is the joint choice of test families and their consequence at bias \(1:2\), not the general potential method.

The [July 2026 working report](https://www.erdosproblemaday.com/report/778) gives finite results up to order seven and identifies the missing uniform argument. The [November finite-strategy release](https://kairossignal.com/proofs/erdos778/) covers orders eight and nine and does not claim an asymptotic result. Searches with the exact game name, bias, authors, article titles, and balancing terminology did not identify an earlier proof at bias \(1:2\) for all sufficiently large orders. As always this is a bounded priority search. Coordination: [#893](https://github.com/1337isnot1337/solved-conjectures/issues/893).
