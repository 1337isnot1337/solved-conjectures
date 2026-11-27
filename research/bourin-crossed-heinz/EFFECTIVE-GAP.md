# Computing the worst crossed-Heinz gap at a prescribed rank

For an integer $`k\ge1`$ let $`G_k`$ be the supremum, over every finite order at least $`k`$, all positive contractions $`X,Y`$ of that order and all $`0\lt t\lt1`$, of
```math
g_{k,t}(X,Y)=\frac{N_k(C_t)-N_k(X+Y)}{k},
\qquad C_t=X^tY^{1-t}+Y^tX^{1-t}.
```
Here $`N_k`$ is the sum of the largest $`k`$ singular values. The zero pair and the operator norm bound on each product give $`0\le G_k\le 2`$. **There is an algorithm that, given $`k`$ and any positive rational accuracy, returns a rational interval of that width or less containing $`G_k`$.** Bourin's Question 4 uses powers $`p,q\ge0`$. For positive $`p,q`$, set $`X=A^{p+q}`$, $`Y=B^{p+q}`$, and $`t=p/(p+q)`$. Homogeneity then permits a common scaling to contractions. If either exponent is zero, the usual zeroth power is the identity and the two sides agree. The question asks whether $`G_k=0`$ for every $`k`$. The algorithm supplies additive enclosures. Exact vanishing remains open. [Original question](https://arxiv.org/pdf/0805.1954#page=6) · [Finite-dimensional reduction](FINITE-WITNESS.md)

## A uniform endpoint estimate

For $`0\lt t\le1/2`$, the Hermitian matrix $`H_t=X^t+Y^t-I`$ satisfies $`-I\le H_t\le I`$. Expand the error from a left contraction of the comparison matrix:
```math
C_t-H_t(X+Y)=X^t(Y^{1-t}-Y)+Y^t(X^{1-t}-X)
+(I-X^t)X+(I-Y^t)Y.
```
For $`0\le x\le1`$ and $`r>0`$, the continuously extended quantity $`x^r\lvert\log x\rvert`$ is at most $`1/(e r)`$. Thus $`x(1-x^t)\le t/e`$ by integrating the derivative of $`x^r`$ from $`1`$ to $`1+t`$, and $`x^{1-t}-x\le t/[e(1-t)]`$ by integrating from $`1-t`$ to $`1`$. Functional calculus bounds the operator norm of the error by $`2t/e+2t/[e(1-t)]\le3t`$. The Ky Fan norm of $`H_t(X+Y)`$ is at most that of $`X+Y`$. Also $`C_{1-t}=C_t^*`$, so in every dimension
```math
g_{k,t}(X,Y)\le 3\min(t,1-t).
```
This upper bound requires no lower spectral cutoff on either matrix. It allows the inputs to vary with the exponent.

## A finite list of exact tests

Choose rational $`0\lt\eta\le1`$ and define
```math
h=\eta/6,\qquad L=\lceil16/\eta\rceil,\qquad N=4kL.
```
Use an equally spaced rational grid $`T\subset[h,1/2]`$ containing both endpoints and having mesh at most $`\eta h/16`$. For $`s,t\in[h,1/2]`$, both powers in the crossed sum have exponents at least $`h`$. The same scalar derivative bound and telescoping the two factors in each of the two products give
```math
\lVert C_t-C_s\rVert\le4\lvert t-s\rvert/(e h).
```
Changing to a grid exponent therefore costs at most $`\eta/4`$ per selected singular value. At a fixed grid exponent the [rounding and exact compression theorem](FINITE-WITNESS.md) bounds the cost of restricting to order $`N`$ by $`8/L\le\eta/2`$. Write $`W`$ for the largest grid gap at order $`N`$, maximized over all positive contractions of that order. It is nonnegative by the zero pair. For exponents below $`h`$, the endpoint estimate is at most $`\eta/2`$. The adjoint handles the other half of the interval. Consequently
```math
W\le G_k\le W+3\eta/4.
```

For a grid point $`t=p/q`$ in lowest terms, write $`X=A^q`$, $`Y=B^q`$ with $`0\le A,B\le I`$. Every eligible pair has such positive roots. Put
```math
K=A^pB^{q-p}+B^pA^{q-p},\qquad S=A^q+B^q.
```
For a rational threshold $`d`$, existence of a gap above $`d`$ at this exponent is equivalent to existence of the two positive contractions, two complex $`N\times k`$ isometries $`U,V`$, a real $`s`$, and a Hermitian matrix $`Q`$ satisfying
```math
Q\ge0,\qquad Q\ge S-sI,\qquad
\mathop{\mathrm{Re}}\mathop{\mathrm{tr}}(U^*K V)>kd+ks+\mathop{\mathrm{tr}} Q.
```
Indeed the tested trace has maximum $`N_k(K)`$. The minimum of $`ks+\mathop{\mathrm{tr}}Q`$ under the two inequalities is $`N_k(S)`$: for each fixed $`s`$ the positive spectral projection of $`S-sI`$ gives the lower bound $`\mathop{\mathrm{tr}}(S-sI)_+`$ on the trace, attained by $`Q=(S-sI)_+`$. Taking $`s`$ equal to the $`k`$th eigenvalue of $`S`$ attains the minimum, including ties. Compactness of the feasible input and frame sets gives the stated maximum over the grid.

Real and imaginary coordinates convert the formula to polynomial equalities and strict or weak inequalities with rational coefficients. A Hermitian matrix is positive semidefinite exactly when every principal minor is nonnegative. Effective decision for existential formulas over the real numbers therefore decides each grid threshold. Bisect $`[0,2]`$, testing the disjunction over the finite grid, to enclose $`W`$ between rationals $`a,b`$ with $`b-a\le\eta/4`$. Return $`[a,b+3\eta/4]`$. For any larger requested accuracy one may use $`\eta=1`$. Complexity depends on the specified accuracy and rank. No practical running-time estimate is claimed. [Basu, Pollack and Roy, effective decision in real closed fields](https://projects.csail.mit.edu/jacm/References/basupr1996%3A1002.html) · [Review, sources and reproducible checks](FINITE-WITNESS-REVIEW.md)
