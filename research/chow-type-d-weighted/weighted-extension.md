# Strict consecutive interlacing for weighted type-D Eulerian polynomials

**Extension only.** The ordinary `q=1` theorem, including strictness in ranks at least three, was already proved, audited, and formalized in the repository's [Chow result](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/chow-conjecture) and [issue #77](https://github.com/1337isnot1337/solved-conjectures/issues/77). The argument below extends the same method to all positive real parameters in Brenti's refinement. It must not be counted as a second resolution of Chow's conjecture, or as a resolution of Brenti's real-rootedness question, which Yang and Zhang already settled.

**Theorem.** For every real `q>0` and every `n≥2`, the zero sequence of `D_n(x;q)` interlaces that of `D_(n+1)(x;q)`. It interlaces strictly except when `(n,q)=(2,1)`.

Here `D_n(x;q)=Σ_σ q^neg_D(σ) x^des_D(σ)`, summed over even-signed permutations of `[n]`. The statistic `neg_D` counts negative entries in positions 2 through `n` only. The descent statistic is the ordinary adjacent descent count with one additional descent if `σ_1+σ_2<0`. This is [Yang–Zhang (2017), Eq. (2)](https://doi.org/10.1137/16M1084651), not the differently weighted statistic on all positions of even-signed permutations.

## Proof

Use the refined inversion-sequence polynomials `T_(m,i)(x;q)`, `0≤i≤2m−1`, as in the [Yang–Zhang author copy](https://zhangbiaomath.github.io/papers/2017-siamdm-qep.pdf). Their Lemma 3.2 and the identity preceding it give
```
T_m = Σ_i T_(m,i) = (1+q)D_m.
```
Their Theorem 3.7 says that at every rank `m≥4`, the refined row has **ordered** pairwise weak interlacing, with `T_(m,i)≼T_(m,j)` for `i<j`. Their Lemma 3.3 gives, at each rank `m≥3`,
```
u_i = ceil((m−1)i/m),
F_i = q^(−[i≥m]) T_(m,i),
F_i = x Σ_{j<u_i} T_(m−1,j) + Σ_{j≥u_i} T_(m−1,j).
```
In particular `T_(m,0)=T_(m−1)`. The positive scaling factors do not change row zeros or their interlacing.

Each row has no common zero over the complex numbers. At rank two, `T_(2,0)=1+q`. At rank `m≥3`, the integer cutoffs run from `u_0=0` to `u_(2m−1)=2m−2`, increasing by zero or one. Therefore, for every `j=0,…,2m−3` some consecutive difference `F_(i+1)−F_i` equals `(x−1) T_(m−1,j)`. A common zero of row `m` is not `1`, since its entries are nonzero with nonnegative coefficients. It would thus be a common zero of row `m−1`, contradicting induction. This is the same common-zero descent mechanism already used in the repository's unweighted proof.

For the base pair, Lemma 3.3 gives
```
D_2(x;q) = (1+x)(1+qx),
D_3(x;q) = 1 + (4+6q+q²)x + (1+6q+4q²)x² + q²x³.
```
If `q≠1`, the two distinct roots of `D_2` have alternating nonzero signs under `D_3`, since
```
D_3(−1;q)   = 2(q²−1),
D_3(−1/q;q) = (1+q)(1−q²)/q².
```
At the larger root the sign is negative, while the sign at zero is positive and the sign near negative infinity is negative. Thus the cubic has three distinct negative roots strictly interlacing the pair. If `q=1`, `D_2=(1+x)^2` and `D_3=(1+x)(x²+10x+1)` give weak interlacing and three distinct roots of the cubic.

Now let `m=n+1≥4` and assume that `T_n` has `n` simple negative roots `r_1>…>r_n`. It is the first member of the row `T_(m,i)`. By ordered weak interlacing, each other member takes either sign `(−1)^j` or value zero at `r_j`: the nonzero case has exactly `j` roots of that polynomial larger than `r_j` and the leading coefficient is positive. The first member itself vanishes at `r_j`, but the no-common-zero argument ensures at least one other member does not. Hence
```
(−1)^j T_(n+1)(r_j) > 0       for each j=1,…,n.
```
The total `T_(n+1)` is positive at zero. Its degree is `n+1`: each inversion-sequence statistic counts at most `n+1` ascents, and the sequence `e_j=2j−1` for `j=1,…,n+1` attains all of them, including index zero. Its sign near negative infinity is then `(−1)^(n+1)`. The alternating signs give one zero in every one of the `n+1` intervals cut out by `r_1,…,r_n` in `(−∞,0)`. These exhaust the degree, so the zeros are simple and strictly interlacing. Positive scaling from `T` to `D` proves the result.

## Attribution and check of a published input

Yang–Zhang prove real-rootedness of each total and ordered pairwise interlacing inside each refined row. Their Theorem 3.8 does not state consecutive interlacing of the totals, which is the conclusion here. The formulation above credits Savage–Visontai for the original refinement and the repository's earlier Chow proof for the exact unweighted application and no-common-row-zero method. Searches for the explicit weighted consecutive conclusion, and inspection of the two repository branches and issue #77, found no earlier statement. This is not a guarantee of priority: it is a short extension driven by established row interlacing.

For completeness, Yang–Zhang's proof of Lemma 3.6 mentions a numerical positivity check for one Hurwitz determinant. Its potentially nonpositive factor is
```
p(q)=6q^5+12q^4−12q^3−11q²+10q+7.
```
For `q≥1` the coefficients of `p(1+s)` are `(12,30,85,96,42,6)` in ascending powers of `s=q−1`. For `0≤q≤1`, the degree-five Bernstein coefficients are `(7,9,99/10,17/2,6,12)`, all positive. This gives an exact verification of that factor's positivity, without changing the rest of their determinant argument.
