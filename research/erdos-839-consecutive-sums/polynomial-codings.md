# Consecutive sums in sets defined by polynomial fractional parts

Let $P$ be any real polynomial. Let $U$ be a finite union of intervals on the circle $\mathbb R/\mathbb Z$, and put
```math
 B=\{n\ge1:P(n)\bmod 1\in U\}.
```
Suppose $B$ has positive density. Every set $A$ whose symmetric difference with $B$ has upper logarithmic density zero contains a term equal to a sum of at least two consecutive earlier terms. Thus no positive-density polynomial coding of this kind, even with such edits, gives a counterexample to [Erdős #839](https://www.erdosproblems.com/839).

## A free phase for degree at least two

Write $P=Q+R$ with $R$ a rational-coefficient polynomial and $Q$ either constant or a polynomial of degree $d$ with irrational leading coefficient. This is possible by putting the rational coefficients of positive degree into $R$. The fractional part of $R$ is periodic on the integers. Fix a residue class of possible starting positions $n$ modulo a period. If $d\ge1$, the distribution of $P(n)$ there is uniform. Write $u=|U|>0$ for the length of $U$, and let $m$ be the number of its intervals. The whole circle case is immediate, so we can take $m\ge1$ and discard zero-length components in the equidistributed case.

Suppose $d\ge2$. Take a large fixed integer $k$ and let $H=\lceil 2k/u\rceil$. On the chosen progression put $t=P(n)\bmod1$. Record the phases
```math
 P(n+j)-P(n)\quad(0\le j\lt H),\qquad
 P(kn+C)-k^dP(n)\quad(0\le C\le kH)
```
modulo one in a vector $w$. Each coordinate agrees modulo one with a polynomial of degree at most $d-1$ on this progression, since the rational parts there are constant. The limiting distribution of $(t,w)$ is the product of uniform circle measure for $t$ and a probability measure for $w$. Indeed, in the Fourier criterion any nonzero frequency of $t$ leaves a polynomial of degree $d$ with irrational leading coefficient, and its average vanishes by Weyl's theorem. For zero frequency of $t$ all polynomial exponential averages have limits, by the same theorem and decomposition into progressions for rational coefficients.

Fix $w$ in the support of its limiting measure. Vary $t$. Among the $H$ positions, membership in $B$ is now given by $H$ translates of $U$, and the mean count is $uH$. The set of phases giving at least $k$ members has measure at least $u-k/H\ge u/2$. At most $2mH$ boundary points divide the circle into cells of constant membership pattern. In particular there is an open cell of length at least $u/(4mH)$ having $k$ members. Use the first $k$ members, with offsets $j_1,\ldots,j_k$ and $C=\sum_i j_i$. They are consecutive in $B$, and their sum is $kn+C$.

On that same cell the phase of the sum is $k^dt$ plus the already fixed coordinate of $w$ for $C$. For sufficiently large $k$ the length of the cell multiplied by $k^d$ exceeds one. Choose an interior phase putting the sum strictly inside $U$. The prescribed local memberships and the membership of the sum now persist on an open neighborhood of $(t,w)$. By the product distribution and the support condition, a positive lower natural density of starting positions $n$ realizes them. At large $n$ the sum exceeds all its summands.

## Linear and periodic phases

If $d=1$, write $P(n)=\alpha n+c+R(n)$ with $\alpha$ irrational and let $h$ be a period of $R$ modulo one. Use the additive homomorphism
```math
 \phi(n)=(n\bmod h,\alpha n\bmod1).
```
The set $B$ contains the inverse image of a nonempty open set in the product of the finite group and the circle. Choose a smaller open rectangle $V$ of positive measure whose closure is contained in this set. There is a neighborhood $W$ of zero such that $V+W$ is still in the defining set for $B$. Partition the compact group into $D$ pieces, with the difference of two points in the same piece always in $W$.

By equidistribution there are at least $c_0 X$ elements $v\in[X,2X]$ with $\phi(v)\in V$, for some fixed $c_0>0$ and all large $X$. Group the ordered list of all elements of $B$ in this interval in groups of size $K$, with $D/K<c_0/2$. Color each position by the piece containing the image under $\phi$ of the sum of its preceding group elements. Apart from at most $D$ first occurrences per group, each endpoint has an earlier matching color. As in the [residue-class proof](residue-classes.md), the block between the two positions, inclusive, has length between $2$ and $K$. Its sum has image in $V+W$ when its endpoint has image in $V$, and hence belongs to $B$.

For stability under edits we also want bounded physical windows. Insist that each block lie inside one of the consecutive integer intervals of a fixed length $H_0$ partitioning $[X,2X]$. Restart the groups at each interval boundary. This costs at most $D(X/H_0+2)$ additional first occurrences, which is less than $c_0X/4$ for sufficiently large fixed $H_0$ and $X$. Consequently a positive proportion of endpoints give collisions with all summands in their preceding $H_0$ positions. There are finitely many lengths and offsets. The same argument works with just the finite group for a periodic $B$ of positive density, including any permitted endpoints of $U$.

## Stability under changes on a set of logarithmic density zero

In every case the argument supplies a positive lower logarithmic density of integer positions with a collision witnessed inside a fixed window and at a target of the form $kn+C$, with $k$ and $C$ in fixed finite sets. For the linear case this follows by summing the uniform dyadic lower bound, taking the endpoint as $n$ so that $C$ may be negative. If $E$ has upper logarithmic density zero, the same holds for the inverse image of $E$ under each fixed map $n\mapsto kn+C$, $k\ge1$. This follows by bounding $1/n$ by a constant times $1/(kn+C)$ beyond a finite range. Discard starts whose window or target meets $A\mathbin{\triangle}B$. Positive logarithmic mass of witnesses survives, and the witnessed summands stay consecutive in $A$.
