# Gyárfás’s planar degree-repetition problem

For a noncollinear finite point set $P$ in the real affine plane, let $d(p)$ be the number of distinct lines through $p$ and at least one other point of $P$. In §4, Problem 4, Gyárfás asks whether there exists a planar set for which each value of $d(p)$ occurs at most twice. His Construction 2 gives maximum multiplicity three in the plane. His Construction 3 gives multiplicity two for an abstract linear space. [Gyárfás (2002), pp. 371–372](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf)

**Theorem.** For every $n\ge16$ there are $n$ rational points of the real affine plane for which each point degree occurs at most twice. The minimum possible maximum multiplicity is therefore exactly two at each such order.

## Construction

Write $n=2k+e$ with $`e\in\{0,1\}`$ and $k\ge8$. Take the $k$ points

```math
A_i=\left(\frac1{i+1},\frac{i^2}{i+1}\right),\qquad 0\le i\lt k.
```

On the vertical axis take $B_s=(0,s)$ for each height in

```math
S_0=\{0\}\cup\{2,3,\ldots,k-1\}\cup\{2k-3\},\qquad S_1=S_0\cup\{-1\}.
```

Use $S_e$ for the chosen parity. Its size is $k+e$. The positive first coordinates of the $A_i$ are distinct, and all the $B_s$ are distinct. The union is noncollinear.

For $i\ne j$, the line through $A_i,A_j$ has equation

```math
y=\bigl(1-(i+1)(j+1)\bigr)x+i+j.
```

Substitution verifies this at both points. In particular, two secants through $A_i$ and different $A_j$ have different slopes. A line through two $A$ points contains exactly those two $A$ points, and meets the axis at $B_{i+j}$ when $i+j\in S_e$.

## Degrees on the axis

For $s\in S_e$, let $P_s$ be the number of unordered pairs $0\le i<j<k$ with $i+j=s$. From $B_s$ each such pair is seen on one line. The pairs for a fixed $s$ are disjoint and the axis contributes one further line. Hence

```math
d(B_s)=k+1-P_s.
```

For $0\le s\le k-1$ we have $P_s=\lfloor(s+1)/2\rfloor$. Replacing height $1$ by $2k-3$ preserves its pair count of one, because $k-2,k-1$ give the only pair with that sum. Adding height $-1$ gives a second zero pair count, the first being at height zero. Thus each on-axis degree occurs at most twice. The largest on-axis degree is $k+1$, attained once for even $n$ and twice for odd $n$.

## Degrees off the axis

Let $T_i$ count the indices $j\ne i$ with $i+j\in S_e$. Each such $j$ merges exactly one line from $A_i$ to an axis point with one line from $A_i$ to another off-axis point. These are the only coincidences. Thus $d(A_i)=n-1-T_i$.

Put $h=\lfloor(k-1)/2\rfloor$. For the initial heights $0,\ldots,k-1$ the admissible indices are $0\le j\le k-1-i$, excluding $i$ itself when $i\le h$. Removing height $1$ removes precisely the pair $0,1$. Adding height $2k-3$ adds precisely the pair $k-2,k-1$. Height $-1$ contributes no pair. Therefore

```math
T_i=k-i-\mathbf{1}_{i\le h}-\mathbf{1}_{i\le1}+\mathbf{1}_{i\ge k-2}.
```

The difference $T_i-T_{i+1}$ equals one except at $i=1,h,k-3$, where it equals zero. These three indices are separated by at least two for $k\ge8$. Thus each off-axis degree occurs at most twice, and the smallest is attained only at $i=0$. Since $T_0=k-2$, this smallest degree is $k+e+1$.

For odd $n$ the on-axis and off-axis degree ranges are disjoint. For even $n$ their only common degree is $k+1$, attained by $A_0$ and $B_0$ alone. This proves the multiplicity bound. In any noncollinear $n$-point set every degree is an integer from $2$ to $n-1$, so some degree occurs twice or more. This gives the asserted equality.

The same count gives $k+\lfloor k/2\rfloor-3+e$ different degrees in the construction. There are $k-3$ different off-axis degrees, $\lfloor k/2\rfloor+1$ on-axis degrees, and one overlap when $e=0$. This gives $(3/4)n+O(1)$ distinct degrees. The separate linear-deficit question about the maximum number of distinct degrees appears in §3, Problem 3, of the source.
