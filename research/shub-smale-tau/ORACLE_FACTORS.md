# Low-degree factors after unary polynomial gates

Status: research. The Shub--Smale tau conjecture and the consecutive-root
all-multiples lower bound remain unresolved. Section 2 proves a limitation
of the attempted extraction through sums of univariate compositions. It is
a consequence of finite Taylor computation and the factor-reconstruction
method of Bürgisser, not a new separation theorem. No novelty claim is made.

## 1. Models and the source being used

In this note ordinary arithmetic circuits over C may use arbitrary complex
scalar constants. Inputs, scalar constants, additions, subtractions, and
multiplications count as gates. A circuit of size L over C(epsilon) is a
border circuit for a polynomial h if its polynomial output has coefficients
regular at epsilon=0 and specializes to h there. Variable-dependent division
is not permitted in the final circuit. A rational function of epsilon may
occupy one scalar gate; its numerator and denominator degrees are not gate
charges in this model.

This convention matches the accepted pinned source after a constant-factor
conversion: `Statement.Computes` counts variables and arbitrary scalar
constants as gates and allows addition and multiplication;
`Statement.Approximates` uses arbitrary Laurent-series scalars. Replace a
subtraction by multiplication by -1 and addition. Embed C(epsilon) in
C((epsilon)). Regular coefficients with constant term h satisfy exactly the
coefficient condition in `Approximates`. The pinned statement is

<https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/Statement.lean>.

The factor-reconstruction source is Peter Bürgisser, *The Complexity of
Factors of Multivariate Polynomials*, arXiv:1812.06828v1, 17 December 2018,
the version correcting Theorem 5.7 of the 2004 journal paper:

<https://arxiv.org/html/1812.06828v1>.

Proposition 3.4 and its proof construct the finite jet of an implicit branch
of a factor by a generic-center perturbation. Lemma 3.6 reconstructs a
degree-d irreducible factor from that branch through order 2d^2. The argument
below gives the needed statements explicitly and replaces the computation
of the full polynomial by a computation of its finite jet. It does not
assume that a truncated Taylor polynomial is still divisible by the factor.

## 2. A bound independent of the outer univariate polynomials

### Theorem 2.1. Factors of sums of unary compositions

Let g_1,...,g_t in C[Z_1,...,Z_n] be simultaneously computed by a circuit of
size s. Let H_1,...,H_t be arbitrary univariate polynomials over C, without
any degree or circuit-size restriction. Suppose


```math
f(Z)=\sum_{i=1}^t H_i(g_i(Z))\ne0.
```


Every nonzero factor h of f of total degree at most d has a border circuit
of size


```math
O\bigl((s+n^2+t+1)(d+1)^{16}\bigr).
\tag{2.1}
```


The absolute implicit constant is independent of the degrees, coefficients,
and circuit complexities of all H_i and g_i. The exponent 16 is a deliberately
loose bound using naive polynomial arithmetic and division-free determinant
computation. Scalar constants are charged individually, as in Section 1.

In particular this applies to H(g_1)-H(g_2). No promise that H has integer
roots is required.

### 2.2 Generic coordinates and the implicit branch

If n=0, all factors are constants. If n=1, every polynomial of degree at
most d has a size-O(d+1) circuit by Horner's rule with its d+1 coefficients
as scalar gates. These cases satisfy (2.1) directly. Constant factors for
any n also require only a scalar gate. Hence assume n>=2 and h nonconstant.

First suppose h is irreducible and nonconstant, of degree d. Work over C,
so no field extension is needed. Write f=h^e q with e>=1 and h not dividing q.
Choose a smooth point of h=0 where q is nonzero, translate it to the origin,
and choose a generic last-coordinate direction. After scaling h by a nonzero
constant, these choices give coordinates (X,Y), with X=(X_1,...,X_{n-1}), such
that


