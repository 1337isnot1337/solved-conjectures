# What remains for the full VC information conjecture

Date: 21 November 2026. This records a bounded attempt to extend the threshold construction to the full separately stated VC conjecture. No full-VC theorem or new completed target is claimed.

## 1. Structural input used by the threshold proof

The shifted-tree argument does not use VC dimension as a sufficient condition by itself. Its finite ordered representation has three stronger properties:

- Two adjacent samples arise from a common cyclic list by deleting two marked copies each.
- Corresponding empirical losses change by a bounded amount after aligning the output, because the cyclic loss walk is 1-Lipschitz.
- If a changed observation is outside an aligned parent interval, its loss contribution is constant there, so it has no effect on the child-minimum difference.

Together these let an active depth-$`j`$ node charge at most order $`2^{-j}`$ of the distinguished observations under its own output law. VC one-inclusion sparsity alone does not supply that ordered representation.

The known one-dimensional tree representation is a possible structural guide: [Rubinstein, Bartlett and Rubinstein's primary report](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2007/EECS-2007-86.html) states that maximum classes of VC dimension one are trees. A projectively compatible Euler tour could replace the folded path in that setting. No such extension is asserted here, and another subclass would not count as a separate solution of the same sponsor problem.

For general dimension, embedding into a uniformly controlled extremal class is not available as a black box. [Chase et al.](https://arxiv.org/abs/2405.17120) prove that some VC-dimension-$`d`$ classes require extremal embedding dimension exponential in $`d`$. This does not refute the information conjecture; it blocks that proposed universal shortcut.

## 2. A concrete remaining route

One candidate replacement is a hierarchy of prediction cells induced by nested random restrictions of the input coordinates. At each node, refine the current class by additional input predictions and use a multiway soft minimum of the child empirical minima. A geometric choice of restriction sizes could give sufficiently small approximation error.

The missing information estimate is a weighted squared-sensitivity bound for the child minima, averaged over the restriction, the output path, and the distinguished changed observation. Merely controlling pairwise Hamming diameter of a cell does not establish it.

For example, on $`m\ge2`$ distinct points, let the class consist of the $`m`$ singletons and label every point zero. The traces have pairwise Hamming distance two and VC dimension one. Their minimum empirical error count is one. Deleting any coordinate makes its singleton have zero errors. Thus every coordinate affects the empirical minimum even though the trace diameter is two. This is an obstruction to charging the sensitivity of a minimum solely to one pairwise disagreement set.

A multiway soft minimum may give a smaller variance than that worst-case sensitivity: in the singleton example, a large unresolved cell competes with many singleton children. But the required uniform variance bound for arbitrary VC classes has not been proved. This is the precise missing obligation in that route.

## 3. A fresh compression result is not the missing information theorem

The 18 November 2026 preprint [Cai et al., *Near-Quadratic Sample Compression for All VC Classes*](https://arxiv.org/html/2611.25011v1), Theorem 1.1, states compression with $`O(d^2\log^2d)`$ examples and $`O(d\log^2d)`$ bits. Its Remark 1.2(c) also states an agnostic compression conversion by retaining the portion on which an empirical minimizer is correct. I checked those exact statements and searched its full primary text for conditional-mutual-information claims; none was found. This note does not independently certify its compression proof.

Compression size alone does not yield the conjectured $`O(d)`$ original CMI. The ordinary encoding count includes the indices of retained observations and leaves a $`\log n`$ dependence. The needed stability or a replacement information argument is an additional obligation. The newly stated compression theorem therefore does not, as written, settle the agnostic threshold target or the full original-CMI conjecture.
