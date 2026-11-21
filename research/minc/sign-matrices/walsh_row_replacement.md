# Vanishing Hadamard permanents

## Changing a subspace of Walsh rows

Index the Sylvester matrix $W_d$ by $\mathbb F_2^d$ on each side, with entries $(-1)^{x\cdot y}$. Suppose a real Hadamard matrix $H$ of the same order $n=2^d$ agrees with $W_d$ on every row outside an affine subspace of dimension $s$, where $`2\le s<d`$. Then

```math
2d\ge 7s-4\quad\Longrightarrow\quad v_2(\mathop{\mathrm{per}}H)=n-1.
```

In particular, any set of at most $s+1$ changed rows is contained in such an affine subspace (possibly after enlarging its affine span). The subspace may contain $2^s$ changed rows with arbitrary entries compatible with the Hadamard condition. For a two-dimensional subspace the same conclusion already holds for every $d\ge4$. This is an all-order restricted case of Wang's nonvanishing question, with the stronger dyadic valuation proposed by Wanless. [Wang's question](https://yair-lavi.com/mincs-list/problem-5/)

**Form of the replacement.** Translating the suspect row indices is realized by multiplying each Walsh column by a sign, and an invertible linear change of row coordinates corresponds to the inverse transpose change of column coordinates. Thus we may take the exceptional rows to be $U=\mathbb F_2^s\times\{0\}$, up to sign of the permanent. Write $t=d-s$, $h=2^s$, and write column indices as $`(v,b)\in\mathbb F_2^s\times\mathbb F_2^t`$. Orthogonality puts the replacement rows in the real span of the $h$ original rows indexed by $U$, since its orthogonal complement is exactly the unchanged row space. These rows therefore take a common value throughout each fiber of columns with fixed $v$. Their values on the $h$ fibers form an arbitrary real Hadamard matrix $L$ of order $h$, as every fiber has size $2^t$. Conversely any such $L$ gives an allowed replacement.

The products of the signs in each column of $L$ are all equal: distinct orthogonal columns differ at $h/2$ positions, an even number. Flip one exceptional row if necessary so that all products are one, as in $W_s$. Let $H'$ denote the resulting matrix. We compare the signed integers $\mathop{\mathrm{per}}H'$ and $\mathop{\mathrm{per}}W_d$.

**Cancellation on small supports.** Expand both permanents by the exceptional rows. Each summand in the difference corresponds to a set $C$ of $h$ columns and is the product of a common complementary minor with the difference of the two exceptional minors. Write $c_v$ for the number of selected columns over $v$. The exceptional minor for $L$ uses $c_v$ copies of its column $v$. Its value equals the coefficient of $\prod_v z_v^{c_v}$ in $\prod_i\sum_v L_{iv}z_v$, multiplied by $\prod_v c_v!$.

If at most three fibers occur, this value is the same for $L$ and $W_s$. Indeed, multiply each row by its entry in one chosen column, which makes that column all ones and leaves the permanent unchanged. Each of the at most two other columns is balanced. If both occur, their product is also balanced by orthogonality, so all four sign pairs occur equally often. The resulting polynomial is therefore determined by $h$ and the selected labels. This is the same elementary three-column calculation used in the [partition-sector note](../nov20-independent/sign/hadamard_partition_sectors.md).

**The affine shear action.** For any linear $M:\mathbb F_2^s\to\mathbb F_2^t$ and $w\in\mathbb F_2^t$, permute columns by

```math
(v,b)\longmapsto(v,b+Mv+w).
```

In the unchanged Walsh rows this permutes the row labels $(u,a)$ to $(u+M^{\mathsf T}a,a)$ and contributes a row sign $(-1)^{a\cdot w}$. For each nonzero $a$ this sign appears $h$ times, giving product one. The exceptional rows are constant on fibers. Therefore the entire signed Laplace summand is constant on each shear orbit of $C$.

Any nonzero summand involves at least four occupied fibers. Choose three distinct occupied labels $v_1,v_2,v_3$. Over $\mathbb F_2$ these are affinely independent. The map sending $Mv+w$ to its three evaluations is surjective onto $(\mathbb F_2^t)^3$. If a translation preserves the chosen subset in fiber $v_i$, its translation stabilizer has size dividing $c_{v_i}$, because it acts freely on that subset. The stabilizer of $C$ is contained in the inverse image of the three stabilizers. Hence the orbit size is divisible by

```math
2^{3t-\sum_{i=1}^3v_2(c_{v_i})}.
```

The exponent is nonnegative since $c_{v_i}\le 2^t$. Also $c_{v_i}<h$, so it is at least $3t-3(s-1)$.

**Dyadic comparison.** Every sign permanent of order $u$ is a multiple of $2^{u-\lfloor\log_2(u+1)\rfloor}$, by the classical sign-permanent divisibility theorem. Apply this to the exceptional minors of order $h$ and to the unchanged complementary minor of order $n-h$. Their guaranteed exponents are $h-s$ and $n-h-d+1$, respectively. With the orbit divisor, each nonzero orbit contributes a multiple of

```math
2^{(h-s)+(n-h-d+1)+3(d-s)-3(s-1)}=2^{n+2d-7s+4}
```

when the displayed exponent is nonnegative. Under the claimed condition the two permanents agree modulo $2^n$. Chabaud proved $`v_2(\mathop{\mathrm{per}}W_d)=v_2(n!)=n-1`$, giving the result. If $s=2$, all four occupied fibers have $c_v=1$. The orbit divisor is then $2^{3(d-2)}$ and the total exponent is at least $n+2d-7$, sufficient for $d\ge4$.

**References and scope.** [Orrick](https://arxiv.org/abs/math/0507515) studies switching closed quadruples. This includes changing the sign on one fiber across four exceptional Walsh rows. [Wanless](https://doi.org/10.1080/03081080500093990) investigated Hadamard permanents and the sign-matrix divisibility background. [Chabaud](https://arxiv.org/abs/1802.08001) gives the valuation of the original Walsh matrix and recalls the permanent divisibility expansion. These results and the catalogue do not supply here a proof of the valuation for an arbitrary Hadamard matrix. The argument requires many unchanged Walsh rows and makes no historical priority claim.

The [exact checker](walsh_row_replacement_check.py) enumerates the shear orbits of all four-column sets at order 16, checks the signs of their Laplace contributions, computes the original and switched permanents independently, and verifies the three-label cancellation for two distinct order-eight sign patterns.
