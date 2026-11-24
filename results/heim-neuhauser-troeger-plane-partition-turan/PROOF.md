# The plane-partition polynomial conjectures of Heim, Neuhauser, and Tröger

This is a computer-assisted proof using two short exact-integer/rational certificate programs. It addresses the original quantified statements, not sampled values of the real parameter. The argument was internally reviewed; no exclusive historical priority is claimed.

Let $g(k)=\sigma_2(k)=\sum_{d\mid k}d^2$, $H(z)=\sum_{k\ge1}g(k)z^k/k$, and let $P_n(x)=[z^n]\exp(xH(z))$. We prove:

1. **Heim–Neuhauser–Tröger's plane-partition polynomial Turán conjecture:** $P_n(x)^2>P_{n-1}(x)P_{n+1}(x)$ for every integer $n\ge12$ and real $x\ge1$. This is exactly [Conjecture 2 of *Inequalities for Plane Partitions*](https://doi.org/10.1007/s00026-022-00604-4).
2. **Heim–Neuhauser's plane-partition polynomization conjecture:** $P_n(x)^{n+1}>P_{n+1}(x)^n$ for every integer $n\ge1$ and real $x>5$, and also for every $n\ge6$ and $x\ge1$. This is exactly [Conjecture 1 of *Polynomization of Sun's conjecture*](https://doi.org/10.1007/s11139-026-01435-0).

The older [Ono–Pujahari–Rolen theorem](https://doi.org/10.1016/j.aim.2022.108692) covers the specialization $x=1$ of the first statement. HNT also reported their own finite-range computation. The 2026 paper treats the analogous $x=1$ root statement in its Theorem 1.3 and retains the all-real-parameter statement as a conjecture. Exact-statement, title and citing-paper searches through November 2026 found no earlier proof of either unrestricted parameter statement; that search is bounded, not a guarantee of priority.

## 1. Coefficient tilt and the Fourier sign criterion

Fix an integer $n\ge251$ and real $x\ge1$. Choose the unique $r\in(0,1)$ such that $x\sum_k g(k)r^k=n$; existence and uniqueness follow from strict increase and $g(k)\ge k^2$. Put

```text
δ = 1−r,
V = x Σ k g(k) r^k,
K₃ = x Σ k² g(k) r^k,
B = xr/δ².
```

All sums are over positive $k$. A compound-Poisson random variable with jumps of size $k$ at intensities $\lambda_k=xg(k)r^k/k$ has mean $n$ and probabilities $p_j=e^{-xH(r)}r^jP_j(x)$. Its centered characteristic function is

```text
Φ(t) = exp(Σ λ_k(e^(ikt)−1−ikt)) = exp(−A(t)+iθ(t)).
```

In particular $V\ge n$, and

```text
A(t)=Σ λ_k(1−cos kt) ≤ Vt²/2,
|θ(t)|≤K₃|t|³/6.
```

By Fourier inversion and symmetry, the sign of $p_n-(p_{n-1}+p_{n+1})/2$ is the sign of

```text
J = ∫_0^π Re Φ(t) (1−cos t) dt.
```

Proving $J>0$ suffices: the arithmetic mean is at least the geometric mean, and the exponential tilt cancels in the adjacent Turán comparison.

## 2. A positive central interval and explicit negative-tail bounds

Normalize the integral by multiplying it by $V^{3/2}$, and write $u=t\sqrt V$, so its integrand in $u$ is $V(1-\cos t)e^{-A(t)}\cos\theta(t)$. Write $\gamma^2=K_3^2/V^3$. Section 3 proves $\gamma^2\le1/9$. Hence $\cos\theta\ge0$ on $0\le u\le3$ because $\lvert\theta\rvert\le u^3/18\le3/2<\pi/2$. For $0\le u\le2$, the squared phase bound gives $\cos\theta\ge73/81$. Also

```text
V(1−cos t) ≥ (u²/2)(1−u²/(12V)) ≥ (u²/2)(1−1/(3·251)).
```

On this interval $e^{-A(t)}\ge e^{-u^2/2}$. Thus the normalized contribution from $0\le u\le3$ exceeds $2/5$: the program checks the following rational lower bound, obtained by integrating the odd degree-11 Taylor lower polynomial for $e^{-u^2/2}$:

```text
(73/81)(1−1/(3·251)) Σ_(j=0)^11 [(-1)^j·4·2^j/(j!·(2j+3))] > 2/5.
```

We now bound the absolute negative contribution from $u>3$. Since $g(k)/k\ge k$, sum the geometric-series derivative to obtain, for $t\in[0,\pi]$,

```text
A(t) ≥ A₀(t) := x Σ k r^k (1−cos kt)
     = B s(2+a+s)/(1+s)²,
s = 2r(1−cos t)/δ²,    a = (1+r²)/(2r).
```

For example, $\operatorname{Re}(re^{it}/(1-re^{it})^2)=r[(1+r^2)\cos t-2r]/|1-re^{it}|^4$ gives the identity directly. Define $V_0=x\sum k^3r^k=xr(1+4r+r^2)/\delta^4$, $M(r)=V_0/V$, and $\nu=2+a$. For $t\ne0$,

```text
A₀(t) = M(r) ((1−cos t)/t²) u² (1+s/ν)/(1+s)².
```

The $u>3$ region is bounded by the sum of the following three nonnegative quantities. They may overlap, which only enlarges the upper bound.

- **$3\le u\le20$.** On a bin $[\ell,v]$, take a lower bound $M\le M(r)$, an upper bound $S\ge r/(\delta^2V)$, and an upper bound $\nu_*\ge\nu$. Then $s\le S v^2$, $(1-\cos t)/t^2\ge1/2-v^2/(24\cdot251)$, and $(1+s/\nu)/(1+s)^2$ decreases in $s\ge0$ and in $\nu\ge3$. Hence
  $$
  A_0(t)\ge w:=M(1/2-v^2/(24\cdot251))\ell^2\frac{1+S v^2/\nu_*}{(1+S v^2)^2}.
  $$
  With $\nu_*=\infty$, interpret the numerator factor as 1. Since $V(1-\cos t)\le u^2/2$, the bin contributes at most $(v^3-\ell^3)e^{-w}/6$. The bins have width $1/20$.
- **$u>20,\ t\le\delta$.** Here $s\le r\le1$, $(1-\cos t)/t^2\ge11/24$ and $M(r)\ge1/\zeta(2)>3/5$; thus $A_0\ge u^2/16$. Integrate $u^2e^{-u^2/16}/2$ using $u^2/16\ge25+(5/2)(u-20)$; the resulting upper bound is less than $10^{-6}$.
- **$u>20,\ t\ge\delta$.** We can bound the entire interval $\delta\le t\le\pi$. The inequality $s\ge(11/12)r$ and the monotonicity of $f_*(s,a)=\min(1,s(2+a+s)/(1+s)^2)$ in both arguments show $A\ge B f_*((11/12)r,a)$. Indeed before clipping the derivative in $s$ is $(a+2-as)/(1+s)^3>0$ for $s\le1/a$, and the expression is at least 1 thereafter. The single $k=1$ term also gives $A\ge (11/24)B\delta^4$. Any positive lower bound $c$ on the better of these two multipliers yields the normalized upper bound $\pi V^{3/2}e^{-cB}$, since $\int_\delta^\pi(1-\cos t)dt=\pi-\delta+\sin\delta\le\pi$.

## 3. Exact covering of the saddle parameters

The accompanying [Fourier certificate](heim-neuhauser-fourier-certificate.py) checks rational inequalities only. Here are all its parameter bounds.

### 3.1. $0<r\le9/10$

Take rational boxes $a_0\le r\le b_0$, $a_0=i/1000$, $b_0=(i+1)/1000$, $0\le i<900$. This $a_0$ is unrelated to the $a=(1+r^2)/(2r)$ in Section 2. Let

```text
D_j(r) = Σ_(k≥1) k^j g(k) r^(k−1),  j=0,1,2.
```

Each $D_j$ is increasing. The code calculates the exact rational partial sums through $k=250$, with a positive upper tail obtained using $g(k)\le\zeta(2)k^2<(5/3)k^2$. Explicitly, at $b_0$ for $d=j+2$, the tail is at most

```text
(5/3) b₀^250 Σ_(h=0)^d [ binom(d,h) 250^(d−h) h! /(1−b₀)^(h+1) ].
```

This follows by substituting $k=250+i$ and bounding $i^h\le h!\binom{i+h-1}{h}$ for $i\ge1$. Rounded interval endpoints are outward at $10^{-8}$. Write $L_j\le D_j(a_0)$, $U_j\ge D_j(b_0)$ for these bounds. Define $h_0=\max(a_0,251/U_0)$. Because $xr=n/D_0(r)$ and $x\ge1$, $xr\ge h_0$. Then a valid upper bound for $\gamma^2$ is $U_2^2/(h_0 L_1^3)$.

For the middle-tail formula the code takes

```text
M = (1+4a₀+a₀²)/((1−a₀)^4 U₁),
S = b₀/(h₀(1−b₀)² L₁),
ν_* = 2+(1+a₀²)/(2a₀) if a₀>0, and infinity otherwise.
```

Indeed $V=(xr)D_1(r)$, $M(r)=(1+4r+r^2)/(\delta^4D_1(r))$, and $(1+r^2)/(2r)$ decreases up to $r=1$. For the outer tail take

```text
B₀ = h₀/(1−a₀)²,     W = (1−a₀)² U₁,
c = max((11/24)(1−b₀)^4,
        f_*((11/12)a₀,(1+b₀²)/(2b₀))).
```

Then $B\ge B_0$, $V\le W B$, and $c$ has the lower-bound property in Section 2. The checker verifies $c B_0\ge3/2$. Therefore $B^{3/2}e^{-cB}$ decreases over the remaining unbounded domain, and the outer bound is at most $\pi(W B_0)^{3/2}e^{-cB_0}$.

### 3.2. $9/10\le r<1$

Use $\zeta(2)<33/20$, e.g. from $\pi<22/7$. The exact power-sum identities give

```text
V₀ = (xr)(1+4r+r²)/δ^4,
K₃ ≤ (33/20)(xr)(1+11r+11r²+r³)/δ^5.
```

Since $V\ge V_0$, $xr\ge9/10$ and $\delta\le1/10$, we have

```text
γ² ≤ ((33/20)·24)²/(100·(9/10)·(541/100)³) ≤ 1/9.
```

Also $V\delta^2\ge4869/10$, so a valid middle bound uses $M=20/33$, $S=10/4869$, $\nu_*=31/10$. For the outer tail, $B\ge90$, $c\ge9/10$ by the clipped bound, and $V\le12 B^2$: use $V\le10 B/\delta^2$ and $\delta^{-2}\le B/r$, the latter from $x\ge1$. Hence the outer term is at most $\pi\cdot42 B^3 e^{-(9/10)B}$, bounded above at $B=90$.

### 3.3. The certificate output and its interpretation

For each exponent lower bound $w\ge0$, the code rounds down to a multiple $v$ of $1/20$, capped at 50, and uses

```text
e^(−w) ≤ 1/(Σ_(j=0)^45 v^j/j!),
```

rounded upward to $10^{-13}$. For square roots in the outer tail it uses $\lfloor\sqrt y\rfloor+1$ by integer square root. The use of $\pi$ in upper bounds is replaced by $22/7$. The 901 exact enclosures verify $\gamma^2\le1/9$ and that the sum of the three absolute tail upper bounds is less than $2/5$ in every box and in the last analytic regime. Rounded output for human readability gives worst box tail 0.110948, and final analytic regime tail 0.249101. The comparisons themselves use exact rationals.

These inequalities cover every $r\in(0,1)$ and every $n\ge251,x\ge1$, not a sample of $n,x$ or $r$. Comparing the strict positive central lower bound with these tails proves $J>0$.

## 4. Exact small-index signs and root-ratio propagation

The accompanying [polynomial certificate](heim-neuhauser-plane-partition-check.py) uses the generating-function recurrence

```text
P₀(x)=1,  n P_n(x)=x Σ_(k=1)^n g(k)P_(n−k)(x).
```

For a fixed endpoint $e$, it constructs $B_n(t):=n!P_n(e+t)$ by the equivalent integer polynomial recurrence. At $e=1$, for each $12\le n\le250$, the coefficients of $(n+1)B_n^2-nB_{n-1}B_{n+1}$ are nonnegative, with strictly positive constant term. This is exactly the Turán difference up to a positive scale, proving the remaining range. For roots we check the coefficients of

```text
(n+1)^n B_n^(n+1) − n! B_(n+1)^n.
```

They are nonnegative with positive constant term for $e=1$, $6\le n\le11$; they are nonnegative with positive leading coefficient for $e=5$, $1\le n\le5$. These give the proper closed or open endpoint. The recurrence, scaling and coefficientwise certificates do not depend on approximate roots.

Finally put $R_n=P_n(x)^{1/n}$ and $Q_n=P_n(x)/P_{n-1}(x)$ at fixed $x\ge1$. For $n\ge2$, $R_{n-1}>R_n$ is equivalent to $R_n>Q_n$. Since our Turán theorem implies $Q_n>Q_{n+1}$ for $n\ge12$, the strict root decrease at $n=11$ propagates to every later $n$. This is also the elementary propagation principle noted in [Heim–Neuhauser, Proposition 2.1](https://doi.org/10.1007/s11139-026-01435-0). Combined with the small-index signs, it proves both parts of their conjecture.

## Reproduction

Run the two programs with standard Python 3 (not with `-O`, which disables assertions):

```sh
python heim-neuhauser-fourier-certificate.py
python heim-neuhauser-plane-partition-check.py
```

They use the standard library only. Any decimal values printed are for convenience and do not participate in validation.

## Separate wording caveat in the older paper

This is not counted as an additional new conjecture resolution. The older paper's Conjecture 3 allows $b=0$ and asserts $P_{a-1}(x)P_{b+1}(x)>P_a(x)P_b(x)$ for every $x\ge2$, subject to two explicitly excluded pairs with positive $b$. As printed it already fails at $(a,b)=(2,0)$ on $2\le x\le5$, since $P_1^2-P_2=x(x-5)/2$. At $(3,0,2)$ the difference is $14-18=-4$, contradicting the separate Corollary 7.1 as printed. The source's *own* [Table 8 in the deposited PDF](https://d-nb.info/1274299136/34) already shows positive roots exceeding 2 for $(a,0)$ with $2\le a\le11$; the issue is the conflict between its printed prose and its table, not a priority claim.

A corrected universal statement does follow from our Turán theorem: keep the original conditions, but remove the ten pairs $(a,0)$ for $2\le a\le11$. The polynomial checker verifies exactly all required comparisons for $2\le a\le12$, $0\le b<a-1$, at endpoint $x=2$ by nonnegative coefficients of
```text
a B_(a−1) B_(b+1) − (b+1) B_a B_b,
```
except for the two original exclusions and the ten removed pairs (the latter all fail at $x=2$). For $a\ge13$, the comparisons are $Q_{b+1}>Q_a$. If $b+1\ge12$, use the strictly decreasing tail from $Q_{12}$. If $b+1\le11$ and $b\ge1$, use the certified $a=12$ boundary and $Q_{12}>Q_a$. For $b=0$ use the same certified $a=12$ boundary. This gives every pair in the corrected range; it does not claim that the ten removed pairs fail at all larger $x$.
