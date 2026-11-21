# Erdős 617: critical cliques and uniform residue attachments

21 November 2026. Partial structural results for the campaign's edge-critical reduction. No full solution, novelty claim, formal verification, submission, or payment is asserted.

The boundary improvement and uniform residue-attachment lemma below were independently reviewed by the `demath_zzz_bounties` agent. The parent agent and the other two research agents separately established the newer reduction that all full cliques are disjoint. This note uses that reduction where explicitly stated; it does not reproduce its proof.

## Hypotheses

Let H be a connected finite simple graph with independence number r, where r is at least three. Assume every edge is essential for the independence number:

```math
\alpha(H-e)=r+1 \qquad(e\in E(H)).
```

A full clique means a copy of K_r. Assume every vertex outside a full clique has at most one neighbor inside it. These are preserved hypotheses of the campaign's spanning edge-deletion reduction. They do not mean that the reduced graph is itself a color class in a new coloring of the complete graph.

An essential-edge certificate is an independent set of size r+1 in H-e. It contains both endpoints of e, and those endpoints are its only adjacent pair in H.

## Proper cliques retain the independence number on deletion

For any nonempty proper clique Q of a connected edge-critical graph with independence number a,

```math
\alpha(H-Q)=a.
```

Connectedness supplies a cross edge uv with u in Q and v outside Q. Its certificate contains u and v and no other vertex of Q. Removing u from the certificate leaves an independent a-set outside Q. The reverse inequality follows from taking an induced subgraph.

Every vertex of a proper clique Q also has an exterior neighbor. Suppose x in Q had none. Pick any cross edge uv with u in Q. A certificate for uv contains u and otherwise only vertices outside Q. Replacing u by x would produce an independent set of size a+1 in H, a contradiction. In particular, every vertex of a full clique has degree at least r.

## Maximum independent sets outside one full clique

Fix a full clique Q and write R=H-Q. Let N(Q) denote the vertices outside Q having a neighbor in Q. Then

```math
N(Q)=\bigcup\{S:S\subseteq R,\ S\text{ independent},\ |S|=r\}.
\tag{1}
```

For the forward inclusion, take v in N(Q) and its neighbor u in Q. Removing u from a certificate for uv leaves an independent r-set in R containing v.

Conversely, take an independent r-set S in R. Every vertex of Q has a neighbor in S, since otherwise it could extend S. Every vertex of S has at most one neighbor in Q. As both sets have size r, their cross edges form a perfect matching. Thus every member of S lies in N(Q), proving (1). This also proves that every maximum independent set of R is a transversal of the r disjoint attachment classes of Q.

Consequently, |N(Q)| is at least r. If equality holds, R has the unique maximum independent set U=N(Q).

## Two other full cliques force a larger boundary

**Lemma.** Suppose Q, C and D are pairwise vertex-disjoint full cliques. Then

```math
|N(Q)|\ge r+1.
\tag{2}
```

Assume otherwise. By (1), |N(Q)|=r and R=H-Q has the unique maximum independent set U=N(Q).

First, C meets U. If it did not, choose any u in U. The r-1 vertices of U minus u forbid at most r-1 vertices of C, so a remaining vertex of C extends U minus u to a second independent r-set in R. This contradicts uniqueness. Since C is a clique, C meets U in precisely one vertex, say u.

Each w in C minus u has at least two neighbors in U. With no neighbor it could extend U, and with exactly one neighbor it could replace that neighbor to produce a different maximum independent set of R. One of its neighbors is u. Every vertex of U minus u lies outside C and has at most one neighbor in C. Counting the r-1 vertices on each side now shows that the edges between C minus u and U minus u form a perfect matching. Every member of C minus u therefore has exactly two neighbors in U: u and its matched vertex.

Likewise D meets U in one vertex v, and its remaining vertices are matched to U minus v. Since C and D are disjoint, u and v are distinct. Let w in C minus u be matched to v, and let z in D minus v be matched to u. Both have U-neighborhood exactly {u,v}. They are nonadjacent: w already has the neighbor v in the full clique D, so the external-neighbor rule forbids the edge wz.

Therefore

```math
(U\setminus\{u,v\})\cup\{w,z\}
```

is a second independent r-set in R, contradiction. This proves (2).

In the campaign's remaining connected case, there are at least three full cliques and they are all disjoint. Thus (2) applies to every full clique Q. Because each exterior neighbor contributes exactly one edge into Q,

```math
\sum_{v\in Q}d_H(v)=r(r-1)+|N(Q)|\ge r^2+1.
\tag{3}
```

This strict degree excess is not by itself a contradiction to the global edge budget; vertices outside the full cliques can have smaller degrees.

## All residue vertices have uniform attachment behavior

Assume now that all full cliques are pairwise disjoint, list them as Q_1,...,Q_q, and put

```math
U=\bigcup_{i=1}^q Q_i,\qquad R=V(H)\setminus U,
\qquad s=r-q\ge1.
```

The application has 3<=q<=r-1 and |R|=rs+1. The proof below only needs the displayed clique and independence hypotheses.

### A surplus-list observation

