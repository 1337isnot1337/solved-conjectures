# A graphon criterion for the rainbow six-cycle conjecture

This is a reduction, not yet a solution. It uses the [global parity-cut stability theorem](PARITY-CUT.md).

Call six symmetric measurable kernels $W_i:[0,1]^2\to[0,1]$ balanced if $\sum_iW_i=1$ almost everywhere and each has degree $1/6$ almost everywhere. Say their rainbow six-cycle density is the sum over distinct cyclic color assignments of the integrals of the products of the six kernels around a six-cycle. A sufficient statement for the asymptotic Erdős–Pyber–Tuza conjecture is:

> If a balanced six-color graphon has zero rainbow six-cycle density, one three-color union is disconnected.

Here disconnected means there is a measurable cut with positive measure on both sides and with the union kernel zero almost everywhere across it. Indeed, a three-color union $W_B$ has degree $1/2$, and dropping all cross edges forces both sides to have measure at least $1/2$. Thus both measures are exactly $1/2$, and the kernel must have value one almost everywhere inside both parts. The other palette $A$ is then supported across the cut. This is the parity obstruction and it actually does give zero rainbow density.

## Passage back to finite colorings

Suppose there are balanced rainbow-free finite colorings with $t\to\infty$. Encode them as six-colored step graphons, marking diagonal cells by any auxiliary color. The colored cut metric is sequentially compact (use the finite-decoration case of [Lovász–Szegedy, *Limits of compact decorated graphs*](https://arxiv.org/abs/1010.5155)); pass to a subsequential limit simultaneously for the six coordinates. Each finite degree is $t/(6t+1)$, so cut convergence tested against each measurable vertex subset gives degree $1/6$ in the limit. The auxiliary color has vanishing mass, giving $\sum_i W_i=1$. Colored counting continuity gives zero rainbow six-cycle density, as only the $O(n^5)$ vertex maps with coincidences could have contributed in a rainbow-free finite coloring.

If the limit has a disconnected three-color union, compare the finite and limit kernels on the three types of rectangles of the parity cut. The sums of the integrals of $W_B^{(n)}$ across and $W_A^{(n)}$ inside are $o(1)$ by cut convergence, as the corresponding limit integrals are zero. The measurable cut need not respect the vertex cells: independently put each vertex on the first side with the probability given by the fraction of its cell in that side. For distinct cells each product of these probabilities is exactly the associated normalized rectangle area; the expected number of misplaced edges is therefore $o(n^2)$. Some discrete cut has at most this many. For all sufficiently large $t$ this contradicts the global parity-cut theorem.

Consequently every unbounded sequence of counterexamples would yield a zero-density balanced six-color graphon in which every three-color union is connected. Finding such a limit model alone would not produce finite counterexamples, because exact regularity and the exclusion of sparse rainbow cycles are additional constraints.

## Deterministic six-type test, not the general criterion

An exact restricted test models six equal-measure types with each unordered type pair assigned one color. Each type has all six colors exactly once in its row, including the diagonal pair. Thus the type matrix is a symmetric Latin square. Fix the first row to be $0,1,\dots,5$ by renaming colors, and enumerate the upper triangle with row uniqueness. The [short C++ checker](check_latin_six_types.cpp) found 456 normalized symmetric Latin squares; 120 have no closed rainbow length-six type walk and the very same 120 admit a parity cut. A closed length-six type walk counts even if it repeats types: distinct actual vertices can be selected in a positive-measure type. This tests the graphon criterion for the specified template family only. Fractional kernels and arbitrarily many types are not covered.
