# Erdős–Sárközy–Sós conjecture: bounded gaps with slowly growing multiplicity

Research note for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783) and [Erdős 153](https://www.erdosproblems.com/153). The [marked correlation example](CORRELATION-BARRIER.md) used sets of sum sites and of difference sites that did not come from a common set of endpoints. This note builds a genuine integer sumset with bounded mean squared gaps at the natural quadratic diameter scale. It violates the Sidon requirement, with a quantified upper bound on the violation. It does not settle the original conjecture or the analogous question with any fixed representation cap.

## Theorem

For every sufficiently large integer $`N`$, there is a set $`A\subset[0,N]\cap\mathbb Z`$ with $`0,N\in A`$, $`|A|\asymp\sqrt N`$, and
```math
 |A+A|\asymp N,\qquad
 \sum_{i\lt t}(s_{i+1}-s_i)^2=O(N),\qquad
 \max_s\#\{(a,b)\in A^2:a\le b,\ a+b=s\}
     =O\!\left(\frac{\log N}{\log\log N}\right),
```
where $`s_1<\dots<s_t`$ are the distinct sums. In particular the mean squared consecutive gap is bounded by an absolute constant.

The selection probabilities have integrable power-law concentrations near both endpoints. This prevents the logarithmic edge cost of a bounded limiting density. The first moments alone do not control empty intervals, so the proof uses disjoint endpoint blocks to bound their void probability. Classical random additive-basis models, such as [Erdős–Rényi (1960)](https://users.renyi.hu/~p_erdos/1960-02.pdf) and [Godbole–Lim–Lyzinski–Triantafillou, finite $`2`$-sum representability](https://arxiv.org/abs/1705.05198), also select endpoints independently but study different representation or coverage requirements. The present bound is for consecutive-gap energy across the *whole* span at size $`\asymp\sqrt N`$.

## Selection and representation cap

Let $`X=\lfloor N^{2/5}\rfloor`$. Force $`0,X,N-X,N`$ into $`A`$. Include each other $`j\in[0,N]`$ independently with probability
```math
 p_j=N^{-1/4}\min(j+1,N-j+1)^{-1/4}.
```
The probability formula is symmetric. The sum of the probabilities is $`\asymp\sqrt N`$ and the sum of their squares is $`O(1)`$, by comparison with integrals of $`x^{-1/4}`$ and $`x^{-1/2}`$. Independence and Chebyshev give $`|A|\asymp\sqrt N`$ with probability tending to one.

For each $`s`$, off-diagonal unordered representations of $`s`$ by *unforced* points are independent Bernoulli events: any two distinct pairs summing to $`s`$ are vertex-disjoint. Their expected count is at most $`\sum_j p_jp_{s-j}\le\sum_j p_j^2=O(1)`$, extending the probabilities by zero outside the support. Its $`k`$th binomial moment is therefore at most $`C^k/k!`$ for an absolute $`C`$. This bounds the probability of at least $`k`$ such representations. A diagonal contributes at most one, and forced endpoints contribute at most four off-diagonal representations at any fixed sum. Take $`k=\lceil 3\log N/\log\log N\rceil`$. By the elementary factorial bound $`k!\ge(k/e)^k`$, the union bound over all $`2N+1`$ possible sums tends to zero. This proves the claimed representation cap with probability tending to one.

## Void probability for short windows

Let $`X\le x\le N-1`$ be an integer, and take an integer $`1\le h\le x/100`$. For $`N`$ sufficiently large we claim
```math
 \Pr\big((A+A)\cap[x+1,x+h]=\varnothing\big)
 \le \exp\!\left[-c\min\!\left(h\sqrt{x/N},(x^3/N)^{1/4}\right)\right].
 \tag{1}
```
Here and below $`c>0`$ is absolute.

Inside $`[\lceil x/5\rceil,\lfloor x/3\rfloor]`$ take disjoint blocks of $`h`$ consecutive sites with starts spaced by $`3h`$. There are at least $`c_1 x/h`$ such blocks, with $`c_1>0`$ absolute: the available interval has length $`2x/15+O(1)`$ and $`h\le x/100`$. In a chosen block, if there is an occupied site, take the least occupied site $`j`$. Seek a second occupied site in $`[x+1-j,x+h-j]`$, a window of length $`h`$. That guarantees a sum in the target interval. For different first blocks the complete ranges of possible second windows are disjoint: each range has length at most $`2h-1`$ and their starts differ by $`3h`$. Also every second window lies to the right of all the first blocks and within $`[0,N]`$: its endpoints lie between $`2x/3`$ and $`x+h-x/5< x`$. Thus these trials use disjoint groups of independent variables.

All endpoint sites used have inclusion probability at least $`p=c_2N^{-1/4}x^{-1/4}`$, with the forced sites only helping. The success probability of a trial is at least $`(1-e^{-hp})^2`$. For $`y>0`$,
```math
 1-(1-e^{-y})^2\le \exp[-c_3\min(y^2,y)].
```
For $`y\le1`$ use $`1-e^{-y}\ge (1-e^{-1})y`$. For $`y\ge2`$ use $`2e^{-y}-e^{-2y}\le 2e^{-y}\le e^{-y/2}`$; on the compact interval between them a positive absolute $`c_3`$ works. Multiplying over the trials yields $`\exp[-c_4\min(xhp^2,xp)]`$, which is (1).

## From voids to squared gaps

The points $`0,X,N,2N-X,2N`$ all belong to $`A+A`$. In $`[0,N]`$ define $`W_x`$ for each integer $`0\le x<N`$ as the distance to the next sum strictly to its right. For each gap $`g`$, its $`g`$ constituent sites have distances $`g,\dots,1`$, so its squared gap length is their sum of $`2W_x-1`$. There is no gap crossing the midpoint $`N`$, since $`N=0+N`$ is a sum.

When $`x<X`$, $`W_x\le X`$, so this segment costs $`O(X^2)=o(N)`$. When $`x\ge X`$, for $`1\le h\le \lfloor x/100\rfloor`$ use (1) to bound $`\Pr(W_x>h)`$. Write $`\lambda=\sqrt{x/N}`$ and $`H=\lfloor x/100\rfloor`$. For these $`h`$ the bound is at most $`e^{-c h\lambda}+e^{-c(x^3/N)^{1/4}}`$. For $`h>H`$ the probability is no larger than the bound at $`H`$ (or is zero if $`h\ge N-x`$). At $`H`$ the minimum in (1) is at least a constant times $`(x^3/N)^{1/4}`$, because $`x\ge X`$ and $`x\lambda=(x^3/N)^{1/2}`$. Since $`(X^3/N)^{1/4}\gg N^{1/20}`$, summing the geometric part and the negligible tail gives
```math
 \mathbb E W_x\ll \sqrt{N/x}+N e^{-c_5N^{1/20}}.
```
The sum over $`X\le x<N`$ is $`O(N)`$. Reflection yields the same bound on the right half, so the expectation of the total squared gap cost is $`O(N)`$. Markov makes that total at most a fixed constant times $`N`$ with probability at least $`3/4`$, and the cardinality and representation bound hold simultaneously with probability tending to one. Select any realization in the intersection.

Finally $`\sum_{i<t}(s_{i+1}-s_i)=2N`$. Cauchy–Schwarz and the $`O(N)`$ squared cost therefore imply $`t-1\gg N`$. The upper bound $`t\le2N+1`$ is immediate. This finishes the construction.

## Remaining question

Unlike the marked-correlation model, this construction uses a single endpoint set in every sum. It shows that a bounded-gap argument must genuinely distinguish Sidon sets from sets with slowly growing maximum multiplicity, not just use total mass, acceptable coarse densities, or the sharing of endpoints across all sums. An alteration that deletes enough points to achieve a fixed cap must still retain quadratic-scale size and the multiscale void estimate. The elementary independent model does not provide such an alteration.
