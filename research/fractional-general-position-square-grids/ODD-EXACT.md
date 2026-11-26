# Fractional general position conjecture for square grids

**Exact odd-order theorem.** The checkerboard lower bound in [Fitzpatrick–Janssen–Nowakowski, Lemma 2.2](https://cdn.dal.ca/content/dam/dalhousie/pdf/faculty/computerscience/technical-reports/CS-2004-02.pdf) is optimal for every odd $n\ge3$. Together with the [exact even-order theorem](EVEN-EXACT.md), this proves both assertions of [Conjecture 5.38 in the survey](https://arxiv.org/html/2501.19385v3#S5.SS4).

The odd rank graph has two components, and they need not have the same tight cover value. Give each its own complementary pair mass while retaining the same total path flow on all rows. An explicit boundary calculation shows that the offset between the two masses does not break row interlacing.

## 1. Masses and cutoffs for the two parities

The case $n=3$ has exact value four by the source's exact covering table. Assume $n\ge5$ is odd and use $N=n-1$. Write
$$A=\frac{N(N+2)}2,\qquad L=\lfloor\sqrt A\rfloor,\qquad t=N-L.$$
We have $1\le t$ and $L\ge N/2+1$, so $t+1\le N/2$. In the rotated diamond, $u,v$ have equal parity. For the parity of $t$, retain signed ranks from $-L$ to $L$ of that parity. For the other parity, retain the ranks from $-(L-1)$ to $L-1$. A cutoff of the form $N-s$ for parity $s\bmod 2$, with $s=t$ or $s=t+1$, retains $N-s+1$ signed ranks. Its number of ordered active-active positions is
$$A_s=A+1-s^2.$$
Indeed, before truncation the parity positions are a checkerboard with $(n^2+(-1)^s)/2$ vertices. At each of four corners the removed parity-compatible positions are counted by summing the rank lengths $j+1$ for $0\le j<s$, $j\equiv s\pmod2$. This removes $s^2$ positions in total for even $s$ and $s^2-1$ for odd $s$.

Put
$$W_s=\frac{A_s}{2(N-s+1)},\qquad W=\max(W_t,W_{t+1}).$$
The corresponding checkerboard labeling gives $\operatorname{gp}_f\ge 4W_s$: at most $N-s+1$ of these active positions occur on any corner geodesic in either orientation, so give each such position weight $2/(N-s+1)$. If $s=2k$ or $s=2k+1$, respectively, this is exactly the first or second formula in the source.

The following identities give the comparison that will be needed:
$$W_s-s=\frac{(N-s+1)^2-A}{2(N-s+1)},\qquad
W_{t+1}-W_t=\frac12\left(1-\frac{A}{L(L+1)}\right).$$
Since $L^2\le A<(L+1)^2$, we get $t\le W\le t+1$ and $|W_t-W_{t+1}|\le1/(2L)$.

## 2. Linear potentials on the two active rank graphs

For each parity $p$, let $s_p$ be its $s\in\{t,t+1\}$ and $C_p=W/(2W_{s_p})\ge1/2$. Within that parity solve
$$d_u h_u-\sum_{v\sim u}h_v=W-C_p d_u,$$
where $v\sim u$ means $(u,v)$ is active and allowed, with a diagonal counted once in both terms. The nondiagonal edges form a connected graph in each parity: all even ranks connect to the central even rank, and all odd ranks are linked through the ranks $1,-1$. A diagonal cancels on the left. The right-hand side sums to zero by definition of $C_p$, so there are real solutions, averaged to be even in the rank coordinate.

Set
$$P(u,v)=C_p+h_{|u|}-h_{|v|}$$
on active allowed pairs of parity $p$, and zero on active rows with outside column. Row sums are $W$. On active-active positions $P(u,v)+P(v,u)=2C_p\ge1$.

All active rows of a given parity up to its first sloping rank $s_p$ have the same neighbors, hence constant potential in that range. For $s_p\le a\le N-s_p$ of parity $p$, let $B=N-a$ and $x_a=P(a,B)$. Removing the two extreme neighbors when increasing $a$ by two gives
$$h_{a+2}-h_a=\frac{2x_a}{B-1}.$$
By complementing the boundary pair, $x_{N-a}=2C_p-x_a$. Applying the same difference across the paired ranks yields
$$x_{a+2}-x_a=\frac{2x_a}{B-1}+\frac{2(2C_p-x_{a+2})}{a+1}.$$
Let $q_a=(a+1)(N-a+1)$. This is equivalent to
$$(q_{a+2}x_{a+2})-(q_ax_a)=4C_p(N-a-1).$$
Solving the elementary recurrence on the parity, and using the reflection identity to fix its additive constant, gives
$$x_a=C_p f(a),\qquad
f(a)=1+\frac{N(a-N/2)}{(a+1)(N-a+1)}.$$
This formula applies also if the sloping range consists of one rank, by the reflection identity. The final boundary row of a parity has $s_p+1$ identical entries, so $x_{N-s_p}=W/(s_p+1)$. Thus its reflected initial value is nonnegative:
$$x_{s_p}=W\left(\frac1{W_{s_p}}-\frac1{s_p+1}\right)\ge0,$$
using $W_{s_p}\le W\le t+1\le s_p+1$. The function $f$ is increasing: if $y=a-N/2$, its variable term is $Ny/((N/2+1)^2-y^2)$. Hence all sloping $x_a$ are nonnegative. The stride-two potential differences are consequently nonnegative within each parity. Each active row attains its minimum entry at the largest allowed absolute column; that is its corresponding boundary $x_a$, or the same entry from its parity's constant initial row. Thus all entries of $P$ are nonnegative.

## 3. Interlacing survives the change in parity masses

We need the stride-two differences $U_a=h_{a+2}-h_a$ to be nondecreasing even while $a$ changes parity. They vanish for $a<t$. For $a\ge t$, in their defined range,
$$U_a=\frac{2C_{a\bmod2} f(a)}{N-a-1}.$$
The ratio of the larger $C_p$ to the smaller is at most
$$1+\frac{1/(2L)}{t-1/(2L)}
 =1+\frac1{2Lt-1}\le1+\frac1{L-2},$$
using the difference bound for $W_s$ and $W\ge t$. For consecutive defined $U_a,U_{a+1}$ with $a\ge t$, the ratio from the denominators is $(N-a-1)/(N-a-2)\ge1+1/(L-2)$, and $f(a+1)\ge f(a)\ge0$. These comparisons imply $U_{a+1}\ge U_a$ (including any zero endpoint). Consequently $\Delta_{a+2}\ge\Delta_a$ for the consecutive increments $\Delta_a=h_{a+1}-h_a$.

The [even-order interlacing argument](EVEN-EXACT.md#3-exact-legal-transport-between-consecutive-rows) now applies to positive and negative positions. In comparing one active row to the next, at shifted supported positions the new-minus-old differences get the same extra constant $C_{1-p}-C_p$. Thus the shift-up differences still switch sign only from positive to negative; the shift-down differences still switch only from negative to positive. Support widths still change by one, and the signs of the full initial tails follow from reflection and equal row masses exactly as before. This gives path transport between every pair of active rows.

For the outer rows use mass one at every position and split any surplus at the extreme positions. The transition from row $L$ to row $L+1$ is precisely the same as before: the last active row has constant mass $W/(t+1)\le1$, and the first outer row has width $t-1$ with mass at least one at each position. The other outer transitions are the same. Hence a northeast path flow of total mass $W$ exists. Its reflection supplies the other path orientation of equal mass. Active-active positions receive total at least one by the identity $2C_p\ge1$, and every outside position is covered at least once from its outer row. Thus the resulting cover has weight $2W$ and $\operatorname{gp}_f\le4W$.

Since the two displayed checkerboard labelings attain $4W$, this equals the maximum of all the lower-bound expressions in the source. No separate optimization over all truncation parameters is necessary. Coordination: [#909](https://github.com/1337isnot1337/solved-conjectures/issues/909).
