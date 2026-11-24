# Review of directional cofactor logarithmic jets

Reviewed file: [DIRECTIONAL_COFACTOR_LOG_JETS.md](DIRECTIONAL_COFACTOR_LOG_JETS.md).

The full written proof passes this independent review. Its conclusion remains conditional on the separately reviewed finite-branch jet lemma and the imported permanent border lower bound. It restricts the directional squarefree cofactor degree of a hypothetical small multiple; it does not bound that degree for arbitrary cofactors or prove a BSS separation.

## 1. Actual hypersurface components

Every distinct z-root of Q over C(Y) belongs to an irreducible factor of Q in C(Y)[z]. Clearing content and using Gauss's lemma gives a z-dependent irreducible polynomial factor of P in C[Y,z]. Its hypersurface is an actual component of P=0, has dimension M, and dominates Y-space. It therefore meets the finite-branch hypothesis, rather than merely being an arbitrary subvariety of a larger component.

Leading-coefficient and squarefree discriminant conditions yield local holomorphic root branches at a generic Y-center. There are finitely many branches, so their permissible generic-center conditions can be intersected. Nonreduced multiplicities of P do not invalidate this application; the perturbation step in SINGULAR_WITNESS was proved specifically to handle them.

## 2. Logarithmic identity and complexity

Over an algebraic closure of C(Y),

```math
Q=a(Y)\prod_j(z-r_j(Y))^{m_j}
```

implies

```math
R_z/R=(P_z/P-\sum_j m_j/(z-r_j))/e.
```

The derivative in z removes the content a(Y). The identity remains true even if Q and R share a z-factor; e need not be the maximal multiplicity for this algebraic calculation.

At a point with P nonzero, all denominators have nonzero constant terms. A single-variable forward derivative of the P circuit has O(L) size. Substituting scaled variables and truncating a circuit modulo t^(D+1) costs a polynomial in D and the original circuit size, independently of its total degree.

The finite-branch lemma with one witness gives the stated O(M+(L+1)(D+1)^3 log(D+2)) root-jet bound. Applying a truncated inverse to each such jet incurs an additional O((D+1)^2) circuit factor and polynomial overhead. Summing the delta terms gives a bound of the form C(delta+1)(L+M+1)(D+1)^7; seven is a safe coarse exponent.

## 3. Border inputs and moving centers

The inverse-jet operation can be written as a finite geometric series normalized by the fixed nonzero scalar c_b-r_j(b), followed by degree-D truncation. It is a polynomial map on the finitely many jet coefficients. Consequently simultaneous ordinary approximants to the root jets give convergent output jets. The approximants need not satisfy P=0 or have an exactly correct constant term.

Permissible generic points (b,c_b) can approach any target (a,c) with R(a,c) nonzero. A fixed neighborhood of the target is a holomorphic domain for the combined rational function R_z/R. Thus the degree-D Taylor polynomials of that combined function converge coefficientwise at the moving centers.

Individual summands in the logarithmic identity may diverge if Q(a,c)=0; this does not affect the argument. Their sum is the jet of the holomorphic target at every chosen center, and its circuit-size bound is uniform. Closure of the bounded border class gives the target-center jet. No common root-branch neighborhood across all moving centers is required.

## 4. Tagged logarithmic extraction

Subject to the recorded BCJS grid facts, the character argument is exact. Tagged character one forces degree at least D, and at degree D all triangle counts equal one. Character two forces degree at least 2D.

In a product of at least two positive-degree terms from P_grid-1, a character-one factor already contributes degree D and another positive degree makes the total larger than D. If there is no character-one factor but the product has character one, at least two factors have character two; the total degree is at least 4D. Therefore the character-one part through degree D of log(P_grid) equals that of P_grid itself.

The tagged Euler operator multiplies the degree-D terms by the tagged count, which is exactly one. The root-of-unity filter commutes with that grading. This proves the stated extraction identity without confusing the tagged direction with a full homogeneous equation-block Euler derivative.

## 5. Full-space substitution and quantitative consequence

Scaling the bounded set S of triangle coefficient coordinates preserves the small size of P(T_z a). The substituted cofactor is nonzero, since T_z is invertible for nonzero z. Its directional squarefree degree counts all distinct roots, including zero, while factors independent of z contribute no logarithmic term.

The target center (a_0,1) satisfies R(T_1 a_0)=1 even if the unknown cofactor vanishes there. The preceding moving-center argument therefore applies. Taking the full coefficient-space Taylor jet before restricting to the grid and then setting z=1 produces the correct grid jet without requiring the multiple to remain nonzero after specialization.

With D polynomial in N and M=O(N^3), the extracted border size is polynomial in N times (L(P_N)+1)(delta_S(Q_N)+1). The largest allowed m with 5m^2<=N satisfies m=Theta(sqrt(N)); the permanent border lower bound therefore yields the stated exp(Omega((log N)^(4/3))) product lower bound after absorbing polynomial factors.

No bound on delta_S(Q_N) is obtained for an unrestricted cofactor. The homogeneous-tagged-cofactor example has at most one directional root, but arbitrary short circuits can have exponentially many distinct roots under scaling. The note states this limitation correctly.
