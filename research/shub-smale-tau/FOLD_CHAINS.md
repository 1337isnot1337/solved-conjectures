# Quadratic folding: a constructive candidate and a restricted depth bound

Status: research notes. Neither the Shub–Smale tau conjecture nor the
all-multiples consecutive-root problem is solved here. The finite witnesses in
Section 2 do not establish an asymptotic family. Section 4 concerns compositions
of quadratic polynomials, which form a much narrower class than straight-line
programs.

## 1. Pair-centred folds can be compiled with all constants charged

Let `N >= 2`, and put `I_N={0,...,N-1}`. Choose pairs
`(a_j,b_j) in I_N^2`, for `1 <= j <= d`. Define


```math
p_0(x)=x,\qquad
 c_j=p_{j-1}(a_j)+p_{j-1}(b_j),\qquad
 p_j(x)=(2p_{j-1}(x)-c_j)^2.
\tag{1.1}
```


Every `c_j` is an integer. We call the sequence successful if `p_d` has one
value on `I_N`. Then


```math
H(x)=p_d(x-1)-p_d(0)
\tag{1.2}
```


is a nonzero member of `Z[x]` divisible by `F_N(x)=prod_{a=1}^N(x-a)`.
Indeed, its degree is exactly `2^d`, while its values at `1,...,N` are zero.

### Proposition 1.1. Charged compilation

If (1.1) is successful, then


```math
\tau(H)\leq 3d^2+4d+4d\lceil\log_2N\rceil+3.
\tag{1.3}
```


**Proof.** First construct zero by `1-1`. Every one of the at most `2d`
integer inputs `a_j,b_j` can be constructed by reading its binary expansion,
using a doubling and, when needed, an addition of one per binary digit.
The cost is at most `4d ceil(log_2 N)` gates. Repeated values may be shared;
this bound does not require sharing.

After `c_1,...,c_{j-1}` are available, evaluate the preceding `j-1` folds at
each of `a_j,b_j`. A fold needs three gates: doubling, subtraction of the
already constructed centre, and squaring. These two evaluations and their sum
cost at most `6(j-1)+1` gates. Producing the next variable-dependent fold costs
three more gates. Thus all centres and the variable-dependent chain cost at
most


```math
\sum_{j=1}^d(6(j-1)+4)=3d^2+d.
```


Evaluate the full chain at zero with `3d` additional gates. The final
subtraction costs one gate, and replacing the variable input by `x-1` costs
one gate. Including the construction of zero gives (1.3). No division or free
integer constant occurs. The constant computations use the already constructed
centres, so this construction is acyclic. QED.

In particular, a successful family with `d=(log N)^{O(1)}` would disprove the
tau conjecture. This implication does not assume that the witnesses can be
found efficiently: the conjecture concerns the existence of programs.

### Affine canonicalization is only a search operation

For a finite integer set `S` with at least two elements, subtract its minimum,
divide by the gcd of its differences, and optionally reflect the resulting set
about its midpoint. Choose the lexicographically smaller orientation. Denote
the resulting canonical set by `can(S)`.

The search applies


```math
S\longmapsto \mathop{\mathrm{can}}\{(2u-c)^2:u\in S\},
 \qquad c=u_0+u_1,\quad u_0\ne u_1\in S.
\tag{1.4}
```


These normalizations introduce no free gcd or division operation into (1.1).
To see this, suppose the actual values are `alpha u+beta` for the current
normalized values `u`, with `alpha != 0`. Choose original indices representing
`u_0,u_1`. The actual centre is
`alpha(u_0+u_1)+2beta`, and the next actual values are
`alpha^2(2u-c)^2`. Subtracting a minimum, dividing a gcd, or reflecting merely
changes the affine relation between the actual and normalized sets. It does
not change which pairs collide. The actual implementation always uses (1.1).

The search is deliberately restricted to centres that merge a pair. A negative
search result does not rule out a chain containing an intermediate quadratic
which is injective on the current finite set. If `N>2^{d-1}`, such an injective
step cannot occur in a successful depth-`d` chain: all other steps can reduce
cardinality by at most a factor of two. Only under that inequality is the
restriction to pair centres automatically complete. Beam search introduces a
further incompleteness, regardless of that inequality.

## 2. Exact finite witnesses

The following pairs are indices in the original interval, so they specify the
integer polynomials (1.1) without any normalization constants.

