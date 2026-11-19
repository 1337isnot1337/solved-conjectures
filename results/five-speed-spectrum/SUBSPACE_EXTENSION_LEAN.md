# Lean dimension and density of subspace extensions

[`LonelinessSubspaceExtension.lean`](../../lean/Conjectures/LonelinessSubspaceExtension.lean)
combines the dimension calculation with the previously proved rounding
construction. It supplies the subspace part of the density lemma used in the
norm reduction.

Let \(E\subseteq\mathbb R^n\), and let \(P\) be any real linear map that
vanishes on \(E\). Suppose the vectors \(P(w_1),\ldots,P(w_j)\) are linearly
independent. The theorem `Loneliness.SubspaceDensity.extension_finrank` proves

\[
\dim\bigl(E+\operatorname{span}_{\mathbb R}\{w_1,\ldots,w_j\}\bigr)
=\dim E+j.
\]

Independence of the images implies independence of the original vectors.
It also makes their span disjoint from \(\ker P\), and therefore from \(E\).
The dimension formula for the sum of two subspaces then gives the result.
The map need not be an orthogonal projection; any map with the stated
properties is sufficient.

The theorem `rational_integer_extension` starts with a rational subspace
\(E_{\mathbb Q}\subseteq\mathbb Q^n\), its real span \(E\), and integer vectors
\(w_1,\ldots,w_j\). It constructs

\[
F_{\mathbb Q}=E_{\mathbb Q}
+\operatorname{span}_{\mathbb Q}\{w_1,\ldots,w_j\}.
\]

It proves all of the following in one statement:

- The real span of \(F_{\mathbb Q}\) equals
  \(E+\operatorname{span}_{\mathbb R}\{w_1,\ldots,w_j\}\).
- Its rational dimension is \(\dim_{\mathbb Q}E_{\mathbb Q}+j\).
- No coordinate vanishes identically on the extension if this holds for \(E\).
- For arbitrary \(v_i\in E\), its actual loneliness value satisfies
  \[
  M(\operatorname{realSpan}F_{\mathbb Q})
  \le M(E)+\frac12\sum_{i=1}^j\|w_i-v_i\|_\infty.
  \]

The last inequality is the existing coefficient-rounding theorem, applied to
the explicitly constructed space. With \(v_i\) chosen as the component of
\(w_i\) in \(E\), the errors are the projected vectors used by the lattice
argument.

The module compiles with the pinned toolchain and passed independent
`leanchecker` replay. Both headline declarations have only `propext`,
`Classical.choice`, and `Quot.sound` as transitive axioms.

This theorem accepts the independent images as input. It does not establish
the successive-minima product inequality, the covolume identity, or a
cube-section volume bound. Those inputs are still required to obtain the
specific short projected vectors used by the full norm reduction.
