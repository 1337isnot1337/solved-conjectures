# Sign-matrix construction audit

Research date: 20 November 2026 (America/Chicago). This is a record of structural reductions and failed construction families. It does not resolve Kräuter's conjecture, Wang's classification problem, or Hadamard nonvanishing. No finite-order improvement is claimed.

## Current source audit

The exact Minc-list statements were refreshed on 20 November 2026 (America/Chicago):

- Kräuter's minimum: https://yair-lavi.com/mincs-list/conjecture-36/index.html
- Wang's equality problem: https://yair-lavi.com/mincs-list/problem-7/index.html
- Hadamard nonvanishing: https://yair-lavi.com/mincs-list/problem-5/index.html

The first page still reports attainment only through order 32. An independent certificate submission reports attainment through 35, explicitly leaving every order at least 36 unresolved: https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/arithmetic-and-complexity/AC-11/README.md . Neither is a uniform construction.

Ingram and Razborov, *On the range of the permanent of (±1)-matrices*, Linear Algebra and its Applications 743 (2026), 271–285, explicitly retain the minimum-positive-value conjecture: https://arxiv.org/html/2507.09433v1 . Their generalized-arithmetic-progression argument controls the cardinality of a range, not the occurrence of its least lattice value.

Hunter, Kwan and Sauermann's *Exponential anticoncentration of the permanent* gives an exponential upper bound on point probabilities and hence an exponential lower bound on range cardinality. It does not prove positive probability at a prescribed lattice point: https://arxiv.org/abs/2509.22577 and the author copy https://mkwn.github.io/EAP.pdf . Thus this stronger range theorem does not supply the missing minimum-attainment step.

The Hadamard page explicitly names the stronger Wanless conjecture

\[
v_2(\operatorname{per}H)=v_2(n!)\qquad(n\geq4).
\]

Its stated general-order progress covers orders below 512 and orders whose binary expansion has at most six zeros. Chabaud's Sylvester theorem and the Paley nonvanishing result concern specified infinite families. They do not settle arbitrary real Hadamard matrices.

## A multiplicity obstruction to pure-power constructions

If a sign matrix has three rows equal up to multiplication by minus one, its permanent is divisible by 3. Normalize the three row signs so that those rows coincide. The group permuting the three rows acts freely on the permutation terms and leaves their products unchanged. Each orbit therefore contributes a multiple of 3!=6. Row normalization changes only the sign of the permanent. The same argument applies to columns.

Consequently, any nonzero permanent that is a power of two requires every projective row type and every projective column type to occur at most twice. A construction with many identical filler rows cannot attain Kräuter's minimum. This obstruction concerns exact attainment; it does not preclude obtaining the minimum possible 2-adic valuation with an additional odd factor.

There is also an elementary rank consequence. A real r-dimensional subspace contains at most 2^(r-1) projective sign vectors. To see this, include one coordinate functional in a basis of the dual of the subspace, complete it with r-1 coordinate functionals, and normalize that first coordinate to +1. The remaining r-1 selected coordinates determine the vector and have only 2^(r-1) possible sign patterns. Thus a sign matrix of rank r with a nonzero pure-power permanent must satisfy n<=2^r. This necessary condition alone is far from sufficient.

## Nested negative supports cannot furnish a uniform construction

After permuting rows and columns, a Ferrers negative support is specified by weakly increasing row lengths

\[
0\leq b_1\leq\cdots\leq b_n\leq n,
\qquad A_{ij}=1-2\mathbf1_{j\leq b_i}.
\]

Let r_k be the rook numbers of the negative support. Adding a row of length b updates them by

\[
r_k^{\rm new}=r_k^{\rm old}+(b-k+1)r_{k-1}^{\rm old}.
\]

The exact permanent is

\[
\operatorname{per}A=\sum_{k=0}^n(-2)^k(n-k)!r_k.
\]

The accompanying script checks every Ferrers shape at order 6. Shapes with three projectively identical rows cannot have a nonzero pure-power permanent by the preceding argument. Among the remaining 282 shapes, the possible absolute permanent values are

\[
0,32,48,64,80,96,144.
\]

The desired value at order 6 is 16. Therefore even the full Ferrers family fails as a candidate for an all-order attainment theorem. This is a rejection of a construction family, not an additional case of the conjecture.

## Exact paired-row coefficient formulation

Let V be an m by 2m sign matrix and let D(V) be obtained by repeating each row twice. If v_j denotes column j, then

\[
\operatorname{per}D(V)
=2^m[z_1^2\cdots z_m^2]\prod_{j=1}^{2m}
\left(\sum_{i=1}^m v_{ij}z_i\right).
\]

This follows by choosing, for each column, which original row type receives it. Every assignment with two columns in each row type lifts to 2^m assignments to the labeled repeated rows.

The odd-order paired-row reduction in `research.md` therefore reduces a sufficient construction for Kräuter's conjecture at n=2m+1 to sign forms whose indicated coefficient has absolute value

\[
2^{m-\lfloor\log_2(m+1)\rfloor}.
\]

No uniform choice of forms is proved here. In particular, taking V=[B,B] restricts the columns to pairs as well. It does not implement multiplication of per(B) by 2^m. At m=3, every normalized 3 by 3 sign matrix B gives

\[
|\operatorname{per}(B\otimes J_2)|\in\{48,80,720\},
\]

whereas the paired-row target for order 7 is 16. Allowing unequal column multiplicities can reach 16: projective column multiplicities (1,1,2,2) among the four 3-coordinate sign types suffice. That check establishes only that the broader formulation is not defeated by the same small obstruction; it is not an induction.

## What remains missing

The repeated-row and coefficient identities are exact, but they leave the same central existence problem. Divisibility, a large range, a small numerical example, or one favorable coefficient does not imply an all-order pure-power construction. No such implication is used here.
