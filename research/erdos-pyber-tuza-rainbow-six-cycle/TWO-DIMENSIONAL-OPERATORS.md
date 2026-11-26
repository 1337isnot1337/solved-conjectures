# The parity classification for two-dimensional color operators

**Theorem.** Let six symmetric balanced graphon colors have the property that the mean-zero parts of their integral operators jointly act on a space of dimension at most two. If they have zero rainbow six-cycle density, the coloring is the exact three-and-three parity model. This includes all fractional balanced colorings with at most three vertex types, with arbitrary type measures. The rank assumption allows measurable kernels not presented as step functions and does not assume the color operators commute.

This advances [Erdős #811](https://www.erdosproblems.com/811) in a structured class; the unrestricted conjecture remains open. The key new step is that the zero-cycle identities themselves force commutativity in dimension two.

## Normalization and two inequalities

Use the normalized stochastic color operators $P_i=6W_i$, the constant projection $J_0$, and write $P_i=J_0+B_i$. On an orthonormal real basis for the joint mean-zero range (adding a zero direction if needed), the $B_i$ are symmetric $2\times2$ matrices with
$$\|B_i\|_{\rm op}\le1,\qquad \sum_i B_i=0.$$
Since all colored cycle integrals are nonnegative, zero rainbow density gives one equality per ordering:
$$\operatorname{tr}(B_{\sigma(1)}\cdots B_{\sigma(6)})=-1.$$
Indeed a normalized ordered cycle is the corresponding trace for $P_i$, and the constant block contributes one. For any three-color subset $S$ we also have
$$\|B_S\|_{\rm HS}^2\le9,\qquad B_S=\sum_{i\in S}B_i,$$
by integrating $(6W_S-3)^2$, since $0\le W_S\le1$ and its mean is $1/2$.

A useful additional condition here is
$$\operatorname{tr} B_i\ge-1.$$
To see it without making an assumption on diagonal values of the graphon, let $f(x)\in\mathbb R^2$ be the vector of basis values. The kernel for $P_i$ is $1+f(x)^\mathsf{T}B_i f(y)$ almost everywhere. The continuous bilinear expression is nonnegative on the Cartesian square of the support of the law of $f(x)$: any negative value there would give a negative value on a pair of positive-measure neighborhoods. In particular it is nonnegative at $(f(x),f(x))$ almost everywhere. Integrate and use orthonormality to get the trace bound.

## Disjoint commutator tests

Write
$$B_i=s_i I+x_i X+y_i Z,\qquad
 X=\begin{pmatrix}1&0\\0&-1\end{pmatrix},\quad
 Z=\begin{pmatrix}0&1\\1&0\end{pmatrix},\quad p_i=(x_i,y_i).$$
Thus $s_i\ge-1/2$ and $|s_i|+|p_i|\le1$. Both the scalars and the vectors sum to zero. A nonzero commutator of two colors with nonparallel vectors is a nonzero multiple of the same skew matrix $J=XZ$.

Suppose two disjoint pairs of colors have nonzero commutators, leaving colors $m,n$. Take the double differences of the mixed traces by swapping the two pairs, first with the pairs adjacent and then with $B_m$ between them. All four terms in each difference cancel because all ordered traces equal minus one. Since $J^2=-I$ and $J S J=S-(\operatorname{tr}S)I$ for symmetric $S$, we get
$$\operatorname{tr}(B_m B_n)=0,\quad
(\operatorname{tr}B_m)(\operatorname{tr}B_n)=0,
\quad\text{hence}\quad
s_m s_n=0,\qquad p_m\cdot p_n=0. \tag{1}$$

Let $k$ be the number of nonzero $p_i$. Any scalar matrix in the product has nonzero scalar, since otherwise the mixed trace could not be minus one.

- **$k\le2$.** The nonzero vectors are parallel since they sum to zero. The matrices already commute.
- **$k=3$.** At least one of the three scalar colors has scalar of absolute value at most $1/2$. Otherwise all three are positive and greater than $1/2$, contradicting $\sum_i s_i=0$ and the lower bound $s_i\ge-1/2$ on the other three. Factoring out that scalar bounds the mixed trace in magnitude by one. Equality requires its magnitude to be $1/2$ and the remaining product to have trace of magnitude two. A real contraction with trace of magnitude two in dimension two is $\pm I$, so every factor in that product is orthogonal (take determinants). The other scalar colors would both be $+I$, and the nonzero-vector factors would have scalar part zero. This contradicts $\sum_i s_i=0$. Thus this case cannot give zero density.
- **$k=4$.** If the vectors are not all parallel, no line contains three: one remaining nonparallel vector could not sum to a vector on that line. Hence they can be matched into two nonparallel pairs. The untouched two scalar colors contradict (1).
- **$k=5$, no line with more than two vectors.** Removing any nonzero vector leaves four that can be paired into two nonparallel pairs. Equation (1) with the remaining scalar color makes the removed color's scalar part zero. Thus all five nonzero-vector scalars vanish, forcing the sixth scalar to vanish too. This is impossible.
- **$k=5$, three vectors on one line.** A line with four and one outside is impossible by zero vector sum, so this is the only noncommuting case left for $k=5$. Apply (1) by leaving out each of the three on the line in turn and pairing the other two with the outside vectors. All three scalars on the line vanish. Rotate the basis so these matrices are multiples of $X$. Write the other two matrices as $B_A=s_A I+x_A X+yZ$ and $B_B=s_B I+x_B X-yZ$, where $y\ne0$. Let $\gamma$ be the remaining scalar color. If $|\gamma|\le 1/2$, the earlier contraction equality argument would force all five nonzero-vector matrices orthogonal and thus all their scalars zero, contradicting $\gamma\ne0$ and zero scalar sum. Otherwise $\gamma>1/2$, and $\gamma=-s_A-s_B$ forces both $s_A,s_B<0$. Put $a=-s_A,b=-s_B$, so $a,b\le1/2$ and $a+b=\gamma$. Take the ordering with the three $X$ factors consecutive; the absolute trace is at most $2\gamma|s_A x_B+s_B x_A|$. Because $y\ne0$, we have the strict bound
$$|s_A x_B+s_B x_A|<a(1-b)+b(1-a)
 =\gamma-2ab\le1/2.$$
Here $ab\ge(\gamma-1/2)/2$ follows from $(1/2-a)(1/2-b)\ge0$. As $\gamma\le1$, the absolute trace is strictly less than one, a contradiction.
- **$k=6$.** If every line has at most two vectors, any two colors can be left over after pairing the other four into nonparallel pairs. Equation (1) would make all six nonzero vectors pairwise orthogonal, impossible in the plane. If a line has three and is largest, leave one member of that line and one outside; the others can always be paired across the line. Thus all three outsiders are perpendicular to the line, making a second line of three. Also every cross pair has zero scalar product in (1), so at least one entire line of matrices has zero scalar part. Conjugating by the involution in the perpendicular direction preserves the other three factors and negates those three traceless factors. This forces trace zero. If a line contains exactly four, leave two on it and pair the other two across the line. Their nonzero dot product contradicts (1). A line with five and one outside contradicts zero vector sum.

For the matchings in this list, four nonzero vectors with no line class larger than two can always be paired across classes, by pairing the two in a largest class with the other two (or arbitrarily when all four are in different classes). Every noncommuting case has now been excluded.

## Commuting blocks and the parity cut

Simultaneously diagonalize the matrices and write the two eigenvalue lists as $(a_i)$ and $(b_i)$. They lie in $[-1,1]$, each list sums to zero, and $a_i+b_i\ge-1$. Write $A_0=\prod_i a_i$ and $B_0=\prod_i b_i$. Their sum is minus one.

If at least one product is nonnegative then the other must be exactly minus one. Suppose instead both are negative. If one color has both coefficients negative, then $|A_0|+|B_0|\le |a_i|+|b_i|\le1$. Equality would require all other five coordinates in each list to have magnitude one. Zero sum would force the negative $a_i$ and $b_i$ to have magnitude one as well, contradicting their sum bound. Thus the negative color sets must be disjoint.

If a negative list has only one negative or only one positive coefficient, its absolute product is at most $5^{-5}$ by zero sum and the arithmetic–geometric mean bound on the other five magnitudes. Therefore at least one list has three negative coefficients; call it $(b_i)$ and let $S$ be its three negatives. On $S$ all $a_i$ are positive. Put $A=\sum_{i\in S}a_i$ and $B=-\sum_{i\in S}b_i$. Our Hilbert–Schmidt bound gives $A^2+B^2\le9$. The other three $b_i$ sum to $B$, and the remaining $a_i$ have absolute value at most one. Hence
$$|A_0|+|B_0|
 \le (A/3)^3+(B/3)^6
 < (A/3)^2+(B/3)^2
 \le1,$$
where both normalized numbers are strictly between zero and one. This is a contradiction.

Thus one eigenvalue list has product minus one. Every entry there is $+1$ or $-1$, and zero sum gives exactly three of each. The union of the three plus colors, normalized to be stochastic, fixes the corresponding nonconstant eigenfunction. By the Dirichlet identity, its positive edges join only equal values of that eigenfunction. A nontrivial measurable cut between unequal values exists. Each side must have measure at least $1/2$ by the union's degree, so both are halves and the union is exactly the within-part indicator. The other colors cross. This is the claimed parity graphon.

The trace and Hilbert–Schmidt normalization are the same as in [the homogeneous analysis](ALL-CAYLEY.md). The diagonal-support trace constraint and dimension-two commutator classification remove any symmetry assumption at this rank. The [original problem](https://doi.org/10.1016/S0167-5060(08)70377-7), [modern balanced-color work](https://doi.org/10.1002/jgt.23063), and [earlier three equal-type reduction](GRAPHON-CRITERION.md) do not state this rank classification. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
