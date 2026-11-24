# Manickam–Miklós–Singhi: adjoining opposite pairs to a one-positive core

Tracking issue: [#322](https://github.com/1337isnot1337/solved-conjectures/issues/322).

**Status (2026-11-24):** Proven structural special case; no general solution, priority claim, or outside verification. This is not a fixed-\(k\) computation.

**Theorem.** Let \(x\) be a list obtained by adjoining \(P\) labelled opposite pairs \((u_i,-u_i)\) to a zero-sum core \(y=(A,-b_1,\ldots,-b_{m-1})\), where \(b_i\ge0\) and \(A=\sum_i b_i\). Put \(n=m+2P\). If \(1\le k\le n/4\), at least \(\binom{n-1}{k-1}\) of the \(k\)-subsets of labelled coordinates of \(x\) have nonnegative sum. When \(m\) is even, the same conclusion holds for the larger range \(k\le n/2\). It also holds regardless of parity whenever \(k\le(m+1)/2\). In particular, a zero-sum list with exactly one positive entry left after cancelling any opposite pairs satisfies the MMS bound. The magnitudes of the pair weights are unrestricted.

For example, take \(x=(5,-1,-2,-2,100,-100,99,-99,1,-1,0,0,2,-2)\) and \(k=3\). This falls outside the divisible case, and the subset with weights \(100,-100,-99\) is negative despite including the globally largest coordinate. The theorem does not require that all subsets through that coordinate be nonnegative.

## Proof

Choose a uniform \(k\)-subset. Condition on the labelled set \(H\) of pairs from which exactly one coordinate is picked, and write \(h=|H|\). Single-pair orientations are independent fair choices, independently of the core subset and of which nonsingle pairs are taken twice. Thus the weight from these pairs is a symmetric random variable \(Z\) whose conditional law depends on \(H\) but not on the core size \(s\). The remaining pair contributions are zero.

For fixed \(H\), the number of possible subsets of core size \(s\), after omitting the common factor \(2^h\), is
\[
W_s=\binom ms\binom{P-h}{(k-h-s)/2},
\]
using zero when the second lower index is nonintegral or outside its range. For every \(0\le s\le m\), define \(F_s=\mathbb P(Z+Y_s\ge0)\), where \(Y_s\) is the sum of an independent uniformly random \(s\)-subset of the core. This definition includes sizes whose weight \(W_s\) is zero.

**Core margin domination.** For \(1\le s\le m/2\), conditional on including the distinguished entry \(A\), the core sum has law \(C=A-\sum_{i\in I} b_i\) for a uniform \((s-1)\)-subset \(I\) of the \(m-1\) remaining indices; conditional on omitting \(A\), the core sum is \(-D=-\sum_{i\in J} b_i\) for a uniform \(s\)-subset \(J\). Couple these marginal laws using disjoint \(I,J\), by taking consecutive blocks of a uniform permutation. This is possible because \(2s-1\le m-1\). The coupling gives \(C\ge D\ge0\). For \(p=s/m\), symmetry and independence of \(Z\) give
\[
\begin{aligned}
F_s
 &=p\bigl(1-\mathbb P(Z>C)\bigr)+(1-p)\mathbb P(Z\ge D)\\
 &\ge p+(1-2p)\mathbb P(Z\ge D)\ge p.
\end{aligned}
\]
The strict \(>\) and weak \(\ge\) handle all ties. Also \(F_0\ge0\).

**Reflection.** Since the core sum is zero, complementation gives \(Y_{m-s}\stackrel{d}=-Y_s\), whence \(F_s+F_{m-s}\ge1\). At a midpoint \(s=m/2\), \(F_s\ge1/2\).

Now suppose \(m\) is even. For \(s<m/2\), \((k-h-s)/2=d\) and \((k-h-m+s)/2=d'\) have the same integrality status. When integral, \(d\ge d'\) and \(d+d'=k-h-m/2\le P-h\). It follows that \(\binom{P-h}{d}\ge\binom{P-h}{d'}\): if \(d'\) is in range, then \(d\) lies between \(d'\) and its reflection \(P-h-d'\), so the inequality follows by symmetry and unimodality; otherwise the right side is zero. Therefore \(W_s\ge W_{m-s}\). Put \(D_s=F_s-s/m\). For \(s<m/2\), we have \(D_s\ge0\) and \(D_{m-s}\ge-D_s\); hence
\[
 W_sD_s+W_{m-s}D_{m-s}
 \ge (W_s-W_{m-s})D_s\ge0.
\]
At \(s=m/2\) the contribution is nonnegative also. Thus \(\mathbb P(\text{nonnegative}\mid H)\ge\mathbb E[s/m\mid H]\). Averaging over \(H\) yields the result because \(\mathbb E[s/m]=k/n\).

### Odd core when \(n\ge4k\)

For fixed \(H\), let \(B_j\) be the weight sum of a uniform \(j\)-subset of the \(m-1\) magnitudes \(b_i\). The conditional gate-in margin \(A-\sum_{i\in I}b_i\) has the distribution \(B_{m-s}\) by complementing \(I\), giving
\[
 D_s=(1-s/m)\mathbb P(Z\ge B_s)-(s/m)\mathbb P(Z>B_{m-s}).
\]
At \(s=0,m\), omit the undefined term multiplying zero. The \(B_j\) increase stochastically in \(j\), as seen by taking the first \(j\) entries of a uniform permutation. Therefore \(D_s\) is nonincreasing in \(s\), including the endpoints: the first, nonnegative term is nonincreasing, while the subtracted, nonnegative term is nondecreasing.

If \(m=1\), the core weight is zero, so the entire list is invariant under negation and the probability is at least \(1/2\). Otherwise write \(m=2r+1\), \(r\ge1\). For each \(s=r+j\) with \(1\le j\le r\), use the lower size \(s'=r-j=m-s-1\), of the same parity, as its distinct partner. Reflection and monotonicity imply \(D_{s'}\ge D_{m-s}\ge-D_s\), with \(D_{s'}\ge0\).

We claim \(W_{s'}\ge W_s\). It suffices to prove this when \(W_s>0\). Write \(M=P-h\), \(d=(k-h-s)/2\) and \(d'=(k-h-s')/2=d+j\). Since \(k\ge s\ge r+1\) and \(n\) is odd, \(n\ge4k+1\) implies \(P\ge2k-r\ge k+1\). Thus \(2d'\le k-h<M\), and every one of the \(j\) successive binomial ratios in \(\binom{M}{d'}/\binom{M}{d}\) is at least
\[
 \frac{M-d'+1}{d'}=\frac{2P-h-k+s'+2}{k-h-s'}
 \ge \frac{3k-h-s+2}{k-h-s'}\ge2.
\]
The core factor we must pay is
\[
 \frac{\binom m s}{\binom m {s'}}=\frac{s+1}{m-s}
 =\frac{r+j+1}{r+1-j}.
\]
For \(j\ge3\) this is at most \(2j+1\le2^j\). For \(j=1,r\ge2\) it is at most \(2\); for \(j=2,r\ge3\) it is at most \(3\le4\). The exceptional \(r=j=1\) has ratio \(3\), and the lower bound on an increment becomes \((3k-h)/(k-h)\ge3\). The exceptional \(r=j=2\) has ratio \(5\), and each increment is at least \((3k-h-2)/(k-h)\ge5/2\) because \(k\ge s=4\). These cases prove the claim.

Pairing \(s'\) with \(s\) therefore gives
\[
 W_{s'} D_{s'}+W_s D_s\ge (W_{s'}-W_s)D_{s'}\ge0.
\]
The lower size \(r\) is unused and contributes nonnegatively. The top size \(m\) is also unused and may have \(D_m<0\), so it requires a separate payment. Retain the surplus for the pairing \((s',s)=(0,m-1)\). For each \(H\), \(D_0=\mathbb P(Z\ge0)\ge1/2\), \(D_m\ge-1/2\), and \(W_0-W_{m-1}\ge0\). Thus the sum of all conditional **unnormalized** deficits, reinserting the factor \(2^h\), is at least
\[
 \frac12\sum_H 2^{|H|}(W_0-W_{m-1}-W_m).
\]
If \(m>k\), all \(W_m=0\). Otherwise put \(L=2P=n-m\ge3k\). Summing over \(H\) gives the total numbers of samples with each core size, \(\sum_H2^{|H|}W_s=\binom m s\binom L{k-s}\). For \(j\ge1\) and \(k-j\ge0\),
\[
 \frac{\binom L{k-j}}{\binom L k}
 \le \left(\frac{k}{L-k+1}\right)^j\le 2^{-j}.
\]
Consequently the ratio of the combined \(m-1\) and \(m\) layers to the \(0\) layer is at most \(m/2^{m-1}+1/2^m\le7/8\) for \(m\ge3\). This proves the remaining payment, so the total number of nonnegative samples is again at least the number expected by the baseline \(s/m\), namely \(\binom{n-1}{k-1}\).

### Additional parity-free short-sample range

For arbitrary parity with \(k\le(m+1)/2\), either \(s\le m/2\) or \(m\) is odd with \(s=k=(m+1)/2\). In the latter case all selected entries are from the core, so \(Z=0\). Every core subset containing the distinguished entry then has nonnegative sum, giving \(F_s\ge s/m\) directly. Average as above.

The bound is sharp over this class: for \(P=0\), \(m\) even and \(b_i=1\), precisely the star through \(A\) is nonnegative for every \(k\le m/2\).

## Scope and audit

- The MMS conjecture asserts this bound for **every** real nonnegative-total list when \(n\ge4k\). This argument permits arbitrary opposite pairs and arbitrarily unequal core magnitudes, but does not prove all weight vectors are reducible to this form. For example, the zero-sum list \((3,2,-4,-1)\) has no opposite pair to remove and has two positive coordinates. For odd cores above the MMS range (\(k>n/4\) and \(k>(m+1)/2\)), the binomial payment is not asserted. Exact zero-sum is a hypothesis of this special case, and recentering an arbitrary nonnegative-total list need not preserve its opposite pairs.
- [Pokrovskiy's primary paper](https://arxiv.org/abs/1308.2176) establishes an all-weights linear threshold with a very large constant. [Džavoronok, May 2026, Conjecture 1.1](https://arxiv.org/html/2605.22708v1) still states the full problem and treats Baranyai's divisible case as known. The result here therefore illustrates a structural method but does not supersede the general bounds.
- [Blinovsky's journal paper](https://www.mathnet.ru/php/archive.phtml?jrnid=ppi&option_lang=eng&paperid=2152&wshow=paper) claims the related Ahlswede–Khachatrian conjecture up to finite cases, as does [arXiv:1510.01144](https://arxiv.org/abs/1510.01144). The present note neither certifies nor refutes those claims. [An anonymous November 2026 research release](https://doi.org/10.5281/zenodo.24241302) claims MMS for all two-valued lists for \(n\ge4k\), a different restricted family. The primary papers and targeted searches for “opposite pairs”, “symmetric noise” and “star” did not identify this exact opposite-pair theorem; priority remains unverified.
