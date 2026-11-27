# Counting only odd represented integers

Let $`A(x)`$ count the classical Ulam numbers through $`x`$, let $`A_o(x)`$ count the odd ones and let $`H_o(x)`$ count odd integers through $`x`$ with at least two unordered representations by distinct Ulam terms. Put $`W(x)=A_o(x)+H_o(x)`$. This counts the odd seed 1 and every represented odd integer through $`x`$.

## A sufficient bound at record lows

For $`x\ge4`$ put $`m=\lfloor x/2\rfloor`$. Partition $`P=\{0\}\cup(U\cap[1,m])`$ into its even part $`E`$ and odd part $`O`$, of sizes $`e`$ and $`o`$. In particular $`e`$ includes zero. Set

```math
q(x)=\frac{W(x)}{\sqrt{eo}},\qquad D(K)=(32K)^{12K^2}.
```

**Proposition.** At every such $`x`$ one has

```math
\frac{A(x)}{x}\ \ge\ \frac{1}{4D(q(x)^2+q(x)/2)}.
```

Consequently a bounded $`q(x)`$ along infinitely many integer record lows of $`A(x)/x`$ would imply positive lower natural density. If there are only finitely many records, their last value is already a positive lower bound. The proposition uses only odd targets in its numerator.

**Proof.** Write $`s=|E+O|`$. Each sum with a positive even summand is an actual distinct-summand representation. A sum using zero is an odd term. All sums are at most $`2m`$, so $`s\le W(x)`$. Plünnecke's inequality gives $`|E+E|\le s^2/o`$ and $`|O+O|\le s^2/e`$. For the first bound apply the inequality to base set $`O`$ and summand set $`E`$. Some nonempty $`T\subseteq O`$ satisfies $`|T+E+E|\le(s/o)^2|T|`$, and this sumset contains a translate of $`E+E`$. Exchange the two sets for the second bound. [Petridis, Theorem 1.1](https://arxiv.org/pdf/1101.3507)

The doubling constant of $`P`$ therefore satisfies

```math
K=\frac{|P+P|}{e+o}
\le \frac{s}{e+o}+\frac{s^2}{eo}
\le q(x)/2+q(x)^2.
```

For $`k=A(m)`$, the rectification argument for the classical prefix gives $`u_k+1\le(k+1)D(K)`$. The sum of the last two prefix terms is uniquely represented within that prefix. Hence $`m<u_{k+1}\le u_k+u_{k-1}<2u_k`$. This gives both $`A(x)\ge k+1`$ and $`x<4(u_k+1)`$. Combining the inequalities proves the proposition. [Prefix rectification](sumset-doubling.md)

At an integer record $`A(x)\le2A(m)+1`$. Thus, if both parities occupy at least a fixed positive fraction of $`P`$ there, an estimate $`H_o(x)=O(A(x))`$ suffices. The same proof allows any balanced partition of $`P`$ if one can bound the number of distinct sums crossing that partition. Parity identifies those sums using a count on odd integers alone. [Record-low argument](record-lows.md)

| $`x`$ | $`e`$ at half scale | $`o`$ at half scale | $`A_o(x)`$ | $`H_o(x)`$ |
|---:|---:|---:|---:|---:|
| 65,536 | 1,260 | 1,302 | 2,523 | 24,265 |
| 582,954 | 10,934 | 10,770 | 21,429 | 215,708 |
| 1,722,075 | 32,138 | 31,644 | 63,330 | 636,967 |
| 16,777,216 | 311,507 | 309,789 | 619,584 | 6,206,674 |

The [exact verifier](record_lows.cpp) compares $`W(x)^2`$ with integer multiples of $`eo`$. At every integer density record with $`4\le x\le16{,}777{,}216`$ it finds $`q(x)\le22`$. The first record with a ratio above 21 occurs at 82,157. An estimate on unbounded record scales remains open, as does convergence.

## What happens if one parity ends

If there are finitely many even Ulam terms, the known finite recurrence gives an eventually periodic tail of positive natural density. Indeed each odd decision depends only on odd membership at offsets from the finite set of even terms. Its finite string of previous bits evolves deterministically and the ultimate period contains a term because the Ulam sequence is infinite. [Schmerl, introduction](https://www.fq.math.ca/Scanned/38-3/schmerl.pdf)

If there are finitely many odd terms with largest value $`M`$, each sufficiently large even term $`v`$ gives a missing odd integer $`v+1`$. It has the representation $`v+1`$ by the summands $`v`$ and 1. Its second pair has an odd summand $`a\ge3`$, so its even summand $`v+1-a`$ is earlier and at least $`v+1-M`$. The gap preceding each large term is therefore at most $`M-1`$ and the lower density is at least $`1/(M-1)`$. In particular, zero lower density for the actual sequence would require infinitely many terms of **each** parity.

## An exact odd recurrence with zero density

The even decisions play an independent role. Consider

```math
B=\{2^j-1,2^j:j\ge1\}=\{1,2,3,4,7,8,15,16,\ldots\}.
```

Every selected nonseed has exactly one unordered distinct-summand representation. Every odd integer beyond the seed belongs to $`B`$ precisely when it has exactly one such representation. Yet $`B`$ has only $`2\log_2 x+O(1)`$ terms through $`x`$, with the two parity counts differing by at most one.

To see this, write $`w(t)`$ for the number of ones in the binary expansion of $`t`$. Every odd sum $`2h+1`$ uses an even power and a power minus one. Its representation count is the number of **ordered** solutions of $`2^i+2^j=h+1`$ for $`i,j\ge0`$. For $`h\ge1`$ that count is one when $`w(h+1)=1`$, two when $`w(h+1)=2`$, and zero otherwise. The order specifies which power supplies the even summand, so the diagonal is allowed.

An even target $`2h`$ has the exact count

```math
r_B(2h)=\mathbf1_{w(h)=2}+\mathbf1_{w(h+1)=2}.
```

The first term uses two distinct powers of two and the second uses two distinct powers minus one. In particular every selected even integer at least 4 has count one. The first missing compulsory even is 6. More generally take $`h=2^i+2^j`$ with $`2\le i<j`$. Then $`w(h)=2`$, $`w(h+1)=3`$, and $`2h`$ is an omitted singleton. There are $`\Theta((\log x)^2)`$ omitted even singletons through $`x`$, using the pair-count bound for the upper estimate. The two parity classes of $`B`$ are balanced at all scales, and the number of odd crowded targets itself grows quadratically in $`\log x`$. The first unavoidable difference from the classical rule occurs at 6.

The [direct pair replay](sparse_completion.py) checks both formulas through 32,768. In that prefix $`B`$ has 30 terms and omits 145 uniquely represented integers, all even. The [prefix-preserving construction](sparse-completion.md) tests the separate relaxation that allows multiply represented terms to enter.
