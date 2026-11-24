# A legal first-zero partition in the tagged source

Status: an exact rectangular partial construction. Its flag cost is exponential in the number of outer bits, so it does not establish the required trade. The calculation identifies a cost that the scalar first-zero identity alone does not remove.

The tagged source used here is
```math
\widehat S_{q,N}
 =U_{ABCD}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N).
\tag{1}
```
The shared label $`h\in[q]`$ is explicitly present at $`D`$. The previously proved tagged-source transfer supplies this label in the geodesic setting with an additional nearly preserved flag. No untagged $`D`$ map is assumed to know $`h`$.

## 1. One rectangular target

Fix a subset $`I\subseteq[q]`$ of size $`a`$, and suppose $`N=aM`$. Label each source flag by $`(i,k)\in I\times[M]`$. In (1), write a basis summand as
```math
A_{h;(i,k)} B_{h;(i',\ell)}
 C_{h,c} D_{h,c;(i,k),(i',\ell)}.
```
Use the exact local maps
```math
\begin{aligned}
A_{h;(i,k)}&\longmapsto A_{i,k},\\
B_{h;(i',\ell)}&\longmapsto B_{h,\ell},\\
C_{h,c}&\longmapsto
 \begin{cases}C_{c,h},&c\in I,\\0,&c\notin I,\end{cases}\\
D_{h,c;(i,k),(i',\ell)}
 &\longmapsto
 \delta_{c,i}\delta_{i',i}\delta_{k,\ell}\,D_{i,h}.
\end{aligned}
\tag{2}
```
Their contraction is
```math
\sum_{i\in I,\ j\in[q],\ k\in[M]}
 A_{i,k}B_{j,k}C_{i,j}D_{i,j}
 =U_{ACD}(a)U_{BCD}(q)W_{AB}(M).
\tag{3}
```
Every condition in (2) uses indices present at its party. In particular $`D`$ reads its tagged $`h`$, while $`C`$ reads $`h,c`$. There is no postselection on an unobserved output index.

For arbitrary $`N`$, restricting each source flag to
$`a\lfloor N/a\rfloor`$ coordinates gives the same construction with
$`M=\lfloor N/a\rfloor`$.

## 2. First-zero classes and the common-flag loss

Let $`q=2^n`$. Partition the outer $`A`$ labels into
```math
I_j=\{x:x_1=\cdots=x_{j-1}=1,\ x_j=0\}
\quad(1\le j\le n),
\qquad I_*=\{1^n\}.
```
Their sizes are $`a_j=2^{n-j}`$ and $`a_*=1`$. There are $`n+1`$ classes.

Apply (2) independently in one full-unit branch for each class. If all branches must retain the same target flag of size $`M`$, then the largest class already requires
```math
N\ge(q/2)M.
\tag{4}
```
Thus this construction has only $`n+1`$ branches but
$`N/M\ge q/2`$. It does not meet the subpolynomial flag-loss requirement.

Alternatively, give branch $`j`$ the flag size
$`M_j=\lfloor N/a_j\rfloor`$, embed its flag into $`[N]`$, and keep the resulting partial target. For $`N\ge q`$, its support fraction within the complete target with flag size $`N`$ is
```math
\rho=
\frac{\sum_j a_j\,q\,\lfloor N/a_j\rfloor}{q^2N}.
\tag{5}
```
If $`N`$ is a multiple of $`q`$, this is exactly
```math
\rho=\frac{n+1}{q}.
\tag{6}
```
In general it is at most $`(n+1)/q`$ and differs from that value by at most $`1/N`$, because the $`A`$-label classes partition $`[q]`$. This is $`q^{-1+o(1)}`$, not the sufficient $`q^{-o(1)}`$ density.

The maps themselves are valid. The deficiency is the retained flag count, not a missing coefficient cancellation.

## 3. Relation to the scalar first-zero identity

The identity
```math
|1^n\rangle=
(|0\rangle+|1\rangle)^{\otimes n}
-\sum_{j=1}^n
 |1\rangle^{\otimes(j-1)}|0\rangle
 (|0\rangle+|1\rangle)^{\otimes(n-j)}
```
uses interference among overlapping vector supports. Construction (2) instead partitions one outer target label and realizes each part exactly. It does not implement that interference on the full four-party target.

To improve (4) or (6), different branches must cancel off-target terms while retaining substantially the same $`AB`$ flag. Encoding an independent outer label in a flag digit and then discarding that digit pays precisely the factor $`a_j`$ in (2). Calling the classes first-zero classes does not eliminate this local dimension cost.

This note therefore supplies a legal partial construction and a quantified failed budget. It supplies no lower bound against other controlled sums, dense $`C`$ maps, or noncommuting flag operators.
