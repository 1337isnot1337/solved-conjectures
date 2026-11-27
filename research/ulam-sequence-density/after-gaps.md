# Competing pairs one step after an Ulam gap

Let $`p<x=u_k`$ be consecutive Ulam numbers, $`g=x-p`$ their gap,
and $`r(n)`$ the number of unordered representations of $`n`$ by
two distinct Ulam terms. Put $`H(x)=r(x+1)-1`$ for $`x\ge3`$.
One pair at $`x+1`$ is $`\{1,x\}`$. Every other pair lies entirely
in $`[g+1,p]`$ since both terms are at most $`p`$. Distinct pairs for
the same target are disjoint. Consequently

```math
2H(x)\le A(p)-A(g)\le k-2.
```

This singles out one integer after each long gap for a growth test.
The [adjacent-pair test](pair-counts.md) counts representations at
every pair of consecutive targets.

## Two estimates with different consequences

Fix an integer $`G\ge2`$ and a real $`c>0`$. In each assertion it
suffices that the hypothesis hold at every sufficiently large endpoint
$`x=u_k`$ with preceding gap $`g\ge G`$.

- If $`H(x)\ge cx`$, then the lower natural density is at least
  $`\min(2c,1/(G-1))`$. Write this minimum as $`b`$. At every tested
  endpoint $`k-bu_k\ge0`$. At an endpoint of a shorter gap the same
  difference increases by $`1-bg\ge0`$. Hence $`k-bu_k`$ is bounded
  below for every $`k`$. Between terms use $`A(N)=k-1`$ for
  $`u_{k-1}\le N<u_k`$.
- If $`H(x)\ge cg`$, then $`\limsup_k u_k/k^2\le1/(4c)`$ and
  $`\liminf_N A(N)/\sqrt N\ge2\sqrt c`$. At every tested endpoint
  $`g\le(k-2)/(2c)`$. All shorter gaps are at most $`G-1`$.
  Summing these bounds through index $`k`$ gives
  $`u_k\le k^2/(4c)+O_{c,G,U}(k)`$. Inverting between successive
  terms gives the second assertion.

If the lower density is zero, there must in fact be endpoints at
which $`g\to\infty`$ and $`H(x)/x\to0`$ simultaneously. Take successive
strict record lows of $`k/u_k`$ tending to zero. Such a record has
$`k/u_k<(k-1)/u_{k-1}`$, hence $`g>u_k/k`$, and
$`2H(x)/x\le k/u_k`$. The lower limits of $`A(N)/N`$ and $`k/u_k`$
agree because the minimum between successive terms is approached at
$`u_k-1`$, where the ratio is $`(k-1)/(u_k-1)`$.

## What the earlier pairs contribute after a gap

For $`0\le t<x`$ let $`o_x(t)`$ count representations of $`x+t`$
using only terms smaller than $`x`$, and put $`w_x(t)=1_U(x+t)`$.
Every pair counted by $`o_x(t)`$ lies in $`[g+t,p]`$. Every other
pair has one term at least $`x`$ and one at most $`t`$, so the full
rule gives the exact recurrence

```math
w_x(t)=\mathbf1_{\{\,o_x(t)+\sum_{s\in U,\ 1\le s\le t}w_x(t-s)=1\,\}} .
```

Here $`o_x(0)=1`$ and $`o_x(1)=H(x)`$. As a test, set $`v(0)=1`$
and apply the recursion for $`t>0`$ with the earlier-pair count set
to zero. If the gaps in $`U`$ are unbounded, then the support of
$`v`$ is infinite. Otherwise it has a largest member $`B`$. Choose
a term $`s>B`$ preceded by a gap longer than $`B`$. At $`t=s`$ the
only contributing pair in the sum is $`s+0`$, since all the numbers
from $`s-B`$ through $`s-1`$ are absent from $`U`$. This forces
$`v(s)=1`$, a contradiction. In the genuine sequence the earlier
pairs can already change the very first bit after the endpoint.

## Exact endpoint counts

The table exhausts all endpoints with $`x+1\le2^{24}`$ at each listed
threshold. Each fraction is shown with its original numerator and
denominator. The denominator in the last column is the gap.

| Minimum gap $G$ | Endpoints | Minimum $H(x)/x$ | Minimum $H(x)/g$ and endpoint |
| ---: | ---: | ---: | ---: |
| 10 | 581,610 | $54/23883$ | $3/34$ at 983 |
| 50 | 31,356 | $52/20643$ | $37/100$ at 5,484 |
| 100 | 5,419 | $52/20643$ | $37/100$ at 5,484 |
| 200 | 324 | $346/123683$ | $393/262$ at 64,682 |
| 300 | 34 | $3756/1137338$ | $927/315$ at 253,034 |
| 500 | 2 | $6734/934296$ | $6734/587$ at 934,296 |

For example, the 5,419 endpoints with $`g\ge100`$ all satisfy
$`H(x)>x/400`$. Extending this inequality to every sufficiently
large endpoint with $`g\ge100`$ would give lower density at least
$`1/200`$. Even the weaker estimate $`H(x)\ge g/3`$ at those
endpoints would give a square-root counting bound. Both extensions
are unproved. [Exact replay and full coefficient check](record_lows.cpp) · [Current logarithm-squared counting bound, Kravitz](https://arxiv.org/abs/2611.17584)
