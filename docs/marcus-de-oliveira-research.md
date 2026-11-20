# Marcus–de Oliveira conjecture: source audit and unrestricted route

20 November 2026. No proof or counterexample claimed. GitHub issue searches for Marcus and Oliveira in 1337isnot1337/solved-conjectures returned no matches before starting this lane.

## Statement

For all complex normal n-by-n matrices A and B, with eigenvalues a_i and b_i, respectively,

    det(A+B) belongs to conv{ product_i(a_i+b_sigma(i)) : sigma in S_n }.

The target is the unrestricted named conjecture, not a fixed matrix size.

## Status and scope audit

- Bebiano–da Providência, *Revisiting the Marcus–de Oliveira Conjecture*, Mathematics 13(5),711 (2025), https://doi.org/10.3390/math13050711. Primary survey inspected, including the known cases, unitary-orbit formulation, and its references.
- Mulero-Martínez, *A variational framework for determinantal inequalities of normal matrices: Successes and obstructions*, Linear Algebra and its Applications740 (2026),19–38, https://doi.org/10.1016/j.laa.2026.03.019. Publisher abstract explicitly retains the general normal-matrix problem; proves structured cases and warns that support-functional maximizers need not be monomial. Full text not accessible in this audit.
- Kovačec, *A conjecture more precise and stronger than the one by Marcus and de Oliveira*, DMUC26-11,7 April2026, https://www.mat.uc.pt/preprints/ps/p2611.pdf. This proposes a different, stronger polygonal containment assertion. Its reported refutation does not refute the original convex-hull conjecture.
- Recent primary preprint *Numerical evidence for the almost Hadamard conjecture*, https://hexagonmath.org/pdf/2611.00632v1, posted19 November2026, explicitly discusses MOC as still unsettled. This is corroborative status evidence, not a proof of absence of unpublished solutions.
- Searches included Marcus de Oliveira conjecture2026 proof, determinant counterexample, strengthened conjecture, Householder, and rank-one unitary perturbations. No full resolution of the original assertion was found. Several unrelated or stronger assertions must not be conflated with it.

## Known-route exclusions

The all-compound Birkhoff-coupling assertion of Merikoski–Virtanen is stronger and has counterexamples (Drury1992); it cannot simply be assumed.

The Householder route is already known in all orders, despite a narrowed statement in the2025 survey. The original Drury paper's abstract and the explicit Corollary3 quoted in Huang's2019 survey give convex containment for rank-two Z and a Householder U using identity, transposition, and three-cycle permutation points. Here Z_ij=a_i+b_j has rank at most2. Do not claim this route as new. Sources:
- Drury, *OMC for Householder reflections*, LAA298 (1999),159–169, https://doi.org/10.1016/S0024-3795(99)00173-1.
- Huang, *A Survey of the Marcus–de Oliveira Conjecture*, Springer Proceedings in Mathematics and Statistics277 (2019),169–181, §2.3, https://www.researchgate.net/publication/331388585_A_Survey_of_the_Marcus-de_Oliveira_Conjecture . Author manuscript inspected through indexed full text.

## Exact signed Householder identity (rederived, not new)

Here A=diag(a_1,...,a_n) and B=diag(b_1,...,b_n). Let H=I−2vv*, ||v||=1, p_i=|v_i|². Put z_id=product_i(a_i+b_i), and let z_(ij) be the point for the transposition(i,j). Then

    det(A+HBH*) = (2 sum_i p_i²−1) z_id + 4 sum_{i<j}p_i p_j z_(ij).

The coefficients sum to1, but the identity coefficient may be negative. This is why the displayed expansion alone is not a convexity proof. Drury's theorem supplies a valid argument using additional permutation points.

Derivation: expand the determinant in squared minors of H. A minor vanishes when its row and column sets differ by more than one index; diagonal minors have determinant1−2 sum_{i in I}p_i, and one-index-exchange minors have squared modulus4p_i p_j. The same minor coefficients are obtained from the signed permutation combination above. This also shows why replacing arbitrary unitary compound minors with a single ordinary Birkhoff decomposition would be an unsupported step.

## Unrestricted variational route under investigation

