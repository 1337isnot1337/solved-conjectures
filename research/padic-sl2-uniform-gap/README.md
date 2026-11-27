# Testing the congruence-tower gap on one projective ball

Fix an odd prime $`p`$. Write $`K_j=\ker(\mathrm{SL}_2(\mathbb Z_p)\to\mathrm{SL}_2(\mathbb Z/p^j))`$, $`K=K_1`$ and $`G_n=K/K_n`$. Let $`S=(s_1,s_2,s_3)`$ generate $`K`$ topologically. All gaps are upper gaps for the uniform six-move walk. All function spaces use complex scalars.

**Theorem.** For each fixed $`S`$, the regular walks on the $`G_n`$ have a positive tower gap if and only if the walks on the single projective ball $`X_m=p\mathbb Z/p^m\mathbb Z`$ have a positive tower gap. Use slope $`x`$ for the line through $`(1,x)^t`$. The same three matrices act at every level by

```math
g x=\frac{c+dx}{a+bx},\qquad
g=\begin{pmatrix}a&b\\c&d\end{pmatrix}.
```

Consequently the uniform conjecture is equivalent to **pointwise** positivity of the tower gap on this fixed ball for every generating triple. A counterexample for one triple on the groups would already give a counterexample for that same triple on the ball. Proving positivity on the ball for every triple remains open.

At each finite level the two gaps are comparable up to a constant depending only on $`p`$. More precisely, write $`a_m(S)=\min\{1,g(X_m,S)\}`$. There is an explicit constant $`d_p>0`$ such that for every generating triple and every $`n\ge5`$,

```math
\min\{g(G_4,S),\ d_p\,a_{n-3}(S)\}
\ \le\ g(G_n,S)\ \le\ g(X_n,S).
```

