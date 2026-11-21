# Independent review of the quantitative noise-deficit bound

Reviewer: combinatorics research lane, 21 November 2026.

Verdict: `NOISE_STABILITY.md` passes. I read the complete final draft, including its fixed constants, global dichotomy, original-space transfer cost, and uniform sharpness construction. Its SHA-256 at review is `97f749c964aae4bd4ab1943a448354bae6e754ae90a85e38fb235307c06701df`. Subsequent formatting-only replacements of literal less-than signs by the LaTeX command were checked by reversing exactly those replacements and recovering the previously reviewed SHA-256 `9b614a9867d717a883ef66552ecdb78abb8828cc4ce04132b399a3c9e3f3f361`; no mathematical content changed. The proof files supplying the inputs were independently reviewed earlier. No mathematical correction is requested. This is a quantitative partial result for a sufficiently small positive correlation interval, not a resolution of the full Standard Simplex Conjecture or a priority determination.

## Global dichotomy and fixed constants

Let $`\Delta_\rho=S_\rho(\mathcal C)-S_\rho(\mathcal A)`$, where $`\mathcal C`$ is any central regular-simplex partition, and let

```math
\varepsilon=c^2-\|M\|_F^2\geq0.
```

The Hermite expansion gives, for every balanced competitor,

```math
\Delta_\rho\geq\rho\varepsilon-\rho^2(1-1/q),
\qquad
\varepsilon\leq\Delta_\rho/\rho+\rho(1-1/q).
```

Thus one can split all competitors at a fixed positive threshold $`a_q\rho`$. No assumption that the noise deficit is nonnegative is needed in obtaining the small-deficit implication.

For an explicit compatible choice in the notation of `SMALL_CORRELATION.md`, take

```math
a_q=\min\left(\frac{c^2}{4},
\frac{\delta_0^2}{32C_{\mathrm g}}\right)>0
```

and decrease the existing correlation bound to at most $`a_q`$. If $`\Delta_\rho<a_q\rho`$, then

```math
\varepsilon<a_q+\rho\leq2a_q
\leq\min\left(\frac{c^2}{2},
\frac{\delta_0^2}{16C_{\mathrm g}}\right).
```

This guarantees exactly the moment hypotheses previously obtained from the stronger benchmark condition $`S_\rho(\mathcal A)\geq S_\rho(\mathcal C)`$. In particular the moment norm is nonzero and the chosen polar-aligned regular partition satisfies

```math
\|M-M_{\mathcal C}\|_F\leq\delta_0/4.
```

The tail radius, local-core constants, higher-Hermite constant, and potential bounds remain fixed. No constant is chosen from the competitor or the ambient dimension.

## Alignment and the core hypotheses

The same polar-aligned simplex must be retained throughout. An unrelated simplex close only in symmetric difference would not justify the symmetry of the full aligned square moment matrix.

With the polar choice, the full square moment matrix is symmetric, and the tail moment controls both the core skew error and the core mass error. The bound on $`\varepsilon`$ above and the previously fixed condition $`\eta_q(R)\leq\delta_0^2/16`$ give

```math
\|M_{\mathrm c}-M_{\mathcal C}\|_F\leq\delta_0/2,
\qquad \|e_{\mathrm c}\|\leq\delta_0/4.
```

These are the actual hypotheses of the local core lemma. Conditioning onto the selected $`q-1`$ dimensional score space preserves the transfer costs and moments; it is not used to replace the original noise objective by a conditioned objective. The higher-Hermite bound still applies in the original dimension.

Consequently the previously reviewed absorption argument gives the stronger estimate

```math
\Delta_\rho\geq
\rho\left(\frac{\kappa}{8}D_{\mathrm c}+bW_{\mathrm t}\right)
\geq m_q\rho W,
\qquad
m_q=\min\left(\frac{\kappa\ell}{8},b\right)>0,
```

where $`W=W_{\mathrm c}+W_{\mathrm t}`$ and $`D_{\mathrm c}\geq\ell W_{\mathrm c}`$. The only earlier use of the benchmark condition was to get the moment-neighborhood bound, which the present dichotomy supplies. There is no extra sign assumption hidden in the absorption step.

## Weighted disagreement to symmetric difference

Let $`\mu`$ be the Gaussian mass on which the two labels differ. For deterministic original labels each such point contributes to exactly one unordered transfer pair, so

