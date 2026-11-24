# Exact flag-exchange bound with a changed spectator catalyst

Status: proved bounds for specified exact restriction classes. The
first bound allows a changed spectator catalyst. The final section
allows source-only full units but requires a common invertible map at
$`C`$ on their separate summands. No bound here is proved for
arbitrary degenerations or arbitrary source-only full-unit maps.

The general construction target and its permitted flag loss are in
[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md), Sections 2--4.

Put

```math
L_{q,R}=U_{ABC}(q)U_{ABD}(R)W_{CD}(q),\qquad
T_{q,r}=U_{ACD}(q)U_{BCD}(q)W_{AB}(r).
```

Let $`Z,Z'`$ be nonzero tensors on $`A,B,D`$, with a scalar C factor.
If $`L_{q,R}Z\ge T_{q,r}Z'`$ by exact restriction, then

```math
R\sqrt{\frac{r_A(Z)r_B(Z)}{r_A(Z')r_B(Z')}}\ge r\sqrt q.
```

Indeed the source and target C dimensions both equal $`q^2`$, and the
target is concise at C. The C map is therefore invertible. Transport
the source's q coordinate block projections, each of rank q, to the
target C space, calling the resulting projections $`P_h`$. For each h,
the projected source has A and B flattening ranks respectively
$`Rr_A(Z)`$ and $`Rr_B(Z)`$.

On the target write

```math
(P_hT_{q,r})=\sum_{i,j=1}^{q}\sum_{k=1}^{r}
 A_{i,k}B_{j,k}(P_hC_{i,j})D_{i,j}.
```

Let $`a_h,b_h`$ count the rows and columns, respectively, represented
among pairs $`(i,j)`$ with $`P_hC_{i,j}\ne0`$. Distinct D tags and wire
indices make the A and B flattening ranks exactly $`ra_h`$ and $`rb_h`$.
Since $`P_h`$ has rank q, at least q of its columns are nonzero, so
$`a_hb_h\ge q`$. Multiplicativity of flattening rank under products and monotonicity
under restriction give $`Rr_A(Z)\ge ra_h r_A(Z')`$ and
$`Rr_B(Z)\ge rb_h r_B(Z')`$. Multiplying these inequalities and
using $`a_hb_h\ge q`$ proves the bound.

For the stronger source
$`U_{ABC}(q)W_{AD}(N)W_{BD}(N)W_{CD}(q)`$, the identical proof replaces
R by N, since its fixed-h sector also has A and B rank N.

For an explicit stage catalyst let

```math
X=W_{AD}(d)W_{BD}(d),\quad Y=W_{AB}(d),\quad
C_M=\bigoplus_{k=0}^{M}X^kY^{M-k},
```

where the full sum is on ABD. Then

```math
r_A(C_M)=r_B(C_M)=(M+1)d^M.
```

For $`Z'=C_{M-L}Y^L`$ the A and B rank ratio is
$`(M+1)/(M-L+1)`$. Hence an exact flag exchange with this boundary
change must satisfy

```math
\frac Rr\,\frac{M+1}{M-L+1}\ge\sqrt q.
```

Discarding a sublinear fraction of stages makes the second factor tend
to one. It does not remove the first factor in an exact construction.
In a degeneration the transported projections can diverge, so this
argument cannot be passed to a limit without another proof.

## Source-only full units with a common C map

There is a related exact restriction bound even after adding a
source-only full unit of rank $`r`$. Put

```math
S_{q,N}=U_{ABC}(q)W_{AD}(N)W_{BD}(N)W_{CD}(q).
```

Consider $`r`$ full direct-sum copies of $`S_{q,N}`$, or of $`L_{q,N}`$,
and suppose that the $`C`$ map on every copy is the same invertible
map $`F:\mathbb C^{q^2}\to\mathbb C^{q^2}`$. If their
sum restricts exactly to $`T_{q,N'}`$, then

```math
\frac{rN}{N'}\ge\sqrt q.
```

For each original $`q`$-dimensional sector $`C_h`$, transport its
projector through $`F`$ to a rank-$`q`$ projector $`P_h`$ on the target.
Applying $`P_h`$ isolates the $`h`$ sector in every source copy.
The projected source consequently has $`A`$ and $`B`$ flattening
ranks at most $`rN`$. On the target, let $`a_h,b_h`$ count the
represented row and column labels among the pairs $`(i,j)`$ for which
$`P_hC_{i,j}\ne0`$. As above, $`a_hb_h\ge q`$, while the two ranks
are $`N'a_h,N'b_h`$. Thus $`rN\ge N'a_h`$ and $`rN\ge N'b_h`$.
Multiplication gives the claim.

In particular, $`r=q^{o(1)}`$ and $`N/N'=q^{o(1)}`$ are impossible
within this exact common-map class. A construction meeting the general
criterion must use different $`C`$ maps, or a degeneration not covered
by the argument. For varying Laurent maps the transported projectors
may diverge, so no border or asymptotic obstruction follows from this
proof. A bounded flag loss is allowed in the general criterion;
this bound excludes it only under the stated common-map hypothesis.
