# Sokal's little Domb conjecture: research checkpoint

Date: 2026-11-21. Issue: [#167](https://github.com/1337isnot1337/solved-conjectures/issues/167). Status: open; no solution claimed.

## Exact targets

Deb's [positivity catalog](https://bishaldeb.com/positivity/themes/SMSCHTP/hankel.html), Problems P1.4 and P1.5, attributes to Sokal the coefficientwise Hankel total positivity of the shifted sequences

```math
L_n(1+y),\quad L_n(x)=\sum_{k=0}^n\binom nk^2\binom{2k}k x^k,
```

and

```math
D_n(1+y),\quad D_n(x)=\sum_{k=0}^n\binom nk^2\binom{2k}k\binom{2n-2k}{n-k}x^k.
```

Every finite minor of the corresponding infinite Hankel matrix is required to have nonnegative coefficients in y. Strong q-log-convexity and numerical Stieltjes-moment properties are weaker statements and are not counted as solutions.

## Exact initial determinants

Writing the leading order-r determinant as det[P_(i+j)(x)] for 0<=i,j<r gives for little Domb:

```math
\Delta_2=2x(x+2),
\qquad
\Delta_3=4x^3(x^3+18x^2+6x+20),
```

```math
\Delta_4=8x^6(x^6+72x^5+204x^4+1732x^3-72x^2+840x+760).
```

The negative coefficient at order four shows that the unshifted sequence is not coefficientwise Hankel totally positive. This does **not** refute the source conjecture, whose shift x=1+y removes this particular negative coefficient.

For Domb:

```math
\Delta_2=2(x^2+4x+1),
```

```math
\Delta_3=4(x^6+36x^5+117x^4+304x^3+117x^2+36x+1),
```

```math
\begin{aligned}
\Delta_4=8(&x^{12}+144x^{11}+2412x^{10}+29792x^9+61227x^8
\\ &+236592x^7+360696x^6+236592x^5+61227x^4
\\ &+29792x^3+2412x^2+144x+1).
\end{aligned}
```

These exact symbolic calculations are diagnostics, not evidence of an all-order proof.

## Moment representations and the remaining gap

For independent random variables Z_j uniformly distributed on the unit circle,

```math
L_n(x)=\mathbb E\left|1+\sqrt{x}(Z_1+Z_2)\right|^{2n},
```

and

```math
D_n(x)=\mathbb E\left|\sqrt{x}(Z_1+Z_2)+(Z_3+Z_4)\right|^{2n}.
```

Indeed the rotational symmetry of each sum kills mixed powers with unequal holomorphic and antiholomorphic degrees, while $`\mathbb E|Z_1+Z_2|^{2k}=\sum_j\binom kj^2=\binom{2k}k`$. Expanding gives the displayed defining sums. Thus each fixed x>=0 produces a Stieltjes moment sequence. This numerical moment representation does not prove coefficientwise positivity after a shift.

A proposed general closure argument through the transform

```math
(a,b)\mapsto\left(\sum_k\binom nk^2a_kb_{n-k}\right)_{n\geq0}
```

cannot establish unshifted coefficientwise Hankel positivity: the little-Domb example, with a_k=binom(2k,k)x^k and b_k=1, already disproves such unrestricted preservation. Neither averaging positive numerical moment matrices nor averaging their determinants proves the required polynomial coefficient statement.

## Source screen

- The current Deb catalog marks both shifted statements open.
- Sokal's [2018 slides](https://www.mat.univie.ac.at/~slc/wpapers/s80vortrag/sokal.pdf) and [2025 lecture](https://clisby.net/guttmann2025/talks/Alan_Sokal.pdf) retain Domb positivity among unresolved examples.
- Public-web searches and the five public solution archives used in the accompanying research campaign did not locate a full resolution. Searches returned log-convexity, q-log-convexity and arithmetic/divisibility results, which do not resolve all Hankel minors coefficientwise.

No theorem for the entire shifted sequences has been established here. This lane is paused while a separate complete stochastic-order proof is audited, and can be resumed from the precise gap above.
