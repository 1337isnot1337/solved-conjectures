# The sharp Erdős bound for circular chromatic number below three

**Theorem.** Every finite graph of circular chromatic number strictly less than 3 satisfies the sharp \(N^2/25\) bipartization bound of [Erdős Problem 23](https://www.erdosproblems.com/23), for arbitrary nonnegative product vertex weights of total mass \(N\). This includes every circular complete template of ratio below 3 and all its homomorphic preimages, including the Andrásfai family.

## Circular order gives a one-way interface

Normalize total vertex mass to 1. A circular colouring of circumference \(r<3\) assigns points so that both arcs between adjacent vertices have length at least 1. Rescale the circumference to 3: both arc lengths of every edge are now strictly above 1. See [Bodirsky et al.](https://arxiv.org/abs/2404.12082) for the circular triangle-free representation.

Represent each point by \(i+t\) modulo 3, with integer \(i\in\{0,1,2\}\) and \(0\le t<1\). The integer parts give a proper three-colouring. Orient edges cyclically \(i\to i+1\) modulo 3. The forward arc of \(x\to y\) is \(1+t_y-t_x>1\), so every edge follows increasing fractional-part order. Conversely, an acyclic cyclic orientation of a finite proper three-colouring gives such a circular colouring: within each class use small offsets increasing strictly in a topological order, then rescale the circle slightly down.

Take the weighted median of the order. A vertex at the threshold can be split into false twins of the chosen masses without changing the optimum, since the twins have no edge between them and may both move to their cheaper side. Both shores can thus have mass exactly \(1/2\). Rotate the three labels down by one in the second block. All cross edges have equal labels, and all internal edges still have different labels. This gives the balanced zero-error case of [the one-way separator](ONE-WAY-SEPARATORS.md).

## An explicit gap

Write \(e\) for total unordered edge mass and \(E\) for internal edge mass in the two blocks. Three matched-label cuts give \(\beta\le E/3\). Alternatively optimize the blocks separately and fairly align their signs. On a block of mass \(1/2\) and edge mass \(z\), the classical neighborhood cut bounds its cost by \(z-16z^2\le1/16-z\), giving \(\beta\le1/8+e/2-3E/2\). Cancelling \(E\) gives

    beta <= 1/44 + e/11.

This is at most \(1/25\) for \(e\le19/100\), and throughout the middle band it is at most \(8197/220000=1/25-603/220000\). At higher densities use [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179), whose bounds transfer by rational blow-up and continuity. The balanced pentagon blow-up has circular chromatic number \(5/2\) and achieves the sharp all-density coefficient.

In the middle band it suffices that deleting edge mass at most \(603/220000\) yields a graph of circular chromatic number below 3. With a proper three-colouring of the original graph available, unmatched cross mass \(U\) at the balanced interface raises \(1/44+e/11\) by at most \(6U/11\), so \(U\le201/40000\) suffices.

Circumference exactly 3 can give cyclically directed edges with equal fractional parts. This theorem does not cover all proper three-colourings or settle the full conjecture.
