# Gaussian cubic signatures and conjugate-base reduction

Checked 2026-11-21. Coordination: [issue 223, allocation comment](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068249934).

## Status and scope

No new primitive Gaussian Fermat–Catalan identity was found. No full conjecture, prize submission, accepted award, or payment is claimed. The only structural-search hits are the two orderings of Helenius's existing identity

```math
(-2+i)^3+(-2-i)^3=(1+i)^4.
```

[Ed Pegg Jr.'s original page](https://mathpuzzle.com/Gaussians.html) publicly offers $10 for a new pairwise-coprime Gaussian Fermat–Catalan example or class and separately $10 for another Gaussian Beal counterexample. An identity is not automatically entitled to both payments. The offer has not been personally reconfirmed by the sponsor. No email was sent. These are explicit example-finding rewards; they must remain separate from solving a full finiteness conjecture or the user's original exclusion of mere numerical cases.

The prior-example table and exact arbitrary-precision verifier are in [the other agent's Gaussian directory](../jsp-gaussian/README.md). Exclusions include all ten ordinary identities, Helenius's Beal identity, the seven original Gaussian Fermat–Catalan examples, Oleg567's 2012 identity, and the two examples in [Howe et al., 2026-11-20](https://hexagonmath.org/pdf/2611.00682v1). Unit multiplication, conjugation, permutation of signed terms, and exponent repacking are screened using the three signed power values.

## Direct searches

`search.cpp` tests whether a difference of powers is an exact Gaussian cube. It first filters modulo 13,19,31,37,43, then tests the norm for an exact integer cube and verifies candidate lattice cube roots by exact multiplication. Gaussian gcds use exact Euclidean division. A floating-point root estimate is always corrected or checked by integer equality. Powers are discarded if an intermediate coordinate exceeds $10^{17}$ in absolute value; consequently all norm and multiplication calculations remain inside signed 128-bit range for these parameter bounds.

| Signature/orientation | Coordinate bounds | Candidate pairs | Exact cube tests after filters | Primitive nonunit hits |
| --- | --- | ---: | ---: | ---: |
| $x^3+y^4=z^r$, $r=4,5,6,7,8,9,10,11,12,13,14,15,16,17,19$ | $|\Re y|,|\Im y|\le300$; $|\Re z|,|\Im z|\le30$ | 1,604,713,292 | 1,758,243 | 0 |
| $x^3+y^5=z^r$, same list with $r\ge5$ | $|\Re y|,|\Im y|\le150$; $|\Re z|,|\Im z|\le25$ | 543,394,808 | 374,358 | 0 |
| $y^4+z^r=x^3$, $r=4,8,12,16$ | first row's bounds | 456,489,756 | 184,844 | 0 |

Fourth-power bases are reduced under units and common conjugation to the sector $\Re y\ge\Im y\ge0$. For the odd fifth-power signature, common units can be absorbed into both the cube and fifth power, permitting a first-quadrant representative of $z$. These reductions preserve the square coordinate bounds. There is no independent bound on the recovered cubic base.

The third row is necessary: when both other exponents are multiples of four, their signs cannot be reversed by Gaussian units. The first two rows alone would not cover this orientation. For other $r$, an available unit on the $r$th power and a sign on the cube cover it. The initial direct runs used difference mode only; the separate `q4-sum` files record the added orientation. The current source supports both.

These are finite negative search results, not nonexistence theorems. Some signatures are already ruled out by prior mathematics; the search does not supersede such theorems.

## Conjugate cubic bases

With the other agent's agreement, this lane next considered

```math
(a+bi)^3+(a-bi)^3=z^4,
\qquad a,b\in\mathbb Z,
```

with pairwise-coprime nonunit Gaussian bases. A necessary condition is $\gcd(a,b)=1$ and opposite parity. Conversely, these two conditions make $a+bi$ and $a-bi$ coprime in $\mathbb Z[i]$: a common prime divides $2a$ and $2bi$; an odd prime would force an ordinary common prime factor, while $1+i$ is excluded by parity. Coprimality with $z$ then follows from the displayed identity.

The left side equals $2a(a^2-3b^2)$ and is real. The imaginary part of $(c+di)^4$ is $4cd(c^2-d^2)$. Thus, up to a Gaussian unit on $z$, its base lies either on an axis ($z=c$) or a diagonal ($z=(1+i)c$), with $c>0$. If $a$ were odd, $b$ would be even and the left side would have 2-adic valuation one, incompatible with either $c^4$ or $-4c^4$. Hence $a$ is even and $b$ odd.

Away from 2 and 3, the two factors $a$ and $a^2-3b^2$ are coprime. Their exponents must separately be multiples of four. If $3\mid a$, then $3\nmid b$ and $v_3(a^2-3b^2)=1$, so $v_3(a)\equiv3\pmod4$. The 2-adic valuation of $a$ is one modulo four for a diagonal target and three modulo four for an axis target.

It follows that, before congruence elimination, the diagonal cases have $a=\pm2s^4$ or $a=\pm54s^4$, while the axis cases have $a=\pm8s^4$ or $a=\pm216s^4$. Here $s>0$, and after assigning the target's prime powers its remaining factor is an odd positive integer $t$. In the 3-divisible cases $3\nmid t$. The same equations and primitivity force $\gcd(s,t)=1$.

Reduction modulo 3,8,16 leaves only the following possibilities:

| Family | Real coordinate $a$ | Target base $z$ | Remaining equation |
| --- | ---: | --- | --- |
| D1 | $-2s^4$ | $(1+i)st$ | $3b^2=4s^8-t^4$; $s,t$ odd and $3\nmid st$ |
| D3 | $54s^4$ | $3(1+i)st$ | $b^2=972s^8+t^4$; $s$ even, $t$ odd |
| R3 | $-216s^4$ | $6st$ | $b^2=15552s^8+t^4$; $t$ odd |

For example, the excluded negative $54s^4$ case requires $b^2=972s^8-t^4$, which is 11 or15 modulo16. The positive $2s^4$ case requires $3b^2=4s^8+t^4$, inconsistent modulo3 under primitivity. The $\pm8s^4$ cases are inconsistent modulo8; the positive $216s^4$ case gives a square congruent to15 modulo16.

The three surviving substitutions are checked symbolically in `check_reductions.py`. The parent agent independently checked the algebra and congruences. No novelty is claimed for this reduction.

## Two families eliminated by a known elliptic curve

Both D3 and R3 would yield

```math
B^2=T^4+972U^4,\qquad U,T\ne0,
```

with $U=s^2$ or $U=2s^2$ respectively. Put $x=T/U$ and $y=B/U^2$, so $y^2=x^4+972$. Then

```math
X=2(y+x^2),\qquad Y=4x(y+x^2)
```

satisfy $Y^2=X^3-3888X$. Here $X\ne0$, since $y=-x^2$ would contradict $972\ne0$. Writing $X=36u$, $Y=216v$ gives a rational point with $u\ne0$ on

```math
v^2=u^3-3u.
```

This curve is [LMFDB576.i1, Cremona576f1](https://www.lmfdb.org/EllipticCurve/Q/576.i1/). Its known Mordell–Weil group is $\mathbb Z/2\mathbb Z$, generated by $(0,0)$, so it has no such rational point. Thus D3 and R3 are impossible, conditional here only on using that established classification, rather than on a new computation or conjectural BSD inference. This session did not recreate the original rank proof in Lean.

The same data were independently read in John Cremona's [primary curve table](https://github.com/JohnCremona/ecdata/blob/master/allcurves/allcurves.00000-09999), blob `baab5801d7f81e1d5c44f5eb5acf4f1e100bc90b`: row `576 f 1 [0,0,0,-3,0] 0 2` records rank0 and torsion order2. The rational transformation and its scaling are verified as polynomial identities by `check_reductions.py`.

This excludes two structural avenues for finding a paid example; it is not a new bounty solution.

## Exhaustive parameter search for D1

For D1 define

```math
\alpha=\frac{t^2+b\sqrt{-3}}2\in\mathbb Z[\omega],
\qquad \omega=\frac{-1+\sqrt{-3}}2.
```

The norm equation is $N(\alpha)=s^8$. Primitivity makes $\alpha$ and $\bar\alpha$ coprime. A common prime divides their sum $t^2$ and difference $b\sqrt{-3}$; a prime dividing both $t$ and $b$ would also divide $s$, and the ramified prime above3 is excluded by $3\nmid s$. The Eisenstein ring is a unique factorization domain. Each prime exponent in $\alpha$ is therefore divisible by8, so

```math
\alpha=\epsilon\gamma^8,\qquad
N(\gamma)=s,\qquad
\operatorname{Tr}(\epsilon\gamma^8)=t^2,
```

where $\epsilon$ is one of its six units.

`conjugate_search.cpp` enumerates all $\gamma=A+B\omega$ up to units and conjugation in the sector $A\ge2B\ge0$, with $N(\gamma)=A^2-AB+B^2\le10^8$. A unit on $\gamma$ is absorbed into $\epsilon$; conjugation only reverses the sign of $b$. It tests all six units, extracts $t$ with an exact square test, and requires $\gcd(2s^4,b)=1$. All arithmetic remains within signed 128-bit integers at the declared norm cap. Unlike the direct grids, this search imposes no separate cutoff on $t$ or $b$.

The completed run examined13,783,175 Eisenstein representatives and82,699,050 unit choices. Its only two raw hits are $(s,t,b)=(1,1,\pm1)$, both Helenius's known power triple. There is no additional primitive conjugate-base example in this reduced family with $s\le10^8$. This is still a bounded exclusion, not a proof that Helenius's example is unique for all $s$ or among all Gaussian Beal examples.

`check_reductions.py` independently exhausts every $t$ in D1 for $s\le100$, using Python integers, and compares the result with the structural program. It also checks every emitted full-size identity, all three Gaussian gcds, nonunit bases, the reciprocal-exponent condition, and the prior-example key. The verification is recorded in `reduction-check.json` and `conjugate-verification.jsonl`.

Literature searches for the full Gaussian $(3,3,4)$ classification, its conjugate subcase, and the reduced quartic/eighth-power equation did not locate a complete prior classification. This is a limited search result, not a guarantee that none exists. The old sponsor page and [Pegg's 2004 MAA column](https://mathpuzzle.com/MAA/15-Gaussian%20Numbers/mathgames_03_15_04.html) record Helenius's example and explicitly leave additional examples open. Further effort should first check the arithmetic of the remaining D1 family, rather than merely increasing these search bounds.

## Why the first elliptic obstruction does not finish D1

Normalizing $u=t/s^2$ and $v=b/s^4$ gives $u^4+3v^2=4$. The rational map $X=-3u^2$, $Y=-9uv$ lands on $Y^2=X^3-36X$, whose known rational rank is1 (Cremona576h2). Its 2-isogenous curve $Y^2=X^3+144X$ scales to $Y^2=X^3+9X$ and likewise has rank1. Thus the rank-zero argument used above does not transfer to D1.

The Eisenstein units can refine the remaining condition to a genus3 curve. Eighth powers of units cover the three cube-root units. The other unit factor is a sign. The positive sign is excluded because, for odd $s$,

```math
\operatorname{Tr}(\gamma^8)=\operatorname{Tr}(\gamma^4)^2-2s^4
```

is 2 or3 modulo4. Hence one may write $\alpha=-\gamma^8$. Writing $\gamma=(A+B\sqrt{-3})/2$, with $B\ne0$, and setting $r=A/B$, $w=16t/B^4$, gives

```math
w^2=-2(r^8-84r^6+630r^4-756r^2+81).
```

The two involutions $r\mapsto3/r$ and $r\mapsto-3/r$ yield elliptic quartics, through $u=r\pm3/r$ and $v=w/r^2$:

```math
v^2=-2u^4+192u^2-2304,
\qquad
v^2=-2u^4+144u^2-288.
```

For a quartic $v^2=a u^4+c u^2+e$, the map $X=a u^2$, $Y=a u v$ gives $Y^2=X^3+cX^2+aeX$. Shifting and scaling these two images yields $Y^2=X^3-30X+56$ and $Y^2=X^3-396X+3024$. The same primary Cremona table records these as2304k1 and576h4, each of rank1 and torsion order2. Consequently neither gives a rank-zero obstruction. No claim is made that these three quotients alone determine the rational points of the genus3 curve.

## Reproduction

From this directory:

```sh
g++ -O3 -std=c++20 search.cpp -o /tmp/gaussian-cubic-search
/tmp/gaussian-cubic-search 4 300 30
/tmp/gaussian-cubic-search 5 150 25
g++ -O3 -std=c++20 conjugate_search.cpp -o /tmp/conjugate-gaussian-search
/tmp/conjugate-gaussian-search 100000000
python3 check_reductions.py --binary /tmp/conjugate-gaussian-search
python3 ../jsp-gaussian/verify_candidates.py conjugate-candidates.jsonl
```

The current direct-search command includes the added fourth-power sum orientation. The separate stored initial and supplemental logs avoid pretending that they were one run.
