# Monotonicity of the Hwang padding limit

Research checkpoint, 20 November 2026 (America/Chicago). This proves a property of the limiting matching polynomial in the Hwang investigation. It does not prove radial convexity of the permanent, and it is not a new resolved-conjecture count.

## Statement

For every doubly stochastic matrix $`A`$ of order $`m\geq1`$, put


```math
R_A(z)=\sum_{k=0}^m\sigma_k(A)z^k,\qquad
F_A(t)=e^{mt}(1-t)^{2m}R_A\left(\frac{t}{(1-t)^2}\right).
```


Then


```math
F_A'(t)>0\qquad(0\lt t\leq1/2).
\tag{1}
```


Equivalently, a matching chosen proportionally to the product of its edge activities $`za_{ij}`$ satisfies


```math
\mathbb E_z|M|>
m\frac{\sqrt{1+4z}-1}{\sqrt{1+4z}+1}
\qquad(0\lt z\leq2).
\tag{2}
```


Strictness holds for each finite core. It does not assert a uniform positive gap independent of the core.

The [earlier padding calculation](hwang_radial_convexity.md) identifies $`F_A`$ as the $`C^2`$ limit of normalized permanent paths for $`A\oplus J_M`$. Assertion (1) controls only the first derivative of that limit. Hwang's conjecture concerns the second derivative of every original permanent path.

Here `sigma_k(A)` is the sum of the permanents of all `k` by `k` submatrices, with `sigma_0=1`. In the padding statements, `J_r` has every entry `1/r` and `d_r=r!/r^r`.

## Monomer probabilities

Let $`Z(G)`$ be the matching partition function of the bipartite graph with positive edge weights $`w_{ij}=za_{ij}`$. Let $`x_i`$ and $`y_j`$ be the probabilities that the vertices in its two classes are unmatched. Thus


```math
x_i=\frac{Z(G-i)}{Z(G)},\qquad
y_j=\frac{Z(G-j)}{Z(G)}.
```


Each vertex has total incident edge activity $`z`$. The matching recurrence gives


```math
\frac1{1+z}\leq x_i<1,\qquad
\frac1{1+z}\leq y_j<1.
\tag{3}
```


Indeed,


```math
\frac{Z(G)}{Z(G-i)}
=1+\sum_jza_{ij}\frac{Z(G-i-j)}{Z(G-i)}
\leq1+z.
```


The upper inequality is strict because each vertex has a positive incident edge.

For vertices in opposite parts, the weighted Christoffel--Darboux identity is


```math
Z(G)Z(G-i-j)-Z(G-i)Z(G-j)
=\sum_{P:i\leadsto j}
\left(\prod_{e\in E(P)}w_e\right)Z(G-V(P))^2\geq0.
\tag{4}
```


The sum is over simple paths. Their lengths are odd because the graph is bipartite. For a positive edge $`(i,j)`$, its one-edge path makes the right side strictly positive.

The weighted identity follows by superposing the two matchings in each product on the left. Their union consists of alternating paths and cycles, retaining doubled common edges. Switching the alternating component containing $`i`$ cancels configurations unless the component also contains $`j`$. The surviving component is a simple $`i,j`$ path; its edge weights multiply, and two arbitrary matchings remain on its vertex-deleted complement. Path parity determines the sign. Every path between opposite bipartite vertices has the positive sign in (4).

Consequently the occupation probability of edge $`(i,j)`$ satisfies


```math
p_{ij}=za_{ij}\frac{Z(G-i-j)}{Z(G)}
\geq za_{ij}x_i y_j.
```


Summing at each vertex gives strict inequalities


```math
x_i+zx_i(Ay)_i<1,\qquad
y_j+zy_j(A^{\mathsf T}x)_j<1.
\tag{5}
```


Strictness follows from the one-edge term at each positive edge. Also


```math
\bar u:=\frac1m\sum_i x_i
=\frac1m\sum_jy_j
=1-\frac1m\mathbb E_z|M|,
\tag{6}
```


because a matching leaves the same number of unmatched vertices on each side.

## Scalar certificate

Fix $`b\in[1/2,1)`$, and set


```math
z=\frac{1-b}{b^2},\quad
a=\frac1{1+z}=\frac{b^2}{b^2-b+1},\quad
c=\frac{2-b}{1-b},\quad
w(x)=\frac{x}{1-x}.
```


For every $`a\leq x,y<1`$,


```math
w(x)(1-x-zxy)+w(y)(1-y-zxy)
\leq c(2b-x-y).
\tag{7}
```


To prove this, write $`s=x+y`$, $`p=xy`$, and $`D=(1-x)(1-y)=1-s+p>0`$. Multiplying left minus right in (7) by $`D`$ gives


```math
N_b(s,p)=s(1-s+p)-zp(s-2p)
-c(2b-s)(1-s+p).
\tag{8}
```


