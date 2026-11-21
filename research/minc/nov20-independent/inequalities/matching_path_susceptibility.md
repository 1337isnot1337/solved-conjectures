# Alternating paths and the remaining susceptibility gap

Date: 20 November 2026 (America/Chicago).

Status: exact reductions and an obstruction to a scalar moment argument.
This note proves neither the restricted susceptibility comparison nor
Hwang's or Lih-Wang's conjecture. It contributes zero completed full
Minc entries.

## 1. A positive path expansion for the variance

Let $`A=(a_{ij})`$ be doubly stochastic of order $`m`$. Give edge $`ij`$
of its bipartite support weight $`w_{ij}=za_{ij}`$, with $`z>0`$.
Write $`Z(G)`$ for the matching partition function. Under the matching
measure, let $`K`$ be matching size, let $`\mu=\mathbb E K`$, and let
$`V=\operatorname{Var}K`$.

Let $`X_i`$ and $`Y_j`$ indicate that the two respective vertices are
unmatched. Every matching leaves the same number of vertices unmatched
in the two parts, so

~~~math
m-K=\sum_iX_i=\sum_jY_j,
\qquad
V=\sum_{i,j}\operatorname{Cov}(X_i,Y_j).                      \tag{1}
~~~

The weighted Christoffel-Darboux identity, proved by alternating-path
switching in the repository's
[matching monotonicity note](../../inequalities/hwang_matching_monotonicity.md),
says

~~~math
\operatorname{Cov}(X_i,Y_j)
=\sum_{P:i\leadsto j}
\left(\prod_{e\in P}w_e\right)
\left(\frac{Z(G-V(P))}{Z(G)}\right)^2.                       \tag{2}
~~~

The paths are simple. They have odd length because their endpoints are
in opposite bipartition classes. Thus every summand is nonnegative.
Summing (2) gives the exact positive expansion

~~~math
\boxed{\quad
V=\sum_{\substack{P\ \text{simple}\\
                  P:\text{left}\leadsto\text{right}}}
z^{|P|}\left(\prod_{e\in P}a_e\right)
\left(\frac{Z(G-V(P))}{Z(G)}\right)^2.
\quad}                                                       \tag{3}
~~~

Each path is oriented from its left endpoint to its right endpoint and
appears once.

## 2. What the one-edge terms already prove

Let $`p_{ij}`$ be the probability that edge $`ij`$ belongs to the matching.
For every positive entry,

~~~math
p_{ij}=za_{ij}\frac{Z(G-i-j)}{Z(G)}.
~~~

Keeping only paths of length one in (3), followed by weighted
Cauchy-Schwarz, yields

~~~math
V\ge\sum_{a_{ij}>0}\frac{p_{ij}^2}{za_{ij}}
\ge\frac{\left(\sum_{i,j}p_{ij}\right)^2}
         {z\sum_{i,j}a_{ij}}
=\frac{\mu^2}{zm}.                                         \tag{4}
~~~

This holds at every positive activity, without an activity cutoff.

Write $`q=\mu/m`$. The proposed comparison

~~~math
V\ge\frac{mq(1-q)}{1+q}                                    \tag{5}
~~~

therefore holds whenever

~~~math
q(1+q)\ge z(1-q),
\quad\text{equivalently}\quad
q\ge q_*(z):=
\frac{\sqrt{(1+z)^2+4z}-(1+z)}2.                            \tag{6}
~~~

In particular, at $`z=2`$ the sufficient condition is

~~~math
q\ge\frac{\sqrt{17}-3}{2}.
~~~

The previous monotonicity theorem gives the strict lower bound

~~~math
q>t(z):=\frac{\sqrt{1+4z}-1}{\sqrt{1+4z}+1}
\qquad(0<z\le2).
~~~

It follows that the unresolved part of (5) is contained in the interval
$`t(z)<q<q_*(z)`$. This interval is nonempty: substituting
$`z=t/(1-t)^2`$ gives

~~~math
t(1+t)-z(1-t)=-\frac{t^3}{1-t}<0.
~~~

At $`z=2`$ it is the interval between $`1/2`$ and
$`(\sqrt{17}-3)/2`$. To close it using (3), one must control a sufficient
aggregate contribution from longer paths. No such bound is proved here.

## 3. Even strengthened scalar root constraints are insufficient

The matching-root representation writes

