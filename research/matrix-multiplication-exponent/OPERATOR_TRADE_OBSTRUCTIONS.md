# Two obstructions to proposed geodesic operator maps

Status: proved obstruction to the specified classes of maps at $`C`$.
It allows arbitrary outer mixing at $`A,B`$ but does not exclude arbitrary
maps at $`C`$ or a general geodesic tensor trade. Section 2 also gives the exact full-rank residual of one
two-family Weyl candidate; this residual is not a truncation error.

## 1. Row- and column-supported maps at $`C`$

Put

```math
S_{q,N}=U_{ABC}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N),
\qquad
T_{q,N'}=U_{ACD}(q)U_{BCD}(q)W_{AB}(N').
```

The source has coordinates
$`A_{h,a},B_{h,b},C_{h,c},D_{c,a,b}`$, and the target has
coordinates $`A_{u,k},B_{v,k},C_{u,v},D_{u,v}`$.
Consider an exact restriction
$`U_{ABCD}(r)S_{q,N}\ge T_{q,N'}`$.
The full unit gives $`r`$ separate source families. In each
family, impose one of these conditions:

- Row support: the image of every $`C_{h,c}`$ lies in
  $`\mathop{\mathrm{span}}_v C_{h,v}`$.
- Column support: the image of every $`C_{h,c}`$ lies in
  $`\mathop{\mathrm{span}}_u C_{u,h}`$.

There is no support assumption on the maps at $`A,B,D`$.
In particular, the outer $`A,B`$ indices may be mixed arbitrarily.

**Proposition.** Every such exact restriction obeys

```math
qN'\le rN.                                             \tag{1}
```

**Proof.** Write the target spaces as
$`\mathcal U=\bigoplus_u U_u`$ and
$`\mathcal V=\bigoplus_v V_v`$, with every block of
dimension $`N'`$. Let $`r_{\mathrm{row}},r_{\mathrm{col}}`$
be the numbers of the two kinds of families. For each $`u`$, let
$`R_u\subseteq\mathcal V`$ be the sum of the images of source
$`B`$ sector $`h=u`$ across the row-supported families.
For each $`v`$, let $`Q_v\subseteq\mathcal U`$ be the sum
of the images of source $`A`$ sector $`h=v`$ across the
column-supported families. Thus

```math
\dim R_u\le r_{\mathrm{row}}N,\qquad
\dim Q_v\le r_{\mathrm{col}}N.
```

At output $`C_{u,v},D_{u,v}`$, every row-supported contribution
has its $`B`$ factor in $`R_u`$. Every column-supported
contribution has its $`A`$ factor in $`Q_v`$. Apply the
quotient maps
$`\pi_v:\mathcal U\to\mathcal U/Q_v`$ and
$`\rho_u:\mathcal V\to\mathcal V/R_u`$ to this coefficient.
They annihilate all source contributions. Consequently they annihilate
the target identity tensor of rank $`N'`$ between $`U_u,V_v`$.

Put
$`b_{uv}=\dim(U_u\cap Q_v)`$ and
$`c_{uv}=\dim(V_v\cap R_u)`$.
The two quotient restrictions have ranks $`N'-b_{uv}`$ and
$`N'-c_{uv}`$. In bases of $`U_u,V_v`$, their action on the
identity tensor is the matrix product
$`(\pi_v|_{U_u})(\rho_u|_{V_v})^{\mathsf T}`$.
Sylvester's rank inequality gives

```math
0\ge (N'-b_{uv})+(N'-c_{uv})-N',
\qquad b_{uv}+c_{uv}\ge N'.                           \tag{2}
```

Because the $`U_u`$ form a direct sum,
$`\sum_u b_{uv}\le\dim Q_v`$. Similarly,
$`\sum_v c_{uv}\le\dim R_u`$. Summing (2) gives

```math
q^2N'\le q(r_{\mathrm{row}}+r_{\mathrm{col}})N=qrN.
```

This proves (1). Only the coefficient with matching output tags at
$`C,D`$ was used. Arbitrary maps at $`D`$ and cancellations
in other coefficients do not change the argument. ∎

