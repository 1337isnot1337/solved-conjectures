# Paired-row formulas for a possible binary construction

Date: 20 November 2026 (America/Chicago).

These identities give smaller coefficient problems for constructing sign matrices with equal absolute permanent and determinant. No all-order choice of the parameters is proved. They do not resolve Wang's classification problem.

## Even order

Let $`X`$ be an $`m\times m`$ sign matrix. Let $`Y`$ be an $`m\times m`$ matrix with zero diagonal and all off-diagonal entries in $`\{-1,1\}`$. Define


```math
A=\begin{pmatrix}
X&Y+I_m
\\ X&Y-I_m
\end{pmatrix}.
\tag{1}
```


Every entry of $`A`$ is a sign. Subtracting row $`i`$ from row $`m+i`$, for every $`i`$, gives


```math
\boxed{\det A=(-2)^m\det X.}
\tag{2}
```


Thus $`A`$ is nonsingular exactly when $`X`$ is.

For $`V=[X\;Y]`$, define


```math
C(X,Y)=
[z_1^2\cdots z_m^2]
\prod_{j=1}^m\left(\sum_iX_{ij}z_i\right)
\prod_{j=1}^m\left(\sum_iY_{ij}z_i\right).
```


Then


```math
\boxed{\mathop{\mathrm{per}}A=2^m C(X,Y).}
\tag{3}
```


To prove this, use variables $`x_1,\ldots,x_m,y_1,\ldots,y_m`$ and put
$`L_i=\sum_jX_{ij}x_j+\sum_jY_{ij}y_j`$. The two row forms indexed by $`i`$ are $`L_i+y_i`$ and $`L_i-y_i`$, with product $`L_i^2-y_i^2`$. A term containing any $`y_i^2`$ cannot contribute to the squarefree monomial in all $`2m`$ variables. The permanent is therefore the permanent of $`V`$ with every row repeated twice. Assigning two columns to each row type gives the coefficient defining $`C(X,Y)`$; the two labelled copies of each row can then be assigned in $`2!`$ ways. This proves the factor $`2^m`$.

Equations (2)--(3) reduce the desired equality in this family to


```math
\boxed{C(X,Y)=\pm\det X,\qquad \det X\ne0.}
\tag{4}
```


The coefficient on the left generally depends on many noncentral coefficients of the two products of linear forms. It is not automatically the permanent of $`X`$.

## Odd order

Now let $`X`$ be an $`m\times(m+1)`$ sign matrix, and let $`Y`$ have the same properties as above. Append a sign row $`s=(a,b)`$, with $`a`$ of length $`m+1`$ and $`b`$ of length $`m`$, to obtain


```math
A=\begin{pmatrix}
X&Y+I_m
\\ X&Y-I_m
\\ a&b
\end{pmatrix}.
\tag{5}
```


The same row subtraction, followed by expansion in the $`m`$ sparse difference rows, gives


```math
\boxed{\det A=2^m\det\begin{pmatrix}X\\a\end{pmatrix}.}
\tag{6}
```


The sign in (6) uses exactly the row and column order displayed in (5).

Let $`V=[X\;Y]`$, and write its $`2m+1`$ column forms as
$`\ell_j(z)=\sum_iV_{ij}z_i`$. The row-form argument for (3), now retaining the appended row, gives


```math
\boxed{\mathop{\mathrm{per}}A
=2^m[z_1^2\cdots z_m^2]
\sum_{c=1}^{2m+1}s_c\prod_{j\ne c}\ell_j(z).}
\tag{7}
```


The choices in $`b`$ affect the permanent in (7) but do not affect the determinant in (6). This is a source of freedom, not a proof that the required coefficient can be attained.

## A canonical choice does not propagate equality

Let $`T_m`$ have $`+1`$ on and below its diagonal and $`-1`$ above it. Choosing $`X=T_m`$ and $`Y=T_m-I_m`$ in (1) produces a matrix equivalent by row and column permutations to $`T_{2m}`$. Interleave the columns belonging to the same index; interleave the rows with the minus row before the plus row. Each resulting row is positive through its diagonal and negative afterwards.

For every even $`r`$,

```math
\mathop{\mathrm{per}}T_r=0,\qquad \det T_r=2^{r-1}.
```


The determinant follows by subtracting successive rows. For the permanent, observe that $`T_r-2I_r=-T_r^{\mathsf T}`$. The matrix $`T_r-2I_r`$ also comes from a cyclic row permutation of $`T_r`$, followed by negating its first row. Hence

```math
(-1)^r\mathop{\mathrm{per}}T_r
=\mathop{\mathrm{per}}(T_r-2I_r)
=-\mathop{\mathrm{per}}T_r,
```

which proves vanishing when $`r`$ is even.

Therefore this canonical paired-row operation always gives a nonsingular matrix with zero permanent. In particular, it does not propagate equality from the known order-five matrix $`T_5`$, whose permanent and determinant both equal $`16`$.

## Exact remaining requirement

A binary construction would need a class of $`X,Y`$, and in odd order a final row, for which the complementary coefficients in (4) and (7) are controlled and the class remains available at every required order. Tracking only the smaller permanent and determinant is insufficient. No recurrence with the necessary coefficient invariant has been established.

The target and current status are recorded at https://yair-lavi.com/mincs-list/problem-7/index.html . The order-five example is also in Wanless's primary paper, https://users.monash.edu.au/~iwanless/papers/wangconjLAMA.pdf . The identities above are proved directly and are not claimed as historically new.
