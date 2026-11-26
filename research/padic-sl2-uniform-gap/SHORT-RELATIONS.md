# A deep short word and the energy at a smaller conductor

Use the groups, six moves and energy $`E`$ from the [projective-ball reduction](README.md). Suppose a word $`t`$ of length $`L`$ in the marking $`S`$ belongs to $`K_d\setminus K_{d+1}`$. At a level $`n=d+b`$ with $`3\le b\le d`$, a new irreducible representation gives the following descent to level $`b`$. It applies to arbitrary markings and uses a word evaluated at that same marking.

For any unit vector of energy $`e`$ in an irreducible representation of exact conductor $`n`$, and any $`0\lt z\le2`$,

```math
e\ \ge\ g(G_b,S)\left[1-\left(
\sqrt{z/2+p^{2-b}}+\frac{\sqrt{6}(2L+2)\sqrt e}{z}
\right)^2\right].
```

In particular $`e\ge c\min\{g(G_b,S),(L+1)^{-2}\}`$ for an absolute $`c>0`$. If $`b\to\infty`$ and $`(L+1)^2e\to0`$, the comparison factor tends to one. Earlier general scale comparison gives a factor of order $`b/n`$ in the absence of a word hypothesis. The estimate here concerns an individual representation of exact conductor. An older eigenvalue persists on every higher quotient. [Previous scale bounds, entries 52 and 128](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539)

## The distribution of one word on the character orbit

The subgroup $`V=K_d/K_n`$ is the additive traceless algebra modulo $`p^b`$, by $`I+p^d X\mapsto X`$. This uses $`2d\ge n`$. The trace pairing parametrizes its characters by matrices $`A`$ through $`\chi_A(X)=\exp(2\pi i\,\mathrm{tr}(AX)/p^b)`$. The weights of a new irreducible form one conjugacy orbit $`O`$. Otherwise the sum of weight spaces in any one orbit would be a proper invariant subspace. Exact conductor makes every $`A`$ primitive. Conjugation by $`K`$ fixes the first digit $`\bar A`$ throughout the orbit.

Write $`t=I+p^d T`$ in the quotient. If $`[\bar A,\bar T]\ne0`$, use $`u=t`$ and $`d'=d`$. Otherwise choose a generator $`s_i`$ such that $`u=[s_i,t]=s_i t s_i^{-1}t^{-1}`$ has depth $`d'=d+1`$ and its normalized digit $`\bar U`$ does not commute with $`\bar A`$. To see the choice, the centralizer of a nonzero traceless matrix in $`\mathfrak{sl}_2(\mathbb F_p)`$ is its line, since its full matrix centralizer is spanned by itself and the identity. Thus $`\bar T`$ is proportional to $`\bar A`$ in this case, and the brackets of the three first generator digits with $`\bar T`$ span a plane. At least one lies outside that line. The leading commutator formula identifies it with $`\bar U`$. In both cases the length of $`u`$ is at most $`2L+2`$.

Put $`b'=n-d'`$, and represent the action of $`u`$ on a weight by the phase of $`\mathrm{tr}(AU)\bmod p^{b'}`$, using $`u=I+p^{d'}U`$. A uniform weight on $`O`$ makes this trace **uniform on one residue class modulo $`p`$** in $`\mathbb Z/p^{b'}\mathbb Z`$. Indeed the nondegenerate trace pairing supplies a traceless $`D\in M_2(\mathbb Z_p)`$ with $`\mathrm{tr}(D[\bar A,\bar U])\ne0\bmod p`$ (reduce all factors in this test). Move any orbit point $`A'`$ by $`\exp(psD)`$ for Haar $`s\in\mathbb Z_p`$. The trace then equals

```math
\mathrm{tr}(A'U)+p s\,\mathrm{tr}([D,A']U)+p^2 R(s)
```

with $`R`$ an integral restricted series. In the adjoint exponential, $`v_p(p^j/j!)\ge2`$ for all $`j\ge2`$ at odd $`p`$, and these valuations tend to infinity. The coefficient of $`p s`$ is a unit. After subtracting the constant and dividing by $`p`$, the resulting function is a bijective isometry modulo each power of $`p`$, by successive digit lifting. The first trace digit is the same for all $`A'`$. Averaging the uniform orbit over these conjugations preserves its law, proving the assertion. The phase grid has size $`p^{b'-1}\ge p^{b-2}`$.

## The energy comparison

Let $`a(A)=\|v_A\|`$ be the norms of the weight components of the unit vector. In counting norm on $`O`$ this is a unit vector. Permuting weights and using the reverse triangle inequality gives $`E(a)\le e`$. This permutation action factors through $`G_b`$, and its invariant line is spanned by $`\mathbf1/\sqrt{|O|}`$.

In the grid above, the fraction of weights with $`|\chi_A(u)-1|\le z`$ is at most $`z/2+p^{2-b}`$. The arc has normalized length $`2\arcsin(z/2)/\pi\le z/2`$, and counting in a uniform grid costs at most one endpoint. Outside the arc the squared mass of $`a`$ is at most $`6(2L+2)^2e/z^2`$ by telescoping the word. Cauchy–Schwarz on the arc and its complement bounds the projection of $`a`$ on constants by the sum of the two terms in parentheses in the theorem. The Poincaré inequality on $`O`$ proves the result. For the absolute-constant consequence take $`z=1/10`$ and first consider $`(2L+2)\sqrt{6e}\le1/100`$. For the asymptotic statement choose $`z\to0`$ with $`(L+1)\sqrt e/z\to0`$.

