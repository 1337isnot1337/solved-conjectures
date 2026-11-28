# Lin–Ma conjecture

Status: unresolved. This checkpoint gives an exact insertion operator, a proof for singleton insertion, and an obstruction to one stronger approach. It does not prove the full conjecture.

Tracking issue: [#102](https://github.com/1337isnot1337/solved-conjectures/issues/102).

## Whole target and sources

Lin and Ma's Conjecture 5.1 concerns every multiset $`M=\{1^{p_1},\ldots,r^{p_r}\}`$. A tree has root 0, weakly increasing labels along paths, and weakly increasing labels among siblings in their plane order. Let $`\mathrm{ee}`$, $`\mathrm{oe}`$, and $`\mathrm{odd}`$ count even-degree vertices at even levels, even-degree vertices at odd levels, and odd-degree vertices. The root has level zero. The target is real-rootedness of every nonzero
```math
\widehat S_{M,i}(t)=
\sum_{\substack{T\in\mathcal T_M\\\lfloor\mathrm{ee}(T)/2\rfloor=i}}
t^{\lfloor\mathrm{oe}(T)/2\rfloor}.
```

Primary source: Z. Lin and J. Ma, *A symmetry on weakly increasing trees and multiset Schett polynomials*, JCTA 213 (2025), 106010, [DOI](https://doi.org/10.1016/j.jcta.2025.106010), [arXiv:2104.10539](https://arxiv.org/pdf/2104.10539). The published result establishes partial gamma-positivity, not the conjectured real-rootedness.

[Zhang–Zhao, arXiv:2610.00966, Section 5](https://arxiv.org/html/2610.00966v1) explicitly leaves this statement open. Its solved multiset Eulerian–Narayana conjecture concerns the leaf statistic and is different. [RealRooted issue 1077](https://github.com/PerAlexandersson/RealRooted/issues/1077) also remains open; its October 29 audit found no resolution.

Additional checks:

- Deb–Sokal, [arXiv:2311.11747](https://arxiv.org/pdf/2311.11747), proves coefficientwise Hankel positivity of ordinary Schett sequences. That conclusion does not imply slice real-rootedness.
- Lin–Liu–Yan, [arXiv:2409.01558](https://arxiv.org/abs/2409.01558), studies Catalan–Schett interpretations and restricted permutations.
- Deb, [arXiv:2610.37931](https://arxiv.org/abs/2610.37931), studies generalized hyperbolic polynomials; the indexed text still describes Lin–Ma's statement as conjectural. The arXiv HTML endpoint was unavailable during this checkpoint.
- Searches included “reduced Schett”, “multiset Schett”, “real zeros”, “real-rooted”, “stability”, later papers, and public issue records. No full prior resolution was found. This is a bounded literature audit, not a guarantee of novelty.

## Three-variable insertion

Write
```math
S_M(x,y,z)=\sum_{T\in\mathcal T_M}
x^{\mathrm{ee}(T)}y^{\mathrm{oe}(T)}z^{\mathrm{odd}(T)}.
```

Let $`X,Y,Z`$ be the unique formal series with constant terms $`x,y,z`$ satisfying
```math
X=x+uYZ,\qquad Y=y+uXZ,\qquad Z=z+uXY. \tag{1}
```

For $`p\geq 0`$, define
```math
\mathcal T_pF=[u^p]F(X,Y,Z). \tag{2}
```

Adding $`p`$ copies of a new maximal label gives $`\mathcal T_pS_M`$.

Here is the connection to the source's forest substitution. An even-level base vertex of even degree may receive an even or odd number of new maximal-label branches. Its replacement weight is
```math
\frac{x+zuY}{1-u^2Y^2}.
```
For an odd-degree vertex at that level, the replacement is
```math
\frac{z+xuY}{1-u^2Y^2}.
```
The corresponding odd-level expressions exchange $`x,X`$ with $`y,Y`$. Equations (1) imply precisely these four identities, with the same $`Z`$ for both odd-degree cases. Thus the three-variable system is a compact form of the source's four-variable substitutions (3.14)–(3.17). It is not claimed as a new enumeration of trees.

The maximal-label forest is attached after all children with smaller labels. Deleting those vertices recovers a unique base tree and its attached forests, which proves (2).

## Exact monomial coefficients

The operator can be evaluated without enumerating trees. For nonnegative integers $`a,b,c,p`$, let $`i+j+k=p`$, and set
```math
A_1=\binom{a+p-i}{i},\quad
A_2=\binom{b+p-j}{j},\quad
A_3=\binom{c+p-k}{k},
```
```math
B_1=\binom{a+p-i-1}{i-1},\quad
B_2=\binom{b+p-j-1}{j-1},\quad
B_3=\binom{c+p-k-1}{k-1}.
```
A binomial coefficient is zero unless its two arguments are integers with $`0\leq\text{lower}\leq\text{upper}`$. Then
```math
\mathcal T_p(x^ay^bz^c)=
\sum_{\substack{i+j+k=p\\a+p-2i,\ b+p-2j,\ c+p-2k\geq0}}
C_{i,j,k}\,
x^{a+p-2i}y^{b+p-2j}z^{c+p-2k}, \tag{3}
```
where
```math
C_{i,j,k}
=A_1A_2A_3-A_1B_2B_3-B_1A_2B_3-B_1B_2A_3
-2B_1B_2B_3. \tag{4}
```

A formal multivariate Lagrange change of variables for
$`(x,y,z)=(X-uYZ,Y-uXZ,Z-uXY)`$ gives
```math
F(X,Y,Z)=
\sum_{i,j,k\geq0}\frac{u^{i+j+k}}{i!j!k!}
\partial_x^i\partial_y^j\partial_z^k
\left[
F(x,y,z)(yz)^i(xz)^j(xy)^k
\left(1-u^2(x^2+y^2+z^2)-2u^3xyz\right)
\right]. \tag{5}
```
The factor in parentheses is the Jacobian determinant. Applying the derivatives to a monomial gives (3)–(4). This also supplies an independent algebraic expression for the forest operator.

Where the denominators are positive, (4) can be written
```math
C_{i,j,k}
=A_1A_2A_3
\frac{
abc+ab(i+j)+ac(i+k)+bc(j+k)+p(ai+bj+ck)}
{(a+j+k)(b+i+k)(c+i+j)}. \tag{6}
```
The binomial expression (4), not the rational expression (6), is used at boundary cases.

## Parity reduction

Let $`n=|M|`$. The sum of all outdegrees is $`n`$, so
$`\mathrm{odd}\equiv n\pmod 2`$. The sum of outdegrees at even levels equals the number of odd-level vertices. Consequently $`\mathrm{ee}\equiv n+1\pmod 2`$, and then $`\mathrm{oe}\equiv n\pmod2`$.

Thus the reduced polynomial $`R_M`$ satisfies
```math
S_M(x,y,z)=
\begin{cases}
x\,R_M(x^2,y^2,z^2),&n\text{ even},
\\ yz\,R_M(x^2,y^2,z^2),&n\text{ odd}.
\end{cases} \tag{7}
```
It is homogeneous of degree $`\lfloor n/2\rfloor`$, and
$`\widehat S_{M,i}(t)=[A^i]R_M(A,t,1)`$.

If every $`R_M(A,B,C)`$ were real stable, coefficient extraction in $`A`$ and real specialization $`C=1`$ would prove the full conjecture. This stronger statement is presently unproved here.

## Singleton insertion preserves stability

Put $`\partial_\Sigma=\partial_A+\partial_B+\partial_C`$. Since
$`\mathcal T_1=yz\partial_x+xz\partial_y+xy\partial_z`$, (7) gives the alternating reduced operators
```math
P\longmapsto P+2A\partial_\Sigma P,\qquad
Q\longmapsto (B+C)Q+2BC\partial_\Sigma Q. \tag{8}
```

Both preserve real stability. At a point where all variables have positive imaginary part, a stable polynomial is nonzero. Each logarithmic derivative $`\partial_jP/P`$ has nonpositive imaginary part: with the other variables fixed, its roots lie in the closed lower half-plane, and the logarithmic derivative is a sum of reciprocals of upper-half-plane differences.

For the first operator, divide by $`2AP`$. The quotient is
```math
\frac1{2A}+\frac{\partial_\Sigma P}{P},
```
which has strictly negative imaginary part. For the second, division by $`2BCQ`$ gives
```math
\frac1{2B}+\frac1{2C}+\frac{\partial_\Sigma Q}{Q},
```
with the same conclusion. Starting at $`R_\varnothing=1`$ proves stability for the all-distinct-label family. This component is not counted as a resolution of the whole multiset conjecture.

## Why the unrestricted operator route fails

For the even state in (7), a block of two copies acts by
```math
\begin{aligned}
\mathcal U_2P={}&(B+C)P
\\ &+\bigl(2A(B+C)+3BC\bigr)P_A
\\ &+\bigl(2AB+AC+4BC\bigr)P_B
\\ &+\bigl(AB+2AC+4BC\bigr)P_C
+2ABC\,\partial_\Sigma^2P.
\end{aligned} \tag{9}
```

The usual differential-symbol approach does not yield an unrestricted stability preserver. Apply (9) to $`\exp(-AU-BV-CW)`$, remove the exponential factor, divide by $`ABC`$, and replace $`A,B,C`$ by their negative reciprocals. The resulting polynomial is
```math
\begin{aligned}
g(a,b,c,U,V,W)={}&a(b+c)
 +(2b+2c+3a)U
\\ &+(b+2c+4a)V+(2b+c+4a)W
 +2(U+V+W)^2.
\end{aligned}
```
At
```math
(a,b,c,U,V,W)=(0,1,-1,0,-1,1)+t(1,1,1,1,1,1)
```
it equals $`2+41t^2`$. Taking $`t=i\sqrt{2/41}`$ gives a zero with all six variables in the upper half-plane. Therefore this symbol is not stable.

This is an obstruction to a general operator argument. It is not a counterexample to Lin–Ma's conjecture, nor to stability on the restricted homogeneous family arising from trees. A valid proof must use additional structure.

## Computation and remaining gap

[probe.py](probe.py) implements the integer formula (3)–(4), parity reduction, and exact univariate root counts with multiplicities. The source example $`M=(2,2)`$ is recovered:
```math
R_{(2,2)}(A,B,C)=3A(B+C)+(B+C)^2+8BC.
```
The output totals also agree with
```math
|\mathcal T_M|=\frac1{1+N_r}\prod_{j=1}^r\binom{N_j+p_j}{p_j},
\qquad N_j=p_1+\cdots+p_j.
```

Bounded exact specializations of selected rows and of simple stable inputs found no conjecture counterexample. Those diagnostics provide no all-index proof. The remaining task is a block insertion theorem for an appropriate restricted family, a different structural proof of every slice, or an exact nonreal-root counterexample to the full claim.
