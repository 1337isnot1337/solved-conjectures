# Erdős–Székely small quasi-kernel conjecture: research notebook

## Scope and status

The conjecture says every finite source-free digraph on n vertices has an independent set Q reaching every vertex by a directed path of length at most two, with |Q| <= n/2. Attribution is **Péter L. Erdős**, not Paul Erdős. It is a fully quantified conjecture, not a bounded-degree or numerical subcase. No solution is claimed here.

Research coordinated in issue #50.

Primary sources checked:

- Spiro, Equivalence of Small and Large Quasi-kernels, arXiv:2611.22881v1 (17 November 2026), https://arxiv.org/html/2611.22881v1 . Still states the full problem as a conjecture; proves general bounds n-Omega(n^(3/4)) for small quasi-kernels and Omega(n^(2/3)) for closed out-neighborhoods.
- Ai–Gutin–Liu–Meng, Small and large quasi-kernels: a weighted transfer theorem, arXiv:2610.23487v1 (16 October 2026), https://arxiv.org/html/2610.23487v1 . Establishes exact universal equivalence of small and large formulations, using weights and matching.
- Clow, Greedily Constructing Small Quasi-Kernels, arXiv:2601.11847v1 (17 January 2026), https://arxiv.org/html/2601.11847v1 . Analyzes constructive recursion; notes local criteria cannot prove the full conjecture.


## Precise source-aware sampling algorithm

All neighborhoods, degrees, and weights below refer to the current induced subdigraph H, with the original vertex weights restricted to H. The graph has no loops or parallel arcs. Our obstruction families are oriented, so opposite arcs do not occur. All class sizes and parameters used in the constructions are positive integers unless stated otherwise; regular tournaments use r>=1.

1. If H is empty, return the empty set.
2. If its set S of sources is nonempty, recursively produce Q' on H minus the closed out-neighborhood N_H^+[S], and return S union Q'.
3. Otherwise assign pivot scores p_lambda(v) as defined in the final section. Sample a pivot proportionally to these scores. If their sum is zero, sample uniformly among all remaining vertices.
4. Recursively produce Q' on H minus N_H^+[v]. If an arc q->v exists with q in Q', return Q'. Otherwise return Q' union {v}.

Each recursive call uses fresh random choices. Step2 preserves independence because every out-neighbor of S has been deleted and no vertex points into S. Step4 is precisely the CL extension: Q' cannot meet an out-neighbor of v, and v is added only if Q' has no in-neighbor of v. In either branch the deleted out-neighbors of v are reached in at most two steps. Thus the procedure always returns a quasi-kernel. The uniform zero-score fallback is essential to the explicit probability in the final lambda>0 obstruction.

Earlier sections also discuss variants without source preprocessing or with other scores; these are clearly labeled exploratory variants. The final two sections concern exactly this source-aware algorithm.

## Minimax route

Let C_Q be the incidence vector of the closed out-neighborhood of a quasi-kernel. A fixed digraph has the weighted half-coverage property if for every nonnegative weight vector w, some Q has w.C_Q >= (sum w)/2. Finite-dimensional minimax/separation makes this equivalent to a distribution on quasi-kernels for which each vertex belongs to their closed out-neighborhood with probability >=1/2. This is a reformulation, not a proof.

The CL recursion chooses a pivot v, recurses in D-N+[v], gets Q', and returns Q' if Q' contains an in-neighbor of v; otherwise it returns Q' union {v}. This always gives a quasi-kernel. A natural hope is to choose pivots from a weight-dependent distribution that guarantees expected half-coverage.

## Exact obstruction 1: uniform pivots

Take independent classes A,B,C of sizes 1,1,m, with every arc A->B, B->C and C->A. Give only A positive weight. CL with a uniformly random pivot returns C if the first pivot is A, A if the first pivot is B, and B if the first pivot is in C. (After the pivot, isolated vertices in its own class may temporarily survive recursion, but the preceding class in the directed cycle removes them when unwinding.)

Thus weighted A is covered with probability 2/(m+2), tending to zero. Uniform-pivot CL cannot prove the weighted half-coverage property, even on this elementary source-free oriented family.

## Exact obstruction 2: incoming-weight pivots

A more promising-looking rule chooses pivot v proportional to w(v)+w(N^-(v)). It is also insufficient by an unbounded factor.

