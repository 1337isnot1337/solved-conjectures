# An unrestricted asymptotic upper bound for uncrossing overhead

Status: proved deduction from spectral duality, three-party spectral normalization, and the four-cycle asymptotic-subrank theorem. A direct construction below factors the conversion through matrix multiplication algorithms and four-cycle distillation. It does not supply new coefficient tables for those imported algorithm families. The exponent is not proved sharp, and zero overhead remains unresolved.

Fix $`q\ge2`$ and work over $`\mathbb C`$ with four parties $`I=\{A,B,C,D\}`$. Set

```math
X_q=U_{ABC}(q)U_{ABD}(q),\qquad
Y_q=U_I(q)W_{AB}(q).
```

The products are regrouped by party. Let $`b_n`$ be the least positive integer for which

```math
U_I(b_n)X_q^{\otimes n}\ \ge\ Y_q^{\otimes n}.       \tag{1}
```

All four local maps in (1) are arbitrary. In particular no monomial or support-preserving assumption is imposed on the $`C,D`$ maps. The sequence is submultiplicative, so its overhead exponent exists:

```math
\beta_q=\lim_{n\to\infty}\frac{\log_qb_n}{n}
=\inf_{n\ge1}\frac{\log_qb_n}{n}.
```

## Operational spectral duality

For a normalized four-party spectral point $`F`$, put

```math
p_F=\log_qF(W_{AB}(q)),\qquad
h_F=\log_qF(U_{ABC}(q))+\log_qF(U_{ABD}(q)).
```

Then

```math
\beta_q=\max_F(1+p_F-h_F).                         \tag{2}
```

The right side is independent of the integer $`q`$, by the power law for wires and subset units; write the common value as $`\beta`$.

For completeness, (2) follows from the same form of Strassen duality used in the tetrahedral overhead note: Christandl, Vrana and Zuiddam, *Universal points in the asymptotic spectrum of tensors*, [arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3), Theorem 1.1. Monotonicity in (1) immediately gives the lower bound. For the converse, let $`a/b`$ be any nonnegative rational strictly above the maximum in (2). Spectral duality gives

```math
\bigl(U_I(q^a)X_q^{\otimes b}\bigr)^{\otimes(n+s_n)}
\ \ge\ Y_q^{\otimes bn},\qquad s_n\ge0,\quad s_n=o(n).
```

Since $`R(X_q)\le q^2`$, a full unit of size $`q^{2bs_n}`$ supplies the extra $`bs_n`$ source copies. Thus

```math
U_I\!\left(q^{an+(a+2b)s_n}\right)X_q^{\otimes bn}
\ \ge\ Y_q^{\otimes bn}.
```

Passing to the limit on this subsequence, and then taking rationals decreasing to the maximum, proves the upper bound in (2). The full limit exists by submultiplicativity. The maximum is nonnegative: flattening across $`A\mid BCD`$ gives $`p_F=1`$ and $`h_F=2`$, hence gap zero.

## A bound using the four-cycle

Let $`\omega=\omega_{\mathbb C}`$. Then

```math
\boxed{\qquad 0\le\beta\le\frac{\omega-2}{\omega-1}.\qquad}          \tag{3}
```

Fix one point $`F`$, suppress its subscript, and define

```math
s=d_{AC}+d_{BC}+d_{AD}+d_{BD}.
```

