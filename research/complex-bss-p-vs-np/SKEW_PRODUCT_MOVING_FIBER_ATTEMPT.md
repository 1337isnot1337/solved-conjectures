# A continuous invariant-fiber certificate for weighted permanent equality

Status: research attempt. The soundness and unrestricted completeness below are explicit. The polynomial certificate-size assertion required for the BSS separation is not proved. The weighted-protocol agent independently reviewed the verifier, the completeness construction, the degree restriction, and Sections 7–9; no gap was found in those written arguments. This is an internal written review, not formal verification or a novelty claim.

## 1. A small cyclic skew map

Fix m>=1 and D=2^m. Let zeta be a primitive D-th root of unity. In the uniform verifier below zeta is existentially quantified and checked; it is not a new machine constant for each m. Define the following polynomials recursively, with j from 0 through m-1:

```math
U_0(t)=t,\qquad
B_j(t)=\frac{1-U_j(t)^{2^{m-j-1}}}{2},\qquad
U_{j+1}(t)=U_j(t)\bigl(1+(\zeta^{-2^j}-1)B_j(t)\bigr).
```

At t=zeta^a, B_j(t) is the j-th binary digit of a. To check the recursion, suppose the lower j digits have already been removed from the exponent of U_j. Raising U_j to 2^(m-j-1) gives (-1) to the remaining j-th digit. The final factor removes that digit by multiplying by zeta^(-2^j) precisely when it is one.

For an m by m matrix X put

```math
H_X(t)=(-1)^m
 \prod_{j=0}^{m-1}(1-2B_j(t))
 \prod_{i=1}^{m}\left(\sum_{j=0}^{m-1}X_{i,j+1}B_j(t)\right).
```

The digit recursion and repeated squaring use O(m^2) gates, as does the remaining expression. Evaluating over the D roots gives the usual inclusion-exclusion expression for the permanent:

```math
\sum_{a=0}^{D-1}H_X(\zeta^a)=\mathop{\mathrm{per}}_m(X).
```

For completeness, expand the product of row sums. A term corresponding to a choice of column for each row occurs for every subset containing the chosen columns. Its signed subset coefficient is zero unless every column is chosen. With m rows, choosing every column means a permutation, and its coefficient is one. This proves the identity for arbitrary complex matrices, including zero entries and cancellations.

For a proposed value y define

```math
h(t)=H_X(t)-y/D,
\qquad T(t,g)=(\zeta t,g+h(t)).
```

After D steps on a root t of t^D=1, the first coordinate returns and the second coordinate is translated by per_m(X)-y. This identity is used only in the proof; constructing the D-fold iterate by a small circuit is not asserted.

## 2. The certificate and a fixed quantifier prefix

The proposed certificate is a division-free arithmetic circuit P(t,g), with arbitrary complex scalar constants depending on the numerical instance X,y. For each t with t^D=1 require its zero fiber

```math
S_t=\{g\in\mathbb C:P(t,g)=0\}
```

to be finite and nonempty, and require

```math
S_t+h(t)\subseteq S_{\zeta t}.                    \tag{1}
```

For a specified size bound s, a uniformly constructible polynomial-size universal arithmetic-circuit template with parameter tuple c represents all candidate P. Write its output as P_c(t,g). The conditions above are exactly expressed by

```math
\exists(\zeta,c)\ \forall(t,g)\in\mathbb C^2\
\exists(u,v)\in\mathbb C^2:\quad\mathcal V(X,y,\zeta,c,t,g,u,v),
                                                               \tag{2}
```

where the verifier first requires zeta^D=1 and zeta^(D/2) not equal to one. These two tests make zeta primitive because D is a power of two. It then accepts automatically when t^D is not one, and otherwise requires

```math
P_c(t,u)=0,\qquad P_c(t,v)\ne0,
\qquad
P_c(t,g)\ne0\ \text{or}\ P_c(\zeta t,g+h(t))=0.   \tag{3}
```

The first two conditions say that P_c(t,.) has a root and is not the zero polynomial. Over C this is precisely the condition that its zero set is finite and nonempty. The last condition is the required inclusion for every root g. The two existential values u,v may depend on t,g; no shared functional meaning is assigned to them.

The quantifier-free verifier uses polynomially many BSS operations in m+s. The root-of-unity conditions take O(m) operations. The powers of zeta and its inverse in the digit construction are computed from that quantified scalar; no list of dimension-dependent machine constants is used. The integer D and the scalar 1/D are computed in O(m) arithmetic operations. Repeated squaring computes t^D in O(m) gates, H_X costs O(m^2), and the universal template has polynomial overhead in s. Equality and inequality branches suffice. There are three quantifier blocks. No degree bound on P is assumed.

