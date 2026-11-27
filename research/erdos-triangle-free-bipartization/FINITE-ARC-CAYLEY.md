# Finite arc-supported Cayley graphs

The continuous argument in [ARC-CAYLEY](ARC-CAYLEY.md) has a finite quotient analogue with an explicit error. It applies to arbitrary fibres, including generators not forming a union of cosets.

Let G be a finite abelian group, S=−S a sum-free generator set, and π:G→ℤ/qℤ a surjective homomorphism such that the phases of S, represented in [0,1), lie in [1/4,3/4]. Let p=|S|/|G|. If p≥1243/5000, the cut pulled back from ⌊q/2⌋ consecutive residues leaves unordered normalized mass at most

    B(p)+2/q,      B(p)=−5p²/4+7p/12−1/36.

In particular the conjectured bound holds in this family whenever q≥147481, at all densities. In the lower density tail use [Balogh–Clemen–Lidický](https://arxiv.org/html/2103.14179). This is an unbounded structured class, not an order check, and exact phase support is a real additional assumption; see [the obstruction](FIVE-CAYLEY-AND-ARC-OBSTRUCTION.md).

## A layer-cake replacement for doubling

Write a_i for the density of S in coset i. For i/q in [1/4,1/3), set F_i=a_i. For j/q in [1/3,1/2], set H_j=a_j except put H_(q/2)=a_(q/2)/2 if q is even. Put u=q⁻¹∑F, v=q⁻¹∑H, b=u+v=p/2. The half-weight handles the self-negative phase.

For j in the H range, set φ_j to the supremum of F_i among pairs i,i' in the F range with j=q−i−i' and F_(i')>0, or 0 if there is no pair. If F_(i')>0, translation by any generator over i' sends the S-slice over i to a subset of the complement of the S-slice over −j, by sum-freeness. Symmetry thus gives F_i+a_j≤1, and hence H_j+φ_j≤1.

For any 0<t<1, let A_t={i:F_i>t}. All elements of q−(A_t+A_t) are indices in the H range with φ_j>t. For a nonempty set A_t of integers, |A_t+A_t|≥2|A_t|−1: in increasing order, the sums starting with the least element followed by those ending with the greatest element form a strictly increasing chain of length 2|A_t|−1. Integrating the cardinality inequality gives ∑φ≥2∑F−1. The H range has at most q/6+1 indices, so

    2u+v ≤ 1/6+2/q,  hence u≤1/6−b+2/q.

## Moment bound, including the mesh error

For phase i, put x_i=1/3−i/q in the F range; for phase j, put y_j=j/q−1/3 in the H range. The monochromatic probability of a displacement with absolute residue k≤⌊q/2⌋ is exactly 1−2k/q, also for odd q. The normalized unordered monochromatic mass equals b/3−2M, where M=q⁻¹(∑y_jH_j−∑x_iF_i).

On disjoint intervals [y_j,y_j+1/q] fill the constant density H_j. The integral of this function is v and its first moment is at least v²/2, since all coordinates are nonnegative and the density is at most one. Its integrated first moment exceeds the discrete one by v/(2q). Similarly fill constant density F_i on [x_i−1/q,x_i]; all coordinates are at most 1/12, so the integrated first moment is at most u/12−u²/2. It is the discrete moment minus u/(2q). Consequently

    M ≥ D(u)−b/(2q),
    D(u)=b²/2−(b+1/12)u+u².

Let u₀=1/6−b. For u≤u₀, D(u)≥D(u₀), because 0≤u₀≤1/6−1243/10000 and D is decreasing on [0,u₀]. For u>u₀, u−u₀≤2/q and

    D(u)−D(u₀)=(u−u₀)(u+u₀−b−1/12) ≥ −(2/q)(5/12),

since b≤1/4 by Mantel and u≥0. This also covers u₀<0. Thus b/3−2M≤B(p)+(5/3+b)/q<B(p)+2/q. The polynomial B decreases throughout the claimed density range and 1/25−B(1243/5000)=2441/180000000. This proves the advertised sufficient threshold.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
