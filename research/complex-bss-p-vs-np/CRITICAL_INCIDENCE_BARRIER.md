# A critical-incidence obstruction to all small Boolean potentials

Status: the proof below has received independent adversarial reviews from the graph-hardness and incidence-route agents. Its final arithmetic conclusion uses the separately reviewed singular-witness Taylor-jet lemma and the pinned permanent border lower bound. No Lean verification or novelty claim is made. This is a lower bound for the proposed certificate scheme, not a proof that P_C differs from NP_C.

## 1. The certificate-size hypothesis being tested

Let X be an m by m numerical complex matrix. Define

```math
K_X(b)=\prod_{j=1}^m(2b_j-1)
       \prod_{i=1}^m\left(\sum_{j=1}^mX_{ij}b_j\right),
\qquad
\delta_0(b)=\prod_{j=1}^m(1-b_j).
```

For each coordinate i, T_i flips that Boolean coordinate. The proposed certificate consists of division-free arithmetic circuits for Q_1,...,Q_m such that

```math
K_X(b)-y\delta_0(b)
=\sum_{i=1}^m\bigl(Q_i(b)-Q_i(T_i b)\bigr)
\qquad\text{for every }b\in\{0,1\}^m.                 \tag{1}
```

The disputed hypothesis is the existence of one polynomial s(m) bounding the total circuit size of such certificates for every true numerical instance y=per_m(X). Circuit topology and all complex constants may depend arbitrarily on the numerical instance. No efficient constructor, rational dependence on X, or bounded degree in the circuit parameters is assumed.

**Conclusion.** This hypothesis would imply polynomial border circuit complexity of the permanent. Hence it is incompatible with the imported permanent border lower bound, subject to the reviewed singular-witness lemma. In particular the nonlinear dependence of circuit outputs on their parameters does not preserve this certificate scheme as a remaining route.

The proof does not replace exponentially many Boolean equations by a small subset defining the same variety. That replacement would be invalid in general. Instead it constructs a different small critical-value incidence whose every projected component has codimension at least one.

## 2. One polynomial-size universal circuit template

Suppose the size bound s(m) exists. Pad each certificate to this size. A universal division-free template of polynomial size represents all such multi-output circuits.

For completeness, one suitable template has s(m) stages. Each stage forms three affine linear combinations of b and earlier stage outputs and returns the product of the first two combinations plus the third. Their scalar coefficients are free parameters. Suitable choices simulate addition, subtraction, multiplication, and constant gates. Output polynomials are affine combinations of inputs and stage outputs. This uses

```math
p=O((s(m)+m)^2)
```

parameters c and a polynomial number of gates. It represents every required certificate, and every parameter specialization still produces valid polynomial circuits. It may represent additional circuits; soundness of (1) holds for those as well.

Write its outputs as Q_i(c;b). For each fixed Boolean point b define

```math
E_b(X,y,c)=K_X(b)-y\delta_0(b)
 -\sum_{i=1}^m\bigl(Q_i(c;b)-Q_i(c;T_i b)\bigr).       \tag{2}
```

Each E_b has a division-free circuit of size L polynomial in m+s(m). A safe bound is O(m^2+mU), where U is the universal template size: at most m+1 differently substituted copies of the template suffice. No bound polynomial in m is asserted for the degree in c; it can be exponential.

For every parameter specialization c, summing (2) over the cube gives the polynomial identity

```math
\sum_{b\in\{0,1\}^m}E_b(X,y,c)
=\mathop{\mathrm{per}}_m(X)-y.                           \tag{3}
```

Each flip permutes the cube, so the potential terms cancel. Ryser's identity supplies the remaining sum. The identity is mathematical; the proof never computes its exponentially long left-hand side by a circuit.

## 3. A dense component of the full constraint variety

Put n=m^2, so x denotes all entries of X. Let

```math
V=\{(x,y,c):E_b(x,y,c)=0\text{ for all }b\in\{0,1\}^m\}.
```

This variety is defined using all the Boolean equations. It is used for the existence argument, without any assertion that this entire system is small.

Identity (3) implies that the projected image of V is contained in the permanent graph G. The hypothesized certificate-size bound and universal template imply that every point of G has a lift to V. Thus the projected image is exactly G.

The graph is irreducible. The finitely many irreducible components of V have projected closures whose union is G. At least one component W therefore has projected closure equal to G. Let

```math
\mathbb K=\mathbb C(W)
```

be its function field. The component W can have positive-dimensional generic witness fibers and can be singular as a scheme defined by the displayed equations. Neither issue is assumed away.

## 4. Select a few gradients, not a defining subsystem

Differentiate (3) formally in the witness parameters c and the output coordinate y, before restricting to W. It gives

```math
\sum_b
\left(\frac{\partial E_b}{\partial c_1},\ldots,
      \frac{\partial E_b}{\partial c_p},
      \frac{\partial E_b}{\partial y}\right)
=(0,\ldots,0,-1).                                    \tag{4}
```

