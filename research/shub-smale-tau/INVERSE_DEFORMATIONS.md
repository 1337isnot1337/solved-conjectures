# Boolean deformation: exact recursions and the remaining trace operation

Status: research. No proof or counterexample to tau is claimed. The
coalescing deformation has polynomial-size finite jets, proved below with
all integer constants charged. A spacing-preserving Newton lift is also
explicit, but it only raises the original root multiplicities. Neither
construction supplies the missing Boolean trace or normal-form operation.

## 1. The deformed Boolean algebra and its inverse

Let n>=1, let w_1,...,w_n be positive integers, and let b be an integer.
Put z=y-b and


```math
A_t=\mathbb Q(t,y)[X_1,\ldots,X_n]/(X_i^2-tX_i:1\le i\le n),
 \qquad L=\sum_{i=1}^n w_iX_i.
```


The elements X^S=product_(i in S) X_i, for S subset [n], form a basis.
Spanning follows from


```math
X^\alpha=t^{|\alpha|-|\mathop{\mathrm{supp}}\alpha|}
 X^{\mathop{\mathrm{supp}}\alpha}.
\tag{1.1}
```


Independence follows by evaluation at X_i in {0,t}: the resulting
evaluation matrix is the tensor product of invertible two-by-two matrices
over Q(t,y). Thus every class has a unique multilinear representative.

Whenever a Taylor expansion at t=0 or reduction modulo t^(R+1) is used
below, it takes place in the integral model
Q(y)[[t]][X]/(X_i^2-tX_i), and then in its quotient by t^(R+1).
It is not a quotient by t^(R+1) of the generic algebra A_t, where t
is invertible. The monic relations give the same free multilinear basis
in this integral model.

Let U_t be the representative of (z-L)^(-1). It exists because, at a
vertex t e, its value is 1/(z-t w(e)), where w(e)=sum_i w_i e_i.
Writing U_t=sum_S u_S X^S gives the exact recursion


```math
u_\varnothing=\frac1z,
 \qquad
 u_S=\frac{\sum_{i\in S}w_i u_{S\setminus\{i\}}}
                 {z-tw(S)}\quad(S\ne\varnothing).
\tag{1.2}
```


Indeed, multiplication by L sends X^S to


```math
tw(S)X^S+\sum_{i\notin S}w_iX^{S\cup\{i\}}.
```


Möbius inversion of the vertex values gives the equivalent closed formula


```math
u_S(t,z)=t^{-|S|}
 \sum_{T\subseteq S}\frac{(-1)^{|S|-|T|}}{z-tw(T)}.
\tag{1.3}
```


Despite the displayed negative power of t, this rational function is
regular at t=0. Expanding each denominator, the coefficient of t^m in
the sum is the |S|-fold finite difference of the polynomial w(T)^m.
It vanishes for m<|S|. The following construction proves regularity and
computes all its finite jets without using a Boolean quotient oracle.

## 2. All jets of polynomial order have polynomial circuit size

### Theorem 2.1. An integer coefficient recurrence

Suppose the integer weights w_i and b are supplied by a joint constant-free
program of length s_w. For every R>=0 there are explicitly constructible
integer polynomials C_(q,k)^(i) in X_1,...,X_i such that


```math
[t^q]U_t=\sum_{k=0}^n
          \frac{C_{q,k}^{(n)}(X)}{z^{q+k+1}}
          \qquad(0\le q\le R).
\tag{2.1}
```


All these coefficients, and a single division-free numerator for U_t
modulo t^(R+1), have total circuit size


```math
O\bigl(s_w+n^2(R+1)^2+(n+R+1)^2\bigr).
\tag{2.2}
```


The only denominator needed for the full truncated series is
z^(n+R+1). It is a parameter polynomial, independent of X. When b=1
and w_i=2^(i-1), constructing all weights costs O(n), so (2.2) is
polynomial in n and R in the charged constant-free model.

**Proof.** Use the initial conditions


```math
C_{0,0}^{(0)}=1,\qquad C_{q,k}^{(0)}=0\text{ otherwise},
```


and set any out-of-range entry, including k<0, equal to zero. For
i=1,...,n, q=0,...,R, and k=0,...,i, use


```math
C_{q,k}^{(i)}=
 C_{q,k}^{(i-1)}+
 X_i\sum_{r=0}^q
       {q+k\choose r+1}w_i^{r+1}
       C_{q-r,k-1}^{(i-1)}.
\tag{2.3}
```


These are integer-polynomial recurrences. To verify them and (2.1),
temporarily use exponential generating functions only as formal notation:


