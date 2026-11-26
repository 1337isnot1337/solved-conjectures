# Erdős–Gyárfás point-degree spectrum conjecture

In a finite linear space, each pair of distinct points lies on exactly one line. Each line contains at least two points and fewer than the total number $n$. The degree $d(p)$ counts the lines incident with $p$. Write $f_3(n)$ for the largest possible number of different point degrees in such a space. Erdős and Gyárfás asked whether $f_3(n)\ge n-C\sqrt n$ for some constant $C$. In the same paper they asked whether real planar configurations always miss a positive proportion of the degrees. [Gyárfás (2002), §3, Problems 2 and 3](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf)

**Theorem.** Every nontrivial finite linear space on $n$ points has at most $(16n-13)/17$ different point degrees. Consequently the answer to Problem 2 is negative, and the answer to Problem 3 is affirmative even for abstract finite linear spaces.

## Comparing two sets of points

Let $L,H$ be disjoint sets of $t\ge1$ points each. Put

```math
A=\sum_{x\in L}d(x),\qquad B=\sum_{y\in H}(n-1-d(y)),\qquad S=A+B-t^2.
```

We will prove $S\ge0$ and

```math
t^2-A\ \le\ \sqrt{\bigl(t(t-1)+S\bigr)S}. \tag{1}
```

For each line $\ell$, write $r=|\ell|$, $a=|\ell\cap L|$ and $b=|\ell\cap H|$. The lines through $y$ partition the other points into sets of size $r-1$, so $n-1-d(y)=\sum_{\ell\ni y}(|\ell|-2)$. Every pair in $L\times H$ lies on a unique line. Thus $S$ is the sum, over all lines, of

```math
s_\ell=a+b(r-2)-ab.
```

If $b=0$, the contribution is $a$. If $a=0$, it is $b(r-2)$. When $a,b\ge1$, disjointness gives $r\ge a+b$, so

```math
s_\ell\ge a-1+(b-1)^2\ge0.
```

Let $\mathcal E$ consist of lines with $a\ge1$ and $b\ge2$. On these lines $s_\ell\ge a$ and $s_\ell\ge(b-1)^2$. Hence

```math
\sum_{\ell\in\mathcal E}(b-1)^2\le S,\qquad
\sum_{\ell\in\mathcal E}a^2\le t(t-1)+S.
```

The second inequality counts ordered pairs of different points of $L$ on the lines to bound $\sum a(a-1)$, then uses $\sum a\le S$. Now $t^2-A=\sum_\ell a(b-1)$. Every term outside $\mathcal E$ is zero or negative. Cauchy–Schwarz on $\mathcal E$ proves (1).

## Applying the inequality to the degree spectrum

List the $f$ different degrees in increasing order as $u_1,\ldots,u_f$. Set $m=n-f$ and $M=m-1$. Since $u_f\le n-1$ and successive degrees differ by at least one, the integers $e_j=u_j-j$ are nondecreasing and satisfy $e_j\le M$. Select one point for each degree. Use the lowest $t=\lfloor f/2\rfloor$ representatives for $L$ and the highest $t$ for $H$. If $f\le3$, the theorem follows directly from $f\le n-2$; assume $t\ge2$.

For $1\le j\le t$ the paired degrees $u_j$ and $u_{f+1-j}$ give

```math
u_j+n-1-u_{f+1-j}=2j+m-2+e_j-e_{f+1-j}\le 2j+m-2.
```

Adding these inequalities and subtracting $t^2$ yields $S\le tM$. Also $A\le t(t+1)/2+tM$. Substituting both estimates in (1) and dividing by $t$ gives

```math
\frac{t-1}{2}-M\ \le\ \sqrt{(t-1+M)M}. \tag{2}
```

If the left side of (2) is positive, square and cancel $M^2$ to obtain $(t-1)^2/4\le 2(t-1)M$. If it is nonpositive, $M\ge(t-1)/2$ already. In either case $t\le8M+1$. Therefore

```math
f\le2t+1\le 16M+3=16(n-f)-13.
```

This proves the theorem. In particular $n-f_3(n)\ge(n+13)/17$, which eventually exceeds $C\sqrt n$ for every fixed $C$. Real planar point systems satisfy the same pair axiom, so their spectrum also has at most $(1-1/17)n$ degrees. The optimal limiting proportion remains undetermined.
