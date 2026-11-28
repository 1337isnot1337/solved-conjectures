# Erdős–Sárközy–Sós conjecture: lattice and autocorrelation constraints

Research checkpoint for [issue #783](https://github.com/1337isnot1337/solved-conjectures/issues/783). The target is [Problem 2, p. 345 of the original paper](https://real.mtak.hu/110604/1/1-s2.0-S0022314X84710407-main.pdf#page=17), also [Erdős Problem 153](https://www.erdosproblems.com/153). This extends the [weak-profile obstruction](PROFILES.md), not the full conjecture. The finite identity below is an elementary convolution rearrangement already used at shifts 1, 2, and 3 by [Tsoukalas et al., the proof of Erdős 152](https://arxiv.org/abs/2605.22763). Here it gives a localized spacing-energy constraint with integer gap costs and residue-sensitive inequalities.

## Statement

Suppose a family of integer Sidon sets $`A_n`$, with $`|A_n|=n`$, has mean square gap $`Q_n\to Q<\infty`$ in $`S_n=A_n+A_n`$. Translate $`\min A_n`$ to zero. Pass to a subsequence for which $`\max A_n/n^2\to\kappa`$ and the empirical measures of $`A_n/n^2`$ converge weakly to $`f(x)\,dx`$. By the earlier argument, $`f`$ is supported in $`[0,\kappa]`$, has mass one and satisfies $`\|f\|_2^2\le1`$. Put $`r=(f*f)/2`$, so $`0\le r\le 1/2`$.

Let $`\Psi`$ be the continuous piecewise-linear interpolation of $`k\mapsto k^2`$ at integers $`k\ge2`$. There is a measurable density $`a`$, with $`0\le a\le r`$, such that
```math
 Q\ge 2\int_0^{2\kappa}
 \left[a(x)+(r(x)-a(x))\Psi\left(\frac{1-a(x)}{r(x)-a(x)}\right)\right]\,dx. \tag{1}
```
Interpret the bracket as $`+\infty`$ if $`r=a`$. The density $`a`$ describes where the gaps of length one start. For every interval $`I\subseteq[0,\kappa]`$, let $`f_I=f\mathbf1_I`$. The same $`a`$ satisfies
```math
 \int_{2I} a(x)\,dx\ge \frac14\int_{\mathbb R}
       (2(f_I*\check f_I)(u)-1)_+\,du , \tag{2}
```
where $`2I=\{2x:x\in I\}`$, $`\check f_I(u)=f_I(-u)`$, and $`y_+=\max(y,0)`$.

For any fixed modulus $`q`$, pass to limits $`f_b`$ of the empirical measures restricted to $`A_n\cap(b\bmod q)`$, preserving normalization $`1/n`$. A single subsequence works for all positive integer $`q`$, and $`\sum_b f_b=f`$ for each $`q`$. Write $`f_{I,b}=f_b\mathbf1_I`$ and
```math
 w_{I,b}=\sum_{c\bmod q} f_{I,c}*\check f_{I,c-b}.
```
Then $`w_{I,b}\le1/q`$ and
```math
 \int_{2I}a(x)\,dx\ge \frac14\sum_{b\bmod q}\int_{\mathbb R}
        (w_{I,b}(u)+w_{I,b+1}(u)-1/q)_+\,du. \tag{3}
```
The same overlap bound at shift $`h\ge1`$, with $`b+h`$ instead of $`b+1`$, bounds the count of pairs of sums from $`(A_n\cap n^2 I)+(A_n\cap n^2 I)`$ separated by $`h`$; those need not be consecutive if $`h>1`$.

## Exact finite relationship

For a finite Sidon set $`B`$, let $`m=|B|`$, $`S=B+B`$, $`T=\{2b:b\in B\}`$, and $`D=\{b-b':b,b'\in B,\ b\ne b'\}`$, with both signs. The ordered sum and difference counts are $`R_+=2\mathbf1_S-\mathbf1_T`$ and $`R_-=\mathbf1_D+m\mathbf1_{\{0\}}`$. For $`h>0`$,
```math
 \sum_s R_+(s)R_+(s+h)=\sum_u R_-(u)R_-(u+h).
```
Indeed $`c+d=a+b+h`$ is equivalent to $`(c-a)-(b-d)=h`$. Putting $`P_h=\#\{s\in S:s+h\in S\}`$ and expanding gives
```math
 4P_h=|D\cap(D-h)|+2m\,\mathbf1_D(h)
       +2|S\cap(T-h)|+2|T\cap(S-h)|-|T\cap(T-h)|.
```
In particular $`4P_h\ge |D\cap(D-h)|`$ since $`T\subseteq S`$, and the excess is $`O(m)`$ uniformly in $`h`$. For $`h=1`$ these pairs are always actual gaps of length one, even after inserting other integer sums.

## Transfer from differences to local sum gaps

Apply the identity to $`B=A_n\cap n^2 I`$ without renormalizing by $`|B|`$. Each restricted empirical measure converges to $`f_{I,b}\,dx`$, since the limiting measures are dominated by $`f(x)\,dx`$ and have no atoms. The measure $`n^{-2}\sum_{d\in D,\ d\equiv b\bmod q}\delta_{d/n^2}`$ converges weakly to $`w_{I,b}(u)\,du`$: use weak convergence of convolutions and remove the diagonal of total mass $`|B|/n^2`$. The number of admissible lattice sites in a fixed scaled interval $`J`$ is $`n^2|J|/q+O(1)`$, proving $`w_{I,b}\le1/q`$.

On those sites in $`n^2J`$ the populations from $`D`$ and $`D-h`$, divided by $`n^2`$, approach $`\int_J w_{I,b}`$ and $`\int_J w_{I,b+h}`$. Shifting the endpoints changes counts by only $`O(h+1)`$ sites. Inclusion–exclusion and nonnegativity give a liminf for the normalized overlap of at least
```math
 \left(\int_J (w_{I,b}+w_{I,b+h}-1/q)\right)_+.
```
Sum over a finite partition of the difference span and over residues. Refine the partition. The functions are continuous by translation continuity in $`L^2`$, so the lower bound tends to the integral of the positive part. At $`h=1`$ the finite identity transfers these pairs to gap starts in $`2I`$. The gap-start limits assign zero mass to the two endpoints of $`2I`$, since they are dominated by the limit of the sumset counting measures. This proves (3) and its $`q=1`$ specialization. Because the same weak limits work for every interval with null boundaries, there is no interval-dependent subsequence.

## Gap cost with fixed count of unit gaps

For each $`d_i=s_{i+1}-s_i`$, place masses $`1/n^2`$, $`\mathbf1_{d_i=1}/n^2`$, and $`d_i^2/n^2`$ at $`s_i/n^2`$, obtaining the count, unit-count and energy measures. The count measure tends to $`r(x)\,dx`$ by the diagonal estimate in the [weak-profile argument](PROFILES.md). Extract weak limits $`a(x)\,dx\le r(x)\,dx`$ and $`\mathcal E`$ of the other two measures. Their supports are uniformly compact and $`\mathcal E(\mathbb R)=Q/2`$. This extraction can be combined with the countably many residue extractions.

On a closed interval $`J`$ strictly inside $`(0,2\kappa)`$ whose endpoints have zero $`\mathcal E`$ mass, the total normalized length of the gaps starting in $`J`$ tends to $`|J|`$. These gaps tile $`J`$ up to endpoint errors; the maximum normalized gap is $`O(1/n)`$ under bounded $`Q_n`$. Unit gaps account for length and count both equal in the limit to $`\int_J a`$. Remaining gaps have integer length at least two and limiting count $`\int_J(r-a)`$. Jensen's inequality for $`\Psi`$ at those integer lengths gives
```math
 \mathcal E(J)\ge \int_J a+
       \left(\int_J(r-a)\right)
       \Psi\left(\frac{|J|-\int_J a}{\int_J(r-a)}\right).
```
If the denominator tends to zero, $`\Psi(z)\ge z^2`$ and the numerator remains at least $`|J|/2`$, contradicting finiteness. At Lebesgue points divide by $`|J|`$ and shrink $`J`$ along intervals with null endpoints. Differentiation gives the integrand in (1) as a lower bound on the density of the absolutely continuous part of $`\mathcal E`$. Its singular part can only add energy.

Even at $`a=0`$, $`\Psi`$ differs from the square function used in the earlier bound. Forcing $`a>0`$ cannot lower the bound: the bracket is the minimum second moment of a measure on positive integers with prescribed mass and first moment, and prescribed mass at 1. The unconstrained polygonal minimum uses integers at least two because $`r\le1/2`$. In particular conditioning on all unit gaps at once gives
```math
 Q\ge u+\frac{(4\kappa-u)^2}{1-u},\qquad
 u=\frac12\int_{\mathbb R}(2(f*\check f)(x)-1)_+\,dx.
```
The actual limiting fraction of unit gaps is at least $`u`$ and at most $`1/2`$ (by the finite identity, $`4P_1\le n(n-1)+O(n)`$). The mean gap tends to $`4\kappa`$. By Cauchy–Schwarz the displayed expression with the actual fraction is a lower bound, and it increases in that fraction: it is $`(4\kappa)^2+u(4\kappa-1)^2/(1-u)`$. If $`\|f\|_2^2>1/2`$, continuity gives $`u>0`$.

## What this leaves open

A profile with autocorrelation everywhere at most $`1/2`$ does not force any unit gaps through (2); the continuous cusp example is not ruled out. This does not show that any such profile is realized by a Sidon family. The next question is whether simultaneous overlap or void statistics at several shifts impose additional constraints. No discrete bounded-energy example or divergence claim follows from this checkpoint.