For fixed $`s`$, this is a convex quadratic in $`p`$, with coefficient $`2z>0`$. On $`[a,1]^2`$, the allowable $`p`$ therefore attains the maximum of $`N_b`$ at an endpoint corresponding to $`x=y`$, $`x=a`$, $`y=a`$, $`x=1`$, or $`y=1`$. The last two are polynomial boundary limits; division by $`D`$ is only used for $`x,y<1`$.

On the balanced endpoint $`x=y=r`$,


```math
N_b(2r,r^2)=
\frac{2(r-b)^2(r-1)
\bigl((1-b)^2r+b(2-b)\bigr)}
{b^2(1-b)}
\leq0.
\tag{9}
```


At $`x=1`$,


```math
N_b(1+y,y)=zy(y-1)\leq0.
\tag{10}
```


At $`x=a`$,


```math
N_b(a+y,ay)=\frac{Q_b(y)}{(b^2-b+1)^2},
\tag{11}
```


where


```math
\begin{aligned}
Q_b(y)={}&(b^3-5b^2+7b-4)y^2\\
&+(-2b^4+7b^3-5b^2-b+3)y\\
&+2b^4-8b^3+9b^2-4b.
\end{aligned}
\tag{12}
```


The leading coefficient is negative throughout $`1/2\leq b<1`$. Its derivative is $`3b^2-10b+7=(3b-7)(b-1)>0`$ there, so its value is at most the endpoint value $`-1`$ at $`b=1`$.

Its discriminant is


```math
\mathop{\mathrm{disc}}_y Q_b=(b-1)^4T(b),\qquad
T(b)=4b^4-20b^3+37b^2-34b+9.
\tag{13}
```


Here $`T(1/2)=-1`$. On $`[1/2,1]`$, its second derivative $`48b^2-120b+74`$ decreases and is at least $`2`$. Thus $`T'`$ increases and is at most $`T'(1)=-4`$. Hence $`T`$ decreases and is strictly negative. For $`b<1`$, (13) is strictly negative, so the concave quadratic $`Q_b`$ is negative on the whole real line. This proves (11) is negative. Symmetry covers the remaining boundary cases. Convexity in $`p`$ proves (7).

## Averaging

Multiply the first inequality in (5) by $`w(x_i)>0`$, and the second by $`w(y_j)>0`$, and sum. Using the row and column sums of $`A`$, the resulting strictly positive quantity is


```math
\sum_{i,j}a_{ij}
\bigl[w(x_i)(1-x_i-zx_i y_j)
+w(y_j)(1-y_j-zx_i y_j)\bigr]>0.
```


Apply (7) termwise and use (6):


```math
0\lt \cdots\leq c\sum_{i,j}a_{ij}(2b-x_i-y_j)
=2mc(b-\bar u).
```


Therefore $`\bar u\lt b`$. With $`b=1-t`$, this says


```math
\mathbb E_z|M|>mt,\qquad
z=\frac{t}{(1-t)^2},\quad0\lt t\leq1/2.
\tag{14}
```


Finally,


```math
\frac{F_A'(t)}{F_A(t)}
=\frac{1+t}{t(1-t)}
\bigl(\mathbb E_z|M|-mt\bigr)>0.
\tag{15}
```


This proves (1) and (2).

## The average cannot be replaced by a vertexwise bound

The conclusion $`\bar u<1-t`$ does not imply $`x_i<1-t`$ or $`y_j<1-t`$ at each vertex. At $`z=2`$, take the doubly stochastic matrix


```math
A=\begin{pmatrix}
0&1/4&1/4&1/4&1/4\\
1/4&3/4&0&0&0\\
1/4&0&3/4&0&0\\
1/4&0&0&3/4&0\\
1/4&0&0&0&3/4
\end{pmatrix}.
```


Its matching partition function is $`2175/16`$. Deleting the first left vertex gives $`1125/16`$, so that vertex has monomer probability


```math
x_1=\frac{15}{29}>\frac12.
```


Each other left vertex has monomer probability $`59/145`$, giving the average $`311/725<1/2`$, as required by the theorem.

These values can be checked without enumerating a large matrix. In the general $`N`$-arm family with cross weights $`1/N`$ and arm diagonal weights $`1-1/N`$, let $`\alpha=z(1-1/N)`$ and $`\beta=z/N`$. Count matchings by whether the two hub vertices are unmatched, exactly one is matched, or both are matched to the same or different arms. The partition function is


```math
\begin{aligned}
Z={}&(1+\alpha)^N
+2N\beta(1+\alpha)^{N-1}\\
&+N\beta^2(1+\alpha)^{N-1}
+N(N-1)\beta^2(1+\alpha)^{N-2}.
\end{aligned}
```


Deleting one hub leaves partition function
$`(1+\alpha)^N+N\beta(1+\alpha)^{N-1}`$. This gives the displayed exact example at $`N=4,z=2`$, and the hub monomer probability tends to $`(1+z)/(1+2z)`$ as $`N`$ grows. This is an obstruction to a stronger auxiliary statement, not a counterexample to the average theorem or to Hwang.


