# Directed six-cycles in the three-colour case

Partial research for [Erdős Problem 23](https://www.erdosproblems.com/23). Orient a proper three-colouring cyclically from colour i to i+1 modulo 3. In a saturated least-support weighted counterexample, **every** proper three-colouring has a directed induced six-cycle. Such a root gives a Clebsch-based inequality for arbitrary weights and a restricted exact template description when it two-dominates the support.

## Why the forced cycle has length six

If the cyclic orientation were acyclic, a topological order would give a balanced one-way median split (split a false twin at the median if needed) and the sharp bound by [the one-way separator](ONE-WAY-SEPARATORS.md). Otherwise take a shortest directed cycle. Its length is a multiple of three, and no triangle exists. Any chord would create a shorter directed cycle, taking the segment that returns to the chord's tail. Thus the cycle is induced.

If its length were at least nine, take two vertices at forward distance four. They have different colours and are nonadjacent. Saturation gives a common neighbor, necessarily of the third colour. It is outside the induced cycle, and the two incident arcs return in the right direction to close the four-arc segment. This is a directed six-cycle, a contradiction.

## Profiles and cuts

Label alternate root shores a_1,a_2,a_3 and b_1,b_2,b_3 so that a_i b_j is an edge exactly for i!=j. Opposite roots a_i,b_i have the same original colour, different for the three indices. A pure profile of size at least two on one shore uses exactly two roots, since a vertex cannot see all three colours. Denote these profiles by A_i and B_i according to which a- or b-root is omitted. They have original colour i. Across these sets, a high pure edge is possible only between A_i and B_j with i!=j: two profiles on the same shore intersect, and index i on opposite shores still has the same original colour.

A mixed profile consists of a_i,b_i for some i; call its set M_i. Such a vertex can see only A_i and B_i among the pure profiles. Put M=union_i M_i, and let L be the profiles of size at most one. These definitions include the original root vertices by their own profiles. Let e be total edge mass, let l be the mass of L, and let e_cross be the mass between L and its complement. Then, in total vertex mass one,

    beta(G) <= (e+2 beta(G[M]))/5 + (3/10)e_cross + (2/47)l².

For the proof use the four-bit Clebsch model, adjacency at XOR Hamming weight 1 or 4. Send A_1,A_2,A_3 to 0,6,5; send B_1,B_2,B_3 to 7,1,2. Take an optimal cut of G[M], and send each of the three types M_i according to its two signs:

    type      first sign     second sign
    M_1          15               8
    M_2           9              14
    M_3          10              13

These labels send every pure-to-pure or pure-to-mixed edge to an edge, and every mixed edge crossing the chosen optimal cut to an edge. Each same-sign mixed edge has distinct nonadjacent images (the XOR of the two labels has Hamming weight two). The five Clebsch cut masks therefore miss each such edge with probability 3/5 and every other high edge with probability 1/5. Align a separate optimum cut of L with the high cut by a fair coin and apply [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) there, as in [the Petersen-anchor inequality](PETERSEN-ROOT.md).

## The exact two-dominating template

Assume now L is empty in a saturated triangle-free graph with this colouring. Between any A_i and B_j, i!=j, every possible edge must be present. A missing such pair cannot have a common neighbor in A or B (each is independent), or in M (the attachment indices differ). Similarly every M_i vertex is adjacent to every A_i and every B_i vertex: a common neighbor of one missing pair cannot occur in A or B, since the mixed vertex has pure neighbors only at index i and A_i B_i is forbidden, nor in another mixed set with a different attachment index. Saturation gives completeness. Each A_i and each B_i is now a twin class, so on a least-support counterexample each is a single vertex.

The resulting six-vertex crown has complete attachments to the three independent sets M_i, but edges between those sets remain. The whole graph satisfies the conjecture whenever M is bipartite. In a least-support counterexample with L empty, minimality gives beta(G[M]) <= C²/25 for C=mass(M). The displayed cut in the middle band forces C²>803/1600. A large tripartite residual is not ruled out: arbitrary triangle-free properly three-coloured graphs can be inserted as M, using a cyclic shift of their colours relative to the attachment indices and giving the six roots arbitrarily small positive mass. The added root makes a saturated template when all three attachment classes are nonempty and the residual's inter-class missing edges already have common neighbors in the third class. The reduction therefore does not solve all proper three-colourings.

## A large cyclic component needs a low-attachment witness

In any proper three-colouring of a saturated least-support counterexample there is a nontrivial strongly connected component of mass greater than 17/50. Otherwise take a topological prefix of the components with mass in [.33,.67] and apply the one-way separator. A singleton atom that would jump over this range can be split into false twins at the threshold: the component was a singleton, so there is no return path through other components and both twins can be placed consecutively in the topological order.

Any nontrivial strongly connected component of this size contains a directed induced six-cycle. Start with a shortest directed cycle within the component and use the distance-four saturation argument above. Any new witness closes a directed cycle meeting the component, hence belongs to the same component.

In fact **every** directed six-cycle in such a large strongly connected component has a vertex of the support with at most one root neighbor. Suppose otherwise. The exact two-dominating template above says each pure profile is a single root, so every exterior vertex is in some M_i. Split these vertices into M_+ (original colour i+1 relative to type i) and M_- (original colour i-1). Attachments to the roots point from the root into M_+, and from M_- back to the root. An arc from M_+ of type i to M_- of type j would require j-1=i+2 modulo three, hence j=i. This is impossible because M_i is independent. Therefore the root's strongly connected component is exactly its own six vertices.

Its mass is less than 1-sqrt(803/1600), by the residual estimate above, and this is below 17/50. This contradiction proves the asserted low-attachment witness. With arbitrary L removed the same directional argument holds between the pure block, M_+, and M_-, but it only localizes the root's component after deletion: no uniform positive lower bound for the original mass of L is obtained here.

## A quantitative orientation alternative

In a saturated least-support weighted counterexample, fix a proper three-colouring and a directed six-cycle. If the low-profile mass l is at most 1/1000, then one of the two directed mixed classes M_+ or M_- has mass greater than 327/500. This asserts concentration on a single direction, not merely a large total mixed mass.

Let P=A union B denote all pure profiles and define M_+/M_- as above, now with L present. All arcs from P to M go to M_+, and all arcs from M to P start in M_-. There is no arc from M_+ to M_-. Thus the three blocks M_-, P, M_+ occur in a one-way order on the high-profile graph.

Using beta(G[M])<=C²/25 for the proper induced support of mass C, the Clebsch inequality shows C>139/200. Otherwise beta is at most

    3197/100000 + (2/125)(139/200)² + 3/10000 + 2/(47*10^6)
       < 1/25.

Hence mass(P)<61/200. Suppose both mixed signs have mass at most 327/500=.654. If M_- itself has mass at least .345, take it as a prefix. Otherwise take M_- union P; its mass is at least 1-.001-.654=.345 and less than .345+.305=.650. In either case the chosen prefix has mass in [.345,.655]. Place all of L in the other shore for this interface. Any backward cross edge must touch L. At this extremizer every weighted degree is at most 1/2 by [induced cut balance](INDUCED-OPTIMUM-BALANCE.md), so the wrong-way cross mass is at most l/2<=1/2000. The [one-way criterion](ONE-WAY-SEPARATORS.md) applies, since

    (.155)²/2 + 3/2000 < 603/40000.

This contradicts beta>1/25. The argument does not yet force an anchor with both moderate directions or show that nested dominant directions exhaust the possible cyclic structures.
