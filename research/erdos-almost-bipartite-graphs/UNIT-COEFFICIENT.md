# The shift construction meets the literal budget at every order

The [higher-shift orientation theorem](HIGHER-SHIFT-BIPARTIZATION.md)
gives $C_k n^{1+1/k}$ with $C_k=2^{k-1}$. Erdős's 1981 statement
asks for fewer than $n^{1+\epsilon}$ deleted edges at *every*
finite order. The coefficient can be removed without dropping a
finite range of orders. This does not by itself resolve the exact
chromatic cardinal in ZFC.

Let $d_k(n)$ be the worst, over all $n$-vertex induced subgraphs of a
$k$-shift, of the minimum monochromatic outdegree bound achievable
by two-coloring and orienting the monochromatic edges. Because a
finite set of tuples order-embeds in a shift on $\omega$, the choice
of infinite ground ordinal does not affect $d_k(n)$. The preceding
orientation lemma gives
$$
d_k(n)\le 2^{k-1} n^{1/k}.
$$
It also gives a refined recursive step for any real $T>0$. Given an
induced subgraph on $n$ vertices, identify it with arcs of the lower
shift and use the same heavy-center definition with threshold $T$.
There are at most $n/T$ heavy centers. If their actual number is $m$,
the new orientation has outdegree at most $2\max(T,d_{k-1}(m))$.
For $m=0$ use $d_{k-1}(0)=0$. In particular, a witnessed violation
of an outdegree bound $2T$ forces some $m$ with
$$
1\le m\le n/T,\qquad d_{k-1}(m)>T. \tag{1}
$$

Fix $0<\delta<1$. Set $q=1-\delta/2$. Choose an integer $N>1$ so
large that for $n\ge N$,
$$
 2n^{1-\delta}\le n^q,\qquad n^{q\delta}\le n^\delta/2.
$$
For example $N=\lceil 2^{2/\delta^2}\rceil$ works.
Taking $T=n^\delta/2$ in (1), a violation $d_k(n)>n^\delta$
at $n\ge N$ gives a violation $d_{k-1}(m)>m^\delta$ with
$1\le m\le n^q$.

Now choose $k$ sufficiently large so that
$$
 k\ge \max(N,2/\delta),\qquad
 q^{k-N}(2k\log 2/\delta) < \log N.
$$
Suppose there is a violation $d_k(n)>n^\delta$. The crude bound
with $2^{k-1}$ implies $\log n<2k\log 2/\delta$. Descend using
(1) while the current order is at least $N$. In at most
$k-N$ steps the order is below $N$: if all these steps are needed,
the log of the resulting order is at most
$q^{k-N}(2k\log 2/\delta)<\log N$. The remaining shift index
is at least $N$. But a shift of index $j$ has no odd cycle of
length at most $2j-1$ (e.g. Hajnal's [lecture notes](https://www.mathtube.org/sites/default/files/lecture-notes/Hajnal.pdf),
Fact 1 following Definition 42). Its induced subgraph of order
less than $N$ is bipartite, contradicting the surviving violation.

Thus, for every $0<\delta<1$, choosing the index large enough makes
$d_k(n)\le n^\delta$ for **every** $n$. For Erdős's strict budget take
$\delta<\epsilon$ (and less than 1). For $n>1$ the number of
monochromatic edges is at most $n^{1+\delta}<n^{1+\epsilon}$,
and for $n=1$ it is zero. Infinite shifts of that index have
arbitrarily large chromatic cardinal. This settles the all-orders
numerical wording in the arbitrarily-large-cardinal form.