Use the same three classes with m=t^2, weights w(A)=t, w(B)=1 and zero weight on C, with integer t>=1. The total first-pivot masses are:

- A: t
- B: t+1
- C: t^2

The outputs, respectively C, A, B, have covered weight t, t+1, 1. Hence expected covered weight is

    E_t = [t^2+(t+1)^2+t^2]/[t+(t+1)+t^2]
        = (3t^2+2t+1)/(t+1)^2.

Total weight is t+1. Therefore E_t/(t+1) = (3t^2+2t+1)/(t+1)^3 -> 0.

This is an exact all-parameter obstruction to the proposed sampling rule, not a counterexample to either quasi-kernel conjecture. Indeed selecting A itself gives a quasi-kernel covering all positive weight, and selecting the one-vertex A or B is already a small quasi-kernel.

## Exact obstruction 3: extending independent-set coverage

Another tempting claim is that any independent set I can be replaced by a quasi-kernel whose closed out-neighborhood contains N+[I]. This is false.

Take a regular tournament T on 2r+1 vertices. Add s,t with arcs s->t and t->every vertex of T, with no other arcs joining s or t to T. Give each T vertex weight1 and s,t weight0. The independent set {t} covers weight2r+1. Every quasi-kernel contains source s and hence excludes t; its intersection with T has at most one vertex. Consequently any quasi-kernel covers at most r+1 of the weighted vertices. Every set {s,v} for v in T is a quasi-kernel, so this bound is attained. The coverage ratio tends to1/2.

Thus simply choosing a good independent set and claiming its covered weight survives CL extension cannot work. This does not refute the weighted half-coverage conjecture: this graph satisfies it.

## Historical intermediate test

Degree-normalized pivot score sum_{u in N^-[v]} w(u)/(1+d^+(u)) avoids the preceding twin-multiplicity bias. The first exact diagnostic tests in qk_normalized_probe.py passed. Those finite tests were evidence only, not a theorem. The later all-parameter constructions below refuted this candidate, illustrating why the rejected-pivot step must be controlled. All diagnostic jobs from this pass have finished.

## Exact obstruction 4: degree-normalized pivots

The normalized rule also fails, despite passing many small random diagnostic instances. Take a three-layer DAG: source s, an independent middle class R of size r, and an independent final class L of size m, with all arcs s->R and R->L. Set w(s)=t, w(R)=0, and w(l)=1 for every l in L.

Until a non-leaf pivot occurs, its pivot scores remain t/(r+1) for s and each vertex of R, and 1 for each remaining leaf. If the first non-leaf pivot is s, all leaves end up covered. If it is in R, all leaves not already chosen as pivots are removed; recursion subsequently selects s and rejects that middle pivot. The leaves chosen earlier stay in the final quasi-kernel. For a specified leaf, an exponential-race calculation gives coverage probability

    (1+t/(r+1))/(1+t).

Consequently expected covered weight is

    t + m(1+t/(r+1))/(1+t).

Taking integer r=t and m=t^3 makes its ratio to t+m tend to zero. There is no positive universal constant guarantee for this unmodified normalized rule.

Important limitation: this obstruction is acyclic and is removed by preprocessing all sources. Indeed for sources S, one may safely include S, delete N+[S], recurse, and preserve half-coverage if it held in the residual. Thus the weighted large conjecture reduces to source-free graphs, and at this intermediate stage a source-aware normalized algorithm was a new, still-unproved candidate. This is a historical checkpoint: the next section refutes that repaired algorithm too. The DAG obstruction alone does not refute it.

## Source-free obstruction to the repaired normalized rule

Source preprocessing does not save the algorithm. Let the vertices be s,b and independent classes B,R,L of respective sizes d,r,m. Put in exactly these arcs:

    b -> s,   s -> B,   B -> b,   s -> R,   R -> L,

where arrows to/from classes mean all corresponding arcs. Every vertex has positive indegree. Put w(s)=t, w(l)=1 for l in L, and zero weight elsewhere. Preprocess sources at every recursive stage.

Before a non-leaf pivot occurs, the scores of s and each B/R vertex equal t/(d+r+1), b has score0, and each remaining leaf has score1. Thus the probability a specified leaf survives until a non-leaf pivot is t/(t+1); conditioned on this, the first non-leaf is in R with probability r/(d+r+1).

