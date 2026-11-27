# An imperfect half-matching certificate

A sufficient structural condition for [Erdős #23](https://www.erdosproblems.com/23) extends the method used for [Heinig’s conjecture](HEINIG.md) beyond exact circular graphs.

Suppose a triangle-free graph admits a balanced bisection into two halves, each partitioned into three independent classes X_i and Y_i, respectively. Give each vertex a nonnegative weight and normalize total mass to one; the halves must have mass 1/2. Let U be the total edge mass between X_i and Y_j for i≠j, and V the total missing edge mass between X_i and Y_i. Normalize each unordered pair's mass by the product of its vertex weights. Then the conjectured bound holds whenever

    U ≤ 9/8000    and    4U+V ≤ 203/20000.

In particular, when there are no unmatched cross edges the certificate allows missing matching edges of mass up to 0.01015. The theorem does not supply such a partition for every triangle-free graph.

## Sharp overlap with error

Put x_i=2 mass(X_i), y_i=2 mass(Y_i). If all pair sums x_i x_j+y_i y_j are at least 4/25−4U, then R=∑x_i y_i≥1/5−12U. To check this, let k₀=8/25, δ=8U, and k=k₀−δ, so δ≤0.009. The [sharp six-mass derivation](SHARP-SIX-MASS.md) is algebraic with k now variable. If all the d_i vanish the overlap is at least 1/3. Otherwise, with z,M defined as there, obtain 4R≥K if the coefficient of D² is nonnegative, and 4R≥L otherwise, where

    K = 3z²−5z+2+3k,
    L = 2(3kz−2k+2z³−4z²+2z)/(z−k).

For the first case K≥4/5+23/300−3δ>4/5. For the second, the pair inequalities give z−z²/2≥k≥0.311, so z>77/200. In particular z−k≥13/200. The exact identity is

    (z−k)(L−4/5) = 4(5z−4)²(5z−2)/125 − δ(6z−16/5).

When z≥2/5, the first term is nonnegative and 6z−16/5≤6(z−k), showing L≥4/5−6δ. When 77/200<z<2/5, write η=2/5−z. Then (2/5−(2/5)²/2)−(z−z²/2)≥3η/5, so η≤5δ/3. The first term on the right is at least −(7/10)η because (4/25)(5z−4)²≤7/10. The second is at least (4/5)δ. Their sum is at least −11δ/30≥−6δ(z−k), using z−k≥13/200. Again L≥4/5−6δ. Thus R≥1/5−3δ/2=1/5−12U.

## Edge count

Use the three cuts from the Heinig proof: in cut h, X_h is positive and the other X_i negative, with Y_i opposite to X_i. All present matching edges cross. Every unmatched cross edge is missed in exactly two of the cuts, because for i≠j the signs of X_i and X_j disagree in precisely two cuts. Every internal edge is missed once. In each cut its internal missed mass is bounded by a distinct pair sum (x_i x_j+y_i y_j)/4.

If no cut reaches the desired bound, all pair sums exceed 4/25−4U. Summing the three costs also shows internal edge mass exceeds 3/25−2U. The present matching mass is R/4−V≥1/20−3U−V. Adding the unmatched mass gives total edge mass greater than

    17/100−4U−V ≥ 3197/20000.

Apply the [known dense-tail bound](https://arxiv.org/html/2103.14179) to obtain a contradiction. The use with weights follows by uniform blow-up for finite rational weights, then continuity; the strict margin just derived avoids an endpoint approximation problem.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
