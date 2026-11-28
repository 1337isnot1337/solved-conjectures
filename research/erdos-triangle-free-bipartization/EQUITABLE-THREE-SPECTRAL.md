# A spectral cut bound for link-balanced regular three-colorings

All-order partial result for [Erdős Problem 23](https://www.erdosproblems.com/23). Suppose a triangle-free graphon is regular of ordered density p, has three independent classes, and almost every vertex has the same degree to each of its two other classes. Then if 31/100≤p≤3197/10000 its ordered monochromatic mass is at most 28/375, strictly below 2/25. These are explicit structural assumptions on the entire graph, not numerical restrictions on its order. No implication is asserted for arbitrary three-colorings or the rest of the density band.

## 1. Remove the color quotient

Write T for the self-adjoint integral operator of W. Each vertex has degree p/2 into each other class. The three class masses are therefore equal, by integrating one cross-class link in both directions. On the orthonormal normalized class indicators, T has quotient matrix with zero diagonal and all off-diagonal entries p/2, hence eigenvalues p, −p/2, −p/2.

Let T₀ be the restriction to functions of mean zero on each class, extended by zero on the quotient. This operator still has zero diagonal blocks on the three classes. Triangle-freeness gives trace(T³)=0. The two residual trace identities or bounds are

```math
 \mathop{\mathrm{Tr}}(T_0^3)=-3p^3/4,\qquad
 \mathop{\mathrm{Tr}}(T_0^2)\le p-3p^2/2.
```

The square bound uses ∫∫W²≤p. The [p-energy theorem of Elphick, Tang and Zhang, Theorem 1.8 and Remark 1.9](https://arxiv.org/html/2504.01295) applied with exponents 2 and 3 says that the negative square energy is at most twice the positive square energy, and the negative cubic energy at most four times the positive cubic energy, for an operator supported off three diagonal blocks. To pass from finite Hermitian weighted matrices to T₀, take piecewise-constant compressions within the three classes that converge in Hilbert–Schmidt norm. The diagonal blocks stay zero, and the positive and negative square and cubic energies converge by Schatten continuity. The finite theorem permits signed off-diagonal entries.

Writing a_i for the absolute values of the negative eigenvalues of T₀ gives, in particular,

```math
 \sum_i a_i^2 \le (2/3)(p-3p^2/2),\qquad
 \sum_i a_i^3 \ge p^3.
```

The latter follows because the cubic energy difference equals 3p³/4 and the positive cubic energy is at least one quarter of the negative.

## 2. A residual eigenvalue at most −0.96p

Divide eigenvalues by p. For p≥31/100 the sum of the normalized negative squares is at most 107/93, and the sum of the normalized negative cubes at least one. If all normalized magnitudes were ≤r=24/25, then the cube sum would be at most

```math
 r^3 + (107/93-r^2)^{3/2} < 1.
```

For the first bound, use convexity of x^(3/2) on the squared magnitudes subject to the upper cap r². Concentrating a fixed sum into as many entries at cap as possible and at most one remainder maximizes this convex sum. The budget 107/93 is between r² and 2r²; it can be used even if the actual sum is smaller. For the strict inequality, 107/93−r²=13307/58125<0.23, whose square root is below 0.48; the sum is less than 0.884736+0.1104. Thus T has a negative eigenvalue −t with t>0.96p.

## 3. Round the eigenfunction, using the positive spectral gap

Every positive eigenvalue of T on the orthogonal complement of the constant function is ≤1/4. Indeed a real mean-zero eigenfunction for a positive λ has nonzero positive and negative parts of support masses s₊ and s₋. For each part, say f₊, nonnegativity gives λ||f₊||₂²≤⟨f₊,Tf₊⟩. Weighted Mantel applied with vertex density f₊ bounds the latter by one half of (∫f₊)², hence at most s₊||f₊||₂²/2. Apply also to the negative part and use min(s₊,s₋)≤1/2. Weighted Mantel here follows, for example, by sampling finite triangle-free graphs under the normalized weighted measure.

Let f be a real unit L² eigenfunction of eigenvalue −t, and put α=∫|f|. Pointwise nonnegativity of W gives ⟨|f|,T|f|⟩≥t. Decompose |f| into its constant part and orthogonal remainder, giving

```math
 1-\alpha^2 \le \frac{p-t}{p-1/4}.
```

The sign s of f, with either convention at zeros, has unit norm and ⟨s,f⟩=α. The operator norm of T is at most its constant degree p by the Schur bound. Decompose s along f and its orthogonal complement. Its ordered cut cost is at most

```math
 \frac{p-t+(p+t)(1-\alpha^2)}{2}
 \le \frac{0.04p}{2}\left(1+\frac{2p}{p-1/4}\right)
 \le \frac{28}{375}.
```

The last inequality uses p≤0.32 and p−1/4≥0.06. In particular this is a genuine cut, not just a bound on a signless Laplacian relaxation.

Everything here holds for finite graphs of any order by taking their step graphons; the normalization is exactly the one in the conjecture. The spectral p-energy comparison is prior work. What matters in this application is reserving the known color-quotient moments, then enforcing concentration of the remaining negative spectrum before rounding. Approximate bidegree balance or lower densities would need additional estimates.

## An explicit perturbation allowance

The same density interval and sharp target hold without exact regularity if the proper three-coloring satisfies the following aggregate degree test. With d_j(x) the degree into class j, put

```math
 \epsilon=\sum_i\ \sum_{j\ne i}\int_{A_i}|d_j(x)-p/2|\,dx.
```

If ε≤10⁻⁸, there is a cut of ordered cost at most 0.077. This constant merely gives an explicit neighborhood; it is not intended to be optimal.

Let a_i be the class masses. Integrating each cross link in both directions gives |a_i−a_j|≤2ε/p, so each a_i>0.32. Write P=QTQ and S=(1−Q)T(1−Q), where Q projects onto the span of the normalized class indicators. Let R=T−P−S. Its two off-diagonal blocks between Q and 1−Q are transposes. On the indicator of class j divided by √a_j, subtracting p/2 on the other classes gives an upper bound on the squared projection error. Summed over columns this yields

```math
 \|R\|_{\mathrm{HS}}^2
 \le 2\epsilon/\min_i a_i <7\epsilon,
```

since every integrand |d_j(x)−p/2| is bounded by one. The three-class matrix of P has zero diagonal and off-diagonal entries E_ij/√(a_i a_j), where E_ij=∫_(A_i) d_j. Those entries differ from p/2 by less than 7ε: the numerator differs from (p/2)√(a_i a_j) by at most ε+(p/2)|a_i−a_j|≤2ε. Consequently |Tr P²−3p²/2|≤16ε and |Tr P³−3p³/4|≤4ε, using entry bounds 0.17 and the three-by-three zero-diagonal trace formulas.

In the trace of T³, the terms with one or three factors R vanish by the two-block decomposition, and the terms with two factors sum to 3 Tr((P+S)R²). Their magnitude is below 12ε because ||P+S||_op≤||T||_HS≤√p<0.57. Hence

```math
 \mathop{\mathrm{Tr}}S^3\le-3p^3/4+16\epsilon,\qquad
 \mathop{\mathrm{Tr}}S^2\le p-3p^2/2+16\epsilon .
```

The three diagonal color blocks of S are still zero. Apply the p-energy comparison to S as before. Its normalized negative square energy is at most 107/93+112ε and the normalized negative cubic energy at least 1−720ε. Capping every negative magnitude at 24/25 times p would still make the remainder in the cube calculation less than 0.23; its cube sum would be below 0.995136, a contradiction. Thus T itself has a least eigenvalue −t with t>0.96p, by testing T on a negative eigenvector of S.

For rounding, the second largest positive eigenvalue of any triangle-free T is at most 1/4. The sign-changing eigenfunction proof above applies without regularity. In the remaining case an eigenfunction orthogonal to a nonnegative Perron eigenfunction is nonnegative up to sign. Their supports are disjoint, and each has mass at least twice its eigenvalue, by the same weighted Mantel Rayleigh bound. This also gives the 1/4 conclusion. Let u be a nonnegative unit Perron eigenfunction and λ its eigenvalue. Since T1=d and ||d−p||₂≤√ε,

```math
 \lambda\le p+2\sqrt{\epsilon},\qquad
 \|(1-Q_1)u\|_2\le\sqrt{\epsilon}/(p-1/4),
```

where Q₁ projects onto constants. Indeed λ≥p, u≤(∫u)/λ, and therefore ∫u≥√λ. Now use (λ−p)∫u=∫u(d−p) for the first bound, and apply T−p to the component of 1 orthogonal to u for the second.

Let f be a unit least eigenfunction and h=|f|. Since ⟨h,Th⟩≥t and the second eigenvalue is at most 1/4,

```math
 \|(1-uu^*)h\|_2^2\le(\lambda-t)/(\lambda-1/4)\le13/60 .
```

The triangle inequality projects h off 1 with norm at most √(13/60)+1/600<0.468. Thus the squared projection of h off 1 is below 0.22. As before, decompose the sign of f along f. The complementary Rayleigh quotient is at most λ, so the ordered cut costs at most

```math
 \tfrac12\left[p-t+(\lambda+t)\bigl(1-(\int h)^2\bigr)\right]
 <\tfrac12(0.0128+0.6404\cdot0.22)<0.077 .
```
