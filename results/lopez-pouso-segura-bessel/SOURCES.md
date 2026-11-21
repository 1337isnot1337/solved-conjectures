# Source and prior-art audit

Audit date: 2026-11-21. Result: no prior proof or disproof of the three
specified Bessel-weight assertions was located. This is a bounded
literature-search conclusion, not a guarantee concerning inaccessible
or unindexed work.

## Exact target

Óscar López Pouso and Javier Segura, *Uniform relations between the
Gauss–Legendre nodes and weights*, Journal of Inequalities and
Applications **2025**, article 40, published 20 March 2025.

- [Publisher full text](https://link.springer.com/article/10.1186/s13660-025-03283-w)
- [Published PDF](https://journalofinequalitiesandapplications.springeropen.com/counter/pdf/10.1186/s13660-025-03283-w.pdf)
- [arXiv record](https://arxiv.org/abs/2305.19128)
- [Author-provided published full text on ResearchGate](https://www.researchgate.net/publication/390031181_Uniform_relations_between_the_Gauss-Legendre_nodes_and_weights)

The published numbering is authoritative for this package:

| Assertion | Definition | Location | Full content established |
|---|---|---|---|
| Conjecture 2 | Equation (16), $`C_i`$ | Section 4.1, printed pp. 10–11 | Positivity, strict increase, limit $`\pi^2/12`$ |
| Conjecture 5 | Equation (18), $`E_i`$ | Section 4.2 | Negativity, strict decrease, limit $`-\pi^2/6`$ |
| Conjecture 8 | Equation (19), $`K_i`$ | Section 4.3, printed p. 15 | Positivity, strict increase, limit $`\pi^2/12`$ |

The arXiv record lists v1 dated 30 May 2023, v2 dated 27 January 2024,
and v3 dated 22 January 2025. Earlier numbering differs. The current
published text still labels all three statements as conjectures.

The source's Appendix C already proves a different monotonicity
property involving values of Bessel derivatives at zeros. Appendix D
proves finiteness of the limit of $`C_i`$, without the exact constant or
the complete positivity and monotonicity assertion. Those are existing
results, not claimed as new here. Our proof supplies the full three
statements through inverse-phase convexity, a resolvent identity, and
a weighted-average identity.

The unnumbered Bessel constants in source equation (10) also follow
from the same positive measure. The separate finite-degree uniform
Gauss–Legendre circle conjecture and the other finite-degree
Gauss–Legendre assertions are outside this result.

## Search record

Searches used both available web search engines in separate requests.
Queries covered author names with and without diacritics, exact title,
DOI, arXiv identifier, conjecture numbers, the Bessel sums, and likely
resolution terms. Representative queries were:

```text
"Uniform relations between the Gauss-Legendre nodes and weights" proof conjecture
"Uniform relations between the Gauss-Legendre nodes and weights" solved
"López Pouso" "Segura" "Conjecture 2"
"Lopez-Pouso" "Segura" "conjecture"
"López Pouso" "Segura" "Conjecture 5"
"López Pouso" "Segura" "Conjecture 8"
"2305.19128" proof conjecture
"2305.19128" -site:arxiv.org -site:researchgate.net -site:link.springer.com
"03283-w" "conjecture" -site:link.springer.com -site:researchgate.net
"Gauss-Legendre" "conjectures" proved 2026
"Gauss-Legendre" "weights" "Conjecture 5"
"Pouso" "Segura" "Bessel" proof conjecture
"López Pouso" "Bessel" "sum"
"Bessel" "pi^2/12" "conjecture"
"Segura" "Bessel" "conjecture" site:trureturing.org
"Pouso" "conjecture" site:github.com
"On Morel" "conjecture"
"Fast and accurate computation of classical Gaussian quadratures" "conjecture"
```

The searches returned the original article, its preprint and publication
records, related numerical-analysis articles, and older Bessel phase
work. They did not identify a later resolution of Conjectures 2, 5,
or 8. The DOI page reports three citations; we did not establish a
complete independent citation-graph census.

## Closest literature examined

1. [Javier Segura's publication list](https://personales.unican.es/segurajj/publi.html)
   includes the target and later work through 2026. No listed later
   paper announces a resolution of these Bessel-weight assertions.
   The [other author's institutional list](https://investigacion.usc.gal/investigadores/59483/publicaciones)
   was also checked as a discovery source.

2. López Pouso and Segura, *Analysis of difference schemes for the
   Fokker–Planck angular diffusion operator*, Computers & Mathematics
   with Applications **181** (2025), 84–110,
   [DOI 10.1016/j.camwa.2025.01.005](https://doi.org/10.1016/j.camwa.2025.01.005),
   [arXiv 2308.08950](https://arxiv.org/abs/2308.08950).
   The accessible 35-page preprint concerns convergence conditions
   for discretizations, and does not contain the Bessel-weight proof.

3. A. Gil, J. Segura and N. M. Temme, *Fast and accurate computation
   of classical Gaussian quadratures*, SIAM Journal on Scientific
   Computing **48**(3) (2026), B289–B316,
   [DOI 10.1137/25M1755448](https://doi.org/10.1137/25M1755448),
   [arXiv 2509.16716](https://arxiv.org/abs/2509.16716),
   [accessible full PDF](https://arxiv.org/pdf/2509.16716).
   This later citing article develops quadrature algorithms. The
   retrieved full text did not supply a proof of the target assertions.

4. López Pouso, B. D. Ganapol and Segura, *On Morel's Fokker–Planck
   Angular Differencing Scheme*, 2025,
   [DOI 10.1080/23324309.2025.2492685](https://doi.org/10.1080/23324309.2025.2492685).
   The abstract describes convergence analysis of difference schemes.
   Publisher full text was blocked by HTTP 403, so this paper was
   checked through indexed abstract and metadata only. It remains a
   stated access limitation of this audit.

5. D. E. Horsley, *Bessel phase functions: calculation and
   application*, Numerische Mathematik **136**(3) (2017),
   [DOI 10.1007/s00211-016-0853-7](https://doi.org/10.1007/s00211-016-0853-7),
   [author full text](https://www.researchgate.net/publication/311854263_Bessel_phase_functions_calculation_and_application).
   Its Theorem 2 establishes convexity or concavity of the ordinary
   phase as a function of its argument, using Nicholson's formula.
   This is related classical material; it does not give the sums,
   their exact constants, or the inverse squared-phase third-derivative
   argument in this package.

Classical formula endpoints are listed explicitly at the end of
PROOF.md. No novelty is asserted for Nicholson's formula,
Fourier–Bessel expansion, the Bessel asymptotics, or Euler–Maclaurin.

## Review and counting

Two independent agents read the complete proof and checked the
normalizations, endpoint passage, strict inequalities, asymptotic
remainder orders, and limit constants. No substantive gap was found.
The exact verifier checks the rational polynomial identities and
constant arithmetic; it does not replace the analytic argument.

Treat these three closely related source conjectures as one named
result in the requested tally. This avoids splitting one common
argument into multiple entries.


## Additional independent corpus audit

A second reviewer recorded [an additional corpus and issue priority audit](../../research/2026-11-21-lopez-pouso-segura-independent-priority/AUDIT.md), including complete available directory inventories, five full nearby Bessel manuscripts, and eight further global issue queries. No earlier exact resolution was found in that scope. The note preserves the unavailable GitHub code search, unexported corpus entries, and inaccessible Morel full text as explicit limits.
