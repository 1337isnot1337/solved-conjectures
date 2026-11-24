# Balanced products with shared gates and the cost of a hierarchy

We use the tensor conventions of [the paper at 11b6c7e, A.1–A.3, E.2–E.10](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf). All logarithms are binary. The new calculations below concern exact circuits.

## The graph polynomial and its dimension

Let $`G`$ be a loopless multigraph on $`n`$ vertices with positive degrees $`d_a`$, maximum degree $`d`$, and $`N`$ edges. Label each edge independently with an $`\ell`$-bit string. A vertex $`a`$ has a variable $`x_{a,\rho}`$ for every ordered tuple of incident strings. Let $`F`$ be the sum, over consistent edge assignments, of the product of the selected vertex variables. The coefficient tensor splits into a product of equality wires of dimension $`2^\ell`$, one per edge, on the set $`P`$ of all half-edges. A wire of dimension $`q`$ is the tensor with coefficient one for equal endpoint labels and zero otherwise.

For each tuple at $`a`$, use a weighted clause detecting exactly that tuple, with weight $`x_{a,\rho}`$ and default weight one (the literal convention can be complemented). Precisely one weight is selected per vertex. Corollary E.2, the clause-sum reduction in characteristic different from two, therefore suffices with
```math
M=3\sum_a d_a\ell\,2^{d_a\ell}\le 3nd\ell\,2^{d\ell}.
```
It gives a circuit of size $`L\le5S(m)`$ for $`F`$ from a permanent circuit of size $`S(m)`$ for **any** $`m\ge M`$ by affine substitution and identity padding. This is the dimension used below. The clause list may be nonuniform. Unequal block widths can be padded with unused variables for E.4.

A spectral point $`\varphi`$ is normalized on the scalar one, multiplicative under tensor products and subadditive under covers by restrictions (A.1). Its price on a dimension-$`q`$ equality tensor on a set $`I`$ of parties is $`q^{g_\varphi(I)}`$ by A.2. Set $`d_\varphi(i,j)=g_\varphi(\{i,j\})`$ for distinct parties. Use a single scale $`c>0`$ and write $`D=c d_\varphi`$, $`U=c g_\varphi(P)`$. Costs below use this same spectral point throughout a comparison.

## One cut

Place two hubs for each allowed balanced split. Let $`W`$ be the sum of original edge prices $`D(i,j)`$. For a split $`S`$ let $`A_S`$ sum the prices from each end to its assigned hub and $`B_S`$ be the hub separation. If $`J`$ splits occur in a balanced decomposition, then
```math
\ell W\le U\log J+\max_S(\ell A_S+B_S\log L).                 \tag{1}
```
Indeed E.4 writes the coefficient tensor as a sum over cuts, of rank at most $`L`$ across each cut. Contracting all ends on each side with its factor via its hub, and sending a common summand index along a dimension-$`L`$ wire between hubs, gives exactly this rank decomposition (A.3). Only functionals at the hubs are needed. Apply E.7 to the sum, take logarithms, and multiply by $`c`$. In particular a uniform gap $`W-A_S\ge g`$ and $`0<B_S\le B`$ give $`\log(5S(m))\ge(\ell g-U\log J)/B`$ whenever the numerator is positive. Formula (1) keeps the cut name, end exponent, wire length, and permanent dimension distinct.

## A bounded-degree test