For two families with
$`C_{h,c}\mapsto C_{h,c}`$ and
$`C_{h,c}\mapsto C_{c,h}`$, this gives
$`N/N'\ge q/2`$ even with fully mixed maps at $`A,B`$.
More generally, no construction in these support classes can have
both $`r=q^{o(1)}`$ and $`N/N'=q^{o(1)}`$.
Dense maps at $`C`$ and arbitrary degenerations are outside
the proposition's scope.

The claim-audit agent first proved the special case with an unmixed
$`A`$ row in one family and an unmixed $`B`$ column in the
other. The barrier-constructive agent removed those two assumptions
by the quotient argument. The root agent observed its extension to
any number of row- and column-supported families and checked the proof.

## 2. The two-family Weyl coefficient has an invertible off-cycle block

Work over $`\mathbb C`$, with indices in $`\mathbb Z/q\mathbb Z`$.
Let $`x_a`$ denote multiplication by a polynomial variable and
$`\partial_a`$ its formal derivative. Let the invertible linear
coordinate permutation $`R_s`$ satisfy

```math
R_s x_a=x_{a+s}R_s.
```

Here is the full candidate setup. Fourier transformation changes the
source $`U_{ABC}(q)`$ into the constraint
$`\alpha+\beta+\gamma=0`$. The source party coordinates are
$`A_{\alpha,a},B_{\beta,b},C_{\gamma,c},D_{c,a,b}`$, where
$`a,b`$ are neutral flag indices. Both full-unit families use

```math
C_{\gamma,c}\longmapsto C_{(c,-\gamma-c)}.
```

The first family applies $`x_\alpha`$ to the flag at $`A`$ and
the identity at $`B`$; the second applies the identity at $`A`$
and the transpose of $`x_{-\beta}`$ at $`B`$. For output
$`D_{(i,j)}`$, the $`D`$ map retains only $`c=i`$ and uses
flag matrices $`-\partial_iR_{i+j}`$ and
$`+\partial_iR_{i+j}`$, respectively. Fix the standard coefficient
convention in which these contractions give
$`-x_\alpha\partial_iR_{i+j}`$ and
$`+\partial_iR_{i+j}x_{-\beta}`$ on the output flag.

The complete coefficient at the resulting output labels is therefore

```math
A_\alpha B_\beta C_{(i,\alpha+\beta-i)}D_{(i,j)}:
\qquad
K_{\alpha,\beta;i,j}
=\partial_iR_{i+j}x_{-\beta}
 -x_\alpha\partial_iR_{i+j}.                    \tag{3}
```

This is the full coefficient before restricting the output to the
desired cycle support. Normal ordering with the Weyl relation gives

```math
K_{\alpha,\beta;i,j}
=\delta_{\beta,j}R_{i+j}
 +(x_{i+j-\beta}-x_\alpha)\partial_iR_{i+j}.    \tag{4}
```

On the desired matching sector $`\alpha+\beta=i+j`$, the second
term vanishes and $`\delta_{\beta,j}=\delta_{\alpha,i}`$.
This explains the apparent commutator computation on that sector.
Away from it, replacing one Kronecker delta by the other is invalid,
and the second term in (4) is present.

For a concrete off-cycle output, take $`q=3`$ and

```math
i=0,\qquad j=1,\qquad\alpha=\beta=1.
```

Then $`C=(0,2)`$ and $`D=(0,1)`$, so this is outside the target
support. Its coefficient is

```math
K=(I+(x_0-x_1)\partial_0)R_1.                  \tag{5}
```

In particular, $`K(1)=1`$. The off-cycle term already acts nontrivially
on the vacuum and is unrelated to a high-degree cutoff boundary.

There is a stronger obstruction. For any integer $`L\ge0`$, let
$`\mathcal P_{\le L}`$ be the polynomials of total degree at most
$`L`$ in the $`q`$ variables, and write
$`N=\dim\mathcal P_{\le L}`$. Both factors in (5) preserve
this space. Change coordinates to

```math
z=x_0-x_1,\qquad w=x_1,
```

retaining all other variables. In these coordinates
$`\partial_0=\partial_z`$. Thus the first factor of (5) is
$`I+z\partial_z`$, whose eigenvalue on a monomial with
$`z`$-degree $`a`$ is $`1+a`$. Every eigenvalue is nonzero over
$`\mathbb C`$. The second factor $`R_1`$ is an invertible
coordinate permutation. Consequently

