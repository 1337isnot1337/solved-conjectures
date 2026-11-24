# Removing cofactors with a low-degree squarefree part

Research status, 23 November 2026. This note proves an additional restricted all-multiple lower bound. The multiplicities of the resultant and of every extraneous irreducible factor are unrestricted. The controlling quantity is the degree of the squarefree extraneous cofactor. The unrestricted complex BSS separation is not proved.

## 1. Jet extraction with arbitrary multiplicities

Work over `C`, with arbitrary scalar constants. Let `R` be a nonconstant polynomial in `M` variables `A`, and suppose

```math
P=cR^e\prod_{i=1}^{k}q_i^{e_i}\ne0,
\qquad c\ne0,\quad e,e_i\ge1,
```

where the `q_i` are distinct nonconstant irreducible polynomials and none divides `R`. Let `L` be a division-free circuit size for `P`, and put

```math
\delta=\sum_{i=1}^{k}\deg q_i.
```

The empty product is allowed, with `delta=0`. Thus `delta` is the degree of the squarefree part of the extraneous cofactor; it is not the degree of `P` or of its whole squarefree part.

**Theorem.** For every center `a` and Taylor order `D>=0`,

```math
\underline L(J_a^D R)
\le C(L+M+1)(\delta+1)^{10}(D+1)^3             \tag{1}
```

for an absolute constant `C`, with a harmless increase if input and constant gates are included. The bound is independent of `deg R`, `e`, and all `e_i`.

### Proof

First choose a center `b` where `P(b)!=0`. Every factor is then nonzero at `b`. Bürgisser's corrected approximate-factor theorem, arXiv:1812.06828v1, Theorem 1.3, gives

```math
\underline L(q_i)\le C_0(\deg q_i)^{10}(L+1).
```

Indeed, `q_i` divides the supplied polynomial `P`, so its exclusion complexity is at most `L`. The displayed coarse exponent follows from the theorem using schoolbook polynomial multiplication and classical matrix multiplication: both degree-dependent terms are `O((deg q_i)^10(L+1))`. The theorem is independent of the degree and multiplicity of the supplied multiple.

Consequently the factors `q_i` have simultaneous border circuits of total size at most

```math
C_0(L+1)\sum_i(\deg q_i)^{10}
\le C_0(L+1)\delta^{10}.                       \tag{2}
```

No algorithm for finding those factors is asserted. Equation (2) is a nonuniform size bound, which suffices for the lower-bound application.

Work in the truncated ring `C[X]/(X)^(D+1)`. Define normalized units

```math
V_P=\frac{P(b+X)}{P(b)},\qquad
V_R=\frac{R(b+X)}{R(b)},\qquad
V_i=\frac{q_i(b+X)}{q_i(b)}.
```

They have constant term one and satisfy

```math
V_P=V_R^e\prod_i V_i^{e_i}.
```

The formal logarithm and exponential are finite operations in this ring:

```math
\log(1+U)=\sum_{j=1}^{D}\frac{(-1)^{j+1}}j U^j,
\qquad
\exp(U)=\sum_{j=0}^{D}\frac{U^j}{j!},
```

for `U` of positive order. Therefore

```math
J_b^D R(b+X)
=R(b)\exp\!\left(
\frac1e\left(\log V_P-\sum_i e_i\log V_i\right)
\right)\pmod{(X)^{D+1}}.                     \tag{3}
```

All factors `e_i`, `1/e`, `P(b)^(-1)`, `q_i(b)^(-1)`, and `R(b)` in this expression are scalar constants. Their size as integers or algebraic numbers is not charged in the present model; their use as constant gates is included. The multiplicities consequently introduce no dependence on their magnitude.

For the circuit estimate, substitute `A=b+tX` and keep the `D+1` homogeneous-component circuits modulo `t^(D+1)`. Evaluating a shared circuit of size `s` costs `O(s(D+1)^2+M)`. Each logarithm or exponential in (3) takes `O((D+1)^3)` gates by truncated multiplication. There are `k+1<=delta+1` logarithms and one exponential. Combining this cost with (2) gives (1) at `b`.