There are arbitrarily large bounded-degree multigraphs with $`|\partial S|\ge n/128`$ for every balanced set ($`n/3\le|S|\le2n/3`$). Here is a nonuniform existence proof. Take eight independent uniform permutations on $`n`$ vertices and use their directed arcs as undirected edges, retaining multiplicities and deleting loops. For fixed $`n/3\le s=|S|\le n/2`$, the probability that one permutation sends at most $`n/128`$ elements of $`S`$ outside is at most
```math
\binom ns^{-1}\sum_{j\le n/128}\binom sj\binom{n-s}j
\le (n+1)(128e)^{n/64}2^{-n/3}.
```
Use $`\binom ns\ge(n/s)^s`$ and $`\binom nj\le(en/j)^j`$, increasing in this range for the displayed upper estimate. Since $`\log_2(128e)/64<0.14`$, the eighth power times $`2^n`$ tends to zero. The complement handles larger sets. A vertex isolated after loop deletion was fixed by all eight permutations, of probability $`n^{-8}`$ each; the union bound for any such vertex is $`n^{-7}`$. Thus there is a choice with both properties, and maximum degree at most 16. In particular $`N=\Theta(n)`$.

Orient each edge arbitrarily. Put its two ends at $`+e_a/2,-e_a/2`$ for the tail vertex $`a`$, with the positive end at the tail. Multiple parties may occupy the same position as in E.10. For $`S`$ let $`b_S`$ be the sum of the signed unit vectors at its ends. Internal edges cancel. All crossing contributions in any coordinate have the same sign, determined by whether the tail lies in $`S`$. Hence $`\|b_S\|\ge|\partial S|/\sqrt n\ge\sqrt n/128=:b_*`$. Put the hubs at $`\pm\eta b_S/\|b_S\|`$, with $`\eta=b_*/(2N)`$. The original lengths sum to $`N`$. For unit $`u`$ the tangent inequality $`\|u/2-z\|\le1/2-u\cdot z+\|z\|^2`$ gives
```math
A_S^{\rm Eucl}\le N-2\eta b_*+2N\eta^2=N-b_*^2/(2N).
```
Proposition E.9 gives flat distances within any positive tolerance and $`U\le\sqrt n+\varepsilon`$ on these ends, by the same pullback as E.10. For fixed $`n,\ell,L`$ and the finitely many hub positions take tolerances tending to zero in (1); the error in the right side is at most $`O(\varepsilon)(N\ell+\log L+n)`$. Using $`J\le2^n`$ gives
```math
2\eta\log L\ge\ell b_*^2/(2N)-n^{3/2}.
```
Here the guaranteed saving per bit is constant and $`2\eta=\Theta(n^{-1/2})`$. Take $`\ell`$ a sufficiently large constant times $`n^{3/2}`$, rounded upwards. We obtain $`\log L=\Omega(n^2)`$ with $`\log M=\Theta(n^{3/2})`$. The sparse construction recovers exponent $`4/3`$. The best scaling from this displayed guarantee occurs at $`\ell=\Theta(n^{3/2})`$: a smaller order leaves a negative numerator; at larger $`\ell`$ the guaranteed order is at most $`O(\ell\sqrt n)=O((\log M)^{4/3})`$. The density saving at the local lookup table was offset by a smaller gain per bit at the hubs.

## Nested balanced-product lemma

Let $`[p]_A`$ denote the component of degree one on the blocks in $`A`$ and zero elsewhere, in a fan-in-two DAG of $`L`$ gates. Write $`A_0=[n]`$. Recursively choose $`A_i\subset A_{i-1}`$ balanced **in its parent** until a prescribed depth or a singleton. A flag names the sets but contains no gate indices. For each resulting flag of length $`r`$, the contribution to the output is a tensor train (a product with a summed index between consecutive factors)
```math
\sum_{j_1,\ldots,j_r\in[L]}
 H^{(1)}_{o,j_1}(A_0\setminus A_1)
 H^{(2)}_{j_1,j_2}(A_1\setminus A_2)\cdots
 H^{(r)}_{j_{r-1},j_r}(A_{r-1}\setminus A_r)
 [p_{j_r}]_{A_r}.                                                \tag{2}
```
The argument in parentheses denotes the support of a multihomogeneous polynomial; its coefficients can depend on the flag. Summing (2) over flags gives the set-multilinear output component.

