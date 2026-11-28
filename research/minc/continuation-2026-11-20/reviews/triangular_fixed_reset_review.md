# Independent review of the fixed-reset obstruction

Date: 20 November 2026, America/Chicago. Reviewer: `minc_regular`.

Reviewed `research/minc/continuation-2026-11-20/sign/triangular_fixed_reset_obstruction.md` and
inspected its symbolic checker. The direction-update operators, conjugacy,
pole asymptotic, and stated restriction to one fixed reset rule are correct.
No previously checked finite matrix cases were rerun for this review.

## Independent derivation from the replacement hierarchy

For an old replacement set $`S`$, use $`F_S,Q_S`$ as in
`triangular_recurrence_review.md`, and write
$`w_S=\prod_{j\in S}w_j`$. For
$`h(t)=\sum_SP_Sw_St^{|S|}`$, direct counting gives

```math
\sum_S F_Sw_St^{|S|}=h'(t),\qquad
 \sum_S Q_Sw_St^{|S|}=\frac12h''(t).
```

Each singleton or pair of removed indices is counted exactly once for
each corresponding old replacement set. Applying these identities to the
four full-reset formulas gives, in the order neither, first, second, or
both new variables replaced, the polynomials

```math
\begin{aligned}
R_0&=(t^2-1)h''+2th'+2h,
\\ R_\alpha&=(t^2-1)h''+(4t-2)h'+2h,
\\ R_\beta&=(t^2-1)h''+(4t+2)h'+2h,
\\ R_{\alpha\beta}&=(t^2-1)h''+6th'+6h.
\end{aligned}
```

The new direction restriction is
$`R_0+\alpha tR_\alpha+\beta tR_\beta+\alpha\beta t^2R_{\alpha\beta}`$.
Collecting its coefficients reproduces all three operator coefficients
in equations (1)--(2) of the main note. This derivation does not substitute
the new variables before the partial derivatives are taken.

For $`(\alpha,\beta)=(-1,+1)`$, let
$`f(t)=1-t^2`$ and $`\mathcal Ah=D_t(fh)`$. The resulting operator is
$`\mathcal L=-\mathcal A^2`$, namely

```math
\mathcal Lh=-f^2h''+6tfh'+(2-6t^2)h.
```

Since $`D_x=fD_t`$ under $`t=\tanh x`$, the map
$`(\mathcal Uh)(x)=f(\tanh x)h(\tanh x)`$ satisfies
$`\mathcal U\mathcal A=D_x\mathcal U`$. Its value at zero equals
the value of $`h`$ at zero. Induction therefore gives precisely

```math
P_k=(-1)^k(\mathcal Uh)^{(2k)}(0).
```

## Pole calculation

Only the even part of $`h`$ contributes. If this part is zero, all the
displayed permanents vanish, while the triangular determinants remain
nonzero.

Otherwise $`Q(t)=(1-t^2)h_{\mathrm{even}}(t)`$ has even degree
$`r\ge2`$, with nonzero leading coefficient $`q_r`$. Multiplication
by $`1-t^2`$ cannot make a nonzero polynomial constant. The nearest
poles of $`Q(\tanh x)`$ are at $`p=\pm ia`$, where $`a=\pi/2`$.
The residue of $`\tanh x`$ at either pole is one, so the leading
principal part at each is $`q_r(x-p)^{-r}`$.

For degree $`2k`$, the sum of those two leading contributions is exactly

```math
2q_r(-1)^{k+r/2}
 \binom{2k+r-1}{r-1}a^{-2k-r}.
```

In particular, the two poles do not cancel. Principal parts of lower order
have lower powers of $`k`$. After all principal parts at the two nearest
poles are removed, the remainder is analytic in any fixed disc of radius
between $`a`$ and $`3a`$, so its Taylor coefficients are exponentially
smaller. This justifies the main note's relative $`1+O(k^{-1})`$ estimate.

Multiplication by $`(2k)!`$, followed by division by the determinant
factor $`4^k`$, gives

```math
\frac{|P_k|}{4^k|\det A|}
 \sim\frac{2|q_r|a^{-r}}{|\det A|}
 (2k)!\binom{2k+r-1}{r-1}\pi^{-2k}.
```

The factor $`\pi^{-2k}`$ is correct because
$`a^{-2k}/4^k=\pi^{-2k}`$. The expression diverges: even the elementary
bound $`(2k)!\ge k^k`$ makes its factorial-exponential factor at least
$`(k/\pi^2)^k`$, which tends to infinity. No numerical extrapolation is
used.

## Quantifiers and limitations

For each fixed seed and initial direction, there is a finite cutoff,
possibly depending on both, beyond which the repeated rule cannot satisfy
nonzero absolute permanent-determinant equality. A common cutoff for all
seeds is not asserted or needed.

The degree argument at the end of the main note is also correct: on a
degree-$`d`$ polynomial each of the four operators has leading coefficient
$`\alpha\beta(d+2)(d+3)`$ times the old leading coefficient, so its degree
increases by two. Thus none has a nonzero polynomial eigenfunction or a
nonzero finite-dimensional invariant linear polynomial space. This does
not preclude an invariant with increasing degree or nonlinear restrictions.

The obstruction concerns the reset with second old direction minus the
first and the fixed direction extension $`(w,-1,+1)`$. It does not exclude
adaptive choices of the new signs, changes to the old signs, other reset
operations, or an all-order construction using an additional invariant.
No full MINC problem is resolved or counted.
