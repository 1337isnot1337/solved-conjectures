# Marcus’s block-permanent conjecture

Let $A$ be the complex Gram matrix of unit vectors in $m$ packets of size $k$, each packet internally orthonormal. Suppose the entire collection can also be partitioned into $q\ge2$ orthonormal families. These two partitions may cross arbitrarily. Put $d=q-1$ for even $q$ and $d=q$ for odd $q$. If $k\ge2d$, then
```math
 \mathop{\mathrm{per}} |G|\le\mathop{\mathrm{per}} A,
 \qquad G_{ij}=\mathop{\mathrm{per}} A_{ij}.
```
Here the absolute value is entrywise. Equality holds exactly when $A=I$. Positive diagonal scaling gives the corresponding statement for nonzero orthogonal vectors of arbitrary lengths. In particular every packet size $k\ge2$ works for a bipartite Gram support whenever each packet is independent in that support. Neither a bound on rank nor a bound on the number of packets is needed. The [previous two-family result](orthonormal_families.md) required each packet to lie entirely in one family.

## An upper bound for the packet permanent

For every nonnegative square matrix $W$ with zero diagonal and row sums $s_i$,
```math
 \mathop{\mathrm{per}}(I+W)\le\prod_i (1+s_i^2)^{1/2}.                  \tag{1}
```
To prove this, independently in every nonzero row choose column $j$ with probability $w_{ij}/s_i$ and put the whole weight $s_i$ there. Leave zero rows empty. Row multilinearity expresses the left side as the expectation of the permanent after these choices. In a fixed outcome the nontrivial cycles are vertex disjoint, so this permanent is the product of $1+\prod_{i\in D}s_i$ over its directed cycles $D$. For a cycle of length $l\ge2$, Hölder applied to the two coordinates of each vector $(1,s_i)$ gives $1+\prod_{i\in D}s_i\le\prod_{i\in D}(1+s_i^l)^{1/l}\le\prod_{i\in D}(1+s_i^2)^{1/2}$. The factors at vertices outside cycles are at least one. This proves (1), with equality possible for arbitrary equal weights on disjoint pairs. The independent-arrow representation also occurs in [Zhang's matching formula for Schur products](https://github.com/mxym/math/blob/079a6c2b729ef37f82a00cb6e4888ed3060046b0/research/weighted-chollet-matching/paper.tex).

Write $H=\sum_{u<v}|a_{uv}|^2$ and $s_i=\sum_{j\ne i}|G_{ij}|$. Each cross Gram $A_{ij}$ is a contraction between orthonormal packets. For every square contraction $T$ of size $k\ge2$, $|\mathop{\mathrm{per}} T|\le \|T\|_F^2/k$, as proved by splitting its singular values on the [symmetric tensor](orthonormal_families.md). Summing over ordered packet pairs gives $\sum_i s_i\le2H/k$. The diagonal of $|G|$ is one.

We use $\log(1+x^2)\le2x/\sqrt5$ for $x\ge0$. Indeed $\log y\le(y-1)/\sqrt y$ for $y\ge1$ by differentiation, which suffices on $0\le x\le2$. On $x\ge2$ the ratio $\log(1+x^2)/x$ decreases. Its derivative has the sign of $2x^2/(1+x^2)-\log(1+x^2)$, which decreases for $x>1$ and is negative at $2$. For the latter sign, $\log 5>8/5$ follows from the first four terms of $2\sum_{j\ge0}(2/3)^{2j+1}/(2j+1)$. Thus (1) implies
```math
 \log\mathop{\mathrm{per}}|G|\le \frac{2H}{k\sqrt5}.                   \tag{2}
```

## A lower bound from the family partition

The [occupation-number bound](orthonormal_families.md) gives, for two orthonormal families with cross Gram $C$,
```math
 \log \mathop{\mathrm{per}}
 \begin{pmatrix}I&C\\ C^*&I\end{pmatrix}
 \ge \frac{\log4}{3}\|C\|_F^2 .
```
Indeed each row energy $t_i$ is at most one, and $\log(2+2t)/(1+2t)$ is decreasing for $0\le t\le1$. Write $H_{ab}$ for the sum of squared moduli between distinct families $a,b$. Internal orthogonality gives $\sum_{a<b}H_{ab}=H$. Choose a uniformly random perfect matching of the family indices, adjoining one empty family if $q$ is odd. Every pair of original families is matched with probability $1/d$. For each matching, partition the original matrix into the corresponding pairs of families. Lieb's principal-block permanent inequality bounds its permanent below by the product of the paired permanents. Taking logarithms and averaging gives
```math
 \log\mathop{\mathrm{per}} A\ge\frac{\log4}{3d}H.                      \tag{3}
```
The same argument permits the maximum-weight matching on the family indices in place of its expected weight $H/d$. Now $1/\sqrt5<\log 4/3$ since $\log2>2(1/3+1/81)$ by its positive series. Thus (2) is strictly smaller than (3) for $H>0$ and $k\ge2d$. At $H=0$ both permanents are one.

The [catalogue](https://yair-lavi.com/mincs-list/conjecture-9/index.html) asks about arbitrary PSD block matrices. [Tubbenhauer's theorem](https://arxiv.org/abs/2611.22058) bounds the required packet size in terms of the number of packets and also treats several small packet counts. Here the sufficient size depends only on the number of orthonormal families. The source search covered both formulations, the independent-arrow bound, and Gram permanent inequalities. Independent priority for this restricted theorem is unconfirmed.

The [exact checks](verify_orthonormal_packets.py) evaluate (1) by rational arithmetic, including equality on paired rows, and compare the two block permanents on Gram examples with crossing partitions.