An intermediate action is the cover $`Y_m=X_m\times\mathbb F_p`$ with $`g(x,t)=(gx,t+\beta(g))`$, where $`\beta(g)=b/p\bmod p`$. This is a transitive set of $`p^m`$ points for $`m\ge2`$. Lower unipotents move the slope transitively, and upper unipotents stabilize zero and give all fiber translations. Denote its gap by $`y_m(S)`$. Sections 3 and 4 clip the test functions to the closed unit disk to obtain linear comparisons in both steps. [Original sixth-power estimate](https://github.com/1337isnot1337/solved-conjectures/blob/a12a7f95d7d39f543943f6df9c7dd84d2a8951f8/research/padic-sl2-uniform-gap/README.md)

The earlier issue reduction uses ordered pairs of distinct projective lines and gives an equality of worst-case gaps. The proof below gives a same-triple implication for one line by transferring almost-invariant vectors between representations. [Earlier split-torus reduction](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145149763)

## 1. Two levels suffice to prescribe the central character

Let $`V=\mathfrak{sl}_2(\mathbb F_p)`$, $`e_p(t)=\exp(2\pi i t/p)`$, and $`Z_n=K_{n-1}/K_n`$. This central group consists of $`1+p^{n-1}X`$ with $`X\in V`$. Parameterize its characters by $`\chi_A(X)=e_p(\mathrm{tr}(AX))`$. For $`A\ne0`$, denote by $`h_n(A)`$ the least Rayleigh energy in the $`\chi_A`$ sector of the regular representation. Every character occurs there. Its nonzero parameters have exact conductor $`n`$. For any unit vector $`v`$ in a unitary representation the energy is

```math
E(v)=\frac16\sum_{i=1}^3\|s_i v-v\|^2.
```

**Descent.** If $`n\ge4`$, $`A,B\ne0`$ and $`\mathrm{tr}(AB)=0`$, then $`h_{n-1}(B)\le L_p h_n(A)`$. One can take $`L_p=16p^2/\kappa_p`$, where $`\kappa_p=(1-\cos(2\pi/p))/3`$.

Take a unit minimizing vector in an irreducible $`\pi`$ of central character $`A`$, with energy $`e=h_n(A)`$. The group $`K_{n-2}/K_n`$ is the additive traceless algebra modulo $`p^2`$ under $`1+p^{n-2}X\mapsto X`$. The restriction of $`\pi`$ to it has a single orbit of weights, since the sum of the weight spaces in an orbit is invariant. Under the trace pairing these weights form

```math
M_0+p A^\perp,\qquad M_0\bmod p=A,\qquad
A^\perp=\{x\in V:\mathrm{tr}(Ax)=0\}.
```

Indeed conjugation by an element with first digit $`D`$ translates the second digit by $`[D,A]`$. The image is $`A^\perp`$ since its orthogonal complement is the centralizer of $`A`$ in $`V`$, namely the line through $`A`$. Here the trace pairing is nondegenerate and every nonzero traceless matrix is nonscalar at odd $`p`$. Thus there are $`p^2`$ weights. The three translations span the plane because the first digits of $`S`$ span $`V`$.

Write $`v=\sum_x v_x`$ by weight and $`w_x=\|v_x\|`$, with the counting norm on the plane. The reverse triangle inequality gives $`E(w)\le e`$ for the translation walk. Its gap is at least $`\kappa_p`$ by additive Fourier analysis. Consequently $`\|w-\mathbf1/p\|_2^2\le2e/\kappa_p`$, using positivity of its constant coefficient. If $`e\le\kappa_p/(8p^2)`$, each $`w_x\ge1/(2p)`$.

The representation $`\pi\otimes\bar\pi`$ factors through $`G_{n-1}`$. The component of $`v\otimes\bar v`$ with central character $`B`$ there has squared norm

```math
\sum_x w_{x+B}^2 w_x^2\ \ge\ 1/(4p^2).
```

The summands correspond to orthogonal pairs of weights whose difference is $`pB`$. The whole tensor has energy at most $`2e`$, by $`1-|z|^2\le2(1-\Re z)`$ on the unit disk. The projection commutes with the walk, so normalization gives $`h_{n-1}(B)\le8p^2e`$. For larger $`e`$, use $`h_{n-1}(B)\le2`$ to obtain the stated $`L_p`$.

For arbitrary nonzero $`A,C`$, choose a nonzero $`B\in A^\perp\cap C^\perp`$. These two planes in dimension three have a common line or coincide. Two descents give, for $`n\ge5`$ and the very same marking,

```math
h_{n-2}(C)\le L_p^2 h_n(A).
```

## 2. The split central character acts on a twisted projective ball

Choose $`C=H=\mathrm{diag}(1,-1)`$. For $`k\ge3`$ put $`m=k-1`$. Write $`U=\{1+bE_{12}:b\in p\mathbb Z/p^k\}`$ and identify the diagonal subgroup with $`D=1+p\mathbb Z/p^k\mathbb Z`$ via its top-left entry. For each character $`\theta`$ of $`D`$ with $`\theta(1+p^{k-1}t)=e_p(2t)`$, consider the unitary action

```math
T_\theta(g)e_x=\theta(a+bx)e_{gx},\qquad x\in X_m .
```

The multiplier is well-defined modulo $`p^k`$ because $`p\mid b`$. Multiplication of matrices gives the cocycle identity by applying them to the column $`(1,x)^t`$. The last layer acts by $`\chi_H`$.

Every irreducible $`\pi`$ with central character $`H`$ occurs in one of these actions. To see this, average its character over $`U`$. If $`j=v_p(b)\le k-2`$, the commutator of $`1+p^{k-1-j}E_{21}`$ with $`1+bE_{12}`$ has nonzero diagonal leading term in the last layer. Its scalar in $`\pi`$ differs from one because $`p`$ is odd. Thus $`\mathrm{Tr}\,\pi(1+bE_{12})=0`$. The last $`p`$ elements of $`U`$ act trivially, giving

```math
\dim\pi^U=p^{2-k}\dim\pi>0 .
```

Choose a diagonal eigenline in $`\pi^U`$. The stabilizer of $`x=0`$ in $`G_k`$ consists of the matrices with $`c=0\bmod p^{k-1}`$. It is generated by the upper triangular group and the last lower unipotents, as follows by eliminating $`c`$ using the unit $`a`$. Those last lower unipotents act trivially. Hence the stabilizer acts on the chosen line by $`g\mapsto\theta(a)`$ with the prescribed restriction on $`D`$. Inducing this character gives exactly $`T_\theta`$ by the displayed basis action. Frobenius reciprocity proves the assertion.

In fact $`p^{k-2}`$ copies of the sum of the $`T_\theta`$ give the entire regular $`H`$ sector. For any such $`\pi`$ the sum of its multiplicities in these actions is $`\dim\pi^U`$, by the same reciprocity applied to every diagonal character.

## 3. Clipping and the difference of neighboring values

Use uniform probability on each slope space and the same quadratic energy for vectors of arbitrary norm. Suppose $`f`$ is a unit vector of twisted energy $`e`$, where each move permutes the slopes and multiplies by a unit scalar that may depend on the slope. If the ordinary slope gap is at least $`a>0`$, define

```math
u(x)=\frac{f(x)}{\max(1,|f(x)|)},\qquad
\delta(u)=\|1-|u|\|_2 .
```

Projection onto the closed unit disk is 1-Lipschitz and commutes with multiplication by a unit scalar. Thus the twisted energy of $`u`$ is at most $`e`$. Also $`|f|`$ has ordinary energy at most $`e`$. Poincaré gives $`1-(\mathbb E|f|)^2\le e/a`$, so

```math
\delta(u)^2\le\|1-|f|\|_2^2=2(1-\mathbb E|f|)\le 2e/a .
```

For factors of modulus at most one, the modulus deficit of a product is at most the sum of their deficits pointwise. In particular a product of $`j`$ translated copies of $`u`$ or $`\bar u`$ has norm at least $`1-j\delta(u)`$. Telescoping its displacement also costs at most the sum of the individual errors. This lets us bound the energy and the norm separately.

Apply this to a unit vector in $`T_\theta`$ at level $`k`$, where $`m=k-1`$. Its energy is $`e`$ and the ordinary slope gap is at least $`y=y_m(S)`$ since $`X_m`$ is a quotient of $`Y_m`$. Put $`q=p^{m-1}`$. The determinant-one identity gives $`g(x+q)=gx+q\bmod p^m`$. The quotient of the multipliers is

```math
\frac{\theta(a+b(x+q))}{\theta(a+bx)}
=\theta\!\left(1+\frac{bq}{a+bx}\right)=e_p(2\beta(g)).
```

Hence $`F(x,t)=u(x+q)\overline{u(x)}e_p(-2t)`$ has mean zero on $`Y_m`$ by summation in $`t`$, and $`E(F)\le4e`$. Indeed the two errors in $`u(gx)\simeq\theta(a+bx)u(x)`$ bound the error for the product and the extra character cancels the multiplier quotient. As $`\|F\|_2\ge1-2\sqrt{2e/y}`$ and $`\sqrt y\|F\|_2\le2\sqrt e`$, we obtain

```math
h_k(H)\ge c_0\, y_{k-1}(S),\qquad
c_0=\frac{1}{4(1+\sqrt2)^2}.
```

Apply Section 1 to each exact conductor from five to $`n`$. The cover gaps are nonincreasing under projection. The other conductors occur on $`G_4`$. It follows that $`g(G_n,S)\ge\min\{g(G_4,S),\,c_0 y_{n-3}(S)/L_p^2\}`$.

## 4. Removing the cover at the same finite level

Fix $`m\ge2`$ and abbreviate $`a_*=a_m(S)`$. For a first-digit character $`\eta`$ use the twisted energy $`E_\eta(f)=\frac16\sum_{s\in S}\|f(sx)-\eta(s)f(x)\|_2^2`$, where the sum runs over the three entries of the triple. Write $`A_1(g)=(a-1)/p\bmod p`$. On $`X_2`$ the coordinate $`x/p`$ changes by $`c/p\bmod p`$. For a nontrivial character along either $`\beta`$ or $`A_1`$ the least twisted energy on $`X_2`$ is at least $`\kappa_p`$. Indeed an additive slope frequency subtracts a multiple of the independent lower-left coordinate, and the three first generator digits span $`V`$.

The nested slope spaces decompose into $`L^2(X_2)`$ and the new parts at levels $`3\le k\le m`$. At a new level, translation by $`q=p^{k-1}`$ commutes with the walk, has order $`p`$, and has invariants precisely from the preceding level. Thus a minimizing component may be taken to satisfy $`f(x+q)=e_p(\alpha)f(x)`$ with $`\alpha\ne0`$. Clipping $`f`$ preserves this relation, including at zeros. Let $`h=p^{k-2}`$. The determinant-one difference formula and $`a+bx=1+pA_1(g)\bmod p^2`$ give

```math
g(x+h)=gx+h-2A_1(g)q\pmod{p^k}.
```

Here $`bh=0\bmod p^2`$. For a unit $`f`$ of twisted energy $`e`$ in this component, let $`u`$ be its clipping and $`v(x)=u(x+h)\overline{u(x)}`$. The sibling relation makes $`v`$ periodic under $`q`$, so it descends to $`X_{k-1}`$. Replacing $`u(gx+h)`$ by $`e_p(2\alpha A_1(g))u(g(x+h))`$ cancels the input character between the two factors. In particular

```math
E_\sigma(v)\le4e,\qquad \|v\|_2\ge1-2\sqrt{2e/a_*},
\qquad \sigma(g)=e_p(2\alpha A_1(g)).
```

First let the input twist be $`\eta=e_p(jA_1)`$ with $`j\ne0`$. Choose $`1\le t\le p-1`$ so that $`2t\alpha=j\bmod p`$. The function $`w=u\,\overline{v^t}`$ on $`X_k`$ has ordinary mean zero since its sibling character is still $`\alpha`$. Its two twists cancel. The product bounds give $`E_1(w)\le(1+2t)^2e`$ and $`\|w\|_2\ge1-(1+2t)\sqrt{2e/a_*}`$. Using $`\sqrt{a_*}\|w\|_2\le(1+2t)\sqrt e`$ gives $`e\ge a_*/[(1+\sqrt2)^2(2p-1)^2]`$. Together with the $`X_2`$ case, this bounds the energy of every diagonal-twisted vector on every level through $`m`$ below by $`b_0 a_*`$ times its squared norm, with

```math
b_0=\min\{\kappa_p,\ [(1+\sqrt2)^2(2p-1)^2]^{-1}\}.
```

Next let the input be a nontrivial cover twist $`\eta=e_p(j\beta)`$. In a new component the preceding diagonal-twisted bound gives $`\sqrt{b_0 a_*}\|v\|_2\le2\sqrt e`$. Combining this with the norm bound on $`v`$ gives $`1\le2(\sqrt2+b_0^{-1/2})\sqrt{e/a_*}`$. The base component costs at least $`\kappa_p`$. The trivial cover twist has ordinary mean-zero gap at least $`a_*`$. Fourier decomposition in the cover coordinate now gives

```math
y_m(S)\ge b_p a_m(S),\qquad
b_p=\min\{1,\kappa_p,\ [4(\sqrt2+b_0^{-1/2})^2]^{-1}\}.
```

This proves the displayed finite-level bound with $`d_p=c_0 b_p/L_p^2`$. Since $`X_n`$ is a transitive quotient of $`G_n`$, its gap also gives the upper bound. The finite group $`G_4`$ has a positive minimum gap $`\gamma_p`$ over its finitely many generating triples. For $`2\le n\le4`$ the projection from $`G_4`$ gives the same lower bound $`\gamma_p`$ for the regular gap. Finally $`a_{n-3}\ge\frac12 g(X_n,S)`$ for $`n\ge5`$ by monotonicity and $`g(X_n,S)\le2`$. We therefore obtain, for the same triple at every level,

```math
\frac{\min(\gamma_p,d_p)}2\,g(X_n,S)
\ \le\ g(G_n,S)\ \le\ g(X_n,S),\qquad n\ge2 .
```

## 5. Passing from individual triples to uniformity

Finally, if every generating triple has a positive regular tower gap, there is a common constant. For completeness, the space of generating triples is compact and open in $`K^3`$ by the basis test modulo $`K_2`$. Each finite-level gap is locally constant. By Baire, some closed tower-gap superlevel with positive threshold $`\eta`$ contains a generating cylinder modulo $`K_r`$. For any triple $`T`$, realize the prescribed three residues by words in $`T^{\pm1}`$ of length at most $`D`$, the maximum generating-triple diameter of the finite group $`G_r`$. Their lifts lie in the cylinder. Telescoping on any unit vector bounds the new energy by $`3D^2`$ times the old energy. This gives $`g(G_n,T)\ge\eta/(3D^2)`$ for every $`T,n`$. [Earlier Baire argument in issue #592](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145028538)

## Scope and checks

The reduction applies to arbitrary entries in $`\mathbb Z_p`$ and supplies a criterion for the open spectral-gap problem. The remaining estimate is a positive Poincaré constant on $`p\mathbb Z_p`$ for every dense generating triple. The algebraic-generator theorem supplies such a gap for each fixed algebraic triple. The finite-field uniform expansion theorem concerns a different family of finite groups. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/592) · [Earlier projective-ball and congruence calculations](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539) · [Salehi Golsefidy, Theorem 2](https://arxiv.org/abs/1602.00403) · [Becker and Breuillard, Theorem 1.1](https://arxiv.org/html/2608.00755v1)

The accompanying exact-arithmetic check tests the trace-pairing planes, the phase identities and the regular-sector character identity at finite levels. It also checks the clipped products on 480 moves at powers of three using integer amplitudes with a common denominator and cubic roots of unity, including vectors with zeros. Run it with `python3 -B research/padic-sl2-uniform-gap/check_transfer.py`. [Verification script](check_transfer.py)

On the resulting projective ball, two bounded words in any generating triple give an exact formula for their primitive Fourier overlaps at every level and every nonzero power of the second word. A sequence of new unit vectors with vanishing energy must distribute its cycle Fourier mass over at least square-root scale. [Fourier formula, proof and scope](CYCLIC-FOURIER.md)

For an arbitrary marking, a short word of depth $`d`$ gives a direct energy comparison from exact conductor $`d+b`$ to conductor $`b`$ when $`3\le b\le d`$. On a full neighborhood of an explicit arithmetic marking, three fixed relations identify the first digit where a triple departs from its arithmetic conjugacy class. [Short-word bound and explicit coordinates](SHORT-RELATIONS.md)

At any prescribed congruence depth one can also choose short words with an arbitrary leading Lie digit. At Fibonacci depths their lengths give a stronger lower bound on the number of cycle frequencies carrying a fixed fraction of a slow vector's mass. [Word construction and Fourier support bound](DEPTH-WORDS.md)

In position coordinates, a slow vector has vanishing mass on rational points of subpower height in every integral projective chart, including charts varying with the level. The proof recovers a rational matrix from three modular point matches and transfers a localized vector to a free-group action. [Rational-point bound and scope](RATIONAL-POINTS.md)

At a fixed spectral threshold below one, the whole high spectral subspace has vanishing projection onto shrinking neighborhoods of bounded-degree plane curves in joint position and frequency coordinates. This holds for all generating triples, including when the curve and its coefficients vary with the level. [Phase-plane estimate and scope](PHASE-PLANE.md)
