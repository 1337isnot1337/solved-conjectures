# First-order spectral points at a flattening

Status: research. The compactness and tangent construction below are proved.
The final sign inequality is unresolved. It is not implied by the
star-convexity theorem or by the edge classification.

## 1. Model and the imported interpolation theorem

Work with three-party complex tensors, tensor product regrouped by party,
and the full direct sum. A normalized spectral point is additive for full
direct sums, multiplicative for products, monotone under restriction, and
sends the three-party unit tensor $`U(r)`$ to $`r`$. Write

```math
F(W_{AB}(q))=q^x,\qquad
F(W_{AC}(q))=q^y,\qquad
F(W_{BC}(q))=q^z.
```

Here $`0\le x,y,z\le1`$. Put $`\alpha=1-x`$ and
$`\beta=1-y`$. Strassen's star-convexity theorem asserts that for
each $`t\in[0,1]`$ there exists a normalized point $`F_t`$ with

```math
x_t=1-t\alpha,\qquad y_t=1-t\beta,\qquad z_t=tz.
\tag{1}
```

This is Theorem 2.6 of *The edge of the asymptotic spectrum of tensors*,
[arXiv:2604.01386v2](https://arxiv.org/html/2604.01386v2), citing
Strassen [Str88, Theorem 6.5]. The more general graph statement is
Theorem 12.23 in Wigderson--Zuiddam's
[author-hosted final-2025 version](https://www.math.ias.edu/~avi/PUBLICATIONS/Wigderson_Zuiddam_Final_2025.pdf)
of *Asymptotic spectra: theory, applications, and extensions*.
The numbering of that PDF differs from the version cited in the edge paper.

The theorem supplies the three values (1), simultaneously, at each
parameter. It does not assert the existence of one differentiable path of
spectral points. In particular it does not assert geometric interpolation
of spectral values on arbitrary tensors. The argument below does not need
either assertion.

Let $`r_A(T)`$ denote the rank of the flattening from the $`A`$ dual
space to $`B\otimes C`$. It is itself a normalized spectral point.

## 2. A uniform bound on each fixed tensor

**Lemma.** Let $`T\ne0`$, let $`r=r_A(T)`$, and choose a presentation
in which the $`C`$ space has dimension $`n`$. Then every normalized
spectral point with wire prices $`x,z`$ satisfies

```math
r^x n^{-z}\le F(T)\le r^x n^z.
\tag{2}
```

**Proof.** Compress the $`A`$ space to its concise dimension $`r`$.
The tensor $`W_{AB}(r)W_{BC}(n)`$ restricts to $`T`$: the $`B`$
party receives one copy of each of the $`A`$ and $`C`$ indices and
applies the linear map whose coefficients are those of $`T`$.
This proves the upper bound.

For the lower bound, tensor $`T`$ with $`W_{BC}(n)`$, and contract
the original $`C`$ factor with the $`C`$ end of that wire by the
coordinate pairing. The resulting tensor has a scalar $`C`$ factor
and is precisely the original flattening of $`T`$, with its original
$`C`$ index now located at $`B`$. Its matrix rank is $`r`$.
Local maps at $`A,B`$ restrict it to $`W_{AB}(r)`$. Thus
$`W_{AB}(r)\le T W_{BC}(n)`$, which proves the lower bound. No
copying of an arbitrary factor is used. ∎

Interchanging $`B,C`$ gives a second pair of bounds. Substituting
(1) into (2), and using natural logarithms, gives

```math
-\alpha\log r-z\log n
\le \frac{\log F_t(T)-\log r}{t}
\le -\alpha\log r+z\log n
\qquad(0\lt t\le1).
\tag{3}
```

Consequently $`F_t(T)=r_A(T)+O_T(t)`$ for every fixed tensor. For
example, if $`B_T=\alpha\log r+z\log n`$, (3) gives the explicit
bound

```math
\left|\frac{F_t(T)-r}{t}\right|
\le r B_T e^{B_T}.
\tag{4}
```

The bound is uniform over the choice of the spectral lift in (1).

## 3. Simultaneous compactness and the derivation

**Proposition.** For each starting normalized point with wire prices
$`x,y,z`$, there exists a real-valued function $`D`$ on all three-party
complex tensors such that

```math
D(S\oplus T)=D(S)+D(T),
\qquad
D(S\otimes T)=r_A(S)D(T)+r_A(T)D(S),
\tag{5}
```

$`D(U(r))=0`$, and whenever $`S\le T`$ and
$`r_A(S)=r_A(T)`$, one has $`D(S)\le D(T)`$. The wire values are

```math
D(W_{AB}(q))=-\alpha q\log q,\qquad
D(W_{AC}(q))=-\beta q\log q,\qquad
D(W_{BC}(q))=z\log q.
\tag{6}
```

Moreover, if $`T\ne0`$ has the notation of Section 2, then

```math
r(-\alpha\log r-z\log n)
\le D(T)\le
r(-\alpha\log r+z\log n).
\tag{7}
```

**Proof.** Choose $`t_m=1/m`$, and choose one spectral lift $`F_m`$
of (1) for every $`m`$. Define

```math
D_m(T)=\frac{F_m(T)-r_A(T)}{t_m}.
```

The set of all finite-format complex tensors is a set: it is a countable
union of finite-dimensional coordinate spaces. Therefore we may take
the product, indexed by all these tensors, of the compact intervals in
(4). Set the zero-tensor coordinate to zero. The vectors $`D_m`$ lie
in this compact product. Choose a convergent subnet. Equivalently, choose
a nonprincipal ultrafilter on the positive integers and take the bounded
real ultralimit of every coordinate. This gives one function $`D`$
simultaneously on all tensors. Every subsequence parameter still tends
to zero. Invariance under local equivalence follows because it holds for
each $`F_m`$ and for $`r_A`$.

Additivity in (5) follows from the exact additive identity for each
$`D_m`$. For multiplication, the exact identity is

```math
D_m(ST)=r_A(S)D_m(T)+r_A(T)D_m(S)
                  +t_m D_m(S)D_m(T).
```

The last term tends to zero by the coordinate bounds. This proves the
product rule. If $`S\le T`$ and their $`A`$ ranks agree, subtract that
common rank from $`F_m(S)\le F_m(T)`$ and divide by $`t_m>0`$.
Taking the subnet limit proves monotonicity in the stated, restricted
sense. Normalization gives $`D_m(U(r))=0`$ identically.

The explicit wire formulas (6) follow by differentiating the scalar
expressions $`q^{1-t_m\alpha}`$, $`q^{1-t_m\beta}`$, and
$`q^{t_mz}`$. Finally (3), together with
$`(e^{t b}-1)/t\to b`$, gives (7). ∎

The same monotonicity holds for degenerations or asymptotic restrictions
whose source and target $`A`$ ranks agree, because normalized spectral
points are monotone for those relations. No order comparison for $`D`$
is inferred when the leading flattening ranks differ.

## 4. A bound from an exact slice cover

Write $`T=\sum_{i=1}^{r}a_i\otimes M_i`$, where $`a_i`$ is a basis
of the concise $`A`$ space, and let $`\rho_i`$ be the matrix rank of
$`M_i\in B\otimes C`$. Each $`M_i`$ is nonzero. There is a
restriction

```math
T\le\bigoplus_{i=1}^{r}(a_i\otimes M_i),
```

obtained by merging the $`B`$ and $`C`$ block spaces. Both sides
have $`A`$ rank $`r`$. Each summand is locally equivalent to
$`W_{BC}(\rho_i)`$ with a rank-one $`A`$ factor. Therefore (5)--(6)
give

```math
D(T)\le z\sum_{i=1}^{r}\log\rho_i.
\tag{8}
```

This holds for every choice of the $`A`$ basis. It does not imply
the sign needed in the next section.

## 5. Exact scope of the missing sign inequality

The crossing-wire identity gives

```math
M_q=W_{AB}(q)W_{AC}(q)W_{BC}(q),
\qquad
D(M_q)=q^2\log q\,(z-\alpha-\beta).
\tag{9}
```

Thus a proof that every derivation obtained in Section 3 satisfies
$`D(M_2)\le0`$ would prove $`x+y+z\le2`$ for every starting
normalized point, and hence $`\omega_{\mathbb C}=2`$ by Strassen
duality. Conversely, if $`\omega_{\mathbb C}=2`$, every such
derivation has $`D(M_q)=0`$. For the reverse implication here, use
$`\widetilde Q(M_q)=q^2`$, the classical result stated as Theorem
4.22 in the cited Wigderson--Zuiddam version, to get
$`x+y+z\ge2`$ for every normalized point.

This equivalence concerns the derivations obtained from actual spectral
lifts in Section 3. It does not assert that every function satisfying
(5)--(8) integrates to a path of spectral points. A classification of
all such abstract functions would be a stronger route and remains
unproved.

The already established edge classification describes a point exactly
at a unit wire price. It does not give the sign of a transverse
derivative. Likewise, the midpoint rescaling of a small triangle can
multiply its first-order perimeter excess while also multiplying its
distance from the flattening vertex. That rescaling alone does not
contradict a global bound on the perimeter.
