# Wang's vanishing Hadamard permanents problem

The following tensor congruence proves nonvanishing for products of bordered difference-set matrices subject to a base-prime condition. It also explains an obstruction to the translation argument for second-kind Paley matrices. The unrestricted [Problem 5](https://yair-lavi.com/mincs-list/problem-5/) remains open.

## Translation and the fixed block

Let a finite group $G$ of order $q>1$ act on both index sets of an integer square matrix $M$ preserving its entries. Suppose each index set is a union of fixed points and free $G$-orbits, with equally many fixed points on the two sides. Write $F$ for the fixed-row, fixed-column block and $C$ for its complementary block. Then

```math
\mathop{\mathrm{per}} M\equiv \mathop{\mathrm{per}} F\,\mathop{\mathrm{per}} C\pmod q. \tag{1}
```

Indeed, the terms from bijections that map the fixed rows onto the fixed columns sum to the product on the right. Each remaining bijection sends some fixed row to a column in a free orbit. Only the identity can stabilize this bijection under the simultaneous action. Every remaining orbit thus has size $q$ and constant weight. This proves (1) even for nonabelian groups and composite $q$.

Now assume $q=p^e$ is a prime power. Choose origins in the free orbits and identify each with $G$ via left multiplication. For free row orbit $i$ and free column orbit $j$, let $s_{ij}$ be the sum of entries of a single row over the columns of that orbit. With $S=(s_{ij})$ we have

```math
\mathop{\mathrm{per}} C\equiv \mathop{\mathrm{per}} S\pmod p. \tag{2}
```

Every non-singleton orbit of bijections between the free indices has size divisible by $p$. A fixed bijection pairs the row orbits with the column orbits and uses an equivariant map within each pair. All such maps have the form $x\mapsto xh$ for $h\in G$. Its contribution over one paired orbit is $c_{i1,jh}^q$, congruent to $c_{i1,jh}$ modulo $p$. Summing over the choices of $h$ and then over orbit permutations gives (2). This proof is the elementary fixed-point orbit count. Compare the earlier [odd-prime doubling obstruction](../nov20-independent/sign/hadamard_doubling_obstruction.md).

## A tensor congruence

Suppose $H$ has one fixed index and one regular $G$-orbit on each side, has fixed corner $a$, and has free core row sum $s$. The cross blocks are constant by invariance and their values are arbitrary. For every integer matrix $B$ of order $m$,

```math
\boxed{\mathop{\mathrm{per}}(B\otimes H)\equiv (as)^m(\mathop{\mathrm{per}}B)^2\pmod p.} \tag{3}
```

Indeed the action on the second index gives $F=aB$ and $S=sB$. Apply (1) and (2). No symmetry or sign condition on $B$ was used.

For a $(q,(q-1)/2,(q-3)/4)$ difference set $D\subset G$, take the fixed row and column to consist of ones and set the free block entry at $(x,y)$ to $2\mathbf1_{D}(x^{-1}y)-1$. The difference-set property says two distinct left translates of $D$ meet in $(q-3)/4$ points. Consequently the rows of the free block have sum $-1$, squared norm $q$, and mutual inner product $-1$. The bordered matrix $H_D$ is Hadamard. Thus (3) reads

```math
\mathop{\mathrm{per}}(B\otimes H_D)\equiv (-1)^m(\mathop{\mathrm{per}} B)^2\pmod p. \tag{4}
```

In particular, starting from any Hadamard $B$ with permanent nonzero modulo $p$, one can take an arbitrary number of tensor products by such Hadamard factors developed in groups of powers of that same prime. Every product has nonzero permanent. The difference sets need not be skew. Taking $B=[1]$ already covers all corresponding bordered factors. Tensoring with a single Paley-I factor over a variable prime $p\equiv3\pmod4$ preserves nonvanishing for every $p$ outside the finite set of divisors of a fixed nonzero $\mathop{\mathrm{per}} B$. A concrete seed for every odd prime is an order-four Hadamard of permanent magnitude eight.

The catalogue credits the Paley-I case $B=[1]$ to earlier work. Skew difference sets beyond the Paley constructions are available, including the examples of [Ding, Wang and Xiang](https://arxiv.org/abs/math/0609586) and [Ding et al.](https://arxiv.org/abs/1305.1831). The result here concerns the matrices obtained from those sets without assuming that inequivalent difference sets yield Hadamard-inequivalent matrices.

## A prime-power divisor for Paley II

For $q\equiv1\pmod4$ an odd prime power, let $T$ be the symmetric Paley conference matrix on $`\{\infty\}\cup\mathbb F_q`$. Its diagonal entries are zero and its finite block is translation-invariant. Use the conventional Paley-II Hadamard

```math
H=\begin{pmatrix}T+I&T-I\\ T-I&-T-I\end{pmatrix}.
```

The additive group of the field acts freely on both copies of the finite indices and fixes the two infinite indices. On the fixed block the matrix is

```math
\begin{pmatrix}1&-1\\-1&-1\end{pmatrix},
```

of permanent zero. Formula (1) therefore gives $q\mid\mathop{\mathrm{per}}H$. This is divisibility by the full field size, even when the extension degree is greater than one. It holds under signed row and column equivalence. It cannot certify vanishing over the integers. The standard construction and its automorphisms are documented by [Sage's Paley-II documentation](https://doc.sagemath.org/html/en/reference/combinat/sage/combinat/matrices/hadamard_matrix.html).

## Checks and prior work

`python3 research/minc/wang-translations/verify.py` compares (1) and (3) with direct integer subset dynamic programming on seeded, integral block examples, including a cyclic group of order nine. It also checks the Hadamard identities and computes the order-16 tensor permanent 50,692,096 and the Paley-II permanents −46,080 and −219,414,528 at field sizes five and nine. These finite computations test the derivations. They do not contribute a solved order.

[Wanless](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf) tabulates small-order Hadamard permanents. [Chabaud](https://arxiv.org/abs/1802.08001) treats Sylvester matrices. Searches for Paley tensor permanents, permanent congruences of block circulants, and skew-difference-set Hadamard permanents located the existing Paley-I case and related group and circulant arguments. Historical priority of the orbit reductions or their tensor consequences is unverified. This partial result counts as zero complete entries.