## A finite-padding consequence

Fix a doubly stochastic core $`A`$. For every sufficiently large integer $`M`$,
the actual permanent path


```math
p_M(t)=\mathop{\mathrm{per}}\bigl((1-t)J_{m+M}
+t(A\oplus J_M)\bigr)
```


satisfies


```math
p_M'(t)>0\qquad(0\lt t\leq1/2).
\tag{16}
```


This assertion has a non-effective threshold depending on $`A`$. It follows
from the previously proved normalized $`C^2`$ convergence
$`p_M/d_{m+M}\to F_A`$, together with (1).

At the origin,


```math
F_A''(0)=\|A\|_F^2>0.
```


Indeed, $`\sigma_1(A)=m`$ and
$`2\sigma_2(A)=m^2-2m+\|A\|_F^2`$; substitution into the defining expression
for $`F_A`$ gives this second derivative. Choose $`\varepsilon>0`$ and
$`c>0`$ so that $`F_A''(t)>c`$ on $`[0,\varepsilon]`$. Uniform convergence of
second derivatives makes $`p_M''(t)>0`$ there for all sufficiently large $`M`$.
Since $`p_M'(0)=0`$, its first derivative is then positive on
$`(0,\varepsilon]`$.

On the remaining compact interval $`[\varepsilon,1/2]`$, (1) gives a positive
minimum of $`F_A'`$. Uniform convergence of first derivatives makes
$`p_M'>0`$ there as well. This proves (16).

This is a monotonicity theorem for the finite padding family. It proves
neither its convexity on the half interval nor monotonicity on the full
interval $`[0,1]`$, and it does not classify all matrices in Minc Problem 8.


## The curvature gap

Write $`K=|M|`$, $`\mu=\mathbb E K`$, and $`V=\mathop{\mathrm{Var}}K`$, at $`z=t/(1-t)^2`$. Another derivative gives


```math
(\log F_A)''(t)=
\frac{-2mt^2+(-1+2t+t^2)\mu+(1+t)^2V}
{t^2(1-t)^2}.
\tag{17}
```


At $`t=1/2`$, with $`S=m-\mu`$,


```math
(\log F_A)''(1/2)=36V-4m-4S.
\tag{18}
```


The bound $`S\lt m/2`$ does not control $`V`$ sufficiently. Differentiating a bound for $`S`$ does not give a bound for its derivative.

A sufficient bridge would have been $`V\geq\mu/\sqrt{1+4z}`$, but that statement is false. For the cycle cores $`A_m=(I_m+P_m)/2`$, the bipartite support is the cycle of length $`2m`$, with every edge weight $`1/2`$. The elementary matching transfer recurrence gives


```math
\frac{m-\mu}{m}\longrightarrow\frac1{\sqrt{1+2z}},\qquad
\frac{V}{m}\longrightarrow\frac{z}{(1+2z)^{3/2}}.
```


At $`z=2`$,


```math
\frac{V}{\mu}\longrightarrow\frac{1+\sqrt5}{10}\lt \frac13.
```


The last inequality is $`3\sqrt5<7`$, verified by squaring positive sides. Thus this auxiliary variance comparison fails for sufficiently large cycle cores. This is not a counterexample to Hwang or to log-convexity of $`F_A`$.

## Sources and priority limits

- O. J. Heilmann and E. H. Lieb, *Theory of monomer-dimer systems*, Communications in Mathematical Physics **25** (1972), 190--232, DOI https://doi.org/10.1007/BF01877590 . The publisher record confirms the weighted setting and Christoffel--Darboux identities. The full original paper was not retrieved in this branch.
- S. Shao and K. Shi, *Strong spatial mixing for the matching polynomial: A simple proof via Heilmann--Lieb Theorem*, author manuscript https://keshi.pro/files/papers/matching-ssm.pdf , Lemmas 3.1 and 3.2, printed page 5. The complete manuscript was inspected. It states the uniform-activity path identity and attributes the defect-polynomial form to Heilmann--Lieb. The switching argument above gives the arbitrary-weight form used here.
- E. Davies, M. Jenssen, W. Perkins and B. Roberts, *Independent sets, matchings, and occupancy fractions*, Journal of the London Mathematical Society (2017), DOI https://doi.org/10.1112/jlms.12056 . Its matching theorem gives an upper occupancy bound for regular graphs; it is not used to prove (2).

No historical-priority claim is made for the lower occupancy bound or the scalar certificate. A separate literature audit would be required before claiming novelty. The result is retained because it proves strict monotonicity for every core in the current padding construction and identifies the remaining susceptibility requirement.


The independent [proof review](hwang_matching_monotonicity_review.md) checks the scalar certificate, weighted correlations and finite-padding transfer. The [exact checker](hwang_matching_monotonicity.py) verifies the identities and the stated vertexwise obstruction. Root independently checked the argument and the hub-family counting formula before publication.
