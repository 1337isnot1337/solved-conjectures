# A short determinant test for deleting a largest part

This is a further partial result for complete bipartite graphs, separate from the refutation of complete-multipartite interlacing. For $`K_{a+1,b+1}`$ with $`0\le a\le b`$, $`b\ge1`$, compare its symmetric-edge Ehrhart polynomial to that of $`K_{a+1,b}`$, reordering the two parts when $`a=b`$. All roots of both polynomials are simple on the canonical line and strictly interlace whenever $`a\le8`$. The bound on $`a`$ is from an exact symbolic certificate, not a bound on $`b`$.

We use the notation of the [canonical-line proof](NOTE.md). Write the rotated polynomial in the divided cross basis as
```math
Q=Aq_{b+1}-Bq_b .
```
In this note $`A,B`$ are the coefficients for $`q_j=p_j/j!`$, not the monic normalization in (3) of the companion note. A common positive scale is immaterial. For $`b>a`$, the rotated predecessor is
```math
Q^-=Uq_b-Vq_{b-1}
   =\frac{b+1}{b}V q_{b+1}+
      \left(U-\frac{x}{b}V\right)q_b.
```
Put
```math
D(x)=b A(x)U(x)+V(x)((b+1)B(x)-xA(x)).
\tag{1}
```
For $`b=a`$, use the tail of the predecessor represented with the same prefix, $`Q^-=Uq_{b+1}-Vq_b`$, and put
```math
D(x)=B(x)U(x)-A(x)V(x).
\tag{2}
```
In each case $`D`$ is an even polynomial. If the larger polynomial has a positive Jacobi-tail certificate and $`D(x)>0`$ on the real axis, then the desired strict interlacing holds.

To see this, set $`k=b+1`$ and let $`\lambda`$ be a root of $`Q`$. Let $`J`$ be the symmetric irreducible tridiagonal matrix from the companion proof. The residue of the diagonal entry of $`(xI-J)^{-1}`$ at a simple eigenvalue is the square of the corresponding coordinate of a unit eigenvector. Equivalently, the principal deletion minor divided by the derivative of the full characteristic polynomial is nonnegative there. The deletion minor at the last vertex of the prefix has the sign (and vanishing set) of $`Aq_b`$; the deletion minor at the first vertex of the tail has the sign and vanishing set of $`Bq_{b+1}`$. The conversions between monic and divided cross bases, and division by the joining weight in the tail deletion polynomial, introduce only positive factors.

If $`A(\lambda)\ne0`$, the equation $`Q(\lambda)=0`$ gives $`q_{b+1}(\lambda)=B(\lambda)q_b(\lambda)/A(\lambda)`$. Since consecutive cross polynomials have no common zero, $`q_b(\lambda)\ne0`$. Substituting into $`Q^-`$ shows that $`Q^-(\lambda)/Q'(\lambda)`$ has the sign of the positive deletion-minor ratio multiplied by $`D(\lambda)/A(\lambda)^2`$ (and $`1/b`$ in (1)). If $`A(\lambda)=0`$, then $`B(\lambda)\ne0`$ by the short strictly positive Jacobi recurrence, and $`q_b(\lambda)=0`$, $`q_{b+1}(\lambda)\ne0`$. In this case substitution directly into $`Q^-`$ gives the sign from the second deletion minor multiplied by $`D(\lambda)/B(\lambda)^2`$ (and $`1/b`$ in (1)). Thus every residue is strictly positive. In the partial fraction expansion of $`Q^-/Q`$, the function decreases strictly from $`+\infty`$ to $`-\infty`$ between any consecutive poles. It has exactly one zero in each gap, which proves the claim.

## Symbolic verification

For $`a=0`$ interlacing follows directly from the cross-polytope recurrence. For $`1\le a\le8`$, run $`\texttt{python3 interlace.py 8}`$ with SymPy. It first verifies the Jacobi-tail certificate. Then it forms (1) over $`\mathbb Q[z]`$ with $`b=a+1+z`$ and (2) at $`b=a`$, including the $`a=1`$ case whose predecessor is a star. It checks $`D(0)>0`$ and the absence of positive zeros of the polynomial in $`y=x^2`$ by Sturm's theorem.

For (1), the Sturm sequence is computed by exact pseudo-division in $`y`$, initially using signs of parameter polynomials at $`z=+\infty`$. Every needed sign is guarded by storing the respective polynomial with positive eventual sign, including common factors removed from a remainder and leading and lowest nonzero coefficients for the endpoint variations. For each guard choose a nonnegative integer $`N`$ such that substituting $`z=N+w`$ gives nonnegative coefficients and positive constant term, enlarging $`N`$ as needed. All guards are then positive throughout $`z\ge N`$; positivity persists upon shifting further because every derivative of the shifted polynomial is nonnegative on the nonnegative ray. Thus the symbolic divisions and endpoint signs are valid on that entire ray. For the remaining finitely many $`0\le z<N`$ integers, recompute the Sturm sequence after specialization. The diagonal (2) is checked separately. The verified $`N`$ values for $`a=1,\ldots,8`$ are $`0,1,4,17,9,5,303,48`$, respectively.

Both (1) and (2) apply to arbitrary part sizes; the sign certification is only for the explicit widths above. No assertion for larger widths or ability to count this as a separate original conjecture resolution is made.
