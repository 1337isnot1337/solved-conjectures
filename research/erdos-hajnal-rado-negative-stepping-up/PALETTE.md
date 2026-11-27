# Heterogeneous palettes in negative stepping-up

[Issue #1091](https://github.com/1337isnot1337/solved-conjectures/issues/1091) tracks the nondegenerate [Erdős #1167](https://www.erdosproblems.com/1167). Assume at least two colours and every target κ_i>r; the addition in κ_i+1 is cardinal. The elementary one-colour or small-target loopholes of the broader catalogue wording are not part of the claim.

**Theorem.** The implication 2^λ→(κ_i+1)^({r+1})_(i∈I) ⇒ λ→(κ_i)^r_(i∈I) holds in either of the following settings:

1. r≥3 and I is infinite, with unrestricted heterogeneous targets.
2. r=2 and for each target value τ that occurs, the upper tail {i∈I:κ_i≥τ} is infinite.

These are sufficient conditions, not necessary conditions, and do not settle the general problem.

## Two palette facts

In an infinite well-ordered family of cardinals, some sequence of distinct indices has nondecreasing targets: take any countably infinite sequence of distinct indices and apply infinite Ramsey to comparisons of its targets. An infinite strictly decreasing sequence of cardinals is impossible. Shifting this nondecreasing sequence forward by finitely many positions gives an injection of I into itself which does not decrease any target and leaves any prescribed finite number of free colours.

Under condition 2, we can instead inject I×{+,−} into I without decreasing either copy of a target. For each distinct target τ, let w(τ)=|{i:κ_i≥τ}|, an infinite cardinal. As τ increases, w is nonincreasing and assumes only finitely many distinct values (infinitely many distinct values would give an infinite descending sequence). Within each consecutive plateau of value ν, every suffix of that plateau has size ν: the higher plateaus, if any, start with an upper tail of strictly smaller size, and removing it from a size-ν tail does not change its size. The plateau itself has size ν. Enumerate its requests (i,+),(i,−) in order type ν, and for each greedily choose an unused slot within the plateau of target at least κ_i. There are always ν eligible slots and fewer than ν previous choices. Combine the injections across disjoint plateaus.

## The construction

Assume that c:[λ]^r→I avoids every homogeneous target. Order 2^λ by ordinary lex, and write Δ(x,y) for the least differing coordinate. For x<y<z we have Δ(x,y)≠Δ(y,z) and Δ(x,z)=min(Δ(x,y),Δ(y,z)). This follows by reading the two binary values at the first place one of the consecutive pairs differs. Thus on any finite increasing sequence, the difference of the endpoints of a consecutive interval is the minimum of the consecutive differences across it.

For r≥3, use the first palette fact to reserve a separate extra colour for each nonconstant word of length r−1 over {+,−}. On an increasing (r+1)-tuple x₀,…,xᵣ put δ_j=Δ(x_j,x_{j+1}). If δ is strictly monotone, use the image of c({δ₀,…,δ_(r−1)}). Otherwise colour by its sign word in the reserved palette. No reserved colour is homogeneous on r+2 vertices: the first and last (r+1)-windows have sign words dropped from opposite ends of the same word, and equality forces that whole word to be constant. In particular each reserved colour avoids its assigned target κ_i+1≥r+2.

For r=2 use the second palette fact to assign to x<y<z the colour indexed by (c({Δ(x,y),Δ(y,z)}), sign(Δ(x,y),Δ(y,z))). A homogeneous set now has one sign throughout by construction.

Consider a set H in an ordinary image colour, as large as its assigned target. For r≥3, every (r+1)-tuple in H has monotone differences. This implies the same for all quadruples: add points to a quadruple to make an (r+1)-tuple when needed, and obtain the three original differences as minima from disjoint ordered intervals of the monotone list. Hence the sign is constant across all triples in H. To see the last assertion, on any finite ordered list of at least four points successive triple signs agree by the quadruple statement. Its complete difference list is monotone, so all triples from it have that sign by interval minima. Apply this to the union of any two triples.

With increasing sign H is well-ordered: an infinite decreasing lex sequence would have strictly decreasing adjacent Δ values. For decreasing sign reverse the order; the interval-minimum identity is unchanged by reversal. In the increasing order define d(x)=Δ(x,y) for any y>x in H. This is independent of y since for x<y<z the first difference is the smaller one. It increases strictly in x; if there is a greatest element omit it. For any r distinct points in this domain, choose one point later than all of them in H. The consecutive differences of this (r+1)-tuple are exactly their d-values. For decreasing sign reverse the order and use the same increasing-sign argument (the minimum rule is unchanged by reversal). Thus the difference set has cardinal |H|−1 for finite H and |H| for infinite H. All its r-sets receive the same original c-colour, as the assigned ordinary image determines the original colour. Target domination ensures this contradicts c. ∎

## Scope and provenance

The binary-difference construction is the classical negative stepping-up method. The point here is preserving a heterogeneous list of targets while borrowing finitely many extra colours, or doubling all slots for the binary source arity. Compare [Erdős–Hajnal–Máté–Rado, §24](https://real-eod.mtak.hu/15973/) and [Komjáth’s 2025 update, Problem 2](https://doi.org/10.1017/bsl.2025.1). Several ranges overlap their published cases; the intended remaining application of clause 1 is at source arity three with exactly one singular infinite target and the other targets finite, with infinitely many colours. Clause 2 avoids the finite-top-tail difficulty but does not address the singular single-top case.
