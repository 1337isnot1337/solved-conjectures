# Permanent values of 3-regular matrices

For every $n\ge9$, the integer spectrum $\Pi_3(n)$ contains an explicit **interval of $2^{\lfloor(n-9)/6\rfloor}$ consecutive integers**, all attained by connected simple cubic bipartite graphs on $n+n$ vertices. For example the constructed interval at order $69$ is $[60\,487\,455\,744,60\,487\,456\,767]$. The [construction](intervals.py) computes the endpoints from $n$ and returns a graph for any chosen integer between them. In particular every residue modulo $q$ occurs in every order $n\ge9+6\lceil\log_2 q\rceil$.

The [catalogue](https://yair-lavi.com/mincs-list/problem-3/index.html) gives an exponential lower bound on the number of distinct values, and a finite interval in order ten. Counting distinct values alone does not establish consecutive integers. The construction here produces an interval in every order and improves the order threshold from the [modular construction](modular_spectrum.md). [Shevelev](https://doi.org/10.1155/2013/289829) treats upper values and special families. Greenstein's problem asks for the *entire* integer spectrum; the intervals below do not classify the other values.

## Counting through a three-edge cut

Mark a black vertex of a cubic bipartite graph and order its three incident edges. Its signature $v$ lists the numbers of perfect matchings using them. To extend the graph, take a second cubic bipartite graph $H$, remove the marked black vertex of the first graph and a chosen white vertex of $H$, then join their three neighbors in a prescribed bijection. The cut is crossed by exactly one matching edge: on the first side the white vertices outnumber the black by one and every crossing edge leaves from a white vertex. Each such matching is equivalent to a pair of perfect matchings of the input graphs using the specified pair of incident edges. If the second graph's removed white vertex has signature $w$, the resulting permanent is $w^Tv$.

For a further iteration, mark a black vertex $x$ in $H$. The new signature equals $Mv$, where $M_{ij}$ counts the perfect matchings of $H$ using edge $i$ at $x$ and edge $j$ at the removed white vertex. When one edge joins those two vertices, its replacement in the joined graph supplies the corresponding port at $x$. Independently relabeling inputs and outputs permits arbitrary column and row permutations of $M$. Each insertion of a graph of order $h$ adds $h-1$ vertices per side.

All graphs used below are connected. A connected regular bipartite graph of degree three stays connected after deleting one vertex: for a deleted black vertex each remaining component with $a$ black and $b$ white vertices has $3(b-a)$ edges back to it. The number is positive and all components together have three such edges, so there is only one component. The same holds with colors exchanged. Thus the splice preserves connectivity, simplicity, cubicity and bipartiteness.

## A six-vertex increment encoding one binary digit

Take the following order-seven graph, with its black row labels in order from zero and their white neighbors displayed:
$$034,\quad012,\quad025,\quad236,\quad146,\quad345,\quad156.$$
Delete white vertex $6$ with black neighbors ordered $(3,4,6)$. Mark black vertex $2$ with white neighbors ordered $(2,0,5)$. The matching table and its conjugate by swapping the first two labels are
$$
M_1=\begin{pmatrix}4&2&2\\3&3&2\\1&3&4\end{pmatrix},
\qquad M_0=\begin{pmatrix}3&3&2\\2&4&2\\3&1&4\end{pmatrix}.
$$
These nine counts are obtained by checking each permutation of seven columns, as in the [exact certificate](verify_intervals.py). The two tables are realized by the same graph with different attachments.

Write a signature as $v=(t+1,t,S-2t-1)^T$, where $S$ is its total. Applying either table preserves the first-minus-second difference $1$. Applied with digit $d\in\{0,1\}$ it gives
$$S'=8S,\qquad t'=2t+2S+d.$$
After $\ell$ steps, $S$ is independent of all digits, while $t$ ranges over an interval of exactly $2^\ell$ consecutive integers. Indeed its difference from the all-zero path is the integer with the chosen $\ell$ binary digits, in their application order.

## Initial and final graphs

Use the order-five circulant of shifts $(0,1,2)$ and the order-six circulant of shifts $(0,1,3)$. At a given vertex the matching counts in shift order are $(4,5,4)$ and $(6,5,6)$ respectively, by direct matching enumeration. For an initial graph reorder them to $(5,4,4)$ or $(6,5,6)$, both of the required signature form. At the final white vertex use the original shift order. The closure yields $4S+t$ for the order-five cap, or $6S-t$ for the order-six cap. Therefore every consecutive value of $t$ gives a consecutive permanent, with unit step.

An optional cube supplies three further vertices per side while preserving the unit difference. Take $K_{4,4}$ minus its diagonal, delete white $3$ with input neighbors $(1,2,0)$ and mark black $0$ with output neighbors $(2,1,3)$. Its exact matching table is
$$\begin{pmatrix}2&1&0\\1&2&0\\0&0&3\end{pmatrix}.$$
This gives $(S,t)\mapsto(3S,3t+1)$. The initial and terminal orders $(5,5),(6,5),(6,6)$ yield base orders $9,10,11$. The optional cube yields $12,13,14$. Taking the unique base congruent to the requested $n$ modulo six leaves exactly $\ell=\lfloor(n-9)/6\rfloor$ digit insertions. This proves the result and specifies the interval endpoints by the displayed recurrences. Independent enumeration of every resulting permanent in sample intervals through order $33$ checks 106 complete graph constructions.
