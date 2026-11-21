# Erdős 243: the cancellation gap in reduced-tail descent

21 November 2026. This is an exact diagnosis of an attempted proof route, not a solution or a new prize claim. The rational-tail framework is due to [Koizumi](https://math.colgate.edu/~integers/aa28/aa28.pdf); related prime-support and cancellation restrictions are already in [Bado](https://www.researchgate.net/publication/413940355_Prime-Support_Rigidity_and_Primitive_Pseudo-Greedy_Dynamics_Partial_Progress_on_Erdos_Problem_243) and [Cook](https://wcook04.github.io/practical-formal-verification/maths/papers/erdos-243-reciprocal-tail-rigidity.html). No priority is claimed for the elementary identities below.

The [target audit](target-and-prior-audit.md) records the full paid statement and source boundaries.

## 1. The established tail reduction

Suppose the reciprocal sum is rational and the hypotheses of Erdős 243 hold. Write

```math
x_n=\sum_{j\ge n}\frac1{a_j}.
```

The quadratic growth gives

```math
x_n=\frac1{a_n}+\frac1{a_{n+1}}+O(a_{n+1}^{-2}),
\qquad x_n^{-1}+1-a_n\longrightarrow0.
```

After a finite prefix, therefore, $`a_n`$ is the nearest integer to $`x_n^{-1}+1`$. Ties can be assigned by $`\lfloor t+1/2\rfloor`$; eventually the error is strictly smaller than one half, so the tie convention has no effect on this target.

If $`x_1=P/Q`$, retain the unreduced coordinates

```math
D_n=Q\prod_{j\lt n}a_j,\qquad C_n=D_nx_n,
\qquad E_n=D_n-(a_n-1)C_n.
```

They are integers with $`C_n,D_n>0`$, and

```math
C_{n+1}=a_nC_n-D_n=C_n-E_n,
\qquad D_{n+1}=a_nD_n,
\qquad \frac{E_n}{C_n}\longrightarrow0.
```

Koizumi proves that the full conjecture is equivalent to eventual zero centered error for every rational pseudo-greedy orbit whose relative error tends to zero. A late zero is absorbing and gives the Sylvester recurrence. This is prior work, not a newly obtained reduction.

## 2. Exact update after reduction to lowest terms

Now write one tail in lowest terms as $`x=p/q`$, where $`p,q>0`$ and $`\gcd(p,q)=1`$. Let

```math
a=\left\lfloor\frac qp+\frac32\right\rfloor,
\qquad e=q-(a-1)p,
\qquad \varepsilon=e/p.
```

Then $`-p/2\le e\lt p/2`$, and the next unreduced numerator is

```math
t=ap-q=p-e>0.
```

Let $`h`$ be the factor cancelled from the fraction $`t/(aq)`$. It is exactly

```math
h=\gcd(t,aq)=\gcd(t,a^2).
```

Indeed, $`\gcd(t,p)=\gcd(q,p)=1`$ and $`aq=a^2p-at`$, so the two gcds agree. Consequently the next reduced tail is

```math
p^+=\frac{p-e}{h},\qquad q^+=\frac{aq}{h},
\qquad \frac{p^+}{p}=\frac{1-\varepsilon}{h}.
```

Also $`\gcd(p,p^+)=1`$, since $`p^+`$ divides $`t`$ and $`\gcd(p,t)=1`$.

The growth-limit hypothesis makes $`1-\varepsilon`$ tend to one. It does **not** make the ratio of reduced numerators tend to one: the integer factor $`h`$ must still be accounted for. Reusing the unreduced ratio limit after cancellation would be an invalid step.

## 3. Arbitrarily small gap with arbitrarily large cancellation

For every integer $`c\ge3`$, start with

```math
p=c,\qquad q=c^2-1.
```

These integers are coprime. Since $`q/p=c-1/c`$, the pseudo-greedy choice is

```math
a=c+1,\qquad e=-1,\qquad \varepsilon=-1/c,
\qquad t=c+1.
```

The cancellation factor is $`h=c+1`$. Hence

```math
p^+=1,\qquad q^+=c^2-1.
```

Thus the relative error tends to zero across this family while the cancellation factor tends to infinity and the reduced numerator falls from $`c`$ to one. In contrast, the unreduced numerator ratio is $`(c+1)/c`$, which tends to one.

Every member of this family has a genuine infinite continuation. After the first step, the tail is $`1/(c^2-1)`$, so its next denominator is $`c^2`$, followed by the exact Sylvester recurrence. All denominators increase strictly, their successive quadratic ratios tend to one, and the total reciprocal sum is $`c/(c^2-1)`$. These are examples satisfying the conjecture's conclusion. They only disprove a **local** inference that a small gap prevents substantial cancellation. They do not disprove eventual stabilization of cancellation in a hypothetical counterexample.

There is no local monotone-numerator rule in the other direction either. For the coprime state

```math
p=c,\qquad q=c^2+c-1,
```

one has $`a=c+2`$, the same $`e=-1`$, and

```math
h=\gcd(c+1,(c+2)^2)=1,
\qquad p^+=c+1.
```

This is a one-step state calculation. No asymptotic hypothesis is asserted for its later orbit. Long upward transients followed by absorption are already supplied by White's prior working report.

## 4. Sparse cancellation still leaves the global problem

Consider an orbit with $`\varepsilon_n\to0`$ and with no late zero gap. Then $`e_n`$ is a nonzero integer eventually, so

```math
\frac1{p_n}\le |\varepsilon_n|\longrightarrow0,
\qquad p_n\longrightarrow\infty.
```

From the exact reduced update,

```math
\log p_N
=\log p_1+\sum_{n\lt N}\log(1-\varepsilon_n)
 -\sum_{n\lt N}\log h_n.
```

Because $`\log(1-\varepsilon_n)\to0`$, its partial sums are $`o(N)`$. The inequalities $`p_N\ge1`$ and $`h_n\ge1`$ then give

```math
\log p_N=o(N),\qquad
\sum_{n\lt N}\log h_n=o(N).
```

In particular, $`\#\{n\lt N:h_n>1\}=o(N)`$. This is consistent with, and weaker in prime-history content than, Bado's density-one primitive-step result. It is not a new termination argument. A set of indices can be infinite and have zero density, and the identity gives no absolute bound on the increases of $`p_n`$ between those indices.

Even proving $`h_n=1`$ eventually would not by itself finish this route. The remaining reduced numerators could still have unbounded positive increments of relative size tending to zero. Cook's CRT argument excludes bounded upward increments, but the full hypotheses provide no such bound. His weighted record criterion likewise requires an additional estimate.

## 5. Exact unresolved obligation

For every initial coprime positive pair, the following deterministic updates are exact:

```math
e_n\equiv q_n\pmod{p_n},\qquad -p_n/2\le e_n\lt p_n/2,
\qquad a_n=(q_n-e_n)/p_n+1,
```

```math
h_n=\gcd(p_n-e_n,a_n^2),\qquad
p_{n+1}=(p_n-e_n)/h_n,
\qquad q_{n+1}=a_nq_n/h_n.
```

The missing theorem is that $`e_n/p_n\to0`$ forces some $`e_n=0`$. No argument above proves that theorem. Integer descent works only with a suitable sign or increment restriction; discarding the cancellation factors does not supply one. No probabilistic equidistribution or average-drift assumption on the residues has been justified.

This attempt obtained no full exclusion and no counterexample. It adds zero completed bounty problems. The coordinator's separate LCM-record analysis remains independent of this stopped local-descent route.