**Proof.** For any gate $`i`$ and any parent support $`A`$ of size at least two, set all other input blocks to zero. The induction **in the proof** of E.4, with $`|A|`$ as block count, gives $`[p_i]_A=\sum_{B,j}[p_j]_B H_{ij}^{A,B}`$, where $`B`$ is balanced in $`A`$ and $`H`$ is supported on $`A\setminus B`$. In detail, at a product partition the desired support between children. Follow the child with larger support (break ties consistently). Stop at a balanced component; while its size exceeds $`2|A|/3`$, multiply the inductive cofactor by the unused child component. At a sum add cofactors. This is induction on gate order with a fixed parent threshold, and terms ending at the same gate and subset add to one cofactor. Repeating on the **original gate** indexed by $`j`$ gives (2), without a circuit-size assumption on any $`H`$. Each repeated use of a gate has its original index. The proof accumulates losses along a nested chain while allowing arbitrary fan-out.

Give each shell and the final core its own hub. End-to-shell wires carry dimension $`2^\ell`$ and each of the $`r`$ consecutive hub wires carries dimension $`L`$. Choosing the shell coefficient arrays in (2) as hub functionals contracts this graph to the fixed flag contribution. E.7 now gives (1) with $`S`$ replaced by a flag, $`J`$ the number of flags, $`A_S`$ the end-to-shell sum, and $`B_S`$ the **sum** of the hub-wire prices. For example, if disjoint edge sets supply savings $`g_i`$ at successive splits (with all other edge contributions nonnegative), and the hub lengths are $`B_i`$, the conclusion is $`(\ell\sum_i g_i-U\log J)/\sum_i B_i`$ for uniform such bounds. Proving independent savings of superquasipolynomial strength for all flags is unresolved. Even genuine independent wire savings pay each bond in (2).

## Two tests of accumulation

**A shared recursive circuit.** Let $`n=2^q\ge4`$, and let $`P`$ be the $`(1,1)`$ entry of a product of $`n`$ generic $`D\times D`$ matrices, $`D\ge2`$. Compute all interval products of a balanced binary tree. There are $`n-1`$ matrix products, each taking at most $`2D^3`$ arithmetic gates, besides $`nD^2`$ inputs. An entry in a child product is reused across parent entries. The output tensor on the individual matrix-index ends consists of $`n-1`$ independent adjacent equality wires of dimension $`D`$ and two fixed boundary indices. At any nontrivial prefix split it has flattening rank exactly $`D`$: all internal equalities factor on their own sides, leaving the one crossing identity matrix. On splitting a prefix repeatedly in half the $`q`$ nested cuts therefore see $`q`$ distinct full-rank wires. Formula (2) on these shells also has a direct representation with dimension **$`D`$ per bond**, obtained by summing the common matrix index at each boundary. The product of the individual ranks is $`D^q`$, while the circuit has $`O(nD^3)`$ gates. For $`D=n`$ the former exceeds the latter by an unbounded factor. This rejects the proposed inference $`L\ge\prod_i\mathrm{rank}_i`$ even on a recursion with genuinely distinct crossing wires.

**Geometric limit for all-cut arguments.** Allow arbitrary Euclidean positions for the two ends of every edge. At a vertex $`a`$ let $`b_a`$ sum the unit directions from the opposite end toward the ends at $`a`$ (use zero for a zero-length wire). Thus $`\sum b_a=0`$, $`\|b_a\|\le d_a`$. Suppose the shell hubs are joined by a tree, and let $`A_e`$ collect vertices below a tree edge. Write $`x_a`$ for the hub of vertex $`a`$. For an original edge $`ij`$ with unit direction $`u`$ toward $`i`$, its Euclidean length minus its two end-to-hub lengths is at most $`u\cdot(x_i-x_j)`$ by the supporting inequality for the norm. Sum this inequality, then telescope hub positions from the root. The result is
```math
W^{\rm Eucl}-A^{\rm Eucl}
 \le \sum_a b_a\cdot x_a
 \le \sum_{e}\|x_{\rm child}-x_{\rm parent}\|\,
                    \Big\|\sum_{a\in A_e} b_a\Big\|.               \tag{3}
```
Thus the gain per total hub distance is bounded by a weighted average. This also applies if positions are chosen anew for each flag's hubs, with original ends held fixed.

