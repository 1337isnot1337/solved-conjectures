# Witness expansion with slack

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This extends the [first-jump dichotomy](WITNESS-EXPANSION-DICHOTOMY.md) to every near-threshold offset, without assuming a fixed core.

## Statement

Suppose an $`r=5t+z`$ uniform family obeys the local span condition and has $`\tau>t`$, where $`1\le z\le t/4`$. Put $`m=t+s`$ for the minimum pair intersection, $`\delta=z-3s+2`$, and $`L=r-m`$. Choose any minimum pair $`A,B`$, and choose witnesses $`E_i`$ for $`\ell=\lfloor m/s\rfloor`$ disjoint $`s`$-cuts of $`A\cap B`$. Write $`U_i,V_i,W_i`$ for their two wings and exterior petals as in [Two-wing balance](TWO-WING-BALANCE.md). Put
```math
\Gamma=3\delta+(17/4)z+\sqrt{(13/2)t\delta}.
```
There are at least $`M=\ell\lfloor t/z\rfloor`$ secondary witness incidences, where a given edge occurs at most once per pivot $`i`$. All these witnesses satisfy
```math
m\le |F\cap A|\le m+2\delta.
```
If $`N`$ distinct edges account for these incidences, some $`k\ge M/N`$ pivots share one secondary edge. For any $`1\le q\le k`$, select $`q`$ of these pivots. Their wings have common sizes bounded below by
```math
\left|\bigcap_i V_i\right|\ge t-(q+1)\delta-B_k,\qquad
\left|\bigcap_i U_i\right|\ge t-(q-1)(4\delta+B_k+\Gamma),
\quad B_k=L/k+\sqrt{L\delta}.
```
The bound on the $`U`$-wings is interpreted as $`t`$ for $`q=1`$.

Consequently, along a hypothetical sequence with $`z=o(t)`$ and $`N=o(\ell\lfloor t/z\rfloor)`$, there are growing collections of pivots with common size $`t-o(t)`$ in each wing. If all distinct $`V_i,V_j`$ have overlap at most $`(1-\epsilon)t`$, put $`h=\lceil\epsilon t-3\delta\rceil`$. Whenever $`h>0`$ and $`h^2>L\delta`$, there must instead be at least
```math
N\ge M\frac{h^2-L\delta}{Lh}
```
distinct secondary edges. In particular, for fixed $`z`$ and $`\epsilon>0`$, this gives $`\Omega(t^2)`$ near-minimum neighbors of $`A`$, throughout the near-threshold range, not only at $`z=1`$.

## Proof

For each $`i`$, set $`Y_i=A\cap E_i`$ and $`\alpha_i=|Y_i|-m`$. The petal lower bound gives $`0\le\alpha_i\le\delta`$. Set $`k_i=|Y_i|-t=s+\alpha_i\le z`$. Since $`|U_i|\ge t`$, use $`\lfloor |U_i|/k_i\rfloor`$ pairwise disjoint $`k_i`$-subsets $`R`$ of $`U_i`$. For each pick an edge $`F`$ missing $`Y_i\setminus R`$. Such an edge exists because the avoided set has size $`t`$. It meets $`Y_i`$, because every pair intersection is a transversal, and therefore the chosen edges at a fixed pivot are distinct. In particular each pivot contributes at least $`\lfloor t/z\rfloor`$ incidences.

Let $`P=F\setminus(A\cup E_i)`$, and let $`\eta=|A\cap F|-m`$. Here $`F\ne A,E_i`$, so $`\eta\ge0`$ and $`|E_i\cap F|\ge m`$. Inclusion-exclusion gives $`|P|\le r-2m+k_i-\eta`$. Pick another selected cut at the same pivot, with corresponding exterior $`P'`$, so $`|P'|\le r-2m+k_i`$. The four edges $`A,E_i,F,F'`$ have empty intersection. Their union has at least $`3r-2`$ vertices; hence $`|P\cup P'|\ge r+m+\alpha_i-2`$. Subtracting gives $`\eta\le r-5m+2k_i-\alpha_i+2=\delta+\alpha_i\le2\delta`$.

Now fix a reused edge $`F`$ and the $`k`$ pivots using it. Put $`D=F\cap(B\setminus A)`$. For each such pivot, [Two-wing balance](TWO-WING-BALANCE.md), specifically its four-edge bound using $`A,E_i,F,B`$, gives $`|D\setminus V_i|\le\delta`$. Also $`F`$ uses at most $`k_i`$ points of $`A\cap E_i`$, so
```math
d_i:=|F\cap W_i|\ge m-k_i-|D|\ge t-\delta-|D|.
```
The sets $`F\cap W_i`$ lie in $`F\setminus A`$, of size at most $`L`$, and pairwise intersect in at most $`\delta`$ vertices. If $`d=k^{-1}\sum_i d_i`$, the second moment of vertex multiplicities gives
```math
(kd)^2\le L\bigl(kd+k(k-1)\delta\bigr).
```
Thus $`d\le L/k+\sqrt{L\delta}=B_k`$, and $`|D|\ge t-\delta-B_k`$. Any $`q`$ of the pivots lose at most $`q\delta`$ points from $`D`$, proving the common $`V`$-wing bound. Every pair in these pivots has $`|V_i\cap V_j|\ge |D|-2\delta`$, hence $`|U_i\cap U_j|\ge t-3\delta-B_k-\Gamma`$ by the balance bound. To pass from pair intersections to a multiple intersection, use the identity
```math
|U_i|=t+(s-|E_i\cap A\cap B|)+\alpha_i,\qquad
0\le |U_i|-t\le\delta .
```
For the last inequality, apply the upper bound $`|W_i|\le r-2m+s-(s-|E_i\cap A\cap B|)-\alpha_i`$ and the lower bound $`r-2m+s-\delta`$. Now the anchor argument gives the common $`U`$-wing lower bound $`t-(q-1)(4\delta+B_k+\Gamma)`$.
When $`z=o(t)`$ and $`k\to\infty`$, both $`\Gamma`$ and $`B_k`$ are $`o(t)`$; taking $`q\to\infty`$ slowly yields the asymptotic conclusion.

For separated $`V`$-wings, if $`k\ge2`$ then $`|D|\le(1-\epsilon)t+2\delta`$, and so each $`d_i\ge h`$. Choose an arbitrary $`h`$-subset of each $`F\cap W_i`$, and apply the same second-moment calculation to these subsets. It gives $`h^2\le L(h/k+(1-1/k)\delta)\le L(h/k+\delta)`$. Thus an edge is reused at most $`Lh/(h^2-L\delta)`$ times. This last upper bound also holds for $`k=1`$ because $`h\le t\le L`$; if an edge is never reused no pair estimate is needed. Summing over all distinct secondary edges proves the count.

The unrestricted problem remains open. This argument supplies a quantitative restriction for imbalanced or sparse near-minimum neighborhoods; it does not eliminate clustered ones.
