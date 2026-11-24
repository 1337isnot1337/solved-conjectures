# Newton-polytope obstruction for the hard quadratic-resultant coefficient

**Research checkpoint, 2026-11-23.** This is a proved structural consequence of the 2026 Bhargav–Curticapean–Jindal–Shukla (BCJS) grid lemmas, **not** a proof of P_C != NP_C or Bürgisser's conjecture. Tracked in [issue #248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## Setting

BCJS, [*Multivariate Resultants: Complexity and Applications to Real Feasibility*](https://bhargavcs.github.io/files/resultants-and-etr.pdf), define the **cubic tensor determinant**

```math
P_N(A)=\operatorname{Det}_N(I+A)
=\operatorname{Res}^{(2)}_N(x_i^2+(Ax^2)_i:i\in[N]).
```

This is a quadratic *resultant*, not the ordinary matrix determinant. Their VNP-hard polynomial \(\Phi_{N,s}(A)=[z^s]P_N(zA)\) uses grid side \(m=3^r+1\), \(r\ge1\), \(s=m^2\), and \(N=5s\). The hard polynomial is an **interior** coefficient, not directly a trailing coefficient accessible by border-complexity methods.

Take one tensor index \(\nu_v\) in each grid-position index class and one symmetric tensor variable \(t_e=a_{\nu_v,\nu_{v+(1,0)},\nu_{v+(0,1)}}\) for each anchored grid triangle \(e\). Put all other nonidentity tensor entries to zero. Let \(M=\prod_e t_e\), with \(s\) factors. Let \(P_N(\mathbf t)\) denote the resulting tensor determinant with \(N-s\) dummy coordinates.

## Theorem (no diagonal-weight isolation after at most one padding dimension)

For fixed \(m=3^r+1\), **at most one** integer \(N\ge s\) satisfies \([M^2]P_N=0\). For every other \(N\),

```math
[1]P_N=1,\quad[M]P_N\ne0,\quad[M^2]P_N\ne0.
```

The exceptional padded dimension, if any, is the **same for every choice** of one grid index per class. Consequently at least one of \(N=5s\) or \(N=5s+1\) works for every BCJS grid assignment at once. In that chosen dimension the exponent vector of each assignment monomial \(M\) is the midpoint of the exponents of two other supported monomials, \(1\) and \(M^2\). Therefore \(M\) is not a Newton-polytope vertex, and any minimum-weight face containing \(M\) contains \(1\) and \(M^2\).

Thus **no diagonal monomial rescaling** of these tensor entries can isolate the degree-\(s\) grid assignment sum as the entire initial (lowest-valuation) coefficient of the tensor determinant at the selected padding dimension.

### Proof

**Grid congruences.** BCJS Lemma 3.4 proves that each index appears a multiple of three times in every monomial of \(P_s\). Since position \((i,j)\) lies in exactly three anchored triangles, the exponent vector \(b=(b_{i,j})\) of any supported monomial satisfies

```math
b_{i,j}+b_{i-1,j}+b_{i,j-1}\equiv0\pmod3.
```

BCJS Lemma 3.6 says that, for \(m=3^r+1\), all solutions are constant modulo three. In particular, if \(0\le b_e\le2\) for all edges, the only possibilities are \(b=0\), \(b=\mathbf1\), and \(b=2\mathbf1\). Therefore the **only monomials of \(P_s\) dividing \(M^2\)** are \(1,M,M^2\).

**Nonzero middle coefficient.** BCJS Theorem 3.5 proves \([M]P_s=c_1\ne0\). Put \(c_2=[M^2]P_s\). We do not need to know \(c_2\).

**Padding calculation.** BCJS Lemma 2.6(5), the resultant padding identity, gives

```math
P_N=P_s^E,\quad E=2^{N-s}.
```

The only ways to obtain \(M^2\) in the product are to select one \(M^2\) term, or two \(M\) terms, and constant terms elsewhere. Hence

```math
[M]P_N=Ec_1,\qquad
[M^2]P_N=Ec_2+\binom E2c_1^2
=E\left(c_2+\frac{E-1}{2}c_1^2\right).
```

Since \(c_1\ne0\), the bracket is a nonconstant affine function of \(E\), so it vanishes for at most one \(E=2^{N-s}\). Directly, if it vanishes for \(E\), then for \(2E\) the coefficient is \(E^2c_1^2\ne0\).

**All assignments.** Simultaneously permuting tensor indices within each position's index class carries any complete choice of indices to any other. BCJS Lemma 2.8 gives invariance under these relabelings; \(c_1,c_2\) and the possible exceptional \(N\) therefore do not depend on the assignment. Thus one dimension from \(5s,5s+1\) works for all.

**Geometry of exponents.** With \(v=\exp(M)\), the points \(0,v,2v\) all belong to the support, and \(v=(0+2v)/2\). For any linear weight \(w\), if \(w\cdot v\) is minimum, then \(w\cdot0,w\cdot2v\) are both at least \(w\cdot v\) but average to \(w\cdot v\), forcing equality. This proves the theorem.

## Scope

This rules out **pure diagonal monomial weight degenerations** of the specified BCJS hard-coefficient construction. It does not rule out affine translations, nonlinear substitutions, auxiliary variables, a hard *factor* of a more complicated initial polynomial, or other tensor constructions. It establishes neither exclusion-complexity hardness of a resultant nor any BSS class separation. It is a structural reason why the published VNP-hard *interior coefficient* does not become a hard *initial coefficient* by the most straightforward rescaling.

## Finite checks

Run \`python3 research/complex-bss-p-vs-np/verify_grid_newton.py\` from the repository root. The verifier computes the grid congruence kernel over \(\mathbb F_3\) for \(m=4,10\) and other control cases, and checks the padding coefficient identity on small integer samples. These checks do not replace the published all-grid lemmas.

Primary inputs: BCJS [preprint](https://bhargavcs.github.io/files/resultants-and-etr.pdf), Lemmas 2.6(5), 2.8, 3.4, 3.6, 3.7, Theorem 3.5; Bürgisser [arXiv:2606.25121v2](https://arxiv.org/html/2606.25121v2), Conjecture 1.1.