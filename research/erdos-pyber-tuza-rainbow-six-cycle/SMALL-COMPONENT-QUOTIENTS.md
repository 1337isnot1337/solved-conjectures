# Small component quotients of compact homogeneous actions

A structured result for the rainbow cycle part of [Erdős #811](https://www.erdosproblems.com/811), coordinated in [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870). It classifies the zero-density case for compact transitive color-preserving actions with two components, and excludes it for three components. The unrestricted conjecture remains open.

**Theorem.** Let $m\ge3$, and let a compact metrizable group $G$ act transitively and preserve each color kernel of a balanced $m$-color graphon. Let $H=G^\circ$ be its identity component.

* If $[G:H]=2$, the rainbow $m$-cycle density is zero exactly when $m\equiv2\pmod4$ and the coloring is an exact parity cut induced by the quotient to $G/H$: $m/2$ colors are restricted to cross edges and the others to within-part edges.
* If $[G:H]=3$, the rainbow $m$-cycle density is positive.
* If $G/H$ is finite and each color has positive mass on every component of its pulled-back Cayley kernel, the rainbow $m$-cycle density is positive.

No commutativity is required. Fractional colors are allowed.

## Connected product lemma

Pull back the graphon to $G$ with Haar measure as in [the connected-action proof](CONNECTED-COMPACT-ACTIONS.md). The kernels have the form $f_i(x^{-1}y)$ for symmetric functions $f_i(g)=f_i(g^{-1})$, with $0\le f_i\le1$, sum one, and integral $1/m$. The ordered cycle density is $`(f_1*\cdots*f_m)(e)`$.

For a coset $q$ of $H$ define $w_{i,q}$ to be the mean of $f_i$ on it with normalized coset Haar measure. Each column sums to one, and each row sums to $[G:H]/m$. Suppose one can choose $q_1,\dots,q_m$ of product identity in $G/H$, such that all $w_{i,q_i}>0$ and $\sum_i w_{i,q_i}>1$. Then the cycle density is positive.

Indeed, keep only the chosen component of each color. Multiplying the representatives to the right expresses the resulting product through $H$, by translating each input and conjugating it by a fixed group element. The transformations preserve Haar measure and the measure of positive support of each restricted function, which is at least $w_{i,q_i}$. For nonnegative functions on connected $H$ with positive support measures $\alpha_1,\dots,\alpha_m$, the convolution is positive everywhere when $\sum_i\alpha_i>1$. For the first $m-1$ functions, the positive support of their convolution has measure at least $\min(1,\sum_{i<m}\alpha_i)$ by iterating the popular-product form of Kemperman's inequality in [the connected-action proof](CONNECTED-COMPACT-ACTIONS.md). Its intersection with the appropriately translated inverse of the last support is positive at every specified target. The factors $[G:H]^{-1}$ from restriction do not affect positivity.

## Two components

For each hue let $d_i=|w_{i,0}-w_{i,1}|$, where the quotient is written additively. Taking a maximum component in each color gives score $1+\frac12\sum_i d_i$ because the row totals are $2/m$. If the chosen components already sum to zero, the criterion applies unless all $d_i=0$. In that uniform case the restrictions to $H$ form a connected balanced coloring, so the connected-action theorem applies directly using the all-identity-component choice.

Otherwise the chosen components sum to one. If any hue is nonpure, flip an index of minimum $d_i$. Its alternate component has positive weight, since pure colors have $d_i=2/m$ and nonpure colors have strictly smaller $d_i$. The new score is $1+\frac12\sum_i d_i-\min_i d_i$. If some $d_i>0$, then this is strictly greater than one: a zero minimum incurs no loss, and otherwise $m\ge3$ gives $\frac12\sum_i d_i\ge \frac{m}{2}\min_i d_i>\min_i d_i$. If all $d_i=0$, use the uniform case again.

It remains that every color is pure. Column balance forces $m/2$ hues in each component, so $m$ is even. If $m/2$ is even, their chosen components sum to zero, and their score is two. If $m/2$ is odd, no cyclic product can use every hue once. This is the asserted parity model. To descend its cut to the homogeneous space, vertices are right cosets of a stabilizer $K$. The functions $f_i$ are invariant under left and right $K$ translations. If some element of $K$ were outside $H$, the pure nonzero functions would not be invariant under that element. Thus $K\subseteq H$ and the quotient label is well-defined on vertices. Its two parts have equal measure.

## Three components

The quotient is cyclic of order three. Inversion symmetry gives $w_{i,1}=w_{i,-1}=b_i$, and put $a_i=w_{i,0}$ and $d_i=a_i-b_i$. Since $a_i+2b_i=3/m$, a maximum-component choice in every hue has score
```math
1+\frac{2}{3}\sum_{d_i\ge0}d_i+\frac{1}{3}\sum_{d_i<0}|d_i|.
```
It is strictly bigger than one unless all $d_i=0$, in which case use the connected coloring on $H$.

Let $k$ be the number of nonzero components chosen. If $k=0$, their sum is zero. If $k\ge2$, select signs on these components to sum to zero: use opposing pairs for even $k$, or one triple of equal signs plus opposing pairs for odd $k$. The only issue is $k=1$. If any maximizing zero component is tied with a nonzero component, choose that nonzero component too and take $k=2$. Otherwise all other $m-1$ colors strictly prefer zero. At least one of them has $b_j>0$, since $m-1$ pure-zero hues would contribute $(m-1)3/m>1$ in the zero column. Pick one of smallest $d_j$ among the $m-1$ hues; it is nonpure because a pure-zero hue has the largest possible difference $3/m$. Switching it to a nonzero component loses $d_j$. The positive-difference term in the displayed score is at least $2(m-1)d_j/3>d_j$. Thus the new score still exceeds one and two opposite nonzero signs give sum zero.

## All components have positive mass

Choose $q_1,\dots,q_m$ uniformly from the tuples with product identity in the finite quotient. Their coordinates are uniform and pairwise independent, because $m\ge3$ and after fixing two coordinates the product equation has exactly one solution for any one remaining coordinate once the others are fixed. The score $\sum_i w_{i,q_i}$ has mean one and variance equal to the sum of the individual variances. If it is nonconstant, a score exceeds one, and all the selected components have positive weight by assumption. If it is constant, every row of weights is constant; once again the restrictions to $H$ give a connected balanced coloring.

The measure growth and the connected equality case are the earlier ingredients. The component-score selection is the new step. The [Erdős–Tuza chapter](https://doi.org/10.1016/S0167-5060(08)70377-7), [Axenovich–Clemen](https://doi.org/10.1002/jgt.23063), and [Jing–Tran's connected product theorem](https://arxiv.org/abs/2006.01824) do not give these finite-component conclusions. This theorem does not cover all partially supported quotients of order at least four.