| `N` | `d` | Original pairs `(a_j,b_j)` | Image cardinalities |
|---|---:|---|---|
| 8 | 4 | `(0,7),(0,2),(0,1),(0,3)` | `8,4,3,2,1` |
| 16 | 6 | `(0,15),(0,5),(1,6),(0,4),(0,2),(0,1)` | `16,8,6,4,3,2,1` |
| 32 | 12 | `(0,31),(1,14),(1,4),(0,3),(7,12),(2,7),(2,6),(1,9),(0,2),(5,13),(1,5),(0,1)` | `32,16,13,10,9,8,7,6,5,4,3,2,1` |

These were checked using exact integer trajectories. They establish upper
bounds on the depth within this restricted construction, not optimality. The
`N=32` witness obtains several simultaneous collisions only in its first three
steps. Its remaining steps merge one pair each. No recursive pattern producing
a polylogarithmic-depth family has been proved.

The standalone verifier `tau_fold_witnesses.py` constructs division-free
constant-free programs for these three witnesses and checks every prescribed
root with exact integer arithmetic. Its generated gate lists are stored in
`tau_fold_certificates.json`. Sharing repeated prefix evaluations gives actual
gate counts `54`, `101`, and `304`, respectively. The search implementation is
`tau_fold_search.py`; its beam-search failures are not certificates of
nonexistence.

A small explicit example shows why a putative bound of `2d` consecutive roots
for a depth-`d` quadratic chain would be false. Set


```math
u=\frac{(x-4)(x-5)}2,\qquad
 v=\frac{(u-3)(u-6)}2,\qquad
 w=\frac{(v-5)(v-9)}{45}.
```


Then the four-fold quadratic composition `w(w-1)` satisfies


```math
\begin{split}
8294400w(w-1)
 ={}&\left(\prod_{j=0}^9(x-j)\right)
 (x^2-9x+2)(x^2-9x+4)(x^2-9x+22).
\end{split}
\tag{2.1}
```


The three remaining quadratic discriminants are `73`, `65`, and `-7`.
Therefore the cleared numerator has exactly the ten integer roots `0,...,9`.
Equation (2.1) is an exact identity, verified by rational polynomial arithmetic.
It is a finite construction and supplies no asymptotic counterexample.

## 3. A lattice-point bound for a single collision equation

Only the following classical intersection theorem is imported. If two plane
curves of total degrees `a,b` over `C` have no common component, then they have
at most `ab` distinct common points. This is the affine consequence of
Bézout's theorem, or equivalently the contrapositive of Corollary 3 in William
Fulton, *Algebraic Curves*, electronic edition dated January 28, 2008,
Section 5.3, printed pages 57–58. The full primary text was checked at:

<https://users.math.msu.edu/users/magyarp/Math419H/Fulton-Alg-Curves.pdf>

The convex-arc lattice estimate needed below is proved here.

### Lemma 3.1. Monotone convex arcs

Let an arc in `[0,N-1]^2` be the graph of a twice differentiable function on an
interval. Suppose that its first derivative never vanishes and its second
derivative has a constant nonzero sign. The arc contains at most


```math
4N^{2/3}+1
\tag{3.1}
```


integer points.

**Proof.** Order its integer points by increasing first coordinate. Write the
successive edge vectors as `(h_i,k_i)`, where `h_i` is a positive integer.
The signs of the nonzero `k_i` agree because the graph is monotone. Strict
convexity or concavity makes the slopes `k_i/h_i` strictly monotone. In
particular the integer pairs `(h_i,|k_i|)` are distinct.

If there are `m` edge vectors, the sum of their lengths in the `l^1` norm is
at most `2(N-1)`, since both coordinates are monotone within the box. At most
`T^2` pairs of integers `h>=1,k>=0` satisfy `h+k<=T`. Put
`T=floor(sqrt(m/2))`. At least `m/2` of the edge vectors have `l^1` norm
strictly greater than `sqrt(m/2)`. Consequently


```math
\frac{m^{3/2}}{2\sqrt2}<2N,
\qquad
m<(4\sqrt2N)^{2/3}<4N^{2/3}.
```


Adding one to count vertices proves (3.1). The assertions are immediate when
there are fewer than two integer points. QED.

### Lemma 3.2. Uniform collision bound

Let `p in R[x]` have even degree `D>=2`, and let `c in R`. Then


