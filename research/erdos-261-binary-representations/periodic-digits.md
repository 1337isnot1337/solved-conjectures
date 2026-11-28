# No eventually periodic weighted binary representation of one third

Borwein and Loring reported that they had not excluded an eventually periodic weighted binary representation of $1/3$, after examining its first million canonical digits. In fact **every** representation of $1/3$ by binary digits $e_n$ in $\sum_{n\ge1}n e_n2^{-n}$ is aperiodic. The same holds for every non-dyadic rational whose reduced denominator has squarefree odd part. This answers the periodicity possibility they describe on p. 391. The two remaining assertions in [Erdős #261](https://www.erdosproblems.com/261), concerning finite sums and continuum multiplicity, are separate. [Original paper](https://www.cecm.sfu.ca/~pborwein/PAPERS/P46.pdf)

Suppose the digits after position $N$ are periodic, of least period $d$, with one period $e_1',\ldots,e_d'$. Put
```math
 J=2^d-1,\qquad A=\sum_{j=1}^d e_j'2^{d-j},\qquad B=\sum_{j=1}^d j e_j'2^{d-j}.
```
If the tail is nonconstant, reduce the ordinary unweighted binary value $A/J=a/s$, with $s>1$ odd. Its least period is $d=\mathrm{ord}_s(2)$ by the usual remainder algorithm. Summing the geometric series and its derivative, the contribution of the tail after multiplication by $2^N$ equals
```math
 N\frac as+\frac BJ+\frac{d a}{sJ}
 =\frac{N aJ+sB+d a}{sJ}.
```
The prefix contributes an integer at that scale. Consequently, whenever $p^e$ exactly divides $s$ and $v_p(d)<e$, the odd denominator of the represented number has
```math
 v_p(\mathrm{denominator})=v_p(J)+e-v_p(d)\ge e+1.
```
Indeed the first two numerator terms are divisible by $p^e$, and the last term has valuation exactly $v_p(d)$.

Apply this with $p$ the largest prime factor of $s$. The order $d$ divides the least common multiple of the numbers $r^{f-1}(r-1)$ over the prime powers exactly dividing $s$. For $r<p$ none contributes a factor $p$, and the contribution from $r=p$ has valuation $e-1$. Thus $v_p(d)\le e-1$, so $p^2$ divides the denominator. Constant tails, including the all-ones tail, give dyadic values by the elementary tail-sum formula. This proves the claimed aperiodicity.

There are also only finitely many possible least periods of nonconstant tails for each prescribed reduced denominator $Q$. For each prime power $p^e$ exactly dividing $s$, either $p^{e+1}\mid Q$ as above, or $p^e\mid d$. In the latter case some larger prime factor $r$ of $s$ satisfies $p^e\mid r-1$, by the same least-common-multiple argument. The largest prime factor of $s$ is at most $Q$, and hence every prime power exactly dividing $s$ is at most $Q$. Therefore $s$ divides $\mathrm{lcm}(1,\ldots,Q)$ and $d=\mathrm{ord}_s(2)$ is chosen from an effective finite list. No bound on the preperiod is used.

Wang previously obtained the weaker divisibility $s\mid Qd$ from the periodic-tail formula and used $d=\mathrm{ord}_s(2)$ to bound the density of ones in a periodic mask. The valuation above uses the full denominator $sJ$, retaining information beyond that congruence. [Wang, first version, Proposition 7.2](https://arxiv.org/pdf/2606.24972v1)