```math
E_i(u)=\frac{\exp(w_i u)-1}{u}
       =\sum_{r\ge0}\frac{w_i^{r+1}}{(r+1)!}u^r,
```


```math
C_{q,k}^{(i)}=(q+k)![u^qv^k]
                 \prod_{j=1}^i(1+vX_jE_j(u)).
\tag{2.4}
```


Multiplying by the i-th factor in (2.4) gives (2.3), because


```math
\frac{(q+k)!}{(r+1)!(q-r+k-1)!}={q+k\choose r+1}.
```


For S of size k, expand (1.3). Its coefficient of t^q equals


```math
\frac{(q+k)!}{z^{q+k+1}}
 [u^{q+k}]\prod_{i\in S}(\exp(w_i u)-1)
 =\frac{(q+k)!}{z^{q+k+1}}[u^q]\prod_{i\in S}E_i(u).
```


Summing over S gives (2.1) and (2.4). This argument uses formal
exponential series to prove an identity; the actual circuit is (2.3),
which uses neither exponentials nor factorial divisions.

For the gate count, compute one shared zero and construct all binomial
coefficients up to row n+R of Pascal's triangle, in O((n+R+1)^2)
additions. Precompute w_i,...,w_i^(R+1) in O(n(R+1)) multiplications.
There are at most (n+1)^2(R+1) entries in all layers of (2.3), and each
uses O(R+1) operations. This gives O(n^2(R+1)^2) gates. The same zero,
one, binomial coefficients, and weight powers are shared across entries.

Define


```math
V_q(X,z)=\sum_{k=0}^n C_{q,k}^{(n)}(X)z^{n-k}.
```


Then [t^q]U_t=V_q/z^(n+q+1). Precompute the needed powers of z and t
and form


```math
P_R(X,t,z)=\sum_{q=0}^R t^q z^{R-q}V_q(X,z).
\tag{2.5}
```


The polynomial P_R is an integer polynomial produced without divisions,
within the same bound. Finally


```math
U_t\equiv\frac{P_R(X,t,z)}{z^{n+R+1}}
                     \pmod{t^{R+1}}.
\tag{2.6}
```


The denominator is computed by repeated multiplication or binary powering;
one parameter-only division suffices if a rational representative is
desired. This proves the theorem. QED.

At t=0 the result is particularly simple:


```math
U_0=\sum_{k=0}^n\frac{k!\,e_k(w_1X_1,\ldots,w_nX_n)}{z^{k+1}}.
\tag{2.7}
```


Here e_k is the elementary symmetric polynomial. Its usual product
recurrence is already contained in (2.3) with q=0.

### 2.2 What the coalescing limit loses

For w_i=2^(i-1), all subset sums are distinct. Formula (1.3) for
S=[n] has a simple pole at every z=tw(T), with nonzero residue
(-1)^(n-|T|)/t^n. Thus its reduced denominator as a rational function
of z has degree 2^n. For t=1 and b=1 these poles are exactly the
integer points 1,...,2^n in the y variable.

Every finite Taylor truncation (2.6) instead has its only possible
y-pole at y=b. The n+R+1 exponent in its denominator records higher
pole order at the common point, not the separated integer locations.
Consequently a polynomial-order coalescing jet is unconditionally easy
and cannot by itself produce a polynomial-degree family excluded from
border polynomial-size circuits by the accepted pinned theorem.

This does not rule out every reconstruction using such jets. It states
exactly that the usual general rational-reconstruction method would have
to accommodate a denominator of degree 2^n; no polynomial-in-n method
recovering the separated-pole inverse from polynomially many jets has
been proved here.

## 3. Why Newton inversion terminates only in the degenerate algebra

For a unit a in any commutative algebra, the Newton update


```math
V'=V(2-aV)
```


satisfies 1-aV'=(1-aV)^2. In the generic algebra A_t, evaluation at
the 2^n vertices identifies A_t with a product of fields. It is
therefore reduced. For every finite r,


```math
(1-aV)^{2^r}=0\quad\Longleftrightarrow\quad 1-aV=0.
```


Finite Newton iteration cannot turn an inexact initial inverse into an
exact inverse there.

At t=0, the algebra has X_i^2=0. Its positive-degree ideal has nilpotence
index n+1. With a=z-L and V=1/z, the initial error is L/z. It becomes
zero once 2^r>=n+1. More generally, modulo t^(R+1), equation (1.1)
shows that L^(n+R+1)=0, so r Newton steps suffice once
2^r>=n+R+1. This explains the inexpensive truncated inverse; the
nilpotent degeneration has changed the algebraic operation being solved.

