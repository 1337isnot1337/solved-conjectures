# Stable reduced Schett polynomials for plane and near-increasing trees

## Result and scope

Let (M={1^r,2,3,ldots,k}) with (r,kge1). For weakly increasing plane trees on (Mcup{0}), with root at level zero, let (e,o,b) be the numbers of even-outdegree nodes on even levels, even-outdegree nodes on odd levels, and odd-outdegree nodes, respectively. Then
[
 P_M(X,Y,Z)=sum_T X^{lfloor e(T)/2floor}
                     Y^{lfloor o(T)/2floor}
                     Z^{lfloor b(T)/2floor}
]
is real stable: it does not vanish when every variable has positive imaginary part. Consequently every nonzero slice ([X^i]P_M(X,t,1)) has only real nonpositive zeros. This proves [Lin–Ma, Conjecture 5.1](https://arxiv.org/pdf/2104.10539#page=28) for all plane trees, all strictly increasing trees, and the intervening family with arbitrary multiplicity of the least nonroot label and all later labels distinct. It does not settle arbitrary multisets.

## Reduction by parity

Put (n=|M|), the total number of edges. The sum of all outdegrees is (n), so (bequiv npmod2). Write (b_E,b_O) for the odd-degree counts on the two level parities. The number of odd-level nodes is the sum of outdegrees of the even-level nodes; thus (o+b_Oequiv b_Epmod2). Hence (oequiv npmod2); since (e+o+b=n+1), we have (eequiv n+1pmod2). For the unreduced generating polynomial (S_M(x,y,z)) this means
[
  S_M(x,y,z)=
 egin{cases}
  x,P_M(x^2,y^2,z^2), & n 	ext{even},\
  yz,P_M(x^2,y^2,z^2),& n 	ext{odd}.
 end{cases}
]

## Plane trees: a cycle-matching formula

Use (u) to mark edges, and let (A,B) be the series for plane trees whose root has even and odd level, respectively. The root with an even number of children has weight (x) or (y) according to its level; with an odd number, weight (z) in either case. Its children are an arbitrary ordered list of trees of the opposite root-level parity. Accordingly,
[
 A=rac{x+zuB}{1-u^2B^2},qquad B=rac{y+zuA}{1-u^2A^2}.
]
Setting (C=z+uAB) rewrites this as
[
 A=x+uBC,qquad B=y+uAC,qquad C=z+uAB. 	ag{1}
]
In particular (S_{{1^r}}=[u^r]A).

Let (w=uABC) and let (phi(v)) have constant term 1 and solve (phi(v)^2-phi(v)=v). Equation (1) gives
[
 A=xphi(w/x^2),quad B=yphi(w/y^2),quad C=zphi(w/z^2),
 qquad w=uxyz,phi(w/x^2)phi(w/y^2)phi(w/z^2).
]
These formal expressions can first be used over the field of rational functions in (x,y,z). For (rge1), univariate Lagrange inversion on the expression for (A) gives
[
 [u^r]A=rac{x(xyz)^r}{r(r+1)}
 [w^r]left(
 wrac{d}{dw}phi(w/x^2)^{r+1}
 ight)phi(w/y^2)^rphi(w/z^2)^r. 	ag{2}
]
Indeed the ordinary Lagrange coefficient uses the derivative of (phi(w/x^2)) times its (r)-th power; absorb that power into the derivative, then multiply by (w).

For integer (mge1), and (0le jlelfloor m/2floor), put
[
 b_{m,j}=[v^j]phi(v)^m=rac{m}{m-j}inom{m-j}{j}.
]
For (j>0) this follows by applying Lagrange inversion to (phi-1=v/(1+(phi-1))), giving ((m/j)inom{m-j-1}{j-1}); the constant coefficient is 1. Consequently, coefficients with (lfloor m/2floor<j<m) vanish. In (2) the (x)-associated factor has (m=r+1) and uses only (jle r). The other factors have (m=r), where (j=r) lies above the matching range but would force (j_x=0) and contribute zero because of the derivative. Thus all terms that contribute in (2) use the coefficients (b_{m,j}) in the displayed matching range.

The polynomial (L_m(v)=sum_{j=0}^{lfloor m/2floor}b_{m,j}v^j) has only strictly negative zeros when nonconstant. For (mge3) its coefficients count the matchings of a cycle on (m) vertices by size: split according to whether a fixed edge is present to obtain (inom{m-j}{j}+inom{m-j-1}{j-1}), which is the displayed formula. The matching polynomial theorem gives the assertion; for (m=1,2) use (1,1+2v) directly. Therefore
[
 B_m(U,s)=U^{lfloor m/2floor}L_m(s/U)
]
is real stable in ((U,s)), since it factors into linear factors (U+eta_
u s) with all (eta_
u>0).

After stripping the parity monomial from (2), the reduced polynomial is exactly
[
 P_{{1^r}}(X,Y,Z)=
 rac{1}{r(r+1)}
 [s^r]left(
   srac{partial}{partial s}B_{r+1}(X,s)
 ight)B_r(Y,s) B_r(Z,s). 	ag{3}
]
In fact every summand with indices (j_x+j_y+j_z=r) acquires the factor (j_x), and its respective exponents of (X,Y,Z) are (lfloor (r+1)/2floor-j_x,lfloor r/2floor-j_y,lfloor r/2floor-j_z). Partial differentiation preserves real stability or yields zero, as do multiplying by (s), multiplying stable polynomials, and taking ([s^r]) by differentiation and specialization (s=0). Polynomial (3) is nonzero because it enumerates the plane trees, so it is real stable. The no-edge polynomial (1) is stable as well.

## Adding a singleton largest label

A newly added largest label appearing once must be a leaf and, because siblings are ordered by nondecreasing label, the rightmost child of its parent. Each old vertex gives exactly one choice of insertion. Its weight changes by
[
 xlongmapsto yz,qquad ylongmapsto xz,qquad zlongmapsto xy:
]
a vertex counted in (e) or (o) becomes odd-degree and receives an even-degree leaf of the opposite level parity; an odd-degree vertex toggles to even degree and the two even-degree nodes are in opposite level parities.

Thus the update of (S_M) is the Dumont derivative (D=yzpartial_x+xzpartial_y+xypartial_z). Using the two parity forms gives the update of (P=P_M) by the indicated operator, with (
abla=partial_X+partial_Y+partial_Z):
[
 egin{cases}
 P+2X
abla P,&n 	ext{even},\
 (Y+Z)P+2YZ
abla P,&n 	ext{odd}.
 end{cases} 	ag{4}
]
Both preserve real stability. To see this directly, evaluate variables in the open upper half-plane. Stability implies that each ((partial_iP)/P) has imaginary part at most zero: fix the other variables, factor in the remaining variable, and sum the reciprocals of that variable minus each of its roots (all roots have imaginary part at most zero). The two expressions in (4) are respectively (XP[1/X+2
abla P/P]) and (YZP[1/Y+1/Z+2
abla P/P]). In both square brackets the imaginary part is strictly negative.

Start with (3) for the (r) copies of label 1 and apply (4) for labels (2,ldots,k) in order. This proves real stability of (P_M). Finally the operation ([X^i]) and real specialization (Z=1) preserve stability or give zero. A real stable univariate polynomial has only real roots by conjugation; nonnegative coefficients exclude positive roots.

## Sources and remaining scope

- [Lin–Ma, *A symmetry on weakly increasing trees and multiset Schett polynomials*](https://arxiv.org/pdf/2104.10539), JCTA 213 (2025), Conjecture 5.1, is the exact target. Their Theorem 3.1 gives the equivalent Dumont recurrence for all-distinct labels, and equations (3.10)–(3.11) are the plane-tree system for the case when the two odd-degree weights are identified. The new steps here are the stability reductions, not these enumerative recurrences. The authors report finite checks for plane and strictly increasing trees.
- [Zhang–Zhao, §5](https://arxiv.org/html/2610.00966v1) restates the full conjecture and explicitly distinguishes it from their multiset Eulerian–Narayana results. [Deb, §4](https://arxiv.org/html/2610.37931v1#S4) refers to it as a conjecture and concerns a different two-variable operator.
- [Lin–Liu–Yan, *Parity statistics on restricted permutations and the Catalan–Schett polynomials*](https://arxiv.org/html/2409.01558v1) proves related equidistributions and generating functions, not the above stability statement. [Alexandersson's Oct. 29 literature report](https://github.com/PerAlexandersson/RealRooted/issues/1077) also explicitly lists the plane and strictly increasing specializations as directions to pursue. No earlier proof of the exact result was found in these checked sources; this is not a blanket priority claim.
- The common substitution (1) also handles a block of repeated *largest* labels attached to a general earlier tree: for each old vertex append a forest of largest-label trees after its old children, and sum over new degree parity. An odd-outdegree old vertex gets the same factor (C=z+uAB) for either level parity. Thus replacing a single maximal-label insertion by a block of size (m) amounts to ([u^m]S_M(A,B,C)). Stability of this block operator on the actual incoming (S_M) is not established here. The specific proof of (3) uses the base monomial (x), and does not justify arbitrary iterations of the block formula.
- [Repository issue #102 and checkpoint 03fc516](https://github.com/1337isnot1337/solved-conjectures/blob/03fc516f4025a349599fee73d87d6ac5a2ed1f10/research/lin-ma-schett/README.md) independently already established the three-variable substitution, the singleton stability argument (4), the all-distinct-label result, and an explicit arbitrary-block formula by multivariate Lagrange inversion. It also identified a nonstable unrestricted two-copy differential symbol. The genuinely supplemental result here is formula (3) as a coefficient extraction from real-stable cycle-matching polynomials, showing stability after an arbitrary initial block and hence all the multisets ((r,1,ldots,1)). The prior checkpoint did not make that deduction.
