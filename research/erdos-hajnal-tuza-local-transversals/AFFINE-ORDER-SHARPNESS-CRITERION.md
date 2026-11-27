# When the affine petal-order bound is sharp

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This gives a complete criterion for sharpness of the affine
leading constant under the **abstract single-pair petal axioms**.
It does not claim to determine the true optimal transversal
under all minimum-pair compatibility constraints.

Fix integers \(s\ge1,\delta\ge0\), let \(m=t+s\),
\(p=3t+2s-2\), and take any family of petals
\(\{W_S:S\in\binom{[m]}s\}\) satisfying
\[
p\le |W_S|\le p+\delta,\qquad
|W_S\cap W_T|\le\delta\quad(S\cap T=\varnothing).
\]
Write \(n=|\bigcup_S W_S|\), \(c=\delta/s^2\),
\(k=\lfloor1+\delta/(3s)\rfloor\), and
\[
L=\frac{6k/s-c}{k(k+1)}.
\]
The [affine lower bound](SHARPER-SLACK-PETAL-ORDER.md)
is \(n\ge(L-o(1))t^2\).
It is asymptotically sharp **if and only if**
\[
\boxed{\delta/s^2\ \text{is an integer}.}
\]
For a noninteger value there is a strictly positive gap
in the leading constant, not just failure of exact finite
equality. For an integer value, the
[two-stage Wilson construction](MULTI-STAR-ORDER-THRESHOLDS.md)
attains the leading constant for all sufficiently large \(t\).

## 1. The model at hypothetical equality

Assume \(n/t^2\to L\).
Use the [full-plus-partial-star decomposition](AFFINE-ORDER-DIVISIBILITY.md).
All but \(o(n)\) exterior points are represented by
\(k\) almost-full centers and at most one partial center.
For all but \(o(1)\) of the ordered disjoint cut pairs,
their shared-point count is exactly \(\delta\) and equals
\[
\sum_{x\in S,\ y\in T}g(x,y)
+\sum_{x\in S}q_T(x)+\sum_{y\in T}q_S(y).
\]
Here \(g(x,y)\) is the symmetric integer count of points
with both indices full centers and \(q_T(x)\) is the
integer count of points with full center \(x\) whose
partial support includes \(T\).
Both counts lie between \(0\) and \(\delta\).
For each \(x\), if \(q_T(x)>0\) then \(T\) contains
a partial center of a retained point with full center \(x\).
These statements were derived before the Ramsey step of
the cited proof and do not require its divisibility conclusion.

We show that if \(c\) is not an integer then
\(q_T(x)>0\) for almost all choices of \(x,T\).
The total number of ordered full–partial center pairs
will then be too large.

## 2. Approximate additivity

Independently sample \(X=(X_1,\ldots,X_s)\) and
\(Y=(Y_1,\ldots,Y_s)\) uniformly with replacement
from the \(m\) indices. Write \(q(x;Y)\) for \(q_T(x)\)
when \(T=\{Y_1,\ldots,Y_s\}\) has size \(s\) and \(x\notin T\);
define it as zero otherwise. Put \(g(x,x)=0\).
The exceptional repeated-index inputs have probability
\(O(1/m)\), so boundedness gives
\[
F(X,Y)=\sum_i q(X_i;Y)+\sum_j q(Y_j;X)
+\sum_{i,j}g(X_i,Y_j)=\delta+o_{L^2}(1).
\]
We first write \(q(x;Y)=\sum_j u(x,Y_j)+o_{L^2}(1)\)
for a uniformly bounded function \(u\).