Consequently, a proof that every true numerical instance admits such a P of size m^{O(1)} would put the permanent graph in a fixed uniform complex polynomial-hierarchy level, provided the family of templates and size bounds is uniform. Together with graph hardness and the ordinary fixed-level collapse, that would prove the requested separation. This size assertion is the unresolved part of this attempt.

## 3. Soundness

Fix a root t_0 of t^D=1. Iterating (1) gives

```math
S_{t_0}+\sum_{a=0}^{D-1}h(\zeta^a t_0)
\subseteq S_{t_0}.
```

The D roots zeta^a t_0 are all roots of unity. Thus the translation amount is per_m(X)-y. A finite nonempty subset of C cannot contain its translate by a nonzero number: from any element, repeated translation would give infinitely many distinct elements in the set. Hence the translation amount is zero and y=per_m(X).

This proof uses the characteristic-zero additive group, not an ordering or positivity assumption. It does not choose a single accepting matching as a substitute for a weighted sum.

## 4. Unrestricted completeness and the actual size gap

Suppose y=per_m(X). Put

```math
h_a=H_X(\zeta^a)-y/D,
\qquad s_0=0,\qquad s_{a+1}=s_a+h_a.
```

The weighted-sum identity gives s_D=0. There is a unique polynomial q(t) of degree less than D satisfying q(zeta^a)=s_a. Explicitly,

```math
q(t)=\sum_{a=0}^{D-1}s_a\ell_a(t),
\qquad
\ell_a(t)=\frac1D\sum_{r=0}^{D-1}\zeta^{-ar}t^r.
```

Take P(t,g)=g-q(t). Its root fiber at zeta^a is the singleton {s_a}, and the skew map sends it to {s_(a+1)}, including the final wrap to s_D=s_0. Thus (2) is complete when certificate size is unrestricted.

With arbitrary numerical constants, Horner evaluation of q gives an O(D)-gate certificate. This is exponential in m. The interpolation argument gives no polynomial-size certificate. Describing the orbit by its D points, storing all interpolation coefficients, or writing a circuit for the D-fold skew iterate does not remove that exponential cost.

Allowing nonlinear P changes the question: its fibers can contain many points, and no single low-degree polynomial q(t) is supplied. The needed unresolved statement is the existence of polynomial-size nonlinear finite-fiber certificates for every true instance. It is not implied by the existence of q above.

## 5. Why generic fixed challenges do not test this condition

For a candidate P, failure of the implication in (3) can occur only at the finite roots g of P(t,g). Generic g values satisfy its antecedent's negation automatically. Thus the relevant accepted challenge fibers can be dense and proper. The nondense-fiber sampling theorem does not apply to this test.

The root t can be encoded by finitely many Boolean bits relative to the already chosen primitive zeta, since it lies in the root-of-unity set. The root g cannot be replaced by an arbitrary fixed sample list independent of c: its finite exceptional set moves with the certificate coefficients. This is the continuous part of the candidate.

## 6. Polynomial degree or polynomial root support reduces to the finite format

### 6.1 Polynomial fiber degree

There is an additional restriction on any successful certificate theorem. Suppose certificates P have polynomial circuit size and a polynomial upper bound d on the degrees of all fibers P(zeta^a,g) in g. Truncate the original circuit in its g-degree through d by the standard homogeneous-component computation. This costs polynomially many gates in s+d and preserves every root-of-unity fiber, because its higher coefficients vanish there. Therefore one may assume the certificate circuit has formal g-degree at most d.

For two nonzero one-variable polynomials A(g),B(g) of degrees at most d,

```math
V(A)\subseteq V(B)
\quad\Longleftrightarrow\quad
A\mid B^d.                                      \tag{4}
```

Indeed every root of A has multiplicity at most d. If it is a root of B, its multiplicity in B^d is at least d. The converse follows by evaluation. In our application the nonempty-fiber test also rules out a nonzero constant A.

At a fixed root t, condition (1) is therefore equivalent to existence of a polynomial Q_t(g) of degree at most d^2 such that

```math
P(\zeta t,g+h(t))^d=P(t,g)Q_t(g).                 \tag{5}
```

Existentially supply its at most d^2+1 coefficients. Both sides have degree at most 2d^2. Equality at 2d^2+1 fixed distinct scalar g-values verifies (5) exactly. All evaluation costs are polynomial in s+d+m. The nonempty and nonzero fiber witnesses u,v remain two local scalar witnesses.

