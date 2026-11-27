# Large almost-disjoint petals at the local-transversal threshold

Partial research on [Erdős–Hajnal–Tuza's local transversal
problem](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This result uses no dense-core hypothesis and holds uniformly in
the parameters. It does not determine the unrestricted optimum.

Let \(\mathcal F\) be \(r\)-uniform, with \(r\ge3,t\ge1\), and assume any subfamily with
union of size at most \(3r-3\) has a common vertex. Suppose
\(\tau(\mathcal F)>t\) and \(r\le(11t+1)/2\). Let \(m\) be the
minimum intersection size of two distinct edges. Then
\[
m=t+s,\qquad
1\le s\le\left\lfloor\frac{r-5t+2}{3}\right\rfloor.
\]
This narrow range can be read from the EHT proof; we rederive it
elementarily to state the additional quantitative structure.

Fix edges \(A,B\) with \(X=A\cap B\) of size \(m\).
Choose \(\ell=\lfloor m/s\rfloor\) disjoint \(s\)-sets in \(X\),
and for each such set \(S_i\) an edge \(E_i\) avoiding \(X-S_i\).
Write \(W_i=E_i\setminus(A\cup B)\) for their exterior petals.
Put \(p=3t+2s-2\) and \(\delta=r-5t-3s+2\), where \(\delta\ge0\).
Then
\[
|W_i|\ge p,\qquad |W_i\cap W_j|\le\delta\quad(i\ne j),
\qquad
\left|\bigcup_i W_i\right|
 \ge \frac{\ell p^2}{p+(\ell-1)\delta}.
\]
In particular, **any** example just above the EHT upper-bound
jump, with \(r=5t+1\) and \(\tau>t\), uses at least
\(3t^2+12t+1\) vertices. It has \(t+1\) outside petals of size
\(3t\) that are pairwise disjoint. The lower bound is a
structural consequence for all \(t\), not an enumeration at
one \(r\).

## 1. The minimum pair range

Two edges have union of size at most \(2r\le3r-3\), so \(m\ge1\).
For any two edges \(A',B'\), their intersection is a transversal.
Indeed if \(E\) missed their intersection then its intersections
with them would be disjoint, each of size at least \(m\).
The union of these three edges would have size at most
\(3r-3m\le3r-3\), while their intersection would be empty.
In particular \(m\ge\tau(\mathcal F)>t\).

Put \(q=\lceil m/t\rceil\ge2\). Cover \(X\) by \(q\) subsets of
size exactly \(t\), padding the last within \(X\) if necessary.
For each take an edge \(E\) avoiding that subset. If
\(a=|E\cap X|\), then
\[
|E\setminus(A\cup B)|\le r-2m+a \le r-m-t.
\]
The first inequality follows because \(E\) meets each of \(A,B\)
in at least \(m\) points. Since the chosen \(q\) edges together
with \(A,B\) have no common point, the local condition yields
\[
q(r-m-t)+2r-m>3r-3.
\]
For fixed \(q\) the difference on the left of the threshold is
\((q-1)r-(q+1)m-qt+3\), decreasing in \(m\).
If \(q\ge3\), plug in \(m\ge(q-1)t+1\) and
\(r\le(11t+1)/2\). The result is at most
\[
-(q-3)(q-3/2)t+(3-q)/2\le0 .
\]
Thus \(q=2\), and writing \(m=t+s\) gives
\(r-5t-3s+3>0\), the claimed integer range.

## 2. Petals and exact accounting

Such an edge \(E_i\) exists by \(\tau>t\) because \(|X-S_i|=t\).
Its \(X\)-residue is nonempty, since \(X\) is a transversal.
The residues are disjoint, so the \(E_i\)'s are distinct.
Writing \(a_i=|E_i\cap X|\le s\) gives
\[
w_i:=|W_i|\le r-2m+a_i\le r-2m+s.
\]
For \(i\ne j\), the four edges \(A,B,E_i,E_j\) have empty
intersection. Their union is \(A\cup B\) together with
\(W_i\cup W_j\), hence
\[
|W_i\cup W_j|\ge(3r-2)-(2r-m)=r+m-2.
\]
Using \(w_j\le r-2m+s\) yields \(w_i\ge3m-s-2=p\);
using both upper bounds yields
\(|W_i\cap W_j|\le r-5m+2s+2=\delta\).
Here \(\ell\ge2\), since \(q=2\) and \(m>2s\).
The overlapping portions of the \(E_i\)'s in the two wings of
\(A\cup B\) must also have size at least \(m-\delta\): their
entire pair intersection has size at least \(m\), their
\(X\)-residues are disjoint, and their outside intersection
has size at most \(\delta\).

For the union estimate, let \(d_x\) count the number of petals
containing \(x\), and \(Q=\sum_x d_x\ge\ell p\).
Then
\[
\sum_x d_x^2=Q+2\sum_{i<j}|W_i\cap W_j|
\le Q+\ell(\ell-1)\delta.
\]
Cauchy–Schwarz gives a union size at least
\(Q^2/(Q+\ell(\ell-1)\delta)\). This is increasing in \(Q\)
and at \(Q=\ell p\) gives the claimed bound.
At \(r=5t+1\) we necessarily have \(s=1\), \(p=3t\),
\(\ell=t+1\) and \(\delta=0\). Adding the size
\(2r-m=9t+1\) of \(A\cup B\) gives the displayed order bound.

[Original paper](https://doi.org/10.1016/0097-3165(91)90074-Q),
Theorems 3 and 6. The extremal problem remains whether outside
sharing can meet these requirements for all possible minimum
pairs and all choices of petals simultaneously.

## 3. Use all cuts of the minimum intersection

One can replace the floor \(\ell=\lfloor m/s\rfloor\) in the
union bound by \(m/s\), by selecting one edge \(E_S\) avoiding
\(X-S\) for **every** \(s\)-set \(S\subset X\). With the notation
above, their full exterior union satisfies
\[
\left|\bigcup_{S\in\binom Xs} W_S\right|
 \ge \frac{m p^2}{(m-s)\delta+s p}.
\]
In the exact case \(\delta=0\), equality forces a partition
of the exterior vertices into equal-size pools indexed by
\(X\), where \(W_S\) is the union of the pools indexed by \(S\).

For the proof use the Kneser graph \(K(m,s)\), whose vertices are
the \(s\)-sets of \(X\) and whose edges join disjoint sets.
It is regular with degree \(d=\binom{m-s}{s}\) and has least
eigenvalue \(-sd/(m-s)\). Here is a direct check. For a fixed
\(j\)-set \(R\), put \(f_R(S)={\bf 1}_{R\subseteq S}\). The
spaces \(U_j\) spanned by the \(f_R\)'s for \(|R|=j\) are nested,
by summing over all one-element extensions of each \(R\).
The adjacency operator sends \(f_R\) to
\[
\binom{m-s-j}{s-j}\,{\bf 1}_{R\cap S=\emptyset}
=\binom{m-s-j}{s-j}\sum_{Q\subseteq R}(-1)^{|Q|}f_Q(S).
\]
Thus on \(U_j/U_{j-1}\) it acts by
\((-1)^j\binom{m-s-j}{s-j}\). As \(U_s\) is the full space
and the absolute binomial factors decrease with \(j\), the
first negative eigenvalue, at \(j=1\), is least. Its ratio
to \(d\) is \(-s/(m-s)\).

For an exterior vertex \(w\), let
\(F_w=\{S:w\in W_S\}\) and \(f_w=|F_w|/\binom ms\).
Decomposing its indicator into a constant vector and an orthogonal
part, the Rayleigh bound gives
\[
\frac{2e(K(m,s)[F_w])}{d\binom ms}
\ge f_w^2-\frac{s}{m-s}f_w(1-f_w).
\]
Each disjoint pair \(S,T\) has at most \(\delta\) shared exterior
vertices. Thus the sum of the left sides over \(w\) is at most
\(\delta\). Setting \(Q=\sum_w f_w\), this implies
\[
\sum_w f_w^2\le (1-s/m)\delta+(s/m)Q .
\]
Every \(W_S\) has size at least \(p\), so \(Q\ge p\).
Cauchy–Schwarz and monotonicity of
\(Q^2/((1-s/m)\delta+(s/m)Q)\) give the new bound.

If \(\delta=0\), each \(F_w\) is an intersecting \(s\)-family.
Equality in the union bound implies all \(W_S\) have size \(p\)
and all nonempty \(F_w\) have proportion exactly \(s/m\).
As \(m>2s\), the equality case of Erdős–Ko–Rado implies every
\(F_w\) is a full star; see, for example, the formulation in
[On the stability of the Erdős–Ko–Rado theorem](https://www.sciencedirect.com/science/article/pii/S009731651500103X).
Allocate \(w\) to the pool of that star's center. Every \(s\)-set
then indexes pools whose total size is \(p\). Comparing two
\(s\)-sets that differ in one element shows that all pool sizes
are equal, necessarily \(p/s\). In particular, if \(s\) does
not divide \(p\), equality is impossible.
