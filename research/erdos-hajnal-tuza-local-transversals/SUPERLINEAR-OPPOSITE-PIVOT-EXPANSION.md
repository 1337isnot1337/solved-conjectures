# Superlinear expansion from opposite pivots

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
At every fixed near-threshold offset, any example has \(\Omega(t^{3/2})\) near-minimum neighbors of one edge of every minimum pair. This assumes neither wing separation nor a fixed core.

## Statement

Keep the setup of [Witness expansion with slack](WITNESS-EXPANSION-WITH-SLACK.md): \(r=5t+z\), \(1\le z\le t/4\), \(\tau>t\), \(m=t+s\) minimum pair intersection, \(\delta=z-3s+2\), \(L=r-m\), and \(\ell=\lfloor m/s\rfloor\) disjoint primary cuts of \(X=A\cap B\). Fix the primary witnesses \(E_i\). On both sides choose exactly \(b=\lfloor t/z\rfloor\) secondary witnesses per pivot by disjoint cuts in the corresponding wing. Denote the counts of distinct edges on the two sides by \(N_A,N_B\). Every chosen edge meets its side's base in between \(m\) and \(m+2\delta\) points.

Choose an integer \(2\le k\le\ell\). Write
\[
B_k=L/k+\sqrt{L\delta},\qquad
h=\left\lfloor k-2z-5\delta-B_k\right\rfloor.
\]
If \(t-\delta-B_k>z+\delta\), \(h>0\) and \(h^2>2L\delta\), then
\[
N_A+N_B\ge \frac{\ell(b-K)}{k-1},
\qquad
K=\left\lfloor\frac{Lh}{h^2-2L\delta}\right\rfloor .
\]
In particular for \(z=o(t^{1/3})\) this gives
\(\max(N_A,N_B)=\Omega(t^{3/2}/(s z^{3/2}))\) with an absolute implicit constant. At \(z=1\) it gives the explicit asymptotic lower bound \((1/4-o(1))t^{3/2}\) on the larger side.

## Proof

Call a secondary edge high-use on its side if it is used at \(k\) or more pivots. The one-sided reuse estimate gives, on the \(A\) side,
\[
D_F=F\cap(B\setminus A),\qquad |D_F|\ge t-\delta-B_k .
\]
The reflected assertion holds on the \(B\) side. Fix any pivot \(i\) where \(F\) is used, let \(Y_i=A\cap E_i\), \(k_i=|Y_i|-t=s+\alpha_i\), and set \(P_F=F\setminus(A\cup E_i)\). Here \(0\le\alpha_i\le\delta\). Another selected cut of the same pivot is disjoint; its witness has exterior size at most \(r-2m+k_i\). The two exteriors have union of size at least \(r+m+\alpha_i-2\) by the local condition applied to those two witnesses and \(A,E_i\). Therefore
\[
|P_F|\ \ge\ 3m+\alpha_i-k_i-2.
\]
By inclusion-exclusion,
\[
|F\cap(E_i\setminus A)|=r-|F\cap A|-|P_F|
 \le r-m-(3m+\alpha_i-k_i-2)
 = t+\delta.
\]
The four-edge estimate with \(B\) gives \(|D_F\setminus V_i|\le\delta\). Thus
\[
|F\cap W_i|\le (t+\delta)-|D_F\cap V_i|\le 3\delta+B_k,
\quad V_i=E_i\cap(B\setminus A),\quad W_i=E_i\setminus(A\cup B).
\]

Now take opposite high-use edges \(F,G\) used at the same pivot \(i\). In each wing their common part has size at most \(z+\delta\): on one side the cut for \(F\) permits at most \(z\) entries of that wing of \(E_i\), and the reflected estimate for \(G\) permits at most \(\delta\) entries outside it. Hence \(F,G\) are distinct by the lower bound \(t-\delta-B_k>z+\delta\) on \(G\)'s whole \(A\)-wing. The edge \(F\) avoids the nonempty \(E_j\cap X\) residue at every pivot \(j\) where it is used, so \(F\) avoids at least \(k\) distinct points of \(X\). Using \(|F\cap G|\ge m\), they have at least \(k-2(z+\delta)\) common exterior vertices outside \(A\cup B\). At most \(3\delta+B_k\) of those lie in \(W_i\). The remaining ones belong to both secondary edges' exteriors relative to the fixed primary pivot.

For a fixed high-use \(B\)-edge \(G\) at \(i\), choose \(h\) of these remaining common vertices for every high-use \(A\)-edge \(F\) at \(i\). The chosen sets all lie in \(G\setminus(A\cup B)\) of size at most \(L\). Their pairwise intersections have size at most \(2\delta\): the \(A\)-side secondary cuts at pivot \(i\) are disjoint, so their relative exteriors \(P_F\) have pairwise overlap at most \(\delta+\alpha_i\le 2\delta\) by [Two-wing balance](TWO-WING-BALANCE.md). The second moment of vertex multiplicities bounds the number \(u\) of chosen sets:
\[
(uh)^2\le L(uh+2\delta u(u-1)).
\]
It follows that \(u\le K\). If both sides have a high-use witness at \(i\), this bound holds on both sides by reflection. If one side has none, that side already has at most \(K\). In either case at least \(b-K\) incidences at this pivot are low-use. Sum over pivots. Each distinct low-use edge accounts for at most \(k-1\) incidences per side, proving the stated bound.

For \(z=o(t^{1/3})\), take \(k=\lceil 10\sqrt{t(z+1)}\rceil\). Eventually \(k\le\ell\). The bounds \(\delta\le z\), \(L\le 17t/4\) imply \(h\gg\sqrt{t(z+1)}\), \(2L\delta/h^2\) is bounded away from 1, and \(B_k=o(t)\). Hence \(K=O(\sqrt{t/(z+1)})=o(b)\), which gives the claimed order. At \(z=1\), use \(k=\lceil 2\sqrt t+t^{1/4}\rceil\). Then \(B_k=4t/k\), \(h\) grows on the order of \(t^{1/4}\), \(K=O(t^{3/4})=o(t)\), and \(\ell=t+1\), \(b=t\). Dividing the sum bound by two gives \((1/4-o(1))t^{3/2}\) on at least one side.

The new proof avoids a dense-core hypothesis and improves the unconditional linear-size estimate. It does not determine the optimum in Erdős #616.

## The same bound counts distinct intersection traces

The secondary selection on the \(A\) side can be arranged to
use a single representative edge for every trace \(F\cap A\).
To do so fix one representative of each trace of the full
hypergraph on \(A\) before selecting any secondary witness.
Whenever some edge misses the cut complement in
\(Y_i=A\cap E_i\), the representative of its \(A\)-trace
also misses it, since \(Y_i\subseteq A\). It is therefore a
valid choice, and all proof estimates apply to it. For disjoint
cuts at a fixed pivot, the traces are automatically different:
they meet \(Y_i\) in nonempty subsets of those disjoint cuts.
Make an analogous canonical choice for the \(B\) side.

Thus the displayed lower bound also holds for the sum of the
numbers of **distinct traces** of the selected edges on their
respective bases, with the same intersection gap \(2\delta\).
At \(z=1\) at least one base therefore has
\((1/4-o(1))t^{3/2}\) distinct minimum traces, not merely that
many different outside paddings of a smaller trace family.
