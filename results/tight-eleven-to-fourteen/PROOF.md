# All equality cases for eleven through fourteen lonely runners

Let $`L(v)=\max_{t\in\mathbb R}\min_i\|t v_i\|`$ for $k$ distinct positive integer speeds. The stationary runner gives $k+1$ runners in total. Divide the speeds by their gcd and sort them to obtain the primitive set.

**Theorem.** The primitive speed sets satisfying $L(v)\le1/(k+1)$ for $10\le k\le13$ are as follows. Each listed set attains equality.

| Runners | All primitive speed sets |
|---:|---|
| 11 | $`\{1,\ldots,10\}`$ |
| 12 | $`\{1,\ldots,11\}`$ |
| 13 | $`\{1,\ldots,12\}`$ |
| 14 | $`\{1,\ldots,13\}`$ and $`\{1,\ldots,11,13,24\}`$ |

The first three rows settle the prediction stated by Sungkawichai and Trakulthongchai in §7.1. The second fourteen-runner example was found by Goddyn and Wong. The new conclusion is exhaustiveness over arbitrary integer speeds. The proof uses the earlier authors’ finite modular sieves, together with a geometric argument and an additional finite computation to determine the integer directions. [Sungkawichai and Trakulthongchai, §§5–7](https://arxiv.org/html/2604.23906v2#S7.SS1) · [Goddyn and Wong](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf) · [Allikvere, §§4–7](https://arxiv.org/html/2609.02604v2#S4)

## Size and separation bounds

Use $`L(E)=\max_{x\in E}\min_i\|x_i\|`$ for a rational subspace $E$. Assume $v$ primitive and $L(v)\le1/(k+1)$. Every rational subspace containing $v$ is contained in no coordinate hyperplane. If its dimension is $r+1$, it has loneliness at least $1/(k+1-r)$ by coordinate coalescence and the already proved lower-dimensional lonely runner bounds. In particular every rational plane containing $v$ has loneliness at least $1/k$. [Allikvere, Lemma 3.3](https://arxiv.org/html/2609.02604v2#S3.SS2)

Project the integer lattice orthogonally onto $v^\perp$ with its ordinary Euclidean metric. Its covolume is $`1/|v|_2`$. Let $t_i$ be the squared Gram–Schmidt lengths of a Korkine–Zolotarev basis. For the space spanned by $v$ and integer lifts of the first $r$ basis vectors, subtract integer multiples of the lifts in reverse basis order. Each remaining projected Gram–Schmidt coefficient has absolute value at most $1/2$. The component parallel to $v$ can be absorbed into the circle parameter. Every point of that torus is consequently within Euclidean distance $`\tfrac12\sqrt{\sum_{i\le r}t_i}`$ of the speed circle, hence within this sup distance as well. Since loneliness is 1-Lipschitz in sup distance,

```math
\sum_{i\le r}t_i\ge B_r=4\left(\frac1{k+1-r}-\frac1{k+1}\right)^2.
```

Set $B_0=0$, $`c_i=B_i-B_{i-1}`$ and $`K=\prod_{i=1}^{k-1}c_i`$. The verifier checks $`c_{i+1}/c_i>4/3`$ exactly. The KZ basis satisfies $`t_{i+1}\ge3t_i/4`$. Allikvere’s product minimization lemma therefore gives $`1/|v|_2^2=\prod_i t_i\ge K`$. In particular $`D=\prod_i v_i\le(kK)^{-k/2}`$ by AM–GM. This argument allows equality in the prefix bounds. [Allikvere, Lemmas 3.5–3.6](https://arxiv.org/html/2609.02604v2#S3.SS4)

For $2\le d\le k$, if no speed were divisible by $d$, time $1/d$ would give $L(v)\ge1/d>1/(k+1)$. Thus $F=\mathop{\mathrm{lcm}}(2,\ldots,k)$ divides $D$. For the prime set of each row below, with product $P$, the verifier checks that $F$ and $P$ are coprime and that

```math
(FP)^2(kK)^k>1.
```

Consequently one of the listed primes divides no speed. These four comparisons use rational arithmetic. [Verifier and exact prime lists](verify.py)

**Short vector lemma.** If $0\ne w\equiv av\pmod m$ and $`k(k+1)\|w\|_\infty<2m`$, then $w$ is parallel to $v$. Otherwise $z=(w-av)/m$ is integral and independent of $v$. Represent any phase on their plane by $sv+tz$ with $`|t|\le1/2`$ modulo one. It is within $`\|w\|_\infty/(2m)`$ of $(s-ta/m)v$. Therefore the plane has loneliness strictly less than $1/(k+1)+1/(k(k+1))=1/k$, a contradiction. A recorded short vector thus determines the primitive integer direction by its sorted absolute coordinates divided by their gcd.

## Which modular orbits an equality case can occupy

Fix a prime $p$ dividing no coordinate. Consider binary lifts, with moduli $m=2^j p$. In every row of our proof $k+1$ has an odd prime factor different from $p$, so $k+1$ does not divide $m$. A grid distance at least $1/(k+1)$ on these grids is automatically strictly greater. Hence a tuple with $L(v)\le1/(k+1)$ has no witness on any such grid. At binary levels the gcd deletion in the earlier sieves can only mean that all entries, or all but one, are even. All-even entries contradict primitivity. With exactly one odd speed, the even speeds have a time of loneliness at least $1/k$ by the lower-dimensional theorem. They keep their phases half a turn later, and in one of the two positions the odd speed has distance at least $1/4$. Thus this deletion also gives a strict witness. The complete binary searches cited below therefore cover an actual equality case up to permutation, individual signs and multiplication by a unit.

- **Ten and twelve speeds.** For $k=10$ use the 61 primes in Table 1 of Sungkawichai and Trakulthongchai, and for $k=12$ use the corresponding 91. Their binary sieve through $8p$, projected back to $p$, leaves only the orbit of $(1,\ldots,k)$. We use the result of the binary phase before their polynomial argument. For $k=12$, Allikvere separately audited all 1,092 residual tuples. [Binary sieve and prime lists](https://arxiv.org/html/2604.23906v2#S5.SS2) · [Audit of the twelve-speed residuals](https://arxiv.org/html/2609.02604v1#S4)
- **Thirteen speeds.** For each of Allikvere’s 111 archived primes, the binary sieve leaves only the two orbits represented by $A=(1,\ldots,13)$ and $B=(1,\ldots,11,13,24)$ modulo $p$. We need 62 of those primes, namely the 61 primes in the second fourteen-runner proof together with 557. We use the binary result through $32p$, before the final factor-seven lift. [Binary survivors](https://arxiv.org/html/2609.02604v2#S4.SS2) · [Original 111-prime table](https://arxiv.org/html/2609.02604v1#S4)

**Eleven speeds.** Here the published final sieve uses a modulus divisible by twelve. We instead extract an earlier count from the authors’ original log. For the 44 primes listed as `TWELVE` in our verifier, the first lift from $p$ to $2p$ yields exactly $(p-1)/2$ rows. The original implementation expands all common-unit rescalings modulo $p$, folds the signs there and retains distinct sorted lifts. These counts determine every row at $2p$. [Original log at its fixed commit](https://github.com/vzsky/13-lonely-runners/blob/29311663c21835d67529b29a4acf6631fcad5c63/result_12) · [Normalizer and lift representation](https://github.com/vzsky/13-lonely-runners/blob/29311663c21835d67529b29a4acf6631fcad5c63/main.cpp)

Indeed, for each unit $u$ modulo $2p$, start with $(u,2u,\ldots,11u)$, choose each sign to put its residue modulo $p$ in $`[1,(p-1)/2]`$, reduce modulo $2p$, and sort. Each such tuple must be retained. It has six odd coordinates, and a grid witness would be strict, contradicting the elementary equality $L(1,\ldots,11)=1/12$. The verifier explicitly constructs these representatives and counts exactly $(p-1)/2$ distinct rows for each of the 44 primes. They exhaust the logged first-lift count, so any equality case has the consecutive orbit as its reduction modulo $p$. The optional source-log check and CI compare the extracted counts against the hash-pinned original file.

## From residue classes to integer sets

The preceding results restrict $v$ to one or two possible orbits **modulo** the prime dividing no speed. A single modular match alone would allow infinitely many integer sets. We now apply the short vector lemma to all binary descendants of each permitted root.

At a node $x\bmod m$ enumerate all children $`y_i=x_i+m\epsilon_i`$ modulo $2m$. A parent unit lifts to a child unit, so the original choice of representative is harmless. At even $m$ the unit $1+m$ flips the lift bits at every odd entry at once. Fixing the bit at the first odd entry preserves at least one representative. Exclude all-even and single-odd children as above. At each remaining child and each odd $1\le t\le m$, form the absolute centered coordinates $`w_i=\min(ty_i\bmod 2m,-ty_i\bmod 2m)`$.

1. If $(k+1)w_i>2m$ for every $i$, discard the child by its strict witness.
2. If $`k(k+1)\max_i w_i<4m`$, the signed centered residues are a short vector as in the lemma. For an actual primitive tuple the residue vector has order $2m$; hence this multiplier produces a nonzero vector. A zero coordinate or equal absolute coordinates exclude a distinct positive primitive tuple. Otherwise record the normalized direction.
3. Recurse on all other children. An unresolved node at depth ten causes the verifier to fail.

Every one of the 258 prime searches terminates. In every search the recorded directions are exactly the integer sets in the theorem for its respective number of speeds. Finally, their exact maxima can be computed at $t=j/(a+b)$ for two distinct speeds. They contain 1 and 2, so their maximum is below $1/2$. Every positive local maximum below $1/2$ has two active slopes of opposite signs, which forces such a denominator. The verifier obtains precisely $1/(k+1)$ in all five cases. [Binary lift code](lift.cpp) · [Arithmetic and exact maxima](verify.py)

This is an unrefereed computer-assisted proof. Its new verifier replays the deductions from the prior modular sieve results. The cited papers and their archives supply the underlying exhaustive prime-level calculations.
