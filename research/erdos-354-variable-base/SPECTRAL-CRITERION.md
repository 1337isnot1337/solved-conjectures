# Erdős Problem 354: when two sub-golden-ratio rays are strongly complete

**Status.** A research advance for variable base, not the prior resolution of either yes/no reading. We prove a spectral classification below the golden ratio and a full-measure result for every fixed first coefficient. The classification applies more generally to the union of any two essentially disjoint increasing integer sequences with successive ratios bounded strictly below the golden ratio.

## 1. Original question and known results

Graham, [*On sums of integers taken from a fixed sequence*, Question 12, printed p. 36](https://mathweb.ucsd.edu/~ronspubs/71_08_integer_sums.pdf), asks about completeness of the interleaving of the two floor-doubling sequences for positive coefficients of irrational ratio, then asks what happens at a base in `(1,2)`. [Erdős and Graham, *Old and New Problems and Results in Combinatorial Number Theory*, p. 58](https://fanchung.ucsd.edu/ron/papers/80_11_number_theory.pdf), repeat it. The positive resolution at base two by [Kohlmeyer–Kruer](https://hexagonmath.org/2611.00768v1) already implies that **some** such bases work for every pair: at any `γ=2^{1/m}`, integer `m≥2`, the terms with indices 0 and 1 modulo `m` in **one** ray are two base-two rays whose coefficients have irrational ratio `γ`. This consequence appears in the [prior dyadic-root analysis](https://erdosproblems.ai/wiki/theory/additive_bases/L33_dyadic_root_floor_completeness/_index); it is not a new result here. [Jesse Geneson, arXiv:2609.25107v1, Corollary 12](https://arxiv.org/html/2609.25107v1#S6) proves that **not every** such base works, constructing a Salem `γ∈(6/5,13/10)` and an irrational-ratio pair for which both rays are entirely even. These statements are about distinct indexed occurrences, as in the original question.

The principal prior tool here is [Steve Fan, arXiv:2607.14071v6, Theorem 2.2 and Lemma 3.1](https://arxiv.org/html/2607.14071v6#S2), not his density-threshold corollary. Fan's Theorem 1.1 gives a spectral criterion for general sets with two elements per sufficiently late `ρ`-adic interval when `ρ≤ρ₀=1.324717…`, the plastic constant. The [existing detailed #354 research inventory](https://erdosproblems.ai/wiki/research/erdos_354/connections) discusses applying that criterion to two floor rays at those bases. The different argument below uses the ordering *within* each ray and reaches `φ=(1+√5)/2` strictly. It does not resolve Fan's separate threshold problem for arbitrary sets with two values per dyadic interval or settle every base or coefficient in Erdős 354. Searches for this two-sequence bounded-ratio spectral classification, the metric fixed-coefficient theorem, and the golden-ratio threshold found no exact earlier statement. This is a priority search, not a certainty claim. [Van Doorn, arXiv:2602.23394](https://arxiv.org/html/2602.23394), studies one ray and gives several explicit parameter regions, not the two-ray characterization below.

## 2. Definitions and criterion

For a set `A⊂N`, write `FS(A)` for the sums of finitely many distinct elements. The set is strongly complete if `FS(A\setminus F)` contains every sufficiently large integer for each finite `F`. For `q>0` define
```text
H_q(A) = { θ ∈ R/Z : Σ_{a∈A} ||aθ||^q < ∞ },
Δ(A)   = sup_{a∈A} [a − Σ_{b∈A, b<a} b],
```
where `||x||` is distance to the nearest integer.

**Theorem 1.** For `i=1,2`, let `A_i={a_{i,n}:n≥0}` be a strictly increasing unbounded positive integer sequence, and suppose `limsup_n a_{i,n+1}/a_{i,n}<φ`. Suppose `A_1∩A_2` is finite. Then `A=A_1∪A_2` is strongly complete if and only if `H_1(A)={0}`.

The necessity applies to any set: if `0≠θ∈H_1(A)`, remove a finite set so the remaining sum of `||aθ||` is less than some `δ>0` for which `||nθ||≥δ` infinitely often. Such a `δ` exists for every nonzero rational or irrational circle angle. The triangle inequality shows no such `n` is a subset sum of the remaining set.

For sufficiency, delete shared (finitely many) values initially. This changes neither strong completeness nor the spectra. Fix `1<λ<φ` such that both ratios are eventually at most `λ`. We will use an integer `L≥2` with
```text
Σ_{j=2}^L λ^{-j} > 1.
```
It exists because the infinite sum is `1/(λ(λ−1))>1`.

**Sparse extraction.** Given countably many nonnegative functions on the nonnegative integers, each with divergent sum, there is an `L`-separated infinite index set `I` on which every sum still diverges, and whose successive gaps are at most `2L−1`. Enumerate the functions with every member appearing infinitely often. At each stage, select indices beyond the previous maximum by at least `L`. Some one residue class modulo `L` has divergent tail sum for the current function, hence contains a finite later selection with total at least one. All selected indices are `L`-separated. Extend them to a maximal `L`-separated set, for example by considering the remaining nonnegative integers in increasing order and adjoining each permitted one. Every nonmember is then at distance at most `L−1` from a member. Any gap of size at least `2L` between successive members would leave its midpoint farther away, a contradiction. This argument also handles an empty family, starting with the empty selection. (Any such maximal set is infinite.)

Apply Fan's Lemma 3.1: an unbounded increasing integer sequence with bounded successive ratios has countable `H_q` for each `q>0`. First choose `C_1⊂A_1` by the extraction lemma, with one function `n↦||a_{1,n}θ||` for each nonzero `θ∈H_1(A_2)`. Each such function has divergent sum because `H_1(A)={0}`. Therefore
`H_1(C_1)∩H_1(A_2)={0}`.
The bounded index gaps ensure `C_1` has bounded successive value ratios, so `H_1(C_1)` is countable. Now choose `C_2⊂A_2` by the same extraction for angles in `H_1(C_1)\setminus{0}`, whose full second-ray sums necessarily diverge. With `C=C_1∪C_2` this gives
```text
H_1(C)=H_1(C_1)∩H_1(C_2)={0},
H_2(C)⊂H_2(C_1), hence H_2(C) is countable.
```

Put `B_i=A_i\setminus C_i`. For every sufficiently late retained term `a_{i,n}`, at most one of the `L` immediately preceding indices has been deleted. Since the original sequence is increasing, their remaining sum is at least the sum of the original `L-1` smallest of those terms, regardless of which index was deleted. Hence
```text
Σ_{b∈B_i, b<a_{i,n}} b ≥ Σ_{j=2}^L a_{i,n-j}
                         ≥ a_{i,n} Σ_{j=2}^L λ^{-j} > a_{i,n}.
```
The finitely many earlier terms have finite deficits, so `Δ(B_i)<∞`. Both `B_i` are infinite because `L≥2`. The three sets `B_1,B_2,C` are pairwise disjoint. Fan's Theorem 2.2 now gives strong completeness, proving Theorem 1. □

In particular, if one strictly increasing unbounded sequence has limsup successive ratio less than `√φ`, splitting it into odd and even indices gives the same iff characterization for that one sequence.

## 3. Floor rays and almost every second coefficient

**Corollary 2.** Fix a real `1<γ<φ` and two positive coefficients `α,β` with `α/β∉γ^Z`. The set of positive values of the two floor rays is strongly complete if and only if its `H_1` is trivial.

Indeed, terms are eventually strictly increasing and their successive ratios tend to `γ`. Infinitely many coincidences of actual values would have `|αγⁿ−βγᵐ|<1` and `m,n→∞`, forcing `γ^{n−m}→β/α`; the powers are discrete away from zero, contrary to the ratio assumption. Thus only finitely many values overlap. The conclusions for actual values imply the same positive result for the original interleaving. No conclusion here is claimed about overlapping rays under the indexed convention.

**Corollary 3.** For every fixed real `1<γ<φ` and every fixed `α>0`, almost every `β>0` gives a strongly complete union of the floor rays. This remains true when `β` is required to have irrational ratio to `α`.

The exceptional angles of the first ray form a countable set by Fan's Lemma 3.1. For any fixed `θ∈(R/Z)\setminus{0}`, we show that `||θ⌊βγⁿ⌋||` does not tend to zero for almost every `β>0`. On a fixed bounded interval `J⊂(0,∞)`, put `f_n(x)=exp(2πiθ⌊xγⁿ⌋)`. On any subinterval of `J`, its integral has absolute value at most `C_θ γ^{-n}`: after two possibly incomplete floor cells, the sum over the remaining cells is a consecutive geometric sum of unit complex numbers with ratio `exp(2πiθ)≠1`, and each cell has length `γ^{-n}`. For `n<m`, splitting at each constant cell of `f_n` yields
```text
|∫_J f_m(x) conj(f_n(x)) dx| ≤ O_{J,θ}(γ^{n-m}).
```
There are at most `|J|γ^n+2` cells. Summing these correlation bounds gives
`∫_J |N^{-1} Σ_{n<N} f_n(x)|² dx = O_{J,θ,γ}(1/N)`.
Markov's inequality and Borel–Cantelli on `N=k²` give almost-everywhere convergence of those means to zero, first for every positive rational error tolerance and then without restriction. For intermediate `N`, the mean differs from the previous square-index mean by at most `2((k+1)²-k²)/k²=o(1)` since `|f_n|=1`. If `||θ⌊βγⁿ⌋||→0`, then instead `f_n(β)→1`; this is impossible on that full-measure set. A countable cover by bounded `J` proves the claim for almost every positive `β`.

Apply this conclusion to each of the countably many nonzero `θ∈H_1` of the first ray. For almost every `β` none of those angles can belong to the second ray's `H_1`, because summability implies convergence to zero. Discard also the countable exceptions `β/α∈γ^Z` or `β/α∈Q` as desired, and apply Corollary 2. □

## 4. An arithmetic classification for algebraic bases

**Theorem 4.** Suppose the base `γ∈(1,φ)` is algebraic and `α/β∉γ^Z`. Let `P∈Z[X]` be a nonzero scalar multiple of the monic minimal polynomial of `γ`. The floor-ray union is strongly complete if and only if both conditions hold:

1. No prime divides all sufficiently large values on both rays.
2. If `γ` is Pisot, at least one floor ray does not eventually satisfy the exact recurrence `P(E)a=0`, where `E` shifts the index by one.

In particular, only the first condition is needed for every rational base or every Salem base in the stated range, or if either coefficient is outside `Q(γ)`.

The recurrence and trace ingredients are classical in Pisot–Vijayaraghavan approximation theory. For related recurrence lemmas and the standard reciprocal description of Salem numbers, see [Bugeaud, *Distribution Modulo One and Diophantine Approximation*, Lemma 2.2 and §2.1](https://staff.dc.uba.ar/becher/aa/Bugeaud2012.pdf), and for the bounded polynomial residual method see [Boyd, *On linear recurrence relations satisfied by Pisot sequences*, §3](https://matwbn.icm.edu.pl/ksiazki/aa/aa47/aa4712.pdf). The use here concerns the rotation spectrum of an already rounded floor ray and its connection to two-ray completeness, not a new form of the classical approximation theorem.

### Eventual recurrences forced by irrational angles

Write `P(X)=Σ_{j=0}^d p_j X^j` and `a_n=⌊tγ^n⌋` for a ray coefficient `t>0`. The residual `R_n=Σ p_j a_{n+j}` is integral and bounded by `Σ|p_j|`, since `P(γ)=0` and the rounding errors have absolute value at most 1. If `θ` is irrational and `||θa_n||→0`, then `||θR_n||→0` by the triangle inequality. The finitely many nonzero possible residuals give a positive lower bound for `||θR_n||`. Thus `R_n=0` eventually.

For an exact recurrence valid from `N`, the expansion
`a_{N+n}=Σ_{i=1}^d c_i γ_i^n`
follows by solving the first `d` values via the Vandermonde system at the distinct conjugates `γ_i`, with `γ_1=γ`. The `c_i` lie in the splitting field, and its automorphisms permute them alongside the roots. In particular `c_1∈Q(γ)`, since every automorphism fixing `γ` fixes `c_1`. In the difference `a_{N+n}−tγ^{N+n}` the coefficient of `γ^n` is `c_1−tγ^N`, and it is zero: applying the inverse Vandermonde matrix to `d` consecutive bounded errors shows that each corresponding exponential term, including `(c_1−tγ^N)γ^n`, is bounded. Thus `t=c_1γ^{-N}∈Q(γ)`. The Galois permutation then gives `a_n=Tr_{Q(γ)/Q}(tγ^n)` for all sufficiently large `n`. Every coefficient of the recurrence expansion is nonzero, as it is conjugate to `c_1=tγ^N>0`. The same bounded-error argument shows `|γ_i|≤1` for every `i>1`.

Also `γ` must be an algebraic integer. Indeed let `v_n=(a_n,…,a_{n+d-1})∈Z^d` on the tail, let `T` be the rational companion shift satisfying `Tv_n=v_{n+1}`, and let `L=span_Z{v_n:n≥N}⊂Z^d`. The real or complex span of these vectors has dimension `d`, because the matrix with columns `v_N,…,v_{N+d−1}` is `V diag(c_1,…,c_d) V^T` with `V_{ji}=γ_i^j` for `0≤j<d`; every factor is invertible. Therefore `L` is a full-rank free integer lattice and `T` preserves it; in a `Z`-basis of `L`, `T` is an integer matrix. Its characteristic polynomial is monic integral and has root `γ`. Hence the existence of an exact floor recurrence requires `γ` Pisot or Salem and `t∈Q(γ)`.

### Eliminating irrational angles at Salem bases

Suppose now `γ` is Salem and `θ` irrational with `||θa_n||→0`. To recall the root structure, any unit-circle conjugate `ζ` is nonreal (a rational root `±1` would contradict minimality); its complex conjugate is `ζ^{-1}`. Thus `P` and its reciprocal polynomial share a root, and irreducibility forces proportionality. Reciprocal pairing and the unique root `γ` outside the unit disk leave exactly one root `γ^{-1}` inside, with every other conjugate on the unit circle, and degree `d≥4`. Let `b_n` be a nearest integer to `θa_n`. We already have `P(E)a_n=0` eventually. Since `b_n−θa_n→0`, the integer residual `P(E)b_n` also tends to zero and hence is eventually zero. Its leading coefficient comparison, using boundedness of `b_n−θtγ^n` and the same Vandermonde argument, gives `θt∈Q(γ)` and `b_n=Tr(θtγ^n)` eventually. Thus `θ∈Q(γ)`, and
```text
b_n−θa_n = Σ_σ σ(t)(σ(θ)−θ) σ(γ)^n → 0 .
```
An inverse Vandermonde calculation on sliding consecutive windows now forces every term with `|σ(γ)|≥1` to have zero coefficient, so `σ(θ)=θ` for each unit-circle conjugate embedding. The only nonidentity embedding not covered is the real reciprocal involution `τ:γ↦γ^{-1}`; this map is an automorphism of `Q(γ)` because the Salem minimal polynomial is reciprocal and the field contains the reciprocal. The trace `r=Tr(θ)=(d−1)θ+τθ` is rational. Applying `τ` and subtracting gives `(d−2)(θ−τθ)=0`. A Salem number has degree at least four, so `θ=τθ`, whence `r=dθ` and `θ` is rational, contradiction.

### Finishing the arithmetic classification

A nonzero rational angle of reduced denominator `q≥2` lies in the spectrum of both rays precisely if each is eventually divisible by `q`, because every nonzero summand is at least `1/q`. This implies eventual divisibility by one of its prime factors; thus the rational obstruction is exactly condition 1.

The previous arguments show irrational spectrum is impossible at non-Pisot bases and whenever either ray lacks the eventual exact recurrence. In the sole remaining case, `γ` is Pisot and both rays follow the exact recurrence. For either such ray the trace expansion gives
```text
γ a_n−a_{n+1} = Σ_{σ≠id} σ(t)(γ−σ(γ)) σ(γ)^n .
```
All conjugate moduli in this sum are strictly below one, so the absolute values are summable. Since each `a_{n+1}` is an integer, the nonzero circle angle `γ mod 1` belongs to `H_1` of each ray and is a common irrational obstruction. (An algebraic integer between one and two cannot be rational.) This completes the proof by Corollary 2. □

The algebraic classification makes no assertion that the eventual-prime obstructions can be decided for all coefficients. They are real in this range by Geneson. The general spectral theorem and metric conclusion do not require algebraicity.

**Finite bound on possible obstructing primes.** Let `S_+=Σ_{p_j>0}p_j` and `S_-=Σ_{p_j<0}|p_j|`. If a ray does not eventually satisfy `P(E)a=0`, no prime `p≥max(S_+,S_-)` can divide all of its sufficiently late values. In fact such divisibility gives `a_n=p b_n` eventually with `b_n` integral and `0≤(t/p)γ^n−b_n<1/p`. Applying `P(E)` shows `P(E)b_n` is an integer strictly between `-S_+/p` and `S_-/p` on the tail, hence zero, a contradiction. The sums `S_+,S_-` are both positive since `P(γ)=0` and `γ>0`. In particular, for every rational `γ=u/v>1` in lowest terms only primes less than `u` can be common eventual divisors.

For example, at `γ=3/2` the only possible common prime is 2. Let `Z_{3/2}={x>0 : {x(3/2)^n}<1/2 for every n≥0}`, [Mahler’s classical Z-number set](https://doi.org/10.1017/S1446788700005371). The statement “all positive irrational-ratio pairs at base `3/2` are complete” is therefore equivalent to “`Z_{3/2}` contains no pair of irrational ratio.” In one direction, two such Z-numbers doubled give two entirely even floor rays. In the other direction, if a positive irrational-ratio pair were incomplete, Theorem 4 would force both rays to be eventually even (lack of completeness implies lack of strong completeness). Shifting both by the same sufficiently large index and halving their coefficients gives Z-numbers of the same irrational ratio. This equivalence does not assume that even one Mahler Z-number exists.
