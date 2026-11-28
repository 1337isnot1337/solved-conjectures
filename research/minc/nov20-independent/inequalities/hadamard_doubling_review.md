# Independent review of the Hadamard-doubling obstruction

Date: 20 November 2026 (America/Chicago).

Reviewed note:
[Odd-prime obstruction to Hadamard doubling](../sign/hadamard_doubling_obstruction.md).

Result: the general orbit theorem, the entry-change and border
corollary, and the cycle/path identities pass independent review.
No mathematical correction is required. A stray comma in the exponent
$`h_{\alpha\beta}^{p}`$ was reported and corrected.

This is an exclusion of a construction route. It does not resolve
Kräuter's conjecture or another Minc entry.

## 1. The odd-prime theorem

An invariant $`p`$-cycle on original indices gives exactly two
moved row orbits and two moved column orbits in the doubled matrix.
The retained row and column sets are invariant because both copies
of every moved index are retained.

The action on perfect matchings has orbit sizes one or $`p`$.
The integer matching weight is constant on each orbit. A fixed matching
is an equivariant bijection, so it preserves orbit size: no moved row
can be matched to a fixed column, and no fixed row can be matched to
a moved column.

For each pairing of a moved row orbit with a moved column orbit,
the $`p`$ possible equivariant maps have common scalar weight sum
$`R`$, multiplied by $`h_{\alpha\beta}^p=h_{\alpha\beta}`$.
The choice of phase for one orbit does not constrain the phase for
the other, since their target column orbits are distinct.
Summing over the two pairings therefore gives

~~~math
\mathop{\mathrm{per}}(RH)=R^2\mathop{\mathrm{per}}H=0.
~~~

This factor multiplies the permanent on the fixed vertices, including
the empty fixed set. All nonfixed matching orbits contribute multiples
of $`p`$. This proves the theorem for nonprincipal square minors
as stated.

For the specific core $`J_n-2I_n`$, one can also check the phase
sum directly: phase zero contributes $`-1`$ for odd $`p`$,
and every other phase contributes $`1`$. Thus
$`R=p-2`$, and the fixed contribution is
$`(p-2)^2\mathop{\mathrm{per}}H=0`$.

## 2. Entry changes and arbitrary borders

The perturbation corollary does not assume that the changed matrix
remains a tensor product. Its proof only needs the moved part to
retain the tensor structure.

At most $`s`$ changed entries involve at most $`2s`$
original indices. After fixing every matching edge incident to a
border vertex, let $`k`$ old rows be matched to new columns.
The same number of new rows must be matched to old columns, because
the numbers of new rows and new columns both equal $`d`$.
Hence $`k\le d`$, and the remaining old submatrix is square,
with exactly $`k`$ deleted old rows and $`k`$ deleted old
columns. These deletions involve at most $`2d`$ original indices.

Choose a $`p`$-cycle among the at least
$`n-2s-2d`$ unaffected original indices.
Every changed entry lies between two fixed vertices. All entries
incident to a moved vertex retain their original values, and the
whole surviving minor remains invariant under the cycle. The fixed
matching argument in Section 1 therefore remains valid.

The set of border-incident edges partitions the perfect matchings
without overlap. For each such choice, its integer weight multiplies
a core permanent divisible by $`p`$. Summing proves

~~~math
p\le n-2s-2d,\quad p\text{ an odd prime}
\quad\Longrightarrow\quad
p\mid\mathop{\mathrm{per}}F.
~~~

Taking $`p=3`$ gives the stated necessary condition
$`s+d>(n-3)/2`$ for a nonzero pure power of two.
Arbitrary row/column permutations and sign changes can be undone
before applying the argument. The number of changed entries and the
border width remain the same.

## 3. Cycle, path, and cofactor factors

For a projected simple alternating cycle with $`k`$ original
rows, summation over the row-copy bits imposes

~~~math
c_t+c_{t-1}=1\pmod2.
~~~

