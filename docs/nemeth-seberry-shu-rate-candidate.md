# Quantitative extension of the NSS argument

**Separate extension draft. Independent internal audit passed; external review remains outstanding. Does not change the original qualitative proof.**

## Claim

The construction can be strengthened to

    V(p) ≫ p^(3/2)/sqrt(log p)

for all sufficiently large primes p. The implicit positive constant is absolute. No explicit numerical starting prime is claimed.

## A uniform rate extracted from the cited proof

Fix the same bounds A0=2 and r=1/2 as in proof.md, and take a fixed compact interval I=[3/4,5/4]. Divoux–Wang, arXiv:2610.23755v1, Proposition 3.8 proof, establishes the following bound for the small-degree error coefficients of its normalized rook polynomial:

    Σ_(k≤K√N)|f_k(s)| ≤ Σ_(E≤K√N) (CE/N)^ceil(E/3)/(1−CE/N),

uniformly for s∈I, with fixed C,K. Their Cauchy bound for the remaining coefficients is exponentially small in √N. These are inputs from the cited proof, not new estimates attributed to this note.

**Our sharpening of the displayed sum.** Set Q=ceil(K√N/3), A=3C. For large N every denominator is at least 1/2. Grouping E by q=ceil(E/3) bounds the sum by

    6 Σ_(1≤q≤Q) (Aq/N)^q.

Put u=AQ/N=O(N^(-1/2)). The q=1 term is A/N. For q≥2,

    (Aq/N)^q ≤ (A/N)^2 q² u^(q−2).

When u≤1/2, the latter geometric power sum is at most 22. Consequently the entire small-degree contribution is at most

    6A/N + 132A²/N² = O(N^(-1)).

Together with the large-degree bound, this gives the uniform relative rook estimate O(N^(-1)).

To transfer it to permanents, use the same Gamma representation and tail bounds as their Proposition 3.1 proof. Write T∼Gamma(N+1,1), Z=N/T and Δ(s)=det(I−s²BᵀB)^(-1/2). On I, Δ and its derivative are uniformly bounded. Moreover

    E Z=1,    E Z²=N/(N−1),    E|Z−1|≤1/sqrt(N−1).

The contribution outside {Z∈I} is exponentially small by the cited tail argument. Therefore the central expectation differs from Δ(1) by O(N^(-1/2)); the rook error contributes O(N^(-1)). We conclude

    N^N per(D)/N! = Δ(1)+O(N^(-1/2))

uniformly over these matrices. Since Δ(1)≥1 and the normalized permanent is ≥1, taking logarithms preserves this uniform absolute error bound. We do not need to establish the sharper O(N^(-1)) permanent rate mentioned by McCullagh.

## Quantitative Fourier error

Let u_p=sqrt(log p/p), δ=12u_p, and p large enough that δ≤1/4. In proof.md the exceptional Fourier magnitude differs from t=a/ρ≤1/4 by at most δ. Thus

    ||λ1|²−t²|≤δ(2t+δ)≤3δ/4.

For h(x)=−log(1−x)−x, h'(x)≤1/3 on [0,1/4]. Hence the exceptional-mode contribution differs from h(t²) by at most δ/4=3u_p.

Every remaining nonconstant eigenvalue has squared magnitude ≤δ². Parseval gives total squared mass ≤2, so its contribution to one half of Σh is at most

    δ²/[2(1−δ²)] ≤ (8/15)δ².

Combining these estimates with the extracted permanent rate gives one fixed constant C0>0 such that

    |log(per C / (k^p p!/p^p))−F(ρ,a)|≤C0 sqrt(log p/p)

uniformly for all relevant k, amplitudes, and constructed supports. Increasing C0 if necessary absorbs all finitely many threshold restrictions; the assertion concerns sufficiently large p only.

## Space amplitudes away from zero

Use amplitudes in [1/24,1/12]. A direct derivative calculation gives

    ∂F/∂a = 2a³/[ρ⁴(1−a²/ρ²)] ≥ 3/4096

for ρ∈[1/3,2/3] in that interval. Let

    M=floor(1/(131072 C0 u_p)),
    a_j=1/24 + j/(24M),       j=0,...,M−1.

For sufficiently large p, M≥1, all amplitudes are allowed, and adjacent limiting logarithmic values are separated by at least

    1/(32768 M) ≥ 4 C0 u_p.

Each actual logarithmic normalized permanent differs from its target by at most C0u_p. All M permanents within one degree are therefore distinct. The original modulo-p congruence separates different degrees. Counting the p/3+O(1) dense degrees proves

    V(p) ≥ M(p/3+O(1)) ≫ p^(3/2)/sqrt(log p).

The number of profiles can grow with p because all matrix bounds, concentration existence bounds, and approximation constants are uniform independently of M. We need no simultaneous random event: choose a suitable support for each profile separately.

## A completely specified slower choice

If one prefers a growing M that does not mention the unknown C0, choose

    M(p)=floor(sqrt(p)/log p).

Then the adjacent gap divided by the error tends to infinity. Consequently

    V(p) ≥ (1/3+o(1)) p^(3/2)/log p.

This is weaker than the preceding Ω bound but has a concrete formula for M. Uniform qualitative o(1) **alone** would not imply even M=log log p; the extracted rate is essential to both claims.

A conservative power-law corollary uses M(p)=floor(p^(1/3)): the gap/error ratio grows like p^(1/6)/sqrt(log p), so V(p)≥(1/3+o(1))p^(4/3). This integer grid size is exactly computable by integer cube-root.

## Optional deterministic definition of supports

The probabilistic existence proof can also define a canonical, not efficient, family. Put L=ceil(log_2 p). For rational a and ρ, enumerate all binary strings lexicographically and choose the first whose p unnormalized Fourier errors from the target are strictly less than 2 sqrt(pL). Such a string exists by the same Hoeffding union bound (L≥log p and failure probability <1). Repair the cardinality deterministically by adding/removing the smallest available indices. The resulting normalized error is <12 sqrt(L/p)=O(sqrt(log p/p)).

This is a finite deterministic construction. Conditions on squared Fourier errors are comparisons of real algebraic numbers in a cyclotomic extension, so exact decisions are possible. It is exponential-time and is **not** claimed to be a succinct closed-form or polynomial-time construction. Constants may be enlarged to replace log p by L. To keep a rational amplitude grid in this canonical construction one can use the exactly computable conservative choice M=floor(p^(1/3)) or any chosen integer grid size; the target amplitudes themselves are rational.
