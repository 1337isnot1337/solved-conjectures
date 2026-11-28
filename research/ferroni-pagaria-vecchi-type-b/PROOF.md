# Ferroni–Pagaria–Vecchi’s type B real-rootedness conjecture

## Theorem

Let $`B_n(t)`$ be the Poincaré polynomial of the type B wonderful compactification with minimal building set defined by Ferroni, Pagaria and Vecchi. For every $`n\ge 1`$, $`B_n(t)`$ has $`n-1`$ distinct negative roots. The roots for consecutive ranks strictly interlace.

This proves [Conjecture 4.13 of the original paper](https://arxiv.org/html/2603.01956v3#S4.SS4). The authors give $`\deg B_n=n-1`$ and report computations through rank 300. The argument below uses their generating-function identity, not the finite checks. The root-crossing framework follows the type A method of [Bérczi and Kiem](https://arxiv.org/html/2605.29151v2). The new point is a pole-cancelling differential identity and its zero count in type B.

## 1. The real deformation

Fix $`q>0`$ and put $`e=2/(1+q)`$, $`K=(1+q)^2/2`$. Set
```math
x=X_q(y):=\frac{q y^{-e}-q^{-1}y^{2-e}}{1+q},\qquad y>0.
```
Its derivative is $`-K^{-1}(y^2+q)y^{-1-e}`$. It is a decreasing analytic bijection from the positive real line onto the real line. Write $`y=Y_q(x)`$ for its inverse and define
```math
H(x)=\frac1{Y_q(x)+q},\qquad H_n(x)=\frac{d^nH}{dx^n}(x).
```
Thus differentiation in $`x`$, written in the $`y`$ coordinate, is
```math
-K\frac{y^{1+e}}{y^2+q}\frac d{dy}.
```

Let $`B(z,t)=\sum_{n\ge0}B_n(t)z^n/(2^n n!)`$ be the source's normalized series. The first identity of Theorem 4.15 there is
```math
B\left(s-\frac{(1+s)^t-1-ts}{t(t-1)},t\right)
 =\frac{t-1}{t-(1+s)^{(t-1)/2}}.
```
At $`t=-q`$ set $`y=(1+s)^{-1/e}`$. The argument of $`B`$ on the left is $`X_q(y)-X_q(1)`$: indeed its numerator with denominator $`q(q+1)`$ is $`q^2s-(1+s)^{-q}+1`$. The right side is $`(1+q)/(y+q)`$. Consequently the germs at $`z=0`$ satisfy
```math
B(z,-q)=(1+q)H(X_q(1)+z),\qquad
 B_n(-q)=2^n(1+q)H_n(X_q(1)).
```

For $`n\ge1`$, direct differentiation gives polynomials $`P_n=P_n(y;q)`$ such that
```math
H_n(X_q(y))=K^n\frac{y^{1+ne}P_n(y;q)}
{(y^2+q)^{2n-1}(y+q)^{n+1}},
\qquad P_1=1.
```
In particular, writing $`D=(y^2+q)(y+q)`$, their recurrence is
```math
P_{n+1}
=\left[2(2n-1)y^2(y+q)+(n+1)y(y^2+q)-(1+ne)D\right]P_n-yD P_n'.
\tag{1}
```
The degree is exactly $`3(n-1)`$: at step $`n`$ the coefficient at that degree contributes to the new leading coefficient with multiplier $`n(2-e)+1>0`$. The constant coefficient is nonzero too, from its multiplier $`-q^2(1+ne)`$. The slice identity becomes
```math
B_n(-q)=\frac{P_n(1;q)}{(1+q)^{n-1}}. \tag{2}
```

## 2. Cancel the extra pole before counting zeros

The key is not to count the coefficient changes of $`P_n`$ directly. Define $`G=H+xH'`$. Direct substitution of $`X_q(y)`$ and $`d/dx`$ cancels the factor $`y+q`$:
```math
G(X_q(y))=\frac{1+\eta y}{y^2+q},\qquad \eta=\frac{q-1}{2q}. \tag{3}
```
For clarity, $`xH'=(1+q)y(q-y)/(2q(y^2+q)(y+q))`$, which gives (3) after adding $`1/(y+q)`$.

Write $`G_n=d^nG/dx^n`$. A second differentiation recurrence has just two diagonals:
```math
\begin{split}
G_n(X_q(y))&=K^n\frac{y^{1+ne}Q_n(y;q)}{(y^2+q)^{2n+1}},
\\ Q_1(y;q)&=\eta(y^2-q)+2y,
\\ Q_{n+1}&=\bigl[(4n+2)y^2-(1+ne)(y^2+q)\bigr]Q_n-y(y^2+q)Q_n'.
\end{split} \tag{4}
```
The coefficient at degree $`j`$ sends a negative multiple to degree $`j`$ and a positive multiple to degree $`j+2`$: the multipliers are $`-q(1+ne+j)`$ and $`4n+1-ne-j`$. The latter is positive since $`j\le 2n`$ and $`e<2`$.

For $`q\ne1`$, the signs in increasing degree are therefore
```math
\begin{aligned}
\mathop{\mathrm{sgn}}[y^{2k}]Q_n &=
  \mathop{\mathrm{sgn}}(-\eta)(-1)^{n-1-k}, &&0\le k\le n,
\\ \mathop{\mathrm{sgn}}[y^{2k+1}]Q_n&=(-1)^{n-1-k},&&0\le k\le n-1 .
\end{aligned}
```
To see the induction, (4) gives the asserted signs for $`n=1`$. The same-degree contribution flips the old sign. The contribution from two degrees below keeps the old sign at that lower degree; this is the same new sign, so the contributions do not cancel. At each end the single contributing coefficient is also nonzero. If $`q<1`$, a change occurs between each odd term and the next even term; if $`q>1`$, it occurs between each even term and the next odd term. In either case there are exactly $`n`$ changes. For $`q=1`$ the even terms vanish and the $`n`$ odd terms alternate, giving $`n-1`$ changes. Descartes' rule and the analytic bijection $`X_q`$ now show:
```math
\#\{\text{real zeros of }G_n\}\le
\begin{cases}n,&q\ne1,\\ n-1,&q=1,\end{cases}
\tag{5}
```
counting multiplicities.

## 3. Recover the exact zero count for the original deformation

Differentiating $`G=H+xH'`$ $`n`$ times gives
```math
G_n=(n+1)H_n+xH_n',
\qquad
\bigl(x^{n+1}H_n\bigr)'=x^n G_n. \tag{6}
```
Let $`W=x^{n+1}H_n`$. On either open half-line every zero of $`H_n`$ is a zero of $`W`$ of the same multiplicity, and the same holds for the zeros of $`G_n`$ and $`W'`$. At $`x=0`$, the zero multiplicities of $`H_n`$ and $`G_n`$ are identical, where a nonzero value has multiplicity zero. This follows from the first identity in (6): if the first nonzero Taylor term of $`H_n`$ has degree $`m`$, it is multiplied by $`n+1+m`$.

On each half-line, Rolle's theorem between consecutive zeros and the endpoint $`W(0)=0`$ shows that $`W'`$ has at least as many interior zeros as $`W`$ there, with multiplicity. More explicitly, $`k`$ distinct interior zeros give $`k`$ intermediate zeros when the endpoint zero is included, and a zero of multiplicity $`a`$ supplies another $`a-1`$ derivative zeros there. If $`W`$ tends to zero at that half-line's infinite end, there is one more derivative zero in the exterior interval. For this last assertion choose a nonzero value in the exterior interval and truncate far enough along the end that the magnitude there is smaller. The absolute value has a positive interior maximum. This argument works also when there are no interior zeros. None of the functions is identically zero on an interval, by (1) and analyticity.

Exactly the needed extra vanishing holds at a tail when $`q\ne1`$. From (1) and the definition of $`X_q`$:
- As $`y\to\infty`$ (the negative tail), $`H_n(X_q(y))=O(y^{ne-2n-1})`$ and $`|X_q(y)|^{n+1}=O(y^{(2-e)(n+1)})`$. Their product is $`O(y^{1-e})`$, tending to zero if $`q<1`$.
- As $`y\to0^+`$ (the positive tail), $`H_n(X_q(y))=O(y^{1+ne})`$ and $`|X_q(y)|^{n+1}=O(y^{-e(n+1)})`$. Their product is $`O(y^{1-e})`$, tending to zero if $`q>1`$.

Thus (6) saves one from the upper bound $`n`$ in (5) when $`q\ne1`$. At $`q=1`$ the bound $`n-1`$ in (5) already suffices. In all cases $`H_n`$ has at most $`n-1`$ real zeros with multiplicity.

For the matching lower bound, the same two estimates for $`H_n`$ alone show it tends to zero at both ends for every $`q>0`$. The function $`H_1`$ is strictly positive. Given $`k`$ distinct real zeros of $`H_n`$, Rolle gives a derivative zero in each finite intervening interval and the exterior argument gives one at each end. When $`k=0`$, there is an extremum since both ends tend to zero and the function is nonzero. Induction gives at least $`n-1`$ distinct real zeros of $`H_n`$. They are therefore all simple, and the zeros of adjacent derivatives strictly interlace, with an additional outer zero at each end for the derivative. Equivalently, for every $`q>0`$ the polynomial $`P_n(\cdot;q)`$ has exactly $`n-1`$ simple positive roots, interlaced by the $`n`$ positive roots of $`P_{n+1}(\cdot;q)`$.

## 4. Cross the slice

Order these positive roots as $`r_{n,1}(q)<\dots<r_{n,n-1}(q)`$. They are continuous on $`(0,\infty)`$ by simplicity and the implicit function theorem.

At $`q=0`$ the coefficients in (1) extend continuously, since $`e\to2`$. The limit of $`P_n`$ is $`y^{3(n-1)}`$. Indeed only the cubic shift remains at each step and on the limiting leading term its multiplier is 1. The leading coefficient stays bounded away from zero near zero, so a Cauchy root bound bounds the roots uniformly there. Every subsequential limit of a positive root must be a root of the limiting monomial, so every branch tends to zero.

At $`q\to\infty`$, the polynomials $`q^{-2(n-1)}P_n(y;q)`$ tend coefficientwise to the nonzero constant $`(-1)^{n-1}`$. In fact the step operator in (1) divided by $`q^2`$ tends coefficientwise to $`F\mapsto-F-yF'`$, since $`e\to0`$ and $`D/q^2\to1`$. This proves the assertion by induction. Convergence is uniform on each bounded interval, so every positive branch escapes to infinity.

Each branch thus crosses $`y=1`$. Different branches cannot cross at the same $`q`$, because the positive roots at that parameter are distinct. By (2) and the degree $`n-1`$, the crossing parameters give all the roots of $`B_n(-q)`$ and each is simple. In particular, each branch crosses exactly once. At each parameter the interlacing in Section 3 gives
```math
r_{n+1,i}(q)\lt r_{n,i}(q)\lt r_{n+1,i+1}(q)\qquad(1\le i\le n-1).
```
At the unique crossing of the middle branch, the lower branch has not crossed and the upper branch already has, by continuity and its unique crossing. The parameter crossings therefore strictly interlace, as do the roots after changing from $`q`$ to $`-q`$. The case $`n=1`$ has no roots and poses no exception. This proves the theorem.
