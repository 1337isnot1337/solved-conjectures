# Barrett–Evans–Hall–Kempton’s spectrally extreme graph conjecture

**Strict endpoint inequalities from diameter.** If a simple graph and its complement are connected, then the strict endpoint inequality
$`x+y-2\max(x,y)/n>1`$ holds if either diameter is at least four. It also holds if $`n\ge11`$ and the larger connectivity is at least one. Here $`x`$ and $`y`$ are the two algebraic connectivities.

## Diameter four

Let $`G`$ have diameter four. Choose vertices $`u,v`$ at distance four. Take the breadth-first layers from $`u`$, and move all vertices at distance four except $`v`$ to the third layer. The five resulting parts have sizes $`(1,a,b,c,1)`$ with $`a,b,c\ge1`$. Every edge of $`G`$ stays within a part or goes between consecutive parts. Add all edges of these types to form $`H`$. Laplacian positive-semidefinite monotonicity gives $`\lambda_n(G)\le\lambda_n(H)`$.

On the normalized part-constant coordinates the Laplacian of $`H`$ is a symmetric tridiagonal matrix $`Q`$ with diagonal $`(a,b+1,a+c,b+1,c)`$ and adjacent off-diagonal squares $`(a,ab,bc,c)`$. Every within-part zero-sum mode has eigenvalue the total size of that part and its neighbors, at most $`n-2`$ for any part supporting such a mode. Set $`n=a+b+c+2`$ and $`z=(n+\sqrt{n^2-4n})/2\in(n-2,n-1)`$.

Let $`D_i(X)`$ be the $`i`$th leading principal determinant of $`XI-Q`$. Use $`D_0=1`$, $`D_1=X-a`$, and $`D_i=(X-Q_{ii})D_{i-1}-Q_{i,i-1}^2D_{i-2}`$. Reduce each determinant modulo $`X^2-nX+n`$ to a linear remainder $`R_i`$. To verify that the first four are positive at $`z`$, write $`A=a-1,B=b-1,C=c-1`$. The endpoint evaluations, written as $`R_i(n-2)`$ and the increment $`R_i(n-1)-R_i(n-2)`$, are:

| $`i`$ | $`R_i(n-2)`$ | Increment |
|---|---|---|
| 1 | $`B+C+2`$ | $`1`$ |
| 2 | $`AB+AC+2A+BC+2B+C^2+4C+2`$ | $`C+2`$ |
| 3 | $`AC+2A+B^2C+B^2+BC^2+5BC+3B+2C^2+6C+2`$ | $`-A+BC+B+2C+1`$ |
| 4 | $`A^2C+A^2+2ABC+2AC^2+7AC+2A+BC^2+3BC+B+C^3+5C^2+5C+1`$ | $`AB+AC+2A+C^2+3C`$ |

Both endpoints are positive, even in row 3 where the increment can be negative. The last remainder is
$`R_5(X)=n[(ac-1)(X-2)+b(a-1)(c-1)]`$. It is nonnegative at $`z`$, and positive unless $`a=c=1`$. Since the leading four block is positive definite, its Schur complement is nonnegative exactly when the determinant of the full matrix is nonnegative. Therefore $`zI-Q`$ is positive semidefinite. This proves the sharp bound $`\lambda_n(G)\le z`$; the chain with $`a=c=1`$ realizes equality at every order.

Now $`y=\lambda_2(G^c)=n-\lambda_n(G)\ge n-z>1+1/(n-2)`$. For the strict inequality, the function $`t(n-t)`$ is increasing up to $`n/2`$ and at $`t=1+1/(n-2)`$ its value is $`n-1/(n-2)^2`$. The diameter bound gives $`x\ge 1/n`$: Cauchy–Schwarz on a path of length at most four between the extrema of a unit mean-zero vector gives energy at least one quarter of its squared range, which is at least $`4/n`$ by the variance bound. Consequently $`x+(1-2/n)y>1`$.

## Diameter at least five, or larger connectivity at least one

If the diameter is at least five, every union of open neighborhoods of adjacent vertices misses at least two vertices. Indeed their neighborhoods together meet at most four consecutive breadth-first layers from an endpoint of a diameter geodesic. The degree-union upper bound gives $`\lambda_n(G)\le n-2`$, hence $`y\ge2`$. For completeness, choose an edge maximizing the absolute difference of two coordinates in a largest-eigenvalue vector. Subtract the eigenvector equations at its endpoints. A common neighbor contributes that maximizing difference, while each exclusive neighbor contributes a term of at most that magnitude. Division proves the bound by the maximum degree union. Thus $`x+(1-2/n)y>1`$ also here.

Both diameter arguments prove the strict symmetric endpoint bound: $`x+(1-2/n)y>1`$ if $`y`$ is the larger connectivity. If it is not, then $`y\ge1`$ still forces $`y+(1-2/n)x>1`$ since $`x>0`$.

Finally suppose $`n\ge11`$ and $`y`$ is the larger connectivity, with $`y\ge1`$. If the diameter of $`G`$ is at most three, the range of its Fiedler vector satisfies $`R_a^2\le3x`$ by a path between its extrema; the complement's range satisfies $`R_b^2\le2`$. The [fourth-moment inequality](https://arxiv.org/abs/1901.02047) implies $`1\le x(2+3y)`$. Put $`d=1-2/n`$. A failure of the strict endpoint inequality would give
$`1\le(1-dy)(2+3y)\le(1-d)(2+3)=10/n<1`$.
The middle inequality holds because the quadratic decreases for $`y\ge1`$ (its derivative is $`3-2d-6dy<0`$). This completes the checkpoint.

The diameter-four construction uses the clique-chain completion familiar from [Wang, van Dam, Kooij and Van Mieghem](https://www.nas.ewi.tudelft.nl/people/Huijuan/Huijuan_paper/LAA_2010_Algebraicconnectivity.pdf); their maximization is for algebraic connectivity rather than the top eigenvalue.
