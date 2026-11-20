# Erdős–Rosenfeld factor-difference conjecture: literature gate and route obstruction

Date: 2026-11-20. Research-only note. No claimed resolution or novel theorem.

## Target
For n>0, D(n)={|a-b|: a,b positive integers, ab=n}. Erdős Problem 885 asks whether, for every k, there exist k distinct positive integers N_i whose D(N_i) have at least k common elements.


## Literature findings
- Erdős and Rosenfeld, *The factor-difference set of integers*, Acta Arith. 79 (1997), 353–359, DOI 10.4064/aa-79-4-353-359.
- Jiménez-Urroz, *A note on a conjecture of Erdős and Rosenfeld*, JNT 78 (1999), 140–143, DOI 10.1006/jnth.1999.2407. Special cases only.
- Bremner, *On a problem of Erdős related to common factor differences*, IJNT 15 (2019), 1059–1068. Infinitely many four-integer/four-difference examples; not arbitrary k.
- Dujella–Elsholtz, *Sumsets being squares*, Acta Math. Hungar. 141 (2013), 353–357, DOI 10.1007/s10474-013-0334-8. Author manuscript https://dujella.github.io/pdf/dujella-elsholtz01k.pdf inspected in full. Its introduction states the conditional uniform bound on square sumsets with one side of size four, following Alon–Angel–Benjamini–Lubetzky and Caporaso–Harris–Mazur/Bombieri–Lang.
- *Sumsets in the set of squares*, QJM 75 (2024), 1243–1254, DOI 10.1093/qmath/haae044, repeats that same conditional uniform bound. https://academic.oup.com/qjmath/article/75/4/1243/7749340
- Choudhry, https://arxiv.org/abs/2508.07806, reports (3,3), (5,3), and (4,4) families in its abstract.
- Current indexed statement remains open: https://www.erdosproblems.com/history/885 and https://google-deepmind.github.io/formal-conjectures/src/FormalConjectures/ErdosProblems/%C2%AB885%C2%BB/
- November 2026 paper arXiv:2611.11574 on Delta-primitive squares solves a different factor-difference question, not 885.

No unconditional full proof or disproof was found. This is not a guarantee of novelty. It is notably unsafe to infer progress from formalizations of already-known k=2,3,4 cases.

## Exact algebraic translation
For d>=0 and N>0 integers,

    d in D(N) iff d^2+4N is an integer square.

Indeed if N=ab, a>=b, d=a-b then (a+b)^2=d^2+4N. Conversely choose the positive integer z with z^2=d^2+4N; then z>d and z,d have equal parity (squares modulo 4); hence a=(z+d)/2 and b=(z-d)/2 are positive integers with ab=N.

Consequently a k-by-k factor-difference configuration produces a square sumset A+B with A={d_j^2} and B={4N_i}, each of size k.

The arbitrary-k existence assertions are in fact equivalent: suppose there are finite integer sets A,B with A+B consisting of squares and min(|A|,|B|) arbitrarily large. Take |A|>=k and |B|>=k+1, and let b0=min B. Set A'=A+b0 (nonnegative integer squares), B'=B-b0, and discard 0 from B'. For every a'=u^2 in A' and b'>0 in B', choose u>=0 and v>0 with a'+b'=v^2. Then b'=(v-u)(v+u), so 2u belongs to D(b'). Distinct elements of A' give distinct nonnegative differences; distinct b' give distinct positive integers. This yields the required k-by-k configuration. Zero is allowed as a factor difference, so a'=0 causes no problem.

## Why naive elliptic induction fails
Fix r distinct shifts a_1,...,a_r over Q. Consider the simultaneous square-value curve

    y_i^2=x+a_i (1<=i<=r).

Its smooth projective normalization over an algebraic closure has genus

    g_r=1+2^(r-2)(r-3).

Proof: the r linear polynomials are independent modulo squares in Qbar(x)^*/Qbar(x)^{*2}, since each has its own simple zero. Thus the covering of the x-line has degree 2^r. Each of the r finite roots has inertia order two. Infinity also has inertia order two: after adjoining one square root of a linear polynomial, ratios (x+a_i)/(x+a_1) are units with residue 1 and are locally squares in characteristic zero. There are no other branch points. Riemann–Hurwitz gives

    2g-2 = -2*2^r + (r+1)*2^(r-1) = 2^(r-1)(r-3).

In particular r=3 is genus one and r=4 is genus five. Repeatedly adding points on an elliptic curve therefore does not automatically add a fourth shift. For a fixed four-shift configuration the rational extension problem already lives on a genus-five curve.

## Conditional obstruction, NOT a resolution

Background: Caporaso, Harris, and Mazur, “Uniformity of rational points,” J. Amer. Math. Soc. 10 (1997), 1–35, https://doi.org/10.1090/S0894-0347-97-00214-9.
The uniform rational-point conclusion of Caporaso–Harris–Mazur under Lang implies an absolute bound for the rational points of every smooth genus-five curve over Q. Applying it to the four-shift curves bounds |B| independently of the chosen shifts whenever |A|>=4 and A+B is all squares. Therefore that standard conditional uniformity result implies a NEGATIVE answer to Problem 885 for sufficiently large k.

This implication is already present in the square-sumset literature; it must not be advertised as a new conditional result. It does mean that an arbitrary-k positive construction would have consequences well beyond extending Bremner's parameterized families. An unconditional uniform bound across this genus-five family would suffice for this route; it is stronger than what is needed merely to rule out arbitrarily large balanced configurations. Finiteness for each fixed curve alone is insufficient.

## Research decision
Reject a naive constructive-extension approach. Do not spend the requested run making another k=4 example or chasing a k=5 numerical instance. The potential full-target directions are an unconditional uniform bound for this special genus-five family (negative resolution) or a genuinely unbounded square-sumset construction (contrary to Lang-based expectations). Neither was achieved in this pass.
