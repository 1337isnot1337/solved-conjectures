# Real van der Waerden radius

Within the real line-sum-one matrices of rank at most two, the sharp Frobenius radius in Sinkhorn's problem can be computed exactly in time polynomial in the order $n$. At each prescribed distance an extremizer is constant on four rectangles. This gives an algebraic upper bound on the unrestricted [Problem 13](https://yair-lavi.com/mincs-list/problem-13/index.html) in every order. Entries of either sign are allowed. The proof uses extrema on a two-moment slice, where the two-value principle is classical. [Riener and Schabert](https://arxiv.org/abs/2203.08727)

## Fixed-distance extremizers

The zero-line-sum part $B=A-J$ acts on the complement of the constant vector. Thus the rank bound is equivalent to $\operatorname{rank} B\le1$. Write $A_{ij}=(1+t x_i y_j)/n$, where $x,y$ both sum to zero and each has squared norm $n$. Here $t=\|A-J\|_F\ge0$. The normalized permanent is
$$
 H(t;x,y)=\frac1{n!}\sum_\sigma\prod_{i=1}^n(1+t x_i y_{\sigma(i)})
 =\sum_{j=0}^n\frac{e_j(x)e_j(y)}{\binom nj}t^j.
$$
Fix $t$ and $y$. On the compact sphere of centered $x$, choose a minimizer maximizing $\sum_i x_i^3$. If three of its coordinates are distinct, hold their sum and sum of squares fixed. These fix the first two coefficients of the monic cubic with those three roots. The third elementary symmetric function can vary in a small open interval while all three roots remain real, by simplicity of the roots. With the other coordinates fixed, the symmetric multiaffine objective is affine in that third coefficient. Having a minimum at an interior point forces constancy. But the sum of the cubes changes linearly with nonzero slope, contradicting its maximality. Thus $x$ has just two values; the variance rules out a single value. With this minimizing $x$ fixed, the identical argument reduces $y$. Starting with a global minimizer of the pair proves joint attainment. The same reasoning works for the maximum.

For $a$ copies of the positive value in $x$, the two values are $(n-a)/\sqrt{a(n-a)}$ and $-a/\sqrt{a(n-a)}$. Use $b$ on the other side, and put $D=\sqrt{a(n-a)b(n-b)}$. Define the rational polynomial
$$
 R_{ab}(w)=\sum_j
 \frac{\binom bj\binom{n-b}{a-j}}{\binom na}
 (1+w(n-a)(n-b))^j(1-wb(n-a))^{a-j}
 (1-wa(n-b))^{b-j}(1+wab)^{n-a-b+j}.
$$
The range runs from $\max(0,a+b-n)$ to $\min(a,b)$. This partitions the permutations by how many positive rows are matched to positive columns. The exact fixed-distance lower envelope is the least of $R_{ab}(t/D)$ over $1\le a,b<n$. Transposition and negating either vector let us use just $1\le a\le b\le\lfloor n/2\rfloor$ if we test both signs of $w$.

## First loss of the bound

The constant and linear coefficients of $R_{ab}(w)-1$ vanish. Its quadratic coefficient is positive by the displayed elementary-symmetric formula, since $e_2(x)=e_2(y)=-n/2$. Along either sign of the real line the first transition to negative values occurs at a root of odd multiplicity of $F_{ab}(w)=(R_{ab}(w)-1)/w^2$. An even-multiplicity contact alone imposes no radius restriction.

Take the monic product $O_{ab}(w)$ of the distinct factors with odd multiplicity in the squarefree decomposition of $F_{ab}$. The even polynomial $O_{ab}(w)O_{ab}(-w)$ is a polynomial in $w^2$. Substitute $w^2=s/D^2$ and take its squarefree part. The least positive real root among all the resulting polynomials is the **square of the sharp radius within the rank-two class**. If there is no root, the radius is infinite. Order two gives infinity. In every order $n\ge3$, the rank-two Hall construction gives a finite upper bound. [Hall witness](hall-bound.md)

The [exact implementation](rank_one_radius.py) uses rational coefficients and returns an exact real algebraic root or infinity. It can combine the $O(n^2)$ polynomials by least common multiples. Before combining, the degrees are $O(n)$ and the coefficient bit lengths after clearing denominators are polynomial in $n$ by the integer product formula. Squarefree operations and real root isolation have polynomial bit complexity in those parameters; even the unreduced product of all the polynomials has polynomial degree and bit length. This is a uniform computation in the order. It does not enumerate matrices on a rational grid or optimize over directions numerically.

The rank restriction is essential to the reduction: holding three row coordinates at two fixed moments is valid for a single real row factor. Searches for the signed Sinkhorn radius, rank-two permanent extrema and two-moment hyperbolic slices located the underlying extremal principle and the previously reported general radius bounds. They did not establish historical priority for this application. [Sinkhorn (1981)](https://doi.org/10.1080/03081088108817413) · [Cheon and Wanless](https://doi.org/10.1016/j.laa.2005.02.030)
