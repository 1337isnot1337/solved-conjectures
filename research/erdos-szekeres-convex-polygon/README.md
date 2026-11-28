# Erdős–Szekeres convex polygon conjecture

**Partial research.** The exact cup, cap and convex-position profile holds for planar point sets recursively split by consecutive cuts with homogeneous mixed triple orientations. Each cut may use any of the four orientation pairs, including pairs in which the two orientations agree. The proof also reduces the unrestricted profile assertion to sets with no such cut. The general conjecture remains open. [Issue #394](https://github.com/1337isnot1337/solved-conjectures/issues/394)

## Target and sources

For $k\ge3$, the conjecture states that $2^{k-2}+1$ is the least number of planar points in general position that always forces $k$ points in convex position. The original paper proves existence of a forcing number and introduces the cup–cap argument. The later construction attains the conjectured lower bound. The November 24, 2026 source check found no complete resolution. Suk proves the asymptotic exponential rate and Baek and Balko prove the exact joint profile on their deep-below decomposable sets, including interleaved splits. Baek and Balko also record Valtr’s equivalence between the full joint profile conjecture and the planar conjecture. The proof here addresses all four homogeneous orientations at consecutive splits. Priority for this cut formulation and the proof is provisional. [Erdős–Szekeres, 1935](https://www.numdam.org/item/CM_1935__2__463_0/) · [1960 construction](https://combinatorica.hu/~p_erdos/1960-09.pdf) · [Suk](https://arxiv.org/abs/1604.08657) · [Baek–Balko, Theorem 8 and equation (2)](https://doi.org/10.4230/LIPIcs.SoCG.2025.13)

## Homogeneous cuts and the profile

Choose a horizontal coordinate with all points having distinct first coordinates. A cup is a chain in increasing horizontal order with strictly increasing slopes, and a cap has strictly decreasing slopes. Chains of length at most two are of both kinds. For a point set $P$ let $u(P),v(P),c(P)$ be its maximum cup, cap and convex-position sizes.

A cut partitions the order into a nonempty prefix $A$ and a nonempty suffix $B$. Require that all triples of type $(A,A,B)$ have one fixed orientation and all triples of type $(A,B,B)$ each have one fixed orientation. Each type can be a cup or a cap, and an empty triple type imposes no constraint. Use the cuts recursively, with singletons as leaves.

For $s\ge2$ and $1\le u,v\le s$, the maximum size of such a recursively split set subject to $c(P)\le s$, $u(P)\le u$ and $v(P)\le v$ is

```math
F_s(u,v)=
\begin{cases}
\displaystyle\binom{u+v-2}{u-1}, & u+v\le s+1,\\[4pt]
\displaystyle\sum_{h=s-v}^{u-1}\binom{s-1}{h}, & u+v\ge s+1.
\end{cases}
```

At the common boundary the two formulas agree. In particular $F_s(s,s)=2^{s-1}$, giving the exact forcing number $2^{k-2}+1$ in the recursively split class.

## Joining two sets

Write $(+,-)$ for the cut in which $(A,A,B)$ triples are cups and $(A,B,B)$ triples are caps. A mixed cup may take a cup from $A$ and one point from $B$. It cannot take two points from $B$. The analogous assertion for caps takes one point from $A$ and a cap from $B$. Thus

```math
u(P)=\max(u(A)+1,u(B)),\qquad v(P)=\max(v(A),v(B)+1).
```

A convex subset meeting both sides has its lower hull a cup and its upper hull a cap, with common endpoints. The lower hull uses at most one point of $B$, and the upper hull uses at most one point of $A$. Thus its selected points of $A$ form a cup and those of $B$ form a cap. Conversely any cup in $A$ and cap in $B$ together form a convex subset. Attach the rightmost point of the cap to the cup and the leftmost point of the cup to the cap. Both chains keep their turns by the mixed orientation rules, and the resulting lower and upper chains lie on opposite sides of the chord between the endpoints. The largest convex subset meeting both shores therefore has size $u(A)+v(B)$. Vertical reflection gives the corresponding statements for $(-,+)$.

When both signs are positive, any cup in $A$ concatenates with any cup in $B$, while a mixed cap has at most two points. For convex position the upper hull of a mixed subset can then contain only its endpoints. Thus $u(P)=u(A)+u(B)$, $v(P)=\max(v(A),v(B),2)$, and the largest mixed convex subset has size $u(A)+u(B)$. Reflection covers the two-negative cut.

All four cut patterns can be realized with any two prescribed child configurations. For opposite signs put the children left and right and choose the vertical displacement so the cross slopes are all above both sets of internal slopes, or all below both. For two positive signs apply a shear to each child so that the first internal slopes are below zero and the second above zero. Large horizontal separation then makes all cross slopes lie strictly between the two internal slope ranges. Shears and translations preserve the internal orientations. The two-negative construction follows by reflection.

## Solving the recurrence

The boundary $u=1$ or $v=1$ forces a singleton. Consider first opposite signs. By the joining formulas their best contribution at a cell $(u,v)$ is the largest value of

```math
F_s(i,v)+F_s(u,j),\qquad
1\le i\le u-1,\quad 1\le j\le v-1,\quad i+j\le s.
```

Here $i$ bounds $u(A)$ and $j$ bounds $v(B)$. The reflected cut gives the same expression with the roles of the shores exchanged. The recurrence is well founded in $u+v$. In the region $u+v\le s+1$ one can take $i=u-1,j=v-1$ by monotonicity, and the binomial solution follows by Pascal’s identity. When $u+v\ge s+2$, monotonicity allows $i+j=s$. Both child cells have coordinate sum at least $s+1$. By induction their binomial sums have respective index ranges $[s-v,i-1]$ and $[i,u-1]$. They combine into exactly the claimed sum. This also proves attainability by opposite-sign cuts alone, because arbitrary maximizing child configurations can be joined as above.

To include the two-positive cut, it suffices to show that the stated profile is superadditive in the first coordinate for fixed $v\ge2$. For $1\le h\le s$ let $a_h$ be the successive increments of $F_s(h,v)$, starting from $F_s(0,v)=0$. Thus $a_1=1$, and for $h\ge2$,

```math
a_h=
\begin{cases}
\displaystyle\binom{h+v-3}{h-1}, & h+v\le s+1,\\[4pt]
\displaystyle\binom{s-1}{h-1}, & h+v\ge s+2.
\end{cases}
```

These increments first follow a nondecreasing sequence and then a tail of the unimodal $`(s-1)`$st binomial row. At the transition from the first formula to the second, the new increment is $\binom{s-1}{v-2}$ and the preceding one is $\binom{s-2}{v-2}$, so the full sequence is unimodal. Also $a_h\le a_{s+1-h}$ for $h\le(s+1)/2$. This holds by monotonicity if the reflected index is still in the first segment. Otherwise the reflected increment is $\binom{s-1}{h-1}$, which is at least $a_h$.

The sums of windows of any one length in a unimodal sequence are unimodal. The change when advancing a window is the new entry minus the removed entry. Once the endpoints straddle a peak the difference is nonincreasing, and before and after that range its signs are nonnegative and nonpositive respectively. The first window has sum at most that of the last window, by the reflected-index inequality, canceling their overlap if necessary. It therefore has the minimum sum. For $i+j\le s$, the increment from $j$ to $i+j$ is the sum of a window of length $i$, so

```math
F_s(i+j,v)-F_s(j,v)\ge F_s(i,v).
```

A two-positive cut has $v(P)\ge2$ and child cup bounds whose sum is at most $u$. The inequality just proved gives the same upper profile at this cut. Symmetry gives the bound for a two-negative cut. This proves the full profile for the specified recursive class.

## Reduction and checks

The joining inequalities used in the upper bound hold for arbitrary children whenever the root cut has the specified orientations. Consequently, if the displayed profile bound is proved for all point sets with no such consecutive cut, the bound for all sets follows by induction on size. Equivalently any smallest failure of the joint profile, in a horizontal order witnessing that failure, must have no such cut. By the equivalence recorded by Baek and Balko, proving that remaining case would settle the original planar conjecture. This leaves the sets without an admissible cut unresolved. [Baek–Balko, equation (2)](https://doi.org/10.4230/LIPIcs.SoCG.2025.13)

The closed profile was checked against the exact dynamic recurrence for all four cut types through $s=14$. An integer-coordinate construction attaining $F_5(5,5)=16$ was checked by enumerating its convex five- and six-point subsets. The four points $(0,0),(1,1),(2,5),(3,8)$ give a consecutive two-positive cut at the first point and a cap on the last three. They have no deep-below root split on the displayed axes, as the vertical order equals the horizontal order, every suffix of size at least two gives a mixed cup with the first point, and the last three points give a cap when the suffix has size one. The distinction illustrated here concerns these axes.
