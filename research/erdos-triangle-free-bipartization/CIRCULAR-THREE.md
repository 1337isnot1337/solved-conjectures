# The sharp Erdős bound for circular chromatic number below three

**Theorem.** Every finite graph of circular chromatic number strictly less than 3 satisfies the sharp (N^2/25) bipartization bound of [Erdős Problem 23](https://www.erdosproblems.com/23), for arbitrary nonnegative product vertex weights of total mass (N). This covers every circular complete template of ratio below 3 and all its homomorphic preimages, including every Andrásfai template. There is an explicit strict gap throughout the unresolved edge-density band.

## Circular order gives a one-way interface

Normalize total vertex mass to 1. A circular colouring of circumference (r<3) assigns points so that both arcs between adjacent vertices have length at least 1. Rescale the circumference to 3: both arc lengths of every edge are now strictly greater than 1. See [the generic circular triangle-free graph paper](https://arxiv.org/abs/2404.12082) for the finite edge representation and terminology.

Represent each point by an angle (i+t) modulo 3, with integer (iin{0,1,2}) and fractional part (0le t<1). The integer parts give a proper 3-colouring. Orient every edge cyclically (i	o i+1), with indices modulo 3. The forward arc for an oriented edge (x	o y) is (1+t_y-t_x). Since it is strictly greater than 1, every edge goes forward in increasing fractional-part order.

Take the weighted median in this order. If necessary split one vertex into false twins of the chosen masses to get shores of mass exactly 1/2. This preserves the optimum product cut by the identical-neighborhood argument. No edge goes backwards from the second block to the first, so rotating the 3-colouring on the second block gives the zero-error balanced case of [the one-way separator](ONE-WAY-SEPARATORS.md).

## An explicit gap

Write (e) for the unordered total edge mass and (E) for internal edge mass in the two median blocks. Three matched-label cuts give (etale E/3). Separately optimize cuts inside each median block and fairly choose their relative signs. On a block of mass (1/2) with edge mass (z), the classical neighborhood cut bounds its cost by (z-16z^2le 1/16-z). This gives the second estimate (etale1/8+e/2-3E/2). Combining them, or taking a convex combination that cancels (E), gives

    beta <= 1/44 + e/11.

In particular the estimate is at most (1/25) for (ele19/100), and throughout the middle band it is at most (8197/220000 = 1/25-603/220000). At higher densities apply the [Balogh–Clemen–Lidický dense-tail theorem](https://arxiv.org/abs/2103.14179), valid for product weights by rational blow-up and continuity. The balanced pentagon blow-up has circular chromatic number (5/2) and achieves the sharp all-density bound.

As a consequence, in the middle band it suffices that deleting mass at most (603/220000) yields a graph of circular chromatic number below 3. The actual median interface gives a better robustness test when a proper three-colouring of the original graph is already available: unmatched cross mass (U) raises the bound (1/44+e/11) by at most (6U/11), so (Ule201/40000) suffices.

The strict inequality (r<3) is essential to the ordering argument: equality can give directed cycles with every edge between equal fractional parts. Thus this proves neither the whole three-colourable case nor the full Erdős conjecture.
