# Coupling paths near dyadic multiples for Althöfer’s stochastic Collatz conjecture

Let $H(n)$ be the probability of never hitting 1, extended to even integers by $H(2n)=H(n)$. Althöfer’s €300 Prize 0 asks for a proof that $H(n)=0$ for every positive odd start in the fair-sign chain. The following coupling gives a necessary and sufficient regularity condition for that conclusion. Its verification for $H$ remains open. [Sponsor’s Prize 0](https://althofer.de/collatz-prizes.html) · [Doumas and Papanicolaou, Remark 1](https://arxiv.org/abs/1503.03658) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/220)

## Two starting points whose endpoint distributions approach each other

Write $P^t_x$ for the law after $t$ moves from $x$, with 1 absorbing. Fix $s\in\{-1,1\}$, an integer $a$, a nonnegative integer $b$, and an arbitrary positive integer $n$. Set

```math
x=2^j n+s,\qquad y=2^{j+a}3^b n+s,\qquad
t=\left\lfloor\frac{\min(j,j+a)-1}{2}\right\rfloor,\qquad m=t-b.
```

Whenever $m\ge0$, take $M_m=2^{-m}\binom m{\lfloor m/2\rfloor}$ and let $S_b$ be a sum of $b$ independent uniform choices from $\{1,2\}$. Then

```math
d_{\rm TV}(P_x^t,P_y^m)\le \min\{1,M_m\,\mathbb E|a+S_b|\}.
\tag{1}
```

In particular, one can couple the two paths so that their states at those respective times agree with probability tending to one as $j$ increases, uniformly over $n$. For $a=0,b=1$ the upper bound on failure is $3M_m/2=O(j^{-1/2})$.

**Proof.** For $k\ge3$, the two successors of $2^k c+s$ are exactly $2^{k-1}3c+s$ and $2^{k-2}3c+s$, each with probability one half. Each moving path in (1) has exponent at least three before its last move. Thus the endpoint exponents have laws $j-S_t$ and $j+a-S_m$, with the same multiplier $3^t n$. Write $S_t$ in law as $S_m+S_b'$ with independent blocks. The law of $S_m$ is a translate of a binomial law. For a unimodal integer probability mass function, total variation from its unit translate equals its peak, by telescoping the increasing and decreasing parts. Translation by $u$ costs at most $|u|$ times the peak. Conditioning on $S_b'$ proves (1). Sample a maximal coupling of the endpoint laws and then sample paths conditional on their respective endpoints. This realizes the stated path coupling. The peak tends to zero by the central binomial coefficient estimate.

Consequently (1) bounds $|f(x)-f(y)|$ for every harmonic $f$ with values in $[0,1]$. Indeed the expected terminal value of $f$ after either deterministic number of moves equals its initial value. In this note harmonicity includes the absorbing boundary at 1.

## A necessary and sufficient condition at consecutive integers

For positive $z$ and fixed $s=1$ or $s=-1$, put $D_s(z)=|H(z+s)-H(z)|$ whenever $z+s>0$. The all-start conjecture is equivalent to the following statement, for either fixed sign:

```math
\text{For every positive odd }n,\qquad
\liminf_{j\to\infty}\big(D_s(2^j n)+D_s(2^j3n)\big)=0.
\tag{2}
```

The forward implication holds because every $H$ value then vanishes. For the converse apply (1) with $a=0,b=1$ to the two off-center terms. The triangle inequality and $H(2u)=H(u)$ give

```math
|H(3n)-H(n)|\le D_s(2^j n)+D_s(2^j3n)+\tfrac32M_m.
\tag{3}
```

Equation (2) now gives $H(3n)=H(n)$ for all odd $n$, hence for even $n$ as well. The exact integer recurrence is

```math
2H(2k+1)=H(3k+1)+H(3k+2).
\tag{4}
```

It follows by dividing each numerator $3(2k+1)\pm1$ by two and using the even extension. It also holds for $k=0$ since $H(1)=H(2)=0$. Prove $H(N)=0$ by strong induction. An even $N$ reduces by twofold scaling, and a multiple of three reduces by threefold scaling. For $N=3k+1$ or $3k+2$ with $k\ge1$, the smaller integer $2k+1$ has value zero, and (4) has nonnegative summands. This completes the implication.

In particular, if a positive escape probability exists, its least positive integer argument must be an odd multiple $3n$ of three. This last minimality statement uses only (4) and the even extension. At that argument (3) forces the sum of the two adjacent jumps to be at least $H(3n)-o(1)$ at **every** sufficiently large scale, for each sign. This specifies one obstruction a proof of regularity must exclude. A bound comparing just the two off-center terms establishes (1) and leaves (2) undecided.

## Transferring the comparison to other offsets

For any fixed nonzero odd signed integer $r$, put $s=\mathrm{sgn}(r)$. Let $\tau$ be the hitting time of 1 from $|r|$ in the sponsor’s chain. For every $[0,1]$-valued harmonic $f$, integer horizon $T\ge0$, and sufficiently large $j$, one has

```math
\sup_{n\ge1}|f(2^j n+r)-f(2^j n+s)|
\le \Pr_{|r|}(\tau>T)+B M_{m_0},
\qquad
B=2T+\lceil\log_2 |r|\rceil,\quad
m_0=\lfloor(j-B-1)/2\rfloor-T\ge0.
\tag{5}
```

Run the signed-offset chain from $r$ with the same fair numerator signs as the chain from $2^j n+r$. The absolute offset has exactly the sponsor’s transition law, also for negative $r$, because reflection exchanges the two fair signs. Before the offset hits absolute value one, let $r_k$ be its value and $A_k$ its cumulative number of halvings. For $k\le T$,

```math
2^{A_k}|r_k|\le 4^k|r|,\qquad
X_k=2^{j-A_k}3^k n+r_k .
```

The inequality telescopes $|3u\pm1|\le4|u|$. Thus $A_k\le B$. Since $j>B$, adding the higher power of two leaves the exact halving valuation of the offset unchanged at every move, proving the second identity by induction. The large starting state stays positive throughout.

Stop at $\min(\tau,T)$. On a hit at time $k$, the actual state has offset $s$. Apply (1) with $a=-A_k,b=k$. Its binomial index is at least $m_0$, the peaks $M_m$ are nonincreasing, and both $A_k$ and $S_k$ belong to $[0,B]$. This bounds the difference from $f(2^j n+s)$ by $B M_{m_0}$ on every hitting transcript. On the remaining transcripts the difference is at most one. Bounded stopping for $f$ proves (5). In particular, sending $j$ to infinity and then $T$ to infinity bounds the limiting upper difference by $H(|r|)$. This last conclusion does not assume absorption from the offset.

The checker evaluates the actual two-sign transition trees, compares their exact rational endpoint distributions against (1), and tests the signed-offset identities on every branch of the specified finite samples. The proofs above give the statements at general parameters. [Exact checker](check_dyadic_coupling.py)

```sh
python3 research/althofer-stochastic-collatz/check_dyadic_coupling.py
```
