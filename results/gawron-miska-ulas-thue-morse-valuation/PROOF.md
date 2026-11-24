# Gawron–Miska–Ulas Thue–Morse valuation conjecture

**Result:** The general clause of Conjecture 5.2 is false, with
counterexamples for every exponent $2^k+1$ with $k\ge11$, as well as
a smaller example for exponent 17. Its two explicit formulas for exponents
5 and 9 were proved previously and are not challenged.

Let $T(x)=\prod_{j\ge0}(1-x^{2^j})$ and $t_m(n)=[x^n]T(x)^m$. The
general clause of [Gawron–Miska–Ulas, Conjecture 5.2](https://doi.org/10.1007/s00605-017-1041-2)
asks, for each $k\ge2$, for a strictly increasing sequence $A_{k,v}$
of nonnegative integers with $A_{k,0}=0$ such that
$$
 \nu_2\bigl(t_{2^k+1}(2^k n+j)\bigr)=A_{k,\nu_2(n+1)}
 \qquad(n\ge0, 0\le j<2^k).
$$
In particular, the valuation must be constant on each aligned block.
In fact, for every $k\ge11$, writing $m=2^k+1$ and
$N=25\cdot2^{k-3}=3\cdot2^k+2^{k-3}$, we have
$$
 \nu_2(t_m(N-1))=11,\qquad \nu_2(t_m(N))=10.
$$
Both indices belong to the block $n=3$, which proves the disproof for
unbounded exponents.

## Exact base coefficients

Expand the formal identity $T(x)^m=(1-x)^mT(x^2)^m$. With $t_m(0)=1$,
for $n\ge1$ it gives
$$
 t_m(n)=
 \sum_{\substack{0\le i\le\min(m,n)\\i\equiv n\pmod2}}
 (-1)^i\binom mi t_m((n-i)/2).
$$
Every index on the right is below $n$, so this is an exact forward
recursion, also valid modulo any positive integer. The companion
`check.py` verifies
$$
 t_{2049}(6399)\equiv2048,\qquad t_{2049}(6400)\equiv3072
 \pmod{4096}.
$$
It also verifies both residues by independent truncated product expansion.
These imply the valuations 11 and 10 respectively in the base case
$k=11$. The same recurrence and product expansion over the integers
give the smaller disproof ($k=4,n=31,j=7,8$):
$$
 \begin{aligned}
 t_{17}(503)&=-382073745322860227067904,& \nu_2&=18,\\
 t_{17}(504)&=-98392455150140920430592,& \nu_2&=19.
 \end{aligned}
$$

## Lifting to all $k\ge11$

Put $s=k-11$. In $\mathbb Z[[x]]$, reduction modulo 2 gives
$T(x)^{2^s}\equiv T(x^{2^s})\pmod2$. If two integral series are
congruent modulo $2^b$ with $b\ge1$, their sum is even and their
difference is divisible by $2^b$, so their squares agree modulo
$2^{b+1}$. Squaring eleven times yields
$$
 T(x)^{2^k}\equiv T(x^{2^s})^{2048}\pmod{4096}.
$$
Also $T(x)=T_{<s}(x)T(x^{2^s})$, where $T_{<s}$ is the finite product
over $0\le i<s$. Its degree is $2^s-1$, and its coefficient at every
$0\le r<2^s$ is $(-1)^{s_2(r)}$, since binary digit expansions are
unique. Therefore
$$
 t_{2^k+1}(2^s u+r)\equiv(-1)^{s_2(r)} t_{2049}(u)\pmod{4096}.
$$
Apply this to $N=6400\cdot2^s$ and
$N-1=6399\cdot2^s+(2^s-1)$. The signs do not change either valuation,
and the precision $2^{12}$ is sufficient because both valuations are
less than 12.

## Attribution and status

- The original statement is [arXiv:1703.01955, §5, Conjecture 5.2](https://arxiv.org/pdf/1703.01955#page=30),
  published in *Monatshefte für Mathematik* 185 (2018), 307–360.
  The two named explicit formulas and the all-$k$ clause are in
  the same numbered conjecture, not separate counts.
- [Shen and Wang, arXiv:2606.28718 (June 2026), Theorems 2–3](https://arxiv.org/html/2606.28718v1)
  prove both explicit $m=5,9$ formulas and describe the general case
  as open. [Shen, arXiv:2609.16966 (September 2026)](https://arxiv.org/html/2609.16966v1)
  treats other (even) exponents, not the family here.
- [Yu and Wang, arXiv:2606.25825](https://arxiv.org/abs/2606.25825)
  prove the distinct conjecture on unbounded coefficient magnitudes,
  not the valuation conjecture. Searches by authors, conjecture number,
  the exponent 17, the witness indices, and Thue–Morse valuation
  counterexamples found no earlier disproof of the general clause.
  Priority is provisional, not a claim of exhaustive absence.
