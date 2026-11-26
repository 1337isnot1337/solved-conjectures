# Testing the congruence-tower gap on one projective ball

Fix an odd prime $`p`$. Write $`K_j=\ker(\mathrm{SL}_2(\mathbb Z_p)\to\mathrm{SL}_2(\mathbb Z/p^j))`$, $`K=K_1`$ and $`G_n=K/K_n`$. Let $`S=(s_1,s_2,s_3)`$ generate $`K`$ topologically. All gaps are upper gaps for the uniform six-move walk. All function spaces use complex scalars.

**Theorem.** For each fixed $`S`$, the regular walks on the $`G_n`$ have a positive tower gap if and only if the walks on the single projective ball $`X_m=p\mathbb Z/p^m\mathbb Z`$ have a positive tower gap. Use slope $`x`$ for the line through $`(1,x)^t`$. The same three matrices act at every level by

```math
g x=\frac{c+dx}{a+bx},\qquad
g=\begin{pmatrix}a&b\\c&d\end{pmatrix}.
```

Consequently the uniform conjecture is equivalent to **pointwise** positivity of the tower gap on this fixed ball for every generating triple. A counterexample for one triple on the groups would already give a counterexample for that same triple on the ball. Proving positivity on the ball for every triple remains open.

More precisely, write $`a_m(S)=\min\{1,g(X_m,S)\}`$. There is an explicit constant $`d_p>0`$ such that for every generating triple and every $`n\ge5`$,

```math
\min\{g(G_4,S),\ d_p\,a_{n-3}(S)^6\}
\ \le\ g(G_n,S)\ \le\ g(X_n,S).
```

The lower bound uses the ordinary projective walk at one finite level. An intermediate action is the cover $`Y_m=X_m\times\mathbb F_p`$ with $`g(x,t)=(gx,t+\beta(g))`$, where $`\beta(g)=b/p\bmod p`$. This is a transitive set of $`p^m`$ points for $`m\ge2`$. Lower unipotents move the slope transitively, and upper unipotents stabilize zero and give all fiber translations. Denote its gap by $`y_m(S)`$.

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

## 3. A difference of neighboring phases gives an ordinary walk

Let $`f`$ be a unit vector of energy $`e`$ in $`T_\theta`$, now using uniform probability on $`X_m`$. The energy of $`|f|`$ in the ordinary slope action is at most $`e`$. The cover $`Y_m`$ has gap $`y=y_m(S)>0`$ and projects onto $`X_m`$. Thus $`\mathrm{Var}(|f|)\le e/y`$. Choose a modulus-one phase $`u`$ of $`f`$, assigning any phase at its zeros. Then

```math
\|u-f\|_2^2=2(1-\mathbb E|f|)\le2e/y,\qquad
\sqrt{E_{T_\theta}(u)}\le(1+2/\sqrt y)\sqrt e .
```

The latter uses the triangle inequality for the three displacements and $`E(v)\le2\|v\|^2`$. Put $`q=p^{m-1}`$. The determinant-one identity for the difference of two fractional linear transformations gives $`g(x+q)=gx+q\bmod p^m`$. Their multipliers satisfy

```math
\frac{\theta(a+b(x+q))}{\theta(a+bx)}
=\theta\!\left(1+\frac{bq}{a+bx}\right)=e_p(2\beta(g)).
```

It follows that $`F(x,t)=u(x+q)\overline{u(x)}e_p(-2t)`$ is a unit mean-zero test function on $`Y_m`$. Its energy is at most $`4E_{T_\theta}(u)`$. Indeed the error in the product at $`gx\,,g(x+q)`$ is bounded in norm by the sum of the two errors in $`u(gx)\simeq\theta(a+bx)u(x)`$. Translation by $`q`$ preserves the uniform measure and the extra character cancels the multiplier ratio exactly. Mean zero follows by summing over $`t`$. Therefore

```math
h_k(H)\ge\frac{y_{k-1}(S)^2}{4(2+\sqrt2)^2}.
```

