# Erdős 1192: energy and coverage separate for finite curves

21 November 2026. This note tests finite constructions for the [full all-orders mean-square basis target](target-and-prior-audit.md). The [finite-energy transfer](finite-energy-transfer.md) reduces one possible solution route to finding, for every fixed order $`r\ge2`$, finite bases in $`\mathbb F_p^r`$ with uniformly critical $`r`$-fold additive energy. This note does not construct those bases. It gives exact failures of two elementary candidates, not further bounty completions.

No priority is claimed for the moment-curve energy bound, finite-group Fourier inequality, or the elementary signed-curve calculation below. Ruzsa's order-two mean-square theorem is prior work; [Tang's primary reconstruction](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/4CF73C55F601E88C1E2A95792322E2BD/S0004972710000353a.pdf/note_on_a_result_of_ruzsa_ii.pdf) explicitly states that theorem and supplies quadratic finite-field blocks. The order-two argument in Section 4 is a scope comparison, not a claim to resolve a new problem.

## 1. Notation and the required finite statement

For a finite subset $`A`$ of an abelian group $`G`$, write

```math
R_{r,A}(s)=\#\{(a_1,\ldots,a_r)\in A^r:a_1+\cdots+a_r=s\},
\qquad E_r(A)=\sum_{s\in G}R_{r,A}(s)^2.
```

All tuples are ordered and repetitions are allowed. In the prime-field route the two needed assertions are

```math
rA=\mathbb F_p^r,
\qquad E_r(A)\le C_r p^r,
```

with one constant $`C_r`$ for all sufficiently large primes in a usable scale sequence. Neither assertion follows from the other.

## 2. Coordinate axes cover but have excessive energy

The union of the $`r`$ coordinate axes in $`\mathbb F_p^r`$ is an order-$`r`$ basis: represent a vector by its $`r`$ separate coordinates. This set has $`r(p-1)+1`$ elements, the desired cardinality order.

However, it contains the full line $`L=\mathbb F_p e_1`$. For each $`s\in L`$ there are exactly $`p^{r-1}`$ ordered representations using $`r`$ points of $`L`$. Consequently

```math
E_r(A)\ge E_r(L)=p^{2r-1}.
```

For every fixed $`r\ge2`$ this exceeds any constant multiple of $`p^r`$ as $`p`$ grows. Thus a thin finite basis, without further control on its sums, does not supply the transfer hypothesis.

## 3. The moment curve has critical energy but misses sums

Let $`p>r`$ and put

```math
v_r(t)=(t,t^2,\ldots,t^r),
\qquad C_r=\{v_r(t):t\in\mathbb F_p\}.
```

If two ordered $`r`$-tuples have the same vector sum, their first $`r`$ power sums agree. Newton's identities recover every elementary symmetric polynomial successively, since $`1,\ldots,r`$ are invertible in $`\mathbb F_p`$. Hence their monic root polynomials agree, and the multisets of parameters agree, with multiplicities.

Each ordered tuple has at most $`r!`$ permutations, so

```math
E_r(C_r)\le r!p^r.
```

The same argument shows that distinct parameter multisets give distinct sum vectors. Therefore

```math
|rC_r|=\binom{p+r-1}{r}.
```

This is smaller than $`p^r`$ for $`r\ge2`$: there are $`p^r`$ ordered tuples, and at least two distinct tuples have the same multiset. Thus this curve never covers the whole group in $`r`$ sums. For fixed $`r`$ its covered fraction tends to $`1/r!`$, which still leaves a positive fraction uncovered.

The exact inverse condition is that the monic degree-$`r`$ polynomial recovered from a target's power sums split completely over $`\mathbb F_p`$. Having its coefficients in the field does not imply that all its roots are in the field.

## 4. Signed quadratic curves repair coverage in the prior order

For odd $`p`$, let $`C=\{(t,t^2):t\in\mathbb F_p\}`$. If $`a\ne0`$, the equations

