# A rank condition on the optimal cuts of a weighted template

Fix a finite graph H. For a nonnegative weight vector w of sum one, let F(w) be its minimum unordered monochromatic weight, with an edge uv costing w_u w_v. Choose a global maximizing w with smallest possible support S, and subject to that with the largest possible number k of distinct optimal cuts on S, identifying complementary cuts. Then for every independent set I⊆S:

- The gradients of the optimal cut costs, restricted to directions of sum zero supported on I, span the full dual of that (|I|−1)-dimensional space.
- Consequently k≥|I|. In particular there are at least α(H[S]) distinct optimal cuts, and no two independent support vertices have identical internal weighted degrees in every optimum.

This is an exact necessary condition for any fixed template. If H is a triangle-free counterexample to [Erdős #23](https://www.erdosproblems.com/23), the same H admits such a weighted counterexample. No bound on the order or on the number of competing cuts is claimed.

## Why an independent set permits exact, not just first-order, motion

Let Q_c(w) be the cost of cut c on S; its gradient in coordinate v is the weighted degree of v among edges internal to c. The global maximum lies in the relative interior of the simplex on S. The restrictions of its active gradients to the full tangent space of sum-zero weight directions have zero in their convex hull. Otherwise separation gives a direction increasing every active cut to first order, and the strictly positive gap to the finitely many inactive cuts ensures that F increases as well. This also applies after restricting the gradients to any independent I⊆S.

Suppose the active gradients do not span the tangent dual on I. Choose a nonzero direction h supported there with sum zero and all active derivatives zero along h. Because H[I] has no edges, Q_c(w+t h) is exactly affine in t for every cut. Each active cost is therefore constant along the line. There is a nondegenerate interval about zero where the weights stay positive and all inactive costs exceed the maximum.

Follow the line up to the first positive endpoint where a weight vanishes or an inactive cost reaches the maximum. Such an endpoint exists because some h coordinate is negative, and the side constraints and cut costs are affine. At this endpoint the maximum is still attained. If a weight vanishes this contradicts minimal support. If all weights remain positive, a new optimal cut has appeared without losing any previous optimum. This contradicts the secondary choice of w. The span assertion follows.

The convex-hull condition on the restricted gradients gives a nontrivial linear dependence among the k restricted vectors (or gives rank zero when k=1). Their rank is at most k−1 and at least |I|−1, giving k≥|I|. The claim about internal degrees follows by using the tangent vector with entries +1 and −1 at a nonadjacent pair.

This supplements the [graphon stationarity](GRAPHON-EXTREMIZERS.md) and [unique-cut obstruction](OPTIMAL-CUT-DEGENERACY.md), but it does not supply a finite-support theorem for arbitrary maximizing graphons.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
