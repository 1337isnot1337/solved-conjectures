# Althöfer’s stochastic Collatz conjecture

Start from any positive odd integer. At each step independently choose the odd part of either $3n-1$ or $3n+1$ with equal probability. Althöfer offers €300 for the first proof that the chain reaches 1 almost surely from every start, with payment to the winner. The earlier paper *A Randomized Version of the Collatz 3x+1 Problem* explicitly leaves this sign law open in Remark 1. [Sponsor, Prize 0](https://althofer.de/collatz-prizes.html) · [Remark 1](https://arxiv.org/abs/1503.03658) · [Issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220)

## Almost-sure return to the two residue classes with an extra halving

Let $G$ be the positive integers congruent to 3 or 5 modulo 8. From every positive odd start $n>1$ outside $G$, the chain hits $G$ almost surely. Its expected hitting time is at most

```math
\frac{2\log_2(n+1)}{3(1-\tfrac12\log_2 3)}.
```

Moreover, on nonabsorption the chain visits $G$ infinitely often almost surely. This leaves open whether its visits have enough frequency to imply absorption.

**One excursion.** Write $n=s+2^t u$, with $s\in\{-1,1\}$ chosen so that $n\equiv s\pmod4$. Then $u$ is positive and odd, and $t\ge3$ outside $G$. Set $d=t-2$. While the remaining exponent is at least 3, the two images are exactly

```math
s+3\cdot 2^{t-1}u,\qquad s+3\cdot 2^{t-2}u.
```

Indeed $3s-s=2s$ and $3s+s=4s$, and the displayed quotients are odd. Take independent fair increments $J_i\in\{1,2\}$, write $S_j=\sum_{i=1}^jJ_i$, and stop at $T=\min\{j:S_j\ge d\}$. The endpoint is $Y=s+2^{t-S_T}3^T u$. If $S_T=d$, it belongs to $G$. An overshoot $S_T=d+1$ may also land in $G$. Both endpoints exceed 1.

The exact-hit probability $p_d$ satisfies $p_{-1}=0$, $p_0=1$ and $p_d=(p_{d-1}+p_{d-2})/2$. Therefore

```math
p_d=\tfrac23+\tfrac13(-\tfrac12)^d,\qquad
\mathbb E T=\tfrac23(d+1-p_d).
```

The second identity follows from $\mathbb E S_T=(3/2)\mathbb E T$ since $T\le d$. In particular $p_d\ge1/2$. Restart a phase after every missed visit. Conditional on each new starting point the miss probability is at most $1/2$, so the probability that more than $j$ phases are needed is at most $2^{-j}$.

For the time estimate write $H(n)=\log_2(n+1)$. We have $t\le H(n)$, and every signed move satisfies $H(n')\le H(n)+\log_2(3/2)$. A phase takes at most $t-2$ moves. Consequently its terminal height is at most $(\log_2 3)H(n)$ and its mean duration is at most $2H(n)/3$. Sum the contributions of the successive phases, combining the deterministic height bound with the geometric survival bound. This gives the stated expectation. After every visit to $G$, either the next state is 1, is already in $G$, or returns to $G$ almost surely by the preceding proof.

**Why fixed time horizons miss the difficulty.** The same stopping identity gives the exact mean log growth relative to $s$ during a phase:

```math
\mathbb E\log_2\frac{Y-s}{n-s}
  =\bigl(\tfrac23\log_2 3-1\bigr)(d+1-p_d)>0.
```

More generally, fix a time horizon $h$ and any correction $b$ that depends only on the odd residue modulo $2^m$. Take $n=1+2^t u$ with $t\ge 2h+\max(3,m)$ and let odd $u$ grow. Every possible state up to time $h$ stays congruent to 1 modulo $2^m$. The mean change of $\log_2(n)+b(n)$ over those $h$ steps tends to $h(\log_2 3-3/2)>0$, since $n_h-1=(n-1)3^h2^{-S_h}$. This rules out uniformly negative drift outside a finite set for that entire class of certificates.

## A necessary occupation bound for escape

Let $e(n)=\max(v_2(3n-1),v_2(3n+1))-2$ and $w_L(n)=\min(L,e(n))$ for a fixed integer $L\ge1$. One choice has valuation 1 and the other has valuation $2+e(n)$. If $B_j$ indicates selection of the higher valuation on step $j$ from $N_j$, its conditional mean is $1/2$. On nonabsorption, almost surely,

```math
\limsup_{m\to\infty}\frac1m\sum_{j<m}w_L(N_j)
\ \le\ 2\log_2 3-3=0.169925\ldots .
```

First, nonabsorption forces $N_j\to\infty$ almost surely. A choice with at least two halvings strictly decreases every state larger than 1. From any state in a fixed finite interval a uniformly bounded run of these choices reaches 1 with uniformly positive probability. Repeated visits, taking trials separated by that many steps, therefore force absorption almost surely.

The valuation on step $j$ is at least $1+B_j(1+w_L(N_j))$. The bounded martingale differences $(B_j-1/2)(1+w_L(N_j))$ have mean tending to zero in their Cesàro sums almost surely, by Azuma’s inequality and Borel–Cantelli. In the logarithmic increment of $N_j$, the additive error from replacing $3N_j\pm1$ by $3N_j$ tends to zero on escape. Sum the increments, divide by $m$, and use $\log_2 N_m\ge0$ to obtain the inequality. For $L=1$, the weight is exactly the indicator of $G$. Thus escape requires infinitely many visits to $G$ but upper visit frequency at most about 17%. The return theorem gives no contradictory lower frequency.

The accompanying checker compares the stopped excursion formulas with the literal two-sign transition tree in exact rational arithmetic. The arguments above cover unbounded depth. [Checker](verify.py)

An [asynchronous path coupling](dyadic-coupling.md) bounds the difference in escape probabilities at corresponding neighbors of dyadic multiples of $n$ and $3n$. It makes all-start absorption equivalent to a condition on adjacent jumps in those probabilities and gives a quantitative transfer to other offsets.

The [recovery-window theorem](recovery-window.md) proves that the mean log-base-two growth per move converges in probability to $\log_2 3-2$, and the fraction of visits to the extra-halving classes converges to one half, during a growing window after a long phase. The estimate is uniform over its initial odd coefficient and applies to both exit types.
