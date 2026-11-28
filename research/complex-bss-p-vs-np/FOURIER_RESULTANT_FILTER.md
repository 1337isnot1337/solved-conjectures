# Fourier filtering the hard coefficient of a quadratic resultant

**Research note, 2026-11-23.** This provides a direct quantitative **border-circuit lower bound for the quadratic resultant itself**, assuming the Anthropic VP != VNP theorem accepted by [AGENTS.md](../../AGENTS.md). It also exhibits a degree-one cofactor obstruction to using this filtering method on *arbitrary multiples*. It does not prove P_C != NP_C. Coordination: [#248](https://github.com/1337isnot1337/solved-conjectures/issues/248).

## Setup and cited inputs

Let R_N be the resultant of N generic homogeneous quadrics in N variables over C. Let P_N(A)=Det_N(I+A) be its specialization to x_i²+(Ax²)_i=0 for a symmetric cubic tensor A. This is a *tensor determinant/resultant*, not the determinant of an ordinary N-by-N matrix.

Fix m=3^r+1, r>=1, s=m², and N>=5s. Use the BCJS toroidal grid, assigning five tensor indices to each grid position. Restrict A to symmetric tensor entries on triangles anchored at the grid positions; let P_N^grid be the resulting polynomial. For any monomial, b_e counts the total number of its tensor variables on anchored triangle e. BCJS Lemmas 3.4 and 3.6 imply **all b_e are congruent modulo 3**. BCJS Lemma 3.7 and Theorem 3.5 prove that the homogeneous component of degree s is κ_{N,m} H_m(A), where κ_{N,m} is a nonzero integer and the grid-assignment polynomial H_m is VNP-hard under explicit polynomially bounded projections over C. See the [source manuscript](https://bhargavcs.github.io/files/resultants-and-etr.pdf), Section 3.

## Theorem 1: three evaluations suffice to isolate the hard component as an initial form

Fix one anchored triangle e*. Let ζ be a primitive cube root of unity. Let ρ_j rescale all tensor variables belonging to triangle e* by ζ^j, leaving other variables fixed. Define the character projector

```math
\Pi_1P(A)=\frac13\sum_{j=0}^2\zeta^{-j}P(\rho_j A).
```

**Claim.** For every m,N as above,

```math
\Pi_1 P_N^{grid}(tA)
=\kappa_{N,m}\,t^sH_m(A)+O(t^{s+3}).
```

**Proof.** A monomial with triangle count b_{e*} acquires ζ^{j b_{e*}} under ρ_j. The sum of characters kills it unless b_{e*}≡1 mod 3. The BCJS grid congruence then forces b_e≡1 mod 3 at *every* anchored triangle. Since b_e≥0, all b_e≥1. Therefore the total degree ∑_e b_e is at least s and congruent to s modulo 3. No degree less than s survives, and no degree s+1 or s+2 survives. The degree-s component is κH_m by BCJS Lemma 3.7. QED.

This is a constant-**evaluation** alternative to extracting an interior coefficient of a polynomial of exponential degree. It is not itself a single resultant: it is a linear combination of three evaluations of one.

## Corollary 2: quantitative border complexity of the quadratic resultant

Adopt the approximate permanent circuit lower bound of the pinned Anthropic [VP != VNP paper](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp). Then for all sufficiently large N,

```math
\overline S_{\mathbb C}(R_N)
\ge 2^{\Omega((\log N)^{4/3})}.
```

**Derivation including approximation parameters.** Suppose a Laurent-series arithmetic circuit of size L computes P_N(A)+εU(A,ε), where the output is regular in ε. Copy the circuit three times, specialize all non-grid entries to zero, apply ρ_j, and scale the grid variables by t. In all its Laurent-series scalar constants, substitute ε=t^{s+1}. The final output error then has t-order at least s+1. Take the character-weighted sum and multiply by t^{-s}/κ. Theorem 1 shows that the resulting circuit over C((t)) has output H_m(A)+O(t) and at most 3L+O(N^3) gates. The substitution of a Laurent series in ε by t^{s+1} remains a Laurent series in t; no degree bound on the original output is used. BCJS Theorem 3.2 gives an explicit p-projection from H_m to per_k, with k=Ω(m) and m=O(k), so

```math
\overline S(\mathop{\mathrm{per}}_k)
\le3\overline S(P_N)+\mathop{\mathrm{poly}}(N)
\le3\overline S(R_N)+\mathop{\mathrm{poly}}(N).
```

For each large N choose the largest m=3^r+1 with 5m²≤N, so m=Θ(√N) and k=Θ(m). The imported permanent bound implies the stated resultant bound, after absorbing polynomial overhead. The VNP-hardness of the coefficient family and existence of the resultant specialization are from BCJS; the additional three-evaluation character filter and quantitative border-complexity deduction are proved above. This is a consequence of imported results, not a new proof of VP != VNP.

## Theorem 3: even a unit cofactor breaks the filter

Let a* be a tensor variable on the tagged triangle e*. It is the pullback (up to a nonzero rational scalar) of a single generic quadratic coefficient variable. Choose the affine-linear cofactor Q(A)=1+a*, which has Q(0)=1 and an O(1)-size arithmetic circuit. Set F=P_N^grid Q.

Then

```math
\Pi_1F(tA)=t\,a_*+O(t^2).
```

**Proof.** The constant coefficient of P_N^grid is 1. There is no degree-one term: a single triangle count equal to 1 and all others 0 would violate the congruence condition because s>1. Therefore F(tA)=1+t a*+O(t²). The character projector kills the constant and retains t a*, proving the claim. QED.

Thus this elegant extraction method **does not work for arbitrary nonzero multiples** R_N Q_N, even with a low-degree cofactor nonvanishing at the basepoint. It cannot give the exclusion-complexity lower bound needed to separate P_C from NP_C. This does not exhibit a small circuit for R_NQ_N; it disproves only the proposed universal extraction identity.

Compare the related [Newton-polytope obstruction](GRID_NEWTON_BARRIER.md): diagonal monomial valuations cannot isolate the hard coefficient at the specified padding dimension, whereas the current *additive* three-evaluation filter does isolate it for the resultant itself.

## Checks and scope

Run the standard-library [finite verifier](verify_fourier_filter.py) from the repository root. It checks the F3 grid-congruence kernel for m=4, tests symbolic residue projection for a toy support polynomial with the three allowed residue classes, and confirms that the cofactor 1+a* changes the smallest surviving degree from 16 to 1. This does not compute the actual high-dimensional resultant and is not a proof of the BCJS lemmas.

**Outstanding:** lower bounds for exclusion complexity of quadratic resultants; a complexity-preserving permanent-graph-to-NP_C bridge; the BSS P_C versus NP_C separation. No Lean formalization or human peer review of this note is claimed.
