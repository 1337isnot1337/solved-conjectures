# A fixed border for every quotient of order four

**Conditional construction.** Let $G$ be any finite abelian group with a subgroup $S$ of size $s$ and quotient $Q=G/S$ of order four. Suppose four sign-valued functions on $G$ have combined periodic autocorrelation $-12$ on the nonzero elements of $S$ and $+4$ off $S$. They yield a Hadamard matrix of order $16s+12$. For order 2396 the outstanding task in this construction is to find the four functions at $s=149$.

The bordered array and its three matrix conditions are Theorem 7 of Egan, Kotsireas, London and Ó Catháin. Kumar gives a border construction for compressions having one exceptional coset per nonconstant row and discusses how symmetry can enforce that form. We show directly that for either group of order four the autocorrelation equations alone force this form up to independent row translations and sign changes. Our border data adapt Kumar's explicit order-2636 certificate. [Theorem 7](https://arxiv.org/html/2610.27175v2) · [Kumar, search notes §102](https://github.com/vatskishan03/Hadamard/blob/d885022/search/NOTES.md) · [Source certificate](https://github.com/vatskishan03/Hadamard/blob/d885022/hadamard/2636/certificate.json)

## Normalization of the coset sums

Write $c_i(q)$ for the sum of row $i$ over coset $q$. Summing the original autocorrelations within cosets shows that the combined periodic autocorrelation of these four compressed rows is $4s+12$ at zero and $4s$ at each other shift. Let $e$ be the parity of $s$ and put $`x_i(q)=(c_i(q)-e)/2`$. All these entries are integers. At each nonzero shift $t$,

```math
\sum_{i,q}(x_i(q+t)-x_i(q))^2=\tfrac14\big(2(4s+12)-2(4s)\big)=6.
```

Summing over the three shifts counts each unordered pair of distinct cosets twice. Hence the four nonnegative integers

```math
D_i=\sum_{q\lt r}(x_i(q)-x_i(r))^2
   =4\sum_q x_i(q)^2-\big(\sum_q x_i(q)\big)^2
```

sum to nine. Each is zero or three modulo four. Exactly three are three modulo four, so those three are each three and the remaining one is zero. Four integers with pairwise squared differences summing to three have three equal entries and a fourth differing by one. Indeed any difference of magnitude two already contributes four, and a two-against-two split contributes four.

The zero row variance gives a constant compression. Independently translate each exceptional coset to zero and negate the corresponding row if necessary. Such translations lift to $G$ and the changes preserve every autocorrelation. After a row permutation the compressions consequently have the form

```math
d,\qquad a+2\delta_0,\qquad b+2\delta_0,\qquad c+2\delta_0.
```

At the trivial character the combined squared row sums equal $16s+12$, giving

```math
(4d)^2+(4a+2)^2+(4b+2)^2+(4c+2)^2=16s+12.
```

At $s=149$ the four baselines are odd. Negate the constant row to make $d>0$ and sort the other three baselines. Exactly 14 possibilities remain. The verifier enumerates every admissible baseline and prints the list. Each possibility still requires binary rows on all 596 group elements.

## Border certificate

Use the Goethals–Seidel signs in Theorem 3 of the cited survey. On vectors constant on cosets, its core acts by the quotient array of the $c_i$. Within each of the four quotient blocks restrict to vectors whose four entries sum to zero. A constant compression acts by zero there and a compression $a+2\delta_0$ acts by $2I$. The constant row is the diagonal generator and vanishes on this subspace. Every off-diagonal generator in the array includes the same reflection $R_Q:q\mapsto -q$. Hence the induced core there is $\Gamma\otimes R_Q$, where

```math
\Gamma=2\begin{pmatrix}
0&1&1&1\\-1&0&1&-1\\-1&-1&0&1\\-1&1&-1&0
\end{pmatrix}.
```

Let $K,E,F$ be the sign matrices in the companion certificate and let $J_4$ be the all-ones matrix. The finite certificate satisfies

```math
KK^T=12I,\quad EE^T=16I,\quad FF^T=16I-4(I_4\otimes J_4),
```

```math
(I_4\otimes J_4)E^T=0,\qquad
(\Gamma\otimes I_4)E^T+FK^T=0.
```

Take the left border factor to be $`F_Q=(I_4\otimes R_Q)F`$. Reflection permutes sign entries and preserves the Gram identity for $F$. Multiplying the last certificate identity on the left by $`I_4\otimes R_Q`$ gives the required cross term. The balanced columns of $E^T$ therefore satisfy the cross-term equation of Theorem 7 after replication on cosets. All its hypotheses hold for the normalized core. This proves the conditional construction, including for nonsplit extensions.

The certificate uses Kumar's $X$ as $K$ and his $R_{\mathrm{hat}}$ as $E$ with the second and third four-column blocks negated. We computed $F=-(\Gamma\otimes I_4) E^T K/12$. The verifier checks every identity in integer arithmetic and assembles two whole matrices at order 60, one for each quotient group, as controls. [Border data](border.json) · [Executable check](border.py)

## Symmetries available at order 2396

Here $G=Q\times C_{149}$ since the two factor orders are coprime. Suppose all four rows are fixed by a common group $U$ of group automorphisms in the chosen origins. Then **$`|U|\le4`$**.

