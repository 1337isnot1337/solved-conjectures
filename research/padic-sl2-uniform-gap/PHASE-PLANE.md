# A uniform spectral bound near algebraic curves in position and frequency

Fix an odd prime $`p`$. Let $`P`$ be the six-move averaging operator on the ordinary projective ball with $`N=p^M`$ points, in the coordinate $`y`$ for the slope $`p y`$. Use the new space orthogonal to functions from modulus $`p^{M-1}`$. There is an absolute $`\rho_*<1`$ with the following property. Choose any fixed degree $`D`$ and threshold $`\alpha>\rho_*`$ with $`\alpha\le1`$. At precisions $`r\to\infty`$ with $`2r\le M`$, the portion of any unit vector in the spectral space $`\mathbf1_{[\alpha,1]}(P)`$ that lies over a plane curve of degree at most $`D`$ tends to zero. The bound is uniform over generating triples, curve coefficients and vectors. The plane has one position coordinate and one frequency coordinate, as specified below.

For example, the result covers the entire space of frequencies in a single primitive residue class modulo $`p^r`$, even when $`r`$ grows arbitrarily slowly relative to $`M`$. It also covers frequency conditions that vary algebraically with position. The [cycle Fourier estimate](CYCLIC-FOURIER.md) tested the cardinality and spacing of sets of labels in the coordinate of a cyclic word. Here the frequency coordinate is the ordinary Fourier coordinate of $`y`$, and the threshold $`\alpha`$ can be held fixed below one.

## The finite projections

Fix $`\kappa\in\{1,\ldots,p-1\}`$. Within the position class $`y=y_0\bmod p^r`$, project onto the functions obeying

```math
f(y+p^{M-r}t)=e_{p^r}(\xi t) f(y),\qquad
e_q(t)=\exp(2\pi i t/q),\qquad \xi\equiv\kappa\pmod p .
```

Position restriction and this character projection commute since $`M-r\ge r`$. Together the pairs $`(y_0,\xi)`$ for all $`\kappa`$ decompose the full new space orthogonally. Each pair has rank $`p^{M-2r}`$. Write $`u^2=\xi/\kappa`$ with $`u=1\bmod p`$, and $`v=u y_0\bmod p^r`$. The square root is unique by successive lifting at odd $`p`$. In each sector the labels are the reductions of

```math
O=(1+p\mathbb Z_p)\times\mathbb Z_p\ \subset\ \mathbb Z_p^2.
```

For an integral polynomial $`F`$ in two variables having at least one unit coefficient, let $`E_r(F)`$ sum the projections for the labels $`(u,v)`$ with $`F(u,v)=0\bmod p^r`$ in this sector. The claimed bound is

```math
\sup_{S,\kappa,\,\deg F\le D}\,
\big\|E_r(F)\mathbf1_{[\alpha,1]}(P)\big\|\longrightarrow0
\quad(r\to\infty,\ M\ge 2r).
```

In particular the upper spectral edge of the operator compressed to any such tube is at most $`\rho_*+o(1)`$ as $`r\to\infty`$. Indeed the spectral theorem bounds the Rayleigh quotient $`\langle Pf,f\rangle`$ of a unit vector in the tube above by $`\alpha+(1-\alpha)\|\mathbf1_{[\alpha,1]}(P)E_r(F)\|^2`$. Then take $`\alpha\downarrow\rho_*`$.

The left action of $`g=\left(\begin{smallmatrix}a&b\\c&d\end{smallmatrix}\right)\in K`$ transports packet labels by the linear map

```math
A(g)\binom{u}{v}
=\begin{pmatrix}a&pb\\ c/p&d\end{pmatrix}\binom{u}{v}.
```

