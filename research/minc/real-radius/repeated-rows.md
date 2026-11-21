# Real van der Waerden radius

## One exceptional row

Let $A$ have real entries with row and column sums one. Suppose all but
one row are identical and $A\ne J_n$, $n\ge2$. On the ray from $J_n$
toward $A$, the permanent strictly increases with Frobenius distance
through the entire interval of distances from zero to one. The same
holds if all but one column are identical.

Write the repeated rows of $J_n+t(A-J_n)$ as $(1-y_j)/n$, where
$y_j=t x_j$ and $\sum_j x_j=0$. The exceptional row has entries
$(1+(n-1)y_j)/n$. Thus

~~~math
r^2=\|t(A-J_n)\|_F^2=\frac{n-1}{n}\sum_j y_j^2.
~~~

By zero sum, $|y_j|\le\sqrt{(n-1)/n}\,\|y\|_2=r$. For $0<r<1$
the repeated row is strictly positive, although the exceptional row
can contain negative entries. Put $T=\sum_j y_j^2/(1-y_j)$.
Summing over the column of the exceptional row and dividing by $d_n$
gives

~~~math
p(t)=\frac1n\prod_j(1-y_j)\sum_j\frac{1+(n-1)y_j}{1-y_j}
=\prod_j(1-y_j)(1+T).
~~~

Here $\sum_j y_j/(1-y_j)=T$ by zero sum. In particular $p(t)>0$.
Let $v_j=y_j/(1-y_j)$. Direct differentiation gives
$t(\log\prod_j(1-y_j))'=-T$, $tT'=T+\|v\|_2^2$, and hence

~~~math
t(\log p)'=\frac{\|v\|_2^2-T^2}{1+T}.
~~~

Since $T=y^T v$, $\sum_j v_j=T$ and $\sum_j y_j=0$, centered
Cauchy–Schwarz gives

~~~math
T^2\le\|y\|_2^2(\|v\|_2^2-T^2/n).
~~~

In the open unit ball $1/\|y\|_2^2+1/n>1$. Since $T>0$ for
$y\ne0$, the derivative is strictly positive there. Continuity gives
strict increase on the closed radial interval as well, even when a
denominator vanishes at its endpoint. In particular this whole unit
ball has permanent at least $d_n$, with equality only at its center.

The theorem permits arbitrarily localized singular vectors in this
particular rank-one direction and needs no large-order limit.
The [sharp general radius](https://yair-lavi.com/mincs-list/problem-13/index.html)
allows arbitrary real line-sum-one matrices. The argument does not
determine it or the sharp radius of the repeated-row family.
The formula is elementary and carries no historical priority claim.

Hwang already proved monotonicity for the nonnegative doubly stochastic
subclass with all but one row identical. The publisher's abstract states
that result explicitly. The signed unit-ball proof above also applies
after an exceptional entry becomes negative. We did not inspect the full
1986 proof and do not establish priority for this extension.
[Hwang (1986)](https://doi.org/10.1016/0024-3795(86)90296-X)
