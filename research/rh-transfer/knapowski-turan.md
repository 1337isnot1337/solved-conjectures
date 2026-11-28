# Knapowski–Turán conjecture

Research checkpoint, 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

Status: complete inherited refutation under the campaign's accepted Dirichlet GRH input. The conditional refutation and its stronger density theorem are Kaczorowski's results from 1992. No new proof method or priority is claimed.

## 1. Exact named target

Write pi(x;4,a) for the number of primes at most x congruent to a modulo 4. Knapowski and Turán's density conjecture predicts that the less common ordering has density zero:

~~~math
\frac1X\#\{m\le X:
  \pi(m;4,1)\ge\pi(m;4,3)\}\longrightarrow0.
\tag{1}
~~~

Equivalently, the ordering pi(m;4,3)>pi(m;4,1) should have natural density 1. Versions written with a strict inequality in the exceptional set are also refuted by the theorem below. No assumption about the density of ties is needed.

The original source is [Knapowski and Turán, Comparative prime-number theory. I, Acta Math. Acad. Sci. Hungar. 13 (1962), 299–314](https://personal.math.ubc.ca/~gerg/teaching/592-Fall2018/papers/1962.Knapowski_1.pdf), equations (2.4)–(2.5) on printed page 302. Kaczorowski reproduces the conjecture in [his 1992 introduction](https://www.numdam.org/item/AST_1992__209__227_0.pdf), equations (1.1)–(1.2).

This is the original named density conjecture, whose modulus 4 is part of its statement. It is not an artificial numerical case of an all-moduli conjecture. It must be distinguished from a different Knapowski–Turán conjecture about patterns of consecutive primes, which was already disproved unconditionally using Maynard's work.

## 2. The existing conditional theorem

J. Kaczorowski, *The boundary values of generalized Dirichlet series and a problem of Chebyshev*, Astérisque 209 (1992), 227–235, [DOI 10.24033/ast.167](https://doi.org/10.24033/ast.167), proves the following in Corollary 2, equations (1.14)–(1.15), printed page 230.

Assume GRH for every Dirichlet L-function modulo q. If (a,q)=1 and a is not 1 modulo q, then for every fixed u>0 there exist constants c>1 and d>0 such that, for every sufficiently large Y,

~~~math
\#\left\{Y\lt m\lt cY:
 \pi(m;q,a)-\pi(m;q,1)>
       u\frac{\sqrt m}{\log m}\right\}>dY,
\tag{2}
~~~

and

~~~math
\#\left\{Y\lt m\lt cY:
 \pi(m;q,a)-\pi(m;q,1)<
       -u\frac{\sqrt m}{\log m}\right\}>dY.
\tag{3}
~~~

The theorem is about all sufficiently large multiplicative intervals, not just an infinite sequence of individual exceptions. It uses neither simplicity nor linear independence of the zero ordinates.

The full paper, including the proof, is available in the [Numdam scan](https://www.numdam.org/item/AST_1992__209__227_0.pdf). The author's [official publication abstract](https://smf.emath.fr/publications/boundary-values-generalized-dirichlet-series-and-problem-chebyshev) explicitly identifies its consequence as a refutation of the Knapowski–Turán conjecture under GRH.

## 3. Complete deduction from the accepted input

The accepted theorem supplies RH for zeta and for the primitive character chi_4. These give the required GRH for all characters modulo 4:

~~~math
L(s,\chi_0\bmod4)=(1-2^{-s})\zeta(s),
\qquad
L(s,\chi_4)=\beta(s).
~~~

The extra Euler factor has zeros only on Re(s)=0, outside the open critical strip.

Apply (2)–(3) with q=4, a=3 and u=1. Define the two strict-ordering counts

~~~math
N_+(X)=\#\{m\le X:\pi(m;4,1)>\pi(m;4,3)\},
~~~

~~~math
N_-(X)=\#\{m\le X:\pi(m;4,3)>\pi(m;4,1)\}.
~~~

Set Y=X/c. For all sufficiently large X, (3) implies N_+(X)>dX/c, while (2) implies N_-(X)>dX/c. Since the strict sets are disjoint,

~~~math
\frac dc
\le\liminf_{X\to\infty}\frac{N_+(X)}X
\le\limsup_{X\to\infty}\frac{N_+(X)}X
\le1-\frac dc.
\tag{4}
~~~

The same bounds hold with N_+ and N_- exchanged. Replacing strict by non-strict inequalities cannot restore the conjecture: the strict exceptional set already has positive lower density, and the opposite strict set has positive lower density too.

For real arguments, each prime-counting function is constant on [m,m+1). Therefore the Lebesgue-measure version differs from the integer-counting version by at most an endpoint error O(1). The same conclusion holds for either formulation of natural density.

In particular, the conjectured exceptional density zero in (1) is impossible. This is a complete deduction at the scale of the original conjecture.

## 4. Prior-art and current-status audit

The search distinguishes an old conditional theorem from an unconditional theorem that would make this target ineligible.

- **1962 original:** equations (2.4)–(2.5) state the density conjecture.
- **1992 primary theorem:** Kaczorowski's Corollary 2 proves (2)–(3) under Dirichlet GRH. This is the result applied here, with full credit.
- **1995 refinement:** Kaczorowski's *On the distribution of primes (mod 4)*, Analysis 15 (1995), 159–171, proves conditional upper/lower natural-density bounds implying that the natural density does not exist. The exact numerical bounds are not needed here and are not counted as another target.
- **2023 primary research:** [Gorodetsky, Sums of two squares are strongly biased towards quadratic residues, arXiv:2111.12662v4](https://arxiv.org/pdf/2111.12662), Section 1C, still describes the refutation as conditional on GRH, citing Kaczorowski 1992 and 1995.
- **2024 specialist bibliography:** [Martin et al., arXiv:2309.08729v3](https://arxiv.org/pdf/2309.08729v3), entries for Kaczorowski 1992/1995 and Rubinstein–Sarnak 1994, records the GRH assumptions. Some expository pages omit those assumptions when saying the conjecture is false; those pages are not used to infer an unconditional proof.
- **Recent specialist exposition:** [Bailleul, Unconditional comparative prime number theory over function fields](https://abailleul.perso.math.cnrs.fr/Talks/CPNTS.pdf) states the number-field conjecture and its GRH-conditional refutation separately from the unconditional function-field subject.
- **Fresh search:** both search engines were queried for the exact names with natural density, unconditional, solved, disproved, 2025, 2026, quasi-Riemann, and Alpöge. No earlier unconditional proof of this exact density statement was located. Search results about consecutive-prime patterns were excluded as a different conjecture.

The status assessment is bounded by these sources. The mathematical implication itself is entirely Kaczorowski's existing theorem specialized to its original application, with the new campaign input discharging GRH. It is an inherited consequence, not a newly discovered solution.

## 5. Connection to the Fujii investigation

Kaczorowski's boundary-function method is also an antecedent for the near-zero reflection argument used in [fujii-boundary.md](fujii-boundary.md). This does not make the two conjectures identical. The Knapowski–Turán target concerns the natural density of signs of an unsmoothed prime race; Fujii's target concerns negative limits of an exponential-power smoothing family.

The present file records a full old conditional implication. The Fujii files document a separate specific deduction whose exact source and novelty checks remain explicit.