For the nested chain one can exhibit a weak flag for **any** end placement. Choose a uniform random vertex ordering and at stage $`i`$ keep its first $`s_i=\lfloor n/2^i\rfloor`$ vertices, stopping at one. These are balanced children, including when a parent has three vertices. For $`Z_i=\sum_{a\in A_i}b_a`$, sampling without replacement and $`\sum b_a=0`$ give
```math
\mathbb E\|Z_i\|^2=\frac{s_i(n-s_i)}{n(n-1)}\sum_a\|b_a\|^2 .
```
Indeed a point occurs with probability $`s_i/n`$ and a distinct ordered pair with probability $`s_i(s_i-1)/(n(n-1))`$. Since $`s_i\le n/2^i`$ and $`s_i\ge1`$, summing over $`i\ge1`$ gives at most $`\sum_a\|b_a\|^2`$. Some flag therefore satisfies $`\max_i\|Z_i\|\le(\sum_a d_a^2)^{1/2}`$. Even with the cut name free, the uniform gain over **every** such flag divided by total hub length is at most this quantity; if all hub lengths vanish (3) gives no positive gain. This is a limit on a worst-flag Euclidean certificate. A proof exploiting which flags a particular circuit actually uses could avoid it.

## Choosing the geometry after seeing the cut list

There is a stronger conclusion when the decomposition actually uses few distinct cuts. For the bounded-degree graph above, take $`\ell=1`$. If a circuit for $`F`$ admits an E.4 decomposition with at most $`L`$ products per cut and at most $`J\le\sqrt n`$ nonzero cuts, then, in the flat case and for large $`n`$,
```math
\log L=\Omega(n/\sqrt J).
```
The constants are absolute. In particular a quasipolynomial circuit for this family, measured in the clause reduction dimension $`M=\Theta(n)`$, would have to use more than $`\sqrt n`$ cuts in **every** such decomposition with quasipolynomial rank per cut. This condition is on decompositions of the projected network circuit. E.4 by itself allows exponentially many.

**Proof.** Round $`J`$ upwards to a power of two $`p\lt 2J`$ (use $`p=1`$ for $`J=1`$; in all cases $`p\le2J`$). Enumerate the used cuts $`S_j`$. Give each edge a fixed orientation and an independent sign **in each of the $`p`$ coordinates**. In coordinate $`j`$, whenever the edge crosses $`S_j`$, give the end inside $`S_j`$ the positive sign; give the other end the opposite sign. On noncrossing edges and padded coordinates choose any opposite signs. Place the two ends at the resulting antipodes $`\pm u/2`$, where every coordinate of $`u`$ has absolute value $`1/\sqrt p`$. The original wire length is one. For cut $`S_j`$ the $`j`$th coordinate of $`b_{S_j}`$ is exactly $`|\partial S_j|/\sqrt p`$; the other coordinates need no sign control. Put $`b_*=n/(128\sqrt p)`$ and use the same hubs as before. The length saving is at least $`b_*^2/(2N)`$ and their separation is $`b_*/N`$.