```math
h(0,0)=0,\qquad q(0,0)\ne0,\qquad
 \partial_Yh(0,0)\ne0,
 \qquad h\text{ is monic of degree }d\text{ in }Y.
\tag{2.2}
```


The existence of the point and direction follows from irreducibility in
characteristic zero: the smooth locus is nonempty and open in h=0, and q
does not vanish identically there. Avoid also the proper zero set of the top
homogeneous part when choosing the Y direction. This is the generic-coordinate
choice used in Bürgisser, Lemma 3.3 and the following paragraphs of
Section 3.2. An affine change of n input coordinates
costs O(n^2) gates and can be shared among all g_i.

There is a unique formal series phi(X), with phi(0)=0, satisfying
h(X,phi(X))=0. Put


```math
F_\epsilon(X,Y)=f(X,Y+\epsilon)-f(0,\epsilon).
\tag{2.3}
```


It has zero constant term, and its coefficient of Y is the nonzero scalar


```math
c(\epsilon)=\partial_Yf(0,\epsilon)
 =e\bigl(\partial_Yh(0,0)\bigr)^e q(0,0)\epsilon^{e-1}
   +O(\epsilon^e).
\tag{2.4}
```


Thus over C(epsilon), (2.3) has a unique formal solution Phi_epsilon(X)
with zero constant term. The following argument also proves regularity at
epsilon=0, including arbitrary multiplicity e.

Because q(0,0) is nonzero, the formal unit


```math
W(X,Y,\epsilon)=
 \left(\frac{q(0,\epsilon)}{q(X,Y+\epsilon)}\right)^{1/e}
```


has a unique formal expansion with W(0,0,epsilon)=1. Consider


```math
h(X,Y+\epsilon)-h(0,\epsilon)W(X,Y,\epsilon)=0.
\tag{2.5}
```


At (X,Y,epsilon)=(0,0,0), its Y derivative is h_Y(0,0), which is nonzero.
The formal implicit-function theorem over C[[epsilon]] gives a solution
Y=Phi(X,epsilon) with Phi(0,epsilon)=0. Raising (2.5) to the e-th power
shows that F_epsilon(X,Phi)=0. Uniqueness over C(epsilon) identifies this
with Phi_epsilon. At epsilon=0, equation (2.5) becomes h(X,Phi(X,0))=0.
Consequently


```math
\Phi_\epsilon^{(j)}\in C(\epsilon)[X],\qquad
 \Phi_\epsilon^{(j)}\text{ is coefficientwise regular at }\epsilon=0,
 \qquad
 \left.\Phi_\epsilon^{(j)}\right|_{\epsilon=0}=\phi^{(j)}.
\tag{2.6}
```


Here superscript (j) means homogeneous degree j in X. Rationality in epsilon
also follows from the coefficient recursion for the unique solution of
(2.3). Equation (2.5) is used only to prove existence and the limit; no root
extraction gate is used in the circuit.

### 2.3 Computing the required jet without computing H_i

Set D=2d^2 and J=D+1. Compute the coefficients of bidegree at most (J,J),
where the first degree is total degree in X and the second is degree in Y.
For each i put


```math
a_i(\epsilon)=g_i(0,\epsilon),\qquad
 v_i(X,Y,\epsilon)=g_i(X,Y+\epsilon)-a_i(\epsilon).
```


Each a_i is a scalar in C[epsilon]. The polynomial v_i has positive total
degree in (X,Y). Therefore


```math
H_i(a_i+v_i)
 \equiv \sum_{r=0}^{2J}
       \frac{H_i^{(r)}(a_i)}{r!}\,v_i^r
 \pmod{\text{terms outside bidegree }(J,J)}.
\tag{2.7}
```


Indeed, a monomial in v_i^r has total degree at least r, while a monomial
inside the retained rectangle has total degree at most 2J. All terms with
r>2J are therefore irrelevant. The coefficients in (2.7) are scalars in
C(epsilon); at most t(2J+1) such scalar gates are introduced. Their degrees
as functions of epsilon do not affect the gate count.

