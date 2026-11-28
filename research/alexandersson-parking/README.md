# Alexandersson's parking-function excedance conjecture

Research issue: [#106](https://github.com/1337isnot1337/solved-conjectures/issues/106).
Status: unresolved. No finite verification is counted as a resolution.

## Statement and source audit

For a parking function $a=(a_1,\ldots,a_n)$, let
$`\mathop{\mathrm{exc}}(a)=|\{i:a_i>i\}|`$. The entire assertion is that
```math
E_n(t)=\sum_{a\in\mathop{\mathrm{PF}}_n}t^{\mathop{\mathrm{exc}}(a)}
```
is real-rooted for every $n\geq1$, and that consecutive rows interlace.

[Alexandersson's author-maintained statement](https://www.symmetricfunctions.com/realRootedOpenProblems.htm), dated 2026-11-19, labels this conjecture explicitly. The issue title distinguishes it from his other conjectures; it is an author-and-object description.

The following primary sources were checked.

- [Defant, arXiv:2605.19979v1](https://arxiv.org/html/2605.19979v1), Section 3: excedances are equidistributed with descents of the parking-outcome permutation, including a fixed-content refinement. Lemma 3.3 gives a Ferrers-board rook formula.
- [Alexandersson, arXiv:2609.05131v2](https://arxiv.org/html/2609.05131v2): ordinary descents, image size, and several other families are treated. The full HTML contains no excedance assertion.
- [Stanley and Yin, arXiv:2306.08681v1](https://arxiv.org/pdf/2306.08681): the outcome and inverse-outcome conventions were checked. Their leaf-statistic identity involves inverse-outcome descents, not the statistic equidistributed with excedances here.

Both web engines and public GitHub issue records were searched for the exact statistic, root location, stability, and an earlier proof. No earlier resolution was located. This is a bounded search finding.

## A multiaffine refinement that would suffice

Define
```math
P_n(z_1,\ldots,z_{n-1})
 =\sum_{a\in\mathop{\mathrm{PF}}_n}\prod_{i:a_i>i}z_i.
```
There is no $z_n$ because $a_n\leq n$.

A useful exact identity is
```math
\frac{\partial P_n}{\partial z_{n-1}}=P_{n-1}.
```
Indeed, $a_{n-1}>n-1$ means $a_{n-1}=n$. Every other preference is then at most $n-1$: the parking condition requires at least $n-1$ entries at most $n-1$. Deleting car $n-1$ leaves a parking function of length $n-1$. The last original car becomes car $n-1$ and remains a non-excedance. Every earlier index and comparison is unchanged. Conversely, inserting preference $n$ immediately before the last car gives the inverse map.

If every $P_n$ were real stable, diagonal specialization would give real-rootedness of $E_n$. Stability and the derivative identity would also give consecutive interlacing. This is an unproved sufficient invariant.

For orientation, direct enumeration gives
```math
P_3=6+7z_1+2z_2+z_1z_2,
```
and
```math
P_4=24+47z_1+18z_2+6z_3
 +20z_1z_2+7z_1z_3+2z_2z_3+z_1z_2z_3.
```
Exact Rayleigh differences are positive in the small rows inspected. Numerical real-specialization and optimization probes through $n=7$ found no negative Rayleigh difference. These observations do not prove stability, and the searches were not exhaustive in real parameter space.

## An exact recurrence for the Worpitzky transform

Define the degree-$`n`$ polynomial $q_n(m)$ by
```math
\frac{E_n(t)}{(1-t)^{n+1}}
 =\sum_{m\geq0}q_n(m)t^m.
```
Set $q_0(m)=1$, including $m=-1$, and $q_n(-1)=0$ for $n>0$.
Then
```math
q_n(m)-q_n(m-1)
 =\sum_{\ell+r=n-1}(\ell+1)q_\ell(m)q_r(m-1).
\tag{1}
```
This identity holds for integers $m\geq0$, and hence as a polynomial identity.

### Derivation

By Defant's equidistribution, $E_n$ also counts descents of the parking outcome $\sigma$. Write $\tau=\sigma^{-1}$.

When the car in spot $p$ arrives, the closest still-empty spot to its left is the closest $j<p$ with $\tau(j)>\tau(p)$, or spot $0$ if none exists. Thus the number of possible preferences for that car is
```math
p-\max(\{j\lt p:\tau(j)>\tau(p)\}\cup\{0\}).
```
The preferences for a fixed outcome can be chosen independently in these intervals.

Construct the max-Cartesian binary tree of $\tau$: the maximum entry is the root, and the left and right subwords are treated recursively. Inorder positions label the nodes by $1,\ldots,n$. The preceding distance is one plus the size of the node's left subtree. Consequently the outcome multiplicity is
```math
w(T)=\prod_{v\in T}(1+|T_v^{\mathrm{left}}|),
```
which depends only on the plane binary-tree shape.

The inverse words $\sigma$ belonging to a fixed shape are exactly the linear extensions of the tree order in which a descendant precedes its ancestors. The labels are the inorder positions. For a permutation with $d$ descents, weakly increasing sequences of values in $`\{0,\ldots,m\}`$, strict at those descents, number
$\binom{m+n-d}{n}$. Summing over the linear extensions gives the usual labelled-poset order polynomial. Its generating function is the descent polynomial divided by $(1-t)^{n+1}$.

Fix the root value $s$. All labels in the left subtree are smaller than the root label, so their values are at most $s$. All labels in the right subtree are larger, so their values are at most $s-1$. The standard order-polynomial decomposition is therefore
```math
q_n(m)=
\sum_{\ell+r=n-1}(\ell+1)
\sum_{s=0}^{m}q_\ell(s)q_r(s-1).
```
The factor $\ell+1$ is the root's contribution to $w(T)$. Taking a finite difference proves (1).

A second expression follows from Defant's Ferrers-board formula and the factorial rook identity. If $b_1\leq\cdots\leq b_n$ is a parking content and $\mu(b)$ is the product of the factorials of its multiplicities, then
```math
q_n(m)=\sum_{b\in\mathop{\mathrm{PF}}_{\leq}(n)}
 \frac1{\mu(b)}
 \prod_{j=1}^{n}(m+j-b_j+1).
\tag{2}
```
The factor $1/\mu(b)$ removes the duplicate permutations of equal preferences.

Writing $Q_m(z)=\sum_{n\geq0}q_n(m)z^n$, equation (1) becomes the formal identity
```math
Q_m(z)-Q_{m-1}(z)
 =zQ_{m-1}(z)\frac{d}{dz}\bigl(zQ_m(z)\bigr).
\tag{3}
```
All identities above are structural reductions, not real-rootedness arguments.

## Two sufficient routes that fail

First, $q_n$ itself is not generally real-rooted:
```math
q_3(m)=\frac{(m+1)(16m^2+47m+36)}6,
```
and the quadratic discriminant is $-95$. A proof requiring the Worpitzky-transform polynomial to have only real zeros cannot work.

Second, the individual convolution terms in (1) need not lie in a common proper-position cone relative to the preceding $E_n$. For total size $\ell+r=4$, the numerator associated with $q_1(m)q_3(m-1)$ is
```math
B_{1,3}(t)=13t^3+39t^2+12t.
```
The preceding row is
```math
E_4(t)=t^3+29t^2+71t+24.
```
Its largest root lies in $(-41/100,-2/5)$, where $E_4'>0$ and $B_{1,3}>0$. Thus $B_{1,3}/E_4'$ is positive at that root, contrary to the residue sign needed for the proposed interlacing induction. Pairing the two ordered convolution terms also failed a subsequent diagnostic. Only the sum in (1) has the desired behavior in the inspected rows.

The remaining gap is a stability-preserving construction for the actual multiaffine parking polynomials, or a different invariant that controls the full weighted convolution. No such closure is established here.

## Reproducibility

[probe.py](probe.py) independently enumerates parking functions in small sizes, checks the derivative deletion identity, and compares the exact coefficient rows with (1) and (2). It also verifies the two exact obstructions above. It does not claim that finite root checks prove the conjecture.
