# Markov uniqueness conjecture

**Partial research.** The odd part of any repeated largest Markov coordinate must factor into two coprime members of a set with $`O((\log X)^4)`$ elements up to $`X`$. The factor condition comes from sums and differences of normalized characteristic roots. It gives a positive-density set of cofactors $`e`$ for which uniqueness holds at every $`e p^j`$ with $`p`$ an odd prime coprime to $`e`$. Exact certificates give some of these entire arithmetic families. The unrestricted conjecture remains open. [Issue #400](https://github.com/1337isnot1337/solved-conjectures/issues/400)

## Target and sources

Frobenius’s 1913 conjecture asks whether a positive integer $`z`$ can be the largest coordinate of at most one sorted positive solution of $`x^2+y^2+z^2=3xyz`$. The November 24, 2026 check found the prime-power and twice-prime-power results, an almost-all theorem, and bounded computational verification. Those results leave the unrestricted conjecture open. The proof here uses the classical Markov tree and the Cohn matrix representation. It studies the denominator set for sums and differences of normalized characteristic roots and then uses the resulting arithmetic restriction. Priority for the covering and cofactor criteria is provisional. [Frobenius’s 1913 volume](https://www.biodiversitylibrary.org/item/126263) · [Zhang](https://arxiv.org/abs/math/0612620) · [Tan](https://arxiv.org/abs/math/0606283) · [*Almost all $`k`$-Markov numbers are unique*](https://hexagonmath.org/pdf/2611.00216v2) · [Tan–Zhang finite verification](https://arxiv.org/abs/2611.01007)

## Characteristic roots and their words

For a sorted triple other than $`(1,1,1)`$ and $`(1,1,2)`$, the replacement $`z'=3xy-z`$ is positive and below $`y`$. The product of the roots of $`t^2-3xyt+x^2+y^2`$ is positive and its value at $`y`$ is $`x^2-(3x-2)y^2<0`$ except when $`x=y=1`$. Descent ends at the two indicated triples. Their only increasing continuation beyond them begins with $`(1,2,5)`$. Thereafter replacing either nonlargest coordinate increases the maximum. These operations preserve pairwise coprimality since a replaced coordinate is congruent to the negative of the old one modulo the other two.

Use the two positive determinant-one matrices

```math
A_m=\begin{pmatrix}1&m\\m&m^2+1\end{pmatrix},\qquad m=1,2.
```

Start with the pair $`(A_1,A_2)`$ and label its mediant node by the product $`A_1A_2`$. From a pair $`(M,N)`$ go to $`(M,MN)`$ or $`(MN,N)`$. For the initial matrices and product, the trace is three times the lower-left entry, with lower-left entries $`1,2,5`$. This relation persists, because $`M^2N=(\mathop{\mathrm{tr}}M)MN-N`$ and $`MN^2=(\mathop{\mathrm{tr}}N)MN-M`$, and the trace-minus-three-times-entry relation is linear. The child lower-left entries are the Markov mutations of the two smaller entries. Thus these pairs produce all sorted triples with $`z\ge5`$ by descent.

For $`P=MN`$, write its bottom row as $`(z,d_P)`$, and let $`x,y`$ be the lower-left entries of $`M,N`$ in their matrix order. Taking the determinant of $`N`$ gives $`zN_{22}-d_Py=x`$, hence $`d_Py\equiv -x\pmod z`$. Also $`\mathop{\mathrm{tr}}P=3z`$ and $`\det P=1`$ give $`d_P^2\equiv-1\pmod z`$. The normalized characteristic root of this triple is the distance of $`d_P/z`$ to the nearest integer.

The matrix words are lower mechanical words. Start with slopes $`0/1,1/1`$ for letters $`0,1`$, which stand for $`A_1,A_2`$. For a reduced slope $`a/b`$ the word is the length-$`b`$ sequence of differences $`\lfloor ia/b\rfloor-\lfloor(i-1)a/b\rfloor`$ for $`i=1,\ldots,b`$. For adjacent slopes $`a/b<c/d`$ with $`bc-ad=1`$, the mediant word is the concatenation of the two words in that order. On the first $`b`$ steps the difference between the new cumulative argument and $`ia/b`$ is $`i/(b(b+d))`$, too small to change its floor. On the next $`j`$ steps it differs from $`a+jc/d`$ by $`(d-j)/(d(b+d))`$, again too small to change the floor. The comparison uses the denominators $`b`$ and $`d`$ of the old arguments. This proves the word description by induction.

On a bottom row with ratio $`t`$ of the right entry to the left, right multiplication by $`A_m`$ acts by

```math
f_m(t)=m+\frac{t}{1+mt},\qquad f_m(\infty)=m+\frac1m.
```

Start with $`t=\infty`$ for the empty word. Every nonempty word has ratio in $`[3/2,5/2]`$. The images of $`[3/2,\infty]`$ under $`f_1`$ and $`f_2`$ are disjoint, so the ratio determines the last letter and then the preceding ratio by inversion. It determines the word inductively. Each interior slope’s word ends with $`1`$, so $`d_P/z-2\in[3/8,5/12]`$ and is the normalized characteristic root. Knowing the latter determines the word and hence the triple. Indeed the word determines the slope from its length and number of ones, and the Farey mediant tree has just one node with that slope. In particular two different triples with the same maximum give distinct integer roots $`r,r'`$ normalized to $`0<r,r'<z/2`$.

## A small cover of the normalized roots

Let $`C`$ be the closure of the set of these normalized roots $`r/z`$ over all triples with $`z\ge5`$. We show that for each integer $`L\ge1`$ it has a cover of $`O(L^2)`$ intervals of length at most $`4^{-L}`$. Among mechanical words of length at most $`L`$ there are $`O(L^2)`$ choices, by their reduced fractions. These give singleton intervals.

For longer words the final $`L`$ maps $`f_m`$ act on an input in $`[3/2,5/2]`$. Each has derivative at most $`1/4`$ there, and each preserves this interval. Thus a suffix fixes an interval of length at most $`4^{-L}`$ for the final ratio and for its normalized root. In reverse order the last $`L`$ letters of the mechanical word of slope $`\alpha=a/b`$ are

```math
\lceil j\alpha\rceil-\lceil(j-1)\alpha\rceil,\qquad 1\le j\le L,
```

because $`b\alpha`$ is integral. The relevant ceiling values change only at the $`O(L^2)`$ breakpoints $`m/j`$. Counting the open intervals and individual breakpoints gives $`O(L^2)`$ suffixes across all slopes. The finitely many closed intervals cover the closure $`C`$ as claimed.

Define $`\mathcal D`$ to be the set of reduced denominators of the nonzero rational points in $`(C+C)\cup(C-C)`$. All these numbers have absolute value below one, so $`1\notin\mathcal D`$. The sum and difference sets have covers of $`O(L^4)`$ intervals of length at most $`2\cdot4^{-L}`$ from the pairwise sums and differences of covering intervals. Distinct reduced fractions of denominator at most $`X`$ differ by at least $`1/X^2`$. Taking $`L`$ a suitable constant times $`1+\log X`$ gives

```math
|\mathcal D\cap[1,X]|=O((1+\log X)^4).
```

## Complementary factors of a collision

Suppose two sorted triples have the same maximum $`z`$ and distinct normalized integer roots $`r,r'`$. Then $`(r-r')(r+r')\equiv0\pmod z`$. For any odd prime divisor of $`z`$, it cannot divide both factors because $`r`$ is coprime to $`z`$. Hence each full odd prime-power factor of $`z`$ divides just one of $`r-r'`$ and $`r+r'`$. For even $`z`$ the exponent of two is one because $`r^2\equiv-1\pmod z`$ has no solution if $`4`$ divides $`z`$. In that case both $`r-r'`$ and $`r+r'`$ are even. It follows in every case that the reduced denominators of $`(r-r')/z`$ and $`(r+r')/z`$ are coprime, multiply to the odd part of $`z`$, and are both in $`\mathcal D`$. These fractions are nonzero and have absolute value below one, so their denominators exceed one.

In particular, if $`e`$ has no divisor in $`\mathcal D`$, every largest Markov coordinate of the form $`e p^j`$ with $`p`$ odd prime and $`p\nmid e`$ is unique. In a collision, the whole $`p^j`$ would occur in one of the two denominators, so the other would divide $`e`$. Among prime cofactors up to $`X`$, at most $`O((1+\log X)^4)`$ can fail this criterion. Among prime-power cofactors up to $`X`$, at most $`O((1+\log X)^5)`$ can fail it, since each exceptional prime-power divisor has at most $`O(1+\log X)`$ prime-power multiples up to $`X`$.

The set of qualifying cofactors among all integers has positive natural density. The bound on $`\mathcal D`$ gives $`\sum_{d\in\mathcal D}1/d<\infty`$ by a dyadic summation. For a finite collection of forbidden divisors, uniform residues modulo their least common multiple have independent truncated prime valuations by the Chinese remainder theorem. The events of avoiding individual divisors are decreasing in these independent coordinates, so their intersection has probability at least $`\prod_d(1-1/d)`$. For completeness, decreasing functions of one ordered independent variable have nonnegative covariance by taking the expectation of the product of their pairwise differences for two independent copies. Conditioning and induction give the same fact for a product of coordinates. Applying it repeatedly proves the intersection bound. The infinite product is positive. The proportion of integers up to $`X`$ divisible by any forbidden $`d>Y`$ is bounded by $`\sum_{d>Y}1/d`$, uniformly in $`X`$. Letting $`Y`$ grow gives existence of the natural density with the same positive lower bound.

## Exact cofactor certificates and scope

The [rational checker](verify.py) covers $`C`$ by taking the exact values for short words and the image of $`[3/2,5/2]`$ for each possible suffix. It generates suffixes by sampling all breakpoint slopes and one point in each open slope interval. Simple interval inequalities then exclude every nonzero multiple of $`1/e`$ of absolute value below one from the sum and difference covers. Depth five certifies the cofactors $`37,41,53,61,73`$, each for all permitted $`p^j`$. For instance $`(13,34,1325)`$ has $`1325=53\cdot5^2`$, so the certificate with cofactor 53 applies. A cover that hits a grid point gives no conclusion. Replay from the repository root with `python3 research/markov-uniqueness/verify.py`.

The sparse denominator restriction is necessary for a collision. It leaves open whether two roots belonging to triples of the same maximum can produce the complementary denominators. The certificates settle the indicated cofactor families and leave unrestricted uniqueness open.
