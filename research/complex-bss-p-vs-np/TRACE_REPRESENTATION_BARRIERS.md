# Dimension obstructions for trace and quotient-algebra encodings

Status: elementary proved obstructions to two specified matrix encodings. They do not exclude arbitrary Boolean divergence certificates. They explain why replacing the exponential Boolean function algebra by a polynomial-dimensional matrix algebra is not a free compression step.

The later `CRITICAL_INCIDENCE_BARRIER.md` addresses unrestricted potential-size existence by a different argument. The elementary matrix lemmas below retain their narrower stated scope.

## 1. A trace representation of all Boolean sums is exponential

Let

```math
B_m=\mathbb C[b_1,\ldots,b_m]/(b_1^2-b_1,\ldots,b_m^2-b_m).
```

This is the algebra of complex functions on the Boolean cube. For each Boolean point c, its delta polynomial delta_c is an idempotent. These 2^m idempotents are nonzero, pairwise orthogonal, and sum to one.

Suppose rho is a unital algebra homomorphism from B_m to D by D complex matrices, and ell is any linear functional on those matrices satisfying

```math
\ell(\rho(F))=\sum_{b\in\{0,1\}^m}F(b)
\qquad\text{for every }F\in B_m.                           \tag{1}
```

Then D is at least 2^m. In particular the conclusion applies when ell is a scalar multiple of the ordinary trace, or a weighted trace.

**Proof.** For every c, equation (1) gives ell(rho(delta_c))=1, so rho(delta_c) is a nonzero idempotent. Their images as linear operators are nonzero subspaces in direct sum. Indeed, applying rho(delta_c) to a relation between vectors in these images isolates the vector from that c, because the idempotents are orthogonal. There are 2^m such subspaces in a D-dimensional vector space, each of dimension at least one. Hence D>=2^m. ∎

This obstruction also applies to an encoding which starts from m commuting idempotent matrices E_i and evaluates a polynomial by substituting b_i=E_i. Such a substitution is precisely a representation rho of B_m.

The ordinary trace of a commutator AB-BA is zero. This suggests turning a zero-sum condition into a matrix commutator certificate. If the matrix encoding implements Boolean sums through (1), however, the required matrix dimension is already exponential before the commutator witnesses are introduced. The trace identity itself does not shrink that representation.

## 2. Correctness just on all Ryser kernels almost gives the same bound

The preceding lemma is not merely using an unrelated family of Boolean functions. The Ryser kernels K_X, as X varies over m by m matrices, linearly span every Boolean function vanishing at the zero point.

To see this, let S be a nonempty subset of the coordinate set, and choose one j in S. A matrix with rows equal to coordinate unit vectors can make its product of row forms equal to

```math
b_j^{\,m-|S|+1}\prod_{i\in S\setminus\{j\}}b_i.
```

On the cube this is the monomial b_S. Its Ryser kernel is therefore the full sign character times b_S. The monomials b_S for nonempty S form a basis of the functions vanishing at zero. Multiplication by the full sign character is an invertible diagonal operation on cube values and preserves that subspace. This proves the span assertion.

Consequently, if (1) is required only for every Ryser kernel, the images of delta_c must still be nonzero for all c other than zero, and D>=2^m-1. Requiring correctness also for delta_0 gives D>=2^m.

The residual used by the Boolean-potential proposal is K_X-y delta_0. Even the weaker demand

```math
\ell(\rho(K_X-y\delta_0))=0
\quad\Longleftrightarrow\quad
y=\mathop{\mathrm{per}}(X)
\qquad\text{for every }X,y                              \tag{2}
```

forces the same lower bound. At X=0, condition (2) says that ell(rho(delta_0)) is nonzero. Let this value be alpha. For each X, the unique zero in y of the left-hand affine-linear expression must be y=per(X), so ell(rho(K_X))=alpha per(X). Dividing ell by alpha gives the exact sum functional on all kernels and on delta_0. Their span is all of B_m, so Section 1 applies.

The representation rho and functional ell are fixed for each m in this statement. If they depend arbitrarily on the numeric instance, these linear-span deductions do not apply. Such dependence needs its own small witness equations and soundness proof; it cannot be hidden inside the trace notation.

## 3. A square-zero representation that detects the top product is exponential

The square-zero algebra

```math
A_m=\mathbb C[z_1,\ldots,z_m]/(z_1^2,\ldots,z_m^2)
```

encodes the permanent as the coefficient of z_1...z_m in a product of linear forms. A natural matrix encoding would use commuting matrices T_1,...,T_m with T_i squared equal to zero and with T_1...T_m nonzero, so that the top product is not lost.

Any such matrices have dimension at least 2^m.

**Proof.** Choose a vector v with T_1...T_m v nonzero. For a subset S, write T_S for the product of T_i over S. Suppose

```math
\sum_{S\subseteq[m]}a_S T_Sv=0
```

is a nontrivial relation. Choose an inclusion-minimal S with a_S nonzero, and multiply the relation by T_(S-complement). Every term indexed by a set not contained in S vanishes, because at least one matrix is then squared. Every term indexed by a proper subset of S has coefficient zero by minimality. The remaining term is

```math
a_S T_1\cdots T_mv=0,
```

contradicting the choice of v. Hence the 2^m vectors T_Sv are linearly independent. ∎

The conclusion does not assume that the full representation of A_m is faithful. Preserving one nonzero top product already forces the dimension bound.

## 4. Scope for the active construction problem

These arguments rule out two explicit compressions: a polynomial-dimensional homomorphic Boolean-algebra representation that turns every permanent residual's sum into a trace condition, and a polynomial-dimensional commuting square-zero representation retaining the top coefficient. They do not rule out a different nonhomomorphic encoding, instance-dependent witnesses, or the nonunique Boolean potentials themselves.

Any alternative matrix proposal must therefore provide its actual equations, explain how they recover the weighted sum for arbitrary complex entries, and account for the represented matrix dimension. A single matrix symbol does not make an exponential representation polynomial in the input size.
