# Erdős–Hajnal local triangle conjecture

**The Hermitian spindle obstruction holds over all sufficiently large prime fields.** The earlier [subfield proof](HERMITIAN-SPINDLE-OBSTRUCTION.md) used an explicit frame over F₉, so it did not cover the prime values of q actually used in the last stage of the Mattheus–Verstraëte proof. Here is a rational one-parameter frame that works over F_{q²} for all q of sufficiently large characteristic. It makes the same second-moment and disjoint-packing bounds apply, in particular for every sufficiently large odd prime q.

This is an obstruction to the standard random construction, not a solution of [Erdős #813](https://www.erdosproblems.com/813).

## A rational frame with a movable norm-one parameter

Work with the Hermitian form |x|²+|y|²−|z|². Over F_{q²} this is equivalent to the all-positive diagonal form, since the norm onto F_q is surjective. In the affine chart z=1 put a=12/13, b=5/13, so a²+b²=1. Use secants u:x=0 and v:y=bx/a. Let λ have norm one. Form the two core lines
- A through P₁=(0,1,1) on u and Q₁=(a,b,1) on v;
- B through P₂=(0,−λ,1) on u and Q₂=(aλ,bλ,1) on v.

Their intersection has affine coordinates (a t, 1+(b−1)t), where t=(1+λ)/2. For norm-one λ, |t|²=Re t, with Re denoting half the sum of a field element and its conjugate. The norm of the affine pair is
```math
a^2|t|^2+|1+(b-1)t|^2
=1+2(1-b)(|t|^2-\Re t)=1.
```
Thus A and B meet at a unital point R. The lines u,v,A,B form the first desired diamond, with apex u and tip v.

Let T fix x and act on (y,z) by the real rational matrix
```math
\frac{1}{1-b^2}
\begin{pmatrix}-(1+b^2)&2b\\-2b&1+b^2\end{pmatrix}.
```
It is an involutory isometry fixing the direction (b,1) and negating (1,b). In particular it fixes Q₁ and maps u to itself. Set w=T(v), C=T(A), D=T(B). These give a second diamond through u. The lines v,w meet at Q₁, so the edges required for the two diamonds and the tip edge vw form the spindle.

## Verifying genericity over finite fields

Treat the construction first over Q(i), with λ=i. The points at the eleven required edges are P₁,P₂,Q₁,Q₂,R,TP₁,TP₂,Q₁,TQ₂,TR,Q₁ in the edge order uA,uB,vA,vB,AB,uC,uD,wC,wD,CD,vw. Apart from the three Q₁ occurrences, all these points are distinct. For a compact arithmetic check, normalize points with x=0 by y=1, and normalize the others by x=1. On u the four z-coordinates are
```
1, i, −1, (6305−2592i)/6817.
```
Off u the y-coordinates for Q₁,Q₂,R,TQ₂,TR are
```
5/12, 5/12, (5−13i)/12, (−485−845i)/864, 5/12+13i/27.
```
The Q₁,Q₂ pair, which has equal y-coordinate, has distinct z-coordinates 13/12 and −13i/12. At Q₁ the three required edges form the path A–v–w–C, so the three random bipartition constraints there are independent fair constraints; all the other required edges have their own pencil. Therefore all eleven edges survive with probability 2⁻¹¹.

The seven lines are distinct. The four core lines intersect u in its four different listed unital points. Neither v nor w can be a core line because its intersection with u is not a unital point: v meets u at (0,0,1) and w at its isometric image. To check that the whole pattern has a projective frame, take coefficient vectors u=(1,0,0), v=(b,−a,0), w=Tᵀv and take the coefficient vector B given by P₂×Q₂. At λ=i, the basis [u v w] has determinant 10/13 and the three coordinates of B in this basis are −1−i, 97/65−i, 72/65. All are nonzero, so u,v,w,B form a projective frame.

Each needed inequality is witnessed by the nonzero value at i of a polynomial in λ with rational coefficients, after clearing constant denominators. For projective comparisons use an appropriate nonzero minor; for the frame use the basis determinant and coordinates obtained by replacing one basis column. There are only finitely many such nonzero polynomials. After excluding finitely many prime characteristics, each remains a nonzero polynomial of bounded degree. The norm-one group in F_{q²} has q+1 elements, so for all sufficiently large q it contains a λ avoiding every root. The Hermitian norm checks hold identically on that group. This supplies precisely the certified seven-line frame and incidence-splitting probability needed for the earlier proof, now without a characteristic-three or subfield restriction.

The projective unitary overlap estimates in the [earlier note](HERMITIAN-SPINDLE-OBSTRUCTION.md) are independent of the coordinates and transfer with identical exponents. Hence a spindle survives with high probability for p≥q^(−8/7+ε), and at p=(log q)²/q there are at least q^(1−η) vertex-disjoint spindles with high probability for each fixed η>0. In particular the prime-field step of the [Mattheus–Verstraëte construction](https://doi.org/10.4007/annals.2024.199.2.8) usually cannot be made spindle-free by bounded vertex cleanup.