Here the ends are cube **vertices**, so the facet-centre statement E.9 cannot simply be invoked. For each end position $`x`$, express it as the mean of the $`p`$ points $`p x_i e_i`$, $`1\le i\le p`$. For a fixed $`i`$ this map of all ends takes only two antipodal values, separated by $`\sqrt p`$. Form the finite point set consisting of the end and hub positions, these images, and their successive dyadic averages coordinate by coordinate in a balanced averaging tree. In the flat case choose the common spectral point with sufficiently small distance error on this finite set. By A.2 each two-point image has scaled exponent at most $`\sqrt p+\varepsilon`$. By E.8 the scaled exponent at each parent is at most the average at its children plus $`\varepsilon`$. The depth is $`\log p`$; hence $`U\le\sqrt p+(1+\log p)\varepsilon`$. For $`p=1`$ only the two-point bound is needed. Pull back repeated positions as in E.10 and let the error tend to zero. Equation (1) yields
```math
\log L\ge b_*/2-(N/b_*)\sqrt p\log J
       \ge c_1 n/\sqrt p-c_2 p\log J .
```
For $`J\le\sqrt n`$ the second term is $`o(n/\sqrt p)`$ uniformly. This proves the claim. Cut count can also be traded continuously in the displayed estimate. A circuit-dependent argument would need to force a short or geometrically correlated cut list, or handle the residual cuts by another invariant. The sampling bound (3) was for end positions fixed before testing all flags and does not preclude this construction.

The same construction permits **many names near a few representative cuts**. Suppose every used cut $`S`$ is within $`t`$ vertex changes of one of $`r`$ balanced representatives, where $`2dt\le n/256`$. Construct the coordinates for the representatives and round $`r`$ up to a power of two $`p`$. For the representative's coordinate, changing one vertex changes the sum of signed ends by at most $`d/\sqrt p`$ in absolute value. Thus every used $`S`$ still has $`\|b_S\|\ge n/(256\sqrt p)`$, allowing also the conservative bound with $`2d`$. Use a separate pair of hubs for each actual $`S`$. Formula (1), including **all** actual names $`J\le2^n`$, now gives
```math
\log L\ge c_3\ell n/\sqrt p-c_4p\log J.
```
In particular if $`r`$ is polylogarithmic in $`n`$, choose $`\ell=\lceil Kp^{3/2}\rceil`$ with a large absolute $`K`$. This forces $`\log L=\Omega(np)`$ while $`\log M=O(\log n+p^{3/2})`$. For any given polylogarithmic upper bound on $`r`$, one can fix $`p`$ and $`\ell`$ from that upper bound in advance, padding unused coordinates. Thus in the flat case the full range of fixed quasipolynomial circuit sizes is excluded for this restricted cover condition, even allowing exponentially many distinct cuts inside the balls.

A generic count of nonzero gate components does not supply such a cover. In the $`O(n)`$-gate circuit squaring $`\prod_i(1+x_i)`$, the root's squarefree component receives a nonzero term from every ordered half-size split when $`n`$ is even. The balanced-product induction sees these splits even though the two input wires reuse one gate. The component itself has a simpler decomposition; the example refutes only an inference from small gate count to a small list in the unsimplified expansion. Obtaining a suitably clustered decomposition **for the network polynomial** is a separate open implication.

## A failed local encoding by monomials

A tempting way to save the local table dimension is to replace each $`x_{a,\rho}`$ by the product of one variable per end and label. This substitution preserves the coefficient tensor on the separately named ends. But it turns the polynomial into the easy product $`\prod_{ab}\sum_{i=1}^{2^\ell} y_{a,ab,i}y_{b,ab,i}`$, computable with $`O(N2^\ell)`$ gates. The degree in a vertex block is now $`d_a`$; E.4 applied to its vertex-linear component gives zero at vertices of degree greater than one.

In fact an inverse linearization that regroups arbitrary circuits into independent table variables cannot have cost polynomial in the original circuit size and in the largest local table, uniformly over all graph sizes in the flat case. Apply it to the product above for the complete graph on $`n`$ vertices with $`\ell=\lceil100\sqrt n\rceil`$. Such a conversion would yield $`\log L=O(n\ell+\log n)`$ for the regrouped circuit, while E.10 requires $`\log L\ge\ell n^{3/2}/16`$. This gives a quantitative counterexample to that proposed transfer, preserving both its cheap forward direction and the failed inequality for its reverse.
