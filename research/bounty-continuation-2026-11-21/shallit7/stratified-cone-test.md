# A necessary cone test for the bounded primitive-word route

Research note, 21 November 2026. This develops a valid consequence of stratified semilinearity after the affine-width bridge in [the companion note](affine-certificate-obstruction.md) failed. **No violation of the test is proved for the primitive-word language.** The sponsor target remains unresolved.

## 1. Why this criterion applies

For $`m\ge2`$, let

```math
w_m(x)=ab^{x_0}\cdots ab^{x_{m-1}},
\qquad
E_m=\{x\in\mathbb N^m:w_m(x)\text{ is primitive}\}.
```

As proved in the companion note, with $`p`$ ranging over the prime divisors of $`m`$,

```math
E_m=\mathbb N^m\setminus\bigcup_{p\mid m}V_p,
\qquad
V_p=\{x:x_i=x_{i+m/p}\text{ for all }i\in\mathbb Z/m\mathbb Z\}.
```

If the full primitive-word language is context-free, so is its intersection with $`(ab^*)^m`$. A finite-state transducer can delete the $`a`$ separators and relabel $`b`$ in the $`i`$th run by a distinct letter $`c_i`$. Its image is the letter-bounded language

```math
\{c_0^{x_0}\cdots c_{m-1}^{x_{m-1}}:x\in E_m\}.
```

The Ginsburg–Spanier bounded-language characterization therefore makes $`E_m`$ a finite union of stratified linear sets. A period set is stratified when every period has at most two nonzero coordinates and no two two-coordinate supports cross: $`\{i,k\}`$ and $`\{j,\ell\}`$ cannot both occur with $`i\lt j\lt k\lt\ell`$.

The characterization is stated in Kászonyi's 2010 primary paper, Theorem 2, with the exponent-vector setup immediately before it:
<https://publi.math.unideb.hu/paper/1506/download/10_5486_PMD_2010_4680.pdf>.

The next lemma applies to more general unions of forbidden rational subspaces. It is proved here rather than assumed to follow from an informal cone picture.

## 2. Congruence-cleared ray lemma

Let $`H_1,\ldots,H_t\subseteq\mathbb R^m`$ be rational linear subspaces containing $`\mathbf1=(1,\ldots,1)`$. Set

```math
E=\mathbb N^m\setminus\bigcup_{a=1}^{t}H_a.
```

Assume that $`E`$ is a finite union

```math
E=\bigcup_{j=1}^{J}\left(b_j+\sum_{v\in P_j}\mathbb Nv\right),
```

where $`b_j\in\mathbb N^m`$ and the finite period sets $`P_j\subseteq\mathbb N^m`$ are stratified. Fix any $`e\in E`$.

**Lemma.** There is one period set $`P=P_j`$ with these properties:

1. $`\mathbf1\in\mathop{\mathrm{cone}}(P)`$ and $`e\in\mathop{\mathrm{span}}(P)`$.
2. For every $`a`$, there is a real linear form $`\phi_a`$ annihilating $`H_a`$ such that

```math
\phi_a(v)\ge0\quad(v\in P),
\qquad
\phi_a(e)>0.
```

3. There is a subset $`P_0\subseteq P`$ and positive real coefficients $`\lambda_v`$ satisfying

```math
\sum_{v\in P_0}\lambda_v v=\mathbf1,
\qquad
\phi_a(v)=0\quad(v\in P_0,\ 1\le a\le t).
```

In particular, the noncrossing supports of $`P_0`$ cover every coordinate.

**Proof.** Choose a rational linear map $`\pi_a`$ with kernel $`H_a`$ for each $`a`$. All cones below are finitely generated and therefore closed.

For every pair $`j,a`$ for which

```math
-\pi_a(e)\in\mathop{\mathrm{cone}}(\pi_a(P_j)),
```

choose a positive integer $`D_{j,a}`$ such that

```math
-D_{j,a}\pi_a(e)
\in\sum_{v\in P_j}\mathbb N\pi_a(v).
```

Such an integer exists by rationality: a rational point in a rational finitely generated cone has a nonnegative rational representation, whose denominators can be cleared. Let $`D`$ be a common multiple of these finitely many integers, taking $`D=1`$ if there are none.

For every positive $`N`$ divisible by $`D`$, the vector

```math
x_N=N^2\mathbf1+Ne
```

lies in $`E`$, because $`\pi_a(x_N)=N\pi_a(e)\ne0`$ for every $`a`$. Some one linear set $`b_j+\sum\mathbb NP_j`$ contains $`x_N`$ for infinitely many such $`N`$; fix that $`j`$.

