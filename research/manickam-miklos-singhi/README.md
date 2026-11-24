# Manickam–Miklós–Singhi: adjoining opposite pairs to a one-positive core

Tracking issue: [#322](https://github.com/1337isnot1337/solved-conjectures/issues/322).

**Status (2026-11-24):** Proven structural special case; no general solution, priority claim, or outside verification. This is not a fixed-\(k\) computation.

**Theorem.** Let \(x\) be a list obtained by adjoining \(P\) labelled opposite pairs \((u_i,-u_i)\) to a zero-sum core \(y=(A,-b_1,\ldots,-b_{m-1})\), where \(b_i\ge0\) and \(A=\sum_i b_i\). Put \(n=m+2P\). If \(1\le k\le n/3\), at least \(\binom{n-1}{k-1}\) of the \(k\)-subsets of labelled coordinates of \(x\) have nonnegative sum. When \(m\) is even, the same conclusion holds for the larger range \(k\le n/2\). It also holds regardless of parity whenever \(k\le(m+1)/2\). In particular, a zero-sum list with exactly one positive entry left after cancelling any opposite pairs satisfies the MMS bound. The magnitudes of the pair weights are unrestricted.

For example, take \(x=(5,-1,-2,-2,100,-100,99,-99,1,-1,0,0,2,-2)\) and \(k=3\). This falls outside the divisible case, and the subset with weights \(100,-100,-99\) is negative despite including the globally largest coordinate. The theorem does not require that all subsets through that coordinate be nonnegative.

## Proof

Choose a uniform \(k\)-subset. Condition on the labelled set \(H\) of pairs from which exactly one coordinate is picked, and write \(h=|H|\). Single-pair orientations are independent fair choices, independently of the core subset and of which nonsingle pairs are taken twice. Thus the weight from these pairs is a symmetric random variable \(Z\) whose conditional law depends on \(H\) but not on the core size \(s\). The remaining pair contributions are zero.

For fixed \(H\), the number of possible subsets of core size \(s\), after omitting the common factor \(2^h\), is
\[
W_s=\binom ms\binom{P-h}{(k-h-s)/2},
\]
using zero when the second lower index is nonintegral or outside its range. For every \(0\le s\le m\), define \(F_s=\mathbb P(Z+Y_s\ge0)\), where \(Y_s\) is the sum of an independent uniformly random \(s\)-subset of the core. This definition includes sizes whose weight \(W_s\) is zero. Set \(D_s=F_s-s/m\).

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

Now suppose \(m\) is even. For \(s<m/2\), \((k-h-s)/2=d\) and \((k-h-m+s)/2=d'\) have the same integrality status. When integral, \(d\ge d'\) and \(d+d'=k-h-m/2\le P-h\). It follows that \(\binom{P-h}{d}\ge\binom{P-h}{d'}\): if \(d'\) is in range, then \(d\) lies between \(d'\) and its reflection \(P-h-d'\), so the inequality follows by symmetry and unimodality; otherwise the right side is zero. Therefore \(W_s\ge W_{m-s}\). For \(s<m/2\), we have \(D_s\ge0\) and \(D_{m-s}\ge-D_s\); hence
\[
 W_sD_s+W_{m-s}D_{m-s}
 \ge (W_s-W_{m-s})D_s\ge0.
\]
At \(s=m/2\) the contribution is nonnegative also. Thus \(\mathbb P(\text{nonnegative}\mid H)\ge\mathbb E[s/m\mid H]\). Averaging over \(H\) yields the result because \(\mathbb E[s/m]=k/n\).

### Odd cores when \(n\ge3k\)

For fixed \(H\), let \(B_j\) be the weight sum of a uniform \(j\)-subset of the \(m-1\) magnitudes \(b_i\). The conditional gate-in margin \(A-\sum_{i\in I}b_i\) has the distribution \(B_{m-s}\) by complementing \(I\), giving
\[
 D_s=(1-s/m)\mathbb P(Z\ge B_s)-(s/m)\mathbb P(Z>B_{m-s}).
\]
At \(s=0,m\), omit the undefined term multiplying zero. The \(B_j\) increase stochastically in \(j\), as seen by taking the first \(j\) entries of a uniform permutation. Therefore \(D_s\) is nonincreasing in \(s\), including the endpoints: the first, nonnegative term is nonincreasing, while the subtracted, nonnegative term is nondecreasing.

If \(m=1\), the core weight is zero, so the entire list is invariant under negation and the probability is at least \(1/2\). Otherwise write \(m=2r+1\), \(r\ge1\), and let \(L=n-m\) be the number of coordinates outside the core. For each \(s=r+j\) with \(1\le j\le r\), use the lower size \(s'=r-j=m-s-1\), of the same parity, as its distinct partner. Reflection and monotonicity imply \(D_{s'}\ge D_{m-s}\ge-D_s\), with \(D_{s'}\ge0\).

#### Odd cores of size at least seven

We claim \(W_{s'}\ge W_s\). To see this, assume \(W_s>0\), so \(k-h\ge s\). Write \(M=P-h\), \(d=(k-h-s)/2\) and \(d'=(k-h-s')/2=d+j\). Then \(d'\le M\), because
\[
 2M-2d'=n-k-s-h-1\ge k-1\ge0.
\]
For \(1\le i\le j\), bound each of the successive ratios by
\[
 \frac{M-d-i+1}{d+i}
 \ge \frac{2k-h-r+j-2i+1}{k-h-r-j+2i}
 \ge \frac{2k-2i+1}{k-2j+2i}.
\]
Indeed the numerator minus denominator in the middle is \(k+2j-4i+1\ge k-2j+1>0\). Replacing \(r\) by \(j\) and \(h\) by zero adds the same nonnegative value to numerator and denominator, decreasing the ratio.

The core binomial ratio to overcome is
\(\binom ms/\binom m {s'}=(s+1)/(m-s)=(r+j+1)/(r+1-j)\), by \(s'=m-s-1\). If \(j=1\), the last lower bound is \((2k-1)/k\ge7/4\) because \(k\ge r+1\ge4\), whereas the core factor is \((r+2)/r\le5/3\). If \(j\ge2\), put \(w=k-2j\ge0\). The product of the last lower bounds is
\[
 2^j\prod_{i=1}^j\frac{w+j+i-\tfrac12}{w+2i},
\]
where the numerators have been reversed. For \(i\le j-2\) each factor in the product is at least one. The last two numerators minus their denominator product give
\((w+2j-\tfrac32)(w+2j-\tfrac12)-(w+2j-2)(w+2j)=3/4\).
Therefore the product is at least \(2^j\), which pays the core factor: when \(j=2\) and \(r\ge3\), this factor is at most \(3\le4\); for \(j\ge3\) it is at most \(2j+1\le 2^j\). This proves \(W_{s'}\ge W_s\). Consequently the two layers have joint conditional excess at least \((W_{s'}-W_s)D_{s'}\ge0\). The unused lower layer \(r\) has \(D_r\ge0\). If \(m>k\), the unused top layer \(m\) cannot contribute, and the proof is complete. If \(m\le k\) so that the top layer can contribute, \(L\ge2k\). Each factor in
\[
 \binom L{k-j}/\binom L k=\prod_{i=0}^{j-1}\frac{k-i}{L-k+i+1}
\]
is at most one; if \(i\ge r=(m-1)/2\) it is at most \(1/2\), since \(L-k+i+1\ge 2k-m+i+1\ge2(k-i)\). Hence the combined \(m-1,m\) layers are at most a fraction \(m/2^r+1/2^{r+1}\le15/16\) of the zero layer for \(r\ge3\). To see why this pays the unused top layer, retain the surplus in the pair \((0,m-1)\). For every \(H\), \(D_0\ge1/2\), \(D_m\ge-1/2\), and \(W_0-W_{m-1}\ge0\). Hence the total unnormalized excess, reinserting the factors \(2^h\), is at least
\[
 \frac12 \sum_H 2^{|H|}(W_0-W_{m-1}-W_m)
 =\frac12\left[\binom Lk-m\binom L{k-m+1}-\binom L{k-m}\right]\ge0.
\]
The equality counts samples by their core size. The final inequality is the layer fraction bound just proved.

#### Odd cores of size three or five

For any size \(s\), a sample containing the distinguished entry has nonnegative core sum, and symmetry of \(Z\) gives conditional chance at least \(1/2\) that the total is nonnegative. Therefore \(D_s\ge-s/(2m)\). Also \(D_0\ge1/2\). These bounds still hold after summing over all \(H\).

If \(m=3\), there is nothing new to show for \(k\le2\) by the short-sample argument below. For \(k\ge3\), pay both high layers \(s=2,3\) with the \(s=0\) layer. By the last bounds it is enough that
\[
 2\binom L{k-2}+\binom L{k-3}\le\binom Lk.
\]
As \(L\ge3k-3\), the first ratio \(\binom L{k-2}/\binom Lk\) is at most \(k(k-1)/[(2k-2)(2k-1)]\le3/10\); the third decrement has ratio at most \(1/2\). The left side is at most \(3/4\) of the right side.

If \(m=5\), there is nothing new for \(k\le3\). Use the conditional pairing of \(s=3\) and \(s'=1\). The ratio of the core binomials is \(2\), and for \(W_3>0\) the single outer binomial ratio is at least \((2k-h-2)/(k-h-1)\ge2\) by \(n\ge3k\), so this pair is already paid. The remaining high layers \(s=4,5\) are paid by \(s=0\) as soon as
\[
 4\binom L{k-4}+\binom L{k-5}\le\binom Lk.
\]
For \(k=4\), \(L\ge8\), and the inequality is immediate. For \(k\ge5\), \(L\ge3k-5\ge2k\); in the product of successive ratios the first factor is at most \(k/(2k-4)\le5/6\) and all factors are at most one, with factors \(i\ge2\) at most \(1/2\) by the same calculation as above. The combined left side is at most \((5/6)(4/4+1/8)=15/16\) of the right side.

In all odd cases the resulting total nonnegative probability is at least the baseline expectation \(\mathbb E[s/m]=k/n\).

### Additional parity-free short-sample range

For arbitrary parity with \(k\le(m+1)/2\), either \(s\le m/2\) or \(m\) is odd with \(s=k=(m+1)/2\). In the latter case all selected entries are from the core, so \(Z=0\). Every core subset containing the distinguished entry then has nonnegative sum, giving \(F_s\ge s/m\) directly. Average as above.

The bound is sharp over this class: for \(P=0\), \(m\) even and \(b_i=1\), precisely the star through \(A\) is nonnegative for every \(k\le m/2\).


## The odd-core bound cannot cover the entire even-core range

For any integer \(t\ge1\), use the core \((4,-2,-2)\) with \(2t\) copies of \((3,-3)\), and let \(n=4t+3\), \(k=2t+1\). This is outside the MMS range. Write \(a=\binom{2t}t\), \(b=\binom{2t}{t-1}\). The number of nonnegative \(k\)-sums is
\[
 \frac{\binom{4t+3}{2t+1}-a^2-2ab+b^2}{2}.
\]
To count, split by the selected core size \(s=0,1,2,3\). The outer sum is \(3q\), where \(q\) is the difference of the counts of \(3\)'s and \(-3\)'s. Negation swaps the signs of \(q\), whose parity agrees with \(k-s\). Relative to one half of the total count in each layer, the four corrections are:
- \(s=0\): the odd outer count has no tie, so correction \(0\).
- \(s=1\): even \(q\), with \(a^2\) samples having \(q=0\). At those samples only the core entry \(4\) works, out of three core choices. Away from \(q=0\) the opposite signs of \(q\) exactly balance. Correction \(-a^2/2\).
- \(s=2\): odd \(q\). The core sum is \(2\) for two choices or \(-4\) for one. Only that last choice loses the ordinarily positive \(q=1\) samples; no negative \(q\) samples become nonnegative. There are \(ab\) outer samples with \(q=1\). Correction \(-ab\).
- \(s=3\): even \(q\), with \(b^2\) zero samples, giving correction \(b^2/2\).

The star count is \(\bigl(\binom{4t+3}{2t+1}-\binom{4t+3}{2t+1}/(4t+3)\bigr)/2\). To compare, put \(R_t=\binom{4t+3}{2t+1}/[(4t+3)a^2]\). Then \(R_1=5/4\), and
\[
 1-\frac{R_{t+1}}{R_t}
 =\frac{8t^3+13t^2-3}{2(t+2)(2t+1)^2(2t+3)}>0.
\]
Since \(b/a=t/(t+1)\ge1/2\), we have \(1+2b/a-(b/a)^2\ge7/4>R_t\). Thus the list has fewer nonnegative sets than the star. The first example has \(14\) nonnegative \(3\)-subsets instead of \(15\).

## Scope and audit

- The MMS conjecture asserts this bound for **every** real nonnegative-total list when \(n\ge4k\). This argument permits arbitrary opposite pairs and arbitrarily unequal core magnitudes, but does not prove all weight vectors are reducible to this form. For example, the zero-sum list \((3,2,-4,-1)\) has no opposite pair to remove and has two positive coordinates. For odd cores outside the ranges stated in the theorem, the binomial payment is not asserted. Exact zero-sum is a hypothesis of this special case, and recentering an arbitrary nonnegative-total list need not preserve its opposite pairs.
- [Pokrovskiy's primary paper](https://arxiv.org/abs/1308.2176) establishes an all-weights linear threshold with a very large constant. [Džavoronok, May 2026, Conjecture 1.1](https://arxiv.org/html/2605.22708v1) still states the full problem and treats Baranyai's divisible case as known. The result here therefore illustrates a structural method but does not supersede the general bounds.
- [Blinovsky's journal paper](https://www.mathnet.ru/php/archive.phtml?jrnid=ppi&option_lang=eng&paperid=2152&wshow=paper) claims the related Ahlswede–Khachatrian conjecture up to finite cases, as does [arXiv:1510.01144](https://arxiv.org/abs/1510.01144). The present note neither certifies nor refutes those claims. [An anonymous November 2026 research release](https://doi.org/10.5281/zenodo.24241302) claims MMS for all two-valued lists for \(n\ge4k\), a different restricted family. The primary papers and targeted searches for “opposite pairs”, “symmetric noise” and “star” did not identify this exact opposite-pair theorem; priority remains unverified.
