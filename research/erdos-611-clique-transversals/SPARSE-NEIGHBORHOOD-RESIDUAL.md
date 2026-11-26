# Bollobás–Erdős–Tuza maximal-independent-set conjecture

The [box](BOX-NEIGHBORHOODS.md) and [norm-ball](NORM-BALL-NEIGHBORHOODS.md) mesh transversals tolerate a sparse uncovered remainder. Only an inner geometric approximation is required.

**Theorem.** Fix the dimension and either the box aspect bound or the fixed norm of those theorems. On a lattice torus with $n=q^d$ vertices, suppose the open neighborhood of each vertex contains a union of geometric traces of the stated kind, with $Q=O(n)$ traces in total. Suppose the total number of ordered neighbor incidences not accounted for by those traces is $R=o(n^2)$. Then for any fixed $c>0$ there is a set of size $o(n)$ meeting every maximal independent set of size at least $cn$. A positive unused fraction of ordered nonedges is not required, and the incidence residual can be distributed arbitrarily.

Let $z=\max(R/n^2,n^{-1/2})$, so $z\to0$. Use length thresholds starting at $\lceil q z^{1/(2d)}\rceil$ and increasing by the factor $B=\lceil(\log(1/z))^2\rceil$, keeping full bands below $q$. Their number is $\Theta_d(\log(1/z)/\log\log(1/z))$, which tends to infinity. Some band owns only $o(n)$ traces. Exclude its owners, and let $\ell,L=B\ell$ be its endpoints. Take the same mesh of spacing a sufficiently small fixed multiple of $L$, uniformly rotated. Its size is $O(z^{-1/2})=O(n^{1/4})$. In expectation it meets at most $O(Q/B^d)=o(n)$ short-trace incidences, as before.

In addition, the expected number of ordered uncovered neighbor incidences ending in a mesh point is
$$O(z^{-1/2})R/n=O(n\sqrt z)=o(n).$$
Choose one rotation for which the combined short and uncovered incidences meet these total bounds. Put their owners, the medium owners, and the mesh into the transversal candidate. If a large maximal independent set avoids it, every mesh point is dominated by a long trace of a member. The union of those long traces is contained in open neighborhoods of members, so misses the independent set. The enlargement inequality for boxes or norm balls contradicts the occurrence of such a large complement. This proves the theorem.

The inclusion of every trace in its actual open neighborhood is essential to this proof. A two-sided approximation with equally few false-positive incidences is not an immediate substitute, since false-positive traces could cover many vertices of the independent set. The unrestricted [Erdős #611](https://www.erdosproblems.com/611) remains open. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
