# Erdős–Hajnal local triangle conjecture

**A spindle family using only nine pencils.** Eighteen-wise independence of pencil cuts suffices for a spindle throughout the square-root-beating density range of independent vertex and edge retention, assuming a uniform lower bound on each one-edge cut requirement and each prescribed two-edge star requirement within a pencil. In fact if q²ps² is bounded below by a positive constant, these particular spindles occur with high probability. If q²ps²/√q tends to infinity, there are Ω(q⁷p²s) edge-disjoint spindles with high probability, including at the published Mattheus–Verstraëte rate. This does not claim the full eleven-pencil sharp threshold under eighteen-wise independence.

## Construct many patterns with two repeated pencils

Label the common apex u, the opposite tips v,w, and the two core pairs A,B and C,D. Choose u,v,w pairwise geometrically incident at three **distinct** unital points. There are Θ(q⁹) ordered choices: choose an incident pair u,v in Θ(q⁷) ways, then join independently one of the q unital points on u other than u∩v to one of the q such points on v. The resulting w is a common incident secant outside their shared pencil.

For a diamond with geometrically incident tips u,v meeting at X, require A to pass through X and B not to pass through X. In an affine chart with X at infinity, write u:y=0 and v:y=1. A varies over y=a. Apart from O(q) exceptions among Θ(q²) choices for A, the two affine subfield directions on u and v become independent after multiplying them by 1−a and a, respectively. Indeed the only possible failures occur when a/(1−a) lies in a fixed multiplicative F_q coset, plus the finite exceptions for u,v or the tangent. Call the other A admissible. The unital points in each of these parallel affine lines are an affine subfield line plus X, by the [Baer subline lemma](SPINDLE-COUNTING-SCALE.md).

For an admissible A, joining a unital affine point P on u to a unital affine point Q on v meets A at the affine coordinate (1−a)P_x+aQ_x. Independence of the two subfield directions makes this map a bijection from the q² pairs to the points of the full affine line A. Exactly q pairs give a unital intersection R on A. Every such pair gives a secant B and the desired diamond. It has four pencil points: X is used twice (uA and vA), while P,Q,R are used once each (uB,vB,AB).

There are therefore Θ(q³) choices of the core pair. One may forbid a fixed finite set of core lines and of pencil points other than X at cost O(q²). To check this, prescribing P or Q lets one choose the other in O(q) ways and then choose R on their secant in O(q), after which A=XR is fixed. Prescribing R fixes A and leaves only O(q) choices of B by admissibility. Fixing A leaves O(q); fixing B lets one choose R in O(q) ways.

Use one such diamond with tips u,v and another with tips u,w, taking C through their shared unital point. Forbid all coincidences with earlier pencil points and lines except those two prescribed repetitions; forbid the other tip as a core. The finite exclusions preserve Θ(q³) choices on each side. Joining the tips v,w gives Θ(q¹⁵) ordered patterns, each using nine distinct pencils. At each repeated pencil, the two edge constraints form a star: the prescribed core must be separated from both tips. The local hypothesis and independence on nine pencils give a positive constant lower bound for every pattern to survive its splits.

## Overlap table

The geometric choices of any unspecified secant adjacent to zero, one, or two or more prescribed secants give bounds q⁴, O(q³), and O(q²), respectively. Here count the extra geometric incidences uv and uw as known constraints, not as required split edges. Additional valid completion moves are:
- Both tips prescribed: choose both cores in O(q³), or a single unassigned core in O(q). If the concurrent core is fixed, admissibility gives the latter bound. If the other core is fixed, choose the meeting point on it and join it to the tips' common point.
- A full core pair prescribed: if neither tip is known, choose their shared point on the concurrent core, then choose their two intersections with the other core. This costs O(q³).
- If two of the concurrent triple u,v,A (or u,w,C) are known, the third is among O(q²) secants through their shared point. If its nonconcurrent core B (or D) is also known, the third is determined by choosing its intersection on that core, giving O(q) choices.

Applying the same subset-minimum recurrence as in the [previous completion proof](SPINDLE-EDGE-PACKING.md), these moves give the verified uniform completion exponent table
```math
(c_1,c_2,c_3,c_4,c_5,c_6,c_7)=(11,8,6,5,3,1,0).
```
The [checker](check_nine_pencil_bounds.py) enumerates the 128 label subsets, not any finite fields. At most 2r−3 required edges can be shared when r≥2 vertices are shared, regardless of the extra geometric incidences.

## Presence and edge packing

The surviving pattern count has expectation Θ(q¹⁵p⁷s¹¹). Disjoint vertex sets with disjoint pencil sets give independent indicators by eighteen-wise independence. Disjoint vertices but a common pencil contribute O(q⁻³) to the relative variance: by transitivity on unital points, a fixed pencil lies on O(q¹²) patterns. Pairs with r common vertices and k common required edges contribute at most a constant times q^(c_r−15)p^(−r)s^(−k). Put ρ=q²ps². For r≥2 this is at most
```math
q^{c_r-15+2r}\rho^{-r}.
```
Every q-exponent here is strictly negative, and the r=1 bound is O(q⁻⁴/p). Thus for ρ bounded below by a positive constant, the relative variance tends to zero.

For edge packing, the r=2 completion bound shows any prescribed edge belongs to O(q⁸) potential patterns. Ignoring splits, its mean number of pattern extensions conditioned on its two endpoints and itself being retained is O(q⁸p⁵s¹⁰). The baseline squared-mean sum over retained edges is thus O(q²³p¹²s²¹). Pairs sharing just the root endpoints give zero conditional covariance. For r≥3 the contribution to the sum of the centered second moments, relative to that baseline scale, is at most
```math
q^{c_r+2r-12}\rho^{-(r-2)}.
```
The five exponents are 0,1,1,1,2. All five terms vanish if ρ/√q→∞. Apply Markov and the [same retention-only packing argument](SPINDLE-EDGE-PACKING.md). Since the pattern count is Ω(q¹⁵p⁷s¹¹) with high probability and the intersection-pair upper bound is O(q²³p¹²s²¹), this gives Ω(q⁷p²s) edge-disjoint copies. The former count divided by q⁷p²s tends to infinity in this regime, as seen from q⁸p⁵s¹⁰=ρ⁵/q². This is a positive fraction of the retained edges.

Uniformly fair labeled cuts and uniformly balanced cuts both meet the local one-edge and two-edge star hypotheses. The result concerns less-than-full independence in a random model and does not solve Erdős #813.
