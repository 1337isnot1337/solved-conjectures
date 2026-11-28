# Agreement blocks of two optimum cuts

This is a structural condition on the optimum-cut law for [Erdős Problem 23](https://www.erdosproblems.com/23). It uses actual optimum cuts, not just local single-vertex flip inequalities. All edge quantities below are unordered masses unless an ordered integral is explicitly written.

## Two optimum cuts generate two independent optimization problems

Take any two optimum sign functions f,g on a weighted graph or graphon and put A={f=g}, D={f=-g}. Write beta_A,beta_D for the separate minimum losses on the induced sides in the original weights. Then

    beta = beta_A + beta_D + e(A,D)/2.                         (1)

Moreover every optimum sign function on A, paired with every optimum sign function on D, gives an optimum cut of the whole graph in either relative orientation.

Indeed f and g restrict to the same cut on each block up to reversal, while the status of every A–D edge is reversed. Since they have equal total loss, each loses exactly half the crossing edge mass. Now optimize the two blocks separately and randomly reverse one of the two signs: the expected crossing loss is again half. This gives (1), since independent optimization cannot make the sum of the two internal costs larger, and the original cut was optimum. Even if the separate optima were first defined as infima, this equality shows the restrictions of f attain them. For any choice of local optimum cuts, the mean of the two relative alignments is the global optimum, while neither can be better; both must therefore attain it.

Equivalently, if V_A and V_D are the real linear spans of all local optimum signs on the respective blocks, the adjacency form between V_A and V_D is identically zero:

    integral_(A times D) W(x,y) a(x) d(y) = 0
                   for every a in V_A and d in V_D.          (2)

The identity persists after taking L² closures. In particular, if both spans are dense, e(A,D)=0.

## A consequence for global maximizing graphons

At a [graphon maximizing B](SATURATED-GRAPHON-EXTREMIZER.md), write r=mass(D). By rescaling each induced block separately, beta_A<=B(1-r)² and beta_D<=B r². From (1),

    e(A,D) >= 4 B r (1-r).                                   (3)

Thus any nontrivial agreement split at a maximizer of positive loss has a definite crossing mass, and the two local optimum spans cannot both be dense. This is substantially stronger than just saying that an individual optimal cut has no profitable flip: it forces an entire rectangle of cross-block pairings to be neutral.

For any law of optimum signs write C(x,y)=E[f(x)f(y)] for the pair correlation. Draw f and g independently from this same law. For any pair x,y the probability of belonging to different agreement blocks is (1-C(x,y)²)/2. Also r=(1-<f,g>)/2, so E[r(1-r)]=(1-integral C²)/4. Averaging (3) yields the all-order necessary moment

    integral W(x,y)(1-C(x,y)²) >= 4B (1-integral C(x,y)²).    (4)

All integrals in (4) are ordered over the full probability space. It can be used with the exact stationary and independent-attachment law because the samples are genuine optimum signs. No implication of (2) or (4) that closes the full conjecture is asserted here.
