# Independent review of the cutoff and atom-weight reductions

Reviewed 21 November 2026:
[the authored note](threshold-band-cutoff-reduction.md).
Both auxiliary statements pass this review. Neither bounds the remaining
conditional information of the band sampler, and neither resolves the
paid learning target.

## 1. Information in the disclosed cutoff

Fix a paired pool and let its fair independent selector be $`S`$.
Replacing one selected observation changes the total loss of every
fixed threshold by at most one. Taking the minimum preserves this
Lipschitz bound, including when features repeat or labels conflict at
an atom.

The variance constant is correct. The product-cube variance inequality
is


```math
\mathop{\mathrm{Var}}(f(S))
 \le\frac14\sum_{i=1}^n
   \mathbb E\bigl[(f(S_{-i},1)-f(S_{-i},0))^2\bigr].
```


It follows by tensorizing conditional variance, or equivalently by
the Efron–Stein resampling inequality. Each square is at most one here,
so the conditional variance of the minimum is at most $`n/4`$.
The independently added uniform variable $`R\sqrt n`$, with
$`R\sim\mathop{\mathrm{Unif}}[1,2]`$, has variance $`n/12`$, giving
$`\mathop{\mathrm{Var}}(H\mid T)\le n/3`$.

For any fixed pool, the density is a finite mixture of length-$`\sqrt n`$
uniform densities, supported on a bounded interval and bounded by
$`1/\sqrt n`$. Its differential entropy is therefore finite, and
the conditional entropy given the selector is exactly
$`\tfrac12\log n`$. The Gaussian entropy upper bound gives


```math
I(H;S\mid T)
 \le\frac12\log(2\pi e/3)<1.
```


The maximum-entropy step can also be read directly from nonnegativity
of relative entropy to a Gaussian with matching mean and variance;
no assumption that the mixture is approximately Gaussian is used.
This is pointwise in the paired pool and hence survives averaging over
the iid pool law.

The chain-rule reduction for $`I(W;S\mid T)`$ is valid. Given
$`(S,T,H)`$, the sampler still has exactly the stated uniform law on
the eligible canonical cuts. The posterior selector is generally not
uniform after disclosing $`H`$. Its support indicator is correctly
written as


```math
\mathbf 1\{h-2\sqrt n\le m_S\le h-\sqrt n\}.
```


The uniform density factor cancels. Endpoint conventions have no
effect on the continuous cutoff distribution. An attempted later
bound using independent fair selector bits conditional on $`H`$
would be invalid; the authored note explicitly avoids that step.

## 2. Weight in an empirical loss band

The boundary weights


```math
w_j=(m_j+m_{j+1})/2,
\qquad m_0=m_{g+1}=0,
```


sum to $`n`$. Their probability interpretation is exact: choosing a
uniform input observation and then either boundary of its feature
group with equal probability assigns cut $`j`$ mass $`w_j/n`$.
This remains true for a single group and at both endpoints.

For a minimum cut $`j_0`$ and a first right exit at $`r+1`$, the
in-band mass on the interval $`j_0,\ldots,r`$ is


```math
\sum_{j=j_0}^r w_j
 =\frac12(m_{j_0}+m_{r+1})
    +\sum_{i=j_0+1}^r m_i
 \ge\frac12\sum_{i=j_0+1}^{r+1}m_i
 >\frac a2.
```


The last inequality follows from the loss increase to the first exit
and the groupwise bound $`|L_i-L_{i-1}|\le m_i`$. The inequality
does not require the losses to increase along the path. Left exits
give the same argument in reverse order. If there is no exit, every
cut is in the band and its total mass is $`n`$. Thus


```math
\sum_{L_j\le\min_i L_i+a}w_j
 \ge\tfrac12\min(a,n)
```


holds for all $`a\ge0`$, including repeated features and the
endpoint cases. Sampling inside a random band of width at most
$`2\sqrt n`$ gives the claimed samplewise empirical excess bound
$`2/\sqrt n`$.

## 3. Scope

The uniform-cut and boundary-weighted algorithms are different
candidates. The cutoff information bound applies to both, but the
weight-volume bound proves only a lower bound on eligible mass.
Replacing a sample can change the set of canonical cuts and move their
weights. No comparison of those conditional output laws, and no
constant bound on $`I(W;S\mid T,H)`$, follows from the two reviewed
lemmas alone. The authored note states that gap correctly.

No correction, numerical experiment, or change to the completed-target
count is requested by this review.
