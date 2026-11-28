# Marcus’s block-permanent inequality

**For packets of at least 218 internally orthonormal vectors, Marcus’s block-permanent inequality holds for any number of packets, in every complex dimension.** In fact $`\mathop{\mathrm{per}}A>\mathop{\mathrm{per}}|G|`$ whenever there is a nonzero cross-packet inner product. Here $A$ is the Gram matrix of all vectors, $`G_{ij}=\mathop{\mathrm{per}}A_{ij}`$ for the $k\times k$ cross blocks, and the modulus is entrywise. Orthogonality within each packet and positive vector norms suffice by scaling, since the two permanents acquire the same product of squared norms. A zero vector gives zero on both sides. No degree, coherence, rank, redundancy, or total-row-correlation bound is imposed. The [catalogue problem](https://yair-lavi.com/mincs-list/conjecture-9/index.html) also allows arbitrary diagonal blocks.

## A row bound for all correlation matrices

For any complex correlation matrix $C$ with unit Gram vectors $v_i$, put $w_{ij}=|c_{ij}|^2$ for $i\ne j$, $w_{ii}=0$, $t_i=\sum_jw_{ij}$, and $f(t)=\log(1+t^2)$. Then
```math
\sum_i f(t_i)\le 434.04\log\mathop{\mathrm{per}} C.                         \tag{1}
```
This lower bound for a Gram permanent works with arbitrarily uneven and arbitrarily large row energies. In particular the denominator is positive whenever some $t_i>0$. The numerical constant is a convenient bound from the proof.

Let $`L=\{i:t_i\le6\}`$, $H=L^c$, and $S_0=\sum_{i,j\in L}w_{ij}$. Write $`p=\log\mathop{\mathrm{per}}C`$. The [bounded-row correlation estimate](correlation_energy.md) on $C[L,L]$ and monotonicity under adjoining unit Gram vectors give $S_0\le 76.5p$. For $i\in H$ put $q_i=1+\sum_{j\in H}w_{ij}$, and for $i\in L$ put $s_i=\sum_{j\in H}w_{ij}$. Define $D=\sum_{i\in H}\log q_i$, $E=\sum_{i\in L} f(s_i)$.

**Charging the high rows.** Let $`F_L=\sum_{j\in L}v_jv_j^*`$ and $Z=(F_L-I)_+$, its positive spectral part above one. The nonzero eigenvalues of $F_L$ are those of $C[L,L]$, with multiplicity, so
```math
\|Z\|_F^2\le \|C[L,L]-I\|_F^2=S_0.
```
For $i\in H$ put $`z_i=v_i^*Zv_i`$. Then $t_i\le q_i+z_i$. Moreover
```math
\sum_{i\in H}z_i^2/q_i\le\|Z\|_F^2.                                      \tag{2}
```
To see this, the unit rank-one projectors $`v_iv_i^*`$, indexed by $H$, have Hilbert–Schmidt Gram matrix $Y=(|c_{ij}|^2)_{i,j\in H}$ with row sums $q_i$. The matrix $`\mathop{\mathrm{diag}}(q)-Y`$ is a graph Laplacian and is positive semidefinite. Thus the Gram matrix of $`v_iv_i^*/\sqrt{q_i}`$ has operator norm at most one. Its analysis operator is a contraction and (2) follows.

Since $q_i\ge1$, $\log(1+(q_i+z_i)^2)\le\log(1+2q_i^2)+2z_i^2/(1+2q_i^2)\le\log3+2\log q_i+z_i^2/q_i$. Consequently
```math
\sum_{i\in H} f(t_i)\le |H|\log3+2D+S_0,
\qquad |H|\le \frac25(2D+S_0).                                         \tag{3}
```
The second bound uses $f(t_i)>\log37$ on $H$ and $\log(37/3)>5/2$. On the low rows use $f(x+y)\le2f(x)+2f(y)$, from $1+(x+y)^2\le (1+2x^2)(1+2y^2)$, and $f(x)\le x$ for $x\ge0$. Thus $\sum_{i\in L}f(t_i)\le 2S_0+2E$.

**Gaussian estimate.** Let $X$ be exponential of mean one and $h(s)=\max_{0\le\theta\le1}\mathbb E\log(1-\theta+\theta(1+s)X)$. Then $h(s)\ge f(s)/12$ for $s\ge0$. For $0<s\le1$, take $\theta=s/(1+2s)$. Integration by parts gives the expectation as $-\log(1+v)+\mathbb E[(1/s+X)^{-1}]$, where $v=s/(1+s)$. The last term is at least $v$ by Jensen, and $v-\log(1+v)\ge v^2/[2(1+v)]\ge s^2/12$. For $s\ge1$, choose $\theta=1$. Then $\log(1+s)-\gamma-f(s)/12$ is positive at one and increasing by differentiation. At zero use $\theta=0$.

As in the [diagonal-majorant proof](irregular_correlations.md), $`\mathop{\mathrm{per}}C`$ dominates $`\mathbb E\prod_i(1-\theta_i+\theta_i|v_i^*g|^2)`$ for independently chosen damping parameters, by expansion over principal submatrices of $C$. Change the circular complex Gaussian covariance from $I$ to $I+F_H$, where $`F_H=\sum_{i\in H}v_i v_i^*`$. Under this law the form $`v_i^*g`$ has variance $1+q_i$ on $H$ and $1+s_i$ on $L$. The entropy cost of this change is $|H|-\log\det(I+F_H)$. Spectral Jensen for the convex function $\log(1+x)/x$ gives $\log\det(I+F_H)\ge\sum_{i\in H}\log(1+q_i)/q_i$. Choose pure, undamped forms on $H$ and optimize damping individually on $L$. This proves
```math
p\ge\sum_{i\in H}\big[(1+1/q_i)\log(1+q_i)-1-\gamma\big]+E/12
\ge (3/10)D-|H|/5+E/12.
```
For the second inequality the bracket at $q=1$ exceeds $-1/5$ and its derivative with respect to $\log q$ is $1-\log(1+q)/q\ge1-\log2>3/10$. The coarse bounds $0.69<\log2<0.70$ and $\gamma<0.578$ suffice. By (3),
```math
0.14D+E/12\le p+0.08S_0.
```
Also $\log3<1.1$, so combining (3) with the low-row bound gives $\sum_i f(t_i)\le2.88D+2E+3.44S_0$. This is at most $24p+5.36 S_0\le434.04p$ as asserted.

## Relating packet overlaps to row energies

For each packet $i$ put $d_i=\sum_{j\ne i}|G_{ij}|$. For the cross contraction $T=C_{ij}$ put $r_{u,j}=\sum_{v\in j}|c_{uv}|^2$. The [diagonally scaled contraction inequality](packet_scaling.md) gives $|G_{ij}|\le\prod_{u\in i} r_{u,j}^{1/k}$. Hölder’s inequality on the sum over $j\ne i$ therefore yields
```math
d_i\le\prod_{u\in i}t_u^{1/k}.
```
The convex function $x\mapsto\log(1+e^{2x})$ then gives $\log(1+d_i^2)\le k^{-1}\sum_{u\in i}\log(1+t_u^2)$, with zero entries handled by continuity. Since $G_{ii}=1$, the [independent-arrow permanent bound](orthonormal_packets.md) gives
```math
\log\mathop{\mathrm{per}}|G|\le\tfrac12\sum_i\log(1+d_i^2)\le\frac1{2k}\sum_u f(t_u).
```
Equation (1) yields a strict comparison for $k\ge218$ whenever any $t_u>0$. If all $t_u=0$ the full Gram is the identity and both permanents are one.

[Tubbenhauer](https://arxiv.org/abs/2611.22058) treats general packets under a size condition depending on the packet count. Earlier restricted estimates used a bounded number of crossing families or a bound on the full frame operator. [Orthonormal families bound](orthonormal_packets.md) · [Bounded frame-operator bound](correlation_energy.md)

For any complex correlation matrix $C$, apply the arrow bound directly to $C\circ\overline C$, whose off-diagonal row sums are $t_i$. Equation (1) gives the dimension-independent comparison $`\mathop{\mathrm{per}}(C\circ\overline C)\le(\mathop{\mathrm{per}}C)^{217.02}`$. Chollet’s conjectured exponent is two. More generally, the entrywise product of any $k\ge218$ PSD matrices satisfies $`\mathop{\mathrm{per}}(C_1\circ\cdots\circ C_k)\le\prod_{a=1}^k\mathop{\mathrm{per}}C_a`$. Realize the $k$ factors in mutually orthogonal spaces, forming one packet from the vectors with each given label. The full Gram permanent factors and each cross-packet permanent is the corresponding entrywise product. Diagonal scaling and a zero-row argument treat arbitrary norms. The [exact checker](verify_packet_scaling.py) compares 216 rational Gram permanents with (1), including 100 with both row groups present, and tests (2) on rank-one Hilbert–Schmidt inputs. It also tests the scaled contraction bound on 90 rational examples.
