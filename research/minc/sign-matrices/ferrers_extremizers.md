# Kräuter’s minimum sign-matrix permanent

No sign matrix of order $`n\ge6`$ whose negative entries form a Ferrers board can attain Kräuter’s proposed minimum. The same holds after arbitrary row or column permutations and sign changes. This rules out nested supports in every remaining order of [Minc Conjecture 36](https://yair-lavi.com/mincs-list/conjecture-36/). The unrestricted existence question stays open.

## A fixed divisor

Let $`0\le b_1\le\cdots\le b_n\le n`$ be the heights of the nested columns. Write $`c_i=b_i-i+1`$, $`D=\max c_i-\min c_i`$, and

```math
P(x)=\prod_{i=1}^n(x+c_i).
```

**The odd part of $`(D+1)!`$ divides the permanent.** In fact, the odd part of the fixed divisor $`\gcd_{t\in\mathbb Z}P(t)`$ divides it.

Let $`r_j`$ count placements of $`j`$ nonattacking rooks on the board and write $`x^{\underline k}=x(x-1)\cdots(x-k+1)`$. Counting placements of $`n`$ rooks after adding $`x\ge n`$ common rows under the board, either one column at a time or by the number in the original board, gives the Goldman–Joichi–White factorization

```math
P(x)=\sum_{k=0}^n r_{n-k}x^{\underline k}.
```

Define the rational linear functional $`L(x^{\underline k})=(-1/2)^k k!`$. Expanding the signs as $`1-2\mathbf1_B`$ gives
$`\mathop{\mathrm{per}} A=(-2)^n L(P)`$. By Newton interpolation,

```math
L(P)=\sum_{k=0}^n (-1/2)^k \Delta^kP(0).
```

The fixed divisor divides every forward difference. Also $`c_{i+1}\ge c_i-1`$, including the cyclic step because $`c_1\ge0`$ and $`c_n\le1`$. Walking from a maximum to a minimum therefore visits every intervening integer. The corresponding $`D+1`$ consecutive factors in $`P(t)`$ have product divisible by $`(D+1)!`$ for every integer $`t`$. This proves the fixed-divisor claims. In particular $`D\ge2`$ forces a factor of three.

## The remaining boards

If $`D\le1`$, the possible pairs of adjacent values are $`\{-1,0\},\{0,1\},\{1,2\}`$, with constant cases $`0,1`$. The identity

```math
L(f(x+1))+L(f(x))=2f(0)
```

follows by evaluating it on falling factorials. Translating any of the three nonconstant cases to roots corresponding to $`c_i\in\{0,1\}`$ preserves the absolute value, since the polynomial on the left before translation by $`+1`$ has a factor $`x`$. Thus it suffices to study

```math
u_{n,a}=L(x^a(x+1)^{n-a}),\qquad 0\le a\le n.
```

The generating function $`L(e^{tx})=2/(1+e^t)`$ follows from the shift identity. It also gives $`L(f(-1-x))=L(f(x))`$, so
$`u_{n,n-a}=(-1)^n u_{n,a}`$. The two elementary recurrences are

```math
u_{n,a}-u_{n,a+1}=u_{n-1,a},\qquad
u_{2m,0}=u_{2m,2m}=0\quad(m\ge1).
```

The first is polynomial subtraction, while the second follows by reflection and the shift identity on $`x^{2m}`$.

Every even row has a common strict sign at its interior positions, and its absolute values increase weakly to the center and then decrease. Each odd row has one strict sign on its left half and the opposite sign on its right, with its minimum absolute value at its two central positions. To verify this jointly, start with the first row $`(1/2,-1/2)`$. Summing an odd row from the zero endpoint of the next even row proves the even assertion by reflection. Summing an even row gives a monotone odd row, whose two central values are opposites and whose central difference is the nonzero middle value of the even row. This proves the odd assertion including both endpoint values.

For $`m\ge1`$, let $`e_m=|u_{2m-1,0}|`$. The minimum nonzero entry in absolute value in row $`2m`$ is $`e_m`$, attained next to an endpoint. In row $`2m+1`$ it is $`|u_{2m,m}|/2\ge e_m/2`$. Also

```math
2e_{m+1}=\sum_{a=0}^{2m}|u_{2m,a}|\ge(2m-1)e_m .
```

The generating function or recurrence gives $`e_3=1/2`$, hence $`e_m\ge1/2`$ for every $`m\ge3`$. Consequently the absolute nonzero permanent is at least $`2^{n-1}`$ in even orders $`n\ge6`$, or $`2^{n-2}`$ in odd orders $`n\ge7`$, whenever $`D\le1`$. Each bound strictly exceeds $`2^{n-\lfloor\log_2(n+1)\rfloor}`$ in its stated range. Together with the factor of three for wider boards this proves the exclusion.

## Moving away from nested supports

Let the sign matrix differ from the Ferrers matrix on a set of cells whose largest nonattacking subset has size $t$. The odd part of $\max(0,D+1-2t)!$ still divides its permanent. In particular, any edits confined to $t$ rows and columns in total obey the same bound.

Delete a row at level $h$ and a column in position $j$. At every surviving column $i$ the root coordinate changes by $\mathbf1_{i>j}-\mathbf1_{b_i>h}$, using levels numbered from zero. Both indicators describe suffixes, so the differences range over at most two consecutive integers. Removing one coordinate from a sequence that attains all the intermediate integers shrinks its span by at most one, as long as at least one coordinate remains. The shifts shrink it by at most one further unit. Every nonempty minor obtained with $s$ paired deletions therefore has width at least $D-2s$. Expand the permanent by multilinearity in the changed entries. A term using $s$ changes uses nonattacking positions and a complementary Ferrers minor. Its odd factorial divisor is a multiple of the asserted one since $s\le t$. If a term uses the empty minor, then $t=n$ and the asserted divisor is one.

## Sources and scope

Miceli and Remmel state the classical factorial rook polynomial identity in their [primary article on product formulas](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v15i1r85). Ingram and Razborov study the range on unrestricted sign matrices and identify exact minimum attainment as open. [Ingram and Razborov](https://arxiv.org/html/2507.09433v1)

The repository previously checked the failure of the Ferrers construction in order six. Searches for Ferrers sign permanents, hit polynomials at minus one, the factorial rook polynomial, Euler umbral evaluations, and Kräuter’s attainment conjecture located the classical identities and no earlier all-orders exclusion in the sources inspected. The theorem excludes a construction class and contributes zero full Minc entries. [Earlier repository check](sign_lift_audit.md)

The [exact checker](verify_ferrers_extremizers.py) evaluates all 4,706 Ferrers boards through order seven by a separate signed subset recurrence. It also tests one row and one column of perturbations for 4,704 boards and checks the Euler recurrence bounds through order 100.