For explicit circuit bookkeeping, replace X by TX in every input and keep
the coefficient array in T and Y modulo T^(J+1),Y^(J+1). The entries remain
polynomials in X. Each array has (J+1)^2 entries. Addition is componentwise;
naive multiplication uses O((J+1)^4) ordinary gates. Simulating the joint
g_i circuit and the affine changes costs
O((s+n^2+t+1)(J+1)^4). Computing all powers in (2.7) successively costs
O(t(J+1)^5). Subtract the scalar f(0,epsilon) to obtain the required array
for F_epsilon. The total is bounded by


```math
O\bigl((s+n^2+t+1)(J+1)^5\bigr).
\tag{2.8}
```


The full H_i are never expanded or evaluated as variable polynomials in
this construction. Their finitely many scalar jet values are used as
nonuniform constants, which is legitimate for a border upper bound.

The homogeneous parts Phi_epsilon^(1),...,Phi_epsilon^(D) can now be
computed from this array. One may use Newton iteration, as in Bürgisser,
or the following coefficient recursion. Suppose the parts of degree less
than ell have been computed and write their sum as P_\lt ell. Then


```math
\Phi_\epsilon^{(\ell)}
 =-c(\epsilon)^{-1}
   [F_\epsilon(X,P_{<\ell}(X))]^{(\ell)}.
\tag{2.9}
```


Terms containing the new part can contribute to degree ell only through
the linear term c(epsilon)Y. This proves the recursion. Computation of
products of homogeneous arrays through degree D, repeated for ell<=D,
costs O((D+1)^4) gates by naive arithmetic. The inverse c(epsilon)^(-1)
is a single scalar gate; it is not division by a variable polynomial.
The use of J=D+1 also makes the usual differentiated Newton implementation
safe without a truncation-at-the-boundary issue.

Equations (2.6), (2.8), and (2.9) thus provide small simultaneous border
circuits for the graph jet through degree 2d^2.

### 2.4 Reconstructing the factor and removing variable divisions

For completeness, write


```math
h(X,Y)=\sum_{0\le i,\alpha\le d}h_i^{(\alpha)}(X)Y^i,
```


where each h_i^(alpha) is homogeneous of degree alpha, and components
outside the actual total-degree bound are zero. Since h is monic in Y,
h_d^(0)=1 and h_d^(alpha)=0 for alpha>0. Put


```math
\psi(T)=\sum_{j=1}^{2d^2}\phi^{(j)}(X)T^j.
```


Over the field C(X), the conditions


```math
\sum_{i,\alpha\le d}Z_{i,\alpha}T^\alpha\psi(T)^i
       \equiv0\pmod{T^{2d^2+1}},\qquad
 Z_{d,0}=1,\quad Z_{d,\alpha}=0\ (\alpha>0)
\tag{2.10}
```


uniquely determine Z_(i,alpha)=h_i^(alpha). Here is the degree argument
from Bürgisser, Lemma 3.6. Let A(T,Y)=h(TX,Y) and let B(T,Y) be made from
any proposed solution of (2.10). Both are monic of Y degree d and have
T degree at most d. The truncated series psi is a common root through
order 2d^2. The resultant Res_Y(A,B) has T degree at most 2d^2. The
Sylvester determinant identity writes it as a polynomial combination of
A and B, so substitution of psi makes it divisible by T^(2d^2+1). It
must therefore vanish identically. The polynomial A is irreducible over
C(X,T), since the substitution X->TX is a field automorphism after
adjoining T. Hence A divides B. Monicity and equal Y degrees give A=B.

After fixing the leading row Z_(d,alpha), there are m=d(d+1) unknowns.
Select m independent equations from the system at epsilon=0. Replace
each phi^(j) by its computed approximation Phi_epsilon^(j). The selected
matrix and right-hand side then have entries polynomial in X with
coefficients regular at epsilon=0. Its determinant Delta_epsilon(X)
specializes to a nonzero polynomial Delta_0(X). Cramer's rule gives
rational functions Z_(i,alpha)(X,epsilon) that specialize to the desired
polynomials h_i^(alpha)(X).

