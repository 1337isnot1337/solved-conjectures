# Coulter–Do–Moskovsky's conjecture: scope and an exact initial reversal

The [general theorem](ASYMPTOTIC.md) proves every predicted limiting root
and its eventual strict direction of approach for every fixed profile.
Here we distinguish that result from the stronger assertion of monotonicity
beginning at genus zero. The stronger assertion is false. This note does
not label the natural asymptotic conjecture false, and adds no result to
the strict completed-conjecture tally.

## 1. The published wording and prior data

The primary source is Coulter, Do and Moskovsky,
[*Integration on complex Grassmannians, deformed monotone Hurwitz numbers,
and interlacing phenomena*](https://www.cambridge.org/core/journals/canadian-journal-of-mathematics/article/integration-on-complex-grassmannians-deformed-monotone-hurwitz-numbers-and-interlacing-phenomena/1D1EAFA4F78A147F6B88ECD63EEA9850),
Canadian Journal of Mathematics, 2025, Conjecture 3.15, published PDF
pages 23–24. It begins by taking genus to infinity, and then describes
increasing convergence from below for limits less than −1 and decreasing
convergence from above for nonzero limits greater than −1. It does not
explicitly quantify every genus starting at zero. Figure 3 illustrates
genera 10 through 20. These facts support an asymptotic reading, which is
proved in the accompanying manuscript.

Their earlier
[*Topological Narayana polynomials and interlacing conjectures*](https://www.matrix-inst.org.au/wp_Matrix2016/wp-content/uploads/2023/07/Coulter.pdf),
Section 4, page 5, already tabulates the two polynomials used below. Its
columns give the polynomial multiplied by the product of the profile
parts. For profile (2,2), those entries are

```math
4H_0(t)=4t^3+10t^2+4t,
\qquad
4H_1(t)=50t^3+128t^2+50t.
```

The earlier note poses real-rootedness and profile-increment interlacing
conjectures, but contains no genus-asymptotic conjecture. The initial
reversal below is an immediate consequence of this published data; no
novelty is claimed for the two polynomials.

## 2. An independent exact derivation

Fix the permutation (12)(34). For a nonzero integer c, put

```math
f_c(u,t)=\frac{1-(1-t)cu}{1-cu}.
```

The source's character formula, Proposition 3.3, gives

```math
\begin{aligned}
24W_{(2,2)}={}&f_1f_2f_3-3f_1f_2f_{-1}
 +4f_1f_{-1}\\
 &-3f_1f_{-1}f_{-2}+f_{-1}f_{-2}f_{-3}.
\end{aligned}
```

The five terms correspond respectively to partitions (4), (3,1), (2,2),
(2,1,1), and (1,1,1,1). Their dimension-times-character values at cycle
type (2,2) are 1, −3, 4, −3, 1.

There is one possible nontransitive orbit decomposition, separating the
two cycles. Since

```math
W_{(2)}(u,t)=\frac{tu}{1-u^2},
\qquad
C_{(2,2)}(u,t)=W_{(2,2)}(u,t)-W_{(2)}(u,t)^2,
```

rational simplification gives

```math
C_{(2,2)}(u,t)=
\frac{2tu^4\left[(2t^2+5t+2)
 -(5t^2+11t+5)u^2+3(t-1)^2u^4\right]}
 {(1-u^2)^2(1-4u^2)(1-9u^2)}.                 \tag{1}
```

The source's normalization is

```math
4H_g(t)=[u^{4+2g}]C_{(2,2)}(u,t).
```

The reciprocal denominator of (1) starts with 1+15u². Extracting the
coefficients of u⁴ and u⁶ therefore gives exactly

```math
H_0(t)=\frac{t}{2}(2t^2+5t+2)
      =\frac{t}{2}(t+2)(2t+1),
\qquad
H_1(t)=\frac{t}{2}(25t^2+64t+25).             \tag{2}
```

An independent direct enumeration of monotone transitive transposition
factorizations verifies the same normalization: at lengths 4 and 6, the
counts for hive numbers 1, 2, 3 are (4,10,4) and (50,128,50), respectively.
The [independent audit](AUDIT.md) records that check. No floating-point
root computation is needed.

## 3. The two root movements

The nonzero roots at genus zero are −2 and −1/2, which are also the
predicted limiting roots for total size four. At genus one they are

```math
\beta_- = \frac{-32-\sqrt{399}}{25},
\qquad
\beta_+ = \frac{-32+\sqrt{399}}{25}.
```

Since 399>18², the first is strictly less than −2. Since
399>(39/2)², the second is strictly greater than −1/2. Equivalently,
the quadratic 25t²+64t+25 takes the negative values −3 and −3/4 at
−2 and −1/2, respectively, so both points lie between its two roots.
Consequently

```math
\alpha_{1,1}<\alpha_{0,1}=-2,
\qquad
\alpha_{1,2}>\alpha_{0,2}=-\frac12.
```

Thus neither of the claimed directions holds on the genus-zero-to-one
step. The general asymptotic theorem proves that each root subsequently
has the predicted strict direction on a sufficiently large tail. It
also proves the limiting values for every fixed profile, without a
profile-size cutoff.
