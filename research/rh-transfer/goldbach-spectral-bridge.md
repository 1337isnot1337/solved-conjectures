# Goldbach's conjecture

## Status

**Unresolved in this campaign; no resolution is counted.** This note audits a possible transfer from the accepted RH/Dirichlet-GRH archive to the spectral reduction of Jiamin Li and Jianya Liu, *A Conditional Proof of the Goldbach Conjecture*, posted 13 November 2026. It identifies an additional arithmetic estimate which the inspected archive theorems do not supply.

The accepted archive is pinned at [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Its rational Dirichlet GRH supplies the paper's GRH(N): GRH for every primitive character whose conductor divides N. No Lean verification was undertaken.

## 1. Exact additional estimate

Let \(\mathfrak S(N)\) be the Goldbach singular series and let \(T_N\) be the paper's compact self-adjoint residual operator. Write

\[
\delta_N=\sqrt{\frac{\mathfrak S(N)}N}(\log N)^{3/2}.
\]

Li–Liu's equations (2.28), (2.30) and Theorem 6.1 give the exact dictionaries

\[
\mathrm R(N)\iff \|T_N\|\le\delta_N
\tag{1}
\]

and

\[
\mathrm S(N;h)\iff
\|T_N\|\le
\frac{\mathfrak S(N)}
 {2h(N)\sqrt{1-\eta_N}},
\qquad
\eta_N=\frac{h(N)^2(\log N)^3}{N\mathfrak S(N)}
\le\frac14.
\tag{2}
\]

Here \(h(N)\to\infty\). Their GRH-only Theorem 6.2 supplies

\[
\|T_N\|\le\|T_N\|_{\rm HS}\ll(\log N)^2.
\tag{3}
\]

The exact error identity is

\[
c_\phi\mathfrak S(N)-G(N)=\langle T_Nv_N,v_N\rangle,
\qquad \|v_N\|^2\ll_\phi1,
\tag{4}
\]

where \(G\) is their normalized smooth weighted Goldbach sum.

Bound (2) requires \(o(\mathfrak S(N))\), while (3) permits growth of order \((\log N)^2\). The generic inequality in (3) cannot turn into (2) by taking \(N\) large.

More precisely, the paper's GRH-only zero-free width is comparable to
\(\mathfrak S(N)/(N\log N)\). The ratio between the prescribed width in (2) and that width is comparable to

\[
\frac{h(N)^2(\log N)^4}{\mathfrak S(N)^2}.
\tag{5}
\]

Since \(\mathfrak S(N)\ll\log\log N\), this ratio tends to infinity. A change in an absolute constant cannot repair the gap.

Equations (1)–(4) are the manuscript's reduction being tested here; this note does not certify its full 63-page argument. The obstruction calculation uses those statements as written.

## 2. Why self-adjointness does not give the required zero location

For nonzero eigenvalues \(\mu_j\), Li–Liu use

\[
X_N(q)=\prod_j
\left(1-\frac{4\mu_j^2}{\delta_N^2}q(1-q)\right).
\tag{6}
\]

For a single real nonzero eigenvalue \(\mu\), its two zeros satisfy

\[
q=\frac12\pm\frac12
 \sqrt{1-\frac{\delta^2}{\mu^2}}.
\tag{7}
\]

Thus real spectrum does not imply that the zeros lie on the line
\(\Re q=1/2\). Their location also requires \(|\mu|\le\delta\).

A one-dimensional example makes this distinction exact. On \(\mathbb C\), let

\[
Tz=2\delta z,\qquad \delta>0.
\]

This operator is self-adjoint, compact and Hilbert–Schmidt. Its product (6) is

\[
X(q)=1-16q(1-q),
\]

with zeros \(1/2\pm\sqrt3/4\). Both are real and off the critical line. The product has the symmetry \(X(q)=X(1-q)\), so adding that symmetry does not resolve the problem either.

This example refutes only a proposed *generic implication* from those operator properties to Hypothesis R. It is not a counterexample to the actual arithmetic operator \(T_N\), to Hypothesis R, or to Goldbach's conjecture.

## 3. What the inspected accepted-source theorems actually provide

The following files were read at the accepted pin.

| Archive file | Relevant supplied conclusion | Missing input for this application |
|---|---|---|
| [CompactSelfAdjoint.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/GroundTheory/AutomorphicForms/CompactSelfAdjoint.lean) | Real spectrum and a Hilbert basis of eigenvectors for compact self-adjoint operators | A bound of the size (1) or (2) for this arithmetic operator |
| [HilbertSchmidtKernel.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/GroundTheory/AutomorphicForms/HilbertSchmidtKernel.lean) | The norm_kernelOpₗ_le, hsNormSq_kernelOp_le, and kernelOp_isHilbertSchmidt results: an \(L^2\) kernel gives operator/HS norm control | An arithmetic \(L^2\) saving for the residual kernel, or a different estimate retaining cancellation |
| [HilbertSchmidtCompact.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/GroundTheory/AutomorphicForms/HilbertSchmidtCompact.lean) | IsHilbertSchmidt.isCompactOperator, via finite-rank approximation | Quantitative smallness uniformly as \(N\to\infty\) |

Blob hashes, respectively:

- 5612ea854339d0db52bbcea1fd7438ef2f9b9085
- cd715aadd2c55cbd09e91ac6f9d246e3266b295b
- b351b3b35377e6eadcc1a99eb5b3990bccad7882

Searches for Goldbach, Hardy, self-adjoint, spectral, Hilbert–Schmidt, and von Mangoldt terminology located no explicit identification of Li–Liu's residual with an operator having the missing bound. This is a bounded source inspection, not a claim that every theorem in the archive has been classified.

## 4. A weaker target still requires arithmetic work

For a fixed admissible weight, (4) shows that controlling the particular quadratic form

\[
\langle T_Nv_N,v_N\rangle=o(\mathfrak S(N))
\tag{8}
\]

would suffice for the asymptotic, even without controlling the entire operator norm. This removes an unnecessary uniformity requirement over vectors. It does not prove (8): the quadratic form is exactly the Goldbach residual, and its cancellation is the remaining arithmetic task.

The identity comes from the difference between a character second moment, an exact diagonal, and a model term. Bounding these contributions separately loses the cancellation needed for (8). The inspected generic spectral results do not restore it.

A continuation must therefore supply one of the following concrete inputs: a new residual norm estimate of the size (2), a direct estimate of (8), or a precise theorem identifying this residual with an already controlled arithmetic object. Merely constructing a self-adjoint realization supplies none of them.

## 5. Full-conjecture quantifier

The paper's theorems and §2.5.3 give representations for **all sufficiently large even N**, assuming GRH and S or R. The full binary Goldbach conjecture concerns every even integer at least 4.

Accordingly, even a proof of S or R in the stated eventual form would still need an effective threshold and a justified finite bridge before this campaign could claim the complete named conjecture. No such bridge is supplied by the argument in this note.

## Sources and audit record

- [Li–Liu institutional posting, 13 November 2026](https://mrc.sdu.edu.cn/english/info/1018/1514.htm).
- [Li–Liu original 63-page manuscript](https://mrc.sdu.edu.cn/__local/6/14/8E/28753731EE31D7635BAF60732C2_0C644604_2CE958.pdf): §2.4, equations (2.28)–(2.30), §2.5, Theorems 6.1–6.2, and Appendix A.
- The three accepted-source files above, read at the immutable pin.
- Audit date: 20 November 2026. Original manuscript text was inspected; no claim of a local raster inspection is made.
- Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80), including comment 7050776144.

**Disposition:** preserve the exact arithmetic gap; do not count Goldbach as solved.
