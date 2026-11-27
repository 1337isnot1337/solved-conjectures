# Compatible replacements for shifted runners

For $`n`$ distinct positive integer speeds and real phases, write
$`\Gamma(n)=1/(n+1+E_n)`$ for the infimum of the covering radius over
those configurations. For every $`n\ge1`$,

```math
E_n \ge \max\left\{\left\lfloor n/125\right\rfloor,
 \left\lfloor\frac{36071n-11671970}{4337929}\right\rfloor\right\},
\qquad
\liminf_{n\to\infty} E_n/n \ge 577511/69406489.
```

Poliakova proved $`E_n\ge\lfloor n/287\rfloor`$ and $`E_n\ge1`$ for
$`n\ge95`$. Her best single-rule coefficient in Table 1 is $`1/224`$.
The first MathLab release gave $`\lfloor n/150\rfloor`$ and liminf
$`513079/69470921`$ by merging shared speeds with matching phases.
The new bounds leave the remaining sizes 58–94 in Zhang's Question 8.5 open.
[Poliakova v1](https://arxiv.org/html/2609.23952v1) · [MathLab v1.0.0](https://github.com/F1Justin/MathLab/blob/ef98c0707e3a9e1b6b66f905aadd24ea6e38cadc/papers/runners/compatible-replacements.pdf) · [Zhang, Question 8.5](https://arxiv.org/html/2608.13599v3#S8)

## Checking a recipe

Start with the zero-phase speeds $`2,4,\ldots,2N`$ and
$`\delta=1/(N+1)`$. Dirichlet's argument gives a cover at this radius.
At a time $`t`$, let $`q=2i`$ be the least covering speed and write
$`qt=k+\delta z`$, $`\lvert z\rvert\le1`$. Then $`\gcd(i,k)=1`$,
since dividing $`q,k`$ by any common divisor would give a smaller
covering even speed. A prescribed runner with speed $`v`$ and phase
$`a+h\delta`$ covers $`t`$ if $`vk/q+a`$ is integral and
$`\lvert(v/q)z+h\rvert\le1`$. For every affected $`q,k`$, it suffices to
cover $`[-1,1]`$ by the corresponding intervals in $`z`$.
Here $`4\mid q`$, so $`k`$ is coprime to $`q`$. The quarter-phase
constants require $`q\mid4v`$, and alignment is then checked by
$`4vk+(4a)q\equiv0\bmod4q`$.

The three original rules are Poliakova's Theorem 7 and the
$`19\to17`$ and $`24\to21`$ rows of Table 1. A recipe begins with
odd dilations of these tables. Reflection negates both phase
coefficients. A half-turn adds $`1/2`$ to the constant phase at odd
speeds. Each recipe specifies actual even deletions and chooses one
prescription at each surviving shared speed. Unaffected evens stay
at zero phase. The checker verifies all affected $`q,k`$ with only
the installed prescriptions. This handles competing phases and the
loss of witnesses they can cause.

The sixteen recipes give gains 1–16 at seed thresholds
$`96,120,216,480,600,864,1080,2400,3000,4320,5400,5832,7776,12000,15000,21600`$.
The gain is the number of deletions minus odd additions. At $`N=480`$
the recipe gives 476 distinct positive speeds and radius at most
$`1/481`$. An independent exact sweep verifies this example directly
on the time circle. For example, the recipe keeps speed 240 at a nonzero constant
phase. Speed 120 with label $`(1/2,-1/2)`$ checks its old zero-phase
obligation, because $`k/2+1/2`$ is integral for odd $`k`$ and
$`\lvert z/2-1/2\rvert\le1`$ for $`z\in[-1,1]`$. [Recipe data](recipes.json)

## Counting the savings

Every recipe speed is supported on $`2,3,5`$. Dilation by a positive
integer $`c`$ coprime to 30 preserves the interval ratios. Because
$`4\mid q`$, a primitive numerator for $`qc`$ is still odd and the
same two residues modulo four suffice. Removing the factors $`2,3,5`$
from a scaled speed recovers $`c`$. Distinct cores have disjoint
supports and their recipes compose.

Let $`H`$ be the first thirteen thresholds and $`B=(12000,15000,21600)`$
the last three. Rule $`A`$ at dilations $`1,9,81`$ has pairwise disjoint
support prime to five, fits by 7776 and saves three runners. Scaling
any of the last three recipes by five and adding those copies extends
the available thresholds by $`5B`$. Repetition gives $`5^jB`$ for
every $`j\ge0`$. The saving achievable in a single core of relative
size $`x`$ is at least $`g(x)`$, the number of these thresholds and
the thresholds in $`H`$ at most $`x`$.

For $`C_m(y)=\#\{1\le c\le y:\gcd(c,m)=1\}`$, summing over cores gives

```math
G(N)=\sum_{t\in H} C_{30}(N/t)+\sum_{t\in B} C_6(N/t).
```

The second sum absorbs the powers of five by unique factorization.
A residue $`r`$ contributes $`\lfloor(N+t(m-r))/(mt)\rfloor`$
to $`C_m(N/t)`$. The integer check gives $`G(126h)\ge h`$ for
$`0\le h<1029`$. Floor superadditivity gives at least 1038 extra
hits as $`h`$ advances by 1029, proving the inequality for all $`h`$.

The count has period 87480000 with gain 721420. For $`p=36071`$
and $`q=4374000`$ its maximum discrepancy $`pN-qG(N)`$ is
$`K=16045969`$, reached at $`N=4239239`$. The checker exhausts
the points immediately before progression hits plus the period
endpoints. Between hits the discrepancy increases. For
$`h=\lfloor(pn+q-1-K)/(q-p)\rfloor>0`$, one then has
$`qG(n+h)\ge p(n+h)-K\ge q(h-1)+1`$. Hence $`G(n+h)\ge h`$.

If $`G(n+h)\ge h`$, take seed size $`N=n+h`$ and pad the surviving
configuration to $`n`$ with unused speeds. The radius is at most
$`1/(n+h+1)`$. This gives the second bound and the first with
$`h=\lfloor n/125\rfloor`$, since $`n+h\ge126h`$. The zero-phase
seed covers the nonpositive case of the second bound.

For the limiting gain, use the old construction below $`x=38880`$.
At larger $`x`$, dilate the improved recipe for $`x/5`$ by five
and add every copy $`A_{9^i}`$ that fits. These copies are pairwise
disjoint because 9 is the only speed of $`A`$ divisible by nine
and 1 is absent. Their supports are prime to five. In this range
$`g(x)=3+g(x/5)`$, and the first extra copy after $`A_1,A_9,A_{81}`$
requires $`69984>38880`$. Induction yields extra unit gains at all
thresholds $`96\cdot9^i5^j`$ for $`i\ge3,j\ge0`$. Count the cores
first for finite subsets of the extra thresholds and let the subsets
increase. The lower limit of the saved fraction is at least

```math
\alpha=\frac{36071}{4374000}
       +\frac4{15}\sum_{i\ge3,j\ge0}\frac{1}{96\cdot9^i5^j}
       =\frac{577511}{69984000}.
```

For $`0<a<\alpha`$, use $`h=\lfloor an/(1-a)\rfloor`$ for sufficiently
large $`n`$. At least $`a(n+h)\ge h`$ runners are saved. Letting
$`a`$ increase to $`\alpha`$ yields the ratio $`\alpha/(1-\alpha)`$.

## Reproduction and credit

Run `python3 results/shifted-lonely-runner-counterexamples/compatible-replacements/verify.py`.
The check uses Python's standard library. In the separate MathLab Lean
development, `MathLab.ScaleRule.certificate476` verifies the 476-runner
example and `MathLab.ScaleCounting.all_sizes` verifies the floor-sum
induction. The simultaneous construction, exact periodic discrepancy
and infinite-layer argument use the written proof and checker.

Poliakova supplied the underlying rules and uniform-rule framework.
aadrianvv already tested finite affine menus and fixed-size patches
by SAT. Chengyi Fang initiated and directed the work. AI systems
performed the principal mathematical development, implementation and
writing. Independent human proof checking remains outstanding.
[Earlier menu check](https://github.com/1337isnot1337/solved-conjectures/issues/110#issuecomment-7055867934) · [Earlier patch search](https://github.com/1337isnot1337/solved-conjectures/issues/110#issuecomment-7060116112)
