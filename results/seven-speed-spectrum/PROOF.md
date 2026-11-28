# The seven-speed loneliness spectrum below one seventh

**Related earlier work (note added 28 November 2026).** Lee Marshall's [ai-math-results, `results/lonely-runner-tight-6-7`](https://github.com/LeeMarshall1113/ai-math-results/tree/a43cb0b9e0b6f762118b2acb8ee62cd31bdcbc89/results/lonely-runner-tight-6-7), released 29 October 2026, establishes Kravitz's Conjecture 8.3, the form of the spectrum conjecture with one very fast runner, for seven speeds. It combines Kravitz's Theorem 10.3 with a classification of the tight six-speed sets. Cite that work for that regime. The classification below covers every seven-speed set with loneliness below 1/7, which goes beyond the regime treated there. Earlier sources for the tight six-speed and seven-speed classifications are recorded in the notes in [tight-six-speeds](../tight-six-speeds/PROOF.md) and [tight-seven-speeds](../tight-seven-speeds/PROOF.md).

For distinct positive integer speeds $`v_1,\ldots,v_7`$, put $`L(v)=\max_t\min_i\|t v_i\|`$, where $`\|x\|`$ is the distance to the nearest integer. Divide the speeds by their gcd and sort them. This preserves $L$ since time ranges over the entire circle.

**Theorem.** The primitive septuples with $`L(v)<1/7`$ are precisely $(1,2,3,4,5,6,7s)$ for $s\ge1$ and the 27 rows of the [exact table](sporadic.txt). Consequently the complete set of values below $1/7$ is

```math
\left\{\frac{s}{7s+1}:s=1,2,\ldots\right\}\cup
\left\{\frac{3}{23},\frac{5}{37},\frac{9}{65}\right\}.
```

In particular the seven-speed case of the Amended Loneliness Spectrum Conjecture holds. For a reduced fraction $p/q$ the only possible values of $q-7p$ are 1 and 2. Fan and Sun reported $3/23$ and $5/37$. Cordella's exhaustive table through maximum speed 50 agrees with the theorem on that range. The five sporadic rows beyond that range have largest speeds 52, 54, 65, 71 and 112. For example $(2,7,9,11,13,20,54)$ has maximum $9/65$, attained at $t=11/65$. [Fan and Sun](https://doi.org/10.37236/13840) · [Cordella, §6.3](https://arxiv.org/html/2609.03444v2#S6.SS3)

## Reducing to a finite set of primes

