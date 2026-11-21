# Observed agreement does not create an independent test set

21 November 2026. This is a finite, exact counterexample to treating the realized agreement of the fold models as sufficient for an ordinary full-sample binomial confidence bound. It is a scope check for the positive weighted certificate, not a separate prize solution. No novelty claim is made for the counterexample.

## 1. A finite learner and distribution

Fix $`K\ge2`$, fold size $`n\ge1`$, $`m=Kn`$, a feature dimension $`d\ge1`$, and $`p\in(0,1)`$. Every label is zero. The feature vector belongs to $`\{0,1\}^d`$ and its coordinates are independent Bernoulli variables with parameter $`p`$; examples are iid.

The hypotheses $`h_j(x)=x_j`$, $`1\le j\le d`$, all have true error $`p`$. The learner returns the first coordinate hypothesis having zero training error. If there is none, it returns the constant-one classifier. This procedure is finite, deterministic, invariant to input order, and completely specified on every training sample. It stores only the chosen coordinate index or the fallback symbol.

Let $`E_0`$ be the event that all $`K`$ fold classifiers have identical descriptions and the aggregate CV error is zero. For one feature coordinate, call it eligible for fold $`i`$ if every one of that coordinate's ones lies in fold $`i`$. It is eligible for at least one fold exactly when it has no ones outside some fold.

Put

```math
c=(1-p)^m,\qquad
a=(1-p)^{m-n},\qquad
u=Ka-(K-1)c.
```

Here $`c`$ is the probability that the coordinate is zero on all $`m`$ observations. The $`K`$ eligibility events overlap only at that all-zero pattern, giving the displayed value of their union probability $`u`$.

The event $`E_0`$ occurs exactly when the first coordinate eligible for any fold is all-zero on the complete sample. In one direction, that coordinate is the first eligible one for every fold. Conversely, if every fold selects the same coordinate, that coordinate must be zero on all observations: every observation belongs to the training set of another fold. An earlier coordinate eligible anywhere would prevent at least one fold from choosing the common coordinate. The fallback produces only errors and cannot contribute to $`E_0`$.

Different coordinate columns are independent. Summing the finite geometric series gives

```math
\boxed{
\Pr(E_0)
=\frac{c}{u}\bigl(1-(1-u)^d\bigr)
=\frac{(1-p)^n}{K-(K-1)(1-p)^n}
\bigl(1-(1-u)^d\bigr).
} \tag{1}
```

On $`E_0`$ the common classifier has true error exactly $`p`$. Thus conditioning on observed agreement and zero errors is a genuine selection event; the selected coordinate is not independent of the sample.

## 2. Failure of the full-sample zero-error binomial bound

Fix any confidence parameter $`\delta\in(0,1)`$. Choose a constant $`c_0`$ satisfying

```math
\log(1/\delta)\lt c_0<1/\delta-1.
```

Such a choice exists because $`\log t\lt t-1`$ for $`t>1`$. Take leave-one-out CV, so $`n=1,m=K`$, and use $`p=c_0/K`$ for sufficiently large $`K`$.

As $`K\to\infty`$, the first factor in (1) tends to $`1/(1+c_0)>\delta`$, while

```math
u\longrightarrow (1+c_0)e^{-c_0}>0.
```

Choose a finite $`d`$ large enough that the limiting right side of (1) exceeds $`\delta`$. The same fixed $`d`$ then works for all sufficiently large $`K`$.

An ordinary independent $`m`$-point test with zero errors would give the one-sided exact upper endpoint

```math
p_{\mathrm{bin}}(m,\delta)=1-\delta^{1/m}.
```

But

```math
Kp_{\mathrm{bin}}(K,\delta)\longrightarrow\log(1/\delta)\lt c_0=Kp.
```

For all sufficiently large $`K`$, on an event of probability greater than $`\delta`$, the fold models therefore coincide, their CV error is zero, and their true error is greater than the full-sample binomial endpoint. Merely observing that the models coincide cannot justify that endpoint.

This is compatible with the weighted certificate, whose leave-one-out zero-error endpoint is $`1/((K+1)\delta)`$. The counterexample does not invalidate that theorem.

## 3. Why this matters to the source audit

[Kohavi, IJCAI 1995](https://ijcai.org/proceedings/1995/147), Proposition 1 and its following discussion, uses a binomial argument when the fold classifiers make the same predictions. The construction above shows that such an argument cannot be applied on the strength of a realized agreement event alone. It does not address a stronger assumption imposed uniformly across all possible datasets, or a fixed classifier genuinely independent of its test sample.

Likewise, the first extreme case in [Langford's COLT 2005 problem](https://hunch.net/~jl/projects/prediction_bounds/cv_open/cv_open.ps) motivates an improved certificate when fold models coincide. It does not prove that the aggregate errors become independent. The positive weighted certificate preserves an unconditional coverage guarantee and does not make that inference.
