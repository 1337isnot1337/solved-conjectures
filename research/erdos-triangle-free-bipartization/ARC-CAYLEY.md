# A half-circle cut for arc-supported Cayley graphons

This is a full-density-band result for a structural family in [Erdős #23](https://www.erdosproblems.com/23), not the full conjecture.

Let G be a second-countable compact abelian group, with Haar probability, and S⊆G a symmetric measurable connection set giving a triangle-free Cayley graphon W(x,y)=1_S(y−x). Suppose a continuous character π:G→ℝ/ℤ is surjective and almost every generator projects to the opposite closed semicircle [1/4,3/4]. There is no assumption that S is a union of fibres. Write p=μ(S). For 1243/5000≤p, the cut pulled back from a semicircle in ℝ/ℤ leaves unordered monochromatic mass at most

    B(p) = −5p²/4 + 7p/12 − 1/36  <  1/25.

In particular this handles the entire hard middle-density band for this family. Below 1243/5000 the [Balogh–Clemen–Lidický sparse-tail theorem](https://arxiv.org/html/2103.14179) gives the non-strict desired bound by graphon sampling and continuity.

## Weighted phase functions

Disintegrate Haar into normalized Haar on the cosets of ker π. Write a(t)∈[0,1] for the conditional density of S in the fibre over t. It is symmetric, so b=∫_(1/4)^(1/2) a(t)dt=p/2. Translate the positive half of the allowed arc by 1/3. Let

    F(x)=a(1/3−x) on 0≤x≤1/12,
    H(y)=a(1/3+y) on 0≤y≤1/6,

and let u=∫F and v=∫H, with u+v=b. Triangle-freeness implies

    H(x+y)+F(x) ≤ 1

for almost every pair x,y∈[0,1/12] with F(y)>0. Indeed the sum of two phases 1/3−x and 1/3−y is the negative of phase 1/3+x+y. In almost every pair of such fibres, almost every generator at the second phase translates almost all of the first generator slice away from the negative of the H-slice, by the zero triangle integral. Translation preserves conditional Haar measure and gives the asserted inequality.

The corresponding doubling inequality H(2x)+F(x)≤1 holds for almost every x; it cannot be obtained merely by substituting into an a.e. two-variable claim. To see it, take a Lebesgue point x of F with 2x a Lebesgue point of H. If the inequality fails, F(x)>0. Two independently uniform points x₁,x₂ in a small interval of length 2h around x have F(x_i) arbitrarily close to F(x) with probability 1−o(1). Their sum lies in an interval of length 4h around 2x, and its density is bounded by 1/(2h), so H(x₁+x₂) is likewise close to H(2x) with probability 1−o(1). These facts give a positive-measure set of pairs contradicting the two-variable inequality. Integration of the doubling inequality now gives

    2u+v ≤ 1/6, hence u≤1/6−b and b≤1/6.

## First moment and the cut

The probability over a uniform vertex that a displacement of positive phase t≤1/2 lies uncut by the semicircle colouring is 1−2t. Accordingly the unordered monochromatic mass is

    ∫_(1/4)^(1/2) a(t)(1−2t)dt = b/3 − 2(∫yH(y)dy − ∫xF(x)dx).

For a function of total mass v with values in [0,1] on [0,1/6], the smallest first moment is v²/2, by filling from the left. For F of mass u on [0,1/12], the largest first moment is u/12−u²/2, by filling from the right. Thus the difference of moments is at least

    b²/2 − (b+1/12)u + u².

This expression decreases for 0≤u≤1/6−b when b≥1243/10000>1/12. Substituting u=1/6−b gives the bound B(p). The polynomial decreases on this density interval and satisfies B(1243/5000)=35987795/900000000 <1/25 (or directly use the larger root p=7/30+√5/150<1243/5000).

No result here says that every triangle-free Cayley graphon admits such a character. In finite groups the doubling argument is not an exact Haar-integration proof because the character image need not be a continuous circle. The next problem on this route is to derive a usable phase-support or approximate-support theorem from extremality rather than assume it.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
