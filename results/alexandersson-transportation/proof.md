# Alexandersson’s transportation polytope conjecture

Take an integer $m\ge2$ and the full transportation polytope $T_m$ with row sums $(1,1,m)$ and column sums $(2,1,\ldots,1)$, with $m$ ones. Both vectors have a nonunit entry and sum to $m+2$. Every cell can simultaneously be positive, as seen from the table with entries $r_ic_j/(m+2)$. The two first rows determine the third, and their two independent row-sum constraints leave dimension $2m$. Write $L_m(k)$ for the number of integer points in $kT_m$. Its Ehrhart series has numerator $H_m(z)$ and denominator $(1-z)^{2m+1}$.

## Counting every dilation

In the first two rows choose two arbitrary weak compositions of $k$ into $m+1$ parts. There are $\binom{k+m}{m}^2$ choices. The column with margin $2k$ can accommodate every such pair. A column of margin $k$ is invalid exactly when its two entries sum to at least $k+1$. Two columns cannot both be invalid, since the two rows contain only $2k$ units altogether.

For one specified invalid column, the $2m$ entries of the first two rows in the *other* columns have total at most $k-1$. Conversely any such nonnegative entries determine the two entries in the specified column, by the two row sums. There are $\binom{k-1+2m}{2m}$ choices, interpreted as zero when $k=0$. The third row fills all residual margins. Hence

```math
L_m(k)=\binom{k+m}{m}^{\!2}-m\binom{k-1+2m}{2m}.
```

For the first term, count pairs of weakly increasing lists of length $m$ with entries in $\{0,\ldots,k\}$. Sort the combined lists, breaking ties by giving the first list priority. The word of list labels has $m$ letters $A$ and $m$ letters $B$. The sorted numbers must increase strictly at each $BA$ and are otherwise weakly increasing. A word with $j$ such transitions gives $\binom{k+2m-j}{2m}$ choices, with zero when $k<j$. There are $\binom mj^2$ such words. Indeed the numbers of $A$'s already read at the transitions form a $j$-subset of $\{0,\ldots,m-1\}$, and the numbers of $B$'s form a $j$-subset of $\{1,\ldots,m\}$. In increasing order these two lists specify every turn from $B$ to $A$, so they reconstruct the word. Summing the binomial series in $k$ gives

```math
H_m(z)=B_m(z)-mz,\qquad B_m(z)=\sum_{j=0}^m\binom mj^2 z^j.
```

## A rational certificate

For a nonzero real polynomial $P$ with only real roots $\rho_i$, listed with multiplicity, logarithmic differentiation gives

```math
(P'(x))^2-P(x)P''(x)=P(x)^2\sum_i(x-\rho_i)^{-2}\ge0
```

away from its roots, and by continuity at the roots as well. Direct substitution of $x=-1/5$ in the formula for $H_{12}$ gives

```math
\begin{aligned}
5^{12}H_{12}(x)&=41\,780\,056,\\
5^{11}H'_{12}(x)&=-357\,481\,092,\\
5^{10}H''_{12}(x)&=12\,374\,409\,432.
\end{aligned}
```

Consequently $5^{22}((H'_{12})^2-H_{12}H''_{12})(-1/5)=-389\,210\,787\,898\,375\,728<0$. This disproves the conjecture. The [checker](check.py) independently obtains the whole numerator from the column-margin dynamic program and counts ten distinct real roots by Sturm’s theorem.