Apply the two-level descent to every exact conductor between five and $`n`$. The gaps of $`Y_m`$ are nonincreasing under quotient projection. The remaining conductors occur on $`G_4`$. This proves $`g(G_n,S)\ge\min\{g(G_4,S),c_p y_{n-3}(S)^2\}`$ with $`c_p=1/(4(2+\sqrt2)^2L_p^2)`$.

## 4. Removing the cover at the same finite level

Fix $`m\ge2`$ and abbreviate $`a_*=a_m(S)`$. The following estimate converts the cover gap to the ordinary slope gap:

```math
y_m(S)\ge b_p a_*^3,\qquad
b_p=\min\{\kappa_p/36,\ 1/(324(2p-1)^2)\}.
```

For a character $`\eta`$ through the first digit, let $`E_\eta(f)=\frac16\sum_{s\in S}\|f(sx)-\eta(s)f(x)\|_2^2`$ on a slope space. Here the sum uses the three entries of the triple. Fourier decomposition in the cover coordinate gives $`\eta=e_p(j\beta)`$. At $`j=0`$ the ordinary gap applies off constants. Take $`j\ne0`$ and a minimizing unit vector of energy $`e`$ in its sector.

The nested slope levels give an orthogonal invariant decomposition into $`L^2(X_2)`$ and the new parts $`L^2(X_k)\ominus L^2(X_{k-1})`$, $`3\le k\le m`$. On a new part, translation by $`q=p^{k-1}`$ commutes with the action and has order $`p`$. Its invariant space consists of functions from the preceding level, so a minimizing component can be taken with $`f(x+q)=e_p(\alpha)f(x)`$, $`\alpha\ne0`$. These decompositions also apply with any fixed twist $`\eta`$.

Write $`A_1(g)=(a-1)/p\bmod p`$. On $`X_2`$, the slope coordinate $`x/p`$ changes by $`c/p\bmod p`$. Consequently the twisted energy minimum on $`L^2(X_2)`$ is at least $`\kappa_p`$ for any nontrivial character along $`\beta`$ or along $`A_1`$. Indeed each additive slope frequency subtracts a multiple of the independent lower-left coordinate, and the generator digits span $`V`$.

At a new level $`k\ge3`$ replace $`f`$ by its modulus-one phase $`u`$. On each zero fiber choose phases obeying the same sibling translation rule. The entire fiber consists of zeros in that case, and the rule is consistent around its $`p`$ points. The variance estimate from Section 3, now using the ordinary slope gap at least $`a_*`$, gives $`E_\eta(u)\le9E_\eta(f)/a_*`$.

Take the longer shift $`h=p^{k-2}`$. Determinant one and $`a+bx\equiv1+pA_1(g)\bmod p^2`$ give

```math
g(x+h)=gx+h-2A_1(g)q\pmod{p^k}.
```

Indeed $`g(x+h)-gx=h/((a+bx)(a+b(x+h)))`$, and $`bh=0\bmod p^2`$. The modulus-one difference $`v(x)=u(x+h)\overline{u(x)}`$ is periodic under $`q`$, so it descends to $`X_{k-1}`$. The formula for the shift gives

```math
E_\sigma(v)\le4E_\eta(u),\qquad
\sigma(g)=e_p(2\alpha A_1(g)).
```

To verify the sign, replace $`u(gx+h)`$ by $`e_p(2\alpha A_1(g))u(g(x+h))`$. The two original factors of $`\eta(g)`$ then cancel. The product error is bounded by the sum of the two errors since all phases have modulus one.

Starting with the cover twist, either the minimum is on $`X_2`$ and $`e\ge\kappa_p`$, or this construction gives a unit $`v`$ on a lower level of diagonal-twisted energy at most $`36e/a_*`$. Choose a normalized component of $`v`$ in the same orthogonal decomposition with energy $`e'\le36e/a_*`$. If this component lies in $`L^2(X_2)`$, then $`e'\ge\kappa_p`$. Otherwise let its new level be $`l\ge3`$ and its nonzero sibling frequency be $`\alpha'`$. Its modulus-one phase $`u'`$ satisfies $`E_\sigma(u')\le9e'/a_*`$. Differencing again gives a modulus-one $`v'`$ on $`X_{l-1}`$ with $`E_{\sigma'}(v')\le4E_\sigma(u')`$, where $`\sigma'=e_p(2\alpha' A_1)`$.

