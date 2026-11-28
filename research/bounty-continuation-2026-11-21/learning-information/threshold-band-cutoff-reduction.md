# Threshold band sampling: a disclosed cutoff and weights for atoms

Date: 21 November 2026. These are auxiliary reductions for the [private band sampler](threshold-near-minimum-information-gap.md). They do not prove its required constant information bound or resolve the threshold bounty. The weighted construction in Section 2 is a separate candidate from uniform sampling over distinct feature values.

## 1. Disclosing the absolute loss cutoff costs less than one nat

Fix any paired supersample $`T`$ of size $`n\times2`$, with arbitrary labels and atoms, and let $`S`$ be its independent fair selector. Let $`m_S`$ be the minimum total empirical threshold loss on the selected sample. Let $`R`$ be independent and uniform on $`[1,2]`$, and set

```math
H=m_S+R\sqrt n.
```

Changing one selector bit replaces one observation. The total loss of every fixed threshold changes by at most one, so its minimum also changes by at most one. If $`S^{(i)}`$ independently resamples bit $`i`$, then

```math
\mathbb E[(m_S-m_{S^{(i)}})^2\mid T]\le\tfrac12.
```

The Efron–Stein inequality therefore gives

```math
\mathop{\mathrm{Var}}(m_S\mid T)\le n/4.
```

The added continuous noise is independent, and its variance is $`n/12`$. Consequently

```math
\mathop{\mathrm{Var}}(H\mid T)\le n/3,
\qquad h(H\mid S,T)=\tfrac12\log n.
```

For each fixed pool, the density of $`H`$ is a finite mixture of uniform densities on intervals of length $`\sqrt n`$, so these differential entropies exist and are finite. The Gaussian maximum-entropy bound yields

```math
I(H;S\mid T)
\le\tfrac12\log(2\pi e/3)<1.
\tag{1}
```

This bound holds for every fixed pool, hence also after averaging over iid pools. For the sampler's actual output $`W`$,

```math
I(W;S\mid T)
\le I(H,W;S\mid T)
\le\tfrac12\log(2\pi e/3)+I(W;S\mid T,H).
\tag{2}
```

Conditional on $`S,T,H`$, the original uniform-band algorithm chooses uniformly among its canonical thresholds with total loss at most $`H`$. Thus (2) removes the random minimum from the eligibility test at a controlled information cost. It does not make the posterior selector uniform after conditioning on $`H`$. In fact, for fixed $`T,H=h`$, that posterior is proportional to

```math
1[h-2\sqrt n\le m_S\le h-\sqrt n].
```

Any subsequent occupation-set or dyadic argument must respect that conditioning. No bound on the last term in (2) has been proved here.

## 2. A weighted band has substantial mass even with repeated features

The following construction was proposed by the coordinator to repair the usual near-minimum-volume argument in the presence of atoms.

Order the sample's distinct feature groups. Let their multiplicities be positive integers $`m_1,\ldots,m_g`$ with sum $`n`$. The valid threshold cuts are $`j=0,\ldots,g`$: cut 0 is the threshold at the first feature, and cut $`g`$ is infinity. Write $`L_j`$ for their total losses. Across group $`j`$,

```math
|L_j-L_{j-1}|\le m_j.
```

Give each cut the weight

```math
w_j=(m_j+m_{j+1})/2,
\qquad m_0=m_{g+1}=0.
```

Then $`\sum_{j=0}^g w_j=n`$. This base measure is the law, multiplied by $`n`$, obtained by choosing a uniformly random input observation and then choosing the left or right boundary of its equal-feature group with equal probability.

Let $`m=\min_j L_j`$, and let $`B(a)=\{j:L_j\le m+a\}`$. For every $`a\ge0`$,

```math
\sum_{j\in B(a)}w_j\ge\tfrac12\min(a,n).
\tag{3}
```

To prove this, choose a minimum cut $`j_0`$. If every cut belongs to $`B(a)`$, its mass is $`n`$. Otherwise take the contiguous in-band component containing $`j_0`$ and follow it toward an exit. If the first exit is at cut $`r+1>j_0`$, then

```math
a\lt L_{r+1}-L_{j_0}
\le\sum_{i=j_0+1}^{r+1}m_i.
```

The weights of the in-band cuts $`j_0,\ldots,r`$ include at least half the last sum, including half the exit group's weight at cut $`r`$. Their mass therefore exceeds $`a/2`$. A left exit has the same proof with the order reversed. This proves (3).

One may now sample $`R`$ as above and choose cut $`j`$ with probability proportional to $`w_j`$ among $`B(R\sqrt n)`$. This is a measurable proper learner, and every possible output has empirical excess at most $`2/\sqrt n`$. Its eligible weight is at least $`\min(\sqrt n,n)/2`$. The absolute-cutoff information bound (1) still applies.

The replacement of one sample point can move weight between adjacent valid cuts, particularly when a singleton feature group disappears. Thus (3) does not by itself bound the change in the output law. No constant-CMI theorem for this weighted candidate is claimed.