Indeed the action on points is $`y'=(c/p+dy)/(a+pb y)`$. A shift by $`h=p^{M-r}t`$ changes $`y'`$ by $`h/(a+pb y)^2\bmod p^M`$, using the determinant and $`2(M-r)\ge M`$. For the action on functions $`f\mapsto f\circ g^{-1}`$, the new frequency is therefore $`\xi(a+pb y_0)^2\bmod p^r`$. The chosen square root transforms by $`u'=(a+pb y_0)u`$ and $`v'=u'y'`$. This proves exact covariance, including for sums of labels. It also identifies all the spectra used here with the action of the original walk.

## A bound for returns to a subgroup

Consider any sequence of generating triples and levels as in the theorem. Pass to a subsequence so that the triples converge in $`K^3`$. The limiting triple still generates $`K`$ topologically because generation is determined by the first Lie digits. The matrices $`A(g)`$ of its generators generate an abstract countable group $`\Gamma`$ whose closure is conjugate to $`K`$. It is Zariski dense in $`\mathrm{SL}_2`$ and nonamenable by the Tits alternative.

Let $`L`$ be an absolute word bound from the strong Tits alternative in dimension two. Two words of length at most $`L`$ in the six moves freely generate a group of rank two. Its four-move walk has norm $`\sqrt3/2`$ on $`\ell^2(\Gamma)`$, by decomposing into copies of its regular representation. For the original symmetric walk, each generator displacement of a unit vector is at most $`\sqrt{6(1-\langle P f,f\rangle)}`$. Telescoping the two words and comparing Dirichlet energies bounds the regular norm of the original walk by

```math
\rho_* = 1-\frac{1-\sqrt3/2}{3L^2}<1.
```