## 4. A spacing-preserving lift from a hypothetical short multiple

Return to the usual Boolean algebra X_i^2=X_i. Put


```math
B(X)=1+\sum_{i=1}^n2^{i-1}X_i,
 \qquad a=y-B(X).
```


Let H be any nonzero integer polynomial vanishing at 1,...,2^n. Its
divided-difference representative


```math
V_0(X,y)=\frac{H(y)-H(B(X))}{(y-B(X))H(y)}
\tag{4.1}
```


is polynomial in X with a parameter-only denominator and has a charged
circuit of size O(tau(H)+n). [BOOLEAN_INVERSE.md](BOOLEAN_INVERSE.md) gives
the explicit gatewise divided-difference construction; (4.1) is not
implemented by dividing by y-B.

Consider any formal deformation of a Boolean vertex,
X(t,Z)=e+O(t), where Z are arbitrary auxiliary parameters. The coordinates
may arise, for example, from the formal branches of


```math
X_i^2-X_i=tR_i(X,Z).
```


The Jacobian with respect to X at a Boolean vertex is diagonal with
entries 2e_i-1, so formal branches exist uniquely. Their constant
evaluation points B(e) remain the distinct integers 1,...,2^n.

Apply r ordinary Newton updates V_(j+1)=V_j(2-aV_j), using sharing in
the circuit. Only O(r) additional gates are needed. Since


```math
1-aV_0=\frac{H(B(X))}{H(y)},
```


one gets the exact identity


```math
1-aV_r=\left(\frac{H(B(X))}{H(y)}\right)^{2^r}.
\tag{4.2}
```


Along every branch X(t,Z)=e+O(t), the error is O(t^(2^r)), and is
O(t^(m_e 2^r)) if H has multiplicity m_e at B(e). The denominator remains
a power of the parameter polynomial H(y), so no variable-dependent
division has entered the representative.

This gives a short representative to arbitrarily high finite precision
while retaining the original separated base points. However, it does
not isolate any new low-degree polynomial. In fact


```math
V_r=
 \frac{H(y)^{2^r}-H(B(X))^{2^r}}
      {(y-B(X))H(y)^{2^r}},
\tag{4.3}
```


which is exactly the divided-difference representative obtained by
replacing H with H^(2^r). The lift raises multiplicities. It supplies
neither the Boolean trace nor the canonical multilinear representative.

## 5. Endpoint anchors and the unresolved filter

An endpoint anchor does give a small univariate representative of one
Boolean point, under an additional explicit hypothesis. If H(0)!=0,
then in the Boolean algebra


```math
\frac{H(B(X)-1)}{H(0)}
 =\prod_{i=1}^n(1-X_i).
\tag{5.1}
```


At B=1 the left side is one; at B=2,...,2^n it is zero. This is a
cofactor-independent functional identity, although its ambient polynomial
representative depends on the cofactor. Its canonical right side already
has an O(n)-gate circuit.

A longer shift does not provide a bit filter for an arbitrary cofactor.
For 1<=a<=2^n, H(B-a) vanishes at all B>=a+1, but its values at B<=a
are not prescribed. Even with H(0)!=0, take


```math
H(x)=F_{2^n}(x)\prod_{k=1-a}^{-1}(x-k).
```


Then H(B-a)/H(0) is the indicator of the single value B=a on the
Boolean cube, rather than the indicator of an entire half interval.
This is a counterexample to that particular universal shifted-filter
identity; it is not asserted to have a short circuit.

Thus the endpoint formula has not yielded a short univariate
representation of a general binary digit or a selective sum of residues.
Applying a Boolean trace or taking a canonical quotient remainder would
be a new operation whose cost still needs a proof.

## 6. Source scope for exact division

The relevant established degree-dependent division theorem is Dutta,
Jindal, Pandey, and Sinhababu, *Arithmetic Circuit Complexity of Division
and Truncation*, CCC 2021:

<https://drops.dagstuhl.de/storage/00lipics/lipics-vol200-ccc2021/LIPIcs.CCC.2021.25/LIPIcs.CCC.2021.25.pdf>.

Theorem 13 bounds univariate quotient and remainder complexity by
O(s deg h) for a divisor h with arbitrary field constants available.
Theorem 18 gives the general low-degree-divisor bound. Problem 1 and
Section 4 explicitly leave degree-independent division elimination
unresolved, including the special divisor x^d when d can be exponentially
large. These statements explain why an argument charging the degree of
an unknown cofactor cannot silently replace that degree by its circuit
size. A search of more recent primary-source results in this session did
not identify a theorem making that replacement.
