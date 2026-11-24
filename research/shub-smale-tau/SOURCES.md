# Source scope and prior-result audit

Checked 23 November 2026. No new proof of the target is claimed.

## 2. Scope of the pinned Anthropic theorem

Pinned commit: `11b6c7e3c927df2658f513b6b68ea7f8929c62c5`.

The locally inspected files are `vp-vnp/Statement.lean` and `vp-vnp/Solution.lean` at that commit. Relevant interfaces:

- `Statement.MainTheorem` / `Solution.mainTheorem`, using `Paper.thm_allfields`.
- `Statement.MainTheoremApprox` / `Solution.mainTheoremApprox`, using `Paper.thm_approx`.
- `Statement.Separation` / `Solution.separation`.
- `Statement.SeparationClosure` / `Solution.separationClosure`.

The permanent conclusion is over characteristic different from 2; it applies over C. There is an absolute c>0 and a threshold depending on the characteristic such that circuit size exceeds m^(c (log_2 m)^(1/3)). Constants and variable inputs count as gates. The circuit model uses sums and products with arbitrary field constants. A subtraction gate is simulated by adding a product with -1 at constant overhead. Approximation is expressed by a circuit over Laurent series whose output coefficients have the target constant term and no negative powers.

VP and its closure explicitly impose a polynomial bound on total degree. F_{2^n} has degree 2^n. A short circuit for it would not, just from its length, put this family in the VP class indexed by n. More importantly, none of these interfaces states that a short circuit for a polynomial with many integer roots yields a short circuit for the permanent. Such a reduction remains to be proved. The known implication from a tau root bound to permanent hardness cannot be reversed by citing permanent hardness.

## 3. A precise local-field obstruction

Koiran–Portier–Rojas, arXiv:1309.0486v1, Example 1.16 gives, for any fixed prime p,

```math
h_{p,1}(x)=x(1-x),\qquad h_{p,n+1}(x)=\bigl(p^{3^{n-1}}-h_{p,n}(x)\bigr)h_{p,n}(x).
```

It has degree 2^n, exactly 2^n distinct roots in Z_p, and tau(h_{p,n})=O_p(n). Its integer roots are exactly 0 and 1. The last statement is elementary: at every other integer x the initial value is negative, and a negative value stays negative under u -> (positive-u)u. The power p^(3^(n-1)) is updated by cubing, so each stage uses four arithmetic gates apart from a fixed initialization.

### Proposition 2 (finite-palette obstruction; consequence of the cited example)

For every fixed finite set S of primes there are nonzero g_n in Z[x] with tau(g_n)=O_S(n), at least 2^n distinct real roots, and at least 2^n distinct roots in Q_p for every p in S. Nevertheless g_n has at most two integer roots.

Proof. Put C_0=x and C_{n+1}=C_n^2-2. For n>=1,

```math
C_n(2\cos\theta)=2\cos(2^n\theta).
```

Thus C_n has exactly 2^n distinct real roots and tau(C_n)<=2n+1. It has no integer roots: an odd input gives an odd value throughout, and an even input gives C_n(x)=2 modulo 4 for every n>=1. Define

```math
g_n=C_n\prod_{p\in S}h_{p,n}.
```

The product is nonzero. The circuit has O_S(n) gates. Its roots include the 2^n real roots of C_n and, in Q_p, the 2^n roots of h_{p,n}. Its only possible integer roots are 0 and 1. If S is nonempty both occur. QED.

Consequently no fixed finite choice of real and p-adic completions can support a bound of the form

```math
\min_{L\in\{\mathbb R\}\cup\{\mathbb Q_p:p\in S\}}\#Z_L(f)\le(1+\tau(f))^C.
```

for all nonzero f, regardless of C. This does not rule out an adaptive choice among unboundedly many primes, and does not disprove the integer-root conjecture.

## 4. Exact direction of the supplied 2013 paper