Write C=A+B', B'=UBU*, and z=det C, with C invertible. For skew-Hermitian K, vary B'(t)=exp(tK)B'exp(−tK). The derivative of det C(t) is

    z tr([B',C^{-1}] K).

At a maximizer of Re(exp(−i theta)det C), the matrix

    exp(−i theta) z [B',C^{-1}]

must be Hermitian (and has trace0). This is only a necessary condition. The July2026 source explicitly warns against concluding monomiality from such stationarity. A valid global argument would need to classify all supporting extrema or show a deformation to a permutation point without decreasing the support functional. Neither step has been proved here.

## Exact rank-one phase variation

A non-infinitesimal reduction avoids assuming that stationarity alone forces commutation. Fix a unit vector w and let

    V(u)=I+(u−1)ww*,   |u|=1.

For arbitrary A,B (normality not needed for this identity), put C=A+B, D=C^{-1}, z=det C, and

    a=w*DAw, b=w*Dw, c=w*BDAw, d=w*BDw,
    s=a+d, t=ad−bc.

The rank-two determinant lemma gives exactly

    det(A+V(u)BV(u)*)
       = z [ t u + (s−2t) + (1−s+t) u^{-1} ].

Indeed multiply the matrix inside the determinant on the right by V(u). The resulting matrix is C+(u−1)(Aww*+ww*B), whose determinant is z[1+(u−1)s+(u−1)²t]; det V(u)=u. This proves the displayed identity.

Thus every rank-one phase orbit has an elliptical (possibly degenerate) determinant image. If u=1 is a maximizer of the real support functional with angle theta, the following two conditions hold for every unit w:

    Im(exp(−i theta) z (s−1))=0,
    Re(exp(−i theta) z (1−s+2t))>=0.

They are also sufficient for maximality along this particular phase circle: a real first-harmonic trigonometric polynomial attains its maximum at1 exactly when its sine coefficient vanishes and its cosine coefficient is nonnegative.

The first condition recovers Hermitianity of exp(−i theta)z[B,D]. The second is a real quartic inequality in w and its conjugate. When B is normal, at eigenvectors of B the variation commutes with B, so the entire circle is constant and the quartic vanishes. This creates a concrete global obstruction problem: characterize normal A,B for which these quartic inequalities hold at every w, without falsely concluding from first-order stationarity that A and B commute.

No such classification has been obtained. These identities are rederived research tools, not asserted new results or a solution of MOC.

## Compression-induction obstruction

A further primary source is Shitov, *A further sufficient condition for the determinantal conjecture*, Izvestiya: Mathematics89(4) (2025),862–869, https://doi.org/10.4213/im9292e. Full HTML proof inspected at https://www.mathnet.ru/php/archive.phtml?jrnid=im&option_lang=eng&paperid=9292&wshow=paper . Its induction keeps one matrix Hermitian and uses interlacing after compression. It does not give unrestricted normal-matrix induction.

The normality issue is substantive, not a technicality. Consider the compression of diag(0,1,i) to the orthonormal columns (1,1,0)/sqrt2 and (1,−1,2)/sqrt6. The resulting matrix is

    T = [[1/2, −1/sqrt12], [−1/sqrt12, 1/6+2i/3]].

It is not normal. Write its diagonal entries a,d and off-diagonal entry x. With B=diag(1,−1), the two products formed from the eigenvalues of T and B have midpoint det(T)−1 and half-difference sqrt((a−d)²+4x²). But det(T+B) differs from that midpoint by d−a. Here

    (a−d)² / ((a−d)²+4x²) = 1−3i/4,

which is not real. Thus the determinant does not even lie on the line through those two products, let alone their segment. A normal-matrix compression cannot be treated as normal merely by retaining its eigenvalues. This blocks the naive extension of Shitov's induction to arbitrary normal A. It does not refute MOC: T itself is not normal.

A possible stronger induction would retain the full normal dilation data and use an injective-matching hull from the original spectrum. Proving that stronger compression statement is a new obligation, not something supplied by ordinary eigenvalue interlacing.

### Retaining the dilation is equivalent to the original difficulty

For an n-by-m isometry V and arbitrary complex a_1,...,a_n and beta_1,...,beta_m, consider the assertion

    det(V*diag(a)V + diag(beta))
      belongs to conv{ product_{i=1}^m(a_{phi(i)}+beta_i): phi injective }.

The unrestricted family of these assertions is equivalent to MOC. One direction takes m=n. For the other, complete V to a unitary matrix R, apply MOC to R*diag(a)R and diag(beta_1,...,beta_m,t,...,t), divide by t^(n−m), and let positive real t tend to infinity. The leading determinant coefficient is the displayed compressed determinant, and the finitely many permutation products converge to the injective-matching products. Convex hulls of a fixed finite collection vary continuously, proving the implication.

This equivalence prevents treating the injective-matching containment as an independently available induction lemma. It might still be a useful formulation, but invoking it without proof would assume the full target.

## Further global-extremum attempt: singular points and mixed directions

The phase-circle reduction extends to singular C without division. Put P=ww* and define the polynomial coefficients p_0,p_1,p_2 by

    det(C+x(AP+PB)) = p_0+p_1 x+p_2 x².

There are no higher powers because AP+PB has rank at most two. Multiplication on the right by V(u) gives, for every C including singular C,

    det(A+V(u)BV(u)*)
      = p_2 u+(p_1−2p_2)+(p_0−p_1+p_2)u^{-1}.

Thus the exact circle-maximality conditions at u=1 are

    Im(exp(−i theta)(p_1−p_0))=0,
    Re(exp(−i theta)(p_0−p_1+2p_2))>=0.

When C is invertible these reduce to the earlier conditions. This removes a singularity from the diagnostic, not the main global proof obligation.

For invertible C and a general skew-Hermitian K, write X=[K,B] and Y=[K,[K,B]]. Direct differentiation gives

    (d²/dt²) det(A+exp(tK)Bexp(−tK)) at t=0
      = z ((tr(DX))²−tr(DXDX)+tr(DY)).

At a supporting maximum its rotated real part must be nonpositive for every K. This tests mixed directions not supplied by separately checking the rank-one phase circles.

There is a concrete reason not to infer the full Hessian sign from its values on rank-one generators. In dimension three let X_0=diag(1,−1,0)/sqrt(2), let H_0=H−tr(H)I/3 for Hermitian H, and consider

    Q(H)=tr(H_0²)−(6/5)(tr(H_0 X_0))².

This quadratic form is invariant under H -> H+cI, as a conjugation Hessian must be. For every rank-one orthogonal projector P, tr(P_0²)=2/3 and |tr(P X_0)|<=1/sqrt(2), so Q(P)>=1/15. Yet Q(X_0)=−1/5. This example is not asserted to be realizable as the determinant Hessian of a normal pair. It establishes only that rank-one tests plus scalar invariance alone cannot justify the desired implication. Additional determinant-specific identities would be necessary.

A second attempted shortcut would factor any unitary into rank-one phase matrices and iterate the known Householder convex certificate. That certificate applies in an eigenbasis in which the two input spectra are diagonal before the rank-one conjugation. After one factor, the next factor does not in general act between those same diagonal representatives. No compatible convex certificate for successive factors has been established. Multiplying certificates as though the spectral bases stayed aligned would be invalid.

Finally, the 2026 source's statement that support maximizers need not be monomial does not state that no monomial maximizer exists. The distinction is essential: the latter would violate MOC itself whenever the non-monomial maximum strictly exceeds all permutation values. This notebook uses the source only to reject an inference that every maximizer is monomial, not to rule out choosing a suitable monomial maximizer.

Status after these attempts: the all-order conjecture is unresolved. We have exact necessary conditions, a singularity-free version of the phase reduction, and specific reasons why three proposed closures do not follow. No classification of the supporting extrema, global deformation, or new convex decomposition has been obtained.

For the Hessian sign at a maximum, use −Q in the abstract example: it is nonpositive on every rank-one projector but positive on X_0. Thus it demonstrates precisely the sign-inference gap relevant to maximization.

There is a known positive result for a single phase factor when A and B start diagonal. In that setting DA+BD=I, so s=1, and for u=exp(i phi) the identity reduces to

    det(A+V(u)BV(u)*)
      = cos²(phi/2) det(A+B)
        + sin²(phi/2) det(A+HBH*),

where H=I−2ww*. Consequently the known all-order Householder theorem implies MOC for one arbitrary rank-one phase factor as well. This is a consequence of an existing theorem, not a new special-case claim; it still does not provide the compatible iteration needed for general products.
