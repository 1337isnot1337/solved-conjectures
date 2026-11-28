# Exact branching at dyadic targets

For the rational target $1$, the following are equivalent:

1. There are continuum many infinite subsets of the positive integers whose $j/2^j$ terms sum to one.
2. The integer sequence $v_0=0$, $v_k=|2v_{k-1}-k|$ returns to zero infinitely often.
3. For infinitely many $n$ a signed sum of the following form vanishes.

```math
\sum_{j=1}^n \sigma_j j2^{n-j}=0,\qquad \sigma_j\in\{-1,1\}.
```

Thus a sufficient condition for the continuum assertion of [Erdős #261](https://www.erdosproblems.com/261) is a recurrence question for one explicitly specified sequence. Infinitely many returns are unproved. Borwein and Loring's Algorithm 3 already enumerates possible expansions by permitting non-greedy steps. The point here is that at a dyadic target every continuing branch has the same folded trajectory once its starting residual is integral. [Borwein–Loring, §3](https://www.cecm.sfu.ca/~pborwein/PAPERS/P46.pdf)

## Folding the residual

For a prefix of digits $e_j$ representing a target $x$, put
```math
 R_n=2^n\left(x-\sum_{j=1}^n j e_j2^{-j}\right),\qquad T_n=n+2 .
```
The remaining tail fills $[0,T_n]$ on this scale. Indeed the allowed intervals at the next digit cover the entire current interval, because the sum of the terms after that digit exceeds the digit's weight. Repeatedly select an allowed digit; the unscaled residual is at most $(n+2)2^{-n}$ and tends to zero. The endpoints have unique constant continuations.

The residuals $R_n$ and $T_n-R_n$ have complementary future digits. Write $v_n=|T_n-2R_n|$ to identify them. Immediately before digit $k$, choose the representative $R_{k-1}=(k+1-v_{k-1})/2$. Digit zero gives residual $k+1-v_{k-1}$ and folded value $|2v_{k-1}-k|$. Digit one is also feasible exactly when $v_{k-1}\le1$; then its residual is $1-v_{k-1}$. For an integral residual there are only two cases of ambiguity.

* If $v_{k-1}=0$, the two digits give complementary interior residuals, both with folded value $k$. Both continue.
* If $v_{k-1}=1$, the additional digit gives an endpoint, hence has just one constant continuation. The other digit continues in the interior.

At $x=1$ the initial residual is integral and centered. The continuing trajectory stays in the interior by the formula for digit zero above. Every zero offers a fresh binary choice with identical subsequent folded values. Infinitely many zeros therefore embed all infinite binary sequences into the representations; none of these chosen paths is eventually constant. With finitely many zeros there are only finitely many paths staying in the interior, plus at most countably many paths that leave at an endpoint. This proves the equivalence of 1 and 2. For a general dyadic target, one takes the finite set of interior residuals after clearing its denominator and applies the same test to each.

A balanced signed prefix at $n$ chooses exactly half the total weight of the first $n$ terms. It extends to a representation of $1$ since the remaining residual is $T_n/2$. No earlier endpoint can lie on such a path, so its folded trajectory has $v_n=0$. Conversely any return to zero gives exactly such a balanced prefix. This proves the third equivalence. Every positive return also has $n\equiv2\pmod4$, by $v_j\equiv j\pmod2$ and $2v_{n-1}=n$.

As a finite check, the positive returns through $10^9$, computed directly from the integer recurrence, are
```text
2, 78, 234, 430, 1502, 2942, 6058, 6618, 18910, 54222, 302467994.
```
The long gap after 54,222 gives one reason that a finite enumeration cannot settle recurrence.
