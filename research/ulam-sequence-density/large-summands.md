# Record lows and sums requiring two large summands

For an integer $`L\ge1`$, let $`R_L(x)`$ count the integers $`n\le x`$ with at least two distinct unordered representations by Ulam terms, **every one** of which uses two summands larger than $`L`$. The complementary crowded integers have a representation $`n=s+u`$ with $`s\in U\cap[1,L]`$. Consequently

```math
R_L(x)\le H(x)\le R_L(x)+A(L)A(x).
```

Here $`A(x)`$ counts Ulam terms and $`H(x)`$ counts all multiply represented integers through $`x`$. At record lows of a sequence of lower density zero, $`R_L(x)/A(x)`$ must therefore tend to infinity for every fixed $`L`$, by the [record-low theorem](record-lows.md).

## An elementary bound with explicit constants

Let $`x`$ be an integer record low of $`A(x)/x`$. For every integer $`T>L`$ with $`A(T)>A(L)`$,

```math
\frac{A(x)}x\ge
\frac1T\left(1-\frac{A(T)+1}{A(T)-A(L)}\,\frac{R_L(x)}{A(x)}\right).
```

**Proof.** Partition $`[1,x]`$ into $`A(x)`$ blocks starting at Ulam terms $`u_i`$ and ending immediately before the next term, truncating the last block at $`x`$. Write $`\ell_i`$ for the length of each block. Their lengths sum to $`x`$. For $`i\ge2`$, the largest two terms in the prefix have a unique sum there, so $`\ell_i\le u_{i+1}-u_i\le u_{i-1}\lt u_i`$. The first block has length one.

For each $`s\in U`$ with $`L<s<\ell_i`$, the integer $`u_i+s`$ is represented and is strictly inside this block after its initial term. Its two summands are distinct. It is therefore rejected and has at least two representations. If it had a summand $`f\le L`$, its other summand would be $`u_i+s-f`$, also strictly inside the block after its initial term. That position is empty. Thus all these targets count toward $`R_L(x)`$. They are distinct within a block and across blocks.

Put $`\delta=A(x)/x`$. Every $`0\le t\le x`$ satisfies $`A(t)\ge\delta t`$, with $`A(0)=0`$. A block with $`\ell_i>T`$ contributes at least

```math
C_i=A(\ell_i-1)-A(L)\ge A(T)-A(L)>0
```

distinct targets, and $`\delta\ell_i\le C_i+A(L)+\delta`$. The sum of these $`C_i`$ is at most $`R_L(x)`$, and the number of long blocks is at most $`R_L(x)/(A(T)-A(L))`$. Each remaining block contributes at most $`\delta T`$ to $`\delta x`$. Summing and using $`\delta\le1`$ proves the bound.

For example, $`A(256)=50`$ and $`A(1024)=128`$. If $`R_{256}(x)\le A(x)/2`$ at every integer record low, then the lower natural density is at least $`9/53248`$. The bound at infinitely many record lows gives the same conclusion provided there are infinitely many. A proof of that hypothesis would still leave convergence of $`A(x)/x`$ open.

The same counting argument explains a stronger proposed shortcut. If $`s`$ is the first Ulam number above $`L`$, each gap of length greater than $`s`$ after a sufficiently large $`u_i`$ contributes the distinct target $`u_i+s`$ to $`R_L`$. Finitely many such exceptional targets would force eventual gaps of at most $`s`$. An estimate for their total number can allow unbounded individual gaps.

## Which sums escape the finite shifts

Each table entry is $`R_L(x)`$. The [verifier](record_lows.cpp) generates the true sequence and all restricted representation counts by the two polynomial calculations described in the [record-low note](record-lows.md). It then enumerates every distinct pair with smaller summand at most 4,096 and stores the least such summand for each target.

| $`x`$ | $`A(x)`$ | $`H(x)`$ | $`L=69`$ | $`L=256`$ | $`L=1024`$ | $`L=4096`$ |
|---:|---:|---:|---:|---:|---:|---:|
| 65,536 | 5,021 | 48,571 | 6,777 | 875 | 66 | 5 |
| 262,144 | 19,530 | 194,131 | 28,958 | 3,967 | 359 | 62 |
| 582,954 | 43,134 | 431,341 | 65,433 | 8,983 | 890 | 180 |
| 1,048,576 | 77,592 | 775,885 | 117,392 | 16,199 | 1,621 | 340 |
| 1,722,075 | 127,199 | 1,273,868 | 193,577 | 26,706 | 2,662 | 598 |

Among **all** integer record lows through 16,777,216, the largest
$`R_{256}(x)/A(x)`$ is $`23578/112020`$ at $`x=1515826`$, below one quarter.
The residual scan runs through 1,722,075, and the complete counting
function shows that no later point in the tested range sets a new record.

The first crowded target without a summand at most 4,096 is 26,794. Its exact two representations are $`4118+22676`$ and $`5826+20968`$. At the last cutoff there are also 345 uniquely represented targets with both summands above 4,096. At $`L=256`$ the corresponding counts of crowded and uniquely represented targets are 26,706 and 14,807. A bound such as $`R_{256}(x)\le A(x)/2`$ at unbounded record scales has yet to follow from the greedy rule.
