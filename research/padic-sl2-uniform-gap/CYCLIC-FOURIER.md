# Exact Fourier overlaps for every generating triple

On the ordinary projective ball from [the tower reduction](README.md), every generating triple gives two short words with the following exact property. The first word acts as a full cycle. In its Fourier basis the second word has a block of constant absolute matrix entries at every primitive frequency. The same formula holds for every nonzero integer power of the second word. It gives a restriction on individual possible slow vectors, uniformly even for triples varying with the level.

Fix an odd prime $`p`$, write $`N=p^M`$ and use the slope $`p y`$, where $`y\in\mathbb Z/N\mathbb Z`$, at congruence level $`M+1`$. Choose words $`Z,W`$ with first Lie digits $`E_{21},E_{12}`$, respectively. Each has length at most $`3(p-1)/2`$ in the six moves, since the given three first digits form a basis and their exponents can use centered representatives modulo $`p`$.

In the cycle coordinate $`k`$, defined by $`Z^k(0)=p y(k)`$ in slope coordinates, let $`F_j`$ denote the permutation induced by $`W^j`$. Use $`e_N(t)=\exp(2\pi i t/N)`$. For any nonzero integer $`j`$, any primitive frequency $`\eta`$ (so $`p\nmid\eta`$), and any $`\xi`$, put $`Q_j=p^{\min(M,2+v_p(j))}`$. Then

```math
\left|\frac1N\sum_{k\bmod N}e_N\big(\eta F_j(k)-\xi k\big)\right|^2
=\frac{Q_j}{N}\,\mathbf1_{\xi\equiv\eta\pmod{Q_j}}.
```

In particular the support, the modulus on the support, and their dependence on the power are independent of the higher digits of all three generators. Earlier Fourier and packet estimates in issue #592 treated particular unipotent or diagonal families. [Earlier project notes, entries 23–32 and 241–245](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539)

## The cycle coordinate

All restricted power series below have coefficients in $`\mathbb Z_p`$ tending to zero. Such a series preserves congruences. Its double difference with shifts $`h,b`$ is divisible by $`hb`$, by applying the binomial theorem to each monomial and taking limits.

Write $`Z=\exp(pL)`$. The logarithm series on $`1+pM_2(\mathbb Z_p)`$ gives $`L\bmod p=E_{21}`$ and $`\mathrm{tr}(L)=0`$ by the determinant identity for the exponential. Thus $`L^2=dI`$ with $`p\mid d`$. The numerator of the slope divided by $`p`$ in $`\exp(p k L)(1,0)^t`$ has linear coefficient $`r=L_{21}\in\mathbb Z_p^\times`$. Its higher nonzero coefficients, in degrees $`2i+1`$, are $`p^{2i}d^i r/(2i+1)!`$. Their valuations are at least $`2i`$, since $`v_p((2i+1)!)\le i`$. The first component of the column belongs to $`1+p^2\mathbb Z_p\langle k\rangle`$, by the same expansion and $`p\mid L_{11}`$. Consequently

```math
y(k)=rk+p^2 P(k),\qquad y^{-1}(z)=z/r+p^2 R(z)
```

with integral restricted series $`P,R`$. For the inverse, iteration of $`k\mapsto z/r-p^2P(k)/r`$ contracts the coefficient supremum norm on the integral unit ball of restricted series. This also proves bijectivity modulo every $`N`$. Translation by one in $`k`$ is the action of $`Z`$.

## Curvature and the complete sum

Put $`s=v_p(j)`$ and $`W^j=\left(\begin{smallmatrix}a&b\\c&d'\end{smallmatrix}\right)`$. Its leading term is $`I+p^{s+1}(j/p^s)E_{12}\bmod p^{s+2}`$, by the logarithm and exponential at odd $`p`$. The permutation in the $`y`$ coordinate is

```math
w(y)=t+\frac{u y}{1+v y},\quad
t=\frac{c}{pa}\in p^{s+1}\mathbb Z_p,\quad
u=a^{-2}\in1+p^{s+2}\mathbb Z_p,\quad
v=pb/a,\quad v_p(v)=s+2 .
```

Conjugate by the cycle coordinate to get $`F_j(k)=y^{-1}(w(y(k)))`$. Since $`w(y)-y\in p^{s+1}\mathbb Z_p\langle y\rangle`$, subtracting the two values of $`p^2R`$ at $`w(y)`$ and $`y`$ costs a multiple of $`p^{s+3}`$ in the coefficient norm. Expanding the denominator and substituting $`y(k)=rk+p^2P(k)`$ gives an integral restricted series $`B_j`$ with

```math
F_j(k)=t/r+u k-r v k^2+p^{s+3}B_j(k).
```

Thus for nonzero shifts the double difference divided by $`p^{s+2}hb`$ is congruent to the nonzero constant $`-2rv/p^{s+2}\bmod p`$, independently of $`k`$.