```math
0\leq W\leq\mu\leq1,
\qquad
\sum_i\gamma_d(A_i\triangle C_i)=2\mu.
```

For $`0<s\leq1`$, split transfer points according to whether the normal distance from their corresponding tie hyperplane is at most $`s`$. Outside the union of those slabs, the capped-distance weight is at least $`s`$. A unit normal has a standard normal marginal, hence

```math
\mu\leq A_qs+W/s,
\qquad A_q=q(q-1)\phi(0).
```

The factor $`q(q-1)`$ is the number of unordered pairs multiplied by the two-sided slab constant $`2\phi(0)`$. For $`q\geq3`$, $`A_q>1`$. If $`W>0`$, the choice $`s=\sqrt{W/A_q}`$ lies in $`(0,1]`$ and yields

```math
\sum_i\gamma_d(A_i\triangle C_i)
\leq4\sqrt{A_qW}.
```

If $`W=0`$, letting $`s\downarrow0`$ gives the same conclusion without division by zero. Taking the infimum over regular-simplex partitions only decreases the left side. Thus, with that infimum denoted by $`d_{\mathcal S}(\mathcal A)`$, the small-deficit branch gives

```math
\Delta_\rho\geq
\frac{m_q}{16A_q}\rho\,d_{\mathcal S}(\mathcal A)^2.
```

For the other branch, $`d_{\mathcal S}(\mathcal A)\leq2`$ and $`\Delta_\rho\geq a_q\rho`$, giving the coefficient $`a_q/4`$. Therefore the global coefficient may be taken as

```math
\min\left(\frac{a_q}{4},\frac{m_q}{16A_q}\right)>0.
```

All dimensions enter only through unit Gaussian marginals or the already fixed score-space dimension. The constants are uniform in the original ambient dimension.

## Uniform mirrored-strip sharpness

Use the existing balanced construction on a fixed bounded patch of the relative interior of an $`ij`$ facet. The patch stays a fixed positive distance from the other cell boundaries. Swap reflected normal strips of width $`t`$ on the two sides of that facet, and extend cylindrically in unused coordinates. Reflection preserves Gaussian measure, so the competitor is balanced exactly, not just to leading order.

For $`F=1_{C_i}-1_{C_j}`$ and a unit normal $`n`$, differentiation of the Gaussian convolution gives

```math
|\partial_nT_\rho F(x)|
\leq\frac{\rho}{\sqrt{1-\rho^2}}
\mathbb E|G_1|
=\frac{\rho\sqrt{2/\pi}}{\sqrt{1-\rho^2}}.
```

This holds for bounded measurable $`F`$ and in every dimension. It does not differentiate the indicator itself. Reflection across the facet swaps the two regular cells, so the potential vanishes on the full facet hyperplane. For $`\rho\leq1/4`$, integration along a normal segment gives a uniform bound $`|T_\rho F(y+sn)|\leq C\rho|s|`$.

Let $`p_D>0`$ be the Gaussian measure of the fixed facet patch in its tangent space. The linear potential loss of the swapped strips is at most a constant times

```math
\rho p_D\int_{-t}^t |s|\phi(s)\,ds
=2\rho p_D(\phi(0)-\phi(t))
\leq\rho p_D\phi(0)t^2.
```

For positive correlation the noise operator is positive semidefinite on $`L^2`$. The exact identity therefore gives

```math
\Delta_\rho
=2L_\rho-\sum_i\langle h_i,T_\rho h_i\rangle
\leq2L_\rho\leq C_q\rho t^2.
```

For the distance lower bound, the modified cell on each normal fiber has occupancy pattern $`1,0,1`$ on three successive intervals of length $`t`$. The intersection of any convex comparison cell with that line is an interval. Its disagreement with this pattern has Lebesgue length at least $`t`$. On a fixed strip neighborhood the Gaussian density has a positive lower bound, giving $`d_{\mathcal S}(\mathcal A_t)\geq c_qt`$ after integrating over the patch. The argument applies to every convex comparison cell, hence to every rotated or relabeled regular-simplex partition, and remains valid after cylindrical extension to any allowed ambient dimension.

The constants in both bounds are independent of $`\rho`$ in the final interval. Thus the squared-distance power is sharp. The linear factor in $`\rho`$ also has the correct order as $`\rho\downarrow0`$. This checks a rate statement, not a further conjecture resolution.
