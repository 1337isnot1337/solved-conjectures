# Removing low-degree intersections without losing small-cut witnesses

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The high-degree set is the same for all pairs and all cuts; the
size of that set remains uncontrolled. This strengthens the
minimum-pair result to a statement about every original edge.

## A general avoidance lemma

Let \(\mathcal F\) be \(r\)-uniform with \(\tau(\mathcal F)>t\).
Suppose distinct edges meet in at least \(m\), where \(0<m<r\).
Write \(b=r/(r-m)\). For any integer \(1\le u\le t\), and
**any** set \(T\) of at most \(t-u\) points, at least \(b^u\)
distinct edges avoid \(T\).

Fix any edge \(A\). For each \(u\)-subset \(Y\subseteq A\),
some edge avoids \(T\cup Y\), whose size is at most \(t\).
Any such edge avoids at most \(\binom{r-m}{u}\) choices of
\(Y\), because it meets \(A\) in at least \(m\) points
(this also holds for the edge \(A\) itself). Hence
\[
|\{F:F\cap T=\varnothing\}|
 \ge \frac{\binom{r}{u}}{\binom{r-m}{u}}
 \ge b^u
\]
when \(u\le r-m\). If \(u>r-m\), no edge could avoid \(Y\),
so the assumptions already contradict \(\tau>t\).

## A simultaneous high-degree core

Fix an integer \(K\ge1\), and let \(H\) consist of points of
degree at least \(b^u/(2Kr)\). For any \(T\) as above and any
list \(F_1,\ldots,F_j\) of \(j\le K\) edges, at least
\(b^u/2\) choices of witness \(E\) avoid \(T\) and have
\[
E\cap F_i\subseteq H\qquad(1\le i\le j).
\]
Indeed, the union of the low-degree parts of those edges
has at most \(Kr\) points, and all edges incident with it
number fewer than \(b^u/2\). Subtract them from the first bound.

In particular:

1. Every original edge \(F\) has at least \(m+t-u\)
   high-degree points. Take \(T\) to be a largest
   subset of \(F\cap H\) of size at most \(t-u\)
   and use \(j=1\). The witness has at least \(m\)
   more high-degree points in \(F\), disjoint from \(T\).
   This forces \(|T|=t-u\) and gives the bound.
2. The trace family \(\{F\cap H:F\in\mathcal F\}\) has
   transversal number at least \(t-u+1\) (every small cut
   of \(H\) is missed by an original edge).
3. If \(K<b^u/2\), any prescribed cut \(T\) has a list of
   \(K+1\) distinct witnesses, pairwise intersecting only
   in \(H\). Choose them in order, each time excluding
   the at most \(K\) existing choices. One may start
   with a predetermined edge avoiding \(T\).
4. For every original edge \(F\), every subset of \(F\)
   of size at most \(t-u\) is missed by some trace
   \(E\cap F\subseteq H\) of size at least \(m\). Thus
   even on one fixed edge the family of intersections
   supported completely on the same high-degree set
   has transversal number at least \(t-u+1\).

For the first jump \(r=5t+1,\ m=t+1\), \(b\ge5/4\).
Taking \(u=\lfloor\epsilon t\rfloor\) for fixed
\(0<\epsilon<1\), and \(K\) polynomial in \(t\), makes
the degree threshold exponential in \(t\). The
[localized minimum-pair argument](HIGH-DEGREE-MINIMUM-CORES.md)
has a different advantage: it puts almost all individual
points of every minimum intersection in a high-degree set,
rather than simply putting at least \(m\) points of each
edge in it. Clearing low-degree padding is not yet a bound
on the rank of the projected family.
