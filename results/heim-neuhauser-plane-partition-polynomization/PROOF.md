# Proof of Heim–Neuhauser’s plane-partition polynomization conjecture

Let $P_0(x)=1$ and, for $n\ge1$, define the plane-partition polynomials by
```math
nP_n(x)=x\sum_{k=1}^n\sigma_2(k)P_{n-k}(x).
```
We prove the two exact assertions of [Conjecture 1](https://doi.org/10.1007/s11139-026-01435-0):
```math
 P_n(x)^{n+1}>P_{n+1}(x)^n
\quad\text{if }(n\ge 1,\ x>5)\text{ or }(n\ge6,\ x\ge1).
```

Set $B_n(t)=n!P_n(e+t)$ with $e=5$ or $e=1$. The recurrence computes these as integer polynomials. [The exact finite checker](../heim-neuhauser-troeger-plane-partition-turan/heim-neuhauser-plane-partition-check.py) verifies that the coefficients of
```math
 (n+1)^n B_n(t)^{n+1}-n! B_{n+1}(t)^n
```
are nonnegative, with a strictly positive leading coefficient for $1\le n\le5, e=5$ and a strictly positive constant term for $6\le n\le11, e=1$. The scaling factor from the desired difference is positive. Thus these ranges have strict inequality, including the endpoint exactly when asserted.

For fixed $x\ge1$ let $R_m=P_m(x)^{1/m}$ and $Q_m=P_m(x)/P_{m-1}(x)$. The polynomials have positive values in this range. For $m\ge2$, $R_{m-1}>R_m$ is equivalent to $R_m>Q_m$, by rearranging $Q_m=R_m^m/R_{m-1}^{m-1}$. The [separate strict Turán theorem](../heim-neuhauser-troeger-plane-partition-turan/PROOF.md) gives $Q_m>Q_{m+1}$ for $m\ge12$. By the checked $R_{11}>R_{12}$, we have $R_{12}>Q_{12}>Q_{13}$. In general $R_m>Q_{m+1}$ implies $R_m>R_{m+1}>Q_{m+1}$, since $R_{m+1}^{m+1}=R_m^m Q_{m+1}$. Induction proves strict decrease for all $m\ge12$. This covers both required half-lines after the finite ranges above.

The [companion proof](../heim-neuhauser-troeger-plane-partition-turan/PROOF.md) gives the exact rational bounds needed for the Turán input. Neither a sampled polynomial sign nor a floating approximation is used.
