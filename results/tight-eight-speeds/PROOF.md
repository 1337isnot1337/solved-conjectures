# The unique tight speed set for nine lonely runners

For eight distinct positive integer speeds relative to a stationary runner, write $`L(v)=\max_t\min_i\|t v_i\|`$, where the norm denotes distance to the nearest integer.

**Theorem.** If $L(v)\le1/9$, then $v$ is a dilation of $`\{1,2,3,4,5,6,7,8\}`$. Conversely every such dilation has $L(v)=1/9$.

The nine-runner lonely runner bound was previously proved. Goddyn and Wong found only the consecutive speeds in their finite nine-runner census. Here we establish the equality classification without a speed cutoff. Our argument uses the established lower bounds for smaller numbers of runners. [Trakulthongchai](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v33i2p46) · [Goddyn and Wong, §1](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf)

## Product bound

Divide by the gcd and suppose $v$ is primitive. The prefix bound for successive minima used in the eight-runner proof gives

```math
 \|v\|_2\le B=36\cdot28\cdot21\cdot15\cdot10\cdot6\cdot3=57{,}153{,}600.
```

Here are the details in this dimension. On the projection of $\mathbb Z^8$ to $v^\perp$, let $\lambda_i$ be the successive minima of the central section of the unit sup-norm ball. Its seven-dimensional volume is at least $2^7$ by Vaaler's theorem, and the projected lattice has covolume $`1/\|v\|_2`$. Hence $`\prod\lambda_i\le1/\|v\|_2`$ by Minkowski's second theorem. The circle of $v$ comes within $`\tfrac12\sum_{i=1}^r\lambda_i`$ of every point of the torus obtained by lifting the first $r$ independent minimum vectors. This follows by rounding the lift coefficients and absorbing the components parallel to $v$ into its circle parameter. This torus is coordinate-free. Successive coalescence of coordinates gives it loneliness at least $1/(9-r)$ from the known lower-dimensional bounds. Thus the prefix sums of the minima dominate the prefix sums of

```math
 (1/36,1/28,1/21,1/15,1/10,1/6,1/3).
```

Indeed the latter are $2(1/(9-r)-1/9)$. For these entries $y_i$, sum $`\log\lambda_i-\log y_i\ge(\lambda_i-y_i)/\lambda_i`$ by parts using the nonincreasing weights $1/\lambda_i$. This gives $`\prod\lambda_i\ge\prod y_i=1/B`$. [Eight-runner argument](../tight-seven-speeds/PROOF.md) · [Yi, Gill and Bu, §11](https://arxiv.org/html/2610.40694v1#S11) · [Prior prefix bounds for speed products, Remark 3.9](https://arxiv.org/html/2609.02604v2#S3.SS6)

Write $D=\prod v_i$. By the arithmetic-geometric mean inequality, $D\le(B/\sqrt8)^8$. Every $d=2,\ldots,8$ divides some speed: otherwise $t=1/d$ gives loneliness at least $1/d>1/9$. Thus $840=\mathop{\mathrm{lcm}}(2,\ldots,8)$ divides $D$. This is the strict-witness version of Rosenfeld's forced-divisor observation. [Lemma 3.10 and references](https://arxiv.org/html/2609.02604v2#S3.SS7)

## A mixed-modulus assertion

For each of the following 26 primes $p$, a primitive tuple with $p\nmid D$ either has a strict $1/9$ witness on the $6p$-grid or is a signed permuted unit multiple of $(1,\ldots,8)$ modulo $6p$:

```math
71,89,97,101,107,113,131,137,139,149,151,157,163,167,173,179,
181,191,193,197,199,211,223,227,229,233.
```

To verify the assertion, fold nonzero residues modulo $p$ to $`[x]_p=\min(x\bmod p,(-x)\bmod p)`$. Enumerate every eight-element set with no strict witness on the $p$-grid up to multiplication by a nonzero scalar. For completeness, normalize a pair with least folded quotient over both orders to $1,b$; all remaining members exceed $b$. Enumerate completions in increasing order with every folded pair quotient at least $b$, intersecting the witness masks of the chosen speeds. Remove a possible last speed whenever a multiplier witnesses the whole set. [Modular enumerator](../tight-six-speeds/modular.cpp)

A smaller witnessless support extends to a witnessless eight-element set, since adding a speed can only remove witnessing times. Check every nonempty subset of each enumerated set; if it has no witness, try all positive multiplicities giving a total of eight entries. This includes every folded multiset, up to the same symmetries. For each resulting tuple $x$:

1. For $q=2,3$, enumerate the vectors $c$ modulo $q$ with $`\gcd(q,c_1,\ldots,c_8)=1`$. Exclude $c$ if some pair $0\le t\lt p$, $0\le k\lt q$ satisfies $`9[qx_i t+pc_i k]_{pq}>pq`$ for all $i$. This gives a strict witness at time $t/p+k/q$. Coordinate signs act on both residues, and a common unit modulo $p$ merely reindexes $t$.
2. Combine each surviving pair $a\bmod2$, $b\bmod3$ into $c=3a+4b\bmod6$ and run the same test with $q=6$. The two smaller grids are contained in this larger one.
3. For every survivor explicitly find a signed permutation $w$ of $(1,\dots,8)$ and units $`u_p,u_6`$ such that $`x_i=u_p w_i\bmod p`$ and $`c_i=u_6 w_i\bmod6`$ for every $i$. To do so, try all $u_p=1,\ldots,p-1$, determine the possible index and sign for each folded entry, require that all eight different indices are used, and try both units modulo six. Each sign and index is uniquely determined for fixed $u_p$ when it exists, since $p>16$. The Chinese remainder theorem provides a common unit modulo $6p$. Undoing the initial normalization modulo $p$ just changes this unit.

The program verifies the assertion for every listed prime. The integer comparison $`(840\prod p)^2 8^8>B^{16}`$ ensures at least one of them does not divide $D$. [Lift checker](lifts.cpp) · [Prime and product verifier](verify.py)

## Lifting the direction

For this prime our tuple has no strict witness, so there is a signed permutation $w$ of the consecutive speeds with $w\equiv b v\pmod{6p}$ for an integer $b$. Set $m=6p$. If $v,w$ are independent, $z=(w-bv)/m$ is an integer vector and $v,z$ generate a rational plane. Its torus has loneliness at least $1/8$ by coordinate coalescence and the known bound in at most seven speeds. Every phase on this plane can be represented by $sv+tz$ with $`|t|\le1/2`$, since $z$ is integral. The phase $(s-tb/m)v$ differs from it by $tw/m$, of sup norm at most $8/(2m)$. The loneliness function is 1-Lipschitz. Consequently

```math
 1/8\le L(\mathop{\mathrm{span}}(v,w))\le 1/9+8/(2m)<1/8,
```

where the last inequality follows from $m=6p>288$. This contradiction forces parallelism. Primitivity and positivity yield the consecutive speeds. At $t=1/9$ these speeds attain $1/9$, and among $0,t,\ldots,8t$ two are always at circular distance at most $1/9$. This proves both directions.

The classification is an unrefereed computer-assisted result without a Lean formalization. Run the verifier with Python 3.10 or later and a C++20 compiler from the repository root.

```sh
python3 results/tight-eight-speeds/verify.py
```