The four wires in this sum form the cycle $`A-C-B-D-A`$. Its asymptotic subrank is $`q^2`$. The imported result is Vrana and Christandl, *Entanglement distillation from Greenberger-Horne-Zeilinger shares*, [arXiv:1603.03964v2](https://arxiv.org/pdf/1603.03964v2), Theorem 1: for the product of binary units on the hyperedges of a multihypergraph, the asymptotic logarithmic full-unit rate is its minimum cut. The cycle's minimum cut is two. Applying this at base two and then using the dimension-independent wire exponents gives, for the present point and every integer base $`q`$,

```math
s\ge2.                                             \tag{4}
```

No helper-party or terminal-subset version of a mincut theorem is used; all four vertices of this cycle are terminals.

Let $`u_1=\log_qF(U_{ABC}(q))`$ and $`u_2=\log_qF(U_{ABD}(q))`$, so $`h=u_1+u_2`$. Each subset unit restricts to $`W_{AB}(q)`$, hence

```math
h\ge2p.                                            \tag{5}
```

For the other lower bound on $`h`$, restrict $`F`$ to tensors supported on either three-party face. The cover-functional classification in `NORMALIZED_EXTENSION.md`, Lemma 1a, gives a normalized three-party point after raising this restriction to power $`1/u_i`$ when $`u_i>0`$. If $`u_i=0`$, all of its nonzero tensor values are one and the corresponding wire exponents vanish. In both cases, the definition of $`\omega`$ as the maximum normalized triangle perimeter gives

```math
p+d_{AC}+d_{BC}\le\omega u_1,\qquad
p+d_{AD}+d_{BD}\le\omega u_2.
```

Adding these and using (4) yields

```math
h\ge\frac{2p+s}{\omega}\ge\frac{2p+2}{\omega}.     \tag{6}
```

Since $`0\le p\le1`$, (5) and (6) imply

```math
1+p-h\le
\min\left\{1-p,\ (1+p)\left(1-\frac2\omega\right)\right\}.        \tag{7}
```

The first affine function in (7) is decreasing in $`p`$ and the second is increasing. Because $`\omega\ge2`$, their intersection is

```math
p=\frac1{\omega-1},\qquad
1-p=\frac{\omega-2}{\omega-1}.
```

For the relevant range $`2\le\omega\le3`$, this intersection lies in $`[0,1]`$. The maximum of their minimum is the displayed value; at $`\omega=2`$ the second function is identically zero and the same conclusion holds. Taking the maximum over $`F`$ in (2) proves (3).

## A direct construction attaining the same upper bound

The bound in (3) does not require spectral duality for its upper-bound direction. It has a construction using only matrix multiplication rank algorithms and the cited full-party distillation theorem.

Let $`\tau\ge\omega`$ be rational, and put

```math
t=\frac1{2(\tau-1)},\qquad
a=\frac{\tau}{2(\tau-1)},\qquad
\varepsilon=\frac{\tau-2}{\tau-1}=1-2t.
```

Thus $`0<a\le1`$ for $`\tau\ge2`$. Work first at integers $`n`$ for which $`tn,an,\varepsilon n`$ are integral. Split each of the two face units in $`X_q^{\otimes n}`$ as

```math
U_{ABC}(q^n)=U_{ABC}(q^{an})U_{ABC}(q^{(1-a)n}),
```

and similarly on $`ABD`$. The matrix multiplication rank bound converts the first factor on each face into the triangle tensor with edge size $`q^{tn}`$. More precisely, $`\widetilde R(M_q)=q^\omega\le q^\tau`$ implies exact rank algorithms for $`M_{q^{tn}}`$ of size at most $`q^{\tau tn+o(n)}=q^{an+o(n)}`$. A full four-party unit of subexponential size supplies the extra face units, by contracting its unused party. Convert each remaining face factor of size $`q^{(1-a)n}`$ directly to the $`AB`$ wire by contracting the third party.

The two triangle $`AB`$ edges, together with these two remaining wires, yield an $`AB`$ wire whose logarithmic size is

```math
2tn+2(1-a)n=n.                                    \tag{8}
```

The other four triangle edges form precisely $`A-C-B-D-A`$, with edge size $`q^{tn}`$. By the all-terminal asymptotic-subrank theorem, this cycle restricts to a full four-party unit of size

```math
q^{2tn-o(n)}.
```

Tensor it with a source full unit of size $`q^{\varepsilon n+o(n)}`$. The $`o(n)`$ term pays both the distillation deficit and the two preceding matrix multiplication algorithm overheads. Since $`\varepsilon+2t=1`$, the result restricts to the full unit of size $`q^n`$. Together with the independent $`AB`$ wire in (8), this is $`Y_q^{\otimes n}`$.

All transformations act separately at the four parties. The face matrix multiplication maps act on one factor of each party's local tensor product, and the subsequent cycle maps act on the four remaining wire factors. Integer divisibility can be handled along a subsequence; submultiplicativity of $`b_n`$ gives the same overhead exponent on all $`n`$. Equivalently, rounding changes only bounded logarithmic factors. Letting rational $`\tau`$ decrease to $`\omega`$ proves the upper bound in (3) directly.

At $`\tau=9/4`$, the resource allocation is exact at the exponent level:

| Resource | Exponent of its size, divided by $`n`$ |
| --- | --- |
| Part of each face unit used for its matrix multiplication algorithm | $`9/10`$ |
| Each of the six resulting triangle wires, before combining shared edges | $`2/5`$ |
| Part of each face unit converted directly to an $`AB`$ wire | $`1/10`$ |
| Combined $`AB`$ wire | $`2(2/5)+2(1/10)=1`$ |
| Full unit distilled from the four-cycle | $`4/5`$ |
| Additional source full unit | $`1/5`$ |

The input algorithm families and the distillation maps remain the imported ingredients. This construction specifies how they compose; it does not improve their individual rank or subrank bounds.

## Consequences and limits

The upper bound $`\omega\le9/4`$, from Zhou, *Asymptotic Rank of Weighted Graph Tensors via Completely Positive Bounds*, [arXiv:2610.34273v3](https://arxiv.org/html/2610.34273v3), Theorem 4.10 at three vertices, turns (3) into

```math
\beta\le\frac15.
```

Consequently there are unrestricted exact restrictions of the form

```math
U_I\!\left(q^{n/5+o(n)}\right)X_q^{\otimes n}
\ \ge\ Y_q^{\otimes n},                           \tag{9}
```

with integer overhead obtained by rounding upward. This improves the previously recorded square-root overhead exponent. The preceding construction reduces its local maps to the imported matrix multiplication and four-cycle-distillation families; no new closed coefficient formula for the composite maps is asserted.

If $`\omega=2`$, then (3) forces $`\beta=0`$. Moreover $`X_q\ge U_I(q)`$: in its defining sum over $`i,j`$, keep only $`i=j`$ at $`A`$ and $`B`$. Thus subexponential full-unit overhead can be supplied by $`o(n)`$ additional copies of $`X_q`$, and $`\beta=0`$ implies $`X_q\gtrsim Y_q`$ in the ordinary asymptotic-restriction convention.

Conversely, any proof that $`\beta>0`$ would prove $`\omega>2`$. Quantitatively, rearranging (3) gives

```math
\omega\ge\frac{2-\beta}{1-\beta}
\qquad\text{whenever a positive lower bound on }\beta\text{ is established}.
```

No such positive lower bound is established here. Finite impossibility, equal-power impossibility, and impossibility with a common full-unit catalyst remain compatible with (9) and with $`\beta=0`$. The reverse implication $`\beta=0\Rightarrow\omega=2`$ is not proved or assumed.
