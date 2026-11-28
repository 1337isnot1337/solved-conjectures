# Mao–Wang's conjecture

## Root checkpoint: the symmetric-input approach fails

Status: the Eulerian-square clause is still open in this investigation.
The completed Delannoy argument in this directory does not resolve both
clauses of the conjecture.

The exact primary source is Mao and Wang, *The Narayana transformation*,
[arXiv:2607.01572v1](https://arxiv.org/html/2607.01572v1), Conjecture 4.1.
Write

```math
P_0(x)=1,\qquad P_n(x)=x\sum_{\pi\in S_n}x^{\mathop{\mathrm{des}}(\pi)}
\quad(n\geq1),
```

and define the linear operator $`T(x^j)=P_j(x)`$. The row polynomial
of the ordinary Eulerian matrix square is $`T(P_n)`$.

[Athanasiadis's Theorem 1.1](https://arxiv.org/html/2302.00754v5)
proves real-rootedness on the cone generated, at a fixed degree $`n`$,
by $`x^{n-k}(1+x)^k`$. An Eulerian row need not belong to this cone.
For example, the unique expansion of $`P_3=x+4x^2+x^3`$ is

```math
P_3=x(1+x)^2+2x^2(1+x)-2x^3.
```

The negative coefficient prevents that direct application.

A possible replacement was to seek a theorem saying that $`T`$ preserves
real-rootedness for symmetric polynomials with nonnegative coefficients.
The following analytic family rules out this replacement, even with the
same zero at the origin and reciprocal symmetry as the Eulerian rows.
This is a failed-route certificate, not a counterexample to Mao–Wang.

## A whole family obstructing the proposed preservation theorem

For every real $`s\geq2`$, let

```math
p_s(x)=x(x^2+sx+1)^3,\qquad q_s(x)=T(p_s)(x).
```

All roots of $`p_s`$ are real and nonpositive: besides zero, they are

```math
\frac{-s+\sqrt{s^2-4}}2,\qquad
\frac{-s-\sqrt{s^2-4}}2,
```

each with multiplicity three. Also $`x^8p_s(1/x)=p_s(x)`$.
Its gamma expansion is

```math
p_s=x\big((1+x)^2+(s-2)x\big)^3,
```

so the gamma polynomial after removing the initial zero is
$`(1+(s-2)y)^3`$, itself real-rooted.

Nevertheless, $`q_s`$ has nonreal roots for every sufficiently large $`s`$.
Here is a proof of that assertion without numerical root calculations.

The Eulerian recurrence is

```math
P_{n+1}=x(1-x)P_n'+(n+1)xP_n.
```

Using this recurrence through $`P_7`$ and the definition of $`T`$ gives

```math
\begin{aligned}
q_s(x)={}&x^7+(3s+120)x^6
 +(3s^2+171s+1194)x^5
\\ &+(s^3+78s^2+912s+2494)x^4
\\ &+(11s^3+201s^2+972s+1392)x^3
\\ &+(11s^3+90s^2+240s+210)x^2
\\ &+(s^3+6s^2+12s+8)x.
\end{aligned}
```

Set $`s=r^3`$ and $`x=-r^3+r^2u`$. Direct expansion yields

```math
r^{-18}q_{r^3}(-r^3+r^2u)\longrightarrow u^3+16
\qquad(r\longrightarrow\infty),
```

locally uniformly in the complex variable $`u`$. This is an exact
polynomial-coefficient limit: after the substitution the largest power
of $`r`$ is 18 and its coefficient is $`u^3+16`$.

The polynomial $`u^3+16`$ has two simple nonreal roots. Choose disjoint
closed disks around those roots, disjoint from the real line and containing
no other root. On each boundary the limiting polynomial has a positive
minimum modulus. Local uniform convergence and Rouché's theorem therefore
give one root of the scaled polynomial in each disk for all sufficiently
large $`r`$. The corresponding roots
$`x=-r^3+r^2u`$ are nonreal. This proves the claimed whole-family obstruction.

Thus neither reciprocal symmetry, real-rootedness, nor a real-rooted
gamma polynomial is enough for the desired transform-preservation step.
Any proof of the Eulerian-square clause must use more specific structure
of the Eulerian input.

## An exact two-variable recurrence

A second structural reduction records where that extra structure enters.
Let $`a(n,k)=[x^k]P_n(x)`$, let $`D=y\partial_y`$, and put

```math
Q_n(y,x)=\sum_{k=0}^{n}a(n,k)y^kP_k(x).
```

Then $`Q_0=1`$, $`T(P_n)(x)=Q_n(1,x)`$, and

```math
Q_{n+1}
 =D Q_n+xy(n+1-D)\big((1-x)\partial_x+D+1\big)Q_n.
```

Indeed, the Eulerian recurrence gives

```math
a(n+1,k)=k\,a(n,k)+(n+2-k)a(n,k-1).
```

The first term produces $`DQ_n`$. Reindexing the second term gives
$`y\sum_j(n+1-j)a(n,j)y^jP_{j+1}(x)`$.
Substituting the recurrence for $`P_{j+1}`$ gives the displayed operator
identity. The order of the operators is as written: $`D`$ acts on the
expression to its right, before the outside factor $`xy`$.

This recurrence contains a negative second derivative in $`y`$.
No stability-preservation theorem for its actual iterates has been proved.
The naive bivariate stability claim already fails at

```math
Q_2(y,x)=xy(1+y+xy):
\quad x=i,\quad y=(-1+i)/2
```

makes the final factor zero with both variables in the upper half-plane.

## Verification and continuation

The companion [root_eulerian_check.py](root_eulerian_check.py) independently
builds the Eulerian polynomials from their recurrence, checks the exact
displayed $`q_s`$, checks the full leading polynomial in the scaling limit,
and compares the two-variable recurrence with direct finite matrix rows.
These algebra checks do not establish the original conjecture.

The next useful step would require an invariant specific to $`P_n`$ that
survives the displayed operator. The broad symmetric/gamma-positive
preservation route is closed by the analytic family above. This checkpoint
claims no new resolution of an open conjecture and no novelty for the
Eulerian recurrence or the general failure of unrestricted preservation.