The upper edge bounds the full norm here by positivity of the walk kernel. If $`H\le\Gamma`$ is amenable, the norm on $`\ell^2(\Gamma/H)`$ is bounded by the regular norm. Equivalently, one can lift finitely supported test vectors on the cosets to vectors constant on large finite Følner sets in their $`H`$ fibers. Consequently the probability that a $`2k`$-step word at the limiting triple lies in $`H`$ is at most $`\rho_*^{2k}`$. [Breuillard, strong Tits alternative](https://arxiv.org/abs/0804.1395) · [Amenable point stabilizers and the regular norm](https://arxiv.org/html/2512.15364v1)

For any orthogonal projection $`E`$ onto a collection of packet labels at a finite level, the spectral theorem gives

```math
\|E\mathbf1_{[\alpha,1]}(P)\|^2
\le\alpha^{-2k}\|E P^{2k} E\|.
```

The norm on the right is at most the probability of the words whose label permutation takes at least one selected label back to the collection. This follows by expanding the average and using exact covariance. Each surviving compression has norm at most one.

## Points and irreducible curves

First take labels approaching a single point $`z\in O`$. For each fixed $`k`$, any word of length $`2k`$ whose limit moves $`z`$ eventually has disjoint source and target label sets. Continuity of matrix multiplication and compactness of $`O`$ give this even when the triples vary. The stabilizer of $`z`$ in $`\Gamma`$ is amenable since a matrix fixing a nonzero vector in $`\mathrm{SL}_2`$ is unipotent in a basis containing that vector. The preceding two inequalities give a limiting upper bound $`(\rho_*/\alpha)^k`$ for the projected norm. Taking $`k\to\infty`$ gives zero. In particular, for the point neighborhoods of fixed radius $`p^{-l}`$ the same conclusion holds when first taking the upper limit over the sequence and then letting $`l\to\infty`$. Otherwise a diagonal subsequence with $`l\to\infty`$ would violate the shrinking-neighborhood result. Finite unions of points obey the same vanishing statement.

Now suppose that all chosen labels approach the set $`C\cap O`$ for one irreducible affine plane curve $`C`$ over $`\overline{\mathbb Q}_p`$. Use the maximum $`p`$-adic norm on $`O`$ and regard a label as its residue cell. The set $`C\cap O`$ is compact. Its setwise algebraic curve stabilizer $`H=\{g\in\Gamma:gC=C\}`$ is amenable. In fact the algebraic stabilizer preserves the line of the irreducible defining polynomial under linear substitution. It is a proper algebraic subgroup of $`\mathrm{SL}_2`$, since $`\mathrm{SL}_2`$ acts transitively on all nonzero vectors over the algebraic closure. The identity component of a proper subgroup has dimension at most two and is solvable, and the component group is finite. Intersect with $`\Gamma`$.

For a fixed time $`2k`$, consider all words whose limiting matrices $`g`$ lie outside $`H`$. The intersections $`C\cap g^{-1}C`$ are finite by Bézout's theorem for distinct irreducible plane curves. Remove from the selected labels a radius-$`p^{-l}`$ neighborhood of every point of these intersections in $`O`$. For fixed $`k,l`$, each of the indicated words eventually takes the remaining labels disjointly away from themselves. Otherwise two returning labels have a subsequence with limits $`z,gz\in C\cap O`$, with $`z`$ outside the removed neighborhood. This contradicts the choice of the points. The surviving word probability is at most $`\rho_*^{2k}`$ at the limiting marking. Thus the upper limit of the projected norm on the remaining labels is at most $`(\rho_*/\alpha)^k`$. For this fixed $`k`$, the portion in the removed neighborhoods tends to zero as $`l\to\infty`$, by the point result. Taking $`k\to\infty`$ proves the assertion for $`C`$.

Finally, the bounded-degree primitive polynomials $`F`$ in any proposed countersequence have a coefficientwise convergent subsequence with nonzero limit $`F_\infty`$. The limit of any sequence of selected labels must be a zero of $`F_\infty`$ in $`O`$. If there are no such zeros, the selections are eventually empty. Otherwise the labels approach the union of the finitely many irreducible components of that zero set over $`\overline{\mathbb Q}_p`$. Assign each label to a component with nearest nonempty intersection with $`O`$. Compactness shows that the maximum of those distances tends to zero. Apply the curve result to each component and add their finitely many projected norms. This proves uniformity by contradiction.

## Distribution at a precision chosen from the energy

There is also a quantitative statement for arbitrary sets of packet labels. In one sector let $`f`$ be a unit vector of energy $`e=1-\langle Pf,f\rangle`$, and let $`\nu_r(z)`$ be its squared norm in the packet at $`z\in O\bmod p^r`$. Then

```math
\|\nu_r-\mathrm{unif}\|_{\rm TV}\le
\sqrt{e/g(G_{r+1},S)}\ll_p\sqrt{(r+1)e}.
```

Indeed $`a(z)=\sqrt{\nu_r(z)}`$ has energy at most $`e`$ by covariance and the reverse triangle inequality in each packet. The action on labels factors through $`G_{r+1}`$ because of the entry $`c/p`$. It is transitive since the matrix with first column $`(u,pv)^t`$, upper-right entry zero and lower-right entry $`u^{-1}`$ belongs to $`K`$. For the uniform unit vector $`h`$, the Poincaré inequality therefore gives $`1-\langle a,h\rangle^2\le e/g(G_{r+1},S)`$. Cauchy–Schwarz applied to $`(a-h)(a+h)`$ bounds total variation by the square root of this variance. The last estimate uses the existing all-triples gap at that finite depth. For multiple sectors, compare with the mixture of uniform laws having the same sector masses and apply Cauchy–Schwarz over the sectors. Thus at every precision with $`2r\le M`$ and $`(r+1)e\to0`$, a slow vector's distribution over all these joint position and frequency labels approaches this mixture in total variation. [Finite-depth lower bound, previous project notes, entries 52 and 128](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539)

The integer check computes the projective permutations directly, compares their action on long translations with the displayed linear action, and verifies the packet counts and ranks. It covers 1,214,352 transported labels at powers of 3, 5 and 7. Run `python3 -B research/padic-sl2-uniform-gap/check_phase_plane.py`. [Verification script](check_phase_plane.py)

The proof controls vectors close to a curve in these two coordinates. A high eigenvector can still distribute its mass throughout the two-dimensional set $`O`$. The uniform gap in issue #592 remains open. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/592)
