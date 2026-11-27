# Larger cores and forced four-fold padding overlap

Partial progress on [Erdős–Hajnal–Tuza’s local transversal problem](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The [minimum-rank rigidity lemma](MINIMUM-RANK-RIGIDITY.md)
does not extend even one rank higher. Nevertheless one can
rule out beating the classical construction with any of
a wider class of cores unless their padding shares vertices
between four distinct edges.

## A span test independent of core structure

Let \(\mathcal F\) be \(r\)-uniform, satisfy the local span
condition, and have \(\tau>t\). Let \(M\) be a fixed set
of \(n\le4t\) points, with every edge meeting \(M\)
in at least \(k\) points, and suppose that every nonempty collection of at most three
edges has common intersection **in \(M\)**. Put
\[
 b=\left\lfloor\frac{4t-n}{3}\right\rfloor.
\]
Assume \(0\le b\le\min(n,t)\). For **each** \(b\)-set
\(B\subseteq M\), there exist four distinct edges whose
common intersection in \(M\) is empty and whose M-parts
all miss \(B\). If
\[
 r<4k-n+b-2 ,
\]
these four edges have a common vertex outside \(M\).
In particular, if every outside vertex belongs to at most
three edges, the reverse inequality \(r\ge4k-n+b-2\) is
necessary.

Indeed, split \(M\setminus B\) into four possibly empty
parts, each of size at most \(t-b\). This is possible
because \(n+3b\le4t\). For each part choose an edge avoiding
its union with \(B\), using \(\tau>t\); fewer than \(t\)
forbidden vertices are also allowed. The four chosen
edges have no common point of \(M\). They are distinct:
otherwise the distinct chosen edges would be a collection of
at most three with no common point of \(M\). The span of the four edges is at most
\[
 (n-b)+4(r-k).
\]
If the strict inequality above holds, this is at most
\(3r-3\), so the local condition forces common padding.
No assumption on pairwise or triple padding intersections
was used.

For \(k=2t+1+h\), \(n=3t+1+a\) with nonnegative
\(a,h\), \(a\le3h\), and \(n\le4t\), the lower bound
in the absence of four-fold padding is
\[
 r\ge5t+1+4h-a+\left\lfloor\frac{t-1-a}{3}\right\rfloor
 \ge5t+1+\left\lfloor\frac{t-1}{3}\right\rfloor .
\]
For the second inequality subtract the right-hand side
and use \(4h-a-\lceil a/3\rceil\ge0\).
Thus this broader class cannot improve the known
[construction threshold](https://doi.org/10.1016/0097-3165(91)90074-Q).
The claim applies to arbitrary core families in the
displayed range, not only complete families or cores
that contain the minimum-rank complete core.

## Stronger triple constraint when the span is short

Suppose also \(n\ge3t+1\). Write
\(d=4t-n-3b\in\{0,1,2\}\).
Take any \(b\)-set \(B\) and split \(M\setminus B\)
into \(P_1,P_2,P_3,P_4\) with
\(|P_1|=|P_2|=|P_3|=t-b\) and
\(|P_4|=t-b-d\). The sizes are admissible because
\(n-3t+2b\ge1\) is the size of \(P_4\). Choose any three
edges \(E_i\) avoiding \(B\cup P_i\), \(1\le i\le3\).
Below the displayed threshold, their common padding
has size at least \(b+d+1\), not just one.

In fact, let \(C=(E_1\cap E_2\cap E_3)\setminus M\)
have size \(j\le b+d\). Choose a fourth edge avoiding
\(P_4\cup C\) and as many elements of \(B\) as the
remaining \(t\)-vertex budget allows. This choice
spends at most \(t\) in total and omits at least
\(b-\max(0,j-d)\) points of \(B\).
No point of \(M\) is in all four edges, because the
four \(P_i\)'s and \(B\) are covered by their omissions.
The three-wise core assumption again ensures all
four edges are distinct. Their original intersection
outside \(M\) is empty by the avoidance of \(C\).
The union of their core portions is at most
\(n-b+\max(0,j-d)\), and their outside union is at
most \(4(r-k)-2j\) because each point of \(C\) was
counted three times. Thus the total is at most
the original short span \(n-b+4(r-k)\), a contradiction.

Even when \(r=4k-n+b-2+e\) for some \(e\ge0\),
the same calculation excludes the whole middle interval
\(e<j\le b+d\): the net saving is at least \(j\),
so the span is at most \(3r-3\).

## Rank +1 can have no fixed dense core

Let \(t\ge3\), \(q=t+1\), and \(|M|=3q\).
Choose \(X\subset M\) of odd size between \(q\) and \(2q\).
Let \(\mathcal D\) comprise all \(q\)-sets with
\(|D\cap X|\) even, and take their complements in \(M\)
as the core family \(\mathcal H\) of rank \(2q=2t+2\).
This uses the standard [parity divisibility barrier for
perfect matchings](https://arxiv.org/abs/1307.2608).

* Every \(t\)-set extends to a member of \(\mathcal D\):
  add an unused element of \(X\) to change the parity
  if needed, and add one outside \(X\) otherwise.
  Each part has size at least \(q\). Thus \(\tau(\mathcal H)>t\).
  An odd-parity \(q\)-set hits every core edge, so in fact
  \(\tau(\mathcal H)=t+1\).
* If three members of \(\mathcal D\) covered \(M\), they
  would partition it, since each has size \(q\). Their
  \(X\)-counts cannot then sum to the odd number \(|X|\).
  Thus \(\mathcal H\) is 3-wise intersecting.
* Any two points of \(M\) lie in a member of \(\mathcal H\).
  Delete them and choose any \(q\)-set among the remaining
  points. If its \(X\)-count is odd, swap one selected
  point for one unselected point of the opposite type.
  Such a cross-type pair exists because both types are
  still present and both the selected and unselected sets
  are nonempty. The complement of the adjusted set
  contains the deleted pair.

Consequently every \((3t+1)\)-subset of \(M\) misses two
points lying together in some edge of \(\mathcal H\).
That edge meets the proposed dense core in just \(2t\)
points. Taking a \((3t+1)\)-set partly outside \(M\)
cannot help, since its intersection with \(M\) can be
enlarged inside \(M\). Thus the previous fixed-core
hypothesis is **false** already one rank above minimum.

For this example \(h=1,a=2\). The span test still
excludes any private-padding improvement, with the
stronger necessary inequality
\[
 r\ge5t+3+\left\lfloor\frac{t-3}{3}\right\rfloor .
\]
This is a construction obstruction, not a solution
of the unrestricted problem. It separates two possible
follow-ups: prove that prospective cores carry required
four-fold padding, or prove that enforcing that much
shared padding creates a small transversal.
