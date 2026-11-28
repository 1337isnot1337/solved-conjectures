# Preservation under color-preserving forcing

A short supplement to the positive model for Erdős–Galvin–Hajnal Problem 9/C in [#1082](https://github.com/1337isnot1337/solved-conjectures/pull/1082).

**Lemma.** For an integer $`r\ge2`$, $`\sigma`$-$`r`$-linked forcing cannot make a ground $`r`$-uniform hypergraph countably colorable unless it already was. Here $`\sigma`$-$`r`$-linked means a countable union of sets each having a common lower bound for any $`r`$ of its conditions. The statement holds below a condition as well.

In fact, assume $`p`$ forces that a proper $`\omega`$-coloring exists. For each vertex $`x`$ choose $`p_x\le p`$ deciding its color $`c_x`$, and choose a linked cell $`i_x`$ containing $`p_x`$. The ground coloring $`x\mapsto(c_x,i_x)`$ is proper: a monochromatic $`r`$-edge would have a common lower bound for all its deciding conditions, forcing a monochromatic edge. In particular $`\sigma`$-centered forcing preserves all fixed finite-uniform chromatic obstructions.

**Random corollary.** Adding arbitrarily many random reals preserves uncountable chromaticity of every ground $`r`$-uniform hypergraph on $`\omega_1`$. Any coloring name depends on at most $`\omega_1`$ coordinates, by ccc and the countable coordinate supports of the Boolean values on its deciding antichains. The smaller complete measure algebra is $`\sigma`$-$`r`$-linked by [Dow–Steprāns](https://doi.org/10.4153/CMB-1994-007-7), since its coordinate set has size at most $`\omega_1\le 2^{\aleph_0}`$. If a coloring exists in the full extension, the name and its properness are already realized in that factor. Apply the lemma there.

This applies to the four-pattern witness once constructed; all four omissions are absolute statements about finite hyperedges, so they persist automatically. It does not say that arbitrary ccc or proper forcing preserves the witness.

There is also a commuting-product observation from the original ground model. The positive finite-condition forcing $`\mathbb P`$ of #1082 is defined absolutely from $`\omega_1`$. For every original-ground forcing $`\mathbb Q`$ preserving $`\omega_1`$, the two-step forcing $`\mathbb Q*\mathbb P`$ uses the same $`\mathbb P`$, and the proof of uncountable chromaticity applies over the $`\mathbb Q`$-extension. Thus the witness in the product extension $`\mathbb P\times\mathbb Q`$ retains this property. This does not cover posets defined using the new hypergraph itself.
