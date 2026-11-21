# Codegrees and the exact loop expansion in Ryser's design conjecture

Date: 20 November 2026 (America/Chicago).

These are structural calculations for the full C5 target. They are not a proof, a counterexample, or a finite-order extension. The expansion is a regular specialization of the established loop-calculus framework, not a priority claim.

Let A be a v by v zero-one matrix with line sum k>=2, and let G be its bipartite graph. Suppose design parameters are feasible, so lambda=k(k-1)/(v-1) is an integer. Write

```math
c_{ij}=(AA^{\mathsf T})_{ij}\quad(i\ne j),\qquad
E(A)=\frac12\sum_{i\lt j}(c_{ij}-\lambda)^2.
```


## Four- and six-cycle identities

Every pair of rows contributes binomial(c_ij,2) four-cycles. Since the sum of the codegrees is fixed,

```math
\boxed{C_4(G)=\binom v2\binom\lambda2+E(A).}
```

Thus E=0 is exactly the design condition, and every design minimizes the four-cycle count.

Put q=k-1, M=AA^T, and

```math
M_0=(k-\lambda)I+\lambda J,\qquad X=M-M_0.
```

Then X has zero diagonal and zero margins, and tr(X^2)=4E.

The standard nonbacktracking-walk recurrence gives

```math
6C_6(G)
=\mathop{\mathrm{tr}}M^3-6q\mathop{\mathrm{tr}}M^2
 +9q^2vk-2vq^3+v(k-2).
\tag{1}
```

For completeness, the adjacency matrix of G has eigenvalues in opposite pairs. If theta is one of its eigenvalues, the two corresponding nonbacktracking roots satisfy z^2-theta*z+q=0, and their sixth-power sum is theta^6-6q theta^4+9q^2 theta^2-2q^3. The additional roots +/-1 contribute 2v(k-2). A length-six cyclic nonbacktracking walk in a simple bipartite graph is a six-cycle, with twelve choices of starting directed edge. This yields (1).

All designs of these parameters therefore have the same six-cycle count. Subtracting their value from (1), and using X*1=0, gives

```math
\boxed{C_6(G)-C_6(\text{design})
=-2(k+\lambda-2)E(A)+\frac{\mathop{\mathrm{tr}}X^3}{6}.}
\tag{2}
```


Consequently an increase in four-cycles does not require an increase in six-cycles. A proof cannot simply declare every cycle count to be minimized by a design.

## Exact finite loop expansion

Define the regular Bethe factor

```math
B(v,k)=k^v\left(\frac{k-1}{k}\right)^{v(k-1)}
=\left(\frac{(k-1)^{k-1}}{k^{k-2}}\right)^v.
```

For an edge subset F of G, let d_F(x) be its degree at vertex x. Then

```math
\boxed{
\frac{\mathop{\mathrm{per}}A}{B(v,k)}
=\sum_{\substack{F\subseteq E(G)\\d_F(x)\ne1\ \forall x}}
\frac{\prod_{x:d_F(x)>0}(1-d_F(x))}
{(k-1)^{|F|}}.
}
\tag{3}
```

The empty subset contributes one.

Here is a direct derivation. Give each graph edge an independent Bernoulli variable with success probability p=1/k, and put r=1-p. The event that every vertex sees exactly one success is a perfect matching. Its probability is

```math
\mathop{\mathrm{per}}A\,p^v r^{vk-v}.
```

For a vertex x, normalize its exactly-one indicator by k*p*r^(k-1), and expand this normalized function in the orthonormal products of centered edge variables

```math
\xi_e=(X_e-p)/\sqrt{pr}.
```

For a specified incident subset of size d, its Fourier coefficient is

```math
(1-d)(-1)^d(p/r)^{d/2}.
```

Multiply over vertices and take expectations. A selected edge must appear at both endpoints, since E[xi_e]=0 and E[xi_e^2]=1. The d=1 coefficients vanish. The two endpoint signs cancel on each edge, leaving the product in (3). The normalization factor is precisely B(v,k).

## The comparison still missing

A simple cycle has positive weight in (3), but generalized loops need not. A K_{2,3} edge subset contributes

```math
-\frac4{(k-1)^6}.
```

Its two degree-three vertices contribute 4, and its three degree-two vertices contribute -1. Larger overlapping cycles also have mixed signs.

Thus (3) cannot be compared term by term using only the minimum four-cycle identity. A successful argument must control the full signed sum, or regroup its terms into quantities that admit a valid comparison. No such comparison has been established here.

Sources and the exact existential scope of the target are recorded in [the source audit](ryser_source_audit.md).