Let \(\mu=\mathbb E q\), \(f(Y)=\mathbb E_x q(x;Y)\),
\(\alpha(x)=\mathbb E[q(x;Y)]-\mu\), and
\(\beta(y)=\mathbb E[q(X_1;Y)\mid Y_1=y]-\mu\).
Define the centered two-coordinate coefficient
\[
\gamma(x,y)=\mathbb E[q(x;Y)\mid Y_1=y]
              -\mu-\alpha(x)-\beta(y),
\]
and \(r(y)=\mathbb E_x g(x,y)\).
Conditioning \(F\) on \(Y\) yields
\[
f(Y)=\frac{\delta}{s}-\mu
      -\sum_j(\alpha(Y_j)/s+r(Y_j))+o_{L^2}(1).
\]
Conditioning instead on \(X_1=x,Y\) and subtracting the
conditional mean given \(Y\) alone yields
\[
q(x;Y)-f(Y)+s\beta(x)+\sum_j\gamma(Y_j,x)
 +\sum_j(g(x,Y_j)-r(Y_j))=o_{L^2}(1).
\]
Thus one may use the bounded function
\[
u(x,y)=\delta/s^2-\mu/s-\beta(x)-\alpha(y)/s
       -\gamma(y,x)-g(x,y).
\]
Substitution into \(F\) gives
\[
\sum_{i,j}K(X_i,Y_j)=\delta+o_{L^2}(1),
\qquad K(x,y)=g(x,y)+u(x,y)+u(y,x).
\]
In fact \(K(x,y)=c+o_{L^2}(1)\).
Its mean tends to \(c\) by taking expectations.
Conditioning the sum on \(X_1=x\) shows that the row mean
of \(K\) tends to \(c\) in \(L^2\). Conditioning further
on \(X_1=x,Y_1=y\) gives \(K(x,y)\) plus \(s-1\) row
means at each of \(x,y\), plus \((s-1)^2\) copies
of the global mean. Subtracting gives the assertion.

## 3. Nonintegrality forces positive partial contributions

Nonnegativity of \(q\) implies that for each fixed
\(\epsilon>0\), the probability of \(u(x,y)<-\epsilon\)
tends to zero. Otherwise the probability that \(s\)
independent selections in one row all satisfy this is
bounded below by the \(s\)-th power of the overall
probability, by Jensen. On that event
\(\sum_j u(x,Y_j)<-s\epsilon\), contrary to approximation
by \(q\ge0\).

Similarly, replacing a single independent \(Y_j\)
gives that the distance of \(u(x,y)-u(x,y')\)
to the integers is \(o(1)\) in probability, since the
comparison is between two integer values of \(q\).
Suppose \(c\) is not an integer and choose
\(0<\eta<\operatorname{dist}(c,\mathbb Z)/8\).
We claim the fraction of pairs with \(u(x,y)\le\eta\)
tends to zero.

Otherwise, after removing the negligible lower tail
\(u<-\eta\), a positive fraction of rows \(x\) each
has a positive fraction of entries in \([-\eta,\eta]\).
The near-integrality of row differences then implies
that in all but a negligible fraction of those rows,
all but a negligible fraction of entries are within
\(2\eta\) of an integer. Explicitly, for such a row
the probability of a bad difference is at least the
product of its positive fraction of entries within
\(\eta\) of zero and its fraction of entries farther
than \(2\eta\) from all integers. Averaging the bad
difference probability proves the assertion.

On a positive fraction of random pairs of such rows
\(x,y\), both \(u(x,y)\) and \(u(y,x)\) are within
\(2\eta\) of integers. Since \(g(x,y)\) is integral,
their sum with \(g(x,y)\) is within \(4\eta\) of
an integer. This contradicts \(K(x,y)\to c\) in
probability. The claim follows, and therefore
\(q(x;Y)>0\) with probability \(1-o(1)\) by
its additive approximation.

## 4. There are too many ordered center pairs

For each \(x\), let \(D_x\) be the set of partial
centers of retained points that have \(x\) as one
of their full centers. The positivity result says
a random \(s\)-cut meets \(D_x\) for almost all \(x,T\).
If a positive fraction of \(x\)'s had \(|D_x|\)
at most \((1-\epsilon)m\), a fixed positive fraction
of cuts on those rows would avoid \(D_x\).
Consequently \(\sum_x |D_x|\ge(1-o(1))m^2\).
A retained exterior point contributes at most \(k\)
distinct ordered center pairs, so \(k n\ge(1-o(1))m^2\).
But
\[
kL=\frac{6k/s-c}{k+1}\le\frac3s .
\]
For \(s\ge4\) this is strictly below one.
For \(s=3\), equality would require
\(c=3(k-1)/s=k-1\), an integer; again it is strictly
below one in the case at hand. Thus equality order
is impossible for \(s\ge3\) at noninteger \(c\).

When \(s=2\), the earlier
[Ramsey divisibility obstruction](AFFINE-ORDER-DIVISIBILITY.md)
requires \(\delta\) to be a multiple of \(4=s^2\).
When \(s=1\) there is no noninteger case.
Together with the design upper bound this completes
the abstract sharpness criterion.