Encode t=zeta^a by the m Boolean bits of a. After computing successive squares zeta^(2^j), the product of the factors 1+(zeta^(2^j)-1)b_j has an O(m)-gate evaluation. The quantified zeta is one more shared witness, so the finite-block theorem permits its parameter dependence. The complete certificate test now has the form

```math
\exists(\zeta,c)\ \forall b\in\{0,1\}^m\ \exists\text{ local witnesses}
\quad\text{polynomial-time BSS predicate}.
```

The block critical-point theorem excludes a polynomial-size, polynomial-fiber-degree complete certificate family of this form under the imported permanent border lower bound. Therefore the attempt cannot be completed by proving a polynomial degree bound for these fibers.

### 6.2 Polynomially many distinct roots

The weighted-protocol agent observed that polynomially bounded support is also excluded even when root multiplicities are arbitrarily large. Here is a direct proof by local factorization witnesses. It does not require an algorithm for factoring a circuit.

Let U be the actual gate count of the template for P. Every fiber has degree at most E=2^U in g. Suppose the proposed complete family has at most d distinct roots in each fiber, with d polynomially bounded. At a root t, write

```math
A(g)=P_c(t,g),\qquad B(g)=P_c(\zeta t,g+h(t)).
```

The cyclic inclusions force equality of their root supports, since finite cardinalities cannot increase strictly around a cycle. Supply local scalars r_1,...,r_d and nonzero leading scalars alpha,beta, together with U+1 Boolean bits for each of 2d exponents a_i,b_i. Require a_i=0 if and only if b_i=0, and require at least one index to be active. Verify the identities

```math
A(g)=\alpha\prod_{i=1}^{d}(g-r_i)^{a_i},\qquad
B(g)=\beta\prod_{i=1}^{d}(g-r_i)^{b_i}.           \tag{5a}
```

For completeness, list the common distinct roots with their actual multiplicities in A and B, and pad the list with a_i=b_i=0. Each actual multiplicity is at most E, so U+1 bits suffice. For soundness, root distinctness need not be checked: simultaneous zero exponents ensure that both products have exactly the same root support, even if some active r_i values coincide. The nonzero leading scalars and an active factor guarantee finite nonempty fibers. Thus separate u,v witnesses are unnecessary in this reduced verifier. The local witness dimension is d(2U+3)+2.

The bit-powered expression in Section 7.2 evaluates each factor using O(U) gates. Thus each product in (5a) costs O(d(U+1)) gates. The two identity families have polynomially many parameters. Including X,y,zeta,rho,c,t, the two leading scalars, the d roots, and all exponent bits gives parameter dimension

```math
M_*=m^2+p+6+d(2U+3),
```

where p is the number of template parameters. Apply the identity-family sampling argument of Section 7.1 to both families. A generic tuple of M_*+1 fixed g-values tests both identities simultaneously: the two exceptional sets of evaluation tuples have proper closures, and their finite union is still proper. This is valid for every parameter assignment, so it proves soundness for false inputs and arbitrary supplied witnesses as well.

After Boolean-encoding t, all root values and exponent bits are local existential witnesses. The resulting nonuniform verifier has the excluded finite prefix and polynomial resource bounds. Hence polynomial circuit size together with polynomially many distinct roots cannot provide a complete certificate family, regardless of multiplicity sizes or patterns. A successful construction within this schema must allow superpolynomially large distinct-root supports. The independently reviewed gate accounting is in [SKEW_POLYNOMIAL_SUPPORT_EXCLUSION.md](SKEW_POLYNOMIAL_SUPPORT_EXCLUSION.md).

## 7. Squarefree and proportional-multiplicity fibers are excluded

The following stronger restriction was supplied and reviewed by the weighted-protocol agent. It does not assume a degree bound. Let p be the number of parameters in the universal template and let U be its actual gate count. Both are polynomial in the proposed certificate-size bound.

First suppose every root-of-unity fiber is squarefree. The cyclic inclusions in (1) give

```math
|S_1|\le |S_\zeta|\le\cdots\le|S_{\zeta^D}|=|S_1|.
```

Every inclusion is therefore a bijection. For each root t there is a nonzero scalar lambda_t such that

```math
P_c(\zeta t,g+h(t))=\lambda_t P_c(t,g)             \tag{6}
```

