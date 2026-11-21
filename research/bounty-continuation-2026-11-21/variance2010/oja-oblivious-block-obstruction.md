# An oblivious noncommuting obstruction to the one-vector update

Date: 21 November 2026. Status: a proposed uniform method obstruction, written for independent review. It does not resolve the paid Hazan–Kale–Warmuth problem, which permits algorithms other than Oja's update. No separate direct reward for the narrower conjecture has been established.

## 1. Scope and primary statement

Garber's [2023 primary preprint](https://arxiv.org/abs/2310.15559), Algorithm 1 and Section 3.3, considers

```math
w_{t+1}=(I+\mu A_t)w_t,
\qquad z_t=\frac{w_t}{\|w_t\|},
\qquad
\mathcal R_T=
\lambda_{\max}\!\left(\sum_{t=1}^T A_t\right)
-\sum_{t=1}^Tz_t^\top A_tz_t.
\tag{1}
```

The step $`\mu\ge0`$ is fixed across rounds; it may be chosen as a function of the horizon. Initialization is a random unit vector. The surrounding analysis uses uniform initialization. Conjecture 1 asks for an oblivious bounded symmetric sequence producing linear regret with constant probability. The [2025 journal version](https://doi.org/10.1016/j.orl.2025.107356) retains that conjecture. In particular, it is not a cited theorem of that paper.

The proof below gives constants independent of the horizon, dimension, and step size. All its matrices are positive semidefinite contractions, which is a subclass of the bounded symmetric inputs in the conjecture.

**Theorem.** There exist absolute constants $`c,p>0`$ such that for every dimension $`n\ge2`$, integer $`T\ge2`$, and fixed $`\mu\ge0`$, there is a deterministic sequence

```math
0\preceq A_t\preceq I,\qquad t=1,\ldots,T,
```

chosen without knowledge of the initial vector, for which Oja's update (1), initialized uniformly on the unit sphere, satisfies

```math
\mathbb P\{\mathcal R_T\ge cT\}\ge p.
\tag{2}
```

For the noncommuting block regime, the lower bound holds for every initial unit vector. Random initialization is used only in the elementary very-small-step and large-step cases that complete the quantifiers.

The theorem therefore prevents replacing the cumulative-exponential rank-one action law by this one-vector recursion. It proves no runtime lower bound for all matrix learners.

## 2. Three symmetric factors whose product is orthogonal

Begin in dimension two with

```math
X=\begin{pmatrix}1&0\\0&-1\end{pmatrix},
\qquad
Y=\begin{pmatrix}0&1\\1&0\end{pmatrix},
\qquad
K=e^Ye^{2X}e^Y,
\qquad
Z=-\frac12\log K.
\tag{3}
```

The matrix $`K`$ is positive definite, so $`Z`$ is real symmetric. Since $`\det K=1`$, all three matrices $`X,Y,Z`$ are traceless. Their norms are at most $`2`$: this is immediate for $`X,Y`$, and

```math
e^{-4}I\preceq K\preceq e^4I
```

gives the assertion for $`Z`$.

The matrix

```math
O=e^Ze^Ye^X
```

is orthogonal, because

```math
OO^\top=e^ZKe^Z=I.
\tag{4}
```

However, $`S=X+Y+Z`$ is nonzero. Indeed, $`\|X+Y\|=\sqrt2`$, while cyclicity of trace gives

```math
\frac12\mathop{\mathrm{tr}}K
=\frac12\mathop{\mathrm{tr}}(e^{2X}e^{2Y})
=\cosh^2 2.
```

The eigenvalues of $`K`$ are reciprocal, and therefore

```math
\|Z\|=\frac12\mathop{\mathrm{arcosh}}(\cosh^2 2).
```

For every $`x>0`$,

```math
\cosh^2x-\cosh(\sqrt2x)
=
\sum_{j=2}^{\infty}
\frac{2^{2j-1}-2^j}{(2j)!}\,x^{2j}>0.
\tag{5}
```

Consequently the constant

```math
\delta=
\frac12\mathop{\mathrm{arcosh}}(\cosh^2 2)-\sqrt2
```

is strictly positive. Reverse triangle inequality and tracelessness imply

```math
\lambda_{\max}(S)=\|S\|
\ge\|Z\|-\|X+Y\|
=\delta.
\tag{6}
```

For $`n>2`$, append zero blocks to $`X,Y,Z`$. Equation (4) then holds with the identity on the extra coordinates, and (6) is unchanged.

## 3. An exact block of positive semidefinite losses

It is convenient first to analyze the loss-form recursion

```math
v_{t+1}=
\frac{(I-\eta L_t)v_t}{\|(I-\eta L_t)v_t\|},
\qquad 0\preceq L_t\preceq I.
\tag{7}
```

Fix

```math
0<\eta\le\eta_0:=
\min\{1/2,\delta/12\},
\qquad
m=\left\lceil\frac4\eta\right\rceil.
\tag{8}
```

For $`X_1=X,X_2=Y,X_3=Z`$, set

```math
L_i=\frac{I-\exp((X_i-2I)/m)}{\eta},
\qquad i=1,2,3.
\tag{9}
```

Use $`L_1`$ for $`m`$ rounds, then $`L_2`$ for $`m`$ rounds, then $`L_3`$ for $`m`$ rounds. This is one block of $`3m`$ rounds.

The eigenvalues of $`X_i-2I`$ are in $`[-4,0]`$. Thus the eigenvalues of (9) are nonnegative and are at most

```math
\frac{1-e^{-4/m}}\eta
\le\frac4{m\eta}\le1.
\tag{10}
```

The unnormalized product over the block is exactly

```math
\exp(Z-2I)\exp(Y-2I)\exp(X-2I)
=e^{-6}O.
\tag{11}
```

Hence every initial unit vector has its unnormalized norm multiplied by precisely $`e^{-6}`$. There is no approximation or limiting product in this construction.

### 3.1 Learner loss

For a unit vector $`v`$ and $`0\preceq L\preceq I`$, put $`\ell=v^\top Lv`$. Cauchy–Schwarz gives

```math
\|(I-\eta L)v\|
\ge v^\top(I-\eta L)v
=1-\eta\ell.
```

Since $`-\log(1-x)\le x/(1-x)`$ for $`0\le x<1`$,

```math
-\log\|(I-\eta L)v\|
\le-\log(1-\eta\ell)
\le\frac{\eta\ell}{1-\eta}.
\tag{12}
```

The sum of the negative log-norm increments over the block is exactly $`6`$ by (11). Therefore, regardless of the vector entering the block,

```math
L_{\mathrm{alg,block}}
\ge\frac{6(1-\eta)}\eta
=\frac6\eta-6.
\tag{13}
```

### 3.2 Fixed-vector comparator

For a symmetric matrix $`D`$, the scalar inequality $`e^x\ge1+x`$ applied in its eigenbasis yields $`e^D\succeq I+D`$. Consequently

```math
m\sum_{i=1}^3L_i
\preceq
\frac{6I-S}{\eta}.
```

Using (6),

```math
L_{*,\mathrm{block}}
=\lambda_{\min}\!\left(m\sum_{i=1}^3L_i\right)
\le\frac{6-\delta}{\eta}.
\tag{14}
```

Subtracting (14) from (13) and using (8) gives

```math
R_{\mathrm{block}}
\ge\frac\delta\eta-6
\ge\frac{\delta}{2\eta}.
\tag{15}
```

Each completed block has the same loss sum. Thus for any number of repeated blocks, the best fixed-vector loss is that number times the one-block minimum eigenvalue. The fact that the learner's direction rotates between blocks causes no difficulty: (13) holds for every entering direction.

If $`T\ge6m`$, repeat $`\lfloor T/(3m)\rfloor`$ blocks and put zero losses in the remaining rounds. Then

```math
R_T
\ge
\frac{T}{6m}\frac{\delta}{2\eta}
\ge\frac{\delta}{60}T,
\tag{16}
```

where $`\eta m\le4+\eta\le5`$ was used. This bound holds for every initialization.

## 4. Conversion to the gain convention

Given $`\mu>0`$, set

```math
\eta=\frac{\mu}{1+\mu},
\qquad
A_t=I-L_t.
```

Then

```math
I+\mu A_t
=(1+\mu)(I-\eta L_t).
\tag{17}
```

The scalar factor cancels under normalization, so (1) and (7) have identical directions. Moreover,

```math
\lambda_{\max}\!\left(\sum_t A_t\right)
-\sum_t v_t^\top A_tv_t
=
\sum_t v_t^\top L_tv_t
-\lambda_{\min}\!\left(\sum_tL_t\right).
\tag{18}
```

Zero-loss padding corresponds to identity-gain padding and contributes zero regret.

Write

```math
\mu_0=\frac{\eta_0}{1-\eta_0}.
```

For $`0<\mu\le\mu_0`$ and $`T\ge6\lceil4/\eta\rceil`$, equations (16)–(18) already prove (2) with probability one. In particular, this covers any step-size schedule comparable to $`T^{-1/2}`$ for all sufficiently large horizons.

## 5. Completing the step-size and horizon quantifiers

### 5.1 Very small steps

Suppose $`0<\mu\le\mu_0`$ and

```math
T<6\left\lceil\frac4\eta\right\rceil.
```

Since $`\eta\le1/2`$, this implies

```math
\eta T<24+6\eta\le27,
\qquad
\mu T=\frac{\eta T}{1-\eta}\le54.
\tag{19}
```

Use the constant gain matrix $`A_t=P=e_1e_1^\top`$. Let $`a=|e_1^\top z_1|^2`$. Its normalized mass after $`t-1`$ updates is

```math
a_t=
\frac{(1+\mu)^{2(t-1)}a}
     {1-a+(1+\mu)^{2(t-1)}a}.
```

Set $`\varepsilon=e^{-108}/4`$. On the event $`a\le\varepsilon`$, (19) gives

```math
a_t\le\frac{e^{108}a}{1-a}\le\frac13
\qquad (t\le T).
```

The fixed-vector comparator gains $`T`$, so the regret is at least $`2T/3`$.

For uniform spherical initialization in any $`n\ge2`$, write it as a normalized vector of independent standard Gaussians. Coupling dimensions by adding extra Gaussian coordinates shows

```math
\mathbb P\{a\le\varepsilon\}
\ge
\frac2\pi\arcsin\sqrt\varepsilon
 =:p_0>0.
\tag{20}
```

The same argument applies when $`\mu=0`$; the direction simply never changes.

### 5.2 Steps bounded away from zero

Suppose $`\mu>\mu_0`$. Let $`P`$ be an orthogonal projection of rank $`r=\lfloor n/2\rfloor`$. Alternate gains $`P,I-P`$ for $`\lfloor T/2\rfloor`$ pairs, and use zero gain in a possible final round.

Each pair multiplies the unnormalized vector by $`1+\mu`$:

```math
(I+\mu(I-P))(I+\mu P)=(1+\mu)I.
```

Thus $`w=\|Pz_1\|^2`$ is the same at the beginning of each pair. Put $`C=(1+\mu)^2`$. The pair's best fixed-vector gain is one, and its regret is exactly

```math
d_\mu(w)=
\frac{(C-1)w(1-w)}{1+(C-1)w}
\ge
\bigl(1-(1+\mu_0)^{-2}\bigr)w(1-w).
\tag{21}
```

For uniform spherical initialization,

```math
\mathbb E[w(1-w)]
=\frac{r(n-r)}{n(n+2)}
\ge\frac18.
\tag{22}
```

On the complement of $`E=\{1/16\le w\le15/16\}`$, one has $`w(1-w)\le15/256`$; everywhere it is at most $`1/4`$. Equation (22) therefore gives

```math
\mathbb P(E)\ge
\frac{1/8-15/256}{1/4-15/256}
=\frac{17}{49}.
\tag{23}
```

On $`E`$, each pair's regret is at least

```math
\frac{15}{256}\bigl(1-(1+\mu_0)^{-2}\bigr).
```

Since $`\lfloor T/2\rfloor\ge T/3`$ for $`T\ge2`$, this gives

```math
\mathcal R_T\ge
\frac5{256}\bigl(1-(1+\mu_0)^{-2}\bigr)T
\tag{24}
```

with probability at least $`17/49`$. This holds for arbitrarily large finite step sizes as well.

### 5.3 Absolute constants

Equations (16), (20), and (24) establish the theorem with, for example,

```math
c=
\min\left\{
\frac\delta{60},
\frac23,
\frac5{256}\bigl(1-(1+\mu_0)^{-2}\bigr)
\right\},
\qquad
p=\min\{p_0,17/49\}.
```

All sequences are fixed from $`n,T,\mu`$ before the initialization is drawn. Their construction never observes or depends on that draw. The constants are deliberately not optimized.

## 6. Exact relation to the paid target and prior audit

The dimension-two calculation is a uniform matrix construction, embedded into every dimension $`n\ge2`$; it is not a numerical counterexample search. It proves a failure of the particular cheap update that was being considered for the 2010 paid problem.

The broader target allows fresh randomized matrix actions, density matrices, other state representations, and other update rules. The construction does not exclude any of those. In particular it does not invalidate the prior rank-one exponential sketch: that sketch uses an exponential of the cumulative sum, whereas (7) uses a chronological product.

The narrower conjecture was checked in the full author preprint, whose SHA256 is
`0f4d51d7aa00d1d439e188e6c2bff3613e60d91fb60a084003aabd0e7637253b`.
Targeted searches on 21 November 2026 included the arXiv identifier, “oblivious,” “linear regret,” and “polar decomposition.” The 2025 publisher text still states Conjecture 1; no earlier proof of this construction was identified in those searches. That is a bounded prior-art finding, not an exhaustive priority certification.

No payment offer for Garber's separate Oja conjecture was established. It is therefore recorded as a method obstruction under the paid online-variance lane, with no increment to the paid completion count.
