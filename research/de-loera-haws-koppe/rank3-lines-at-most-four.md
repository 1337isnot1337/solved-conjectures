# Strict log-concavity for rank-three matroids with lines of size at most four

**Status: partial progress on the De Loera–Haws–Köppe conjecture.** This strengthens the adjacent sparse-paving result by allowing four-point lines, where a dependent triple need not be a hyperplane. It is not the general rank-three conjecture.

**Theorem.** Let `M` be a simple rank-three matroid, every rank-two flat of which has at most four points. The coefficients of the Ehrhart numerator of its base polytope are positive on the support and strictly log-concave at all internal indices. The conclusion also holds for the dual of each such matroid.

Let the ground set have `n` elements. If `n≤5`, use matroid duality and [Fu, Theorem 1.2](https://arxiv.org/html/2609.37439v2), with corank at most one trivial. Assume `n≥6`. The matroid is connected. Otherwise some rank-one summand contains just one point by simplicity, and its rank-two complement of at least five points is a line, contrary to the hypothesis.

Let `A(z)=Σ A_j z^j` denote the Ehrhart numerator of the hypersimplex `Δ(3,n)`. As in the [sparse paving proof](README.md), Adiprasito–Zhang's rank-three hypersimplex real-rootedness theorem implies that `A` has whole positive support and is strictly log-concave. We will show that the numerator `H` of `M` retains both properties.

## Each hyperplane contributes a low-degree correction

The scaled matroid base polytope is obtained from `tΔ(3,n)` by imposing `Σ_{a∈L}x_a≤2t` for each line `L`. These constraints imply every rank-two inequality, while rank one just enforces the coordinate bounds and rank three follows from nonnegativity and the total sum. A lattice point cannot violate two distinct line bounds: the lines intersect in at most one point, so the sum of their totals is at most `3t+t=4t`.

For a designated line of size `ell`, define `C_ell(t)` to count the lattice points cut off that violate its bound. Their sum outside the line is an integer `r≤t−1`, so the outside coordinates need no individual upper bound. For `t≥0`, stars and bars and inclusion-exclusion on the inside coordinates therefore give
```
C_ell(t)=
Σ_{r=0}^{t−1}  binom(n−ell−1+r,r)
    Σ_{i=0}² (−1)^i binom(ell,i) binom(3t−r−i(t+1)+ell−1,ell−1).
```
A binomial with nonnegative upper argument smaller than the lower argument is zero. There are no terms with `i≥3`, since three coordinates larger than `t` would exceed the total sum. The same formula shows `C_2(t)=0` if defined by the count rather than the expansion below.

For `ell≥3`, set `B^(ell)(z)=(1−z)^n Σ_{t≥0} C_ell(t)z^t`. Its degree is at most `ell`. In fact, put `t=r+u+1`, with `r,u≥0`. The inner sum in the count is a polynomial in `r,u` of total degree at most `ell−1`. In each binomial its upper argument is nonnegative; for `i=2`, the smallest upper argument is `ell−2`, so polynomial evaluation at a potentially infeasible sum still equals zero. Expand this polynomial in products of falling factorials `(r)_{a}(u)_{b}`, with `a+b≤ell−1`. For `d=n−ell≥1`, each summand's generating function in the original `t` is
```
Σ_{r,u≥0} z^(r+u+1) binom(d−1+r,r) (r)_a (u)_b
  =(d)(d+1)…(d+a−1) b! z^(a+b+1)/(1−z)^(d+a+b+1).
```
Bringing each term over the denominator `(1−z)^n` makes the numerator of degree at most `ell`. This observation works for larger lines too; it does not give a sign theorem for general line sizes.

Write `B^(ell)_j=[z^j]B^(ell)(z)` and `λ_ell` for the number of `ell`-point lines. For `n≥6` the dimension of `P(M)` and of the hypersimplex is `n−1`, hence disjointness of the cut regions gives
```
H_j = A_j − λ_3 B^(3)_j − λ_4 B^(4)_j.
```
Expanding the cap formula for `j=1,…,4` gives this table (all higher coefficients, and the constant terms, are zero).
| Line size | `j=1` | `j=2` | `j=3` | `j=4` |
|---|---:|---:|---:|---:|
| 3 | 1 | `2(n−4)` | `binom(n−4,2)` | 0 |
| 4 | 4 | `6(2n−9)` | `6n²−57n+136` | `(n−5)(2n²−20n+51)/3` |

## Log-concavity inequalities

For `n≥6`, the table entries are nonnegative, and `B^(4)_j/6≥B^(3)_j/3` at each index. The pair-packing bound `3λ_3+6λ_4≤binom(n,2)` implies
```
A_j−K B^(4)_j ≤ H_j ≤ A_j, where K=binom(n,2)/6.
```
For `n≥9`, use the same exact formula for the coefficients `A_j` as in the [sparse paving proof](README.md). The [line-size-four checker](check_rank3_line4.py) expands the eight polynomials
```
P_j=A_j−K B^(4)_j,   S_j=P_j²−A_{j−1}A_{j+1},   j=1,2,3,4
```
in powers of `n−9` using rational arithmetic. All their coefficients are strictly positive. For reproducibility, these are the respective degrees, minimum coefficients and constant terms:
| `j` | `P_j` degree | minimum | constant | `S_j` degree | minimum | constant |
|---|---:|---:|---:|---:|---:|---:|
| 1 | 3 | 1/6 | 51 | 6 | 19/720 | 1767 |
| 2 | 6 | 1/720 | 510 | 12 | 1/680400 | 109725 |
| 3 | 9 | 1/362880 | 1351 | 18 | 17/3621252096000 | 799381 |
| 4 | 12 | 1/479001600 | 966 | 24 | 47/20879270485032960000 | 638421 |

Therefore `H_j>0` and `H_j²>A_{j−1}A_{j+1}≥H_{j−1}H_{j+1}` at all changed indices for `n≥9`. At internal `j≥5`, the strict Newton bound for `A` suffices because only `H_{j−1}` can be smaller than the corresponding `A` coefficient. The unaltered tail shares `A`'s positive support.

Finally, for `n=6,7,8`, at most `1,2,2` four-point lines can occur, respectively. Two four-point lines use at least seven distinct points. Three use at least nine, by subtracting at most one for each of the three pairs. The checker uses the table and exact hypersimplex coefficients to verify the stronger all-profiles assertion: every integer pair `(λ_3,λ_4)` satisfying these bounds and `3λ_3+6λ_4≤binom(n,2)` gives positive support and strict log-concavity. The three checks cover 10, 18 and 24 profiles with respective minimum strict log-concavity differences 29, 234 and 985. All remaining smaller ground sets were addressed above. Duality now proves the last assertion.

## Relation to existing work

The [original Conjecture 2(A)](https://math.ucdavis.edu/~deloera/researchsummary/Matroidpolys.pdf) asks for unimodality of every matroid base polytope. The rank-three result here uses the strong rank-three hypersimplex result of Adiprasito and Zhang, [HAL hal-05747878v1](https://hal.science/hal-05747878v1), with precise scope also cited in Fu's introduction. Its cap-counting step is consistent with the general stressed-hyperplane valuation framework in [Ferroni–Schröter, §7](https://doi.org/10.1112/jlms.12984); the disjoint cut count above does not require that theorem. The new candidate contribution is the explicit all-ground-size strict log-concavity across the changed coefficients allowing four-point lines. A 2026 [public preprint](https://github.com/Carptopus/MathExplore-Notes) claims stronger eventual real-rootedness for all paving matroids of fixed rank with an unspecified threshold; this note does not assert priority or solve the general conjecture.