Here is the required border-limit justification. Choose simultaneous ordinary circuit approximants to all the `q_i`. Normalize using the fixed nonzero scalars `q_i(b)`, and apply the finite truncated polynomial operations in (3). The approximants need not have exactly the desired constant term: the operations are still polynomial maps on their finite jets, and their coefficientwise limit has constant term one, where identity (3) applies. The resulting output polynomials have degree at most `D`, one common circuit-size bound, and limit `J_b^D R`. Thus the displayed bound is a border bound, without an assumption that approximants preserve divisibility or multiplicity.

Finally choose points `b` with `P(b)!=0` tending to the prescribed center `a`. The polynomial `R` is fixed, so its finite Taylor jets, written in the original variables, converge coefficientwise. The same size bound applies at every `b`. Closedness of the fixed-size border class gives (1) at `a`, including centers on the zero set of `P`. QED.

## 2. Consequence for resultant multiples

Let `R_N` be the quadratic resultant of `N` forms in `N` variables. Let

```math
P_N=R_N^{e_N}Q_N\ne0,
\qquad R_N\nmid Q_N,
```

and let `delta_N=deg(rad(Q_N))`, where `rad` denotes the product of distinct nonconstant irreducible factors. A nonzero scalar cofactor has `delta_N=0`.

Under the pinned permanent border lower bound, there is an absolute `eta>0` such that, for all sufficiently large `N`,

```math
(L(P_N)+1)(\delta_N+1)^{10}
\ge\exp\!\left(\eta(\log N)^{4/3}\right).       \tag{4}
```

**Derivation.** Apply (1) to `P_N` in its full `O(N^3)`-dimensional coefficient space, at the point `a_0` corresponding to the BCJS grid origin. Choose the largest `m=3^r+1` with `5m^2<=N`, and set `D=m^2=Theta(N)`. Only after taking this full Taylor jet, pull it back along the affine grid map. This gives `J_0^D P_N^grid`, the degree-`D` truncated grid resultant, even if the cofactor vanishes identically on that grid.

The three-evaluation character filter in [FOURIER_RESULTANT_FILTER.md](FOURIER_RESULTANT_FILTER.md) extracts `kappa H_m` from this jet. BCJS Lemma 3.3 and Appendix A.1 then give the permanent of size `m-1=Theta(sqrt(N))`, with a nonzero scalar normalization. All this costs a polynomial in `N` times the right-hand side of (1). The imported lower bound for that permanent absorbs this polynomial overhead and gives (4).

In particular, if the squarefree extraneous cofactor has polynomial degree, then `P_N` has superpolynomial circuit size with the same `exp(Omega((log N)^(4/3)))` scale. Its multiplicities, total degree, and number of repeated factors can be arbitrarily large. Conversely a polynomial-size hypothetical multiple would require

```math
\deg(\mathop{\mathrm{rad}}(Q_N))
\ge\exp\!\left(\Omega((\log N)^{4/3})\right).
```

This is a restriction on any possible easy multiple, not a proof that such a multiple exists or does not exist.

## 3. Why the general case remains open

The generic-branch argument controls the circuit size of `P_N`; it gives no polynomial bound on the degree of the squarefree extraneous cofactor. A short circuit can have exponentially large squarefree degree. Neither multihomogeneity nor the usual equation-mixing and projective-variable symmetries provide the missing bound.

Theorem 1 of Dutta, Saxena and Sinhababu, *Discovering the roots: Uniform closure results for algebraic classes under factoring*, author-hosted 2022 manuscript, bounds factors in terms of a supplied circuit and the relevant radical degree. Direct application with `P_N` uses `deg(rad(P_N))`, which already includes `deg R_N=N2^(N-1)`. It does not remove the exponential resultant degree. The argument here instead extracts only the extraneous factors by the approximate-factor theorem and then uses the finite logarithmic identity (3) to recover bounded jets of the target.

Primary factor reference: Bürgisser, corrected arXiv:1812.06828v1, Theorem 1.3 and Theorem 2.4: https://arxiv.org/html/1812.06828v1 . The resultant and permanent extraction references and source versions are recorded in [INCIDENCE.md](INCIDENCE.md) and [FOURIER_RESULTANT_FILTER.md](FOURIER_RESULTANT_FILTER.md). The related radical-degree theorem is Theorem 1 in https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf .

The bound above is a written consequence of approximate factor extraction, finite formal logarithms, and the imported hard coefficient. No new general factoring theorem, novelty claim, Lean verification, or solution of the unrestricted all-multiple problem is claimed.
