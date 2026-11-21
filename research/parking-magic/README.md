# Hill–Luo–Trinh–Vindas-Meléndez's conjecture

Research checkpoint, 2026-11-21. Issue:
<https://github.com/1337isnot1337/solved-conjectures/issues/172>.
No complete resolution is claimed or counted.

The target is Conjecture 8.1 in *Lattice slices, Ehrhart polynomials,
and magic positivity of generalized parking-function polytopes*,
[arXiv:2607.15503](https://arxiv.org/abs/2607.15503).
The author-uploaded full text was inspected at
<https://www.researchgate.net/publication/410594693_Lattice_slices_Ehrhart_polynomials_and_magic_positivity_of_generalized_parking-function_polytopes>.

## Exact symbolic observation

The source's lattice-slice recursion and dilation formula determine
the Ehrhart polynomial for arbitrary positive integer parameter vectors.
The script `symbolic_coefficients.py` computes the complete parameter
polynomial, not a sample of parameter values, in each requested dimension.
Write the parameters as one plus independent nonnegative variables and
expand the Ehrhart polynomial in the magic basis.

All coefficients of the resulting parameter polynomials are nonnegative
in dimensions three through six. The complete collections contain 34,
126, 462, and 1716 nonzero monomials, respectively. In dimension two
there are negative coefficients, including the known exceptional
constant term. These calculations suggest a stronger multivariate
positivity statement, but provide no induction in dimension.

The earlier combinatorics agent also checked 418 parameter vectors in
dimensions three through six using direct integer lattice counting and
rational interpolation. Its dimension-seven run exhausted memory.
The symbolic calculation avoids that enumeration, but remains a
bounded-dimensional diagnostic. Neither calculation is a new campaign
resolution or a substitute for a proof of the unrestricted conjecture.

## Possible structural route

After translating by the all-ones vector, these polytopes are symmetric
polymatroid independence polytopes. Their support functions express them
as Minkowski sums of uniform-matroid independence polytopes: the cube
has coefficient the first parameter minus one; the rank-r independence
polytope has coefficient the parameter with index n-r+1 for ranks below
n. Every latter coefficient is at least one. A theorem preserving
magic positivity under these increments would settle the conjecture;
no such theorem has been established here.

## Prior-resolution search

Exact title, author, conjecture, and magic-positivity searches in both
search engines found the original paper, the July partial-permutohedron
theorem, the September Snapper-polynomial paper, and an October survey
of Ehrhart operations. None of the retrieved descriptions settles the
full arbitrary-parameter assertion. The later full texts still require
inspection before any eventual novelty claim.

Run the diagnostic with SymPy installed:

```bash
python3 research/parking-magic/symbolic_coefficients.py 6
```
