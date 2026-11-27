# The small-slack affine bound is never attained for cut size at least three

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This closes the last small-slack gap in the abstract
order argument: for every fixed \(s\ge3\) and
\(0<\delta<3s\), the affine leading lower constant
\(3/s-\delta/(2s^2)\) is strictly unattainable.

Use the same abstract size and overlap axioms as
[the strict-gap note](STRICT-SLACK-ORDER-GAP.md).
By the [Ramsey divisibility obstruction](AFFINE-ORDER-DIVISIBILITY.md),
the only remaining possible slack in this range is
\(\delta=2s\). It is enough to exclude a sequence with
\(n/t^2\to2/s\) in that case.

## 1. The almost-everywhere identity

At \(\delta=2s\), the affine piece has \(k=1\).
By [the full-plus-partial-star reduction](AFFINE-ORDER-DIVISIBILITY.md),
we may keep a collection of exterior points, each with
one designated almost-full center and one designated
partial center, so that for all but \(o(1)\) of the ordered
disjoint cut pairs \((S,T)\),
\[
\sum_{x\in S}q_T(x)+\sum_{y\in T}q_S(y)=2s.
\]
Here \(q_T(x)\in\{0,\ldots,\delta\}\) counts retained
points centered at \(x\) whose partial support includes
\(T\). In particular \(q_T(x)>0\) implies \(T\) contains
a partial center of a point with full center \(x\).

Sample \(X_1,\ldots,X_s,Y_1,\ldots,Y_s\) independently
and uniformly in the \(m\)-set. Repeated samples have
probability \(o(1)\); define \(q(x;Y)\) to be zero on
these degenerate inputs and otherwise \(q_T(x)\) for
\(T=\{Y_1,\ldots,Y_s\}\).
Since all terms are bounded, the identity becomes
\[
F(X,Y)=\sum_i q(X_i;Y)+\sum_j q(Y_j;X)
      =2s+o_{L^2}(1).
\]
All asymptotics are as \(m\) tends to infinity, with \(s\)
fixed.

## 2. An additive antisymmetric form

Write \(\mu=\mathbb E q=1+o(1)\). Define the centered
conditional coefficients
\[
\begin{aligned}
\alpha(x)&=\mathbb E[q(x;Y)]-\mu,\\
\beta(y)&=\mathbb E[q(X;Y)\mid Y_1=y]-\mu,\\
\gamma(x,y)&=\mathbb E[q(x;Y)\mid Y_1=y]
              -\mu-\alpha(x)-\beta(y).
\end{aligned}
\]
Both one-coordinate marginals of \(\gamma\) vanish.
Let \(f(Y)=\mathbb E_X q(X;Y)\). Conditioning the
identity on \(Y\) gives
\(s f(Y)+s\mu+\sum_j\alpha(Y_j)=2s+o_{L^2}(1)\),
so \(f(Y)=\mu-s^{-1}\sum_j\alpha(Y_j)+o_{L^2}(1)\).
Conditioning on \(X_1=x,Y\) and subtracting the
conditional mean given only \(Y\) gives
\[
q(x;Y)-f(Y)+s\beta(x)+\sum_j\gamma(Y_j,x)
=o_{L^2}(1).
\]
Indeed the other \(s-1\) terms of the first sum
average to \((s-1)f(Y)\), and the terms of the second
sum are the two-coordinate conditional expectations.
Taking the conditional mean given \(x\) now yields
\(\alpha(x)+s\beta(x)=o_{L^2}(1)\).
Projecting this same formula onto the two-coordinate
interaction of \(x,Y_1\) yields
\(\gamma(x,y)+\gamma(y,x)=o_{L^2}(1)\):
the other terms have no interaction in those two variables.
Equivalently, the projection subtracts the two
one-coordinate conditional means and adds the global mean.

Combining gives
\[
q(x;Y)=1+\sum_j h(x,Y_j)+o_{L^2}(1),
\quad
h(x,y)=\beta(y)-\beta(x)+\tfrac12(\gamma(x,y)-\gamma(y,x)).
\]
The function \(h\) is bounded uniformly and exactly
antisymmetric.

## 3. Integrality eliminates the antisymmetric part

Nonnegativity of \(q\) first forces, for every fixed
\(e>0\), the fraction of pairs with \(h(x,y)<-1/s-e\)
to tend to zero. Otherwise if that fraction were at
least \(\rho>0\), Jensen's inequality would give
probability at least \(\rho^s\) that \(s\) independent
samples in the same row all satisfy the inequality.
On that event \(1+\sum_j h(x,Y_j)<-se\), contrary
to its \(L^2\) approximation by \(q\ge0\).
Antisymmetry gives the corresponding upper-tail bound.
Thus \(h(x,y)\) is in
\([-1/s-e,1/s+e]\) with probability \(1-o(1)\).

Replace just one \(Y_j\) by an independent \(y'\),
keeping \(x\) and the other \(s-1\) samples fixed.
The difference \(h(x,y)-h(x,y')\) is within
\(o(1)\) in probability of an integer, because
it is approximated by the difference of two integer
values of \(q\). For \(s\ge3\) choose \(e>0\)
so the displayed interval has width strictly below
1. It follows that \(h(x,y)-h(x,y')\to0\)
in probability and in \(L^2\), by boundedness.
This says the mean row variance is \(o(1)\).
Hence \(h(x,y)=a(x)+o_{L^2}(1)\) for its row
mean \(a\). Antisymmetry gives
\(a(x)+a(y)=o_{L^2}(1)\); since \(x,y\) are
independent, this implies \(a=o_{L^2}(1)\).
Therefore \(q(x;Y)=1+o_{L^2}(1)\), and in particular
\(q_T(x)>0\) for a \(1-o(1)\) fraction of pairs \(x,T\).

## 4. The center count contradicts the order

For each \(x\), let \(D_x\) be the set of partial
centers of retained points whose full center is \(x\).
A cut disjoint from \(D_x\) has \(q_T(x)=0\).
If some fixed positive fraction of indices \(x\)
had \(|D_x|\le(1-\epsilon)m\) for some fixed
\(\epsilon>0\), then a fixed positive fraction of
the choices of \(x,T\) would have \(T\cap D_x=\varnothing\).
This contradicts the preceding conclusion.
Consequently \(\sum_x|D_x|\ge(1-o(1))m^2\).
Each retained exterior point has only one full and one
partial center, so contributes at most one ordered pair
to this count. Thus \(n\ge(1-o(1))m^2\),
contradicting \(n/t^2\to2/s<1\).

The lower bound therefore has a positive asymptotic
gap at \(\delta=2s\) as well. This completes the
nonattainment result for all \(0<\delta<3s\) and
\(s\ge3\), not the computation of the sharp constant.