If that first pivot is in R, all remaining leaves disappear. Until s or a B vertex is selected, the remaining R vertices may be selected, but they do not change the relative uniform probabilities among s and B. The first pivot among s and B belongs to B with probability d/(d+1). In that case b disappears, s becomes a source, the final quasi-kernel contains s, and all previously selected R vertices are rejected because s points to them. The specified leaf remains uncovered.

In every other case that leaf is covered: an early leaf pivot is eventually either included or dominated by an included R vertex; an early B pivot makes s a source before any leaves are removed; and an early s pivot leaves b and all remaining leaves as sources. If R was selected but s precedes B, an earlier R pivot is included when unwinding, covering every leaf.

Hence the exact loss probability for each leaf is

    t/(t+1) * r/(d+r+1) * d/(d+1),

and exact expected covered weight is

    t + m[1 - t/(t+1)*r/(d+r+1)*d/(d+1)].

With t=d, r=d^2, m=d^3, the ratio to t+m tends to0. This defeats the source-aware algorithm on an infinite source-free oriented family. Independent exact enumeration checks matched this formula for (d,r,t,m)=(1,1,1,2),(2,3,5,4),(3,4,7,5), giving respectively17/6,71/9,663/64. These checks are diagnostics supporting the proof, not a bounded-case claim.

## Wider obstruction: every fixed mixture of own-weight and normalized incoming-weight scores

Consider pivot score

    p_lambda(v) = lambda w(v) + (1-lambda) sum_{u in N^-[v]} w(u)/(1+d^+(u)),

with fixed 0<=lambda<=1, recomputed in each residual digraph; preprocess sources; and use uniform pivots when all weights are zero. The preceding construction handles lambda=0. For any fixed lambda>0, a second family defeats the algorithm.

Take a directed triangle of classes s -> B -> b -> s with |B|=d and add t and m leaves L, with s->t and t->L. The symbol t now names a vertex; give it weight a, each leaf weight1, and all core vertices weight0. Every vertex has positive indegree.

Before t is selected, the only positive-score pivots are t and the remaining leaves. If k leaves remain then the total score is a+k, and t's score is at least lambda*a. Therefore at every such step the chance to stop at t is at least lambda*a/(a+m). The expected number J of leaves selected before t is at most (a+m)/(lambda*a).

Once t is selected, all remaining leaves disappear and the residual zero-weight cyclic core uses uniform pivots. It returns {s} with probability d/(d+2): an initial B pivot deletes b, making s a source. In this event t is rejected and only the J earlier leaves are covered. In the complementary event one may upper bound coverage by all m leaves. Thus

    E[covered weight] <= a + m*2/(d+2) + (a+m)/(lambda*a).

Taking a=d, m=d^3 makes the ratio to a+m tend to0. Consequently **no fixed mixture in this whole family gives any positive constant expected weighted coverage guarantee**, even with source preprocessing and even for source-free oriented graphs.

This is an obstruction to proposed proof algorithms. It is not a counterexample to either quasi-kernel conjecture and is not presented as a new published theorem. In both families there are good quasi-kernels; the randomized rule fails to find them reliably. A different pivot policy or a structural argument is needed.

## Further rejected repair: own weight divided by out-degree

Using only p(v)=w(v)/(1+d^+(v)) also fails by an unbounded factor, even with source preprocessing. Use cyclic independent classes A->B->C->A of sizes1,1,m, with weights1,t,0 and m=t^2. Only A and B have positive pivot score, respectively1/2 and t/(t^2+1). A pivot in A yields Q=C (covered weight1); a pivot in B yields Q=A (covered weight t+1). Expected covered weight is

    [1/2 + t(t+1)/(t^2+1)]/[1/2+t/(t^2+1)],

which remains bounded as t grows while total weight t+1 diverges. There are no initial sources; following either pivot the residual edgeless class consists of sources, so source preprocessing does not alter the calculation.

## What remains open in this lane

No proof or counterexample to the named conjecture has been found. The sampling obstructions are all-parameter and rigorous, but they only eliminate proposed approaches. They should be recorded as research notes, not added to the repository's solved-conjecture list.

These examples suggest that a successful distribution must account for the possible later rejection of a pivot, rather than only weighting vertices or their immediate neighborhoods. In the source-free obstruction, a large family of zero-weight twins changes the probability of that rejection dramatically. Module-aware contraction or an exchange argument on already-complete quasi-kernels may avoid this failure, but no sufficient invariant has been established.