Choose $`1\le r\le p-1`$ with $`r\alpha'=\alpha\bmod p`$. Then $`u'\overline{(v')^r}`$ has norm one and mean zero on $`X_l`$. Its sibling frequency is $`\alpha'\ne0`$, since $`v'`$ comes from the preceding level. The two diagonal characters cancel. Telescoping the power of a unit phase and using the triangle inequality for the three displacements gives

```math
a_*\le E_1\!\left(u'\overline{(v')^r}\right)
   \le(1+2r)^2 E_\sigma(u')
   \le324(2p-1)^2 e/a_*^2.
```

This proves the claimed cubic estimate, including both $`X_2`$ cases since $`a_*\le1`$. Together with Section 3 it gives the theorem with $`d_p=c_p b_p^2`$. The upper bound follows because $`X_n`$ is a transitive quotient of $`G_n`$. The finite group $`G_4`$ has finitely many generating markings, so its gap has a positive minimum at fixed $`p`$.

## 5. Passing from individual triples to uniformity

Finally, if every generating triple has a positive regular tower gap, there is a common constant. For completeness, the space of generating triples is compact and open in $`K^3`$ by the basis test modulo $`K_2`$. Each finite-level gap is locally constant. By Baire, some closed tower-gap superlevel with positive threshold $`\eta`$ contains a generating cylinder modulo $`K_r`$. For any triple $`T`$, realize the prescribed three residues by words in $`T^{\pm1}`$ of length at most $`D`$, the maximum generating-triple diameter of the finite group $`G_r`$. Their lifts lie in the cylinder. Telescoping on any unit vector bounds the new energy by $`3D^2`$ times the old energy. This gives $`g(G_n,T)\ge\eta/(3D^2)`$ for every $`T,n`$. [Earlier Baire argument in issue #592](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145028538)

## Scope and checks

The reduction applies to arbitrary entries in $`\mathbb Z_p`$ and supplies a criterion for the open spectral-gap problem. The remaining estimate is a positive Poincaré constant on $`p\mathbb Z_p`$ for every dense generating triple. The algebraic-generator theorem supplies such a gap for each fixed algebraic triple. The finite-field uniform expansion theorem concerns a different family of finite groups. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/592) · [Earlier projective-ball and congruence calculations](https://github.com/1337isnot1337/solved-conjectures/issues/592#issuecomment-7145635539) · [Salehi Golsefidy, Theorem 2](https://arxiv.org/abs/1602.00403) · [Becker and Breuillard, Theorem 1.1](https://arxiv.org/html/2608.00755v1)

The accompanying exact-arithmetic check tests the trace-pairing planes, the phase identities, and the regular-sector character identity at finite levels. Run it with `python3 research/padic-sl2-uniform-gap/check_transfer.py`. The all-level argument is the written proof above. [Verification script](check_transfer.py)

On the resulting projective ball, two bounded words in any generating triple give an exact formula for their primitive Fourier overlaps at every level and every nonzero power of the second word. A sequence of new unit vectors with vanishing energy must distribute its cycle Fourier mass over at least square-root scale. [Fourier formula, proof and scope](CYCLIC-FOURIER.md)

For an arbitrary marking, a short word of depth $`d`$ gives a direct energy comparison from exact conductor $`d+b`$ to conductor $`b`$ when $`3\le b\le d`$. On a full neighborhood of an explicit arithmetic marking, three fixed relations identify the first digit where a triple departs from its arithmetic conjugacy class. [Short-word bound and explicit coordinates](SHORT-RELATIONS.md)

In position coordinates, a slow vector has vanishing mass on rational points of subpower height in every integral projective chart, including charts varying with the level. The proof recovers a rational matrix from three modular point matches and transfers a localized vector to a free-group action. [Rational-point bound and scope](RATIONAL-POINTS.md)
