# Marcus’s block-permanent inequality

For a positive semidefinite complex Hermitian Gram matrix $A$ of $mk$
vectors, group the vectors into $m$ packets of size $k$ and write
$G_{ij}=\operatorname{per} A_{ij}$. The inequality
$\operatorname{per}A\ge\operatorname{per}G$ holds in **complex rank at
most two for all $m,k$**. In fact it is strict for $m\ge4$, $k\ge2$
when every vector is nonzero. The elementary estimates below also give
a rank-dependent sufficient condition in arbitrary order. They leave
[Minc Conjecture 9](https://yair-lavi.com/mincs-list/conjecture-9/index.html)
open for general complex Gram matrices.

## Packet estimate

A zero vector makes both permanents zero. Rescaling the other vectors
to unit length divides both permanents by the same factor. For unit
vectors $v_{ia}$ define
$S_i=\sum_a v_{ia}v_{ia}^*$, $S=\sum_i S_i$, and $N=mk$. In any rank,

```math
\operatorname{per}G
\le m!(k!)^m\left(\frac{\operatorname{tr}S^2}{N^2}\right)^{m/2}. \tag{1}
```

Indeed, the [Carlen–Lieb–Loss permanent inequality](https://arxiv.org/abs/math/0508096)
bounds the absolute permanent of a $d$-square matrix $D$ by
$d!\,d^{-d/2}$ times the product of its row norms. By the arithmetic–
geometric mean inequality this is at most $d!(\|D\|_F/d)^d$.
Apply it to the cross Gram $A_{ij}$. Its squared Frobenius norm is
$\operatorname{tr}(S_i S_j)$, which is between zero and $k^2$ since
the vectors are unit. Thus

```math
|G_{ij}|^2\le(k!)^2
\left(\frac{\operatorname{tr}(S_i S_j)}{k^2}\right)^k
\le(k!)^2\frac{\operatorname{tr}(S_i S_j)}{k^2}.
```

Summing over $i,j$ and applying the same permanent bound to $G$ proves (1).
In particular this proof uses complex moduli also for off-diagonal blocks.

## The tilted sphere comparison

Embed a Gram representation of rank at most two in $\mathbb C^2$.
The two eigenvalues of $S$, allowing zero, are $N(1\pm x)/2$ with
$0\le x\le1$. Hence $\operatorname{tr}(S^2)/N^2=(1+x^2)/2$.
Write $u$ for a uniform unit vector in $\mathbb C^2$ and $w$ for a unit
top eigenvector of $S$. Complex Gaussian pairing and the radial moment
give $\operatorname{per}A=(N+1)!\,\mathbb E F(u)$, where
$F(u)=\prod_{i,a}|v_{ia}^*u|^2$. The tilt with density $D=2|w^*u|^2$
gives

```math
\operatorname{per}A\ge
\tfrac12 (N+1)!\exp(-N+Nx/2+1/2).                         \tag{2}
```

This is [Ma, Proposition 3.2](https://arxiv.org/html/2609.37461v1#S3),
specialized to ambient dimension two. Directly, for a unit $v$,
$T=|v^*u|^2$ is uniform on $[0,1]$. Given $T$, the conditional mean of
$|w^*u|^2$ is $cT+(1-c)(1-T)$ with $c=|v^*w|^2$, by phase invariance.
Integrating gives $\mathbb E D\log T=c-3/2$ and
$\mathbb E D\log D=\log2-1/2$. Jensen applied under the tilted measure
to $F/D$ yields (2), since the sum of the $c$ is the top eigenvalue of $S$.

Dividing (2) by the right side of (1) gives the lower bound

```math
K_{m,k}\,\frac{e^{Nx/2}}{(1+x^2)^{m/2}},\qquad
K_{m,k}=\frac{(mk+1)!\,e^{-mk+1/2}\,2^{m/2}}{2m!(k!)^m}.
```

The $x$-dependent factor is at least one: its logarithmic derivative is
$mk/2-mx/(1+x^2)\ge0$. For $m\ge4$, $k\ge2$ one has $K_{m,k}>1$.
At $(4,2)$ it equals $1890 e^{-15/2}>1$, using $e<68/25$ and
$(68/25)^{15}<1890^2$. At fixed $m\ge4$ increasing $k$ by one
multiplies it by at least $[(mk+2)/(e(k+1))]^m>1$. At $k=2$
increasing $m$ by one multiplies it by $\sqrt2(2m+3)/e^2>1$.
Thus (1) and (2) give strict dominance on this entire range.

When $m=1$ or $k=1$ the two sides coincide. For $m=2$ the inequality
is [Lieb's two-block theorem](https://www.jstor.org/stable/24901474).
For $m=3$ the [Tubbenhauer preprint](https://arxiv.org/abs/2611.22058)
covers every packet size even at unrestricted rank. This last input
is a published preprint claim; its full web-calculus proof has not been
replayed here. When positive definite diagonal blocks are requested in
rank two and $k\ge2$, necessarily $k=2$. For $m=3,k=2$ the stronger
rank-two margin stated on the catalogue page supplies strictness; for
$m=2$ the equality clause is Lieb's. No unproved equality statement in
arbitrary rank is used.

## Growing ranks and the unresolved regime

In arbitrary rank $r$, [Ma, Lemma 3.1](https://arxiv.org/html/2609.37461v1#S3)
gives $\operatorname{per}A\ge(r)_N e^{-N H_{r-1}}$, with rising
factorial and harmonic number $H_0=0$. Comparison with (1) gives an
explicit sufficient test for C9. In particular every fixed $k\ge2$
admits *all* matrices of ranks $r=o(m^{1-1/k})$ for all sufficiently
large $m$. Indeed $(r)_N\ge N!$, $H_{r-1}\le1+\log r$ and
$\operatorname{tr}(S^2)\le N^2$. Using $N!\ge(N/e)^N$ and $m!\le m^m$,
the ratio between the resulting lower and upper bounds is at least

```math
\left[\frac{k^k m^{k-1}}{e^{2k}k!r^k}\right]^m,
```

which eventually exceeds one. Linear-rank inputs are outside this
argument. Already for an orthonormal family, $G=I$, actual equality holds,
and these estimates need not be close.

## Prior work and relation to the catalogue

The Gaussian sphere bound, its tilt, and the permanent row-norm theorem
are prior work. Tubbenhauer also covers four packets in all ranks, five
packets of size at least three, and a large-packet-size regime. The
[catalogue for Lieb's conjecture](https://yair-lavi.com/mincs-list/conjecture-42/)
and the [primary manuscript for real rank two](https://github.com/blueberryvertigo/permanent-on-top-rank-two)
report a stronger theorem for *real* rank-two inputs. The bounds above
include arbitrary complex phases. The
[September MI-12 dossier](https://github.com/ajt60gaibb/OpenProblemsInNLA/tree/main/matrix-inequalities-and-norms/MI-12)
and [Wanless's survey](https://arxiv.org/abs/2202.01867) concern the
unrestricted question. Searches using the block-permanent, wreath-product,
rank-two, symmetric product and sphere-bound formulations found these
related results. Priority of the combined rank test is unverified. The
unrestricted numbered entry receives no credit from this partial theorem.
