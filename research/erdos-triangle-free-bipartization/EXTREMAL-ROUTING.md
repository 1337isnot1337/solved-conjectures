# Full routing is possible at a graphon extremizer

The all-demand congestion is unbounded for general maximum cuts, even after imposing saturation and a middle-band density. This note gives a contrasting bound for a **globally maximizing** graphon in [Erdős Problem 23](https://www.erdosproblems.com/23). It is not the sharp congestion needed to prove the conjecture.

Let B be the crossing kernel of any optimal measurable cut of a triangle-free graphon maximizing its ordered monochromatic mass. The known [extremal expansion](EXTREMAL-WALKS.md) provides

```math
 B(S,S^c)\ge c\,\mu(S)(1-\mu(S)),\qquad c=2/25.
```

It follows that d_B≥c almost everywhere. Write z=∫d_B. In fact the argument below works for any symmetric B:[0,1]²→[0,1] satisfying these conditions with 0<c≤1. It routes every demand kernel D with 0≤D≤1, using at most L transitions and congestion at most K on every oriented edge, with

```math
 L=2+\left\lceil \frac{16}{c^2}\log\frac{2z}{c^2}\right\rceil ,
 \qquad K=\frac{z(L+2)}{c^2}.
```

These are absolute constants in the maximizing case. The construction controls the density of path loads, rather than merely asserting that every pair has a short crossing walk.

## Pointwise mixing after an initial and a final move

Use a stationary random walk with transition kernel P(x,dy)=B(x,y)dy/d_B(x) and stationary probability π(dx)=d_B(x)dx/z. Its conductance is at least c/2: the stationary cut flow is B(S,S^c)/z, and the smaller degree volume is at most the smaller vertex mass. With Q=(I+P)/2, the operator on mean-zero L²(π) is positive semidefinite and has norm at most 1−c²/16.

For clarity, the last bound is the usual reversible Cheeger argument and works on this measure space. For any nonnegative f supported on a set of π-mass at most one half, layer cake for f² gives ∫|f(x)²−f(y)²| dJ at least 2Φ||f||², where J is the stationary one-step law and Φ is conductance of P. Cauchy–Schwarz bounds the square of the same integral by 8||f||² times the Dirichlet form of P. Split a mean-zero function at its median into the two nonnegative parts and add their energy bounds; their squared norms sum to at least the original squared norm. Thus P has right gap at least Φ²/2, and laziness gives the norm statement. Compare the general-state-space [Lawler–Sokal theorem](https://www.ams.org/journals/tran/1988-309-02/S0002-9947-1988-0930082-9/S0002-9947-1988-0930082-9.pdf).

The density h_x of P(x,·) relative to π is at most z/c² and integrates to one, so ||h_x−1||²≤z/c². By reversibility the density of P Q^(L−2) P from x to y, relative to π at y, is ⟨h_x,Q^(L−2)h_y⟩. The norm bound makes this at least one half for almost every x,y.

## Reweight paths by their endpoints

Start with the stationary walk using the specified sequence P, then L−2 lazy steps, then P. The density of its endpoint law relative to dx dy is therefore at least c²/(2z²). Multiply the whole path law by D(x,y) divided by that density, for path endpoints x,y. This recovers the desired demand law exactly, and multiplies no moving-edge load by more than 2z²/c². A moving step from a stationary point has oriented edge density B/z, or B/(2z) at a lazy step. Summing the two ordinary steps and the L−2 lazy steps gives total oriented demand load at most K B. Delete holds and erase cycles from each finite trajectory to get no larger loads or lengths. If D is symmetric, the argument can also be read as an unordered fractional routing by taking half the symmetric ordered law.

The result separates the earlier [unbounded-congestion examples](MULTIFLOW-BARRIER.md) from true extremizers. It does not give a congestion close to 4/3, does not force four-step routing, and does not imply the unrestricted deletion bound. The source of the improvement is global extremality, not triangle-freeness of the supply kernel alone.
