# A nonperiodic line in a finite planar subtraction game

The board consists of all pairs of nonnegative integers. The players alternate subtracting any one of a fixed set of vectors provided both coordinates stay nonnegative. The player who has no move loses. Let $`W(x,y)`$ be one when the player to move can win and zero otherwise.

**Theorem.** Let the horizontal moves have lengths

```math
H=\{6,7,8,12,20,28,29,33,38,41,49,57,63\},
```

and take two further moves $`(33,1)`$ and $`(62,1)`$. For all $`n,y\ge0`$,

```math
W(69n+55,y)=\binom{n}{y+1}\pmod 2.
```

On the line $`x=138y+124`$, the player to move wins precisely when $`y+1`$ is a power of two. Neither the set of winning positions nor its complement is semilinear. This proves the existential assertion in Larsson–Saha–Yokoo’s Conjecture 57 and refutes the universal assertion in Gurvich–Vyalyi’s Conjecture 2. NHLOCAL contributed the construction and its proof with assistance from OpenAI ChatGPT (GPT-6.2). [Original submission](https://github.com/1337isnot1337/solved-conjectures/issues/997) · [Definition 56 and Conjecture 57](https://arxiv.org/html/2307.12458v4) · [Conjecture 2, §8](https://doi.org/10.3390/a14030071)

## The finite calculation

Write $`x=69n+r`$ with $`0\le r\le68`$. Put $`C=\{0,1,2,3,4,5,18\}`$, $`G=\{19,27,48,55\}`$, and let $`Z`$ denote the remaining residues. The following two arithmetic checks fix the outcome at sixty-five of the sixty-nine residues.

1. The ordinary sums of elements of $`C`$ and $`H`$ that lie in $`[0,68]`$ comprise all of $`Z`$. In increasing order they are the five integer intervals $`[6,17]`$, $`[20,26]`$, $`[28,47]`$, $`[49,54]`$, and $`[56,68]`$.
2. Subtracting an element of $`H\cup\{62\}`$ from an element of $`C`$, modulo 69, yields only residues in $`[6,17]`$, $`[20,25]`$, $`[28,46]`$, $`[49,54]`$, or $`[57,68]`$. These all lie in $`Z`$.

Induct on $`x`$, simultaneously over all heights $`y`$. At a residue in $`Z`$ the first check gives a legal horizontal move to a losing position in $`C`$, even in the first block. At a residue in $`C`$ the second check shows that every legal move leads to a winning position. Thus all $`Z`$ positions win and all $`C`$ positions lose, including terminal positions.

For the remaining residues, the table lists every move whose endpoint is outside $`Z`$. Subtraction modulo 69 in the first coordinate gives the destinations. A negative column in the first block or a negative height removes that option. A prime signifies the preceding block.

| Source | Destinations outside the winning residues $`Z`$ |
| --- | --- |
| 19 | $`55'`$ at height $`y`$ by $`(33,0)`$, and $`55'`$ at height $`y-1`$ by $`(33,1)`$ |
| 27 | $`19`$ by $`(8,0)`$ and $`55'`$ by $`(41,0)`$, both at height $`y`$ |
| 48 | $`19`$ at height $`y`$ by $`(29,0)`$, and $`55'`$ at height $`y-1`$ by $`(62,1)`$ |
| 55 | $`27`$ by $`(28,0)`$ and $`48`$ by $`(7,0)`$, both at height $`y`$ |

A position wins exactly when some option loses. Thus the win indicator at a row of this table is the NAND of the listed indicators. An unavailable option is assigned the neutral input one. Let $`u,v`$ be the two preceding-block indicators at heights $`y,y-1`$. The successive outputs are

```math
p=\neg(u\land v),\qquad q=\neg(p\land u),\qquad t=\neg(p\land v),\qquad \neg(q\land t)=u\mathbin{\oplus}v.
```

Consequently $`B(n,y)=W(69n+55,y)`$ starts with $`B(0,y)=1\oplus1=0`$ for all $`y\ge0`$. At each subsequent block,

```math
B(n+1,y)=B(n,y)\mathbin{\oplus}B(n,y-1),\qquad B(n,-1)=1.
```

The artificial boundary value one is the parity of $`\binom n0`$. Pascal’s rule, including binomial coefficients beyond their top index as zero, identifies $`B(n,y)`$ with the parity asserted in the theorem for every $`n,y`$. [Reproducible residue check](check_planar_game.py)

## The line and the two consequences

Set $`n=2i+1`$, $`y=i`$, and $`m=i+1`$. The relevant binomial coefficient is $`\binom{2m-1}{m}`$. Over the field of two elements the exponents with odd coefficients in $`(1+z)^k`$ are exactly the sums of subsets of the binary powers in $`k`$, by expanding the factors $`1+z^{2^j}`$ for its set bits. Hence $`\binom{a+b}{a}`$ is odd exactly when the binary addition of $`a`$ and $`b`$ is carry-free. Apply this with $`a=m`$ and $`b=m-1`$. These two numbers share a set bit precisely when $`m`$ has a set bit above its lowest set bit. This proves the power-of-two criterion.

An admissible horizontal translation along this line must be $`138s`$ with $`s`$ a positive integer, since the height changes by $`s`$. Choose $`2^k>s`$ so large that the point indexed by $`2^k-1`$ is past the proposed threshold. Its translate has index one less than a number strictly between $`2^k`$ and $`2^{k+1}`$. The two outcomes differ, contradicting eventual periodicity on this line.

Finally consider one linear set $`L=b+\sum_{j=1}^d\mathbb N v_j`$ and the indices $`i`$ at which $`p_i=(138i+124,i)`$ lies in $`L`$. If infinitely many such indices occur, take representations of $`p_i`$ for an increasing sequence of them. Dickson’s lemma gives two representations whose coefficient vectors are coordinatewise ordered in the same direction. Their difference shows that $`p_{i+s}-p_i=(138s,s)`$ belongs to $`\sum_j\mathbb N v_j`$ for some fixed $`s>0`$. Addition of this displacement sends **every** point of $`L`$ on the ray to a later point of $`L`$. In each residue class of indices modulo $`s`$, the set is therefore empty or contains the entire tail after its least member. A finite intersection with the ray is also eventually periodic. Finite unions preserve eventual periodicity by taking a common multiple of the periods and the largest starting point. This proves that a semilinear outcome set would have an eventually periodic indicator on the line. Both complementary indicators just found are nonperiodic. ∎
