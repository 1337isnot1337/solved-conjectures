# Independent review of the substochastic-core transfer

Reviewed on 20 November 2026 (America/Chicago). The reviewed note is
[gyires_substochastic_transfer.md](gyires_substochastic_transfer.md).
Its mathematical reduction is correct. It supplies a sufficient route to
a counterexample, not a proof or disproof of Gyires's conjecture. No
negative core has been supplied.

## Exact completion and multiplication

For a substochastic core $`B`$ of order $`m`$, write

```math
u_B=\mathbf1-B\mathbf1,\quad
v_B=\mathbf1-B^T\mathbf1,\quad
q_B=\mathbf1^Tu_B=\mathbf1^Tv_B.
```

The proposed completion is nonnegative for $`M\geq m`$, since
$`0\leq q_B\leq m`$. Its row and column sums are one.

Block multiplication gives

```math
D_M=BC+u_Bv_C^T/M.
```

For example, its row deficit is exactly

```math
\mathbf1-D_M\mathbf1
=Bu_C+u_B(1-q_C/M),
```

which is the factor appearing in the top-right block of
$`C_M(B)C_M(C)`$. The column calculation is its transpose analogue.
The bottom-right block is then forced by the stochastic line sums.
Thus

```math
C_M(B)C_M(C)=C_M(D_M)
```

is an exact identity. It is not an approximation that discards a tail
correction. Since the product is nonnegative and doubly stochastic,
$`D_M`$ is substochastic, including at saturated margins.

The three resulting cores are consequently

```math
BB^T+uu^T/M,\quad B^TB+vv^T/M,\quad B^2+uv^T/M.
```

The locations of the transposes and the rank-one corrections are correct.

## Counting normalization and endpoint uniformity

For $`k`$ core-to-core matches and $`h=m-k`$, choosing the tail partners
contributes $`(M)_h^2`$; matching the remaining tail vertices contributes
$`(M-h)!b^{M-h}`$, where $`b=(M-q)/M^2`$. Their product is the coefficient
in equation (5) of the note.

After division by $`d_{M+m}`$, the scalar factor is

```math
\frac{d_M}{d_{M+m}}(1-q/M)^M
\frac{(M)_h}{M^h}(1-q/M)^{-h}.
```

For fixed $`m`$, this tends uniformly on $`0\leq q\leq m`$ and
$`0\leq h\leq m`$ to $`e^{m-q}=e^s`$. The other factors in the finite
matching sum are bounded polynomials on the compact set of substochastic
cores. Therefore the normalized permanent tends uniformly to $`F(B)`$.

No individual row or column deficit is divided out. Deficits equal to
zero merely remove terms of the matching sum. The proof uses $`M>m`$
when manipulating powers of $`b`$, so the possible zero tail block at
$`M=m,q=m`$ creates no singular endpoint in the limiting argument.

Uniformity is sufficient to substitute each varying core above, since
it converges to $`BB^T`$, $`B^TB`$, or $`B^2`$, and $`F`$ is continuous.

## Counterexample scope

Dividing the finite Gyires difference by $`d_{M+m}^2`$ gives the exact
limit

```math
4F(B)^2-F(BB^T)-F(B^TB)-2F(B^2).
```

A strictly negative value therefore gives a genuine counterexample for
every sufficiently large integer $`M`$. A zero limit supplies no sign
information.

The distinction from the stronger Gram inequality is essential. A core
with $`F(B)^2\lt F(BB^T)`$ need not make the displayed four-term difference
negative. The note does not make that inference.

For a symmetric core, all three product cores coincide with $`B^2`$,
so the criterion simplifies correctly. For an arbitrary core, the
symmetric dilation

```math
D=\begin{pmatrix}0&B\\B^T&0\end{pmatrix}
```

satisfies

```math
F(D)=F(B)^2,\qquad
F(D^2)=F(BB^T)F(B^TB).
```

These follow from independent row/column permutation invariance and
block multiplicativity of the matching sum. The product criterion (9)
is therefore sufficient, but a failure in only one Gram factor still
does not establish it.

The converse reduction is correctly withheld. For example, if $`B`$
itself is doubly stochastic of order $`m`$, then $`F(B)=e^m\mathop{\mathrm{per}}B`$.
The limiting inequality then carries the weaker constant $`e^{-m}`$,
not the finite-order constant $`d_m=m!/m^m`$. Thus the all-core limiting
inequality cannot simply be substituted for finite-order Gyires.

## Additional checks

The Poisson interpretation has the stated normalization: the total
intensity of its independent variables is $`2m-s`$, and the all-one event
selects precisely the finite weighted matchings. Hence its probability
is $`e^{s-2m}Z(B)`$.

The cycle formula used to refute the additive shortcut is correct,
including orders three and four. At order six the excess is exactly
$`73/41472>0`$, whereas the Gram ratio is $`1/50>d_6=5/324`$.
This refutes only the shortcut.

The current [C20 page](https://yair-lavi.com/mincs-list/conjecture-20/index.html)
was refreshed for the review. It still gives the full four-term statement
as open. No historical-priority claim is made for this transfer.