Theorem 1.14(I) of Koiran–Portier–Rojas records the tau-conjecture implications for BSS separation and constant-free permanent hardness. Theorem 1.2 assumes a polynomial bound on the number of valuations of integer roots for every sum-product-sparse polynomial at one fixed prime, and concludes constant-free permanent hardness. Theorem 1.15 gives a related implication from the Adelic SPS Conjecture. These are sufficient conditions; the now-imported permanent result supplies none of their root-count hypotheses. General SLPs are not automatically polynomial-size SPS expressions.

The same paper's Example 1.16 refutes polynomial Q_p-root bounds for arbitrary short SLPs. Its paragraph preceding that example also warns that selecting a sufficiently large prime makes all nonzero root valuations equal, so an existentially chosen prime with few valuations is not a useful root-count premise by itself.

## 5. Prior-result and openness check

Checked current primary-source pages on 23 November 2026:

1. Bhattacharjee–Blaeser–Dutta–Mukherjee, `Exponential lower bound via exponential sums`, arXiv:2601.00387v3 (21 January 2026), full version of ICALP 2024: uses the tau conjecture as an assumption to prove exponential-sum lower bounds. It does not prove tau.
2. Santibanez-Leal, Zenodo 23980033, version 0.06 (5 November 2026), reached through the newer-version link from supplied search record 22035884: reports a finite census through nine gates and explicitly states that it makes no asymptotic decision. Its computation was not rerun here. The abstract's separate claim about exponent one was not adopted.
3. Charles Edou Nze's `flouzzy/smale-problems` README explicitly marks problem 04 open. The entire 97-line `test_lean/Smale04IntegerRoots.lean` was inspected: it proves elementary monomial/linear/power facts, not the universal tau inequality. The Zenodo landing page 22148642 was inaccessible through the web tool, but its author's primary GitHub repository resolves the scope.

No checked source supplies the missing arbitrary-integer-root bound or the weaker all-multiples consecutive-root lower bound. This is a statement of the audit's findings, not a proof that no other publication exists.


## Primary-source links

- [Shub–Smale manuscript, dated 21 June 1994](https://janos.cs.technion.ac.il/COURSES/238900-13/Papers-1/ShubSmale-pap97.pdf), Introduction Theorems 1–2, Section 3 Theorem 1, Section 4 Propositions 1–2. The URL filename does not establish a 1997 publication date.
- [Anthropic pinned Statement.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean) and [Solution.lean](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Solution.lean). The exact interfaces above were read. The existing BSS source audit identifies written Theorem N.5 with the approximate interface; no upstream kernel replay was done here.
- [Koiran–Portier–Rojas, arXiv:1309.0486v1](https://arxiv.org/html/1309.0486v1), Definition 1.13, Theorems 1.2, 1.14(I), 1.15 and Example 1.16.
- [Bhattacharjee–Bläser–Dutta–Mukherjee, arXiv:2601.00387v3](https://arxiv.org/abs/2601.00387v3), conditional lower bounds, not a proof of τ.
- [Santibañez-Leal finite census, Zenodo 23980033](https://zenodo.org/records/23980033), version 0.06, 5 November 2026. Its computation was not rerun.
- [Edou Nze's source repository](https://github.com/flouzzy/smale-problems) and [the inspected elementary Lean file](https://github.com/flouzzy/smale-problems/blob/main/test_lean/Smale04IntegerRoots.lean).
- [Erdős, Beweis eines Satzes von Tschebyschef, 1932](https://users.renyi.hu/~p_erdos/1932-01.pdf), the unnumbered theorem proving Bertrand's postulate.

- [Walker, Coefficient growth in square chains, arXiv:1902.11164v1](https://arxiv.org/pdf/1902.11164), Proposition 1.1, Corollary 2.1 and Proposition 2.3. This restricted-model result is discussed in ARITHMETIC.md; coefficient bitlength is not constant-free straight-line complexity.
