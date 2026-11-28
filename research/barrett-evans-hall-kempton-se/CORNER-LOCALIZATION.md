# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**Partial result: asymptotic localization of counterexamples.** Let $x,y$ be a weighted graph’s two complementary algebraic connectivities. There is an absolute constant $C$ such that, for all sufficiently large $n$, any violation of $x+y-2xy/n\ge1$ must satisfy $`\min\{x,y\}\le Cn^{-1/3}`$. This excludes every fixed compact subarc of the proposed lower frontier away from its corners, even when arbitrarily many edge weights are fractional. It does not rule out the corner regime.

The input from [Einollahzadeh–Karkhaneei](https://arxiv.org/abs/1901.02047) is their unweighted bound $`\max\{\lambda_2(K),\lambda_2(K^c)\}\ge1-\varepsilon_n`$ for every simple graph $K$ on $n$ vertices, with $\varepsilon_n=O(n^{-1/3})$. Take $\varepsilon_n\ge0$. The ordinary weighted spread bound $x+y\ge1$ follows from their unweighted sum bound by expressing the weighted Laplacian as an average of unweighted Laplacians: each of the two second eigenvalues is concave in the weights by its Rayleigh characterization.

## Two nearly disconnected endpoint supports cannot switch on one edge

Let $H$ be a simple graph with missing edge $e=uv$, and put $J=(H+e)^c$. Thus $H,J$ partition all unordered pairs except $uv$. Define
```math
x_0=\lambda_2(H),\quad x_1=\lambda_2(H+e),\qquad
y_0=\lambda_2(J+e),\quad y_1=\lambda_2(J).
```
We show that if at least one of $H,J$ is connected, then $x_0+y_1\ge1/100$, provided $n\ge202$ and $\varepsilon_n\le1/100$.

Suppose $x_0+y_1<1/100$. The unweighted maximum theorem gives $x_1,y_0\ge99/100$ by applying it to $J$ and $H$. With mean-zero unit Fiedler vectors $a$ of $H$ and $b$ of $J$, Rayleigh test vectors after adding the missing edge show that
```math
|a_u-a_v|,\ |b_u-b_v|\ge \sqrt{98/100}>98/100.
```
Choose $z$ different from $u,v$ for which $a_z^2+b_z^2\le2/(n-2)\le1/100$ by averaging. Each of the pairs $zu,zv$ is an edge in one of $H,J$. The energy of each individual edge of $H$ in $a$ is at most $x_0<1/100$, and the analogous bound for $J$ on $b$ is $y_1<1/100$. Therefore at each of $u,v$, at least one of the absolute $a,b$ coordinates is at most $1/5$.

Since both coordinate differences exceed $98/100$, the large $a$ and $b$ coordinates must occur at opposite endpoints. After renaming them, $|a_u|>78/100$ and $|b_v|>78/100$. If $H$ is connected, $u$ has a neighbor $w$ in $H$, and the edge energy bound forces $|a_w|>68/100$. But $(78/100)^2+(68/100)^2>1$, impossible in a unit vector. If $J$ is connected the same argument at $v$ with $b$ gives the contradiction.

## From endpoint separation to the claimed localization

By the [one-fractional-edge reduction](ONE-FRACTIONAL-EDGE.md), any violation has a violation with no larger pair of connectivities and at most one fractional edge. First consider a rounded violation. If it is unweighted, the maximum theorem immediately places one connectivity within $\varepsilon_n$ of $1$, and the conjectured inequality’s failure then puts the smaller one at most $2\varepsilon_n$ for $n\ge5$.

Otherwise let the edge weight be $t\in(0,1)$, and use the endpoint notation above. If $H,J$ are both disconnected, there is no violation by the opposite-endpoint classification. Thus $x_0+y_1\ge1/100$. Write $m=\min(x,y)$ and $M=\max(x,y)$. Failure of the conjectured inequality implies $x,y<1$ and
```math
M<1-(1-2/n)m,\qquad x+y<1+2m/n.
```
If $m<4\varepsilon_n$ we are done. Otherwise $x_0\le x$ and $y_1\le y$ are both below $1-\varepsilon_n$, so the unweighted maximum theorem again gives $x_1,y_0\ge1-\varepsilon_n$. A rank-one update by an edge weight $\Delta$ changes either connectivity by at most $2|\Delta|$. Comparing $y_0$ to $y$ and $x_1$ to $x$ now gives
```math
t,\ 1-t\ \ge \frac{(1-2/n)m-\varepsilon_n}{2}\ge m/8.
```
Concavity in the weights gives
```math
x+y\ge (1-t)(x_0+y_0)+t(x_1+y_1)
\ge 1-\varepsilon_n+(m/8)(x_0+y_1).
```
Consequently $m/800\le\varepsilon_n+2m/n$, so $m\le1600\varepsilon_n$ for $n\ge3200$.

Finally, if an arbitrary weighting violates the inequality with smaller value $`m_*`$, its larger value is below $`1-(1-2/n)m_*`$. A coordinatewise nonincreasing rounding also has its larger value below this number. The ordinary weighted spread bound forces the rounded smaller value to be at least $`(1-2/n)m_*`$. The bound just proved on the rounded smaller value yields $`m_*=O(n^{-1/3})`$.

The result is a structural reduction: a full proof still needs an inequality that controls the small connectivity at the corners in relation to the deficit from $1$ of the larger connectivity.
