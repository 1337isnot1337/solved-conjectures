# The sharp six-mass bound behind the three cuts

The [Heinig proof](HEINIG.md) only needs an overlap of 4/25. In fact its six-mass premise forces at least 1/5, and this stronger value is attained. Thus in the circle completion the three candidate cuts cannot all miss more than n²/25 unless the total edge count is **above 17n²/100**, rather than just above 4n²/25.

**Lemma.** Let x and y be probability vectors on three symbols. If x_i x_j+y_i y_j≥4/25 for all i≠j, then ∑x_i y_i≥1/5.

## Reduction to a single variable

Put k=8/25, s_i=x_i+y_i and d_i=x_i−y_i. The premise says s_i s_j+d_i d_j≥k. Permute coordinates and exchange x with y if needed to write d=(a,b,−a−b) with a,b≥0. If all d_i=0, then ∑x_i y_i=∑x_i²≥1/3. Otherwise set z=s₃, D=s₁−s₂, u=a(a+b), v=b(a+b), and

    A=z s₁−k,   B=z s₂−k,   M=A+B=z(2−z)−2k.

The two opposite-sign pair inequalities show 0≤u≤A, 0≤v≤B, so M>0. The functions uv/(u+v) and 2(u²+uv+v²)/(u+v) are coordinatewise nondecreasing on the nonnegative quadrant, continuously extended at the origin. For the second this follows also from writing the expression as 2u+2v−2uv/(u+v), whose two partial derivatives are nonnegative.

Apply the second function to get

    ∑ d_i² ≤ 2(A²+AB+B²)/M = 3M/2 + z²D²/(2M).

Apply the first function to the remaining pair inequality:

    k ≤ s₁s₂+ab ≤ [(2−z)²−D²]/4 + [M²−z²D²]/(4M).

Solving for D² gives

    D² ≤ M[(2−z)²+M−4k]/(M+z²).

Finally, adding the two premise inequalities that involve coordinate 3 in the original variables yields

    8/25 ≤ x₃(1−x₃)+y₃(1−y₃) ≤ z−z²/2.

In particular z≥2/5.

## End of the proof

Writing R=∑x_i y_i, the bound on ∑d_i² gives

    4R = ∑s_i²−∑d_i² ≥ K + (1−z²/M)D²/2,
    K = 3z²−5z+2+3k.

If the coefficient of D² is nonnegative, discard that term. For k=8/25, K−4/5=3(z−5/6)²+23/300>0. If it is negative, substitute the upper bound for D². Simplifying gives

    4R−4/5 ≥ 4(5z−4)²(5z−2) / [5(25z−8)] ≥ 0,

since z≥2/5. This proves the lemma. The equality example is

    x = (1/5, (2+√2)/5, (2−√2)/5),
    y = (1/5, (2−√2)/5, (2+√2)/5).

Each of the three pair sums is 4/25 and the overlap is 1/5.

## Consequences

In the completed half-matching used for Heinig, the total early–late edge mass is therefore at least n²/20 if none of the three cuts succeeds. Within the two halves the three disjoint missed-edge sets sum to more than 3n²/25; the total exceeds 17n²/100. This strengthened estimate is supplementary, not needed by the short proof in [HEINIG.md](HEINIG.md). It also holds for any triangle-free support admitting a balanced bisection into three independent cells per half with a complete cross matching and no other cross edges. No circular coordinate condition is required once that partition exists.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097) · [Heinig review #1100](https://github.com/1337isnot1337/solved-conjectures/pull/1100)
