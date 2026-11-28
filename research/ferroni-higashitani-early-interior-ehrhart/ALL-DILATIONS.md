# Every prescribed dilation factor above one can exhibit early interior non-log-concavity

This strengthens the construction answering Ferroni–Higashitani Question 5.12(a) in [PROOF.md](PROOF.md). For every integer $a\ge2$ there is a reflexive IDP lattice polytope $Q$ for which $P=aQ$ has
```math
I_P(1)I_P(3)>I_P(2)^2,\qquad I_P(k)=|\mathop{\mathrm{int}}(kP)\cap\mathbb Z^{\dim P}|.
```
For each fixed $a$, the ratio on the two sides can be made arbitrarily large. Both $Q$ and $P$ admit regular unimodular triangulations. In contrast, a reflexive IDP polytope by itself cannot have this failure: its first three interior counts are $1,E_Q(1),E_Q(2)$, and IDP gives $E_Q(2)\le\binom{E_Q(1)+1}{2}\le E_Q(1)^2$.

## Construction

Put $d=3a-1$. Use the same Cayley-box cone as in [PROOF.md](PROOF.md), now over $d+1$ columns: for each $i=1,\ldots,d$, take $m\alpha$ copies of the row $e_0+e_i$ and $m\beta$ copies of $2e_i$, with positive integers $\alpha,\beta,m$. Call the original lattice polytope $R$. Each row still sums to two. Set $p=\mathbf{1}/(d+1)$ in the spatial space, and use the refined lattice $\widetilde M=M+\mathbb Zp$. Every defining homogeneous form evaluates to $1/(d+1)$ at $(p,1)$. Exactly as in the original proof, $R$ is IDP in both lattices and has a regular unimodular triangulation in the refined lattice, by the same boundary-coning argument. The coset proof gives
```math
 I_R(k)=\sum_{r=1}^{d+1} E(k-r),
 \qquad
 E(j)=\sum_{\substack{\sum_{i=0}^d b_i=j\\ b_i\in\mathbb Z_{\ge0}}}W(b)^m,
 \qquad
 W(b)=\prod_{i=1}^d (b_0+b_i+1)^\alpha(2b_i+1)^\beta,
```
with $E(j)=0$ for $j<0$ and with $E(j)$ counted in the original lattice. Also, $Q=R-p$ is reflexive in $\widetilde M$: each defining form, after translating the spatial part by $p$, has a lattice normal vector upon multiplying by $d+1$, and has right-hand constant $1$ with the sign directed outwards. Thus the polar is the convex hull of lattice normal vectors. This translation does not change any counts or triangulation properties. For $P=aQ$, the first three counts therefore equal the three prefix sums through $j_1=a-1,j_2=2a-1,j_3=3a-1$.

## Weight comparison

Fix a total $j\le d$ and set $t=b_0$. For fixed $t$, the logarithm of the weight from each $b_i$ is strictly concave in $b_i\ge0$. If two parts differ by at least two, moving one unit from the larger to the smaller strictly increases the weight. Hence the maximum at this $t$ has $j-t$ ones and all other $b_i=0$. Its logarithmic weight is
```math
 L_j(t)=\alpha f_j(t)+\beta(j-t)\log3,\qquad
 f_j(t)=(d-j+t)\log(t+1)+(j-t)\log(t+2).
```
In particular, $L_j(0)=j\log U$ for $U=2^\alpha3^\beta$. The increment from $t=0$ to $1$ is
```math
 L_j(1)-L_j(0)=\alpha B_j-\beta\log3,\qquad
 B_j=(d-2j+1)\log2+(j-1)\log3.
```
Because $B_j$ decreases strictly with $j$, and $B_{j_2}>0$, choose positive integers $\alpha,\beta$ such that
```math
 B_{j_2}<\frac{\beta}{\alpha}\log3\lt B_{j_1}.
```
(The positive rationals are dense.)

For $j=j_2$, $d-j=a\ge2$ and throughout $0\le t\le j$,
```math
 f_j''(t)
 =\frac{2}{(t+1)(t+2)}
 -\frac{d-j+t}{(t+1)^2}-\frac{j-t}{(t+2)^2}<0.
```
Thus the successive increments of $L_{j_2}$ on the integers decrease. Its first increment is negative by choice of $\beta/\alpha$, so the maximum is at $t=0$ and is exactly $\log(U^{j_2})$. The same upper bound applies to compositions of smaller total, by the coordinatewise monotonicity of $W$.

For $j=j_1$, the $t=1$ configuration is available since $a\ge2$, and has weight $\rho U^{j_1}$ with $\rho=\exp(\alpha B_{j_1}-\beta\log3)>1$. At $j=j_3=d$, the $t=0$ configuration has weight $U^{j_3}$. Writing $T$ for the number of compositions of total at most $j_2$, the three prefix sums satisfy
```math
 I_P(1)\ge(\rho U^{j_1})^m,\qquad
 I_P(2)\le T(U^{j_2})^m,\qquad
 I_P(3)\ge(U^{j_3})^m.
```
Because $j_1+j_3=2j_2$, their ratio is at least $\rho^m/T^2\to\infty$ as $m\to\infty$. This also proves the strict assertion for all sufficiently large $m$.

## Why the triangulation claim does not extend to flag

These witnesses do not admit a regular unimodular flag triangulation. Work with the untranslated lattice polytope $aR$ and give each degree-one generator of its semigroup the integer label $r$ naming its refined-lattice spatial coset. The closed-cone coset bijection shows $0\le r\le a$ because no old degree below zero is possible. Every quadratic binomial in the toric ideal preserves the **sum of integer labels**, since the two sums lie in $[0,2a]$ and are congruent modulo $d+1=3a$.

On the other hand, there is a cubic binomial that does not preserve this sum. The generator $ap$ (lying in $aR$) has label $a$. Three copies of it sum to the spatial point $3ap=\mathbf{1}$, and the old degree-$`3a`$ point at that spatial location is in the cone. Old IDP expresses it as $3a$ old degree-one points of $R$, which can be grouped into three old-lattice points of $aR$, all of label zero. The corresponding cubic binomial has sum of labels $3a$ on one side and zero on the other. Therefore the toric ideal cannot be generated by quadrics: the ideal generated by its quadratic binomials is homogeneous for the integer label grading. A regular unimodular flag triangulation would give a squarefree quadratic initial ideal and hence quadratic generators, a contradiction.