```math
x-y=a,\qquad x^2-y^2=b
```

have the unique solution determined by $`x-y=a`$ and $`x+y=b/a`$. Thus $`C-C`$ contains every vector with nonzero first coordinate. Swapping the coordinates produces a second difference set containing every vector with nonzero second coordinate. The zero vector is also a difference.

It follows that the union of these two curves and their negatives is an order-two basis of $`\mathbb F_p^2`$. Its energy is $`O(p^2)`$. To justify the latter without imposing a pointwise bound on representation counts, finite-group Fourier orthogonality gives

```math
E_r(B)=\frac1{|G|}\sum_{\chi\in\widehat G}
\left|\sum_{b\in B}\chi(b)\right|^{2r}.
```

The $`L^{2r}`$ triangle inequality, after partitioning overlapping sets into disjoint subsets and using monotonicity of energy, yields

```math
E_r\left(\bigcup_{j=1}^mB_j\right)^{1/(2r)}
\le\sum_{j=1}^mE_r(B_j)^{1/(2r)}.
```

Translations, negation, and invertible linear maps preserve energy. The four curves therefore have union energy at most $`4^4\cdot2p^2`$. Their potentially large zero-sum fibre is compatible with this mean-square bound. Bounded representation counts at every group element are stronger than this route requires.

## 5. Simply adding signs fails in order three

Let $`p>3`$ satisfy $`p\equiv1\pmod4`$, and let

```math
C=\{(t,t^2,t^3):t\in\mathbb F_p\},
\qquad A=C\cup(-C).
```

The preceding energy inequality gives $`E_3(A)\le2^6\cdot6p^3`$. Nevertheless, for a nonzero $`v\in\mathbb F_p`$,

```math
(0,v,0)\in3A
\quad\Longleftrightarrow\quad
2v\text{ is a quadratic residue in }\mathbb F_p.
```

Here a quadratic residue means a nonzero square, since $`v\ne0`$.

To prove the forward implication, classify the three summands by sign, permuting them if necessary. For three positive summands the first and third coordinate equations are

```math
x+y+z=0,\qquad x^3+y^3+z^3=0.
```

The identity $`x^3+y^3+z^3=3xyz`$ under the first equation forces $`xyz=0`$. The other two parameters are opposites. The second coordinate is therefore $`v=2x^2`$ for one parameter $`x`$, so $`2v`$ is a square. Three negative summands give $`v=-2x^2`$, with the same conclusion because $`-1`$ is a square.

For two positive summands and one negative summand, the equations are

```math
z=x+y,\qquad -2xy=v,\qquad -3xy(x+y)=0.
```

Since $`v\ne0`$ and $`p>3`$, the second equation gives $`xy\ne0`$, so the third forces $`y=-x`$ and $`z=0`$. Again $`v=2x^2`$. The remaining sign pattern is its negative and gives $`v=-2x^2`$.

Conversely, if $`2v=a^2`$, set $`x=a/2`$. Then

```math
v_3(x)+v_3(-x)+v_3(0)=(0,2x^2,0)=(0,v,0).
```

Exactly half of the nonzero $`v`$ fail this condition. Thus this signed curve misses $`(p-1)/2`$ vectors already on that one coordinate axis, for every prime $`p>3`$ congruent to one modulo four.

This does not exclude signed curves over other prime families, additional affine images of the curve, or entirely different finite bases. It disproves the simplest signed-curve covering claim, even though its energy is already sufficient.

## 6. Remaining obligation

Finite unions of a bounded number of invertible affine images of the moment curve retain critical energy by the displayed norm inequality. The unresolved step is to choose such images, or another construction, whose $`r`$-fold sumset covers the entire group for every required order. No such uniform construction was obtained. Applying the proved transfer theorem therefore still requires an unproved finite-family hypothesis. This attempt adds zero completed bounty problems.
