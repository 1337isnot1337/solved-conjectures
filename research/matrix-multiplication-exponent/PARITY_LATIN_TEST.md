# A completed Latin-square tensor at a geodesic tripod

Status: a proved mixed-tensor value and an exact Fourier restriction. The restriction gives the known direction of the unit normalization inequality. It does not prove the reverse direction or the matrix multiplication exponent claim.

Let $`F`$ be a normalized four-party spectral point. Assume $`D`$ is a common geodesic center for $`A,B,C`$, with positive arms
```math
a=d_{AD},\quad b=d_{BD},\quad c=d_{CD},\qquad
d_{AB}=a+b,\quad d_{AC}=a+c,\quad d_{BC}=b+c.
\tag{1}
```
The edge-rigidity deduction in [FULL_TENSOR_CONSTRAINTS.md](FULL_TENSOR_CONSTRAINTS.md), Section 3, gives
```math
u(ABD)=a+b,\quad u(ACD)=a+c,\quad u(BCD)=b+c.
\tag{2}
```
Intersecting-unit uncrossing also gives $`u(ABC)=1`$: apply it to $`ABC,ABD`$, obtaining
$`u(ABC)+u(ABD)\ge u(ABCD)+d_{AB}`$, then use (1), (2), full normalization and $`u(ABC)\le1`$.

## 1. Exact value

Let $`L:[q]^2\to[q]`$ be a Latin square: fixing either input makes the other-to-output map a permutation. Define
```math
\mathcal L_q=
\sum_{i,j=1}^q
 e_i^A e_j^B e_{L(i,j)}^C e_{ij}^D .
\tag{3}
```
Then
```math
F(\mathcal L_q)=q^{a+b+c}.
\tag{4}
```

For the upper bound, the three-spoke tensor is
```math
W_{AD}(q)W_{BD}(q)W_{CD}(q)
 =\sum_{i,j,k=1}^q e_i^A e_j^B e_k^C e_{ijk}^D .
```
The single local map at $`D`$ sending $`e_{ijk}`$ to $`e_{ij}`$ if $`k=L(i,j)`$, and to zero otherwise, gives (3). Hence
$`F(\mathcal L_q)\le q^{a+b+c}`$.

For the lower bound, partition (3) by $`i`$. The $`q`$ summands occupy disjoint spaces at $`A,D`$. Every summand is a padded copy of $`U_{BCD}(q)`$, because $`j\mapsto L(i,j)`$ is a permutation and the $`D`$ labels in that row are distinct. The powered partial-sum inequality in
[GENERAL_FREE_SET_SEPARATOR.md](GENERAL_FREE_SET_SEPARATOR.md), Section 3, with free set $`AD`$ and unit exponent $`a>0`$, gives
```math
F(\mathcal L_q)
 \ge\left(\sum_{i=1}^q
        F(U_{BCD}(q))^{1/a}\right)^a
 =q^a q^{b+c}.
```
This proves (4). The argument uses actual tensor restrictions and the general partial-sum theorem; it does not treat a putative entropy vector as a spectral point.

More generally, without all three geodesic assumptions, the same calculation gives
```math
\max\{d_{AD}+u(BCD),
      d_{BD}+u(ACD),
      d_{CD}+u(ABD)\}
\le\log_q F(\mathcal L_q)
\le d_{AD}+d_{BD}+d_{CD}.
\tag{5}
```
For the third lower bound, partition by the Latin output $`L(i,j)`$. Each output class is a permutation matching in $`A,B`$, so its summand is a padded $`U_{ABD}(q)`$, and the free parties are $`C,D`$. The first two bounds follow by rows and columns. Formula (5) assumes the relevant free-wire exponent is positive; at exponent zero its corresponding powered bound reduces to the maximum of the summand values and yields the same displayed inequality.

## 2. The parity contraction and what it actually proves

Take the Latin square of the cyclic group $`\mathbb Z/q\mathbb Z`$. Contract every $`D`$ basis vector in (3) to one. This gives
```math
Q_q=\sum_{i,j\in\mathbb Z/q\mathbb Z}e_i^Ae_j^Be_{i+j}^C.
\tag{6}
```
Let $`\omega`$ be a primitive $`q`$-th root of unity. Apply the unnormalized Fourier matrix
$`e_i\mapsto\sum_x\omega^{xi}e_x`$ at $`A,B`$ and its sign-reversed matrix at $`C`$. The coefficient at $`(x,y,z)`$ becomes
```math
\sum_{i,j}\omega^{(x-z)i+(y-z)j}
 =q^2\,\delta_{x,z}\delta_{y,z}.
```
Thus $`Q_q`$ is locally equivalent to $`U_{ABC}(q)`$, up to an irrelevant nonzero scalar.

Monotonicity and (4) give
```math
q=F(U_{ABC}(q))\le F(\mathcal L_q)=q^{a+b+c},
\qquad a+b+c\ge1.
\tag{7}
```
This is the existing direction of the normalization constraint. The required reverse inequality would amount to proving that this particular contraction is tight at every normalized point with (1). No such equality theorem follows from the Fourier identity.

The three-spoke contraction is tight by (4), while the subsequent parity contraction is the unproved equality case. They are different maps.

## 3. Arbitrary scalar weights and the scope of the test

A $`D`$ covector can instead assign arbitrary complex coefficients $`w_{ij}`$. Therefore every weighted Latin tensor
```math
Q_{L,w}=\sum_{i,j=1}^q
 w_{ij}e_i^Ae_j^Be_{L(i,j)}^C
```
satisfies
```math
F(Q_{L,w})\le q^{a+b+c}.
\tag{8}
```
No nonvanishing assumption on the coefficients is needed for this restriction. The upper bound follows from the completed tensor; it is not a general coefficient-removal assertion for Latin support.

Equations (4)--(8) provide a concrete mixed-tensor test for a proposed extension of an old three-party point to a normalized tripod. They do not show that every old point has such an extension, and they do not make the missing equality in (7) automatic.

