# Erdős 25: independent review of the capacity and footprint obstructions

21 November 2026. Reviewed source: [capacity-and-footprint-obstructions.md](capacity-and-footprint-obstructions.md), SHA-256 `f4c28c7c89f4f1117fce4a347b13d00cb9d67e293cbfd4ff366b30c29af5d109`. All stated inequalities and deductions pass. The note does not resolve Erdős 25. Its zeta-weighted inequality remains explicitly unproved.

The only correction requested was the final paragraph's reference from equation (13) to equation (14). The pinned version includes that correction; the mathematics is unchanged.

## 1. Factorial-moment count and its uniform application

For a modulus containing at least $`h`$ of the prescribed primes, choose an $`h`$-element subset of its prime divisors. Summing over all such subsets overcounts the moduli and gives the displayed divisor-product sum. The expansion of $`\lambda^h`$ contains each squarefree product exactly $`h!`$ times, plus nonnegative repeated-index terms. This proves the count and reciprocal bounds in the stated direction.

Activation is essential to the estimate for one residue class. Normalizing its residue to $`0\le a\lt q`$, its positive active terms are $`q+a,2q+a,\ldots`$. Each is at least the corresponding positive multiple of $`q`$, so at most $`Y/q`$ such terms occur below $`Y`$. There is no omitted endpoint correction.

The application is uniform over the distinct primes. Their ordered values satisfy $`p_i\ge i+1`$, whence $`\lambda\le H_{k+1}-1\le\log(k+1)`$. The floor relation for $`k_j`$ indeed gives $`j<(4k_j+8)^2`$. With $`h_j\ge k_j/3`$, the power in (5) decays faster than the polynomial prefactor. No hypothesis that the replacement primes remain large is used. This rules out retaining the high prime-incidence requirement at a positive endpoint density, and makes no claim about lower-incidence constructions.

## 2. Footprint lower bound and its constant

An interval of diameter less than the smallest modulus contains at most one point from each completed residue class. Covering $`cQ`$ distinct endpoints therefore needs at least $`cQ`$ distinct classes. This gives $`\mathbb EZ\ge c/b`$.

Two congruences either have empty intersection or a cylinder of measure $`1/\mathop{\mathrm{lcm}}(q,r)`$. The double sum is therefore bounded by the gcd sum in (7), including the diagonal. The identity

```math
\sum_{u,v\le m}\gcd(u,v)
=\sum_{d\le m}\varphi(d)\lfloor m/d\rfloor^2
\le m^2H_m
```

gives the claimed upper bound. Cauchy–Schwarz on the support of $`Z`$ then yields (8). Substituting the three rational constants gives exactly

```math
\frac{c^2a^2}{b^4}
=\left(\frac{(3/8)(19/20)}{(21/20)^2}\right)^2
=\left(\frac{95}{294}\right)^2.
```

The resulting harmonic lower bound over dyadic scales obstructs summing individual footprints over the stated full epochs. It does not assert additivity of the measures or exclude highly correlated footprints. The source preserves this distinction.

## 3. Primary-source check for the cross-scale argument

I independently opened the following source statements:

- Filaseta, Ford, Konyagin, Pomerance, and Yu, [*Sieving by large integers and covering systems of congruences*, printed page 498](https://www.math.kent.edu/~yu/research/covering.pdf): the Rogers comparison has the required direction. Setting every residue to zero maximizes survivor density, hence minimizes the union density.
- Tao, [*Rogers' theorem on sieving*, 19 January 2026, Theorems 1 and 3](https://terrytao.wordpress.com/2026/01/19/rogers-theorem-on-sieving/): the finite coset-to-subgroup comparison and its prime-power/product proof support the same application.
- Davenport and Erdős, [*On sequences of positive integers* (1936), Theorem 1, printed pages 149–150](https://www.renyi.hu/~p_erdos/1936-04.pdf): the logarithmic density of a set of multiples is the increasing limit of the finite-union densities. I also inspected the displayed theorem on the scanned page. It is not a claim that ordinary density always exists.

Continuity from below extends the finite Haar comparisons to the countable union. Under an injective endpoint assignment, $`q(m)\le m`$ gives the termwise harmonic inequality, and the assigned moduli form a subset of the set of multiples. Dividing by $`\log X`$ and applying the established logarithmic-density theorem proves (11). Neither injectivity nor the activation inequality is dropped.

For at most $`K`$ endpoints per modulus in its one active class, the $`\ell`$th assigned endpoint is at least $`\ell q`$. Its harmonic contribution is at most $`H_K/q`$, which proves (12). This argument does not apply to all deleted integers when the assignment loads are unbounded, nor to a tail after conditioning on an earlier sieve.

## 4. Refinement embedding and source pins

The infinite-refinement embedding is exact. With $`n=qm+r`$ and $`0\le r\lt q`$, the inequalities $`n\ge qd`$ and $`m\ge d`$ are equivalent, and the lifted congruences are equivalent. The reciprocal difference is summable, so the upper and lower logarithmic densities both scale by $`1/q`$. This prevents extending the finite-per-block density theorem to arbitrary infinite refinements without solving the original question.

The checked construction source is Wang's [Problem 486 TeX, Sections 3–4](https://github.com/ShouqiaoW/erdos/blob/main/486/paper.tex), local SHA-256 `fe03985bf3e7cf15adb5ed848a2cbc4b6a8b22dd31b3f418e2323c318b26949b`, public Git blob `472f40ff58331b28e8b4995dde4b99826299d1d2`. Its multiple-residue construction and the singleton restriction remain separate.

The checked partial source is Chojecki's [*Truncated Congruence Sieves and Erdős Problem 25*](https://www.ulam.ai/research/erdos25.pdf), local extracted-text SHA-256 `8163247b99e250ceef5a85207155e91456c7e9cf9ba28df69958e22b0f3e5747`. Its quotient-sieve harmonic approximation is a conjectured step. The tower example justifies the note's warning that an individual first-kill contribution can greatly exceed its eventual density; it does not refute a comparison that uses accumulated slack.

The separate refinement theorem has SHA-256 `9039702ef93c9d9079bfd3d48b03c3880c5fe9924d1a764ce336ad9a8b8582ce` and has already received an independent review from the capacity-note author.

## 5. Remaining scope

No proof of the zeta-weighted inequality in equation (14) is present or inferred. Rogers' Haar comparison alone does not control integer activation with Dirichlet-series weights. The [separate activated-count counterexample](activated-count-bound-counterexample.md) rejects a proposed cutoff estimate, while explicitly showing that its prime-modulus examples satisfy the zeta comparison.

The audit certifies these limited statements. It does not certify logarithmic-density existence for an arbitrary singleton system, a counterexample to that existence, novelty priority, or a completed bounty.