After restriction to the function field K, the constant vector on the right is in the span of these gradient rows. Linear algebra over K selects at most k<=p+1 Boolean points b^(1),...,b^(k) whose rows span that vector. Negating the resulting combination if necessary gives rational functions lambda_1,...,lambda_k on W satisfying

```math
\sum_{j=1}^k\lambda_j\frac{\partial E_{b^{(j)}}}{\partial c_a}=0
\quad(1\le a\le p),
\qquad
\sum_{j=1}^k\lambda_j\frac{\partial E_{b^{(j)}}}{\partial y}=1.
                                                               \tag{5}
```

No circuit bound for the rational functions lambda_j is needed. They will be existential coordinates of a new incidence. Their denominators are nonzero on a dense open subset of W, so their simultaneous rational lift is defined there.

The selected equations E_(b^(j))=0 need not isolate W, even locally. The proof uses only their gradient span, and makes no claim about such isolation.

## 5. The small critical incidence

Use independent coordinates lambda_1,...,lambda_k and define Gamma by

```math
\begin{aligned}
E_{b^{(j)}}(x,y,c)&=0 &&(1\le j\le k),\\
\sum_{j=1}^k\lambda_j\frac{\partial E_{b^{(j)}}}{\partial c_a}&=0
 &&(1\le a\le p),\\
\sum_{j=1}^k\lambda_j\frac{\partial E_{b^{(j)}}}{\partial y}&=1.
\end{aligned}                                                     \tag{6}
```

It has p+k witness coordinates in addition to x,y, and k+p+1 equations. Each of the k residual circuits has size at most L. Gatewise forward differentiation computes all its first partial derivatives in c,y using O((p+1)L) gates: maintain a value and its p+1 derivatives at every arithmetic gate and use the sum and product rules. Thus a safe shared circuit-size bound for (6) is

```math
O\bigl((p+1)^2L+(p+1)^2\bigr),
```

which is polynomial in m+s(m). The values b^(j) are fixed Boolean constants, of total length at most m(p+1). All constants used by the universal template and selected rows are permitted in the nonuniform arithmetic model.

The rational functions in (5) lift a dense open subset of W into Gamma. Its lifted closure is irreducible. Choose an irreducible component Z of Gamma containing that closure. The projected closure of Z in (x,y)-space contains G.

It remains to rule out a larger projected closure. This is the purpose of the critical equations.

## 6. Every projected component has dimension at most n

Let Z' be any irreducible component of Gamma, and work in its function field H=C(Z'). All equations E_(b^(j)) are zero in H, so their Kähler differentials over C are zero. Multiplying those differential identities by the coordinate functions lambda_j and adding gives

```math
\begin{aligned}
0
&=\sum_j\lambda_j\,dE_{b^{(j)}}\\
&=\sum_{i=1}^n
\left(\sum_j\lambda_j
       \frac{\partial E_{b^{(j)}}}{\partial x_i}\right)dx_i
 +dy.
\end{aligned}                                                     \tag{7}
```

The coefficients of dc_a vanish by (6), and the coefficient of dy equals one. There is no missing d(lambda_j) term: (7) is a linear combination of the identities dE_j=0. Equivalently, differentiating the products lambda_j E_j would give the same relation because E_j=0 in H.

Let L_0=C(x_1,...,x_n,y) be the subfield of H generated by the projected coordinates. In characteristic zero, the map

```math
\Omega_{L_0/\mathbb C}\otimes_{L_0}H
\longrightarrow\Omega_{H/\mathbb C}
```

is injective for finitely generated field extensions. One way to see the relevant consequence is to extend a transcendence basis of L_0 to a separating transcendence basis of H; the differentials of that basis remain linearly independent. Thus the dimension of the H-span of dx_1,...,dx_n,dy equals the transcendence degree of L_0 over C.

Here is a direct verification of the independence fact. A derivation which takes one element of a transcendence basis to one and all the others to zero is defined on its rational-function field. It extends across a finite separable algebraic extension: if alpha has minimal polynomial p, differentiating p(alpha)=0 defines D(alpha)=-(Dp)(alpha)/p'(alpha), and p'(alpha) is nonzero. These derivations show that the differentials of the basis elements are linearly independent even over H. In particular, if all n+1 projected coordinates were algebraically independent, their differentials would be independent, contradicting the coefficient one of dy in (7).

Relation (7) bounds that span by n. Therefore

```math
\dim\overline{\pi(Z')}
=\mathop{\mathrm{trdeg}}_{\mathbb C}L_0\le n.             \tag{8}
```

This argument applies to every reduced irreducible component, even if the defining system of Gamma is nonreduced or singular. It also follows from the generic differential rank of the projection in characteristic zero.

In particular the component Z selected in Section 5 has projected closure of dimension at most n. It contains the irreducible graph G, which has dimension n. Its projected closure is irreducible, so it must equal G.

## 7. Apply the singular-witness jet lemma

Gamma is a polynomial-size closed incidence, and Z is one of its actual irreducible components whose projected closure is the polynomial graph y=per_m(X). This is exactly the component hypothesis of `SINGULAR_WITNESS.md`. The lemma allows positive-dimensional witness fibers, arbitrary fixed complex constants, and singular or nonreduced defining equations.