as a polynomial identity in g. The same conclusion holds whenever the translated root multiplicities are preserved. Squarefreeness as a polynomial in the pair (t,g) does not suffice; the condition is on each specialized fiber. For example, g^2-(t^D-1) is squarefree in C[t,g], because it is relatively prime to its g derivative 2g. Every root-of-unity fiber is nevertheless g^2. Global radical extraction would not by itself give the fiberwise normalization required here.

### 7.1 A degree-independent test for this identity family

Introduce a shared scalar rho with zeta*rho=1. The digit kernel then has a polynomial circuit in X,y,zeta,rho,t, because inverse powers of zeta can be replaced by powers of rho. Form

```math
F_\theta(g)=P_c(\zeta t,g+h(t))-\lambda P_c(t,g),
\qquad
\theta=(X,y,\zeta,\rho,c,t,\lambda).
```

The parameter space has dimension M=m^2+p+5. For every parameter at which F_theta is not the zero polynomial, its root set in g is finite. The incidence of such a parameter together with ell simultaneous roots has dimension at most M. If ell=M+1, the closure of its projection to the ell evaluation coordinates is a proper subset of C^ell. Fix an evaluation tuple outside that closure. A member of this family is identically zero if and only if it vanishes at all these ell points. This argument applies simultaneously to every parameter assignment, including invalid certificates and false input values. No degree enters the cardinality of the tuple.

Consequently, replace the continuous g test by these fixed evaluations of (6), while keeping t Boolean-encoded as in Section 6. At each t, existentially supply u,v,lambda and require lambda nonzero. The resulting predicate has the form

```math
\exists(\zeta,\rho,c)\ \forall b\in\{0,1\}^m\
\exists(u,v,\lambda):\quad\text{a polynomial-size BSS test}.
```

It remains sound for arbitrary certificates: the evaluation tuple implies the full polynomial identity, which implies the original root inclusion. The squarefree or preserved-multiplicity condition is needed only for completeness. The tuple need not be uniformly constructible. This is sufficient for the obstruction, because the block-KKT theorem and the imported permanent border lower bound both allow nonuniform constants.

### 7.2 Proportional multiplicity vectors

The same argument covers more than unchanged multiplicities. At each t, suppose the two polynomials

```math
A_t(g)=P_c(t,g),\qquad B_t(g)=P_c(\zeta t,g+h(t))
```

have their common root support, and their multiplicity vectors are proportional. Then there are positive integers alpha_t,beta_t and a nonzero scalar lambda_t with

```math
B_t(g)^{\alpha_t}=\lambda_t A_t(g)^{\beta_t}.     \tag{7}
```

These exponents can be chosen at most 2^U. Indeed, a U-gate division-free circuit has g-degree at most 2^U. At any one common root, let a and b be its multiplicities in A_t and B_t. Take alpha_t=a/gcd(a,b) and beta_t=b/gcd(a,b). Proportionality gives the required equality of multiplicities at every common root.

Supply alpha_t and beta_t by U+1 Boolean bits each. An exponentiation with a bit-valued exponent can be evaluated by repeated squaring and the product

```math
Z^{\sum_{j=0}^{U}2^j e_j}
=\prod_{j=0}^{U}\bigl(1-e_j+e_j Z^{2^j}\bigr),
\qquad e_j^2=e_j.
```

It uses O(U) gates. Require each exponent to be positive, for example by checking that the sum of its Boolean bits is nonzero. Include these bit coordinates in the parameter family for the identity test. Its dimension is now at most M+2(U+1), so M+2(U+1)+1 fixed evaluations suffice. The powered identity family has a polynomial-size circuit. Once the bit conditions hold, the identity at all evaluation points implies (7), hence equality of the root supports and the original inclusion.

Thus a complete polynomial-size certificate family is also excluded when the translated multiplicity vectors are merely proportional. This includes singleton root fibers with arbitrary multiplicity and fibers whose distinct roots all have the same multiplicity, even when that common multiplicity changes with t. It does not include arbitrary nonproportional multiplicity vectors.

## 8. Zero-set invariance does not preserve multiplicities

The soundness proof only uses finite sets. It does not imply that P(t,g) and P(zeta t,g+h(t)) agree up to a scalar, or that root multiplicities are transported.

For an explicit two-point cycle, take zeta=-1 and h(1)=1, h(-1)=-1, with

```math
P(1,g)=g^2(g-1),\qquad P(-1,g)=(g-1)(g-2)^2.
```

A single polynomial realizing these fibers is

```math
P(t,g)=\frac{1+t}{2}g^2(g-1)
       +\frac{1-t}{2}(g-1)(g-2)^2.
```

