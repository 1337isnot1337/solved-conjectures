# Alexandersson's parking-function excedance conjecture

**Refuted.** The excedance polynomial for length-17 parking functions has a nonreal root. This directly disproves the real-rootedness assertion of [Alexandersson’s 2026 conjecture](https://www.symmetricfunctions.com/realRootedOpenProblems.htm), which additionally asks for consecutive interlacing. The conjecture concerns the statistic `w_i>i` on the preference word, not the descent statistic or the displacement in the parking process.

## Counting the excedance polynomial

A parking function of length `n` is a word `w=(w_1,…,w_n)` in `[n]` with sorted entries `b_i≤i`. Equivalently, for each `j`, at least `j` entries are at most `j`. Write `P_n(t)=Σ_w t^exc(w)`, where `exc(w)=#{i:w_i>i}`.

We count the coefficient of `u^k` in `P_n(1+u)` by choosing a set of `k` marked excedance positions of each word. No restriction is placed on unmarked positions: those may be excedances too.

Process the distinct possible values `j=1,…,n` in increasing order. Let `F_j(i,k)` count partial objects with `i` processed occurrences, of which `k` are marked. A partial object comprises the marked positions and their values, plus an ordered sequence of all processed unmarked occurrences. The first `j` prefix conditions hold, and a marked occurrence of value `h` has position strictly less than `h`. Before processing any values set `F_0(0,0)=1` and other entries to zero.

When processing `j`, add `r` copies of value `j`, of which `s` are marked. All previously marked positions lie below `j`; hence there are precisely `j−1−k` eligible unused positions for the new marks. Insert the remaining `r−s` identical copies into the list of `i−k` unmarked entries, preserving the order of the old list. These choices are independent and the new object uniquely records both choices. Thus each old state makes the update
```
F_j(i+r,k+s) += F_(j−1)(i,k) * binom(j−1−k,s) * binom(i+r−k−s,r−s)
```
for all `0≤r≤n−i` with `i+r≥j`, and `0≤s≤min(r,j−1−k)`. The unmarked list need not reserve physical positions during processing. At the end, place its entries in order into the complement of the marked position set. This operation is a bijection: its inverse reads the marks and the subsequence in unmarked positions directly from the final marked word.

In particular,
```
P_n(t)=Σ_{k=0}^{n−1} F_n(n,k)(t−1)^k.
```

## An exact rational witness

The coefficient vector of `P_17` in ascending order of degree is
```
355687428096000,       14275291188684965,     220079797544966499,
1742926757301248149,   7868015556095346463,   21067674348334416341,
33787202856242622669,  32220523133498449897,  17905034013658213079,
5600870095867413683,   933784805146283433,    76123471388456123,
2635027764733129,      30185810407651,        69315686247, 9227447, 1.
```
At `x=−1/5` exact substitution gives
```
P_17(x)    = 91206609124952724258816 / 152587890625
P_17'(x)   = 418628039611206843581184 / 30517578125
P_17''(x)  = 2965986324064063916898048 / 1220703125
```
and therefore
```
P_17'(x)^2 − P_17(x) P_17''(x)
  = −1177338341095610033551509654796761547971187113984
     / 931322574615478515625 < 0.
```
If a polynomial `P` has only real roots `r_i`, then at a real nonroot `x`, logarithmic differentiation of its factorization gives
```
P'(x)^2 − P(x)P''(x) = P(x)^2 Σ_i 1/(x−r_i)^2 ≥ 0,
```
with roots counted with multiplicity. Since the displayed `P_17(x)` is nonzero, the strictly negative value is impossible for a real-rooted polynomial. This proves the refutation by exact arithmetic, without relying on approximate zero locations.

The companion [checker](verify.py) implements the recurrence and evaluates the witness with standard-library integer and rational arithmetic. It also independently enumerates small parking words directly. An independent descending-value free-position recurrence and a weighted Ferrers rook count reproduced the same coefficient vector. See [audit and attribution](AUDIT.md).

## Attribution and scope

The [conjecture’s primary source](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) is Per Alexandersson’s open-problem page, under **Words, parking functions and Catalan words**. It states both real-rootedness and consecutive interlacing for the displayed excedance polynomial and records verified evidence through length 12. This refutation addresses the exact real-rootedness claim and does not make any claim about the unrelated Catalan-word peak conjecture, parking-function descent polynomials, or who first found the counterexample.
