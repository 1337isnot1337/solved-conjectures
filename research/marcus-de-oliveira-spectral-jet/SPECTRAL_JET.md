# Marcus–de Oliveira's conjecture

Research continuation, 21 November 2026. [Issue 57](https://github.com/1337isnot1337/solved-conjectures/issues/57). No proof or counterexample to the conjecture is claimed.

## A necessary spectral-derivative convex-hull condition

Fix a unitary matrix $`U`$ of order $`n`$, and write the spectral variables as $`x=(a_1,\ldots,a_n,b_1,\ldots,b_n)`$. Define

```math
F_U(x)=\det\bigl(\mathop{\mathrm{diag}}(a)+U\mathop{\mathrm{diag}}(b)U^*\bigr),
\qquad
p_\sigma(x)=\prod_{i=1}^n(a_i+b_{\sigma(i)}).
```

These are polynomials with real coefficients. For $`F_U`$, this follows either from the squared-minor expansion or from its real values at all real spectral vectors: the matrix inside the determinant is then Hermitian.

If the unrestricted Marcus–de Oliveira conjecture holds, then at every real vector $`x_0`$,

```math
\bigl(F_U(x_0),\nabla F_U(x_0)\bigr)
\in
\mathop{\mathrm{conv}}
\left\{
\bigl(p_\sigma(x_0),\nabla p_\sigma(x_0)\bigr):\sigma\in S_n
\right\}.
\tag{1}
```

This is a condition on changes in the spectra, with the unitary matrix fixed. It is distinct from the earlier notebook's first and second derivatives along a unitary conjugation orbit.

### Proof and counterexample transfer

Suppose (1) fails. Since the right side is a finite convex hull, there exist real $`c`$, a real vector $`v`$, and $`\delta>0`$ such that, for every permutation,

```math
cF_U(x_0)+v\cdot\nabla F_U(x_0)
\ge
cp_\sigma(x_0)+v\cdot\nabla p_\sigma(x_0)+\delta.
\tag{2}
```

For a nonzero real number $`\varepsilon`$, set $`x_\varepsilon=x_0+i\varepsilon v`$ and consider the real linear functional on the complex plane

```math
L_\varepsilon(z)=c\mathop{\mathrm{Re}}z+
\frac{\mathop{\mathrm{Im}}z}{\varepsilon}.
```

For every polynomial $`P`$ with real coefficients,

```math
L_\varepsilon(P(x_0+i\varepsilon v))
=cP(x_0)+v\cdot\nabla P(x_0)+O(\varepsilon^2).
```

Indeed, its real part contains only even powers of $`\varepsilon`$, and its imaginary part contains only odd powers. There are finitely many permutation products, so the error bound is uniform in $`\sigma`$. Equation (2) therefore gives

```math
L_\varepsilon(F_U(x_\varepsilon))>
\max_\sigma L_\varepsilon(p_\sigma(x_\varepsilon))
```

for all sufficiently small nonzero $`\varepsilon`$. Both matrices

```math
A_\varepsilon=\mathop{\mathrm{diag}}(a_i+i\varepsilon v_i),
\qquad
B_\varepsilon=U\mathop{\mathrm{diag}}(b_j+i\varepsilon v_{n+j})U^*
```

remain normal. The strict separating inequality contradicts the full conjecture and gives an entire analytic counterexample family. This proves the necessity of (1).

If the base data and a separator are rational, the transfer can be bounded exactly. Expand the finitely many differences after applying $`L_\varepsilon`$. The constant terms are at least $`\delta`$ and all remaining terms have degree at least two. The sum of the absolute values of their coefficients bounds the error by $`K\varepsilon^2`$ for $`|\varepsilon|\le1`$. Taking $`K\varepsilon^2<\delta`$ gives an explicit interval. A strict real separator can also be approximated by a rational one while retaining a positive gap.

This argument does not establish (1), nor does it show that (1) is sufficient for the conjecture.

## Exact base quantities

At a real base, put $`C=\mathop{\mathrm{diag}}(a)+U\mathop{\mathrm{diag}}(b)U^*`$. The gradient is

```math
\frac{\partial F_U}{\partial a_i}
=\mathop{\mathrm{adj}}(C)_{ii},
\qquad
\frac{\partial F_U}{\partial b_j}
=\bigl(U^*\mathop{\mathrm{adj}}(C)U\bigr)_{jj}.
```

These formulas remain valid at singular bases. For each permutation product, the derivative is the product of all but the corresponding factor; no division by a possibly zero factor is needed.

The finite script `tangent_probe.py` uses rational orthogonal matrices obtained from three Householder factors, integer spectra, and exact adjugates to form these vectors. It then uses floating-point linear programming solely as a discovery diagnostic for the finite convex hull. Any reported infeasibility would require an exact separating certificate before use.

The fixed exploratory run tested 48 rational bases of orders four and five, half with positive spectra and half with spectra of mixed signs. Every linear program returned feasible, with largest scaled equality residual approximately $`6.33\times10^{-15}`$. This is not an exact feasibility proof, a proof of a bounded matrix-size case, or evidence sufficient to establish the universal condition. No negative candidate was found, so no counterexample-transfer step has been invoked.

## Source status and exclusions retained

The existing [research notebook](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/marcus-de-oliveira-research.md) already records the false all-compound Birkhoff coupling, the all-order Householder theorem, the normal-compression obstruction, and the limitations of unitary stationarity and rank-one Hessian tests. None is being presented as a new result here.

The current [2026 variational paper's primary publisher abstract](https://doi.org/10.1016/j.laa.2026.03.019) still states that the unrestricted normal-matrix problem is open. Its non-monomial-maximizer warning does not say that no monomial maximizer exists; its full text remains unavailable in this review. The [2025 primary survey](https://doi.org/10.3390/math13050711) and [Drury's original Householder paper](https://doi.org/10.1016/S0024-3795(99)00173-1) were compared again. The survey's narrow Householder wording is not a reason to reopen a case already covered by Drury's all-order theorem.

The already refuted [Kovačec polygon conjecture](https://www.mat.uc.pt/preprints/ps/p2611.pdf) is stronger than the original convex-hull statement. Its known counterexample does not settle the target here. Fresh searches with both web search engines found no full resolution of the original assertion; that bounded status search is not a claim of exhaustive publication coverage.

The spectral-derivative condition is retained as a possible route, with its finite diagnostic exhausted for now. A useful next step would require a new proof of (1), an exact separator, or an implication that reaches the full complex spectral domain. Repeating the same positive finite screen would not supply such a step.