```math
\#\{(a,b)\in I_N^2:p(a)+p(b)=c\}
\le 32D^2N^{2/3}.
\tag{3.2}
```


The constants are independent of the coefficients of `p` and of `c`.

**Proof.** Put `F(X,Y)=p(X)+p(Y)-c`. If `a` is the nonzero leading
coefficient of `p`, the top homogeneous part of `F` is
`a(X^D+Y^D)`. It has no repeated factor over `C`: the polynomial `T^D+1`
has distinct nonzero roots. Therefore `F` is squarefree. Otherwise the square
of the top homogeneous part of a nonconstant repeated factor would divide
`a(X^D+Y^D)`.

The curve `F=0` contains no real affine line. A nonvertical real line can be
written `Y=uX+v`; the coefficient of `X^D` in its restriction is
`a(1+u^D)`, which is nonzero because `D` is even. A vertical line also cannot
be a component, since the coefficient of `Y^D` is the nonzero constant `a`.
The same argument excludes horizontal lines.

Partition each coordinate interval `(0,N-1)` at the real zeros of `p'`.
There are at most `D` resulting open intervals in each coordinate. On any
of the at most `D^2` open rectangles, `p` is strictly monotone in each
coordinate. Thus the equation


```math
p(Y)=c-p(X)
```


defines either no curve or one smooth graph `Y=g(X)` with interval domain.
Both coordinates are monotone on this graph. To justify the interval-domain
assertion, `p(X)` is monotone on the first interval and the range of `p` on
the second interval is an interval; taking a preimage of their interval
intersection gives an interval. The implicit function theorem applies because
`p'(Y)` is nonzero there.

The curvature numerator is


```math
K=F_{XX}F_Y^2-2F_{XY}F_XF_Y+F_{YY}F_X^2,
 \qquad \deg K\le3D-4.
\tag{3.3}
```


On a graph where `F_Y != 0`, implicit differentiation gives
`g''=-K/F_Y^3`. Any irreducible common component of `F` and `K` having a
regular real point would have a small smooth real arc on which curvature is
identically zero. At a point of that arc one may use a nonvertical local graph;
its second derivative is zero, so the arc lies on an affine line. The
restriction of `F` to that line vanishes on an interval and hence vanishes
identically, contrary to the preceding paragraph. If a real smooth arc had a
vertical tangent at one point, one uses a neighboring point or exchanges the
coordinates; an arc that is vertical throughout would itself give a vertical
line component.

This reasoning also covers components initially factored over `C`: at a
regular real point of a real polynomial there is a unique irreducible local
component. Complex conjugation fixes the point and therefore fixes that
component, which can be represented by a real polynomial after scaling.
Distinct conjugate components meeting at a real point would instead make it
singular, and such points were excluded from this argument.

It follows that no regular real point of `F` belongs to a component common
to `F` and `K`. Remove those common components from `F`. The remaining
polynomial has degree at most `D` and has no common factor with `K`.
Bézout therefore bounds the regular real curvature-zero points by


```math
M\le D(3D-4)\le3D^2.
\tag{3.4}
```


If `K` were the zero polynomial, every regular real arc would give the same
line contradiction. In that case there are no arcs in the open monotonicity
rectangles, and their contribution below is zero. The argument therefore
also covers this degenerate case.

Cutting the at most `D^2` initial graphs at these `M` points leaves at most
`D^2+M <=4D^2` monotone graph arcs whose second derivatives have a fixed
nonzero sign. Lemma 3.1 applies to every such arc. The curvature-zero points
themselves contribute at most `M`.

For each of the at most `D-1` vertical critical lines, restricting `F` gives
a nonzero polynomial in `Y` of degree `D`, so these lines contribute at most
`D(D-1)` points. The horizontal critical lines contribute the same bound.
The four boundary lines of the box contribute at most `4D` points. These
bounds include all singular and isolated real points: any point in an open
monotonicity rectangle has both partial derivatives nonzero.

Combining the estimates, the number of integer points is at most


```math
\begin{split}
&(D^2+M)(4N^{2/3}+1)+M+2D(D-1)+4D
\\ &\qquad\le16D^2N^{2/3}+9D^2+2D
\le26D^2N^{2/3}
\le32D^2N^{2/3},
\end{split}
```


where `D>=2` and `N>=1` justify the penultimate inequality. QED.

