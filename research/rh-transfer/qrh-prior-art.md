# Euler's idoneal-number conjecture

Date: 2026-11-20. Status: **excluded from the new-target count because an October 2026 primary manuscript already explicitly claims the full result.**

This note records a prior-art collision and the exact analytic scope. It does not independently verify the October manuscript.

## The full target and the older conditional theorem

The target is completeness of Euler's 65 idoneal numbers, equivalently the assertion that the largest idoneal number is 1848. Kani states it as Conjecture 2. His Theorem 6 identifies idoneality of an integer with the one-class-per-genus condition for forms of discriminant minus four times that integer. Corollary 23 combines the order-to-field reduction with Weinberger's theorem to give the full classification under GRH.

The distinction between orders and maximal orders matters: the old unconditional result permits at most one additional fundamental discriminant, which can correspond to two additional idoneal numbers. It is incorrect to turn that automatically into “at most one additional idoneal number.”

Primary source: [Kani, *Idoneal numbers and some generalizations*](https://www.queensu.ca/academia/kani/sites/acadkaniwww/files/uploaded_files/Papers/idoneal-f.pdf), Conjecture 2, Theorem 6, Corollary 14, Theorem 22 and Corollary 23. See also [Watkins' correspondence tables](https://magma.maths.usyd.edu.au/~watkins/papers/IDONcorr.pdf).

## The needed L-functions are within the accepted family

Elsenhans, Klüners and Nicolae make the needed hypothesis explicit. For a negative fundamental discriminant, their §3 uses the real quadratic Dirichlet character attached to that discriminant. Lemma 3 assumes only

```math
L(s,\chi_D)\ne0\qquad
1-\frac{1}{4\log |D|}\le s<1
```

in the specified large-discriminant range. Theorem 4 applies this condition to class-group exponent bounds; Theorem 2 gives completeness for exponents dividing eight under the absence of the relevant real zeros.

Thus rational Dirichlet GRH supplies the required analytic condition. No GRH for nontrivial Hilbert class-field characters needs to be imported for this route. The mathematical transfer is valid, but is inherited.

Primary source: [Elsenhans–Klüners–Nicolae, author preprint](https://arxiv.org/pdf/1803.02056), Theorems 2 and 4 and §3, Lemmas 2–3; published in Acta Arith. 193 (2020), 217–233.

## The direct October 2026 collision

The introduction of OpenAI's October 5 manuscript, immediately before §1.1, explicitly combines the class-group classification with Grube's reduction and states completeness of Euler's list. This is the same full target, not a finite cutoff or a different dimension.

The inspected primary file is [paper2.tex](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex), particularly its introductory arithmetic-consequences paragraph. Its Git blob is `2000faddbbebac5de0ecfe0b962534ea61a852d5`.

This establishes a prior claim independently of any judgment about the new proof's correctness. We must not describe Euler completeness as a newly noticed consequence of the accepted RH archive.

## Inventory of the original QRH manuscripts

All three original result-003 manuscripts were searched in full, with their introductions and relevant statements read directly. Repository pin: `openai/math@4eaee87548250b2682affda7d05d947c05554bae`.

| Primary manuscript | Explicit consequences relevant to this campaign |
| --- | --- |
| [September 30, main QRH paper](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex), Corollary 1.2 | Vinogradov's least **quadratic nonresidue** conjecture; deterministic polynomial-time square-root extraction over prime fields. |
| [October 5, alternate QRH paper](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex), introduction | Repeats the nonresidue consequence; also states polynomial-time implementation of Miller's primality test, an effective imaginary quadratic class-number lower bound, and Euler's complete idoneal list. |
| [October 1, uniform real-zero gap](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/build/paper.tex), Theorem 1 | A uniform positive lower bound for the normalized real-zero gap. No additional full named consequence is stated. |

The main paper's source blob is `268c4e3206d460c617d3d2129742a72b831b3def`; the real-zero-gap paper's is `7e41c77c252348369ca0fb99cbe389271ba6ce86`.

Neither a least-primitive-root conjecture nor Soundararajan's smooth-number progression conjecture is stated in these three manuscripts. This absence is limited to the inspected files; the separate later consequences survey is being screened by the Dirichlet worker.

A separate [catalogue entry 029](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/overview.tex) already claims **Artin infinitude for every admissible integer base**, with a lower bound of order the interval endpoint divided by the square of its logarithm. That entry does not claim Artin's full density asymptotic. Keep these scopes distinct.