More precisely, as $`k`$ ranges uniformly, $`F_j(k+h)-F_j(k)`$ is uniform on the residue class of $`h`$ modulo $`g=\gcd(N,p^2jh)`$. The expansion first puts the difference in that class. If $`g\lt N`$, the double-difference formula says that its values at $`k`$ and $`k+b`$ differ modulo $`N`$ exactly when $`b`$ is nonzero modulo $`N/g`$. There are $`N/g`$ distinct values and each has $`g`$ preimages. The claim for $`g=N`$ follows from the single difference.

Square the absolute value of the Fourier coefficient and group pairs of inputs by their difference $`h`$. If $`v_p(h)\lt M-s-2`$, translate the inner sum in $`k`$ by $`b=p^{M-s-3-v_p(h)}`$. The double difference just calculated multiplies that sum by a fixed nontrivial $`p`$th root of unity. Its value is zero. For the other shifts the single difference $`F_j(k+h)-F_j(k)\equiv h\bmod N`$ follows from the series and congruence preservation. Summing $`e_N((\eta-\xi)h)`$ over these shifts and dividing by $`N`$ gives the displayed exact formula, including $`s+2\ge M`$.

## A restriction on slow vectors

Give functions on the ball the uniform probability norm. Suppose a unit vector $`f`$ is orthogonal to functions on the preceding level, and its six-step energy for the original triple is $`E`$. All of its cycle frequencies are primitive. Put $`\epsilon=\|(W-I)f\|_2\le\tfrac32(p-1)\sqrt{6E}`$. Let $`P_A`$ be projection onto any $`R_0`$ primitive cycle frequencies. For every integer $`J\ge1`$ and $`u_0\ge0`$, set $`d_0=p^{u_0}`$. Then

```math
\|P_A f\|_2\le J d_0\epsilon+
\left(\frac1J+\frac{2}{J^2}\sum_{j=1}^{J-1}(J-j)
\min\!\left\{1,\sqrt{Q_{j d_0}/N}\,m_A(Q_{j d_0})\right\}\right)^{1/2},
```

where $`m_A(q)`$ is the largest number of selected labels in one residue class modulo $`q`$. Indeed each row and column of the compressed $`W^{j d_0}`$ has at most this many nonzero entries, all of the indicated modulus. Apply the row and column sum bound. Averaging $`P_A W^{j d_0}f`$ for $`0\le j\lt J`$ costs at most $`Jd_0\epsilon`$ by telescoping. The squared operator norm of the averaged operator is bounded by expanding its product with its adjoint and grouping by time difference.

Taking $`d_0=1`$ and using $`\sum_{1\le j\le J}p^{v_p(j)/2}\le J/(1-p^{-1/2})`$, optimization at $`J\asymp\epsilon^{-2/3}`$ gives

```math
\|P_A f\|_2^2\ll_p E^{1/3}+R_0/\sqrt N .
```

Enlarging the constant covers large displacements, and taking $`J\to\infty`$ covers $`\epsilon=0`$. Along any sequence with $`N\to\infty`$ and $`E\to0`$, the total mass on every $`o(\sqrt N)`$ labels tends to zero, even if the labels depend on the vector. Its cycle-frequency Shannon entropy is at least $`(1/2-o(1))\log N`$. Indeed take the largest $`\lfloor\sqrt N/\log N\rfloor`$ masses and bound each remaining mass by the reciprocal of that count.

There is a longer range for cyclic intervals. If the interval length $`R_0`$ satisfies $`R_0/N\to0`$ and $`R_0^2\epsilon/N\to0`$ along such a sequence, its mass tends to zero. The class occupancy is at most $`1+R_0/q`$ for a cyclic interval at modulus $`q\mid N`$. Hence the average of the compression bounds is at most a constant depending on $`p`$ times $`R_0/\sqrt{Nd_0}+\sqrt{d_0/N}`$. When $`Q_{j d_0}=N`$ the uncapped square-root term with $`p^{2+v_p(j d_0)}`$ already bounds one. Choose $`d_0`$ a power of $`p`$ much larger than $`\max(1,R_0^2/N)`$ and much smaller than $`\min(N,1/\epsilon)`$, interpreting $`1/0=+\infty`$. Then let $`J\to\infty`$ slowly enough that $`J d_0\epsilon\to0`$.

The interval allowed by almost invariance under the cycle can have length of order $`N\sqrt E`$ times a large constant. The estimates above still allow distributions on that scale. A depth-independent lower bound for the energy of the whole vector remains open. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/592)

The integer check constructs the orbit by matrix multiplication on slopes and counts every value of every finite difference. It uses the standard unipotents and seeded higher-digit lifts, six signed or positive powers per matrix pair, and all inputs and shifts at the indicated levels for $`p=3,5,7`$. Run `python3 -B research/padic-sl2-uniform-gap/check_cyclic_fourier.py`. [Verification script](check_cyclic_fourier.py)