Suppose $`-\pi_a(e)`$ belonged to the projected cone for this $`j`$. The chosen denominator divides $`N`$, so an element $`z\in\sum\mathbb NP_j`$ would satisfy $`\pi_a(z)=-N\pi_a(e)`$. Then $`x_N+z`$ would belong both to the same linear set and to $`H_a`$, contradicting its containment in $`E`$. Hence

```math
-\pi_a(e)\notin\mathop{\mathrm{cone}}(\pi_a(P_j))
\quad\text{for every }a.
```

On the other hand,

```math
\frac{\pi_a(x_N-b_j)}{N}
=\pi_a(e)-\frac{\pi_a(b_j)}{N}
\in\mathop{\mathrm{cone}}(\pi_a(P_j)),
```

so closure gives $`\pi_a(e)`$ in this cone. Separating the point $`-\pi_a(e)`$ from the closed convex cone yields a linear form nonnegative on the cone and strictly negative at that point. Composing with $`\pi_a`$ gives the required $`\phi_a`$.

Also,

```math
\frac{x_N-b_j}{N^2}\longrightarrow\mathbf1,
```

so $`\mathbf1\in\mathop{\mathrm{cone}}(P_j)`$. If a linear form annihilates $`P_j`$, it vanishes on $`x_N-b_j`$ for infinitely many $`N`$. The resulting polynomial identity in $`N`$ forces it to annihilate both $`\mathbf1`$ and $`e`$. Thus $`e\in\mathop{\mathrm{span}}(P_j)`$.

Choose a conic representation of $`\mathbf1`$ by $`P_j`$ and discard zero coefficients. Every $`\phi_a`$ vanishes on $`\mathbf1\in H_a`$ and is nonnegative on every period. Therefore each period with positive coefficient in the representation has $`\phi_a(v)=0`$ for every $`a`$. This proves the last assertion. $`\square`$

The denominator-clearing step is essential. An affine monoid can avoid a forbidden subspace solely by a congruence condition even if its real cone meets the subspace. The proof does not infer an integer intersection from a real intersection without this step.

## 3. A calibration where the criterion proves non-context-freeness

Consider

```math
F=\{x\in\mathbb N^4:x_0\ne x_2,\ x_1\ne x_3\}.
```

Its forbidden subspaces are $`H_1=\{x:x_0=x_2\}`$ and $`H_2=\{x:x_1=x_3\}`$, both containing $`\mathbf1`$. Take $`e=(0,0,1,1)\in F`$.

Any separating forms supplied by the lemma are positive multiples of $`x_2-x_0`$ and $`x_3-x_1`$, respectively. Every active period in $`P_0`$ must consequently satisfy

```math
v_0=v_2,\qquad v_1=v_3.
```

A nonzero period with at most two nonzero coordinates is then supported on $`\{0,2\}`$ or on $`\{1,3\}`$. Covering every coordinate in the representation of $`\mathbf1`$ needs both types. Their supports cross, contradicting stratification.

Thus $`F`$ is not stratified semilinear, and the corresponding four-letter bounded language is not context-free. This is a check that the criterion can enforce a real grammar obstruction; it is not a paid target or a claimed new theorem.

## 4. What remains for primitive words

For $`H_a=V_p`$, the annihilator condition on a row $`\phi_p=(\phi_{p,0},\ldots,\phi_{p,m-1})`$ is

```math
\sum_{k=0}^{p-1}\phi_{p,j+km/p}=0
\qquad(0\le j\lt m/p).
```

A negative witness $`e\in E_m`$ would have to rule out **every** collection of forms satisfying these orbit-sum conditions, strict positivity at $`e`$, and the common noncrossing two-coordinate period cover required by the lemma. Unlike the calibration in §3, each annihilator generally has large dimension. Choosing one convenient family of forms and finding that its supports cross would not suffice.

The earlier results already establish context-freeness when $`m`$ has at most three distinct prime factors, and also under the reciprocal-prime condition in [the status audit](target-and-prior-audit.md). A simple first squarefree shape outside those theorems is $`m=2\cdot3\cdot5\cdot7`$. This identifies a possible structural test domain, not evidence that its exponent set is non-context-free.

The additive periodic-sum witnesses from the first approach are insufficient: the explicit fixed context-free sublanguage of primitive words in the companion note contains such witnesses for arbitrarily many prime factors. The next plausible candidates would need intermediate mixed-prime interactions. No candidate excluding all the admissible forms and covers has been found here.

The full question remains open in this work. The unresolved obligation is an actual failure of stratified semilinearity, rather than a failure of a selected affine certificate syntax.
