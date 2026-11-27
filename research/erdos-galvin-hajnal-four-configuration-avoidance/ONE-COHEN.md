# Erdős–Galvin–Hajnal’s four-configuration avoidance problem

## A single Cohen real suffices

**Theorem.** Over any ZFC ground model, adding one Cohen real forces the existence of an \(\aleph_1\)-chromatic triple system on \(\omega_1\) simultaneously omitting \(T_1,T_3,T_4,T_9\). This strengthens the [\(\omega_1\)-Cohen construction](https://github.com/1337isnot1337/solved-conjectures/pull/1082). The proof uses a labelled directed path system, not a claim that a single Cohen algebra has the large product as a complete subalgebra.

### A stationary supply of predecessors

Write \(L\) for the nonzero limit ordinals below \(\omega_1\). Fix a function \(h:L\to\omega_1\) with \(h(\beta)<\beta\), each of whose level sets is stationary. This exists by splitting \(L\) into \(\omega_1\) stationary sets and deleting the bounded initial segment through \(\xi\) from the set labelled \(\xi\); put zero on leftovers. Fix an increasing cofinal ladder \(\ell_\beta:\omega\to\beta\) and a bijection \(e_\beta:\omega\to\beta\) with \(e_\beta(0)=0\), for each \(\beta\in L\).

For any ground countable colouring \(d:\omega_1\to\omega\), call \(\beta\in L\) good if
\[
\{h(\alpha):\alpha\in L\cap\beta,\ d(\alpha)=d(\beta)\}
\text{ is unbounded in }\beta.
\]
There is always a good vertex. For each \(\xi\), a stationary subset of \(h^{-1}(\xi)\) has constant \(d\), say \(i_\xi\), by countable completeness of the nonstationary ideal. For some \(i\), the set \(A=\{\xi:i_\xi=i\}\) is unbounded. Take \(\beta\) from any of these stationary colour-\(i\) subsets, intersected with the club of limit points of \(A\) and the diagonal intersection of the corresponding clubs of limit points of \(\{\alpha:h(\alpha)=\xi,\ d(\alpha)=i\}\). For every \(\eta<\beta\) there is a \(\xi\in A\cap\beta\) above \(\eta\), and then \(\alpha\in L\cap\beta\) with \(h(\alpha)=\xi\) and \(d(\alpha)=i\). Thus \(\beta\) is good. Applying the same fact to \(\beta\mapsto(d(\beta),\boldsymbol{1}_{\beta\text{ is good}})\) shows that some \(c\in L\) has predecessors \(b\in L\cap c\) with \(h(b)\) unbounded in \(c\), all good for \(d\) and of the same \(d\)-colour as \(c\). Indeed the refined-colour good vertex itself must be good for \(d\), so the matched predecessors must be good for \(d\) too.

### Read one real into independent finite slots

Give the ordinals in \(L\) distinct ground binary reals \(t_\beta\). Use Cohen forcing as finite partial natural-number assignments on a countably infinite coordinate set, consisting of a length coordinate \(N_j\) for each \(j\in\omega\) and a table coordinate \(R_{j,s}\) for each \(j\in\omega,\ s\in 2^{<\omega}\). Its generic assignment is equivalent to one Cohen real. At stage \(j\), vertex \(\beta\) reads just \(R_{j,t_\beta\upharpoonright N_j}\). Interpret a table value as a candidate index \(u\in\omega\), a mode (base or top), and a selector \(v\in\omega\). Fix an encoding of all such records and a neutral record with candidate \(0\).

Construct a graph \(D\) on \(\omega_1\) by deciding its lower neighbours separately at each \(\beta\in L\) (there are none below other vertices). Process its stages \(j<\omega\). If the read candidate is \(\alpha=e_\beta(u)\), accept it at stage \(j\) only when
\[
  \alpha\in L,\qquad \alpha>\ell_\beta(j),\qquad
  h(\alpha)>\max\big(\{h(\beta)\}\cup
          \{\text{previously accepted lower neighbours of }\beta\}\big).
\]
Record the edge \(\alpha\to\beta\), with its mode and selector immutable. Each accepted predecessor is larger than every earlier one, so no edge gets two records. The graph \(D\) is upward directed and contains no two different directed paths between the same vertices. To see this, \(h\) strictly decreases along an edge read downward. Every nontrivial descending path starting at \(x\) stays strictly above \(h(x)\). If two directed paths have the same endpoints, take a simple pair of such paths by removing common initial and terminal segments. At their last vertex, their distinct immediate predecessors are \(a<b\), where \(b\) was accepted after \(a\). Hence \(h(b)>a\); the path downward from \(b\) cannot reach their common initial vertex, which is at most \(a\). Contradiction. In particular \(D\) is triangle-free.

For an accepted **top** edge \(b\to c\) with selector \(j\), add the triple \(\{a,b,c\}\) if the lower neighbour of \(b\) accepted at stage \(j\) exists and was in **base** mode; call it \(a\). If there is no such candidate, the top edge contributes no triple. Thus each top edge is used at most once, and no top edge is used as a base. Every triple is an ascending directed two-path, and any pair shared by two distinct triples must be their bottom pair: a diagonal pair is not a graph edge and identifies a unique directed two-path; a top pair cannot also be a base pair.

### The four exclusions

- A copy of \(T_3\), or a copy of \(T_4\) (the three-edge path in a link), would make one triple share two different pairs with other triples. Both pairs cannot be its one bottom pair.
- For a loose triangle \(T_1\), join the two intersection vertices within each triple along its directed two-path. Each resulting segment is monotone, of length one or two, and their union is a simple cycle with at most three changes of direction. The number of changes is even and positive, so there are exactly two, giving two different directed paths from a minimum to a maximum. This is impossible in \(D\).
- In \(T_9=\{abx,aby,xyz\}\) the repeated pair \(a,b\) would be the bottom pair both times. In increasing order assume \(a<b\). Both \(x,y\) are out-neighbours of \(b\). The third triple gives a directed path from the smaller of \(x,y\) to the larger, not using \(b\). Appending that path to the edge from \(b\) to the smaller gives a second directed path to the larger, again impossible.

### The triple system is uncountably chromatic

Fix a condition \(p\) and a name \(\dot f:\omega_1\to\omega\). In the ground model let \(d(\beta)\) encode a choice of a condition \(q_\beta\le p\) and the colour \(i_\beta\) it decides for \(\dot f(\beta)\). There are only countably many codes, so use the stationary argument above to obtain a vertex \(c\) and cofinally \(h\)-high good predecessors of its own code. This common code specifies a single condition \(q\) and colour \(i\).

Choose \(m\) strictly above all stage indices appearing anywhere in \(q\). For each \(x\in L\), let \(B_x\) bound all ordinals \(e_x(u)\) corresponding to the finitely many candidate indices \(u\) already mentioned in table entries of \(q\), and also \(e_x(0)=0\). We will complete earlier table reads not decided by \(q\) with neutral records. First choose a good \(b<c\) of code \(d(c)\) with
\[
h(b)>\max\{h(c),B_c,\ell_c(m+1)\}.
\]
Next choose \(a<b\) of code \(d(b)\) with
\[
h(a)>\max\{h(b),B_b,\ell_b(m)\},
\]
using goodness of \(b\).

Strengthen \(q\) to decide the reads at \(b,c\) for stages \(j<m\): choose any \(N_j\) not yet fixed and fill all needed table entries not yet fixed with neutral records. This is a finite extension, including when \(b,c\) read the same entry. Every previously selected predecessor at each vertex is then bounded by the corresponding \(B_x\). At stage \(m\) set the *new* length \(N_m\) long enough to distinguish \(t_b,t_c\), give \(b\) the base record selecting \(a\), and give \(c\) the neutral record. At stage \(m+1\) set a length and give \(c\) the top record selecting \(b\) with selector \(m\). The displayed inequalities ensure both designated edges are accepted. Therefore this finite condition forces the triple \(abc\). All three vertices were decided to have colour \(i\) by \(q\). No countable map is forced to colour the triple system properly. Cohen forcing preserves \(\omega_1\), so order and chromatic number are both exactly \(\aleph_1\).

**Source boundary.** [Lambie–Hanson and Uhrik, Theorem 3.5](https://arxiv.org/html/2312.01828) use a one-Cohen ladder construction for a graph with no special cycles and stronger odd-girth bounds. The threshold separation above is the corresponding monotone-path mechanism. The additional ingredients here are the two-level good-vertex selection, the variable prefix lengths that let one real control separate reads at two vertices, and the base/top selector rule which makes the hypergraph avoid \(T_3,T_4\) as well. The original problem is [EGH 9/C, printed p. 482](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=58). No claim is made that CH alone supplies the simultaneous witness, or that a Cohen real is necessary over grounds already having one. Written proof pending independent review.