~~~math
R_A(z)=\prod_{\ell=1}^m(1+z\lambda_\ell),
\qquad
q=\frac1m\sum_\ell\frac{z\lambda_\ell}{1+z\lambda_\ell},
\qquad
\frac Vm=\frac1m\sum_\ell
\frac{z\lambda_\ell}{(1+z\lambda_\ell)^2}.
~~~

For weighted degree one the squared roots lie in $`[0,4]`$. Their mean
is one. Catalan upper bounds for the moments were already considered in
this investigation. The following exact probability law shows that
adding several natural extra scalar constraints still does not establish
(5):

| Root square | Mass |
|---|---:|
| $`1/100`$ | $`29/119`$ |
| $`6/5`$ | $`1681/2380`$ |
| $`3`$ | $`1/20`$ |

This is an abstract law. It is not asserted to be the matching-root law
of any doubly stochastic matrix.

Write $`M_k`$ for its $`k`$th moment. Direct rational calculation gives

~~~math
M_1=1,\qquad
M_2=\frac{14671}{10000}<2,\qquad
M_3=\frac{2570491}{1000000}<\frac{14}{3}.                    \tag{7}
~~~

It obeys all Catalan upper moment bounds. Indeed, for $`k\ge3`$ its
support is at most three, so

~~~math
M_k\le3^{k-3}M_3<\frac{14}{3}3^{k-3}.
~~~

For the Catalan numbers $`C_k`$, one has
$`C_3=5`$, $`C_4=14`$, and
$`C_{k+1}/C_k=2(2k+1)/(k+2)\ge3`$ for $`k\ge4`$.
These facts imply $`M_k<C_k`$ for every $`k\ge3`$; the lower moments are
already covered by (7).

There is also an exact third-moment constraint specific to doubly
stochastic matching polynomials. If

~~~math
S_j=\sum_{i,j'}a_{ij'}^{\,j},
~~~

then expanding the first three rook coefficients and using Newton's
identities gives

~~~math
\frac1m\sum_\ell\lambda_\ell^2=2-\frac{S_2}{m},
\qquad
\frac1m\sum_\ell\lambda_\ell^3
=5-\frac{6S_2}{m}+\frac{2S_3}{m}.                            \tag{8}
~~~

For completeness, the cubic rook coefficient used here is

~~~math
6\sigma_3(A)
=m^3-6m^2+10m+3mS_2-12S_2+4S_3.
~~~

Weighted Cauchy-Schwarz gives $`mS_3\ge S_2^2`$. Hence every actual
matching-root law satisfies

~~~math
M_3\ge2M_2^2-2M_2+1.                                      \tag{9}
~~~

The displayed abstract law satisfies this constraint too:

~~~math
M_3-\left(2M_2^2-2M_2+1\right)
=\frac{9996309}{50000000}>0.
~~~

It also has a logarithmic mean greater than $`-1`$. The elementary bounds
$`\log 10<7/3`$, $`\log(6/5)\ge1/6`$, and $`\log3>1`$ give

~~~math
\mathbb E\log\lambda
>-\frac{29}{119}\frac{14}{3}
+\frac{1681}{2380}\frac16+\frac1{20}
=-\frac{923}{952}>-1.                                     \tag{10}
~~~

The first of those bounds follows, for example, by retaining the terms
through degree six in the exponential series for $`e^{7/3}`$.
The other two follow from $`\log(1+x)\ge x/(1+x)`$ and $`e<3`$.

Nevertheless, at $`z=2`$ the law gives

~~~math
q=\frac{33149}{60690}>\frac12,\qquad
\frac Vm=\frac{3411241}{21666330},
~~~

and

~~~math
\frac Vm-\frac{q(1-q)}{1+q}
=-\frac{2909032607}{1016573370435}<0.                        \tag{11}
~~~

Thus even the support restriction, mean, every Catalan upper moment,
the exact consequence (9), the logarithmic lower bound in (10), and
the occupancy comparison at the activity in question do not imply (5).
A proof must retain more of the matching structure.

## 4. Scope and sources

The path identity and its matching interpretation are classical; the
repository note cited above gives the weighted switching proof and its
primary references. Equation (4), the exact remaining occupancy interval,
and the strengthened scalar obstruction are deductions recorded here.
No novelty claim is made for them.

The [susceptibility bridge](susceptibility_bridge.md) explains exactly
what a proof of (5) on $`0<z\le2`$ would imply. It would establish
convexity of the doubly stochastic padding limits. It would not by itself
prove every finite permanent path or the full Lih-Wang chord inequality.
The [live C34 statement](https://yair-lavi.com/mincs-list/conjecture-34/index.html)
remains the full target.

