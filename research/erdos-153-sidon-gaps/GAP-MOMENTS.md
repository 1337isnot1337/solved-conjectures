# Erdős–Sárközy–Sós conjecture

## Gap moments and the limitation of the two-source construction

The logarithm in the [whole-span construction](LOGARITHMIC-UPPER.md) comes from genuine gaps across all dyadic edge scales, not from a loss in the upper-bound proof. More precisely, fix $r>1$. Write $M_r(A)=|A+A|^{-1}\sum d^r$, over the actual positive consecutive gaps. Under the coefficient and lift law of that construction,
```math
 \mathbb E M_r(A) \asymp_r
 \begin{cases}
 1,&1\lt r<2,
 \\ \log n,&r=2,
 \\ n^{r-2},&r>2.
 \end{cases}
```
The lower bounds hold for **every** outcome. In particular the full-span gap moment of any fixed order strictly between one and two can stay bounded for integer Sidon sets with $n$ elements, but no choice of the coefficients or digits of this construction can give a counterexample at order two. This is not a lower bound on arbitrary Sidon sets.

### Upper bounds

For an integer gap of size $g$, put $w_h=(h+1)^r-2h^r+(h-1)^r$. The telescoping identity
```math
 g^r=g+\sum_{h=1}^{g-1} w_h(g-h)
```
expresses its moment in terms of empty consecutive windows in its interior. For fixed $r>1$, $0\le w_h\ll_r h^{r-2}$, by the second difference formula (or separately evaluating $h=1$). In the two-source proof a block of $p$ sites has a window-void bound $O(\min(1,(p/(mh))^2))$ with depth parameter $m\ge1$. Thus its expected clipped $r$-energy is at most
```math
 O_r\left(p+p\sum_{h=1}^p h^{r-2}\min\left(1,\left(\frac{p}{mh}\right)^2\right)\right).
```
Writing $u=p/m\ge1$ and splitting at $h=u$, the sum is $O_r(u^{r-1})$ for $1<r<3$, $O(u^2\log(2m))$ for $r=3$, and $O_r(u^2p^{r-3})$ for $r>3$. Since $m$ is comparable to the row depth, there are $O(1)$ blocks per depth, and $p\asymp n$, the sums over the tiled interval are respectively $O_r(p^2)$ for $r<2$, $O(p^2\log n)$ for $r=2$, and $O_r(p^r)$ for $r>2$. At $r=3$ this uses the convergence of $\sum_{m\ge1}\log(2m)/m^2$.

The exponential tail of the greatest empty-block depth gives bounded $\mathbb E(D+1)^r$. The outside pieces contribute at most $O_r(p^r(D+1)^r)$ before expectation. This does not dominate the block bound in any of the ranges. Merging at most $k$ pieces multiplies $r$-energy by at most $k^{r-1}$, for $k=2,3$ as in the square-moment proof. Passing from the projected sites to tagged representatives scales the gaps by at most twelve and costs at most $2\cdot4^r$ for edge extensions. This proves the upper bounds after normalization.

### A scale-by-scale lower bound

Let $X=A-\min A$. The explicit placement puts $a_i$ in an interval of fixed length $O(p)$ about $16pi$, and $\min A=O(p)$. It follows that for each $x\ge p$, the prefix $X\cap[0,2x]$ has size $O(x/p)$. The span of $X+X$ is $\gg pn$ for sufficiently large $n$. For any interval $[x,2x]$ with $p\le x$ and $2x$ at most this span, every site in it uses two endpoints in that prefix. There are at most $O((x/p)^2)$ such sites. Inserting the two endpoints of the interval clips its gaps to pieces of total length $x$; since the number of pieces is $O((x/p)^2)$, Hölder gives a clipped $r$-energy of at least
```math
 \Omega_r\left(p^{2r-2}x^{2-r}\right).
```
The clipped energies on disjoint intervals add to at most the true $r$-energy, because $r>1$. Take $x\asymp pn$ for $r<2$, all dyadic $x$ from $p$ up to a sufficiently small constant times $pn$ for $r=2$, and $x=p$ for $r>2$. Divide by $n(n+1)/2$ to conclude.

The same lower-bound mechanism at $r=2$ applies to any size-$`n`$ integer Sidon family with prefix count $O(1+x/n)$ at one endpoint on the intermediate scales $n\le x\le c n^2$ (or to its reflection). Altering only which low digits are used leaves that prefix hypothesis intact. To get bounded square cost, a new construction must increase endpoint counts on some of those scales, not just randomize low digits more thoroughly.