First, a prime-order symmetry acting only on $Q$ must act as an involution or a three-cycle. In $C_4$ the only possibility is inversion, and in the Klein four group the action permutes the three nonzero points. In every case there is an element $h$ of order two such that one pair $x,x+h$ belongs to the same nontrivial orbit, while a fixed point must lie in the other pair. For an involution take its swapped pair. For a three-cycle pick any two nonzero points, whose difference is the third. Thus in every row the two length-149 strings on the first pair are identical. For the other pair let $g_i$ be the number of positions where its two signs agree. The combined correlation at $(h,0)$ is $`\sum_i 4g_i=4`$. The absolute sum of the two coset sums in the other pair is at most $2g_i$. A row with a unique exceptional coset must have that coset fixed, so the other pair contains the exceptional position. Row negations preserve both the agreement counts and the absolute sums. Using the baselines above gives

```math
|d|+|a+1|+|b+1|+|c+1|\le1.
```

None of the 14 candidate patterns satisfies this. Consequently $U$ injects into $\mathop{\mathrm{Aut}}(C_{149})$, which is cyclic of order 148.

If 37 divides $`|U|`$, an element of order 37 acts trivially on $Q$ and has four length-37 orbits and one singleton on each $C_{149}$ fiber. A fiber sum must then be congruent to $+1$ or $-1$ modulo 37. Every candidate fiber sum has magnitude less than 36, so every one must be $+1$ or $-1$. That would require $d=1$ and $a=b=c=-1$, contrary to the squared-row-sum equation. Thus $`|U|`$ divides four.

Even the largest permitted common multiplier group leaves at least 151 sign orbits per generator. The 592 positions with nonzero $C_{149}$ coordinate contribute at least 148. On the four remaining positions a cyclic group of order dividing four has image of order at most two on $Q$, with at least three orbits. This count concerns fixed common multipliers. Other forms of symmetry may impose different constraints.

## Lean verification

The symmetry theorem in the preceding section is fully formalized, including
arbitrary finite abelian domains and every common multiplier subgroup. The
12-module closure passed strict source checks, a 216-theorem standard-axiom
audit, and independent replay by the unchanged pinned Lean kernel checker.
[Receipt](../../docs/verification/hadamard-border-transfer-682d0917.json) ·
[Exact checked scope](../../docs/lean-status.md#complete-fixed-border-multiplier-and-orbit-bounds).
The earlier normalization and matrix border construction remain separate
formalization obligations.

The formal proof uses the raw correlations and does not require the fourteen
normalized baseline patterns. Write $`C_i(q)=\sum_z F_i(q,z)`$ for the 16 fiber
sums. Summing over fiber shifts gives

```math
\sum_{i,q} C_i(q)^2=608,\qquad
\sum_{i,q} C_i(q+h)C_i(q)=596\quad(h\ne0).
```

Thus $`|C_i(q)|\le24`$. A nontrivial quotient automorphism preserving all rows
has a moved pair $a,a+h$, with $h$ of order two and
$`Q=\{0,h,a,a+h\}`$. The actual correlation at $(h,0)$ and the compressed
correlation at $a$ imply

```math
\sum_i |C_i(0)+C_i(h)|\le2,\qquad
\sum_i C_i(a)\bigl(C_i(0)+C_i(h)\bigr)=298.
```

The absolute value of the latter sum is at most $24\cdot2=48$, a
contradiction. This proves injectivity of the actual multiplier projection.
An element of order 37 would force each fiber sum to be congruent to $1$ or
$-1$ modulo 37. The same magnitude bound then makes all 16 fiber sums signs,
contradicting energy 608. The unit group is cyclic of order 148, so the common
multiplier group is cyclic of order dividing four.

For the orbit bound, the origin has a singleton orbit. A nonzero point in the
characteristic four-torsion subgroup has an orbit of size at most two. Every
orbit has size at most four. If there are $m$ actual orbits, these two deficits
give $596+5\le4m$, hence $m\ge151$.

For an original group $G$ and subgroup $S$, the formalization constructs the
product coordinates from the actual quotient map and the retraction
$g\mapsto g-149g$ onto $S$. Conjugation identifies the full row-preserving
subgroup and its orbit quotient with those in product coordinates. No
splitting or prescribed coordinate action is an extra hypothesis.

The certificate's transport to an arbitrary quotient is formalized in
`HadamardFixedBorderTransport.lean` and `HadamardFixedBorderFin16.lean`.
Given the explicit finite certificate fields and a quotient of cardinality
four, the theorem constructs the actual relabeled `E` and reflected `F`,
preserves sign-valuedness, and proves all five transported identities.
The two-module closure passed strict source checks, a 66-theorem axiom
audit, and unchanged independent kernel replay.
[Receipt](../../docs/verification/hadamard-fixed-border-fin16-23b2b187.json).

The step from compression shapes to actual normalized rows is also
formalized. Given one constant compressed row and three compressed rows
with exceptional jumps of `2` or `-2`, the theorem constructs the row
permutation, sign changes, and lifted translations on the original group.
It proves the exact four normalized compressions, sign-valuedness, and
preservation of every combined periodic autocorrelation. No split extension
or positive constant baseline is assumed. The two-module closure passed
strict source checks, a 14-theorem axiom audit, and independent pinned-kernel
replay.
[Receipt](../../docs/verification/hadamard-border-normalization-main-14ab84e7.json).

The variance argument producing the compression shapes, the literal finite
certificate, and final bordered matrix assembly remain separate obligations
under issue 17.
