# Vanishing Hadamard permanents

## Testing the conjectured valuation on an input matrix

For any sign matrix $A$ of order $n$, let $m=\lfloor\log_2(n+1)\rfloor$. For every positive integer $t$, one can compute

```math
2^{-(n-m)}\mathop{\mathrm{per}}A\pmod{2^t}
```

in deterministic time $n^{O(t)}$ for $n\ge 2$. In particular, on any supplied Hadamard matrix one can test Wanless's equality $v_2(\mathop{\mathrm{per}}A)=v_2(n!)$ in time $n^{O(1+m-s_2(n))}$, where $s_2$ counts binary ones. The worst case is quasipolynomial. The criterion may certify nonvanishing on a given matrix, but a failure of the equality by itself does not decide whether its permanent vanishes. This gives no universal proof of Wang's [Problem 5](https://yair-lavi.com/mincs-list/problem-5/) or of [Kräuter's attainment conjecture](https://yair-lavi.com/mincs-list/conjecture-36/).

### Reduction to modular matching counts

Let $B=(J-A)/2$ with $J$ the all-ones matrix. Let $r_k$ be the number of $k$-edge matchings in the bipartite support graph of $B$, including $r_0=1$. Expand the product in every permanent term using $A=J-2B$. A specified matching on $k$ selected positions extends to $(n-k)!$ permutations, giving

```math
\mathop{\mathrm{per}} A=\sum_{k=0}^n(-2)^k(n-k)!\,r_k. \tag{1}
```

Put $j=n-k$. Legendre's formula gives the exact power of two in the scalar coefficient as $n-s_2(j)$. The maximum of $s_2(j)$ over $0\le j\le n$ is $m$, since $2^m-1\le n<2^{m+1}-1$ and $2^{m+1}-1$ is the first integer with $m+1$ ones. Thus division by the classical Kräuter–Seifter divisor $2^{n-m}$ in (1) is termwise integral. With $u_j=j!/2^{j-s_2(j)}$ odd, the normalized residue is

```math
\sum_{j=0}^n (-1)^{n-j}2^{m-s_2(j)}u_j\,r_{n-j}\pmod{2^t}. \tag{2}
```

Skip a term when $m-s_2(j)\ge t$. Every remaining term needs a matching count modulo at most $2^t$. Apply [Curticapean, Dell and Husfeldt, Theorem 2](https://drops.dagstuhl.de/storage/00lipics/lipics-vol204-esa2021/LIPIcs.ESA.2021.34/LIPIcs.ESA.2021.34.pdf) with host order $2n$ and pattern a disjoint union of $n-j$ edges. Its matching-split number is zero. The theorem counts subgraphs, so no factorial or automorphism factor needs division modulo an even integer. At most $n+1$ calls and polynomially many elementary bit operations outside those calls give the stated bound. The case $k=0$ is immediate.

Finally $v_2(n!)=n-s_2(n)$. With $d=m-s_2(n)$ the equality under test is equivalent to (2) at precision $t=d+1$ being precisely $2^d$. This is the claimed complexity. The matching algorithm and its polynomial-hafnian input are prior work. [Hirai and Namba, Theorem 2.1](https://arxiv.org/pdf/1603.08073)

### The lowest bit

At $t=1$ one needs just the coefficients $r_{n-j}\bmod2$ for those $j$ with $s_2(j)=m$. In characteristic two the entire rook polynomial is

```math
\sum_{k=0}^n r_k z^k=\det(I+zBB^{\mathsf T}) . \tag{3}
```

Indeed, the determinant coefficient is the sum of the principal $k$-minors of $BB^{\mathsf T}$. By Cauchy–Binet these sum the squares of all $k$-minors of $B$. Over $\mathbb F_2$, squaring preserves each scalar and determinant agrees with permanent. Thus (3) gives the first bit by ordinary polynomial-time linear algebra. A value one proves sharpness in valuation for that input. The normalized absolute permanent may still have an arbitrarily large odd factor as far as this test is concerned.

For a normalized Hadamard matrix of order $4h$, the row and column of $B$ indexed by the normalizing coordinates vanish. On the remaining rows $BB^{\mathsf T}=h(I+J)$, since row weights are $2h$ and distinct rows overlap in $h$ entries. When $h$ is even the polynomial (3) is $1$. When $h$ is odd it is $(1+z)^{n-2}$, because on the $n-1$ coordinates the all-ones matrix is a rank-one projection in characteristic two, leaving $I+J$ a projection of rank $n-2$. Higher bits in (2) need higher modular matching counts.

## Verification and scope

`python3 research/minc/wang-translations/valuation_check.py` independently enumerates small matching counts, computes sign permanents by subset dynamic programming, and compares (2) for multiple precisions with direct integer division. It compares (3) with principal minors in characteristic two. The tests check the reduction. They do not implement or benchmark the published modular subgraph-counting algorithm. Kräuter–Seifter divisibility, modular matching algorithms and the parity determinant identity are prior ingredients. No historical priority is asserted for combining them. [Wanless](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf) · [Ingram and Razborov](https://arxiv.org/abs/2507.09433)
