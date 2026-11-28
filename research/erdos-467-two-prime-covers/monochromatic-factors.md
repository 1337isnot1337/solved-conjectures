# The minimum number of integers with monochromatic prime factors

Write $U=\log_2 X/\log_3 X$, where the logarithms are iterated. Partition all primes up to $X$ into two sets $R,B$, with no regularity assumption. For a prime set $P$ write $\Psi(X;P)$ for the number of positive integers up to $X$ whose prime divisors all belong to $P$. The integer one is included.

**Theorem.** As $X\to\infty$,
```math
 \min_{R,B}\bigl(\Psi(X;R)+\Psi(X;B)\bigr)
 \asymp \frac{X}{\log X}\,U .
```
The partition may depend on $X$. This determines the order of the number of missing colour hits when both colours start with the zero residue in [Erdős problem 467](https://www.erdosproblems.com/467).

## Lower bound

For each colour put $W_P=\prod_{p\in P}(1-1/p)^{-1}$. We use [Matomäki and Shao, *When the sieve works II*, Theorem 1.1](https://arxiv.org/abs/1509.02371) with their $u=1$ and $\epsilon=1/2$. In the range used below, if
```math
 \sum_{p\in P,\; X^{1/v}\lt p\le X}\frac1p\ge 3/2,
```
then
```math
 \Psi(X;P)\ge A_v X\prod_{p\le X,\;p\notin P}(1-1/p)
 \gg A_v\frac{X}{\log X}W_P .
```
The last inequality uses Mertens' theorem. The source allows $v$ up to a constant times $\log X/\log_2 X$ and gives $A_v\ge v^{-2v}$ for all sufficiently large $v$.

Take $v_0=e^4$. The reciprocal sum over all primes in $(X^{1/v_0},X]$ is $4+o(1)$, so some colour meets the hypothesis with $v_0$. If both $W_R,W_B\ge e^{-3}U/8$, this proves the lower bound.

Otherwise let $S$ be a colour with $W_S<e^{-3}U/8$, let $P$ be the other colour, and put $v=U/8$. Since $\sum_{p\in S}1/p\le\log W_S$, Mertens' theorem gives
```math
 \sum_{p\in P,\;X^{1/v}\lt p\le X}\frac1p
 \ge \log v+o(1)-\log W_S\ge 3+o(1).
```
The error is uniform since $X^{1/v}$ tends to infinity. In this case the first form of the sieve bound gives $\Psi(X;P)\ge Xv^{-2v}/W_S$. As $2v\log v=(1/4+o(1))\log_2 X$, this exceeds $XU/\log X$ for large $X$. The cases exhaust all partitions.

## Upper bound

Use all primes up to $z=X^{1/(3U)}$ for one colour and all larger primes for the other. The first count is at most $X(\log X)^{-3+o(1)}$ by the smooth-number estimate in the [cover construction](smooth-split.md). The second is the number of integers without a prime factor up to $z$, which is $O(X/\log z)=O(XU/\log X)$ by the elementary upper-bound sieve. For instance the fundamental lemma applies with level $X^{1/2}$ since $\log(X^{1/2})/\log z\to\infty$. [Ford, *Sieve Methods*](https://ford126.web.illinois.edu/sieve2023.pdf)

## A consequence for arbitrary translated zero classes

Suppose the target is $[1,X]$ and each colour $C$ initially assigns the class of a common integer $b_C\in[1,X]$ at all its primes. The centres can differ and both may depend on $X$. From each centre one side of the interval realizes every absolute distance up to $Y=\lfloor(X-1)/2\rfloor$. The number of initially missing red hits is at least $\Psi(Y;B)$, and similarly for blue. Primes above $Y$ do not divide those positive distances. Applying the theorem at $Y$ shows that these assignments leave at least $cXU/\log X$ missing colour hits.

If residues are then changed only at primes $p>X/D$, with $2\le D\le\sqrt X$, their combined new coverage is at most
```math
 \sum_{X/D\lt p\le X}(1+X/p)\ll \frac{X(1+\log D)}{\log X}.
```
For the reciprocal sum, dyadically split the range and use the prime-counting upper bound on each piece, where $\log p\ge(\log X)/2$. In particular such changes cannot complete both covers when $\log D=o(U)$. This applies to every choice of colours and both initial centres. The unrestricted problem allows changes at smaller primes and allows residue patterns with no centre inside the target interval.

## Finite auxiliary switches and the proposed two-fold construction

The same obstruction survives arbitrary changes at every prime of any fixed finite set $F$, in addition to the changes above $X/D$. For a particular colouring and initial centres, let $W$ be the product of the primes in $F$ whose actual residue differs from their own colour's initial class. Take $W=1$ if that set is empty. For each missing colour $C$ individually, test points
```math
 n=b_C\pm Wm,\qquad 1\le m\le Y=\lfloor(X-1)/(2W)\rfloor ,
```
choosing a single sign that stays in the interval. Every changed auxiliary prime of colour $C$ misses every test point. An unchanged prime of colour $C$ divides $n-b_C$ exactly when it divides $m$, since it does not divide $W$. Ignoring the changes above $X/D$ for the moment, the red and blue misses are therefore bounded below by the opposite-colour semigroup counts at $Y$. Sum the two bounds and apply the theorem. As $W$ is bounded in terms of $F$, there are still $\gg_F XU/\log X$ colour deficits. The upper bound on new hits above $X/D$ is independent of $F$.

This also covers initial centres $b_C=0$ at the endpoint just outside $[1,X]$, using the positive sign. The [April 2026 working manuscript on problem 689](https://www.ulam.ai/research/erdos689.pdf) gives zero classes except at a fixed finite list of auxiliary primes and at primes above $\tau X$ for a fixed $\tau>0$ (Sections 2, 3 and the final assignment). Consequently **no red–blue colouring of the resulting primes can make that residue system a witness for 467** once $X$ is sufficiently large. This deduction uses only the locations of the switches and is independent of the manuscript's two-fold covering claim.
