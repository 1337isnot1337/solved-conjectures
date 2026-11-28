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


## Excluding a half-mass independent overlap with bipartite complement

Suppose a triangle-free weighted graph has maximum weighted degree at most 1/2. If two optimum cuts have an independent agreement or disagreement block X of mass exactly 1/2 and its complement Y is bipartite, then beta<=1/25. Unlike the [connected half-mass result](HALF-INDEPENDENT-CORE.md), the complement here may be disconnected. The new hypothesis is that X is an entire overlap block of two actual optimum cuts.

Let U,V be the shores of any proper cut of Y, let t=e(Y), and let W_0=mass(U)mass(V)-t be its missing cross mass. By (2), the two attachment degrees of each x in X are equal, say p(x), because the optimum sign span of the independent block X contains all its sign functions. This also follows by varying the X signs in the rectangular family from (1). The global cost is beta=e(X,Y)/2. In the proper cut of Y, flip any subset T of U, then reoptimize the X signs. The added loss in Y is e(T,V), whereas the loss at each x in X drops by its degree into T, since its two original attachment degrees tied. Optimality forces e(T,V)>=e(T,X). Doing the same on V gives, pointwise on Y,

    J(y)=d_Y(y) >= L(y)=d_X(y).

Since J+L<=1/2, we have L<=1/4. Also t>=beta from the cut separating X and Y.

Choose a root x uniformly with respect to normalized X mass, force its neighbors in Y to one sign and the rest of Y to the other, and let P be the degree of an independent X draw into the first sign and D its total degree. Use the randomized sign with mean (D-2P)/D on X; this is the [rooted second-moment cut](EQUITABLE-THREE.md). With a=mass(X)=1/2 its expected loss is at most

    t - (1/a) integral_Y L J + (2/a) integral_Y L²
                 - 2a E[P²/D]
      <= t + beta - E[P²/D].

For the second step use J>=L and integral L²<=e(X,Y)/4. By the weighted mixed-moment calculation from the [half-mass proof](HALF-INDEPENDENT-CORE.md), and D=2p,

    E[P²/D] >= 2(E[p²])³ / (W_0 E[p³]).

Here the expectations of p use normalized X mass. The proof takes the two common-neighbor terms of P, uses their product and Cauchy–Schwarz on the missing U–V pairs.

Suppose beta>.04. Then t>.04, W_0<=1/16-t<.0225, every p is at most sqrt(W_0)<.15 by its missing attachment rectangle, and mu=E p=2 beta>.08. Put v=Var(p) and q=v/mu². Cubic expansion gives E[p³]<=mu³+(2mu+.15)v, because the centered third moment is at most (.15-mu)v. Therefore

    (E[p²])³/E[p³] >= mu³ (1+q)³/(1+(31/8)q) >= (19/20) mu³.

For the last inequality the difference after clearing the denominator is 1/20-(109/160)q+3q²+q³, positive for q>=0 by the negative discriminant of its quadratic part. The lower bound on E[P²/D] is consequently greater than .0009728/W_0. But t W_0<=t(.0625-t)<=.0009, since t>=.04 and this quadratic is decreasing there. Hence E[P²/D]>t, contradicting the earlier cut bound.

This does not exclude all half-mass independent sets with disconnected complements; it uses the additional optimum-overlap hypothesis to obtain exact attachment ties.
