# How far can separated linear tests certify primitivity?

This note concerns Shallit’s £200 problem about the context-freeness of primitive binary words. Write $`x_i`$ for the number of $`b`$ letters in record $`i`$ of $`ab^{x_0}\cdots ab^{x_{n-1}}`$. Write $`V_p`$ for the space of vectors periodic with period $`n/p`$, for each prime $`p\mid n`$. Primitivity means lying outside all these spaces. Kászonyi’s Flip-Flop lemma uses linear tests on separated supports as sufficient context-free certificates. We give an exact consecutive-window calculation and a primitive family defeating any number of pairwise separated linear tests. A fixed context-free language recognizes a certificate for that same family. [Kászonyi, in particular p. 316](https://publi.math.unideb.hu/paper/1506/download/10_5486_PMD_2010_4680.pdf) · [Sponsor’s question](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf)

## Shortest possible window for a common linear test

For a nonempty group $`S`$ of prime divisors, set
```math
B_S(z)=\mathop{\mathrm{lcm}}_{p\in S}(z^{n/p}-1),
\qquad d_S=\deg B_S=n\left(1-\prod_{p\in S}(1-1/p)\right).
```
Take monic least common multiples. All roots are simple. Among the $`n`$th roots, a root with frequency $`h\in\mathbb Z/n`$ is a root of $`z^{n/p}-1`$ precisely when $`p\mid h`$. Counting their union proves the degree formula.

A nonzero real linear form supported in a cyclic interval of $`\ell`$ coordinates that annihilates every $`V_p`$, $`p\in S`$, requires $`\ell\ge d_S+1`$. Rotate the interval to start at 0 and use its coefficients as a polynomial $`A`$ of degree at most $`\ell-1`$. Vanishing on the period-$`n/p`$ residue indicators means its coefficients sum to zero separately in each residue modulo $`n/p`$. Equivalently $`z^{n/p}-1`$ divides $`A`$. Thus $`B_S`$ divides $`A`$. Its own coefficients attain the lower bound.

This also supplies an affirmative test for arbitrary input vectors. Write $`T`$ for the forward cyclic shift. Let $`r_S`$ be the number of nonzero Fourier coefficients of $`x`$ at frequencies coprime to every $`p\in S`$. If $`r_S>0`$, some entry of $`B_S(T)x`$ is nonzero in every $`r_S`$ consecutive positions. These entries form an exponential sum on exactly $`r_S`$ distinct bases; the square Vandermonde matrix on any $`r_S`$ consecutive positions is invertible.

Suppose $`S_1,\ldots,S_h`$ partition all prime divisors of $`n`$, all $`r_{S_j}>0`$, and
```math
\sum_j(d_{S_j}+r_{S_j})-\max_j r_{S_j}+1\le n.
```
Start with a nonzero entry for the group attaining the maximum. This test uses $`d_{S_j}+1`$ consecutive positions. For each further group, the next $`r_{S_j}`$ possible starting positions after the preceding window contain a nonzero entry; its window ends within the next $`d_{S_j}+r_{S_j}`$ sites. The bound makes the windows disjoint. For fixed $`n`$ the possible groups and placements are finite. The nonzero integer sums on the disjoint windows are checked by a pushdown automaton, storing the signed sum of the current test and clearing it at the end of the window. A window straddling the input boundary can store its partial sum beneath a stack marker while the interior windows are checked. This gives a context-free sublanguage of the primitive slice covering every vector satisfying the inequality. It need not recognize the condition on the Fourier support itself.

## A family outside every separated system

Call two supports separated if they are disjoint and do not interlace in cyclic order: there are disjoint complementary arcs containing the respective supports. Consider clauses requiring that finitely many affine forms are all nonzero, with all their supports pairwise separated. A clause is safe if it accepts only primitive run words. The argument also allows a regular guard on each clause in any finite collection.

**Theorem.** For any odd squarefree $`a`$ with $`\prod_{p\mid a}(1-1/p)\le1/4`$, no finite union of such guarded safe clauses covers the primitive slice with $`n=2a`$ runs. Without guards a single explicit vector defeats every such safe clause, with no bound on their number or width.

Define $`e_i=1[2\mid i]+1[a\mid i]`$. Its parity part has period 2, and its second part is supported at $`0,a`$. Shifting by $`a`$ preserves the second part and flips parity. Shifting by $`n/p`$ for an odd $`p\mid a`$ preserves parity and moves the two spikes. Thus $`e`$ is primitive.

For clarity take no guards first. For each prime $`p`$, safety implies that some form vanishes identically on $`V_p`$: the product of the forms vanishes on the entire nonnegative integer grid in the independent coordinates of $`V_p`$, hence as a polynomial on $`V_p`$. The polynomial ring has no zero divisors. Every form assigned this way is homogeneous since $`0\in V_p`$. Choose one assigned form per prime, possibly assigning several primes to a form. Discard unassigned forms. Suppose all chosen forms are nonzero at $`e`$.

The form assigned 2 annihilates the two-spike part. Its coefficients on every antipodal pair are opposite, so its support includes some complete antipodal pair. No form can be assigned both 2 and an odd prime: it would also annihilate the parity part and vanish at $`e`$. Every form assigned odd primes must contain 0 or $`a`$ in its support or it, too, would vanish at $`e`$. Disjointness leaves at most two such forms. Separation from the complete antipodal pair places each support wholly inside one of its open semicircles, a window of at most $`a-1`$ sites. For its assigned group $`S`$ the window bound implies $`d_S+1\le a-1`$, so
```math
\prod_{p\in S}(1-1/p)>1/2.
```
Multiplying over the at most two groups forces the product for all odd primes to exceed $`1/4`$. This is the contradiction. The argument uses the occupied positions of the forms and allows arbitrary real coefficients.

With finitely many regular guards, choose $`C,T>0`$ so that all powers $`b^{C+Tt}`$, $`t\ge0`$, act identically on each guard automaton. A guard accepting $`C\mathbf1+Te`$ accepts the whole exponent grid $`C\mathbf1+T\mathbb N_0^n`$. Apply the product-polynomial argument on each $`V_p`$ inside this grid. Its affine hull is still $`V_p`$. Each assigned form again annihilates $`\mathbf1`$, so its value at the chosen vector is $`T`$ times its value at $`e`$. The same contradiction follows.

The odd primes through 79 suffice. Their exact residual product is $`39984074138195066880000/160641196252057433216413<1/4`$. One may adjoin arbitrary further distinct odd primes. The same counting gives an overlap bound if odd tests may instead share coordinates but each still fits in an open semicircle. At least $`h`$ odd tests are needed with $`2^{-h}<\prod_{p\mid a}(1-1/p)`$, and some spike must be read by at least $`\lceil h/2\rceil`$ of them.

## Why this is a method obstruction

A single grammar, independent of $`a`$, can certify these very words and their guarded translations. Group adjacent records into ordered pairs. Require that the even run is longer than the odd run in every pair except for one equality, and require at least one strict pair. Each pair language is context-free by a one-stack comparison, and concatenation and Kleene star express the unique equality. On the proposed vectors the ordinary differences are 1, apart from a single 2 and a single 0; adding a constant and multiplying by a positive number preserve these comparisons. An odd record period would force zero alternating sum, and an even proper period would repeat the equality pair. Thus this fixed language contains only primitive words. This is the adjacent-comparison construction from the [earlier affine analysis](affine-certificate-obstruction.md), with either location for the equality.

Even replacing disjoint windows by separated supports can matter at small run counts. At $`n=210`$ the parity test needs at least 106 sites in a window, while the odd primes together need at least 115. Splitting the odd group cannot reduce the sum of its window widths, since the degree counts a union of root sets. Thus disjoint windows cannot certify the displayed two-spike vector. Yet a parity test on $`209,104`$ leaves the two open semicircles available. Use $`B_{\{3\}}`$ starting at 0 and $`B_{\{5,7\}}`$ starting at 105; their degrees are 70 and 66, so the supports are separated from the parity test and each other. Each output is nonzero because the parity background is annihilated and only the first coefficient meets a spike. The [exact checker](check_separated_witnesses.py) verifies the polynomials, the values and the large-prime obstruction.

The ordinary context-freeness question and the £200 prize remain open. No novelty claim is made for the polynomial or Fourier ingredients.