There are no solutions for odd $`k`$. For even $`k`$,
the two alternating column-bit assignments give the signed factor
$`(-1)^{k/2}2^{k+1}`$.
A doubled-edge component separately has factor
$`\mathop{\mathrm{per}}H=0`$.
For a surviving projected graph with $`c`$ cycles,
there are exactly $`2^c`$ ordered decompositions into two
perfect matchings. These observations give the permanent formula
(9), including its sign and power of two.

For a top-left permanental cofactor, the projected open path has
$`\ell`$ old row vertices and $`\ell`$ old column vertices.
Both endpoint copy labels are one. Direct multiplication gives

~~~math
(HJ)^2=2R,\qquad
(HJ)^{2\ell-2}H=2^{\ell-1}R^{\ell-1}H.
~~~

Its bottom-right entry is
$`(-1)^{\lceil\ell/2\rceil}2^{\ell-1}`$.
The remaining cycles have even original-row lengths. Combining
their signs yields $`(-1)^{\lceil n/2\rceil}`$,
and combining their magnitudes yields $`2^{n-1+c}`$.
Only the cycles contribute choices of alternating edge colors:
the full/partial coloring of the open path is forced.
This gives the cofactor formula (10).

The stated four cofactor blocks follow by swapping copy halves
and recording the signs of the columns or rows not deleted.
For the repeated border vectors, their total cofactor contraction is

~~~math
(r^T,r^T)
\begin{pmatrix}M&(-1)^nM\\(-1)^nM&-M\end{pmatrix}
\binom cc
=2(-1)^n r^TMc.
~~~

Adding the corner contribution $`e\mathop{\mathrm{per}}D(A)`$
and substituting (9) and (10) gives both branches of (12).
No transpose or factor-of-two discrepancy occurs.

## 4. Published seed and exact checks

The primary
[Wanless paper](https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf)
was opened directly. Section 3 defines the Toeplitz sign convention,
states the conjectured minimum, and lists $`T_5\{0\}`$
as an attaining order-five example. It also lists attaining
order-eleven matrices. Thus the order-five seed is prior work,
and the failed lift is not an impossibility result for order eleven.

Independently,

~~~math
\mathop{\mathrm{per}}(J_5-2I_5)
=\sum_{k=0}^5\binom5k(-2)^k(5-k)!=8.
~~~

The targets are $`q(11)=256`$ and $`q(10)=128`$.
Both are coprime to three, whereas the one-border and one-entry-change
constructions from this core are divisible by three.

The companion
[exact checker](../sign/hadamard_doubling_check.py)
was run successfully. Its independent subset dynamic program agrees
with the cycle/path, cofactor-block, and border formulas on the fixed
integer inputs. The published seed and the stated cofactor values
also pass. These computations check normalization; the all-order
divisibility result rests on the proof above.

The live
[C36 catalogue page](https://yair-lavi.com/mincs-list/conjecture-36/index.html)
was also opened and still labels the full conjecture open.
This review does not make a novelty claim for the auxiliary identities.
The completed full-entry count remains zero.

## 5. Root review receipt

Root independently checked the complete note. In the orbit argument,
equivariant bijections cannot match a moved orbit to a fixed vertex;
the two orbit phases are independent once their target orbits are
chosen. This gives the zero fixed-matching sum exactly, rather than
only modulo the prime. The entry-change argument correctly reuses
this proof on the untouched part even though the whole changed
matrix is no longer a tensor product.

The path transfer was checked from $`(HJ)^2=2R`$, including all
four possible path-length residues modulo four. The cofactor block
signs count the undeleted bottom rows or right columns after a half
swap. They give the stated repeated-border contraction with no
extra factorial. Root also reran the complete integer checker;
all assertions passed. The source definition and the published
$`T_5\{0\}`$ seed were checked directly in Wanless's Section 3.
The corrected order-eleven target is $`256`$.

No argument here constructs the required restricted recursive core
class or proves an even-output operation. The full-entry count is
unchanged.

