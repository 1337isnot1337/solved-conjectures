# A strict codegree-variance constraint

For any triangle-free graphon W with ordered edge density p>0, write d₂=t(P₃,W) (P₃ is the three-vertex path) and t₄=t(C₄,W). Then

    ν = t₄ − d₂²/(1−p) ≥ 0.

Equality holds only for the balanced complete bipartite graphon at p=1/2. Therefore ν has a uniformly positive minimum on every fixed closed density interval inside (0,1/2), including the unsettled band in [Erdős #23](https://www.erdosproblems.com/23). This gives a strict constraint rather than a numerical value of the gap; by itself it does not solve the problem.

## Equality forces a binary finite quotient and equal degrees

Let K(x,y)=∫W(x,z)W(y,z)dz. Triangle-freeness gives W(x,y)K(x,y)=0 almost everywhere. For μ=d₂/(1−p)>0, expanding the square gives

    ||K−μ(1−W)||₂²
      = t₄ − 2μd₂ + μ²∫(1−W)²
      ≤ t₄ − d₂²/(1−p) = ν.

This proves the inequality. If ν=0, equality holds in ∫(1−W)²≤1−p, forcing W∈{0,1} almost everywhere. Also K=μ(1−W), so W is saturated and its only positive common-neighbor mass is μ. By [the codegree-gap quotient lemma](CODEGREE-GAP.md), W is a finite weighted triangle-free graph template.

On the diagonal product of any positive-mass class, W is zero and K equals that class's vertex degree, because two vertices in the class have identical binary neighborhoods. Hence every class has degree μ, and p=μ. Now d₂=p² and μ=p²/(1−p), so p=1/2. Equality in Mantel's bound then gives the balanced complete bipartite graphon. For example, for almost every edge xy, the neighborhoods are disjoint and each has measure 1/2; they give two independent sets partitioning the space, and edge density 1/2 forces all cross pairs to be adjacent. Conversely that graphon has ν=0.

## Uniform gap in the middle band

The space of triangle-free graphons in cut distance is compact: it is cut-closed by continuity of triangle density. The edge-density interval condition is closed. The functional ν is continuous there by the homomorphism-density expressions and p≤1/2. Since its zeros are outside the interval, its minimum is positive. Thus the basic Cauchy–Schwarz row can be separated strictly from equality on the band even without a finite-order enumeration. A quantitative lower bound large enough to close the main inequality is not supplied here.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