Suppose q disjoint lists have at least q-1 choices each, conflicts between every pair of lists form a matching, and one list has at least q choices. Choose from the other q-1 lists in any order. At the k-th choice at most k-1 choices are forbidden, so a choice remains. Finally choose from the surplus list, where at most q-1 choices are forbidden. This gives an independent transversal.

### Independent residue sets have distinct attachments

Let S be any independent subset of R of size s+1. In each Q_i remove every neighbor of a vertex of S. Each S vertex forbids at most one choice, so the remaining list has at least

```math
r-(s+1)=q-1
```

vertices. Cross edges between two disjoint full cliques form a matching. If any list had at least q choices, the preceding observation would extend S by q independent clique representatives, yielding an independent set of size r+1 in H.

Thus all q lists have exactly q-1 choices. Equality forces every vertex of S to have one neighbor in every Q_i, with all these neighbors distinct within each Q_i.

### Criticality propagates one attachment to every full clique

Suppose v in R has a neighbor u in some Q_i. An essential-edge certificate for uv contains at most one vertex from each Q_j, because deleting this cross edge leaves all full cliques intact. It consequently contains at least

```math
r+1-q=s+1
```

vertices of R, including v. The residue portion is independent in H: the deleted edge has only one endpoint in R. Choose an independent (s+1)-subset of that portion containing v and apply the preceding result. It follows that v has exactly one neighbor in every Q_j.

Therefore R splits into two classes:

```math
R=A\sqcup Z,
```

where every vertex of A has exactly one neighbor in each full clique, and every vertex of Z has no neighbor anywhere in U. In particular,

```math
e_H(Q_i,R)=|A|\quad(1\le i\le q),\qquad
e_H(U,R)=q|A|.
\tag{4}
```

Moreover, the two directions just proved show the exact identity

```math
A=\bigcup\{S:S\subseteq R,\ S\text{ independent},\ |S|=s+1\}.
\tag{5}
```

Connectedness and the nonempty sets U,R supply at least one cross edge, whose certificate proves that an independent (s+1)-set in R exists. Hence |A|>=s+1 and alpha(H[R])>=s+1. The identity does not assert that Z is empty or that an arbitrary independent s-set extends to an (s+1)-set.

## No clique separator: an elementary check of a known theorem

Connected edge-critical graphs have no clique cutset. The stronger classical fact that two incident critical edges lie on a chordless odd cycle is recorded in Plummer, Stiebitz and Toft, *On a special case of Hadwiger's conjecture*, Discussiones Mathematicae Graph Theory 23 (2003), 333–363, Section 6, DOI [10.7151/dmgt.1206](https://doi.org/10.7151/dmgt.1206). Its bibliography points to Berge and to Lovász–Plummer, *Matching Theory*, p. 448. The argument below proves the needed separator statement directly; it does not use an unverified strengthening of the cited theorem.

Suppose a clique K separates a connected edge-critical graph G. Let C_1,...,C_t, t>=2, be the components of G-K, put a_i=alpha(C_i), and let a=sum a_i. Since an independent set uses at most one vertex of K, alpha(G) is either a or a+1. For x in K define

```math
\ell_i(x)=a_i-\alpha(C_i-N_G(x))\ge0.
```

Take a cross edge xy with y in C_j. In its critical certificate, x is the only K vertex. At most a_j vertices come from C_j, and at most a_i-ell_i(x) from each other component. Thus

```math
\alpha(G)+1\le1+a-\sum_{i\ne j}\ell_i(x).
```

It follows that alpha(G)=a and every ell_i(x) with i!=j is zero. Removing y from the certificate gives a maximum independent set containing x; together with the absence of an independent (a+1)-set, this forces ell_j(x)=1. In particular, all exterior neighbors of any given x lie in one component.

If x and x' in K have exterior neighbors in different components C_j and C_k, a critical certificate for the internal edge xx' could use both x,x', but it loses at least one independent vertex in each of C_j,C_k. Its size is therefore at most 2+a-2=a, contradicting the required size a+1. All K vertices having exterior neighbors attach to the same component. Connectedness requires every C_i to have a neighbor in K, contradiction to t>=2.

Thus deleting any proper clique from G leaves a connected graph. This is useful structure, but it supplies no quantitative attachment lower bound beyond the separate arguments above.

## Remaining gap

The reduced graph now has at least three mutually disjoint full cliques. Its residue has an independent (s+1)-set, but every such set leaves only q-1 choices in each clique and may fail to admit a full matching-conflict transversal. The exact alternatives A and Z in (4)–(5) still allow vertices outside every large independent residue set. Neither criticality nor the no-clique-cutset theorem proved here makes those vertices disappear.

No claim follows that the entire graph is r-colorable, that every maximum independent set has a disjoint partner, or that a maximum independent set has average degree at most the graph average. The latter proposed bridge is false for general edge-critical graphs; the parent's explicit disconnected counterexample does not by itself decide its connected version. The exact [degree-averaging obstruction](degree-averaging-obstruction.md) records the counterexample and the limit of its scope. No unproved degree-averaging statement is used here.
