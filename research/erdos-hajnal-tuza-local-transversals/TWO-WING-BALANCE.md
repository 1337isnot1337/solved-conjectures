# A two-wing balance condition for Erdős–Hajnal–Tuza petals

Partial progress on [Erdős Problem #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
There is no dense-core assumption. In addition to the near-threshold
petal union bound, the overlap of any two disjoint-cut petals must
be spread across both wings of the minimum pair. The unrestricted
transversal problem is not resolved here.

## Statement

Take a finite $`r`$-uniform family in which every subfamily spanning
at most $`3r-3`$ vertices has a common vertex. Suppose its transversal
number exceeds $`t`$, with $`r=5t+z`$ and $`1\le z\le t/4`$.
Fix a minimum pair $`A,B`$, with $`X=A\cap B`$ of size $`m=t+s`$.
For each $`s`$-set $`S\subseteq X`$ choose a witness $`E_S`$ that
avoids $`X\setminus S`$, and put
```math
U_S=E_S\cap(A\setminus B),\quad V_S=E_S\cap(B\setminus A),
\quad W_S=E_S\setminus(A\cup B),\quad \delta=z-3s+2 .
```
By [Near-threshold petals](NEAR-THRESHOLD-PETALS.md), $`\delta\ge0`$
and disjoint $`S,S'`$ have $`|W_S\cap W_{S'}|\le\delta`$.
Write $`a=|U_S\cap U_{S'}|`$, $`b=|V_S\cap V_{S'}|`$. Then
```math
 |a-b|\le 3\delta+\frac{17}{4}z+\sqrt{\frac{13}{2}t\delta}.
```
In particular as $`z=o(t)`$, both $`a`$ and $`b`$ are at least
$`t/2-o(t)`$, uniformly over the disjoint cuts. At $`z=1`$,
the sharper conclusion is $`|a-b|\le4`$, so both overlaps
are at least $`\lceil(t-3)/2\rceil`$.

## Proof

Fix disjoint $`S,S'`$, and abbreviate $`E=E_S`$, $`E'=E_{S'}`$.
Put
```math
 \alpha=|A\cap E|-m,\quad \beta=|B\cap E|-m,\quad
 u=|X\cap E|\le s,\quad \alpha'=|A\cap E'|-m .
```
The minimum-pair definition gives nonnegativity. The exterior
bound $`|W_S|\ge3t+2s-2`$, together with
$`|W_S|=r-2m-\alpha-\beta+u`$, gives
$`\alpha+\beta\le\delta`$; similarly $`\alpha'\le\delta`$.

Now pivot to the pair $`A,E`$. Its intersection $`Y=A\cap E`$
has size $`m+\alpha=t+k`$, where $`k=s+\alpha\le z`$.
Let $`n=|U_S|=m+\alpha-u\ge t`$, so $`n>2k`$.
For every $`k`$-set $`R\subseteq U_S`$, choose an edge $`F_R`$
avoiding $`Y\setminus R`$. This is possible since the latter
has size $`t`$. Every pair intersection in the family is a
transversal (Near-threshold petals, §1), so $`F_R`$ does meet
$`Y`$. In particular for disjoint $`R,R'`$ the two witnesses
are different. Write $`P_R=F_R\setminus(A\cup E)`$.
By minimality of $`m`$,
```math
 |P_R|\le r-2m+k,\qquad |B\setminus(A\cup E)|=r-2m-\beta+u.
```
The four edges $`A,E,F_R,B`$ have empty intersection:
$`F_R`$ meets $`Y`$ only in $`R\subseteq A\setminus B`$.
Thus their union has size at least $`3r-2`$. Its part outside
$`A\cup E`$ has size at least $`r+m+\alpha-2`$.
Subtracting yields
```math
 |P_R\cap(B\setminus(A\cup E))|
 \le r-5m+k-\alpha-\beta+u+2 \le\delta.
```
The same computation for $`A,E,F_R,F_{R'}`$ at disjoint cuts
gives
```math
 |P_R\cap P_{R'}|\le r-5m+2k-\alpha+2=\delta+\alpha.
```

Let $`J=W_{S'}\setminus W_S`$, of size $`L`$.
The part of $`F_R\cap E'`$ in $`X`$ has at most
$`u'=|X\cap E'|`$ points. In the $`A`$-wing its size is at most
$`|U_{S'}|-a+|R\cap U_{S'}|`$: inside $`U_S`$, $`F_R`$ can only
use $`R`$. In the $`B`$-wing its size is at most $`b+\delta`$,
by the bound on $`P_R\cap(B\setminus(A\cup E))`$. Outside
$`A\cup B`$, at most $`\delta`$ points lie in $`W_S`$, and all
others in $`J`$ lie in $`P_R`$. Since $`u'+|U_{S'}|=m+\alpha'`$
and $`|F_R\cap E'|\ge m`$ when the two edges are distinct,
we obtain
```math
 |P_R\cap J|\ge a-b-\alpha'-2\delta-|R\cap U_{S'}|.
```
The same inequality also holds if $`F_R=E'`$, since then the
intersection size is $`r\ge m`$. This possibility occurs for
some choices and is not excluded in the argument.

Set $`Q=\mathbb E_R|P_R\cap J|`$, over all $`k`$-cuts. Then
```math
 Q\ge a-b-3\delta-ka/n .
```
Apply the Kneser indicator inequality (Near-threshold petals, §3)
to $`P_R\cap J`$, indexed by the $`k`$-subsets of the $`n`$-set
$`U_S`$. For each $`x\in J`$ let $`f_x`$ be the fraction of
cuts whose exterior uses $`x`$. The intersecting-count bound
on disjoint cuts gives
```math
 Q^2\le L\sum_x f_x^2
      \le L\bigl[(1-k/n)(\delta+\alpha)+(k/n)Q\bigr].
```
If $`L=0`$ this just says $`Q=0`$. In all cases,
```math
 a-b\le3\delta+\frac{ka}{n}+\frac{Lk}{n}
                 +\sqrt{L(1-k/n)(\delta+\alpha)}.
```
Here $`a\le n`$, $`k\le z`$, $`n\ge t`$,
$`L\le r-2m+s\le13t/4`$, and $`\alpha\le\delta`$.
The displayed balance bound follows, including the opposite
direction by exchanging $`A`$ and $`B`$. Also
$`a+b\ge m-\delta`$, since the disjoint-cut witnesses intersect
in no point of $`X`$ and at most $`\delta`$ exterior points.
This gives the asymptotic conclusion.

At $`z=1`$, $`s=1,\delta=0,\alpha=\beta=0,u=1`$, and
$`n=t,k=1,L=3t`$. The exact inequality gives $`a-b\le3+a/t\le4`$.
For $`t\le4`$ the same conclusion is automatic from the wing
sizes, so this last claim does not need $`n>2k`$ there.
