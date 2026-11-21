# Chollet’s conjecture and Marcus’s block-permanent inequality

**Chollet.** Suppose the off-diagonal nonzero entries of each of two complex positive semidefinite Hermitian matrices form a bipartite graph. Their bipartitions may differ. Then
$$
 \operatorname{per}(A\circ B)\le\operatorname{per}A\operatorname{per}B.
$$
There is no bound on the sizes of the two parts, the ranks, or the complex phases.

**Marcus.** Suppose that the Gram vectors of $A$ form two families, each orthonormal, and that every packet of $k$ vectors lies entirely in one family. Put $G_{ij}=\operatorname{per} A_{ij}$ as usual. Then $\operatorname{per}|G|\le\operatorname{per}A$ for $k\ge2$, with strict inequality whenever the cross matrix between the two families is nonzero. Positive diagonal scaling of the Gram vectors preserves the comparison. These results leave [Minc Conjecture 30](https://yair-lavi.com/mincs-list/conjecture-30/) and [Minc Conjecture 9](https://yair-lavi.com/mincs-list/conjecture-9/) open.

## A lower bound from two orthonormal families

Both applications use a correlation matrix
$$
 K(C)=\begin{pmatrix}I_a&C\\ C^*&I_b\end{pmatrix}\succeq0 .
$$
Its two Gram families are orthonormal, so the rectangular cross matrix $C$ is a contraction. Set $t_i=\sum_j|C_{ij}|^2\le1$. We prove
$$
 \operatorname{per} K(C)\ge\exp\!\left(\sum_i t_i\frac{\log(2+2t_i)}{1+2t_i}\right)
 \ \ge\ \prod_i(1+t_i/2).                                           \tag{1}
$$
The last comparison is strict if $C\ne0$. Either family can index the rows.

Here is a polynomial proof of the occupation-number identity behind (1). Choose orthonormal coordinates starting with the row family, with coordinate variables $z_i$. Give complex polynomials the Hermitian inner product in which distinct monomials are orthogonal and $\|z^\alpha\|^2=\alpha!$. A product of linear forms has squared norm equal to the permanent of their Gram matrix, by complex Gaussian pairing or by expanding its monomials. Let $F=\prod_{j=1}^b\ell_j$ be the product of the linear forms for the column family. Its norm is one. Put probability $\alpha!|[z^\alpha]F|^2$ on each multi-index in that orthonormal basis and write $N_i=\alpha_i$. Then
$$
 \operatorname{per}K(C)=\|(\prod_{i=1}^a z_i)F\|^2=\mathbb E\prod_{i=1}^a(1+N_i).
$$
Also $\mathbb EN_i=\|\partial_i F\|^2=t_i$ and
$$
 \mathbb E N_i(N_i-1)=\|\partial_i^2F\|^2
 =4\sum_{j<l}|C_{ij}|^2|C_{il}|^2\le2t_i^2 .
$$
Indeed the products obtained by deleting different column subsets are orthonormal in coordinates adapted to the column family. The inner product is invariant under unitary changes of basis.

For $t=t_i>0$ put probability $h\Pr(N_i=h)/t$ on positive integers $h$. Its mean is at most $1+2t$. The decreasing convex function $g(x)=\log(1+x)/x=\int_0^1(1+ux)^{-1}\,du$ gives $\mathbb E\log(1+N_i)\ge t g(1+2t)$ by Jensen. Applying Jensen once more to the logarithm of the product expectation proves the first inequality in (1), with zero means contributing zero. For $0<t\le1/2$, one has $g(1+2t)\ge(\log3)/2>1/2$. For $1/2\le t\le1$, one has $g(1+2t)\ge(\log4)/3>2\log(5/4)\ge\log(1+t/2)/t$. The strict inequality follows from $4>(5/4)^6$, and the last comparison uses monotonicity of $g$. This gives the strict assertion in (1).

## The matching upper bound

For rectangular $V$ with nonnegative entries and row sums $s_i\le1$,
$$
 \operatorname{per}K(V)
  =\sum_{|I|=|J|}(\operatorname{per}V[I,J])^2
  \le\prod_i(1+s_i).                                                   \tag{2}
$$
The first equality counts permutations moving precisely $I$ and $J$ between the two parts. For fixed $I$, summing the rectangular matching weights over $J$ gives at most $\prod_{i\in I}s_i$, by including all maps from $I$. Each summand lies in $[0,1]$, so the sum of its squares is at most this same quantity. Sum over $I$ to obtain (2). This counting identity needs no positivity of the two-by-two block matrix itself.

Normalize the positive diagonal of a bipartite input $A$ to one, and permute it to $K(C)$. A zero diagonal in a PSD matrix gives a zero row and is immediate. Then $A\circ\bar A=K(V)$ with $V_{ij}=|C_{ij}|^2$. Equations (1), (2), and $1+t\le(1+t/2)^2$ give the self-conjugate form of Chollet. For arbitrary $A,B$, Cauchy–Schwarz on their permutation monomials gives
$$
 |\operatorname{per}(A\circ B)|^2\le
 \operatorname{per}(A\circ\bar A)\operatorname{per}(B\circ\bar B).
$$
Thus both bipartite inputs may have different parts. The same argument pairs a bipartite input with any matrix for which the self-conjugate comparison is known.

## Compressing square packets

For every $k$-square contraction $T$ with $k\ge2$,
$$
 |\operatorname{per}T|\le \|T\|_F^2/k .                              \tag{3}
$$
Let $u$ be the normalized symmetrization of $e_1\otimes\cdots\otimes e_k$. Then $\operatorname{per}T=\langle u,T^{\otimes k}u\rangle$, and its one-factor reduced density is $I_k/k$. Write $T=U S V^*$ with $0\le S\le I$ diagonal. Splitting $S^{\otimes k}$ into square roots and using Cauchy–Schwarz bounds the modulus by the geometric mean of its expectations in $(U^*)^{\otimes k}u$ and $(V^*)^{\otimes k}u$. Both states still have one-factor density $I_k/k$. Pointwise for $0\le s_j\le1$,
$$
 \prod_{j=1}^k s_j\le \left(\frac1k\sum_j s_j^2\right)^{k/2}
 \le \frac1k\sum_j s_j^2 .
$$
The resulting operator inequality bounds each expectation by $\operatorname{tr}(S^2)/k$, proving (3).

Now partition both families into packets. The matrix $|G|$ has identity diagonal blocks on the two families and cross matrix $V_{IJ}=|\operatorname{per}C[I,J]|$. By (3), its row sum for packet $I$ is at most $k^{-1}\sum_{i\in I}t_i\le1$. Equation (2) and the elementary product inequality give
$$
 \operatorname{per}|G|\le \prod_I(1+k^{-1}\sum_{i\in I}t_i)
 \le \prod_i(1+t_i/2)\le\operatorname{per}A.
$$
For $k=1$ the original Marcus inequality is an identity. For $k\ge2$, (1) gives strictness unless $C=0$, when the matrix is the identity before diagonal rescaling.

## Prior scope

Pant and Singh's Theorem 3.1 gives a stronger estimate when one input is a real bipartite symmetric $Z$-matrix. Its sign hypothesis makes every contributing cycle weight nonnegative. Schubr's November 13 fourth edition proves the stronger self-comparison on complex bipartite supports with one part of size at most five. The October 28 edition also gives an ordinary self-comparison when one part has size at most twelve. Their stronger comparison replaces one permanent factor by the product of diagonal entries. We prove the ordinary comparison for all bipartite complex inputs. The symmetric-tensor and occupation identities used here are classical. The source search did not certify priority for (1) or its two consequences. [Pant and Singh](https://arxiv.org/html/2604.24192v2#S3), [Schubr, fourth edition](https://research.luminaryoddities.org/strong-energy-bounded-permanent-inequalities-bipartite-supports/v/4), [Schubr, third edition](https://research.luminaryoddities.org/strong-energy-bounded-permanent-inequalities-bipartite-supports/v/3), [linear-optics permanent identities](https://academic.oup.com/nsr/article/6/4/719/5435523), [Tubbenhauer's packet theorem](https://arxiv.org/abs/2611.22058)

The [exact occupation replay](verify_occupation.py) compares polynomial coefficients with independently computed Gram permanents over the Gaussian rationals. It also tests the two factorial moments, the packet contraction estimate, rectangular compressions, and full unitary inputs.

The [orthonormal packet theorem](orthonormal_packets.md) removes the monochromatic-packet assumption for bipartite Gram support and gives a packet-size criterion for any number of orthonormal families.
