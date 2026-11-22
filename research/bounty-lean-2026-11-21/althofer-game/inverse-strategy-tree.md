# Square-root many positions with logarithmic winning strategies

**Theorem.** Fix a power of three $`q`$ (including 1) and any residue $`a\bmod q`$. For all sufficiently large $`X`$, there are $`\gg_q\sqrt X`$ odd losing starts and $`\gg_q\sqrt X`$ odd winning starts below $`X`$ in that residue class in Althöfer's game. Every start counted by this construction has a winning strategy for the appropriate player within $`O_q(\log X)`$ moves. The statement follows from a single infinite tree of finite strategies and an exact rational certificate.

## Building a tree of losing positions

Start at $`m=1`$, a loss. Given an odd losing $`m`$ coprime to 3, choose $`2\le t\le16`$ and $`b\in\{-1,1\}`$ such that $`w=(2^t m-b)/3`$ is integral. Require $`w>1`$ and $`3\nmid w`$. Choose $`s\in\{-1,1\}`$ so $`n=(2w+s)/3`$ is integral. Retain $`n>1`$ coprime to 3, requiring also that $`t\ge3`$ or $`b=s`$.

Here $`w`$ is the increasing child of $`n`$, and $`m`$ is the decreasing child of $`w`$ since $`t\ge2`$. From $`9n=2^{t+1}m+3s-2b`$ one gets the same shared reply as in the [rank-counting proof](rank-distribution.md). When $`b=s`$, $`n\equiv s\bmod8`$, the other child is $`d=(3n+s)/4`$ and $`3d-s=2^{t-1}m`$. This also works for $`t=2`$. When $`b=-s`$ the restriction $`t\ge3`$ gives $`n\equiv13s\bmod16`$, $`d=(3n+s)/8`$ and $`3d-s=2^{t-2}m`$. In each case $`d>1`$, since the only positive possibilities with $`d=1`$ in these formulas are $`n=1,3`$. Both children of $`n`$ can therefore move to $`m`$. It follows that $`n`$ is losing and $`R(n)\le R(m)+2`$.

From $`n`$ recover $`m`$ uniquely by taking the increasing child and then the decreasing child. This also recovers $`t`$ uniquely. No generated vertex is 1. Thus all descendants of 1 form a tree without identifications, even on edges that decrease size. We work in the subtree rooted at 7, which is generated from 1 with $`t=5`$ and has rank 2.

## An expanding sum on the tree

Set $`C(m)=u(m)/\sqrt m`$. The positive weight on each unit residue $`m\bmod27`$ is given by the following symmetric table. Here $`r=\min(m\bmod27,(-m)\bmod27)`$.

| $`r`$ | 1 | 2 | 4 | 5 | 7 | 8 | 10 | 11 | 13 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| $`u`$ | 71 | 50 | 70 | 35 | 70 | 100 | 49 | 64 | 50 |

Let $`\lambda=101/100`$. Every vertex in the subtree satisfies
```math
\sum_{\text{generated children }n} C(n)\ \ge\ \lambda C(m).
```

For $`m\ge7`$, both admission of each exponent and the resulting residue $`n\bmod27`$ depend only on $`m\bmod243`$. Indeed the two divisions by three require at most two extra ternary digits. The tests $`w>1`$ and $`n>1`$ are then automatic. The [exact checker](check_inverse_tree.py) takes one odd representative of each of the 162 unit residues and evaluates
```math
\frac1{u(m)}\sum_{t\ \text{admitted}} u(n)\frac{3}{2^{(t+1)/2}}.
```
Using $`70/99\le1/\sqrt2`$ for each half power gives a minimum rational lower bound $`74387/70400>211/200`$. Since $`|9n-2^{t+1}m|\le5`$ and $`2^{t+1}m\ge56`$,
```math
n\le(61/56)\,2^{t+1}m/9,\qquad (211/200)^2\ge\lambda^2(61/56).
```
These inequalities give the asserted expansion. The only possible smaller unit vertex in this subtree is 5. Its child 35 alone satisfies $`C(35)\ge\lambda C(5)`$ by squaring. The certificate uses integer and rational arithmetic throughout.

## Counting vertices before a height cutoff

Give the root 7 probability one, and at each vertex choose a child with probability proportional to $`C(n)`$. The probability of reaching a particular vertex $`n`$ at depth $`k`$ is at most $`C(n)/(\lambda^k C(7))`$, by multiplying edge probabilities and using uniqueness of the path.

Take $`Y\ge7`$ and stop a branch at its first value greater than $`Y`$. For paths still below or equal to $`Y`$ at depth $`k`$ without a crossing, all possible endpoints are distinct integers. Their total probability is at most
```math
\frac{100}{\lambda^k C(7)}\sum_{m\le Y}m^{-1/2}
\ \le\ \frac{200\sqrt Y}{\lambda^k C(7)}.
```
Choose $`k=\lceil\log_\lambda(400\sqrt Y/C(7))\rceil`$. At least half the probability has crossed by then. Each first-crossing vertex has probability at most $`100/(C(7)\sqrt Y)`$. Hence there are at least $`C(7)\sqrt Y/200`$ distinct losing vertices at this frontier. Each lies in $`(Y,14565Y]`$ by the one-step size formula, and each has rank at most $`2+2k`$. This already proves the lower bound without a residue restriction. The increasing children of these vertices are distinct winning positions of logarithmic rank by the same construction.

## Prescribing a ternary residue

Use the unit losing frontier vertices $`m`$ just constructed. For a winning vertex in residue $`a\bmod q`$, choose $`3\le t\le 2+2q`$ so $`2^t m\equiv3a+1\bmod3q`$. Such a $`t`$ exists because 2 generates the units. Then $`w=(2^t m-1)/3`$ is a winning start congruent to $`a`$ with a move to $`m`$. Its decreasing move uniquely recovers $`m`$.

For a losing vertex in residue $`a`$, choose a unit residue $`v\bmod3q`$ satisfying $`2v+1\equiv3a\bmod3q`$. Choose $`3\le t\le 2+6q`$ such that $`2^t m\equiv3v+1\bmod9q`$. Then $`w=(2^t m-1)/3`$ is a unit, and $`n=(2w+1)/3`$ is in the prescribed residue. The shared-reply argument with $`s=b=1`$ makes $`n`$ losing and again permits recovery of $`m`$. Here $`n`$ may be a multiple of three because this is the final step. All intermediate states exceed 1 for sufficiently large $`Y`$.

Both maps give distinct starts of size $`O_q(Y)`$ and add at most two moves to the rank bound. Choosing $`Y`$ as a suitable constant multiple of $`X`$ proves the theorem. Whether *all* odd starts have finite rank remains unresolved. [Sponsor’s €500 prize](https://althofer.de/collatz-prizes.html)