```math
\mathop{\mathrm{rank}}K=N
\quad\text{on every }\mathcal P_{\le L}.        \tag{6}
```

This uses exact polynomial operators. Although multiplication alone
can temporarily increase the degree by one in (3), differentiating
returns it to the cutoff. One may compute (3) through degree $`L+1`$,
or use the already normal-ordered formula (5) on the cutoff. No
commutator relation with an artificial projected multiplication is
being assumed.

If instead each multiplication is projected immediately back to
$`\mathcal P_{\le L}`$, the resulting matrix $`\widehat K`$
can differ from $`K`$ only on input monomials of degree exactly
$`L`$. That boundary subspace has dimension

```math
b=\binom{L+q-1}{q-1},\qquad
\frac bN=\frac q{L+q}.
```

Thus $`\mathop{\mathrm{rank}}(\widehat K-K)\le b`$ and
$`\mathop{\mathrm{rank}}\widehat K\ge N-b`$. The boundary
does not turn this into a low-rank off-cycle residual.

### 2.1 Near-full flag retention cannot repair this formula

Allow arbitrary further input and output restrictions inside the fixed
outer blocks $`A_1,B_1`$. Write them as matrices
$`P,Q:\mathbb C^N\to\mathbb C^{N'}`$. To retain a desired
rank-$`N'`$ diagonal flag block, both must have rank $`N'`$.
Eliminating the off-cycle coefficient (5) requires

```math
PKQ^{\mathsf T}=0.
```

Because $`K`$ is invertible, the kernel of $`PK`$ has dimension
$`N-N'`$. It must contain the $`N'`$-dimensional image of
$`Q^{\mathsf T}`$. Hence

```math
N'\le N-N',\qquad\text{or equivalently}\qquad
N'\le N/2.                                      \tag{7}
```

Thus ordinary polynomial truncation followed by arbitrary flag
restrictions in these fixed outer blocks cannot retain
$`N'=(1-o(1))N`$ while removing this residual. This conclusion
concerns the displayed candidate and such post-restrictions. It does
not exclude new source maps that mix the outer $`A,B`$ labels, change
the $`C`$ supports, or add other families whose coefficients cancel
the residual before the final restrictions.

The same conclusion holds with the immediately projected
multiplications just discussed. Sylvester's rank inequality gives

```math
\mathop{\mathrm{rank}}(P\widehat KQ^{\mathsf T})
\ge\mathop{\mathrm{rank}}\widehat K+2N'-2N.
```

Consequently annihilating that residual forces

```math
N'\le\frac{N+b}{2}
=\frac N2\left(1+\frac q{L+q}\right).           \tag{8}
```

In the large-cutoff regime $`L/q\to\infty`$, this still allows
at most a $`1/2+o(1)`$ fraction of the flags. The obstruction
therefore persists even after accounting for the actual finite
operator boundary terms.

A constant factor loss such as $`N'=N/2`$ would still satisfy the
general construction criterion when $`q\to\infty`$. Thus (7)--(8)
alone do not exclude that criterion. A stronger obstruction applies
to exact maps retaining the same invertible $`C`$ map across all
families: [FLAG_EXCHANGE_OBSTRUCTIONS.md](FLAG_EXCHANGE_OBSTRUCTIONS.md)
proves $`rN/N'\ge\sqrt q`$. That argument also has a restricted
scope; it does not cover distinct $`C`$ maps or arbitrary
degenerations.

### 2.2 Why the obvious diagonal quotient is insufficient

One might try identifying all the polynomial variables so that
$`x_{i+j-\beta}-x_\alpha`$ becomes zero. Formula (4) would then
retain $`\delta_{\beta,j}`$ independently of $`\alpha`$.
Thus even a formal removal of the displayed difference term would
leave the wrong $`A,C,D`$ incidences. The equality
$`\alpha=i`$ cannot be inserted after the computation; it is one
of the missing output-support conditions.

The full off-support coefficient was identified independently in
internal review by the root and claim-audit agents. The invertibility
certificate in (5)--(6) is due to the claim-audit agent. The
barrier-constructive agent supplied and then withdrew the candidate
maps after this coefficient check. These are internal checks, not an
external review or a computer-verified proof of the exponent.
