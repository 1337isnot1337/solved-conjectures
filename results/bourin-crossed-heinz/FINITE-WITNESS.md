# Dimension bounds for a strict crossed-Heinz counterexample

Write $`N_k`$ for the sum of the $`k`$ largest singular values. By homogeneity one can test Bourin's Question 4 on positive contractions $`X,Y`$. They can be singular. For $`0\lt t\lt1`$ let
```math
g_{k,t}(X,Y)=\frac{N_k(X^tY^{1-t}+Y^tX^{1-t})-N_k(X+Y)}{k}.
```
This is a signed additive gap per singular value. If the conjecture fails with $`g_{k,t}=\delta>0`$, then it fails **at the same rank and the same exponent** on a pair of actual positive contractions of order at most
```math
4k\left\lceil 16/\delta\right\rceil ,
```
with gap at least $`\delta/2`$. The bound is uniform in the original dimension and exponent. It makes no assumption on the number of distinct nonzero eigenvalues, their spacing, the smallest positive eigenvalue or the joint condition number. This is a reduction of the open question, with no claimed violation. [Bourin, Question 4](https://arxiv.org/pdf/0805.1954#page=6)

## Downward rounding on a grid adapted to both powers

Fix a positive integer $`L`$ and divide $`[0,2]`$ into $`L`$ equal intervals, assigning the right endpoint $`2`$ to the last interval. Use the common coordinate $`v(x)=x^t+x^{1-t}`$ for $`x\in[0,1]`$. In each nonempty interval choose the smallest eigenvalue of either $`X`$ or $`Y`$ whose coordinate is in it, and round every member down to that value. The function $`v`$ is strictly increasing and both constituent powers are nondecreasing. Thus for each observed $`x`$ and each $`r\in\{t,1-t\}`$ its rounded value satisfies
```math
0\le q(x)\le x,\qquad 0\le x^r-q(x)^r\le 2/L.
```
Functional calculus gives $`X'=q(X)\le X`$ and $`Y'=q(Y)\le Y`$. The two rounded matrices use at most $`L`$ distinct levels in total. In each ordered product in the numerator the two factors have operator norm at most one. Telescoping the change in its factors costs at most $`4/L`$ in operator norm. Hence the complete crossed sum changes by at most $`8/L`$, and its $`k`$th Ky Fan norm by at most $`8k/L`$. Since the denominator cannot increase in the Loewner order,
```math
g_{k,t}(X',Y')\ge g_{k,t}(X,Y)-8/L.
```
The construction weights the grid by the two powers being tested, so the estimate is uniform up to both ends of the open exponent interval.

## Exact compression of the rounded test

Let $`U,V`$ be isometries with $`k`$ columns attaining the real-trace variational maximum for the rounded numerator. Let $`F`$ be the span of the columns of $`P U,P V`$ over all spectral projections $`P`$ of either rounded matrix. Its dimension is at most $`4kL`$. The ranges of $`U,V`$ are contained in $`F`$ since each spectral resolution sums to the identity. Compress $`X',Y'`$ to $`F`$ and call the resulting positive contractions $`\widehat X,\widehat Y`$.

For each individual matrix, every projected column making up $`U`$ or $`V`$ remains an eigenvector of its compression with its original eigenvalue whenever it is nonzero. The power of that compression on those columns therefore agrees with the corresponding original power. This argument is separate for $`X'`$ and $`Y'`$ and needs no common invariant subspace for both matrices. For example,
```math
\mathop{\mathrm{tr}}\bigl(U^*\widehat X^t\widehat Y^{1-t}V\bigr)=
\big\langle X'^tU,Y'^{1-t}V\big\rangle_F=
\mathop{\mathrm{tr}}\bigl(U^*X'^tY'^{1-t}V\bigr)
```
with the complex Hilbert–Schmidt inner product. The reversed ordered product has the same property. The compressed crossed sum thus attains at least the original variational test, and the largest $`k`$ eigenvalues of the compressed positive sum have total no greater than those of $`X'+Y'`$. This proves $`g_{k,t}(\widehat X,\widehat Y)\ge g_{k,t}(X',Y')`$. The new matrices need not have only $`L`$ levels. They are genuine inputs to the original crossed-Heinz expression.

Taking $`L=\lceil16/\delta\rceil`$ proves the stated margin and dimension. More generally let $`G_{k,t}(N)`$ be the supremum of the normalized gap for positive contractions of orders from $`k`$ to $`N`$, and let $`G_{k,t}(\infty)`$ use all finite orders. For $`N\ge4k`$ take $`L=\lfloor N/(4k)\rfloor`$. Then
```math
0\le G_{k,t}(\infty)-G_{k,t}(N)
\le \frac{8}{\lfloor N/(4k)\rfloor}.
```
Padding both matrices with zeros allows the finite-order supremum to be taken at exactly order $`N`$. The same estimate holds after taking the supremum over all interior exponents. This gives a certified dimension error. The [effective gap theorem](EFFECTIVE-GAP.md) supplies the exponent control and real-algebraic decision procedure needed to compute the joint supremum to prescribed accuracy. A finite suite of sampled inputs cannot certify this supremum.

The [pinching note](https://github.com/1337isnot1337/solved-conjectures/blob/615696f164411f1b9859f65a5932535a4a28244b/research/bourin-crossed-heinz/PINCHING-AND-COMPRESSION.md) explains why unrestricted operator-valued moment tests may yield false positives. Here the exact compression preserves the actual powers on the maximizing test spaces. The argument uses elementary spectral calculus and Ky Fan variational principles. A bounded search for rank-dependent finite witnesses, spectral rounding, cyclic subspace compression and dimensional reduction in the crossed-Heinz literature located the original problem, the two-dimensional case and norm-specific results. The dimension bound is supplied as a research tool for the unrestricted question. [Sababheh and Bourin](https://arxiv.org/abs/2610.04567v2) · [Tian and Xu](https://arxiv.org/abs/2611.22363v2) · [Exact rational checks](verify_finite_witness.py)

The independent internal reviewer checked the downward two-power grid, the uniform error and the invariant cyclic spaces used on both test isometries. The standard-library rational verifier covers 12 variational tests, combining ranks one and two, three exponents and two grid sizes in dimension sixteen. Each instance compresses to a strictly smaller space. The verifier compares all four power actions using polynomial interpolation on the retained eigenspaces and confirms both ordered products. These are exact scope checks, with no claim of computing a universal maximum. [Verifier](verify_finite_witness.py)
