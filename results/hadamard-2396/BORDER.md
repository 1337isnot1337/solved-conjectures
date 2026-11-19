# A fixed border for every quotient of order four

**Conditional construction.** Let $G$ be any finite abelian group with a subgroup $S$ of size $s$ and quotient $Q=G/S$ of order four. Suppose four sign-valued functions on $G$ have combined periodic autocorrelation $-12$ on the nonzero elements of $S$ and $+4$ off $S$. They yield a Hadamard matrix of order $16s+12$. For order 2396 the outstanding task in this construction is to find the four functions at $s=149$.

The bordered array and its three matrix conditions are Theorem 7 of Egan, Kotsireas, London and Ó Catháin. Kumar gives a border construction for compressions having one exceptional coset per nonconstant row and discusses how symmetry can enforce that form. We show directly that for either group of order four the autocorrelation equations alone force this form up to independent row translations and sign changes. Our border data adapt Kumar's explicit order-2636 certificate. [Theorem 7](https://arxiv.org/html/2610.27175v2) · [Kumar, search notes §102](https://github.com/vatskishan03/Hadamard/blob/d885022/search/NOTES.md) · [Source certificate](https://github.com/vatskishan03/Hadamard/blob/d885022/hadamard/2636/certificate.json)

## Normalization of the coset sums

Write $c_i(q)$ for the sum of row $i$ over coset $q$. Summing the original autocorrelations within cosets shows that the combined periodic autocorrelation of these four compressed rows is $4s+12$ at zero and $4s$ at each other shift. Let $e$ be the parity of $s$ and put $x_i(q)=(c_i(q)-e)/2$. All these entries are integers. At each nonzero shift $t$,
$$
\sum_{i,q}(x_i(q+t)-x_i(q))^2=\tfrac14\big(2(4s+12)-2(4s)\big)=6.
$$
Summing over the three shifts counts each unordered pair of distinct cosets twice. Hence the four nonnegative integers
$$
D_i=\sum_{q<r}(x_i(q)-x_i(r))^2
   =4\sum_q x_i(q)^2-\big(\sum_q x_i(q)\big)^2
$$
sum to nine. Each is zero or three modulo four. Exactly three are three modulo four, so those three are each three and the remaining one is zero. Four integers with pairwise squared differences summing to three have three equal entries and a fourth differing by one. Indeed any difference of magnitude two already contributes four, and a two-against-two split contributes four.

The zero row variance gives a constant compression. Independently translate each exceptional coset to zero and negate the corresponding row if necessary. Such translations lift to $G$ and the changes preserve every autocorrelation. After a row permutation the compressions consequently have the form
$$
d,\qquad a+2\delta_0,\qquad b+2\delta_0,\qquad c+2\delta_0.
$$
At the trivial character the combined squared row sums equal $16s+12$, giving
$$
(4d)^2+(4a+2)^2+(4b+2)^2+(4c+2)^2=16s+12.
$$
At $s=149$ the four baselines are odd. Negate the constant row to make $d>0$ and sort the other three baselines. Exactly 14 possibilities remain. The verifier enumerates every admissible baseline and prints the list. Each possibility still requires binary rows on all 596 group elements.

## Border certificate

Use the Goethals–Seidel signs in Theorem 3 of the cited survey. On vectors constant on cosets, its core acts by the quotient array of the $c_i$. Within each of the four quotient blocks restrict to vectors whose four entries sum to zero. A constant compression acts by zero there and a compression $a+2\delta_0$ acts by $2I$. The constant row is the diagonal generator and vanishes on this subspace. Every off-diagonal generator in the array includes the same reflection $R_Q:q\mapsto -q$. Hence the induced core there is $\Gamma\otimes R_Q$, where
$$
\Gamma=2\begin{pmatrix}
0&1&1&1\\-1&0&1&-1\\-1&-1&0&1\\-1&1&-1&0
\end{pmatrix}.
$$

Let $K,E,F$ be the sign matrices in the companion certificate and let $J_4$ be the all-ones matrix. The finite certificate satisfies
$$
KK^T=12I,\quad EE^T=16I,\quad FF^T=16I-4(I_4\otimes J_4),
$$
$$
(I_4\otimes J_4)E^T=0,\qquad
(\Gamma\otimes I_4)E^T+FK^T=0.
$$
Take the left border factor to be $F_Q=(I_4\otimes R_Q)F$. Reflection permutes sign entries and preserves the Gram identity for $F$. Multiplying the last certificate identity on the left by $I_4\otimes R_Q$ gives the required cross term. The balanced columns of $E^T$ therefore satisfy the cross-term equation of Theorem 7 after replication on cosets. All its hypotheses hold for the normalized core. This proves the conditional construction, including for nonsplit extensions.

The certificate uses Kumar's $X$ as $K$ and his $R_{\rm hat}$ as $E$ with the second and third four-column blocks negated. We computed $F=-(\Gamma\otimes I_4) E^T K/12$. The verifier checks every identity in integer arithmetic and assembles two whole matrices at order 60, one for each quotient group, as controls. [Border data](border.json) · [Executable check](border.py)