## 4. Restricted depth lower bound

### Theorem 4.1. Quadratic chains constant on an integer interval

Let `Q_1,...,Q_d in R[t]` each have degree exactly two. Set


```math
p_0(x)=x,\qquad p_j(x)=Q_j(p_{j-1}(x)).
```


Suppose `p_d` is constant on `N>=2` consecutive integers. Then


```math
d\ge\frac76\log_2N-6.
\tag{4.1}
```


**Proof.** Translating the argument of every prefix reduces the interval to
`I_N`. Let `m_j` be the number of distinct values of `p_j` on `I_N`.
Each quadratic has at most two preimages of any value, so


```math
m_1\ge N/2,\qquad m_{j-1}\le2m_j.
\tag{4.2}
```


Write `Q_j(t)=A_jt^2+B_jt+C_j`, with `A_j != 0`. Two distinct values
`u,v` merge precisely when `u+v=-B_j/A_j`. Choose one original index for
each distinct value of `p_{j-1}`. Every merge then gives a distinct pair of
indices satisfying a collision equation for `p_{j-1}`. For `j>=2`, that
polynomial has even degree `2^{j-1}`, so Lemma 3.2 gives


```math
m_{j-1}-m_j\le32\,4^{j-1}N^{2/3}.
\tag{4.3}
```


Let `n=log_2 N`. Degree alone gives `d>=n`. If `n<24`, this already
implies (4.1). Otherwise put


```math
k=\left\lfloor\frac n6-3\right\rfloor\ge1.
```


Then `k<=d`, and (4.2)–(4.3) imply


```math
\begin{split}
m_k
&\ge\frac N2-32N^{2/3}\sum_{j=2}^k4^{j-1}
\\ &>\frac N2-\frac{32}{3}4^kN^{2/3}
\ge\frac N2-\frac N6=\frac N3.
\end{split}
\tag{4.4}
```


The final `d-k` quadratics must reduce these distinct values to one, so
`2^{d-k}>=m_k>N/3`. Therefore


```math
d>k+n-\log_2 3
>\frac76n-4-\log_2 3
>\frac76n-6.
```


The weaker non-strict form (4.1) follows. QED.

This theorem permits arbitrary real coefficients in every quadratic. Its
additional information comes from the lattice on which the equal-value
condition is imposed. It does not assume or conclude that every complex root
is integral. It applies to an unknown cofactor whenever the whole polynomial
is represented by such a quadratic composition, but does not apply to an
arbitrary division-free straight-line program. In particular, it remains
compatible with a successful pair-fold family of depth polynomial in `log N`.

## 5. Relation to known square chains and remaining constructive question

The fully splitting square-chain problem is different from the interval
multiple problem. Walker, *Coefficient growth in square chains*,
arXiv:1902.11164v1 (February 27, 2019), Proposition 1.1, proves a lower
bound on the number of distinct roots when the entire square chain splits
over a unique factorization domain and its last constant is nonzero.
Propositions 2.3 and 3.2 give divisibility and size restrictions on its
constants. Those hypotheses do not hold for (2.1), which has noninteger
complex roots. The paper was checked in its primary arXiv PDF:

<https://arxiv.org/pdf/1902.11164v1>

The primary author abstract of Borchert, McKenzie and Reinhardt, *Few Product
Gates but Many Zeroes* (2013), explicitly allows arbitrary integer constants
in its gem model. Its finite gem constructions therefore require a separate
constant-construction analysis before being used in the constant-free tau
model. The checked abstract is:

<https://users.informatik.uni-halle.de/~ahyjb/abstracts.html>

The unresolved constructive question in the present notes is precise:
do there exist successful pair-centred fold sequences on `I_{2^n}` with
depth `n^{O(1)}`? Proposition 1.1 would turn such sequences into a disproof
of the tau conjecture. Neither the finite searches nor Theorem 4.1 settles
that question.

## 6. Exact finite certificates

Run `python3 research/shub-smale-tau/fold_witnesses.py` from the repository
root. The checked arithmetic programs are in `fold_certificates.json`.
They use only 1,x and binary +,−,×, with 54, 101 and 304 gates for N=8,16,32.
The verifier checks the gate graph, all prescribed integer evaluations, the
image cardinalities and nonzero leading terms. These finite witnesses prove
no optimality and supply no asymptotic counterexample.
