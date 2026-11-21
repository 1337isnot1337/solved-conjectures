# Three-adic incoming potential: integer transfer and dense poles

Date: 21 November 2026. Continuation of the reviewed incoming-weight note for
[Althöfer Prize 0 / issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220).

Status: no absorption theorem, escape theorem, or completed prize target.
This note proves that the three-adic potential has a dense set of infinite
values and gives a uniform family of large values at valid integer starts.
Neither statement settles finiteness at a fixed required integer or the
weighted sum over all integer starts. The exact affine correction causes no
additional obstruction to a conditional transfer outside a finite set.

The current [sponsor statement](https://althofer.de/collatz-prizes.html) offers
€300 for the first proof of all-start, almost-sure absorption for independent
fair choices of `odd(3n−1)` and `odd(3n+1)`. The exact law is also the open
model in [Doumas–Papanicolaou, Remark 1](https://arxiv.org/html/1503.03658v1).
No novelty claim is made for the operator method or the elementary identities
below. The already-reviewed [README.md](README.md) is not changed by this continuation.

## Definitions

Let


```math
\mathcal S=\{n>1:n\text{ odd},\ 3\nmid n\}.
```


The fair-sign chain is killed when it reaches 1. Its kernel on
$`\mathcal S`$ is $`P`$. For $`m\in\mathbb Z_3^\times`$, let
$`\sigma_k(m)\in\{-1,1\}`$ be defined by
$`2^km\equiv\sigma_k(m)\pmod3`$. For $`1\lt s\lt 2`$, put


```math
a_k=\frac12\left(\frac3{2^k}\right)^s,
\qquad
(\mathcal L_s f)(m)=
\sum_{k\ge1}a_k
1_{\{n_k(m)\in\mathbb Z_3^\times\}}f(n_k(m)),
\qquad
n_k(m)=\frac{2^km-\sigma_k(m)}3.
```


Define


```math
\lambda_s=\frac{3^{s-1}}{2^s-1}\lt 1,
\qquad
\lambda_s\lt q\le1,
\qquad
F_{s,q}(m)=\sum_{t\ge0}q^{-t}\mathcal L_s^t1(m).
\tag{1}
```


The earlier note proves, for normalized Haar measure $`\nu`$ on the units,


```math
\int F_{s,q}\,d\nu=\frac1{1-\lambda_s/q}\lt \infty,
\qquad
\mathcal L_sF_{s,q}=q(F_{s,q}-1)
\tag{2}
```


as an extended-valued identity. In particular $`F_{s,q}`$ is finite
Haar-almost everywhere. The parameter $`q`$ is displayed explicitly here.

For $`m\in\mathcal S`$, every retained predecessor $`n_k(m)`$ is again in
$`\mathcal S`$. It is a positive odd integer by the numerator congruences.
It cannot equal 1: an odd integer of the form $`(3\pm1)/2^k`$ is only 1.
Thus restricting $`\mathcal L_s`$ to actual integer states uses the same
predecessor paths as the killed integer chain. It never visits the rational
poles described below.

## Conditional transfer: the affine correction is uniformly controlled

This subsection assumes $`q\lt 1`$. A later exact martingale argument also
handles $`q=1`$.

Suppose a finite positive function $`F`$ on $`\mathcal S`$ satisfies


```math
\mathcal L_sF\le qF,
\qquad
\sum_{n\in\mathcal S}n^{-s}F(n)\lt \infty.
\tag{3}
```


These are assumptions, not results of the Haar calculation. Set
$`\mu(n)=n^{-s}F(n)`$. The exact incoming expression is


```math
(\mu P)(m)
=m^{-s}\sum_{\substack{k\ge1\\n_k(m)\in\mathcal S}}
a_k\left(1-\frac{\sigma_k(m)}{2^km}\right)^{-s}F(n_k(m)).
\tag{4}
```


Choose $`M`$ sufficiently large that


```math
\rho:=q\left(1-\frac1{2M}\right)^{-s}\lt 1.
\tag{5}
```


For every target $`m>M`$, the correction factor in (4) is at most
$`(1-1/(2M))^{-s}`$, since $`k\ge1`$. If $`E=\{n\in\mathcal S:n>M\}`$
and $`P_E`$ is the chain killed on leaving $`E`$, then


```math
\mu|_E\,P_E\le\rho\mu|_E.
```


Summability gives the pointwise survival bound


```math
\Pr_n(\tau_{E^c}>t)
\le\frac{\sum_{m\in E}\mu(m)}{\mu(n)}\rho^t\longrightarrow0.
\tag{6}
```


Therefore every start returns to the finite set below $`M`$ almost surely.
For every odd $`n>1`$, exactly one of $`3n-1,3n+1`$ is divisible by 4,
and its odd part is at most $`(3n+1)/4\lt n`$. Repeatedly choosing this
decreasing branch reaches 1. From the finite set below $`M`$, such a path
has uniformly bounded length and uniformly positive probability. Repeated
returns and the Markov property then imply absorption almost surely.
Starts divisible by 3 enter the coprime state space after one move.

Consequently a finite integer sum
$`\sum_{n\in\mathcal S}n^{-s}F_{s,q}(n)`$ would suffice for the full
target: finiteness of this nonnegative sum already entails finiteness at
each required integer, and (2) supplies the pointwise inequality. That sum
has not been proved finite. Accumulating a rough error factor over a long
path is unnecessary for this conditional implication; (4)–(6) control the
exact one-step operator outside a fixed finite set.

## Exact meaning of the missing integer sum

The homogeneous operator becomes a different positive kernel after
conjugating by $`n^{-s}`$. Define, retaining only nonabsorbing branches,


```math
Q_s(n,T_\sigma(n))
=\frac12\left(\frac{3n}{3n+\sigma}\right)^s,
\qquad
T_\sigma(n)=\mathop{\mathrm{odd}}(3n+\sigma).
\tag{7}
```


If two branches had the same target, their contributions would be added.
For each retained edge $`3n+\sigma=2^km`$,


```math
n^{-s}Q_s(n,m)=m^{-s}a_k.
```


Writing $`\eta_s(n)=n^{-s}`$, induction and nonnegative summation give


```math
(\eta_sQ_s^t)(m)=m^{-s}\mathcal L_s^t1(m).
\tag{8}
```


Thus the unresolved sum is exactly


```math
\begin{aligned}
\sum_{m\in\mathcal S}m^{-s}F_{s,q}(m)
&=\sum_{t\ge0}q^{-t}\sum_{n\in\mathcal S}n^{-s}
\mathbb E_n\!\left[
\prod_{j=0}^{t-1}\left(\frac{3N_j}{3N_j+\sigma_j}\right)^s;
\ \tau_1>t\right].
\end{aligned}
\tag{9}
```


Here $`N_j`$ follows the original fair-sign chain, and the empty product
for $`t=0`$ is 1. All equalities hold with infinite values permitted.

This is a weighted survival problem for actual integer trajectories.
The kernel $`Q_s`$ is not a substochastic substitute for $`P`$. Whenever
neither branch from $`n`$ absorbs, its row sum is


```math
\frac12\left[
\left(1-\frac1{3n}\right)^{-s}
+\left(1+\frac1{3n}\right)^{-s}\right]
>1
\tag{10}
```


by strict convexity. Its expansion is
$`1+s(s+1)/(18n^2)+O_s(n^{-4})`$. Absorbing branches are removed from
the corresponding rows. The positive excess in (10) does not establish
divergence of (9); killing can compensate for it. It does show why the
Haar factor $`\lambda_s\lt 1`$ is not an integer-kernel mass contraction.

## Dense poles, not merely the two fixed endpoints

Set


```math
\kappa_s=a_1+a_2
=\frac12\left[\left(\frac32\right)^s+
\left(\frac34\right)^s\right]
\ge\left(\frac3{2\sqrt2}\right)^s>1.
\tag{11}
```


At the three-adic point 1, the inverse branches $`k=1,2`$ both fix 1.
Hence $`\mathcal L_s^t1(1)\ge\kappa_s^t`$, and
$`F_{s,q}(1)=\infty`$.

More generally, for every integer $`j\ge0`$, take $`m=2^{-j}`$.
The branch $`k=j+1`$ has $`2^km=2`$, $`\sigma_k=-1`$, and predecessor 1.
Therefore


```math
\mathcal L_s^{t+1}1(2^{-j})\ge a_{j+1}\kappa_s^t,
\qquad
F_{s,q}(2^{-j})=\infty.
\tag{12}
```


This pole set is dense in $`\mathbb Z_3^\times`$. An elementary proof is
that


```math
v_3\!\left(4^{3^r}-1\right)=r+1\qquad(r\ge0),
```


by induction using the binomial expansion of
$`(1+3^{r+1}u)^3`$, with $`3\nmid u`$. Thus the order of 2 modulo
$`3^a`$ is $`2\cdot3^{a-1}`$, the full size of its unit group. The
nonnegative powers of $`2^{-1}`$ consequently meet every unit residue
class modulo every $`3^a`$.

Each $`\mathcal L_s^t1`$ is finite and locally constant modulo
$`3^{t+1}`$. Finiteness follows from
$`\sum_k a_k\lt \infty`$; the congruence assertion follows inductively
because each inverse step divides by 3. Hence the nondecreasing partial
sums in (1) are continuous, and $`F_{s,q}`$ is lower semicontinuous.
For every positive integer $`B`$, the set $`\{F_{s,q}>B\}`$ is open
and contains the dense pole set (12). It is therefore open dense. It follows
that


```math
\{F_{s,q}=\infty\}=\bigcap_{B\ge1}\{F_{s,q}>B\}
\tag{13}
```


is a dense $`G_\delta`$ set, although (2) gives it Haar measure zero.

Thus deleting only $`1,-1`$ cannot produce an everywhere-finite potential
on the three-adic units, and a local continuity or boundedness argument away
from those two points cannot justify the integer transfer. For $`j\ge1`$,
the explicit poles $`2^{-j}`$ are nonintegral. None is a required state in
$`\mathcal S`$. Equation (13) alone gives no divergence at any required
integer either: a prescribed countable dense set can avoid a dense
measure-zero $`G_\delta`$.

## Large values at actual odd integer starts away from the endpoints

There is also an exact obstruction to bounding the integer potential solely
by its three-adic distances from $`1,-1`$. For every even $`H\ge2`$, put


```math
m_H=\frac{3^H+1}{2}.
\tag{14}
```


Then $`m_H`$ is a positive odd integer, $`m_H\equiv5\pmod9`$, and


```math
v_3(m_H-1)=0,\qquad v_3(m_H+1)=1.
\tag{15}
```


Its $`k=2`$ predecessor is


```math
u_H=\frac{4m_H+1}{3}=1+2\cdot3^{H-1},
\qquad 3u_H-1=4m_H.
```


If $`v_3(u-1)=d\ge2`$, both branches $`k=1,2`$ are allowed and have
predecessors


```math
1+\frac23(u-1),\qquad 1+\frac43(u-1),
```


with distance valuation $`d-1`$. Starting from $`u_H`$, every word of
length $`t\le H-2`$ in these two branches therefore remains in the unit
state space. These paths are also valid positive odd integer paths. Thus


```math
\mathcal L_s^t1(u_H)\ge\kappa_s^t\qquad(0\le t\le H-2),
```


and


```math
F_{s,q}(m_H)
\ge1+\frac{a_2}{q}
\sum_{t=0}^{H-2}\left(\frac{\kappa_s}{q}\right)^t
\longrightarrow\infty.
\tag{16}
```


The bound is exact in its depth: after $`H-2`$ steps the endpoint valuation
is still at least 1, whereas at the next step not every two-branch choice
need remain a unit. The endpoint data in (15) stay fixed throughout the
family. Hence no finite upper bound depending only on those two valuations
can control $`F_{s,q}`$ on the integer state space.

This is not a counterexample to integer summability. For example, the
displayed lower bounds themselves grow like a constant times
$`(\kappa_s/q)^H`$, whereas $`m_H^{-s}`$ decays like $`3^{-sH}`$.
Since


```math
\frac{\kappa_s}{q3^s}\lt 1
```


for $`q>\lambda_s`$, their weighted sum over the even $`H`$ converges.
Indeed $`\kappa_s/3^s=\tfrac12(2^{-s}+4^{-s})\lt \lambda_s`$, because
$`\lambda_s/(\kappa_s/3^s)=2\cdot3^{s-1}/(1-2^{-2s})>1`$.
A summable sequence of lower bounds supplies no upper bound on the true
values.

## A uniformly summable part of the integer mass

Periodicity does control the part where the integer is at least the modulus
needed to determine the depth-$`t`$ function. Set
$`f_t=\mathcal L_s^t1`$ and $`D_t=3^{t+1}`$. Its sum over unit residues is


```math
\sum_{a\in(\mathbb Z/D_t\mathbb Z)^\times}f_t(a)
=\varphi(D_t)\lambda_s^t.
```


For a representative $`1\le a\lt D_t`$, the integers in that residue class
which are at least $`D_t`$ have the form $`a+\ell D_t`$, $`\ell\ge1`$.
Dropping oddness for an upper bound, and using nonnegativity, gives


```math
\begin{aligned}
\sum_{\substack{n\in\mathcal S\\n\ge D_t}}n^{-s}f_t(n)
&\le\zeta(s)D_t^{-s}\varphi(D_t)\lambda_s^t\\
&=\frac23\zeta(s)D_t^{1-s}\lambda_s^t.
\end{aligned}
\tag{17}
```


Consequently


```math
\sum_{t\ge0}q^{-t}
\sum_{\substack{n\in\mathcal S\\n\ge3^{t+1}}}n^{-s}f_t(n)
\le
\frac{2\zeta(s)3^{-s}}{1-3^{1-s}\lambda_s/q}\lt \infty.
\tag{18}
```


This leaves the complementary region $`n\lt 3^{t+1}`$. Every fixed integer
lies in that region for all sufficiently large $`t`$, so (18) does not
establish pointwise finiteness or the full weighted sum. This bound was
obtained independently by the reviewer and the worker and checked by the
coordinator.

## One jump followed by a long endpoint phase is also summable

For a fixed integer target $`m\in\mathcal S`$, entry into a deep
neighborhood of 1 satisfies the exact equivalence


```math
n_k(m)\equiv1\pmod{3^H}
\quad\Longleftrightarrow\quad
2^km\equiv2\text{ or }4\pmod{3^{H+1}}.
\tag{19}
```


Since 2 generates the unit group, the admissible exponents lie in two
consecutive residue classes modulo $`2\cdot3^H`$. This does not justify
assuming that the least positive exponent is of that order. In (14), the
fixed exponent $`k=2`$ reaches depth $`H-1`$ for every even $`H`$.
For fixed $`m`$, the nonzero integer differences in (19) give an elementary
lower bound linear in $`H`$; stronger bounds are unnecessary for the
following single-phase estimate.

Write


```math
R=\kappa_s/q>1,\qquad \beta=\log_3R.
```


We have $`0\lt \beta\lt s`$, since $`\kappa_s\lt q3^s`$ as checked above.
For a retained predecessor $`n_k(m)`$, put
$`h_k=v_3(n_k(m)-1)`$. Consider just paths consisting of this initial
jump into $`h_k\ge1`$, followed by an arbitrary word in $`k=1,2`$ of
length at most $`h_k-1`$. These binary paths remain in the neighborhood
of 1, and their total weighted prefix contribution is exactly


```math
\mathcal B_+(m)
=\frac1q\sum_{\substack{k\ge1\\n_k(m)\in\mathcal S,\ h_k\ge1}}
a_k\sum_{t=0}^{h_k-1}R^t.
\tag{20}
```


No subsequent arbitrary continuation is included in this definition.
The integer $`n_k(m)-1`$ is nonzero and positive, so


```math
R^{h_k}=\bigl(3^{h_k}\bigr)^\beta
\le(n_k(m)-1)^\beta\le(2^km)^\beta.
```


Bounding the geometric prefix sum by $`R^{h_k}/(R-1)`$, then dropping
the restrictions on $`k`$, yields


```math
\mathcal B_+(m)
\le
\frac{3^s}{2q(R-1)(2^{s-\beta}-1)}m^\beta.
\tag{21}
```


For the neighborhood of $`-1`$, use $`h_k=v_3(n_k(m)+1)`$. While that
height is at least 2, the two predecessors are
$`-1+2(n+1)/3`$ and $`-1+4(n+1)/3`$, and both lower the height by one.
The same calculation applies because $`n_k(m)+1\le2^km`$. Thus the
analogous contribution $`\mathcal B_-(m)`$ obeys (21) too.

There is a nonempty parameter range in which the bound is summable over
every integer start. If


```math
q>\max\{\lambda_s,\ \kappa_s3^{1-s}\},\qquad q\le1,
\tag{22}
```


then $`\beta\lt s-1`$, and (21) gives


```math
\sum_{m\in\mathcal S}m^{-s}
\bigl(\mathcal B_+(m)+\mathcal B_-(m)\bigr)
\le
\frac{3^s\zeta(s-\beta)}{q(R-1)(2^{s-\beta}-1)}\lt \infty.
\tag{23}
```


For an exact witness to a nonempty parameter range, take $`s=3/2`$ and
$`q=99/100`$. The elementary inequalities
$`\sqrt3\lt 7/4`$, $`\sqrt2>7/5`$ imply
$`\lambda_s\lt 35/36\lt q`$ and
$`\kappa_s3^{1-s}\lt 81/112\lt q`$. These are analytic parameters for the
whole state space, not a verification of finitely many trajectories.

Equations (20)–(23) control one arbitrary entry followed by one entire
family of long binary endpoint prefixes. They do not control an arbitrary
number of entries separated by other inverse branches. Applying (21)
repeatedly introduces a constant and the polynomial factor without a proved
contraction. A path may also approach other dyadic poles. No convergent
bound for all such concatenations has been derived.

## Exact transfer with $`q=1`$, without a pointwise growth assumption

A stopped product martingale gives a stronger conditional transfer than
the one-step comparison (4). Along the original fair-sign chain, define


```math
Z_t=\prod_{0\le j\lt \min(t,\tau_1)}
\left(1+\frac{\sigma_j}{3N_j}\right).
\tag{24}
```


It is frozen after absorption. Before absorption, the current state and
survival are known, and the next independent fair sign has mean zero.
Thus $`\mathbb E[Z_{t+1}\mid\mathcal F_t]=Z_t`$. All factors are positive
and bounded at each finite time, so $`\mathbb E_nZ_t=1`$.

On $`A_t=\{\tau_1>t\}`$, the exact path weight for $`Q_s`$ in (9) is
$`Z_t^{-s}`$. Hölder's inequality therefore gives


```math
\begin{aligned}
\Pr_n(A_t)
&=\mathbb E_n\left[
(Z_t^{-s}1_{A_t})^{1/(s+1)}
(Z_t1_{A_t})^{s/(s+1)}\right]\\
&\le
\mathbb E_n[Z_t^{-s};A_t]^{1/(s+1)}
\mathbb E_n[Z_t;A_t]^{s/(s+1)}\\
&\le\mathbb E_n[Z_t^{-s};A_t]^{1/(s+1)}.
\end{aligned}
\tag{25}
```


Let


```math
\Gamma_t(s)=\sum_{m\in\mathcal S}m^{-s}\mathcal L_s^t1(m).
```


The conjugacy (8) yields


```math
\Pr_n(\tau_1>t)^{s+1}
\le\mathbb E_n[Z_t^{-s};A_t]
\le n^s\Gamma_t(s).
\tag{26}
```


Each $`\Gamma_t(s)`$ is finite: $`\sum n^{-s}\lt \infty`$, and the row
sums of $`Q_s`$ are bounded uniformly, so its finite-time mass is finite.
Since survival probabilities decrease with $`t`$, the condition


```math
\liminf_{t\to\infty}\Gamma_t(s)=0
\tag{27}
```


already implies absorption from every start. This is the weakest sufficient
condition established in this note. It has not been proved.

In particular, define $`F_{s,1}=\sum_{t\ge0}\mathcal L_s^t1`$. If


```math
S_1:=\sum_{m\in\mathcal S}m^{-s}F_{s,1}(m)
=\sum_{t\ge0}\Gamma_t(s)\lt \infty,
\tag{28}
```


then (27) holds. This requires no additional estimate
$`F_{s,1}(m)=o(m)`$. Indeed it also gives
$`\sum_t\Pr_n(\tau_1>t)^{s+1}\lt \infty`$ for each fixed $`n`$.
For $`q\lt 1`$, finiteness of
$`S_q=\sum_m m^{-s}F_{s,q}(m)`$ gives the explicit exponential bound


```math
\Pr_n(\tau_1>t)
\le(n^sS_q)^{1/(s+1)}q^{t/(s+1)}.
\tag{29}
```


Thus the affine correction has an exact probabilistic treatment. The
unresolved requirement is the arithmetic mass decay (27), not an estimate
on the product of correction errors. The earlier bounds (18) and (23)
remain valid at $`q=1`$ with their stated parameter inequalities, but do
not establish (27) or (28). The coordinator and independent reviewer both
checked the stopped martingale, Hölder exponents, and conditional scope;
the coordinator noted the sufficient subsequential decay condition (27).

## Exact remaining obligation

The conditional transfers in (3)–(6) and (24)–(29) are valid. The remaining
sufficient statement is the integer mass decay (27); finiteness of the
integer weighted sum (28) would also suffice. Haar integrability proves
neither statement.
The dense poles defeat an everywhere-finite continuation obtained just by
removing the fixed endpoints, and (16) defeats a bound based only on their
three-adic distance valuations. Equations (18) and (23) prove convergence
for two explicitly restricted portions of the required sum. The remaining
small-integer, repeated-phase contributions have no controlled bound.
None of these results proves divergence at a fixed nonabsorbing integer,
failure of the full weighted sum, or an escaping trajectory of positive
probability.

No finite trajectory search was used. Full paid-target completion count
remains zero. The conditional affine transfer was proposed independently
by the coordinator; the dense-pole and integer-spike arguments have passed
independent review. The one-block estimate, stopped-martingale transfer,
and assembled final note also passed independent review, recorded in
[TRANSFER_REVIEW.md](TRANSFER_REVIEW.md). The reviewer and
coordinator checked the stated sufficient conditions without treating any
unproved integer-mass estimate as established.