For a rational subspace $E\subset\mathbb R^7$, write $`L(E)=\max_{x\in E}\min_i\|x_i\|`$. The associated torus is compact. We use the established plane gap in this repository. Every rational two-plane contained in no coordinate hyperplane has $L(E)\ge5/33$, except possibly signed permutations of $(s,2s,3s,4s,5s,6s,t)$. The classification uses the six-speed spectrum and a finite enumeration of planes on two independent lines with repeated speeds. The near-tight primitive tuples on these product planes are exactly our stated infinite family, with $L=s/(7s+1)$ for every $s$. Henceforth let $v$ be near-tight and on none of the product planes. [Plane gap and its dependencies](../tight-seven-speeds/PROOF.md) · [Product-plane calculation](../tight-six-speeds/PROOF.md#the-large-norm-seven-speed-statement)

Project $\mathbb Z^7$ orthogonally onto $v^\perp$. Primitivity gives the projected lattice covolume $`1/|v|_2`$, by extending $v$ to an integral basis and taking base times height. Let $`\lambda_1\le\cdots\le\lambda_6`$ be its successive minima in the sup norm. Vaaler's lower bound $2^6$ on the central section volume and Minkowski's second theorem give $`\prod\lambda_j\le1/|v|_2`$. Lift independent projected vectors attaining these minima to integer vectors $z_j$. On $`E_{r+1}=\mathop{\mathrm{span}}(v,z_1,\ldots,z_r)`$, reduce each coefficient of $z_j$ modulo one to absolute value at most $1/2$. Absorb the components parallel to $v$ into its coefficient. Every phase on this torus is within $`\tfrac12\sum_{j\le r}\lambda_j`$ in sup norm of the speed circle. Loneliness is 1-Lipschitz in this norm. [Vaaler](https://msp.org/pjm/1979/83-2/pjm-v83-n2-p24-p.pdf) · [Yi, Gill and Bu, §11](https://arxiv.org/html/2610.40694v1#S11)

The lower bounds for $L(E_{r+1})$ in increasing dimension are $5/33,1/6,1/5,1/4,1/3,1/2$. The first follows from the plane gap. The others follow by coalescing coordinates on a rational line and applying the known lonely runner bounds for at most five distinct speeds, as in the [seven-coordinate norm argument](../tight-seven-speeds/PROOF.md). Since $`L(v)<1/7`$, the partial sums of the minima strictly exceed the corresponding partial sums of

```math
y=(4/231,1/33,1/15,1/10,1/6,1/3).
```

Indeed these latter sums equal twice the respective lower bounds minus $2/7$. Concavity gives $`\log\lambda_j-\log y_j\ge(\lambda_j-y_j)/\lambda_j`$. Summation by parts with nonincreasing weights $1/\lambda_j$ gives a strictly positive sum. Therefore $`|v|_2<1/\prod y_j=B=5{,}145{,}525`$.

Set $`D=\prod_i v_i`$. For each $d=2,\ldots,7$, a speed is divisible by $d$, since otherwise $t=1/d$ would give loneliness at least $1/d$. Thus $420\mid D$, while AM–GM gives $`D<(B/\sqrt7)^7`$. Take the primes

```math
151,157,163,167,173,179,181,191,193,197,199,211,223,227,229,233,239,241,251.
```

They are coprime to 420 and their product $P$ satisfies $`7^7(420P)^2>B^{14}`$. The verifier checks this with integers. At least one of the primes therefore divides no coordinate of $v$.

## A short modular vector determines the integer direction

Suppose $0\ne w\in\mathbb Z^7$, $w\equiv a v\pmod m$, and $`231\|w\|_\infty\le4m`$. The multiplier $a$ need not be a unit. If $w$ is independent of $v$, put $z=(w-av)/m$. Every phase $sv+tz$ on their plane can be represented with $`|t|\le1/2`$. Its distance from $(s-ta/m)v$ on the speed circle is at most $`\|w\|_\infty/(2m)\le2/231`$. Thus the plane has loneliness strictly below $1/7+2/231=5/33$. This contradicts the plane gap because it contains $v$. Hence $w$ is parallel to $v$. Sorting the absolute coordinates of $w$ and dividing out their gcd recovers the primitive tuple. A zero coordinate or a repeated absolute coordinate rules the direction out.

## Exhausting the modular possibilities

Fix a listed prime $p$ dividing no speed. Write $`[x]_m=\min(x\bmod m,(-x)\bmod m)`$. A witness at modulus $m$ is a multiplier $t$ with $`7[tv_i]_m\ge m`$ for every $i$. Such a multiplier excludes the tuple.

1. At $p$ enumerate folded supports of size seven up to common unit, individual signs and permutation. For a pair $x,y$ consider the smaller of $`[x/y]_p,[y/x]_p`$. Choose the minimum $b$ over all distinct pairs and rescale so the selected pair becomes $1,b$. All other members are larger than $b$, since each is itself a quotient against 1. Enumerate them in order with all pairwise minima at least $b$. Intersect the witness-time masks as coordinates are added. Any smaller witnessless support extends to a witnessless seven-element support, since extra constraints only remove witness times. Test all subsets of each returned support and add all multiplicities giving length seven. Canonicalize a multiset by dividing by each of its distinct members, folding and sorting, and choosing the least result. [Prime enumerator](../tight-six-speeds/modular.cpp) · [Multiset enumeration](verify.py)

2. Above a surviving representative $x\bmod m$, starting at $m=p$, consider all $2^7$ lifts $`x_i+m\epsilon_i`$ modulo $2m$. A parent unit lifts to a child unit, so representatives preserve coverage. For even $m$ the unit $1+m$ toggles the bits at precisely the odd coordinates. We may therefore fix the bit at the first odd entry to zero. At any even modulus the all-even class violates primitivity. A class with just one odd speed is impossible as well. The six even speeds admit a time with all distances at least $1/7$ by the six-speed lonely runner theorem. At that time and half a turn later their phases agree, while one of the two odd-speed distances is at least $1/4$.

3. For each odd $t\le m$, the two possible distances in numerator units in coordinate $i$ are $`\ell_i=[tx_i]_{2m}`$ and $m-\ell_i$. Exclude all children where each chosen distance is at least $2m/7$. If a choice in every coordinate gives distance at most $4(2m)/231$, the choice is unique since the two options sum to $m$. The centered residues form a short modular vector. On an actual primitive tuple the vector is nonzero, because the residue vector of a primitive integer tuple has order $2m$ and $`0\lt t<2m`$. The short-vector lemma either excludes the child or supplies its only possible integer direction, which we retain for exact testing. Signs, permutation and multiplication by a common unit in the modular representation only permute or sign the recovered coordinates or change the multiplier $a$ of the lemma.

4. Repeat on each unresolved child. The executable fails on any unresolved node at depth ten. All nineteen trees terminate before that bound and yield 10,179 distinct candidate integer directions in total. Trying only odd multipliers can leave extra work, but every deletion has one of the justifications above. [Binary lifts](lift.cpp)

## Exact values and consequences

For each surviving direction, test the known family and the threshold $1/7$. On $`[0,1/2]`$ a nonempty simultaneous closed superlevel set has a first point. At this point some speed $x$ enters its admissible interval, so the first point has the form $(7j+1)/(7x)$. The verifier tests all such endpoints after trying inexpensive rational witnesses. For each remaining direction its positive maximum is below $1/7$. Locally each active distance function there has slope $+a$ or $-b$, without a cusp. At a maximum both signs must occur, so $(a+b)t$ is integral for two distinct speeds. Exhausting all such rational times computes the maximum exactly. The resulting tuples and fractions agree entry by entry with the [27-row table](sporadic.txt). The table and the product-plane formula give the stated spectrum. [Exact arithmetic verifier](verify.py)

**Sharp speed bound.** If $`L(v)=p/q<1/7`$ in lowest terms and $v$ is primitive, then $\max v_i\le13q/5$. On the infinite family the largest speed is $7s\lt q$. On the table the largest ratio is $39/15$, attained by $(1,4,5,6,7,11,39)$.

**Zhu's triangle conjecture for six and seven distances.** Let $D$ be a set of $`k\in\{6,7\}`$ positive integer distances. If its distance graph on the integers has chromatic number $k+1$, then it contains a triangle. Indeed every seven-speed near-tight tuple contains $a,b,a+b$, allowing $a=b$. This holds by inspection of the family and an exhaustive test of the table. For six speeds, the two product families contain respectively $s+s=2s$ and $s+3s=4s$ in absolute values. The third family includes the signed coordinates $s,t,s+t$, whose nonzero distinct magnitudes give an additive relation. The proof outside these families gives a signed additive relation on three distinct speeds. Scaling preserves the existence of a triangle. Thus triangle-free $D$ has $L(D)\ge1/k$. Choose a maximizing time $t$ and color $n\in\mathbb Z$ by $`\lfloor k\{nt\}\rfloor`$. Two phases in the same half-open arc of length $1/k$ have circular distance strictly below $1/k$, so every edge joins different colors. This gives a proper $k$-coloring. [Six-speed classification](../six-speed-spectrum/PROOF.md) · [Barajas and Serra on Zhu's conjecture](https://doi.org/10.1016/j.disc.2007.07.061)

The proof uses exact integer and rational arithmetic. Its prior plane and six-speed results have their own verifiers in this repository. The new classification awaits independent mathematical review and Lean formalization.