These rational functions can be computed in polynomially many gates.
For a completely coarse bound, compute each determinant without variable
division by the Newton identities for the characteristic polynomial:
form the first m powers and their traces, then use divisions only by the
nonzero scalar integers 1,...,m. This takes O(m^4) gates per determinant,
and there are m+1 determinants. Thus O((d+1)^10) gates suffice, apart from
the already computed entries. The only remaining variable denominator
is the common Delta_epsilon(X).

Choose a in C^(n-1) with Delta_0(a)!=0. Expand each resulting rational
function around X=a and retain total degree at most d. To do this
syntactically, replace X by a+TX, compute every gate modulo T^(d+1),
and invert the denominator series using its nonzero scalar constant
term Delta_epsilon(a). This takes O((d+1)^2) gates per original gate
using naive coefficient arithmetic. The coefficients are regular at
epsilon=0 because Delta_0(a) is nonzero. At epsilon=0 the rational
function is the polynomial h_i^(alpha), of degree at most d, so this
truncation recovers it exactly. Substitute X-a back, and assemble
the components with the powers of Y.

The result is a division-free polynomial border circuit for h. Combining
(2.8), D=2d^2, the determinant computation, and this truncation gives an
upper bound O((s+n^2+t+1)(d+1)^14), with ample room in the exponent.
Undoing the initial affine coordinates costs O(n^2) further gates.

### 2.5 Reducible factors and the stated uniform bound

A nonconstant factor h of degree at most d is a scalar times a product
of at most d irreducible factors counted with multiplicity. Apply the
preceding argument to each distinct irreducible factor, then multiply
the resulting approximants with their required multiplicities. The
sum of all multiplicities is at most d; all approximants may use the
same epsilon. Their coefficients are regular, so the product has the
required limit. This additional factor of at most d, scalar gates,
and the constant-factor conversion of subtraction are covered by
(2.1). Constant factors require only a scalar gate. This proves
Theorem 2.1.

### Corollary 2.2. More general circuits with unary polynomial gates

The same polynomial bound applies if f is computed by a circuit containing
ordinary arithmetic gates and t additional gates of the form u->H(u),
where each H is an arbitrary univariate polynomial and each such gate is
counted once. At every such gate, compute the same finite jet by its
Taylor expansion at the moving scalar input value. Ordinary gates use
the coefficient-array arithmetic above. At most O(tJ) new scalar
coefficients are needed. The generic-center argument and reconstruction
are unchanged.

This is a border upper bound with arbitrary scalar constants. It says
nothing about constant-free complexity of h or the cost of constructing
those scalar Taylor coefficients.

## 3. Consequence for the attempted extraction

Suppose one proposes to obtain a polynomial-degree permanent or Hamiltonian
cycle polynomial as a factor of H(g_1)-H(g_2), where the g_i have polynomial
size, and to use a short hypothetical H with many integer roots to compute
that multiple. Theorem 2.1 already gives a polynomial-size border circuit
for the proposed factor, whether H is short or not. The accepted pinned
border lower bound therefore rules out such an exact factor identity for
all sufficiently large instances. The same applies to polynomially many
univariate-composition terms or unary polynomial gates.

This is a limitation of that particular transfer mechanism. It does not
prove a lower bound for H. In particular, neither a short representative
of the Boolean inverse nor its normal form is produced or separated here.

The distinction is precise: the argument uses ordinary finite Taylor jets
at one generic point. Boolean normal form combines values at exponentially
many distinct points. No statement above makes that conversion inexpensive.


The factor theorem has written internal review by the arithmetic, consecutive-root and root workers. The full tau and all-multiples targets remain open. A deformation of the Boolean quotient or a trace operation requires its own proof and cost bound; neither is supplied by the theorem.