The permanent has degree m. The lemma therefore gives

```math
\underline L(\mathop{\mathrm{per}}_m)
\le\mathop{\mathrm{poly}}(m+s(m)).                       \tag{9}
```

If s were a polynomial, (9) would contradict the imported permanent border lower bound. Consequently no polynomial bounds the total arithmetic-circuit size of Boolean divergence potentials for every true numerical permanent instance.

This lower bound concerns size existence itself. It does not depend on finding the coefficients efficiently. The earlier generic-branch constructor obstruction and bounded-parameter-degree template barriers are weaker special restrictions; neither is needed for the nonlinear case once the critical incidence is used.

### Quantitative consequence

Let s_*(m) be the largest, over numerical complex matrices X, of the minimum total circuit size of a certificate for the true instance (X,per_m(X)). This is finite: the unrestricted conditional-average construction gives an exponential-size upper bound independent of X. Since circuit sizes are integers in a finite bounded range, the largest attained minimum exists.

The argument above works separately at each m, with s(m)=s_*(m). All its overhead bounds are fixed polynomials. Hence there are absolute constants C_1,C_2 such that

```math
\underline L(\mathop{\mathrm{per}}_m)
\le C_1(m+s_*(m)+1)^{C_2}.
```

The pinned lower bound has the form exp(c(log m)^(4/3)) for all sufficiently large m, with a positive constant c. Combining the two bounds gives

```math
s_*(m)\ge\exp\bigl(\Omega((\log m)^{4/3})\bigr)
```

for all sufficiently large m. Thus for each sufficiently large dimension, some numerical matrix requires that many gates in every Boolean divergence certificate, even though arbitrary instance-dependent complex scalar constants are allowed. This is a certificate-size lower bound; it is not a separation of the BSS decision classes.

### Generic-matrix consequence

Fix m and a gate budget s. Let A_s be the set of matrices X for which the true instance (X,per_m(X)) has a certificate of total size at most s. The universal template gives an algebraic variety V_s defined by finitely many residual equations. Its projected image in (X,y)-space is constructible by [Chevalley's theorem, Stacks tag 054K](https://stacks.math.columbia.edu/tag/054K), and lies in G by (3). The projection G to matrix space is an algebraic isomorphism. Consequently A_s is constructible.

If A_s were Zariski dense, one irreducible component of V_s would have projected closure G. Sections 4–7 would then give

```math
\underline L(\mathop{\mathrm{per}}_m)
\le C_1(m+s+1)^{C_2},
```

with the same absolute constants as above. Whenever the imported lower bound exceeds this quantity, A_s therefore has a proper Zariski closure. Its complement is a nonempty Zariski-open set of matrices on which every certificate needs more than s gates. Choosing s=exp(c'(log m)^(4/3)) for a sufficiently small positive constant c' gives this statement for all sufficiently large m.

This is an existence statement for an open set. It does not provide an explicit defining equation for that set or an explicit hard numerical matrix. Restricted families, including the bounded-rank and block-diagonal examples in the other notes, can still have small certificates.

## 8. What the argument establishes and what it leaves open

The proposed Boolean-potential hypothesis would have supplied a uniform Sigma_2^C presentation of the permanent graph. The proof above shows that this particular hypothesis is incompatible with the imported lower bound. It therefore closes that route, rather than proving the hypothesis and deriving a BSS separation.

The argument uses a special conservation identity: the sum of all verification residuals is the graph polynomial, independently of the witness parameters. Its derivative supplies the normalized output covector in (4). An arbitrary universal predicate need not have this property. In particular this note does not eliminate all second-level formulas, all fixed levels of PH_C, or all nonconstructive certificate schemes.

The bounded-rank positive constructions and explicit small certificates for the block-diagonal zero-permanent gadgets remain valid. They cover restricted inputs. The conclusion is that no single polynomial size bound covers all numerical complex matrices.

There is also no use of a small Boolean hitting set. All Boolean equations are retained in the existence argument for W; only a few of their gradients are used in the new incidence. The critical equations, not an invalid claim about a small defining subsystem, control the projected dimension.

## 9. General form of the mechanism

The same proof applies to a low-degree polynomial f(x) and a finite family of polynomial residuals E_beta(x,y,c), each with a small circuit, whenever their common-zero variety projects onto y=f(x) and

```math
\sum_\beta E_\beta(x,y,c)=f(x)-y.
```

The number of residuals may be exponential. The circuit bound depends polynomially on the number p of witness parameters, the maximum individual residual-circuit size, the input dimension, and deg f. More generally, the gradient selection works whenever the graph equation belongs to the ideal generated by the residuals: differentiating an ideal-membership expression and restricting to their common zeros eliminates the terms containing the residuals themselves. No efficient expression for the ideal-membership coefficients is required by this existence argument.

Membership only in the radical of that ideal does not give the same conclusion by this proof. A positive power of the graph equation can have zero differential on the graph. That distinction is one reason the argument cannot be applied indiscriminately to arbitrary quantified formulas.