## Three explicit relations in an open family

One can locate a short word of known depth without searching words. Fix $`q=1+p`$, $`m=q^2`$, $`B=(q^{2p}-1)/p`$, and write $`U(u),L(v),D(w)`$ for the upper and lower elementary matrices and $`\mathrm{diag}(w,w^{-1})`$. The rational marking

```math
(X_0,Y_0,Z_0)=(U(p),L(B),D(q))
```

generates $`K`$ since $`B/p\equiv2\bmod p`$. On the entire cylinder of triples agreeing with it modulo $`p^2`$, diagonalize $`Z`$ as $`D(\lambda)`$ and normalize $`X_{12}=p`$ by a diagonal change of basis. The matrix $`(Z-I)/p`$ has distinct eigenvalues $`1,-1\bmod p`$. Its integral eigenbasis can be chosen congruent to the standard basis modulo $`p`$. The diagonal adjustment is also the identity modulo $`p`$, up to scalars. This conjugation preserves all congruence levels and the six-move spectrum.

The resulting six free coordinates $`(x,h,c,y,a,f)\in(p^2\mathbb Z_p)^6`$ are given by

```math
X_{11}=1+x,\quad X_{21}=c,\quad \lambda=q+h,\qquad
Y_{11}=1+y,\quad Y_{12}=a,\quad Y_{21}=B+f.
```

The remaining diagonal entries follow from determinant one. Define three words

```math
R_1=ZXZ^{-1}X^{-m},\qquad R_2=Z^{-1}YZ Y^{-m},\qquad
R_3=XY(Z^p YX Z^p)^{-1}.
```

They are identities at the rational marking. The third identity follows from $`1+pB=q^{2p}`$. Extract $`(11,12,21)`$ from $`R_1-I`$, $`(11,12)`$ from $`R_2-I`$, and $`11`$ from $`R_3-I`$, and divide all six entries by $`p`$. **These six values give a bijective isometry of the coordinate ball onto $`(p^2\mathbb Z_p)^6`$** with the maximum norm. In particular, if the marking first differs from the rational marking in the normalized coordinates at depth $`r`$, the minimum depth of the three words is exactly $`r+1`$.

Here is the digit calculation. At any digit $`r\ge2`$, change the six coordinates by $`p^r(x',h',c',y',a',f')`$. The change in the six extracted entries before division, in units of $`p^{r+1}`$ and modulo $`p`$, is

```math
(-2x',\ 2h',\ -4c',\ -2y',\ -4a',\ f'-2h').
```

It suffices to linearize at the rational marking. All unscaled entries are integral rational functions with unit denominators on this chart. First derivatives agree modulo $`p^2`$ throughout the chart and second-order changes cost $`p^{2r}`$. For the first relation compare $`\mathrm{Ad}(Z)\log X`$ with $`m\log X`$. On the diagonal, upper and lower directions the adjoint eigenvalues are $`1,\lambda^2,\lambda^{-2}`$. The variation of $`\log X`$ agrees with that of $`X`$ modulo $`p^{r+1}`$. The eigenvalue differences are divisible by $`p`$ and the seed logarithm is $`pE_{12}`$. This gives the first three digits, since re-exponentiating two arguments differing first at depth $`r+1`$ preserves their leading difference. Using $`Z^{-1}`$ and $`B E_{21}`$ gives the two listed entries for the second relation. For the third, the upper-left entry of $`XY-Z^p YX Z^p`$ equals

```math
(1-\lambda^{2p})X_{11}Y_{11}+pY_{21}-\lambda^{2p}Y_{12}X_{21}.
```

At the seed its leading change is $`p^{r+1}(f'-2h')`$. In each relation the two word factors have equal exponent sums modulo $`p`$. A depth-$`r`$ perturbation is central of exponent $`p`$ modulo $`K_{r+1}`$, so both factors still agree modulo $`p^{r+1}`$ at a perturbation of the seed. Right multiplication of their difference by the inverse of the second factor preserves its leading digit, since that inverse is identity modulo $`p`$. The displayed digit map is invertible for odd $`p`$. It gives the isometry and unique successive lifts onto the target ball.

Choose any of the three words of depth $`d=r+1`$. Its length is bounded in terms of $`p`$ alone. For $`3\le b\le r`$ the smaller walk in the energy bound is exactly the arithmetic walk on $`G_b`$, which has a tower gap. At conductors arbitrarily large compared with $`r`$, this word falls outside the abelian layer used in the proof. Small energy at those conductors remains possible under these estimates. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/592) · [Arithmetic tower gap, Theorem 2](https://arxiv.org/abs/1602.00403)

The integer checker compares word evaluations before and after 17,883 simultaneous six-coordinate digit changes, including every direction at two depths for $`p=3`$ and one depth for $`p=5`$. It also counts the entire phase distribution in twelve finite character-orbit tests, including cases that require the commutator. Run `python3 -B research/padic-sl2-uniform-gap/check_short_relations.py`. [Verification script](check_short_relations.py)
