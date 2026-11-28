# A minimum-pair witness expansion dichotomy

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
At the first moving jump, a small minimum-pair
component forces tightly clustered witness wings. The
result places a restriction on a sparse search for any
counterexample, without assuming a fixed dense core.

Assume $`r=5t+1`$, $`t\ge6`$, the local span condition,
and $`\tau>t`$. Fix a minimum pair $`A,B`$ and write
$`X=A\cap B`$, $`|X|=t+1`$. Choose arbitrarily a
singleton witness $`E_x`$ for each $`x\in X`$, and write
```math
U_x=E_x\cap(A\setminus B),\quad
V_x=E_x\cap(B\setminus A),\quad
W_x=E_x\setminus(A\cup B).
```
The first two have size $`t`$; the $`W_x`$ are
pairwise disjoint and have size $`3t`$.

For every $`x\in X`$ and every $`a\in U_x`$,
choose a witness $`F_{x,a}`$ for the singleton
cut $`a`$ of the minimum pair $`A,E_x`$.
Let $`N`$ be the number of distinct $`F_{x,a}`$'s.
Then the minimum-pair component of $`A,B`$
has at least $`N+t+3`$ edges, and for some
set $`J\subseteq X`$ of size
```math
k\ge \left\lceil t(t+1)/N\right\rceil
```
the $`V_x`$ with $`x\in J`$ have a common subset
of size at least $`t-4t/k`$. For every
$`1\le\ell\le k`$, one may choose $`\ell`$ of those
indices with common $`U`$-wing of size at least
```math
 t-(\ell-1)(4t/k+4),
```
while retaining the common $`V`$-wing.

In particular, if distinct $`V_x,V_y`$ always
overlap in at most $`(1-\epsilon)t`$ points,
$`0<\epsilon\le1`$, then the component has at
least $`t+3+\epsilon t(t+1)/4`$ edges. Conversely,
a subquadratic component along a sequence of
hypothetical examples forces a growing cluster
whose two wings both have common size $`t-o(t)`$.

## Proof

By saturation, $`E_x`$ is minimum-adjacent to
$`A`$ and $`B`$, and $`B`$ itself is a singleton
witness for $`x`$ to the pair $`A,E_x`$. In that
pair, the $`\delta=0`$ disjoint-petal bound, applied
to $`B`$ and $`F_{x,a}`$, implies
```math
 F_{x,a}\cap(B\setminus A)\subseteq V_x.
```
Indeed, $`B\setminus(A\cup E_x)`$ is the
exterior petal of $`B`$; the two singletons
$`a,x`$ are different. The other witness
cannot use this petal.

The $`F_{x,a}`$'s chosen for different $`a`$
at fixed $`x`$ are distinct, because their
residues in $`A\cap E_x`$ are distinct. They
differ from $`A,B,E_x`$ directly; they also
differ from every $`E_y`$, $`y\ne x`$.
Indeed [two-wing balance](TWO-WING-BALANCE.md)
gives $`|U_x\cap U_y|\ge\lceil(t-3)/2\rceil\ge2`$,
so $`E_y`$ keeps too many points of $`A\cap E_x`$.
All selected $`F_{x,a}`$'s are minimum-adjacent
to $`A`$. This proves the component count.

By averaging, some $`F`$ is used for a set
$`J`$ of at least $`\lceil t(t+1)/N\rceil`$
indices. Set $`D=F\cap(B\setminus A)`$;
we have $`D\subseteq V_x`$ for every $`x\in J`$.
For each such $`x`$, saturation gives
$`|F\cap(E_x\setminus A)|=t`$.
Since $`E_x\setminus A=V_x\sqcup W_x`$,
```math
 |F\cap W_x|=t-|D|.
```
The $`W_x`$'s are disjoint, and $`|F\setminus A|=4t`$.
Thus $`k(t-|D|)\le4t`$, the claimed common $`V`$ bound.
If distinct $`V`$-wings are $`\epsilon t`$-separated
and $`k\ge2`$, this implies $`k\le4/\epsilon`$;
the same upper bound holds trivially for $`k=1`$.

By two-wing balance again, for all distinct
$`x,y\in J`$ we have
```math
 |U_x\cap U_y|\ge |V_x\cap V_y|-4\ge t-4t/k-4.
```
Anchor at any one $`U_x`$ and remove the missing
points for each other chosen index; each such removal
costs at most $`4t/k+4`$, proving the bound for
$`\ell`$. If $`N=o(t^2)`$, then $`k\to\infty`$;
take $`\ell=\lfloor\sqrt{k}\rfloor`$ and use
$`k\le t+1`$ to obtain $`t-o(t)`$ common in both
wings. This does not yet imply a global fixed core
or settle the unrestricted problem.