Its zero sets are {0,1} and {1,2}, so both skew inclusions hold. The means with multiplicity are 1/3 and 5/3. Their difference is 4/3, not the required translation 1. The unweighted means of the distinct roots do transform correctly. These shifts also occur in the m=1 Ryser construction at X=[-2], y=-2. Thus the multiplicity issue is present in the actual schema, not only an unrelated example.

Suppose additionally that the global g-degree of P is d and every root-of-unity fiber has that same degree. If polynomial invariance is imposed, or if those fibers are all squarefree, then the root mean is a rational cyclic primitive. Write

```math
P(t,g)=A(t)g^d+B(t)g^{d-1}+\text{lower powers},
\qquad q(t)=-\frac{B(t)}{dA(t)},
```

with A nonzero at every root of unity. Transport of roots with multiplicity gives q(zeta t)-q(t)=h(t) on that root set. For a circuit whose formal g-degree equals d, its highest two coefficients can be computed with O(s) gates: at addition gates retain the appropriate top two degree slots, and at multiplication gates use the product formulas for those two slots. This gives an ordinary small rational cyclic primitive, even if d is enormous. Such a complete certificate family again reduces to the finite Boolean/local-witness format and is excluded by the block theorem.

Without a suitable formal-degree bound, but still assuming that global and fiber degrees equal d, highest-coefficient extraction gives a border statement. Since the actual g-degree is d,

```math
\epsilon^d P(t,\epsilon^{-1})\longrightarrow A(t),
```

and

```math
\frac{\epsilon^{d-1}}2
 \big(P(t,\epsilon^{-1})-(-1)^dP(t,-\epsilon^{-1})\big)
\longrightarrow B(t).
```

These are small Laurent-circuit limits. They do not by themselves supply an ordinary exact cyclic-primitive circuit. No unproved conversion from border certificates to exact certificates is used here. For general zero-set invariance, extracting the mean of distinct roots additionally requires squarefree information, which the top two coefficients of P do not provide. If the global g-degree exceeds every root-of-unity fiber degree, the desired fiber coefficients are not the global leading coefficients either; the displayed leading-coefficient limits then do not extract them.

## 9. A collision that obstructs the direct root-copy argument

One possible way to remove the multiplicity restriction would be to expand all roots into separate local witnesses and apply a critical-point argument. A uniform neighborhood of a collision does not provide the regularity required by that argument. For example, perturb the fiber P_c(g)=g^2-c to

```math
g^2-c-\epsilon=0.
```

For every nonzero epsilon, the parameter c=-epsilon gives the repeated root g=0. Such parameter values lie in every fixed neighborhood of the original collision c=0 for all sufficiently small epsilon. If two root copies are included, their two residual gradients at this point agree: both have derivative -1 in c and derivative zero in their own root coordinate. A common perturbation does not give independent active gradients over that fixed neighborhood.

Perturbing the two copies by different offsets can restore independence, but then they solve different polynomials. This no longer certifies that all roots of one candidate fiber have been represented. The example refutes this particular regularity shortcut; it does not rule out a different moving-root critical-point argument.

## 10. Current status

Equations (2)–(3) give an actual fixed-prefix verifier, and Sections 3–4 prove its exact semantics with unrestricted certificate size. No polynomial certificate-size theorem is proved here. The displayed finite-orbit interpolation provides only an exponential certificate. Sections 6–7 exclude complete polynomial-size families with polynomially many distinct roots, squarefree fibers, preserved multiplicities, or proportional translated multiplicity vectors. The remaining case has superpolynomial distinct-root supports with multiplicity patterns outside these restrictions. No general impossibility claim is made for that case.

The imported root-of-unity construction and its explicit digit equations are in [TAGGED_TRACE_OBSTRUCTION.md](TAGGED_TRACE_OBSTRUCTION.md). The finite-witness obstruction used in Sections 6–7 is [BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md](BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md). The identity-family sampling proof is the one-variable case of [CONTINUOUS_NONDENSE_FIBER_SAMPLING.md](CONTINUOUS_NONDENSE_FIBER_SAMPLING.md). The independent review and the squarefree extension are recorded in [SKEW_PRODUCT_REVIEW.md](SKEW_PRODUCT_REVIEW.md). This note supplies a research direction with a precise remaining hypothesis; it does not establish permanent graph membership in PH_C, HN_C hardness, or Bürgisser's conjectural reverse implication. These are written arguments under the imported border lower bound, with no formal-verification or novelty claim.
