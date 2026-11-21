# López Pouso–Segura's Bessel-weight conjectures

Research draft, 2026-11-21. Proposed complete proofs of Conjectures 2, 5,
and 8 in Ó. López Pouso and J. Segura, *Uniform relations between the
Gauss–Legendre nodes and weights*, Journal of Inequalities and Applications
2025, 40, DOI [10.1186/s13660-025-03283-w](https://doi.org/10.1186/s13660-025-03283-w).
The three assertions are treated together, using one common argument.
No conclusion about the remaining uniform Gauss–Legendre conjectures is
asserted here.

## 1. Statements and notation

Let $`j_k`$ be the kth positive zero of $`J_0`$, and write

```math
\lambda_k=j_k^2,\qquad a_k=J_1(j_k)^{-2},\qquad
S_m=\sum_{k=1}^m a_k,\qquad T_m=\sum_{k=1}^m\lambda_k a_k.
```

The source sequences, with exactly its indexing, are

```math
C_i=2S_i+a_{i+1}-\frac{\lambda_{i+1}}2\quad(i\ge0),
\qquad E_i=2S_i-\frac{\lambda_i+\lambda_{i+1}}4\quad(i\ge1),
```

and

```math
K_i=S_i-\frac{T_i}{2S_i}\quad(i\ge1),\qquad S_0=0.
```

We prove that $`C_i`$ is positive and strictly increasing to $`\pi^2/12`$;
$`E_i`$ is negative and strictly decreasing to $`-\pi^2/6`$; and $`K_i`$ is
positive and strictly increasing to $`\pi^2/12`$.

## 2. A convexity property of the inverse Bessel phase

Put

```math
M(x)^2=J_0(x)^2+Y_0(x)^2,\qquad H(y)=yM(\sqrt y)^2\quad(y>0).
```

Nicholson's integral, specialized to order zero and followed by the
substitution $`v=2\sqrt y\sinh u`$, gives

```math
H(y)=\frac{4y}{\pi^2}\int_0^\infty
              \frac{K_0(v)}{\sqrt{y+v^2/4}}\,dv.                 \tag{1}
```

Here $`K_0(v)>0`$ for $`v>0`$, and all its nonnegative integer moments are
finite. The elementary beta identity

```math
\frac1{\sqrt{AB}}=
\frac1\pi\int_0^1\frac{du}{\sqrt{u(1-u)}[uA+(1-u)B]}
\qquad(A,B>0)                                             \tag{2}
```

therefore expresses $`H(y)^2`$ as a positive mixture of the functions
$`y^2/(y+q)`$, where $`q>0`$:

```math
H(y)^2=\int_{(0,\infty)}\frac{y^2}{y+q}\,d\sigma(q).          \tag{3}
```

Explicitly, $`\sigma`$ is the pushforward under
$`q=(uv^2+(1-u)w^2)/4`$ of the measure

```math
\frac{16}{\pi^5}
\frac{K_0(v)K_0(w)}{\sqrt{u(1-u)}}\,du\,dv\,dw
\quad (0\lt u<1,\ v,w>0).
```

It is a finite nonzero positive measure supported on $`(0,\infty)`$.
On compact subintervals of $`y>0`$, differentiation under the integral
is justified by the finite mass and elementary bounds on the rational
integrand. Consequently

```math
(H^2)''(y)=\int_{(0,\infty)}\frac{2q^2}{(y+q)^3}\,d\sigma(q)>0.
                                                               \tag{4}
```

Choose the continuous phase $`\theta(x)=\arg(J_0(x)+iY_0(x))`$ with
$`\theta(0+)=-\pi/2`$. The Bessel Wronskian gives

```math
\theta'(x)=\frac{2}{\pi xM(x)^2}>0.
```

Thus $`t=(\theta(x)+\pi/2)/\pi`$ increases from zero to infinity. Let
$`x=x(t)`$ be its inverse and set $`\lambda(t)=x(t)^2`$. Consecutive zeros
of $`J_0`$ give

```math
\lambda(k)=\lambda_k,\qquad
\lambda'(t)=\pi^2 H(\lambda(t)).                              \tag{5}
```

At $`x=j_k`$, the same Wronskian and $`J_0'=-J_1`$ yield
$`Y_0(j_k)=2/[\pi j_kJ_1(j_k)]`$, hence

```math
\lambda'(k)=4a_k.                                          \tag{6}
```

Differentiating (5) twice and applying (4) proves

```math
\lambda'''(t)
 =\pi^6H\bigl((H')^2+HH''\bigr)(\lambda(t))
 =\frac{\pi^6}{2}H(\lambda(t))(H^2)''(\lambda(t))>0.          \tag{7}
```

Finally, the small-argument expansions $`J_0(x)=1+O(x^2)`$ and
$`Y_0(x)=(2/\pi)\log x+O(1)`$ imply $`H(y)=O(y\log^2 y)`$.
It follows from (5) that $`\lambda(0+)=\lambda'(0+)=0`$.
Therefore $`g(t)=\lambda'(t)`$ extends continuously to $`g(0)=0`$ and is
strictly convex on $`[0,\infty)`$. Endpoint convexity follows by taking
limits from positive arguments; no differentiated small-argument
remainder is needed.

## 3. Positivity and monotonicity

By (6), $`C_i`$ is half a composite trapezoidal error for $`g`$:

```math
2C_i=
\sum_{k=1}^{i}g(k)+\frac{g(i+1)}2-
\int_0^{i+1}g(t)\,dt.                                     \tag{8}
```

Strict convexity makes every unit-interval trapezoidal error positive.
Equation (8) gives $`C_i>0`$, and adjoining one interval gives

```math
2(C_{i+1}-C_i)=
\frac{g(i+1)+g(i+2)}2-\int_{i+1}^{i+2}g(t)\,dt>0.           \tag{9}
```

For convenience put $`E_0=-\lambda_1/4<0`$. For every integer $`i\ge1`$,

```math
E_i-E_{i-1}
=\frac14\left(2g(i)-\int_{i-1}^{i+1}g(t)\,dt\right)<0,       \tag{10}
```

by the strict midpoint inequality for a convex function. Thus all $`E_i`$
are negative and the sequence is strictly decreasing.

## 4. A convergent Bessel resolvent sum

We next establish the exact identity

```math
\sum_{k=1}^\infty\frac{a_k}{(\lambda_k+s^2)^2}
=\frac{1-I_0(s)^{-2}}{4s^2}\qquad(s>0).                     \tag{11}
```

This is a classical Fourier–Bessel resolvent identity; a derivation is
included to fix normalization and avoid importing an unverified formula.
Use the complete orthogonal Dirichlet Fourier–Bessel system
$`\phi_k(r)=J_0(j_kr)`$ in $`L^2((0,1),r\,dr)`$, with

```math
\int_0^1r\phi_k(r)^2\,dr=\frac{J_1(j_k)^2}{2}.
```

Define

```math
F_s(r)=K_0(sr)-\frac{K_0(s)}{I_0(s)}I_0(sr),\qquad F_0(r)=-\log r.
```

Both belong to this Hilbert space and vanish at $`r=1`$.
For $`L=-(1/r)(r\,d/dr)'`$, the equations
$`L\phi_k=\lambda_k\phi_k`$, $`LF_s=-s^2F_s`$, and
$`\lim_{r\downarrow0}rF_s'(r)=-1`$ give, by integration by parts,

```math
\int_0^1rF_s(r)\phi_k(r)\,dr=\frac1{\lambda_k+s^2}.
```

The coefficient of $`\phi_k`$ in $`F_0-F_s`$ is therefore

```math
2a_k\left(\frac1{\lambda_k}-\frac1{\lambda_k+s^2}\right).
```

The standard large-zero estimates $`\lambda_k\asymp k^2`$ and
$`a_k\asymp k`$ show that these coefficients are $`O(k^{-3})`$.
Because $`|J_0(x)|\le1`$ for real $`x`$, the series converges uniformly on
$`[0,1]`$. Its Hilbert-space equality with the continuous function
$`F_0-F_s`$ is consequently a pointwise equality, including at zero.
Equivalently, DLMF 10.23.18–10.23.20 directly gives the interior
pointwise equality: $`F_0-F_s`$ is bounded at zero and smooth on $`(0,1)`$,
so it satisfies the required weighted integrability and local bounded
variation. Uniform convergence then extends this equality to zero.
Taking that limit gives

```math
\log(s/2)+\gamma+\frac{K_0(s)}{I_0(s)}
=2\sum_{k=1}^\infty a_k
       \left(\frac1{\lambda_k}-\frac1{\lambda_k+s^2}\right).  \tag{12}
```

Differentiate on compact subintervals of $`s>0`$. The modified Bessel
Wronskian says $`(K_0/I_0)'=-1/(sI_0^2)`$, while the series derivative
is $`4s\sum a_k/(\lambda_k+s^2)^2`$. This proves (11).

The elementary series lower bound $`I_0(s)\ge s^2/4`$ implies, without
needing an exponential asymptotic,

```math
\sum_{k=1}^\infty\frac{a_k}{(\lambda_k+s^2)^2}
=\frac1{4s^2}+O(s^{-6})\quad(s\to\infty).                  \tag{13}
```

## 5. The exact renormalized sum

Let $`\beta_k=\pi(k-1/4)`$. Standard Bessel and zero asymptotics give

```math
\lambda_k=\beta_k^2+\frac14+O(k^{-2}),\qquad
a_k=\frac\pi2\beta_k+O(k^{-3}).                            \tag{14}
```

For clarity, the cancellation responsible for the second remainder is
visible from

```math
j_k=\beta_k+\frac1{8\beta_k}+O(\beta_k^{-3}),\qquad
M(x)^2=\frac2{\pi x}\left(1-\frac1{8x^2}+O(x^{-4})\right),
```

and $`a_k=\pi^2j_k^2M(j_k)^2/4`$. Both leading reciprocal terms cancel.
The expansion of $`M^2`$ also follows directly from (1) and the finite
moments $`\int K_0(v)\,dv=\int v^2K_0(v)\,dv=\pi/2`$.

Set

```math
a_k^0=\frac{\pi^2}{2}(k-1/4),\qquad
\lambda_k^0=\pi^2(k-1/4)^2+\frac14,\qquad
\delta_k=a_k-a_k^0.
```

Then $`D=\sum_{k\ge1}\delta_k`$ is absolutely convergent. We claim

```math
D=\frac1{16}-\frac{\pi^2}{192}.                            \tag{15}
```

Write $`R(s)`$ for the sum in (11) and
$`R_0(s)=\sum a_k^0/(\lambda_k^0+s^2)^2`$. The numerator difference
satisfies

```math
s^4\sum_{k\ge1}\frac{\delta_k}{(\lambda_k+s^2)^2}\longrightarrow D
```

by dominated convergence. The remaining denominator difference tends
to zero after multiplication by $`s^4`$. Indeed, (14) and the mean-value
theorem bound its absolute value by

```math
Cs^4\sum_{k\ge1}\frac{k^{-1}}{(s^2+ck^2)^3}
=O((1+\log s)/s^2)=o(1),                                  \tag{16}
```

where the estimate follows on splitting at $`k=\lfloor s\rfloor`$.
Thus

```math
s^4(R(s)-R_0(s))\longrightarrow D.                         \tag{17}
```

To calculate $`R_0`$, put $`A=\sqrt{s^2+1/4}/\pi`$ and
$`h(u)=u/(1+u^2)^2`$. Then

```math
R_0(s)=\frac1{2\pi^2A^3}
          \sum_{m=0}^\infty h((m+3/4)/A).
```

The shifted Euler–Maclaurin formula applies since every derivative of
$`h`$ needed here is integrable at infinity. With
$`\int_0^\infty h=1/2`$, $`h(0)=h''(0)=0`$, $`h'(0)=1`$, it gives

```math
\sum_{m=0}^\infty h((m+3/4)/A)
=\frac A2-\frac{B_2(3/4)}{2A}+O(A^{-3}),
\qquad B_2(3/4)=-\frac1{48}.
```

The remainder is bounded by the usual bounded-periodic-Bernoulli
remainder after four integrations by parts; the fourth derivative of
$`h`$ is absolutely integrable. Hence

```math
R_0(s)=\frac1{4(s^2+1/4)}
       +\frac{\pi^2}{192(s^2+1/4)^2}+O(s^{-6})
=\frac1{4s^2}+\frac{-1/16+\pi^2/192}{s^4}+O(s^{-6}).        \tag{18}
```

Combining (13), (17), and (18) proves (15).

## 6. Limits of the two quadrature-error sequences

The identity

```math
C_{m-1}=2S_m-a_m-\lambda_m/2
```

and the explicit arithmetic sum

```math
\sum_{k=1}^m a_k^0=\frac{\pi^2m^2}{4}+\frac{\pi^2m}{8}
```

give, using (14)–(15),

```math
\lim_{m\to\infty}C_{m-1}
=2D+\frac{3\pi^2}{32}-\frac18=\frac{\pi^2}{12}.             \tag{19}
```

Also

```math
E_i-C_{i-1}=a_i-\frac{\lambda_{i+1}-\lambda_i}{4}
\longrightarrow-\frac{\pi^2}{4},                           \tag{20}
```

again by (14). Equations (19)–(20), together with Section 3, prove
Conjectures 2 and 5 in their entirety.

## 7. The first-moment sequence is a weighted average

Rearrange the definition of $`C_{j-1}`$ as

```math
\lambda_j=4S_{j-1}+2a_j-2C_{j-1}.
```

Multiplication by $`a_j`$ and summation use
$`\sum_j(4a_jS_{j-1}+2a_j^2)=2S_i^2`$ to give

```math
T_i=2S_i^2-2\sum_{j=1}^i a_j C_{j-1},\qquad
K_i=\frac{\sum_{j=1}^i a_j C_{j-1}}{S_i}.                  \tag{21}
```

Thus $`K_i`$ is a positive weighted average of the first $`i`$ terms of
the strictly increasing sequence $`C_i`$. Adding the larger next term
makes that average strictly larger. Since $`S_i\to\infty`$ by (14),
the standard finite-prefix/tail argument for weighted averages and
(19) give $`K_i\to\pi^2/12`$. This proves Conjecture 8 completely.

## 8. Additional consequence for the circle-theorem constants

The unnumbered sequence in source equation (10) is

```math
k_i=\lambda_{i+1}-\frac{4a_{i+1}^2}{\pi^2}.
```

Its asserted monotonicity also follows from (3). The integral moments
give $`\sigma((0,\infty))=4/\pi^2`$ and
$`\int q\,d\sigma(q)=1/\pi^2`$. Therefore

```math
y-\frac{\pi^2}{4}H(y)^2
=\frac{\pi^2}{4}\int\frac{yq}{y+q}\,d\sigma(q),             \tag{22}
```

which is positive, strictly increasing, and tends to $`1/4`$.
At $`y=\lambda_{i+1}`$ this is exactly $`k_i`$.
This consequence supplies a Bessel assertion used in the source's
discussion of its uniform circle conjecture. It does not by itself
establish that separate finite-degree Gauss–Legendre conjecture.

## Classical ingredients

All formula links below refer to the NIST Digital Library of Mathematical
Functions. The proof specializes them at order zero.

- [10.9.30](https://dlmf.nist.gov/10.9.E30): Nicholson's integral.
- [10.5.2](https://dlmf.nist.gov/10.5.E2) and
  [10.6.3](https://dlmf.nist.gov/10.6.E3): the ordinary Bessel
  Wronskian and $`J_0'=-J_1`$.
- [10.18.1–10.18.3](https://dlmf.nist.gov/10.18.i) and
  [10.18.8](https://dlmf.nist.gov/10.18.E8): phase normalization
  and derivative. Equation [10.18.18](https://dlmf.nist.gov/10.18.E18)
  also gives that the phase tends to infinity.
- [10.32.9](https://dlmf.nist.gov/10.32.E9): a positive integral
  for $`K_0`$. Equation [10.43.19](https://dlmf.nist.gov/10.43.E19)
  gives its Mellin moments; the instances used here are
  $`\int_0^\infty K_0(v)\,dv=\int_0^\infty v^2K_0(v)\,dv=\pi/2`$.
- [10.7.1–10.7.2](https://dlmf.nist.gov/10.7.i) give the ordinary
  small-argument behavior. Equation
  [10.31.2](https://dlmf.nist.gov/10.31.E2) gives
  $`K_0(z)=-\log(z/2)-\gamma+O(z^2|\log z|)`$, including the
  constant needed in (12).
- [10.23.18–10.23.20](https://dlmf.nist.gov/10.23.iii): the
  Fourier–Bessel expansion and its convergence hypotheses.
  Equation [10.9.1](https://dlmf.nist.gov/10.9.E1) yields
  $`|J_0(x)|\le1`$ for real $`x`$.
- [10.28.2](https://dlmf.nist.gov/10.28.E2): the modified Bessel
  Wronskian. Equation [10.25.2](https://dlmf.nist.gov/10.25.E2)
  gives the power series of $`I_0`$ and its lower bound in (13).
- [10.21.19](https://dlmf.nist.gov/10.21.E19): McMahon's zero
  expansion. Equation [10.18.17](https://dlmf.nist.gov/10.18.E17)
  is the modulus expansion used in (14), also derivable from (1).
- [2.10.1](https://dlmf.nist.gov/2.10.E1): Euler–Maclaurin with
  a periodic Bernoulli remainder. Applied to
  $`f(x)=h((x+3/4)/A)`$ and expanded at zero, it gives (18).
  The proof uses this only for $`h(u)=u/(1+u^2)^2`$.

All conclusions above are analytic statements for every index. Numerical
evaluations are optional diagnostics and are not premises of the proof.
